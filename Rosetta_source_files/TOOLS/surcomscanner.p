
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
EXPORT(surcomscanner);
pragma C_include('surcomdecl.pf');
pragma C_include('surcomscanner.pf');
PROGRAM surcomscanner;
WITH surcomdecl;
procedure SURCOMSCANNER_body(VAR if1:text;VAR rulenaam:SURCOMDECL_string;
					VAR if2:SURCOMDECL_pconnectionnode;VAR of1:text);
var line:SURCOMDECL_string;
    j:INTEGER;
    afterfinal,beforehelp,beforeinit,stop,stop1,beforeconditionsandactions:BOOLEAN;
    firstbracket,ok,headingwritten:BOOLEAN;
    
procedure findrule(var if1:text;var rulenaam:SURCOMDECL_string;var stop:BOOLEAN);
var line:SURCOMDECL_string;
    matches,found:BOOLEAN;
    i,j:INTEGER;
begin
found:=false;
while not(found) and not(eof(if1)) do
 begin
 readln(if1,line);
 SURCOMDECL_addcounter;
 if length(line)>0 then
   begin
   if (line[1] = '%') then
   	begin
   	i:=0;j:=0;
   	set_length(rulenaam,length(line)-1);
   	while i<>length(line)-1 do
   		begin
   		i:=i+1;
                j:=j+1;
   		if line[i+1]<>' ' then rulenaam[j]:=line[i+1] else
                        begin
                        j:=j-1;
   			set_length(rulenaam,length(rulenaam)-1)
                        end
   		end;
        found:=true
   	end
   end
 end;
if found then stop:=false else stop:=true
end;

procedure removerubbish(var line:SURCOMDECL_string;var j:INTEGER);
type ascii = 0..127;
var line2:SURCOMDECL_string;
    ch:char;
    i:INTEGER;
    rubbish:set of ascii;
    relevant:BOOLEAN;

begin
rubbish:= [0..33,63];
i:=0;
j:=0;
ch:=' ';
set_length(line2,0);
while i <> length(line)do
{ch is last character written to line2}
   begin
   i:=i+1;
   relevant:=not(ord(line[i]) in rubbish);
   if relevant or (ch <> ' ') then
   {the character line[i] can be rubbish only if last written character 
    was not blank}
   	begin
        j:=j+1;
        set_length(line2,length(line2)+1);
   	if not(relevant) then ch:=' ' else ch:=line[i];
        {if character is rubbish then a blank is to be written, else
         the relevant character itself}
        line2[j]:=ch
   	end
   end;
line:=line2
end;

procedure analyse(line:SURCOMDECL_string;j:INTEGER;var if2:SURCOMDECL_pconnectionnode;
                                   var stop,beforeconditionsandactions:BOOLEAN);
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
   		knoop:SURCOMDECL_psnode;
   		eerste:INTEGER;
   		laatste:INTEGER
   	     end;

