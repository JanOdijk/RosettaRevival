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

EXPORT(LEXCOMSCANNER);
pragma C_include('lexcomscanner.pf');
pragma C_include('lexcomdecl.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM lexcomscanner;

WITH LEXCOMDECL;

procedure LEXCOMSCANNER_body(var if1:text;var rulenaam:LEXCOMDECL_string;
                                                allmode:BOOLEAN;
   						var if2:LEXCOMDECL_pconnectionnode);
var line:LEXCOMDECL_string;
    j:INTEGER;
    stop,beforecomp:BOOLEAN;
    recognizerounds:BOOLEAN;
procedure findrule(var if1:text;var rulenaam1:LEXCOMDECL_string;var stop:BOOLEAN);
var line,rulenaam:string(220);
    matches,found:BOOLEAN;
    i:INTEGER;
begin
rulenaam:=rulenaam1;
found:=false;
while not(found) and not(eof(if1)) do
 begin
 readln(if1,line);
 LEXCOMDECL_addcounter;
 if length(line)>0 then
   begin
   if (line[1] = '%') and (length(line)=length(rulenaam)+1) and not(allmode) then
   	begin
   	i:=0;
   	matches:=true;
   	while (i <> length(line)-1) and matches do
   		begin
   		i:=i+1;
   		if (rulenaam[i] <> line[i+1]) and (line[i+1]<>' ')
   					 then matches:=false
                end;
        if matches then found:=true
   	end;
   if (line[1] = '%') and allmode then
   	begin
   	i:=0; 
   	set_length(rulenaam,length(line)-1);
   	while i<>length(line)-1 do
   		begin
   		i:=i+1;
   		if line[i+1]<>' ' then rulenaam[i]:=line[i+1] else
   			set_length(rulenaam,length(rulenaam)-1)
   		end;
        found:=true
   	end
   end
 end;
if not(found) then
   begin
   stop:=true;
   if not(allmode) then writeln('error, did not find ',rulenaam,
   							' in input file')
   end
else stop:=false;
rulenaam1:=rulenaam;
end;

procedure removerubbish(var line:LEXCOMDECL_string;var j:INTEGER);
type ascii = 0..127;
var line2:LEXCOMDECL_string;
    ch:char;
    i:INTEGER;
    rubbish:set of ascii;
    relevant:BOOLEAN;

begin
rubbish:= [0..32];
i:=0;
j:=0;
ch:=' ';
set_length(line2,0);
while i <> length(line) do
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

procedure analyse(line:LEXCOMDECL_string;j:INTEGER;var if2:LEXCOMDECL_pconnectionnode;
                                                   var stop,beforecomp:BOOLEAN);
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
   		knoop:LEXCOMDECL_psnode;
   		eerste:INTEGER;
   		laatste:INTEGER
   	     end;

var tokens1:setoftokens;
    token1,token2:ptoken;
    i:INTEGER;
    string1:LEXCOMDECL_string;
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

  function mktoken(stree1:LEXCOMDECL_psnode;eerste1,laatste1:INTEGER):ptoken;
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
  
  function mktokencat(cat1:LEXCOMDECL_syntcat):LEXCOMDECL_psnode;
  var stree1:LEXCOMDECL_psnode;
  begin
  new(stree1);
  stree1^.cat:=cat1;
  mktokencat:=stree1
  end;

  function mkcharstring(string1:LEXCOMDECL_string):LEXCOMDECL_psnode;
  var stree1:LEXCOMDECL_psnode;
  begin
  new(stree1);
  stree1^.cat:=charstring;
  new(stree1^.charstringfield);
  stree1^.charstringfield^.alreadyconcatenated:=false;
  stree1^.charstringfield^.stringfield:=string1;
  stree1^.charstringfield^.linenumber:=LEXCOMDECL_linecounter;
  mkcharstring:=stree1
  end;

  procedure findtokens(var line:LEXCOMDECL_string;j:INTEGER;var setoftokens1:setoftokens;
   							beforecomp:BOOLEAN);
  {*finds ":",";",",",curlyopen,curlyclose,squareopen,squareclose,"/","and".
  fiels eerste and laatste denote the position of the tokens, including
  spaces around it. The beginning and the end of the line are denoted
  by a token with knoop=nil and in effect remove spaces. If beforecomp is false
  only ":",";","and","or",),( are identified
   *}
  var tokenchars1,tokenchars2:set of char;
      i:INTEGER;
      token1:ptoken;
      ok:BOOLEAN;

  begin
  tokenchars1:=[':' , ',' , '{' , '}' , '[' , ']' , '/' , '(', ')' ];  
  tokenchars2:=[':' , ';' , 'a','o','n',')','('];
  inittokenset(setoftokens1);
  if line[1]=' ' then token1:=mktoken(nil,0,1)
  else token1:=mktoken(nil,0,0);
  appendtoken(token1,setoftokens1);
  i:=0;
  while i <> j do
     begin
     i:=i+1;
     if ((line[i] in tokenchars1) and beforecomp) or ((line[i] in tokenchars2) 
     and not(beforecomp)) then
   	begin
        ok:=false;
   	case line[i] of
        ':':begin
            if i>2 then
   		begin
   		if (line[i-2] in ['a','A'] ) and (line[i-1] in 
                                   ['1','2','3','4','5','6','7','8','9']) then
   			begin
   	                if i>3 then if line[i-3]=' ' then 
   						recognizerounds:=false;
   			if i=3 then recognizerounds:=false
   			end;
   		if (line[i-2] in ['c','C']) and (line[i-1] in 
                                   ['1','2','3','4','5','6','7','8','9']) then
   			begin
   			if i>3 then if line[i-3]=' ' then recognizerounds:=true;
   			if i=3 then recognizerounds:=true
   			end;
   		end;
            if i>1 then
   		begin
                if (line[i-1] in ['a','A']) then
   			begin
   			if i>2 then if line[i-2]=' ' then
   						recognizerounds:=false;
                        if i=2 then recognizerounds:=false
   			end;
                if (line[i-1] in ['c','C']) then
   		        begin
   			if i>2 then if line[i-2]=' ' then
   							recognizerounds:=true;
                        if i=2 then recognizerounds:=true
   			end
   		end;
            if i=length(line) then ok:=true
            else
            	begin
                if line[i+1]<>'=' then ok:=true
   		end;
            if ok then token1:= mktoken(mktokencat(dotdot),i,i);
            if i<>length(line) then if line[i+1]='=' then
   		begin
   		ok:=true;
   		token1:=mktoken(mktokencat(assign),i,i+1)
   		end
            end;
 	';':begin ok:=true;token1:= mktoken(mktokencat(dotcomma),i,i) end;
        ',':begin ok:=true;token1:= mktoken(mktokencat(comma),i,i) end;
        '[':begin ok:=true;token1:= mktoken(mktokencat(squareopen),i,i) end;
        ']':begin ok:=true;token1:= mktoken(mktokencat(squareclose),i,i) end; 
   	'/':begin ok:=true;token1:= mktoken(mktokencat(slash),i,i) end;
        ')':begin if recognizerounds or beforecomp then 
   			begin
   			ok:=true;token1:= mktoken(mktokencat(roundclose),i,i)
   			end
            end;
        '(':begin if recognizerounds or beforecomp then
   			begin
   			ok:=true;
   			token1:= mktoken(mktokencat(roundopen),i,i) 
   			end
   	    end;
        'n':begin
            ok:=true;
            if i<>1 then if line[i-1]<>' 'then if line[i-1]<>'(' then ok:=false;
            if (i+2)>length(line) then ok:=false
            else
   		begin
                if (line[i+1]<>'o') or (line[i+2]<>'t') then ok:=false;
   		if (i+2)<>length(line) then if (line[i+3]<>' ') then 
                   if line[i+3]<>'(' then ok:=false
                end;
            if ok then token1:= mktoken(mktokencat(notcat),i-1,i+3)
            else token1:=nil
            end;
   	'{':begin ok:=true;token1:= mktoken(mktokencat(curlyopen),i,i) end;
   	'}':begin ok:=true;token1:= mktoken(mktokencat(curlyclose),i,i) end;
   	'a':begin
            ok:=true;
            if i<>1 then if line[i-1]<>' 'then if line[i-1]<>')' then ok:=false;
            if (i+2)>length(line) then ok:=false
            else
   		begin
                if (line[i+1]<>'n') or (line[i+2]<>'d') then ok:=false;
   		if (i+2)<>length(line) then if (line[i+3]<>' ') then 
                if line[i+3]<>'(' then ok:=false
                end;
            if ok then token1:= mktoken(mktokencat(andcat),i-1,i+3)
            else token1:=nil
            end;
   	'o':begin
            ok:=true;
            if i<>1 then if line[i-1]<>' 'then ok:=false;
            if (i+1)>length(line) then ok:=false
            else
   		begin
                if (line[i+1]<>'r') then ok:=false;
   		if (i+1)<>length(line) then if (line[i+2]<>' ') then ok:=false
                end;
            if ok then token1:= mktoken(mktokencat(orcat),i-1,i+2)
            else token1:=nil
            end;
        end;
        if (i>1) and ok then
   		begin
   		if (line[i-1]=' ') and (line[i]<>'a') then token1^.eerste:=i-1
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

  procedure appendstringtolexicalstructure(line:LEXCOMDECL_string;var if2:LEXCOMDECL_pconnectionnode;
   				   num1,num2:INTEGER;var beforecomp:BOOLEAN);
  var string1:LEXCOMDECL_string;
      i,j:INTEGER;
      newconnectionnode:LEXCOMDECL_pconnectionnode;
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
        if (string1 ='comp') or (string1='decomp') then beforecomp:=false;
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
   						var if2:LEXCOMDECL_pconnectionnode);
  var newconnectionnode:LEXCOMDECL_pconnectionnode;
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

