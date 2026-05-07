
(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : scanner 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

EXPORT(mrusurcomscanner);
pragma C_include('mrusurcomscanner.pf');
pragma C_include('mrusurcomdecl.pf');
pragma C_include('mrusurcomwrite.pf');
pragma C_include('string.pf');
PROGRAM mrusurcomscanner;

WITH mrusurcomdecl,
     strng,
     mrusurcomwrite;

 procedure scanner(var if1:text;var rulenaam:string;
  var if2:pconnectionnode;var of1:text;var of2:text;var of3:text);
var line:string;
    j:integer;
    helpseen,stop,stop1,afterinit,headingwritten,beforeproceduralpart,beforeconditionsandactions:boolean;
    local,firstbracket:boolean;
    filename,filename1:string;    
procedure findrule(var if1:text;var rulenaam:string;var stop:boolean);
var line:string;
    matches,found:boolean;
    i:integer;
begin
found:=false;
while not(found) and not(eof(if1)) do
 begin
 readln(if1,line);
 addcounter;
 if STRING_length(line)>0 then
   begin
   if (line[1] = '%') then
   	begin
   	i:=0;
        STRING_extractend(rulenaam,line,2);
   	while i<>STRING_length(line)-1 do
   		begin
   		i:=i+1;
   		if line[i+1]<>' ' then rulenaam[i]:=line[i+1] else
                        STRING_extractbegin(rulenaam,rulenaam,
                                              STRING_length(rulenaam)-1);
   		end;
        found:=true
   	end
   end
 end;
if found then stop:=false else stop:=true
end;

procedure removerubbish(var line:string;var j:integer);
type ascii = 0..127;
var line2:string;
    ch:char;
    i:integer;
    rubbish:set of ascii;
    relevant:boolean;

begin
rubbish:= [0..32];
i:=0;
j:=0;
ch:=' ';
STRING_constantempty(line2);
while i <> STRING_length(line) do
{ch is last character written to line2}
   begin
   i:=i+1;
   relevant:=not(ord(line[i]) in rubbish);
   if relevant or (ch <> ' ') then
   {the character line[i] can be rubbish only if last written character 
    was not blank}
   	begin
        j:=j+1;
   	if not(relevant) then ch:=' ' else ch:=line[i];
        {if character is rubbish then a blank is to be written, else
         the relevant character itself}
        STRING_appendchar(line2,line2,ch);
        line2[j]:=ch
   	end
   end;
line:=line2
end;

procedure analyse(line:string;j:integer;var if2:pconnectionnode;
                                   var stop,beforeconditionsandactions:boolean);
{analyses line[1]..line[j-1] and appends its lexical structure to if2;
 stop becomes true if the line contains the end of the rule}
type 
     ptoken = ^token;
     plostoken = ^lostoken;
     setoftokens = record
   		   first,last:plostoken
   		   end;
     lostoken = record
   		   next:plostoken;
   		   arg:ptoken
   		end;
     token = record
   		knoop:psnode;
   		eerste:integer;
   		laatste:integer
   	     end;

var tokens1:setoftokens;
    token1,token2:ptoken;
    i:integer;
    string1:string;
{*procedures manipulating tokensets:*}

  procedure inittokenset(var S1:setoftokens);
  begin
  S1.first:=nil;
  S1.last:=nil
  end;

  function stilltokens(var S1:setoftokens):boolean;
  begin
  if (S1.first<>nil) or (S1.last<>nil) then stilltokens:=true
  else stilltokens:=false
  end;

  procedure appendtoken(token1:ptoken;var S1:setoftokens);
  var plostoken1:plostoken;
  begin
  if token1 <> nil then
     begin
     new(plostoken1);
     plostoken1^.arg:=token1;
     plostoken1^.next:=nil;
     if (S1.first=nil) and (S1.last=nil) then
   	begin
   	S1.first:=plostoken1;S1.last:=plostoken1
   	end
     else
   	begin
   	S1.last^.next:=plostoken1;
   	S1.last:=plostoken1
   	end
     end
  end;

  procedure taketoken(var token1:ptoken;var S1:setoftokens);
  begin
  if (S1.first = nil) and (S1.last = nil) then token1:=nil
  else
   	begin
   	token1:=S1.first^.arg;
   	if S1.first = S1.last then
   		begin
   		S1.first:=nil;S1.last:=nil
   		end
   	else
   		S1.first:=S1.first^.next
   	end
  end;
  {*end abstract data type tokenset*}

  function mktoken(stree1:psnode;eerste1,laatste1:integer):ptoken;
  var token1:ptoken;
  begin
  new(token1);
  with token1^ do
   	begin
   	knoop:=stree1;
   	eerste:=eerste1;
   	laatste:=laatste1
   	end;
  mktoken:=token1
  end;
  
  function mktokencat(cat1:syntcat):psnode;
  var stree1:psnode;
  begin
  new(stree1);
  stree1^.cat:=cat1;
  mktokencat:=stree1
  end;

  function mkcharstring(string1:string):psnode;
  var stree1:psnode;
  begin
  new(stree1);
  stree1^.cat:=charstring;
  new(stree1^.charstringfield);
  stree1^.charstringfield^.stringfield:=string1;
  stree1^.charstringfield^.linenumber:=linecounter;
  mkcharstring:=stree1
  end;

  procedure findtokens(var line:string;j:integer;var setoftokens1:setoftokens);

  {*finds "|",".","(",")",curlyopen,curlyclose,squareopen,squareclose,"/".
  fields eerste and laatste denote the position of the tokens, including
  spaces around it. The beginning and the end of the line are denoted
  by a token with knoop=nil and in effect remove spaces. 
  *}
  var tokenchars1,tokenchars2:set of char;
      i:integer;
      token1:ptoken;
      ok:boolean;

  begin
  tokenchars1:=['=' , '|' , '(' , ')' , '{' , '}' , '[' , ']' , '/' , '.'];  
  inittokenset(setoftokens1);
  if line[1]=' ' then token1:=mktoken(nil,0,1)
  else token1:=mktoken(nil,0,0);
  appendtoken(token1,setoftokens1);
  i:=0;
  while i <> j do
     begin
     i:=i+1;
     if (line[i] in tokenchars1) then
   	begin
        ok:=false;
   	case line[i] of
 	'|':begin ok:=true;token1:= mktoken(mktokencat(vertline),i,i) end;
        '.':begin ok:=true;token1:= mktoken(mktokencat(dot),i,i) end;
        '=':begin ok:=true;token1:= mktoken(mktokencat(iscat),i,i) end;
        '[':begin ok:=true;token1:= mktoken(mktokencat(squareopen),i,i) end;
        ']':begin ok:=true;token1:= mktoken(mktokencat(squareclose),i,i) end; 
   	'/':begin ok:=true;token1:= mktoken(mktokencat(slash),i,i) end;
   	'{':begin ok:=true;token1:= mktoken(mktokencat(curlyopen),i,i) end;
   	'}':begin ok:=true;token1:= mktoken(mktokencat(curlyclose),i,i) end;
   	'(':begin ok:=true;token1:= mktoken(mktokencat(roundopen),i,i) end;
   	')':begin ok:=true;token1:= mktoken(mktokencat(roundclose),i,i) end
        end;
        if (i>1) and ok then
   		begin
   		if (line[i-1]=' ') then token1^.eerste:=i-1
                end;
        if (i<>j) and ok then 
   		begin if (line[i+1]=' ') then token1^.laatste:=i+1 end;
        if ok then appendtoken(token1,setoftokens1)
   	end
     end;
  if line[j]=' ' then token1:= mktoken(nil,j,j)
  else token1:= mktoken(nil,j+1,j+1);
  appendtoken(token1,setoftokens1)
  end;

  procedure appendstringtolexicalstructure(line:string;var if2:pconnectionnode;
		   num1,num2:integer;var beforeconditionsandactions:boolean);
  var string1:string;
      i,j:integer;
      newconnectionnode:pconnectionnode;
  begin
  if num2>num1 then
   	begin
   	i:=num1;
        j:=1;
        STRING_constantempty(string1);
        while i<>num2 do
        	begin
                STRING_appendchar(string1,string1,line[i]);
   	        i:=i+1;j:=j+1
   	        end;
        if (string1 ='SURFACE PART') then 
   				beforeconditionsandactions:=false;
        new(newconnectionnode);
        new(newconnectionnode^.list);
        newconnectionnode^.prev:=if2^.prev;
        if2^.prev^.next:=newconnectionnode;
        if2^.prev^.list^.rn:=newconnectionnode;
        newconnectionnode^.next:=if2;
        if2^.prev:=newconnectionnode;
        newconnectionnode^.list^.stree:= mkcharstring(string1)
        end
  end;

  procedure appendtokentolexicalstructure(token1:ptoken;
   						var if2:pconnectionnode);
  var newconnectionnode:pconnectionnode;
  begin
  new(newconnectionnode);
  new(newconnectionnode^.list);
  newconnectionnode^.prev:=if2^.prev;
  if2^.prev^.next:=newconnectionnode;
  if2^.prev^.list^.rn:=newconnectionnode;
  newconnectionnode^.next:=if2;
  if2^.prev:=newconnectionnode;
  newconnectionnode^.list^.stree:= token1^.knoop
  end;

 function compare(line:string;i,j:integer;str:string):boolean;
 {checks wether line[i]..line[i+str.length-1] = str[1]..str[str.length]
 j is the length of line, precondition: line[i]=str[1] }
 VAR result:boolean;
     i1:integer;
 begin
 result:=true;
 i1:=0;
 if i+STRING_length(str)-1>j then result:=false;
 while (i1<>STRING_length(str)) and result do
   begin
   i1:=i1+1;
   if line[i+i1-1]<>str[i1] then result:=false
   end;
 compare:=result
 end;
 
 procedure transduce2(var line:string;j:integer;var of1:text);
 var specialchars:set of char;
     i,k:integer;
     ch:char;
     str:string;
 begin
 specialchars:=['"','\','R','S','F','H','I','*','<','%','$','V',':','!'];
 i:=0;
 while i<>j do
   begin
   i:=i+1;
   if line[i] in specialchars then
     begin
     CASE line[i] OF
     '\': BEGIN
          IF compare(line,i,j,'\\') THEN
   	     begin
             if local then
               begin
                 writeln(of1,'appendstring(''\\'',',filename,');')
               end
             else
               begin
               writeln(of1,'TFILES_writeline(',filename,',TRUE);');
               writeln(of1)
               end
   	     end
          ELSE
              BEGIN 
              STRING_constantempty(filename1);
              while line[i+1]<>'.' do
   	 	   begin
                   i:=i+1;
                   STRING_appendchar(filename1,filename1,line[i]);
   		   end;
              IF (filename1<>'local') and (filename1<>'LOCAL') and
                 (filename1<>'global') and (filename1<>'GLOBAL') THEN
                filename:=filename1 ELSE 
                IF (filename1='local') or (filename1='LOCAL') THEN local:=true
                ELSE IF (filename1='global') or (filename1='GLOBAL') THEN 
                     local:=false
              END;
          i:=i+1
          END;
     '"':  IF compare(line,i,j,'"""') THEN
   	     begin
             i:=i+2;
             STRING_constantempty(str);
             while line[i+1]<>'"' do
                 begin
                 i:=i+1;
                 STRING_appendchar(str,str,line[i]);
                 end;
             i:=i+3;
             if local then
               begin
               write(of1,'appendstring(',MRUSURCOMwrite_compname);
               writeln(of1,'DECL_convinttostring(',str,'),',filename,');')
               end
             else
               begin
               writeln(of1,'TFILES_writeinteger(',filename,',');
               writeln(of1,str,',0,left);');
               writeln(of1)
               end
   	     end
           ELSE IF compare(line,i,j,'""') THEN
   	     begin
             STRING_constantempty(str);
             i:=i+1;
             while line[i+1]<>'"' do
                 begin
                 i:=i+1;
                 STRING_appendchar(str,str,line[i]);
                 end;
             i:=i+2;
             if local then
               begin
               writeln(of1,
                   'appendstring(',str,',',filename,');')
               end
             else
               begin
               writeln(of1,'TFILES_writestring(',filename,',');
               writeln(of1,str,',0,left);');
               writeln(of1)
               end
   	     end
           ELSE
             begin
             STRING_constantempty(str);
             while line[i+1]<>'"' do
                 begin
                 i:=i+1;
                 STRING_appendchar(str,str,line[i]);
                 if line[i]='''' then
   			begin
                        STRING_appendchar(str,str,'''');
   			end
                 end;
             i:=i+1;
             if local then
               begin
               writeln(of1,
                   'appendstring(''',str,''',',filename,');')
               end
             else
               begin
               writeln(of1,'TFILES_writestr(',filename,',');
               write(of1,'''');
               writeln(of1,str,''',FILES_maxIO,0,left);');
               writeln(of1)
               end
             end;
     'S': IF compare(line,i,j,'SEND:') THEN
   	     begin
             i:=i+4
   	     end
          ELSE write(of1,line[i]);
     'R': IF compare(line,i,j,'RECEIVE:') THEN
   	     begin
             i:=i+7
   	     end
          ELSE write(of1,line[i]);
     'F': IF compare(line,i,j,'FINAL:') THEN
   	     begin
             writeln(of1,'rsnode1:=rsnode1^.brother END;');
             i:=i+5
   	     end
          ELSE write(of1,line[i]);
     'H': IF compare(line,i,j,'HELP') THEN
   	     begin
             i:=i+3;
             helpseen:=true
   	     end
          ELSE write(of1,line[i]);
     'I': IF compare(line,i,j,'INIT:') THEN
   	     begin
             i:=i+4
   	     end
          ELSE write(of1,line[i]);
     '*': IF compare(line,i,j,'*>') THEN
   	     begin
             writeln(of1,'END;');
             i:=i+1
   	     end
          ELSE write(of1,line[i]);
     '<': IF compare(line,i,j,'<*') THEN
   	     begin
             if firstbracket then
   		begin
   		firstbracket:=false;
   		writeln(of1,'rsnode1:=top^.sonlist;');
   		writeln(of1,'  while rsnode1<>nil do');
                writeln(of1,'  begin');
                writeln(of1,'  currenttree:=rsnode1^.node;');
                writeln(of1,'  case rsnode1^.sonnumber of')
   		end
             else writeln(of1,'begin');
             i:=i+1
   	     end
          ELSE write(of1,line[i]);
     '%': BEGIN
          IF compare(line,i,j,'%%') THEN
   		BEGIN
                i:=i+1;
                while line[i+1]<>'.' do
   	 	   begin
                   i:=i+1;
   		   write(of1,line[i])
   		   end;
                i:=i+1;
                write(of1,'__') 
   		END
          ELSE
   		BEGIN
                write(of1,'currenttree^.ldfield.');
                k:=i;
                while line[i+1]<>'.' do
   	 	   begin
                   i:=i+1;
   		   write(of1,line[i])
   		   end;
                if k<>i then write(of1,'field^') else write(of1,'TERMINAL^')
                END
   	  END;
     '$': BEGIN
          IF compare(line,i,j,'$$') THEN
   		BEGIN
                i:=i+1;
                while line[i+1]<>'.' do
   	 	   begin
                   i:=i+1;
   		   write(of1,line[i])
   		   end;
                i:=i+1;
                write(of1,'_') 
                END
          ELSE
                BEGIN
                write(of1,'top^.ldfield.');
                while line[i+1]<>'.' do
   	           begin
                   i:=i+1;
                   write(of1,line[i])
   		   end;
                write(of1,'field^')
                END
          END;
     'V': IF compare(line,i,j,'VAR') AND NOT(helpseen) THEN
   	     begin
             writeln(of1,'VAR currenttree:',MRUSURCOMwrite_compname,'DECL_psnode;');
             writeln(of1,'    rsnode1:',MRUSURCOMwrite_compname,'DECL_prsnode;');
             i:=i+2
   	     end
          ELSE write(of1,line[i]);
     ':': IF compare(line,i,j,':::') THEN
   	     begin
               i:=i+2;
               write(of1,'::')
       	     end
          ELSE IF compare(line,i,j,':: ') THEN
   	     begin
               i:=i+2;
               write(of1,': ',MRUSURCOMwrite_compname,'LANGSPEC_')
       	     end
          ELSE IF compare(line,i,j,'::') THEN
   	     begin
               i:=i+1;
               write(of1,': ',MRUSURCOMwrite_compname,'LANGSPEC_')
       	     end
          ELSE write(of1,line[i]);
     '!': BEGIN
             write(of1,';');
             STRING_constantempty(str);
             IF line[i+1]<>'.' THEN 
               BEGIN
               write(of1,' ',MRUSURCOMwrite_compname,'CODE_');
               while line[i+1]<>'.' do
   	           begin
                   i:=i+1;
                   STRING_appendchar(str,str,line[i]);
                   write(of1,line[i])
   		   end;
               writeln(of1,'proc(currenttree');
               MRUSURCOMWRITE_callist(str,of1);
               write(of1,');')
               END;
             i:=i+1
          END;
     END
     end
   else write(of1,line[i]);
   end;
 writeln(of1)
 end;

 procedure transduce1(var line:string;j:integer;var of1:text);
 {transduce the conditions and actions of the rule into file of1}
 var specialchars:set of char;
     i,k:integer;
     ch:char;
 begin
 specialchars:=['P','L','G','#','F','H','I','*','<','%','$','S',':'];
 i:=0;
 while i<>j do
   begin
   i:=i+1;
   if line[i] in specialchars then
     begin
     CASE line[i] OF
     'L': IF compare(line,i,j,'LOCALCONDITION:') THEN
   	     begin
             writeln(of1,'loccond:',MRUSURCOMwrite_compname,'DECL_assignstatus(');
             i:=i+14
   	     end
          ELSE write(of1,line[i]);
     'G': IF compare(line,i,j,'GLOBAL:') THEN
   	     begin
             writeln(of1,');globcond: BEGIN');
             i:=i+6
   	     end
          ELSE write(of1,line[i]);
     '#': BEGIN
          IF compare(line,i,j,'#CONDITION:') THEN
   	     begin
             writeln(of1,'',MRUSURCOMwrite_compname,'DECL_assignstatus(');
             i:=i+10
   	     end;
          IF compare(line,i,j,'#ACTION:') THEN
   	     begin
             write(of1,');IF ',MRUSURCOMwrite_compname,'DECL_status THEN');
             i:=i+7
   	     end
          END;
     'F': IF compare(line,i,j,'FINAL:') THEN
   	     begin
             writeln(of1,'Hfinal: BEGIN');
             i:=i+5
   	     end
          ELSE write(of1,line[i]);
     'P': IF compare(line,i,j,'PROCEDURAL PART') THEN
   	     begin
             firstbracket:=true;
             beforeproceduralpart:=false;
             i:=j
   	     end
          ELSE write(of1,line[i]);
     'H': IF compare(line,i,j,'HELP') THEN
   	     begin
writeln(of1,'PROCEDURE ',rulenaam,
 'rule(a:',MRUSURCOMwrite_compname,'DECL_nodeid;b:',MRUSURCOMwrite_compname,'DECL_psnode;mode:',MRUSURCOMwrite_compname,'DECL_surfrulemode);');
             headingwritten:=true;
             afterinit:=true;
             i:=i+3
   	     end
          ELSE write(of1,line[i]);
     'I': IF compare(line,i,j,'INIT:') THEN
   	     begin if not headingwritten then writeln(of1,'PROCEDURE ',rulenaam,
 'rule(a:',MRUSURCOMwrite_compname,'DECL_nodeid;b:',MRUSURCOMwrite_compname,'DECL_psnode;mode:',MRUSURCOMwrite_compname,'DECL_surfrulemode);');
             writeln(of1,'BEGIN case a of Hinit:');
             afterinit:=true;
             i:=i+4
   	     end
          ELSE write(of1,line[i]);
     '*': IF compare(line,i,j,'*>') THEN
   	     begin
             writeln(of1,'END; END;');
             i:=i+1
   	     end
          ELSE write(of1,line[i]);
     '<': IF compare(line,i,j,'<*') THEN
   	     begin
             if firstbracket then
   		begin
   		firstbracket:=false;
   		{writeln(of1,'CASE a OF')}
   		end
             else writeln(of1,'CASE mode OF');
             i:=i+1
   	     end
          ELSE write(of1,line[i]);
     '%': BEGIN
          write(of1,'b^.ldfield.');
          k:=i;
          while line[i+1]<>'.' do
   		begin
                i:=i+1;
   		write(of1,line[i])
   		end;
          if k<>i then write(of1,'field^') else write(of1,'TERMINAL^')
   	  END;
     '$': BEGIN
          write(of1,'top^.ldfield.');
          while line[i+1]<>'.' do
   		begin
                i:=i+1;
   		write(of1,line[i])
   		end;
          write(of1,'field^')
          END;
     'S': IF compare(line,i,j,'SEND_') THEN
   	     begin
             write(of1,MRUSURCOMwrite_compname,'MAKET_');
             i:=i+4;
             while (line[i+1]<>';') do
   		begin
                i:=i+1;
   		write(of1,line[i])
   		end;
             writeln(of1,'(top);',MRUSURCOMwrite_compname,'DECL_addnewtop(top)')
   	     end
          ELSE write(of1,line[i]);
     ':': IF compare(line,i,j,':::') THEN
   	     begin
             i:=i+2;
             write(of1,'::')
   	     end
          ELSE IF compare(line,i,j,':: ') THEN
   	     begin
             i:=i+2;
             IF NOT afterinit THEN write(of1,': ',MRUSURCOMwrite_compname,'LANGSPEC_')
             ELSE write(of1,': ',MRUSURCOMwrite_compname,'LANGSPEC_')
   	     end
          ELSE IF compare(line,i,j,'::') THEN
   	     begin
             i:=i+1;
             IF NOT afterinit THEN write(of1,': ',MRUSURCOMwrite_compname,'LANGSPEC_')
             ELSE write(of1,': ',MRUSURCOMwrite_compname,'LANGSPEC_')
   	     end
          ELSE
            IF not(afterinit) THEN
              write(of1,': ')
            ELSE write(of1,line[i]);
     END
     end
   else write(of1,line[i]);
   end;
 writeln(of1)
 end;

begin{analyse}
if line[1]<>'&' then
   begin
   stop:=false;
   if beforeconditionsandactions then
      begin
      findtokens(line,j,tokens1);
      taketoken(token1,tokens1);
      while stilltokens(tokens1) do
   	   begin
   	   taketoken(token2,tokens1);
   	   appendstringtolexicalstructure(line,if2,token1^.laatste+1,
   				token2^.eerste,beforeconditionsandactions);
   	   if token2^.knoop<>nil then appendtokentolexicalstructure(token2,if2);
           token1:=token2
   	   end 
      end
   else 
      begin
      if beforeproceduralpart then
          transduce1(line,j,of1)
      else transduce2(line,j,of3)
      end
   end
else stop:=true
end;

procedure initlexicalstructure(var if2:pconnectionnode;rulenaam:string);
var stree1:psnode;

begin
new(if2);
new(if2^.list);
new(stree1); 
if2^.prev:=if2;if2^.next:=if2;
stree1^.cat:= rulename;
new(stree1^.rulenamefield);
stree1^.rulenamefield^.rulename:= rulenaam;
with if2^.list^ do
   begin
   next:=nil;rn:=nil;
   stree:=stree1
   end
end;

begin{scanner}
local:=false;
firstbracket:=true;{used in transduce}
findrule(if1,rulenaam,stop);
{if1 points at first line after %<rulenaam>, stop is true if the rule could not
be found, else stop is false}
if not(stop) then initlexicalstructure(if2,rulenaam) else if2:=nil;
beforeconditionsandactions:=true;
beforeproceduralpart:=true;
afterinit:=false;
headingwritten:=false;
helpseen:=false;
IF not(stop) THEN 
   	BEGIN
   	writeln(of2,'PROCEDURE ',MRUSURCOMwrite_compname,'CODE_',rulenaam,
                                        'proc(top:',MRUSURCOMwrite_compname,'DECL_psnode');
        MRUSURCOMWRITE_heading(rulenaam,of2);
   				{rulenaam is assumed to be category name !}
        write(of2,');');
        writeln(of2,'EXTERNAL;');
   	writeln(of3,'PROCEDURE ',MRUSURCOMwrite_compname,'CODE_',rulenaam,
                                        'proc(top:',MRUSURCOMwrite_compname,'DECL_psnode');
        MRUSURCOMWRITE_heading(rulenaam,of3);
   				{rulenaam is assumed to be category name !}
        writeln(of3,');')
        END;
IF not(stop) THEN writeln(of1,'PACKAGE ',rulenaam,
 'pack: [',rulenaam,'rule];');
stop1:=stop;
while not(stop) do
      begin
      readln(if1,line);
      addcounter;
      removerubbish(line,j);
   	{line consists of characters with at most one blank between non-blanks
   	 line[j] is the last relevant character}
      if j<>0 then analyse(line,j,if2,stop,beforeconditionsandactions)
      end;
IF not stop1 then writeln(of1,'END;{package}');
end;