var tokens1:setoftokens;
    token1,token2:ptoken;
    i:INTEGER;
    string1:SURCOMDECL_string;
{*procedures manipulating tokensets:*}

  procedure inittokenset(var S1:setoftokens);
  begin
  S1.first:=nil;
  S1.last:=nil
  end;

  function stilltokens(var S1:setoftokens):BOOLEAN;
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

  function mktoken(stree1:SURCOMDECL_psnode;eerste1,laatste1:INTEGER):ptoken;
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
  
  function mktokencat(cat1:SURCOMDECL_syntcat):SURCOMDECL_psnode;
  var stree1:SURCOMDECL_psnode;
  begin
  new(stree1);
  stree1^.cat:=cat1;
  mktokencat:=stree1
  end;

  function mkcharstring(string1:SURCOMDECL_string):SURCOMDECL_psnode;
  var stree1:SURCOMDECL_psnode;
  begin
  new(stree1);
  stree1^.cat:=charstring;
  new(stree1^.charstringfield);
  stree1^.charstringfield^.stringfield:=string1;
  stree1^.charstringfield^.linenumber:=SURCOMDECL_linecounter;
  mkcharstring:=stree1
  end;

  procedure findtokens(var line:SURCOMDECL_string;j:INTEGER;var setoftokens1:setoftokens);

  {*finds "|",".","(",")",curlyopen,curlyclose,squareopen,squareclose,"/".
  fields eerste and laatste denote the position of the tokens, including
  spaces around it. The beginning and the end of the line are denoted
  by a token with knoop=nil and in effect remove spaces. 
  *}
  var tokenchars1,tokenchars2:set of char;
      i:INTEGER;
      token1:ptoken;
      ok:BOOLEAN;

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

  procedure appendstringtolexicalstructure(line:SURCOMDECL_string;var if2:SURCOMDECL_pconnectionnode;
		   num1,num2:INTEGER;var beforeconditionsandactions:BOOLEAN);
  var string1:SURCOMDECL_string;
      i,j:INTEGER;
      newconnectionnode:SURCOMDECL_pconnectionnode;
  begin
  if num2>num1 then
   	begin
   	i:=num1;
        j:=1;
        set_length(string1,0);
        while i<>num2 do
        	begin
   		set_length(string1,length(string1)+1);
   	        string1[j]:=line[i];
   	        i:=i+1;j:=j+1
   	        end;
        if (string1 ='ConditionsAndActions:') OR 
           (string1='CONDITIONSANDACTIONS:') then 
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
   						var if2:SURCOMDECL_pconnectionnode);
  var newconnectionnode:SURCOMDECL_pconnectionnode;
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

 function compare(line:SURCOMDECL_string;i,j:INTEGER;str:SURCOMDECL_string):BOOLEAN;
 {checks wether line[i]..line[i+str.length-1] = str[1]..str[str.length]
 j is the length of line, precondition: line[i]=str[1] }
 VAR result:BOOLEAN;
     i1:INTEGER;
 begin
 result:=true;
 i1:=0;
 if i+length(str)-1>j then result:=false;
 while (i1<>length(str)) and result do
   begin
   i1:=i1+1;
   if line[i+i1-1]<>str[i1] then result:=false
   end;
 compare:=result
 end;

 procedure transduce(var line:SURCOMDECL_string;j:INTEGER;var of1:text);
 {transduce the conditions and actions of the rule into file of1}
 var specialchars:set of char;
     i:INTEGER;
     ch:char;
     copy,halt:BOOLEAN;
 begin
 specialchars:=['A','K','L','G','#','H','*','<','%','$','M',':'];
 i:=0;
 while i<>j do
   begin
   i:=i+1;
   copy:=true;
   if line[i] in specialchars then
     begin
     CASE line[i] OF
     'A': IF compare(line,i,j,'AUX_') THEN
   	     begin
             if ok then write(of1,'LSAUXDOM_');
             i:=i+3
   	     end
          ELSE if ok then write(of1,line[i]);
     'K': IF compare(line,i,j,'KEY_') THEN
   	     begin
             if ok then write(of1,'auxkey(''');
             i:=i+3;
             halt:=false;
             while not halt do
   		begin
                i:=i+1;
                if i=length(line) then halt:=true
                else if NOT (line[i+1] IN 
['_','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x',
'y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3',
'4','5','6','7','8','9','0']) then  halt:=true;
   		if ok then write(of1,line[i])
   		end;
             if ok then writeln(of1,''')');
   	     end
          ELSE if ok then write(of1,line[i]);
     'L': IF compare(line,i,j,'LOCALCONDITION:') THEN
   	     begin
             if ok then write(of1,'loccond:LIPRIMS_assignstatus(');
             i:=i+14
   	     end
          ELSE if ok then write(of1,line[i]);
     'G': IF compare(line,i,j,'GLOBAL:') THEN
   	     begin
             if ok then write(of1,');globcond: BEGIN');
             i:=i+6
   	     end
          ELSE if ok then write(of1,line[i]);
     '#': BEGIN
          IF compare(line,i,j,'#CONDITION:') THEN
   	     begin
             IF NOT afterfinal THEN ok:=FALSE;
             if ok then write(of1,'LIPRIMS_assignstatus(');
             i:=i+10
   	     end;
          IF compare(line,i,j,'# CONDITION:') THEN
   	     begin
             IF NOT afterfinal THEN ok:=FALSE;
             if ok then write(of1,'LIPRIMS_assignstatus(');
             i:=i+11
   	     end;
          IF compare(line,i,j,'#CONDITION :') THEN
   	     begin
             IF NOT afterfinal THEN ok:=FALSE;
             if ok then write(of1,'LIPRIMS_assignstatus(');
             i:=i+11
   	     end;
          IF compare(line,i,j,'# CONDITION :') THEN
   	     begin
             IF NOT afterfinal THEN ok:=FALSE;
             if ok then write(of1,'LIPRIMS_assignstatus(');
             i:=i+12
   	     end;
          IF compare(line,i,j,'#ACTION:') THEN
   	     begin
             if ok then write(of1,');IF LIPRIMS_status THEN');
             IF NOT afterfinal THEN ok:=TRUE;
             i:=i+7
   	     end;
          IF compare(line,i,j,'# ACTION:') THEN
   	     begin
             if ok then write(of1,');IF LIPRIMS_status THEN');
             IF NOT afterfinal THEN ok:=TRUE;
             i:=i+8
   	     end;
          IF compare(line,i,j,'#ACTION :') THEN
   	     begin
             if ok then write(of1,');IF LIPRIMS_status THEN');
             IF NOT afterfinal THEN ok:=TRUE;
             i:=i+8
   	     end;
          IF compare(line,i,j,'# ACTION :') THEN
   	     begin
             if ok then write(of1,');IF LIPRIMS_status THEN');
             IF NOT afterfinal THEN ok:=TRUE;
             i:=i+9
   	     end
          END;
     'H': IF compare(line,i,j,'HFINAL:') THEN
   	     begin
             afterfinal:=TRUE;
             if ok then write(of1,'LIPRIMS_HFINAL: BEGIN');
             i:=i+6
   	     end
          ELSE IF compare(line,i,j,'HFINAL :') THEN
   	     begin
             if ok then write(of1,'LIPRIMS_HFINAL: BEGIN');
             i:=i+7
   	     end
          ELSE IF compare(line,i,j,'HELP') THEN
   	     begin
writeln(of1,'PROCEDURE ',rulenaam,
 'rule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);');
             headingwritten:=true;
             i:=i+3;
             beforehelp:=FALSE;
   	     end
          ELSE IF compare(line,i,j,'HINIT:') THEN
   	     begin if not headingwritten then
writeln(of1,'PROCEDURE ',rulenaam,
 'rule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);');
             if ok then writeln(of1,'BEGIN CASE a OF');
             if ok then write(of1,'LIPRIMS_HINIT:');
             i:=i+5;
             beforeinit:=FALSE;
   	     end
          ELSE IF compare(line,i,j,'HINIT :') THEN
   	     begin
             if ok then write(of1,'LIPRIMS_HINIT:');
             i:=i+6;
             beforeinit:=FALSE;
   	     end
          ELSE if ok then write(of1,line[i]);
     '*': IF compare(line,i,j,'*>') THEN
   	     begin
             if ok then write(of1,'END; END;');
             i:=i+1
   	     end
          ELSE if ok then write(of1,line[i]);
     '<': IF compare(line,i,j,'<*') THEN
   	     begin
             if firstbracket then
   		begin
   		firstbracket:=false;
   		{if ok then write(of1,'CASE a OF')}
   		end
             else if ok then write(of1,'CASE mode OF');
             i:=i+1
   	     end
          ELSE if ok then write(of1,line[i]);
     '%': BEGIN
          if ok then write(of1,'b^.ls^.');
          while line[i+1]<>'.' do
   		begin
                i:=i+1;
   		if ok then write(of1,line[i])
   		end;
          if ok then write(of1,'field^')
   	  END;
     '$': BEGIN
          if ok then write(of1,'top^.ls^.');
          while line[i+1]<>'.' do
   		begin
                i:=i+1;
   		if ok then write(of1,line[i])
   		end;
          if ok then write(of1,'field^')
          END;
     'M': IF compare(line,i,j,'MAKET_') THEN
   	     begin
             if ok then write(of1,'top:=MAKET_stree(');
             i:=i+5;
             halt:=false;
             while not halt do
   		begin
                i:=i+1;
                if i=length(line) then halt:=true
                else if line[i+1]=';' then halt:=true;
   		if ok then write(of1,line[i])
   		end;
             if ok then writeln(of1,');');
             if ok then writeln(of1,'litop:=loopholes.retype(top,LISTREE_pstree);');
             if ok then writeln(of1,'LIPRIMS_addnewtop(litop)')
   	     end
          ELSE if ok then write(of1,line[i]);
     ':': IF compare(line,i,j,'::: BOOLEAN') THEN
   	     begin
             i:=i+10;
             IF beforehelp THEN BEGIN 
                 if ok then write(of1,': BOOLEAN')
                 END
               ELSE if ok then write(of1,': BOOLEAN');
   	     end
          ELSE IF compare(line,i,j,':::BOOLEAN') THEN
   	     begin
             i:=i+9;
             IF beforehelp THEN BEGIN
                 if ok then write(of1,': BOOLEAN')
                 END
               ELSE if ok then write(of1,': BOOLEAN');
   	     end
          ELSE IF compare(line,i,j,':: BOOLEAN') THEN
   	     begin
             i:=i+9;
             IF beforehelp THEN BEGIN
                 if ok then write(of1,': BOOLEAN')
                 END
               ELSE if ok then write(of1,': BOOLEAN');
   	     end
          ELSE IF compare(line,i,j,'::BOOLEAN') THEN
   	     begin
             i:=i+8;
             IF beforehelp THEN BEGIN
                 if ok then write(of1,': BOOLEAN')
                 END
               ELSE if ok then write(of1,': BOOLEAN');
   	     end
          ELSE IF compare(line,i,j,'::: ') THEN
   	     begin
             i:=i+3;
             IF beforehelp THEN BEGIN
                 if ok then write(of1,': LSDOMAINT_')
                 END
               ELSE if ok then write(of1,': LSDOMAINT_')
   	     end
          ELSE IF compare(line,i,j,':::') THEN
   	     begin
             i:=i+2;
             IF beforehelp THEN BEGIN
                 if ok then write(of1,': LSDOMAINT_')
                 END
               ELSE if ok then write(of1,': LSDOMAINT_')
   	     end
          ELSE IF compare(line,i,j,'::=') THEN
   	     begin
             i:=i+2;
             if ok then write(of1,':=');
   	     end
          ELSE IF compare(line,i,j,':: ') THEN
   	     begin
             i:=i+2;
             IF beforehelp THEN BEGIN
                 if ok then write(of1,': LSDOMAINT_')
                 END
               ELSE if ok then write(of1,': LSDOMAINT_')
   	     end
          ELSE IF compare(line,i,j,'::') THEN
   	     begin
             i:=i+1;
             IF beforehelp THEN BEGIN
                 if ok then write(of1,': LSDOMAINT_')
                 END
               ELSE if ok then write(of1,': LSDOMAINT_')
   	     end
          ELSE IF beforehelp AND beforeinit THEN
   	     begin
             if ok then write(of1,': ')
   	     end
          ELSE if ok then write(of1,line[i]);
     END
     end
   else if ok then write(of1,line[i]);
   end;
 if ok then writeln(of1)
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
   else transduce(line,j,of1)
   end
else stop:=true
end;

procedure initlexicalstructure(var if2:SURCOMDECL_pconnectionnode;rulenaam:SURCOMDECL_string);
var stree1:SURCOMDECL_psnode;

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
ok:=TRUE;
firstbracket:=true;{used in transduce}
beforeinit:=TRUE;
beforehelp:=TRUE;
afterfinal:=FALSE;
headingwritten:=FALSE;
findrule(if1,rulenaam,stop);
IF eof(if1) THEN stop:=TRUE;
{if1 points at first line after %<rulenaam>, stop is true if the rule could not
be found, else stop is false}
if not(stop) then initlexicalstructure(if2,rulenaam) else if2:=nil;
beforeconditionsandactions:=true;
IF not(stop) and (rulenaam<>'%') and (rulenaam<>'ENGLISH') and (rulenaam<>'DUTCH') and 
   					(rulenaam<>'SPANISH')
THEN if ok then writeln(of1,'PACKAGE ',rulenaam,
 'pack: [',rulenaam,'rule];');
stop1:=stop;
while not(stop) do
      begin
      readln(if1,line);
      IF eof(if1) THEN stop:=TRUE;
      SURCOMDECL_addcounter;
      removerubbish(line,j);
   	{line consists of characters with at most one blank between non-blanks
   	 line[j] is the last relevant character}
      if j<>0 then analyse(line,j,if2,stop,beforeconditionsandactions)
      end;
IF ok and not stop1 and (rulenaam<>'%') and (rulenaam<>'ENGLISH') and (rulenaam<>'DUTCH') and (rulenaam<>'SPANISH')
then writeln(of1,'END;{package}');
end;