begin{analyse}
{voor harm i.v.m. LATEX, 17 mei 1988:}
stop:=false;
if length(line)>1 then
     if (line[1]='%') AND (line[2]='&') then stop:=true;
{:voor harm}
if (line[1]<>'&') and not (stop) then
   begin
   stop:=false;
   findtokens(line,j,tokens1,beforecomp);
   taketoken(token1,tokens1);
   while stilltokens(tokens1) do
   	   begin
   	   taketoken(token2,tokens1);
   	   appendstringtolexicalstructure(line,if2,token1^.laatste+1,
   						token2^.eerste,beforecomp);
   	   if token2^.knoop<>nil then appendtokentolexicalstructure(token2,if2);
           token1:=token2
   	   end 
   end
else stop:=true
end;

procedure initlexicalstructure(var if2:LEXCOMDECL_pconnectionnode;rulenaam:LEXCOMDECL_string);
var stree1:LEXCOMDECL_psnode;

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
findrule(if1,rulenaam,stop);
{if1 points at first line after %<rulenaam>, stop is true if the rule could not
be found, else stop is false}
if not(stop) then initlexicalstructure(if2,rulenaam) else if2:=nil;
beforecomp:=true;
while not(stop) do
      begin
      readln(if1,line);
      LEXCOMDECL_addcounter;
      removerubbish(line,j);
   	{line consists of characters with at most one blank between non-blanks
   	 line[j] is the last relevant character}
      if j<>0 then analyse(line,j,if2,stop,beforecomp)
      end
end;
