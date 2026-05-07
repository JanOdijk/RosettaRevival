(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : surcomcodeimp 
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
EXPORT(surcomcode);
pragma C_include('surcomcode.pf');
pragma C_include('surcomdecl.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('str.pf');
pragma C_include('lidomaint.pf');
PROGRAM surcomcode;
WITH surcomdecl,ldstrtotype,str,lidomaint;
type 
     plosident = ^losident;
     losident = record
                  arg:SURCOMDECL_string;
                  next:plosident
                end;
     setofidents = record
                    first,last:plosident
                   end;
var 
   graphof1,ruleof1:text;
   categorytable,rulenametable,rulenametable1:setofidents;
  function num(i:INTEGER):INTEGER;
  begin
  if i> 99 THEN num:=3
  else if i> 9 THEN num:=2
  else num:=1
  end;
  procedure initsetofidents(var S1:setofidents);
  begin
  S1.first:=nil;S1.last:=nil
  end;
  
  function stillidents(S1:setofidents):BOOLEAN;
  begin
  if S1.first<>nil then stillidents:=true
  else stillidents:=false
  end;

  procedure appendident(str:SURCOMDECL_string;var S1:setofidents);
  var p:plosident;
  begin
  new(p);
  p^.arg:=str;
  p^.next:=nil;
  if S1.first=nil then
   	begin
        S1.first:=p;
        S1.last:=p
   	end
  else
   	begin
        S1.last^.next:=p;
        S1.last:=p
   	end
  end;
  
  procedure takeident(var str:SURCOMDECL_string;var S1:setofidents);
  begin
  if S1.first=nil then str:=' '
  else 
 	begin
   	str:=S1.first^.arg;
        if S1.first=S1.last then
   		begin
   		S1.first:=nil;S1.last:=nil
   		end
 	else S1.first:=S1.first^.next
   	end
  end;

  procedure writetab(var outputfile:text;indentlevel:INTEGER);
  var j:INTEGER;
  begin
  j:=0;
  while j<>indentlevel do 
 	begin
 	j:=j+1;
        write(outputfile,'    ')
 	end
  end;

procedure SURCOMCODE_inittable;
begin
initsetofidents(rulenametable);
initsetofidents(categorytable)
end;

procedure SURCOMCODE_writerulecode(rulenaam:SURCOMDECL_string;
                     stree1:SURCOMDECL_psnode;var graphspas1:text);

   procedure uttproc(s:SURCOMDECL_psnode);
   VAR numofhelpgraphs,i,k:INTEGER;
       rs1:SURCOMDECL_prsnode;
       licat1:LIDOMAINT_syntcat;
       j:STR_range;
       string1:STR_string;
       str:SURCOMDECL_string;
    procedure rulenameproc(s1:SURCOMDECL_psnode);
    begin
    appendident(s1^.rulenamefield^.rulename,rulenametable)
    end;
    procedure graphproc(s1:SURCOMDECL_psnode;indentlevel:INTEGER);
    var i:INTEGER;
        rs1:SURCOMDECL_prsnode;
        indent:INTEGER;
     procedure concgraphproc(s1:SURCOMDECL_psnode;indentlevel:INTEGER);
     var i:INTEGER;
         rs1:SURCOMDECL_prsnode;
         indent:INTEGER;
      procedure elementarygraphproc(s1:SURCOMDECL_psnode;indentlevel:INTEGER);
       procedure enclosedgraphproc(s1:SURCOMDECL_psnode;indentlevel:INTEGER);
       begin
       graphproc(s1,indentlevel)
       end;
       procedure optgraphproc(s1:SURCOMDECL_psnode;indentlevel:INTEGER);
       begin
       write(graphspas1,'opt(');
       graphproc(s1,indentlevel);
       writeln(graphspas1);
       writetab(graphspas1,indentlevel+1);
       write(graphspas1,')')
       end;
       procedure stargraphproc(s1:SURCOMDECL_psnode;indentlevel:INTEGER);
       begin
       write(graphspas1,'star(');
       graphproc(s1,indentlevel);
       writeln(graphspas1);
       writetab(graphspas1,indentlevel+1);
       write(graphspas1,')')
       end;
       procedure helpgraphproc(s1:SURCOMDECL_psnode;indentlevel:INTEGER);
       begin
       write(graphspas1,s1^.identfield^.str,'graph')
       end;
       procedure atomgraphproc(s1:SURCOMDECL_psnode);
       VAR licat1:LIDOMAINT_syntcat;
           string1:STR_string;
           str:SURCOMDECL_string;
           j:STR_range;
       begin
       str:=s1^.sonlist^.node^.identfield^.str;
       j:=0;
       WHILE j<>length(str) DO
          BEGIN
          j:=j+1;
          STR_appendchar(string1,j,string1,j-1,str[j])
          END;
       LDSTRTOTYPE_cat(string1,j,licat1);
       {Omdat je geen enumerate types kan schrijven in PP:}
       write(graphspas1,'atom(licat',(ord(licat1)-2):num(ord(licat1)-2),',',
      s1^.sonlist^.brother^.brother^.node^.sonlist^.node^.identfield^.str,')')
       end;
      begin{elementarygraphproc}
      case s1^.elementarygraphfield^.graphtype of
      enclosedgraph: enclosedgraphproc(s1^.sonlist^.brother^.node,indentlevel);
      optgraph: optgraphproc(s1^.sonlist^.brother^.node,indentlevel);
      stargraph: stargraphproc(s1^.sonlist^.brother^.node,indentlevel);
      helpgraphident: helpgraphproc(s1^.sonlist^.node,indentlevel);
      atomgraph: atomgraphproc(s1);
      end
      end;
     begin{concgraphproc}
     i:=0;
     indent:=indentlevel;
     rs1:=s1^.sonlist;
     while i <> s1^.concgraphfield^.numofelementarygraphs do
   	begin
        i:=i+1;
        if i<>s1^.concgraphfield^.numofelementarygraphs then
          begin
          indent:=indent+1;
          write(graphspas1,'conc(');
          elementarygraphproc(rs1^.node,indent);
          writeln(graphspas1,',');
          writetab(graphspas1,indent);
          rs1:=rs1^.brother^.brother
          end
        else 
   	  begin
          elementarygraphproc(rs1^.node,indent)
          end
   	end;
     i:=indent;
     while i<>indentlevel do
    	begin
        writeln(graphspas1);writetab(graphspas1,i);write(graphspas1,')');
   	i:=i-1
   	end
     end;
    begin{graphproc}
    i:=0;
    indent:=indentlevel;
    rs1:=s1^.sonlist;
    while i <> s1^.graphfield^.numofconcgraphs do
   	begin
        i:=i+1;
        if i<>s1^.graphfield^.numofconcgraphs then
          begin
          indent:=indent+1;
          write(graphspas1,'alt(');
          concgraphproc(rs1^.node,indent);
          writeln(graphspas1,',');
          writetab(graphspas1,indent);
          rs1:=rs1^.brother^.brother
          end
        else 
   	  begin
          concgraphproc(rs1^.node,indent)
          end
   	end;
    i:=indent;
    while i<>indentlevel do
    	begin
        writeln(graphspas1);writetab(graphspas1,i);write(graphspas1,')');
   	i:=i-1
   	end
    end;
    procedure helpgraphproc(s1:SURCOMDECL_psnode);
    begin{helpgraphproc}
    write(graphspas1,'function ');
    writeln(graphspas1,s1^.sonlist^.node^.identfield^.str,
                                'graph:LIPRIMS_psurfgraph;');
    writeln(graphspas1,'BEGIN');
    writeln(graphspas1,s1^.sonlist^.node^.identfield^.str,'graph:=');
    graphproc(s1^.sonlist^.brother^.brother^.node,0);
    writeln(graphspas1);
    writeln(graphspas1,'END;')
    end;
   begin{uttproc}
   appendident(s^.uttfield^.category,categorytable);
   rulenameproc(s^.sonlist^.node);
   numofhelpgraphs:=s^.uttfield^.numofhelpgraphs;
   k:=numofhelpgraphs;
   WHILE k<>0 DO
    BEGIN
    i:=0;
    rs1:=s^.sonlist^.brother^.brother^.brother^.brother;
    while i<>numofhelpgraphs do
   	begin
   	i:=i+1;
        rs1:=rs1^.brother;
        IF i=k THEN helpgraphproc(rs1^.node)
   	end;
    k:=k-1;
    END;
   write(graphspas1,'procedure ');
   writeln(graphspas1,s^.sonlist^.node^.rulenamefield^.rulename,
                                'graph(i:INTEGER);');
   writeln(graphspas1,'BEGIN');
   str:=s^.sonlist^.brother^.brother^.node^.identfield^.str;
   j:=0;
   WHILE j<>length(str) DO
          BEGIN
          j:=j+1;
          STR_appendchar(string1,j,string1,j-1,str[j])
          END;
   LDSTRTOTYPE_cat(string1,j,licat1);
   {Omdat je geen enumerate types kan schrijven in PP:}
   writeln(graphspas1,'prod(i,licat',(ord(licat1)-2):num(ord(licat1)-2),',');
   writetab(graphspas1,1);
   graphproc(s^.sonlist^.brother^.brother^.brother^.brother^.node,1);
   writeln(graphspas1);
   writeln(graphspas1,'    )');
   writeln(graphspas1,'END;')
   end;

  begin
  writeln(graphspas1);
  writeln(graphspas1,'{rule:}');
  writeln(graphspas1,'{:',stree1^.sonlist^.node^.rulenamefield^.rulename,'}');
  uttproc(stree1);
  writeln(graphspas1,'{:',stree1^.sonlist^.node^.rulenamefield^.rulename,'}')
  end;

procedure SURCOMCODE_writeswitches(VAR graphspas1:text;VAR rulespas1:text;
                                VAR primspas1:text);
VAR str:SURCOMDECL_string;
      i,j:STR_range;
    string1:STR_string;licat1:LIDOMAINT_syntcat;
begin
writeln(graphspas1,'procedure SURFRULESGRAPHS_SFG(i:INTEGER);');
writeln(graphspas1,'BEGIN');
writeln(graphspas1,'CASE i OF');
writeln(rulespas1,'procedure SURFRULES_rule(rnr:INTEGER;a:LIPRIMS_nodeid;');
writeln(rulespas1,'            b:LISTREE_pStree;mode:LIPRIMS_surfrulemode);');
writeln(rulespas1,'VAR lsb:LSSTREE_pStree;');
writeln(rulespas1,'BEGIN');
writeln(rulespas1,'lsb:=loopholes.retype(b,LSSTREE_pStree);');
writeln(rulespas1,'CASE rnr OF');
i:=0;
rulenametable1:=rulenametable;
while stillidents(rulenametable1) do
   begin
   i:=i+1;
   takeident(str,rulenametable1);
   writeln(graphspas1,i:3,':',str,'graph(',i:3,');');
   writeln(rulespas1,i:3,':WITH ',str,'pack DO ',str,'rule(a,lsb,mode);')
   end;
writeln(graphspas1,'END');
writeln(graphspas1,'END;');
writeln(rulespas1,'END');
writeln(rulespas1,'END;');
writeln(graphspas1,
 'FUNCTION SURFRULESGRAPHS_topcat(i:INTEGER):LIDOMAINT_syntcat;');
writeln(graphspas1,'BEGIN');
writeln(graphspas1,'CASE i OF');
i:=0;
while stillidents(categorytable) do
   begin
   i:=i+1;
   takeident(str,categorytable);
   j:=0;
   WHILE j<>length(str) DO
      BEGIN
      j:=j+1;
      STR_appendchar(string1,j,string1,j-1,str[j])
      END;
   LDSTRTOTYPE_cat(string1,j,licat1);
   {Omdat je geen enumerate types kan schrijven in PP:}
   writeln(graphspas1,i:3, ':SURFRULESGRAPHS_topcat:=licat',(ord(licat1)-2):num(ord(licat1)-2),';')
   end;
writeln(graphspas1,'END');
writeln(graphspas1,'END;');
writeln(rulespas1,'FUNCTION SURFRULES_maxrnr:INTEGER;');
writeln(rulespas1,'BEGIN');
writeln(rulespas1,'SURFRULES_maxrnr:=',i:3);
writeln(rulespas1,'END;');
writeln(rulespas1,'FUNCTION SURFRULES_synrel:LIDOMAINT_synrel;');
writeln(rulespas1,'BEGIN');
writeln(rulespas1,'SURFRULES_synrel:=loopholes.retype(synrel,LIDOMAINT_synrel)');
writeln(rulespas1,'END;');
writeln(primspas1,'CONST maxrnr = ',i:3,';');
writeln(primspas1,'TYPE grammarlength = 0..maxrnr;');
writeln(primspas1,'VAR surfgraphvar: ARRAY[1..maxrnr] OF LIPRIMS_psurfgraph;');
writeln(primspas1,'    parentlist: ARRAY[1..maxrnr] OF ITEMS_pSetOfItems;');
writeln(primspas1,'    params: ARRAY[1..maxrnr] OF ITEMS_params;');
writeln(primspas1,'    usedparentlistindices: SET OF grammarlength;');
writeln(primspas1,'    initialitem: ARRAY[1..maxrnr] OF ITEMS_pitem;');
writeln(primspas1,'    rnrset: ARRAY[0..maxrnr] OF BOOLEAN;');
writeln(primspas1,
'FUNCTION LDPRIMS_initialitem(rnr:INTEGER):ITEMS_pitem;');
writeln(primspas1,'BEGIN');
writeln(primspas1,'LDPRIMS_initialitem:=initialitem[rnr]');
writeln(primspas1,'END;');
writeln(primspas1,
'PROCEDURE LDPRIMS_assinitialitem(rnr:INTEGER;valeu:ITEMS_pitem);');
writeln(primspas1,'BEGIN');
writeln(primspas1,'initialitem[rnr]:=valeu');
writeln(primspas1,'END;');
writeln(primspas1,
'PROCEDURE LDPRIMS_initindices;');
writeln(primspas1,'BEGIN');
writeln(primspas1,'usedparentlistindices:=[]');
writeln(primspas1,'END;');
writeln(primspas1,
'FUNCTION LDPRIMS_testindex(rnr:INTEGER):BOOLEAN;');
writeln(primspas1,'BEGIN');
writeln(primspas1,'LDPRIMS_testindex:= rnr IN usedparentlistindices');
writeln(primspas1,'END;');
writeln(primspas1,
'PROCEDURE LDPRIMS_addindex(rnr:INTEGER);');
writeln(primspas1,'BEGIN');
writeln(primspas1,'usedparentlistindices:=usedparentlistindices + [rnr]');
writeln(primspas1,'END;');
writeln(primspas1,
'FUNCTION LDPRIMS_parentlist(i:INTEGER):ITEMS_pSetOfItems;');
writeln(primspas1,'BEGIN');
writeln(primspas1,'LDPRIMS_parentlist:=parentlist[i]');
writeln(primspas1,'END;');
writeln(primspas1,
'PROCEDURE LDPRIMS_assparentlist(i:INTEGER;valeu:ITEMS_pSetOfitems);');
writeln(primspas1,'BEGIN');
writeln(primspas1,'parentlist[i]:=valeu');
writeln(primspas1,'END;');
writeln(primspas1,
'FUNCTION LDPRIMS_params(i:INTEGER):ITEMS_params;');
writeln(primspas1,'BEGIN');
writeln(primspas1,'LDPRIMS_params:=params[i]');
writeln(primspas1,'END;');
writeln(primspas1,
'PROCEDURE LDPRIMS_assparams(i:INTEGER;valeu:ITEMS_params);');
writeln(primspas1,'BEGIN');
writeln(primspas1,'params[i]:=valeu');
writeln(primspas1,'END;');
writeln(primspas1,
'FUNCTION LDPRIMS_surfgraph(i:INTEGER):LIPRIMS_psurfgraph;');
writeln(primspas1,'BEGIN');
writeln(primspas1,'LDPRIMS_surfgraph:=surfgraphvar[i]');
writeln(primspas1,'END;');
writeln(primspas1,
'PROCEDURE LDPRIMS_assignsurfgraph(i:INTEGER;valeu:LIPRIMS_psurfgraph);');
writeln(primspas1,'BEGIN');
writeln(primspas1,'surfgraphvar[i]:=valeu');
writeln(primspas1,'END;');
writeln(primspas1,
'FUNCTION LDPRIMS_rnrset(i:INTEGER):BOOLEAN;');
writeln(primspas1,'BEGIN');
writeln(primspas1,'LDPRIMS_rnrset:=rnrset[i]');
writeln(primspas1,'END;');
writeln(primspas1,
'PROCEDURE LDPRIMS_assignrnrset(i:INTEGER;valeu:BOOLEAN);');
writeln(primspas1,'BEGIN');
writeln(primspas1,'rnrset[i]:=valeu');
writeln(primspas1,'END;');
end;

