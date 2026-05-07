(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : mrusurcomcodeimp 
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

EXPORT(mrusurcomcode);
pragma C_include('mrusurcomcode.pf');
pragma C_include('mrusurcomdecl.pf');
pragma C_include('mrusurcomwrite.pf');

PROGRAM mrusurcomcode;

WITH mrusurcomdecl,
     mrusurcomwrite;
type 
     plosident = ^losident;
     losident = record
                  arg:string;
                  next:plosident
                end;
     setofidents = record
                    first,last:plosident
                   end;
var
   graphof1,ruleof1:text;
   rulenametable1,rulenametable:setofidents;
   rulecattable1,rulecattable:setofidents;
  procedure initsetofidents(var S1:setofidents);
  begin
  S1.first:=nil;S1.last:=nil
  end;
  
  function stillidents(S1:setofidents):boolean;
  begin
  if S1.first<>nil then stillidents:=true
  else stillidents:=false
  end;

  procedure appendident(str:string;var S1:setofidents);
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
  
  procedure takeident(var str:string;var S1:setofidents);
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

  procedure writetab(var outputfile:text;indentlevel:integer);
  var j:integer;
  begin
  j:=0;
  while j<>indentlevel do 
 	begin
 	j:=j+1;
        write(outputfile,'    ')
 	end
  end;

 procedure inittable;
begin
initsetofidents(rulenametable);
initsetofidents(rulecattable)
end;

procedure writerulecode(rulenaam:string;stree1:psnode;
                var graphspas1:text);

   procedure uttproc(s:psnode);
   VAR numofhelpgraphs,i:integer;
       rs1:prsnode;
    procedure rulenameproc(s1:psnode);
    begin
    appendident(s1^.rulenamefield^.rulename,rulenametable)
    end;
    procedure rulecatproc(s1:psnode);
    begin
    appendident(s1^.identfield^.str,rulecattable)
    end;
    procedure graphproc(s1:psnode;indentlevel:integer);
    var i:integer;
        rs1:prsnode;
        indent:integer;
     procedure concgraphproc(s1:psnode;indentlevel:integer);
     var i:integer;
         rs1:prsnode;
         indent:integer;
      procedure elementarygraphproc(s1:psnode;indentlevel:integer);
       procedure enclosedgraphproc(s1:psnode;indentlevel:integer);
       begin
       graphproc(s1,indentlevel)
       end;
       procedure optgraphproc(s1:psnode;indentlevel:integer);
       begin
       write(graphspas1,'opt(');
       graphproc(s1,indentlevel);
       writeln(graphspas1);
       writetab(graphspas1,indentlevel+1);
       write(graphspas1,')')
       end;
       procedure stargraphproc(s1:psnode;indentlevel:integer);
       begin
       write(graphspas1,'star(');
       graphproc(s1,indentlevel);
       writeln(graphspas1);
       writetab(graphspas1,indentlevel+1);
       write(graphspas1,')')
       end;
       procedure helpgraphproc(s1:psnode;indentlevel:integer);
       begin
       write(graphspas1,s1^.identfield^.str,'graph')
       end;
       procedure atomgraphproc(s1:psnode);
       begin
       write(graphspas1,'atom(',s1^.sonlist^.node^.identfield^.str,',',
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
    procedure helpgraphproc(s1:psnode);
    begin{helpgraphproc}
    write(graphspas1,'function ');
    writeln(graphspas1,s1^.sonlist^.node^.identfield^.str,
                                'graph:',MRUSURCOMwrite_compname,'DECL_psurfgraph;');
    writeln(graphspas1,'BEGIN');
    writeln(graphspas1,s1^.sonlist^.node^.identfield^.str,'graph:=');
    graphproc(s1^.sonlist^.brother^.brother^.node,0);
    writeln(graphspas1);
    writeln(graphspas1,'END;')
    end;
   begin{uttproc}
   rulenameproc(s^.sonlist^.node);
   rulecatproc(s^.sonlist^.brother^.brother^.node);
   numofhelpgraphs:=s^.uttfield^.numofhelpgraphs;
   i:=0;
   rs1:=s^.sonlist^.brother^.brother^.brother^.brother;
   while i<>numofhelpgraphs do
   	begin
   	i:=i+1;
        rs1:=rs1^.brother;
        helpgraphproc(rs1^.node)
   	end;
   write(graphspas1,'procedure ');
   writeln(graphspas1,s^.sonlist^.node^.rulenamefield^.rulename,
                                'graph(i:INTEGER);');
   writeln(graphspas1,'BEGIN');
   writeln(graphspas1,
     'prod(i,',s^.sonlist^.brother^.brother^.node^.identfield^.str,',');
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

procedure writeswitches(var graphspas1:text;var rulespas1:text;
   					var rulesenv1:text);
VAR str:string;
      i:integer;
begin
writeln(graphspas1,' procedure ',MRUSURCOMwrite_compname,'GRAPHDEF_SFG(i:INTEGER);');
writeln(graphspas1,'BEGIN');
writeln(graphspas1,'CASE i OF');
writeln(rulespas1,' PROCEDURE ',MRUSURCOMwrite_compname,'RULES_init;');
writeln(rulespas1,'BEGIN');
MRUSURCOMWRITE_init(rulespas1);
writeln(rulespas1,'END;');
writeln(rulespas1,
  ' procedure ',MRUSURCOMwrite_compname,
  'RULES_rule(rnr:INTEGER;a:',MRUSURCOMwrite_compname,'DECL_nodeid;');
writeln(rulespas1,'        b,la:',MRUSURCOMwrite_compname,
  'DECL_psnode;mode:',MRUSURCOMwrite_compname,'DECL_surfrulemode);');
writeln(rulespas1,'BEGIN');
writeln(rulespas1,'CASE rnr OF');
i:=0;
rulenametable1:=rulenametable;
while stillidents(rulenametable1) do
   begin
   i:=i+1;
   takeident(str,rulenametable1);
   writeln(graphspas1,i:3,':',str,'graph(',i:3,');');
   writeln(rulespas1,i:3,':WITH ',str,'pack DO ',str,'rule(a,b,mode);')
   end;
writeln(graphspas1,'END');
writeln(graphspas1,'END;');
writeln(graphspas1,
' FUNCTION ',MRUSURCOMwrite_compname,
'GRAPHDEF_topcat(i:integer):',MRUSURCOMwrite_compname,'LANGSPEC_Category;'
									     );
writeln(graphspas1,'BEGIN');
writeln(graphspas1,'CASE i OF');
i:=0;
rulecattable1:=rulecattable;
while stillidents(rulecattable1) do
   begin
   i:=i+1;
   takeident(str,rulecattable1);
   writeln(graphspas1,i:3,': ',MRUSURCOMwrite_compname,'GRAPHDEF_topcat:= ',str,';')
   end;
writeln(graphspas1,'END');
writeln(graphspas1,'END;');
writeln(rulespas1,'END');
writeln(rulespas1,'END;');
writeln(rulesenv1,'CONST');
writeln(rulesenv1,'   ',MRUSURCOMWRITE_compname,'RULES_maxrnr=',i:3,';');
writeln(rulesenv1,' PROCEDURE ',MRUSURCOMwrite_compname,'RULES_rule(rnr:integer;');
writeln(rulesenv1,
'     a:',MRUSURCOMwrite_compname,'DECL_nodeid;b,la:',MRUSURCOMwrite_compname,
'DECL_psnode;mode:',MRUSURCOMwrite_compname,'DECL_Surfrulemode);');
writeln(rulesenv1,'   EXTERNAL;');
writeln(rulesenv1,' PROCEDURE ',MRUSURCOMwrite_compname,'RULES_init;');
writeln(rulesenv1,'   EXTERNAL;')
end;

