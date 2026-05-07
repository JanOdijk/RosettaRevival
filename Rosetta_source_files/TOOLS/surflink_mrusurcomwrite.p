export(mrusurcomwrite);
pragma c_include('mrusurcomwrite.pf');
pragma c_include('mrusurcomdecl.pf');
pragma c_include('string.pf');
program mrusurcomwrite;
with strng,mrusurcomdecl;
      function mrusurcomwrite_compname:string;
 VAR filestr:STRING_string;
begin
filestr:='surflink';
STRING_LowerCase(filestr,filestr);
mrusurcomwrite_compname:=filestr;
end;
     procedure mrusurcomwrite_init(
    var of1:text);
begin
end;
     procedure mrusurcomwrite_tables(
    var of1:text);
begin
end;
     procedure mrusurcomwrite_inhsynatts(
    var of1:text);
begin





writeln(of1,'RULEBODY__rulename              :TSTRING_string');
write(of1,';');












writeln(of1,'GRAPH__iteration              :surflinklangspec_int');
write(of1,';');
writeln(of1,'GRAPH__shorthands              :surflinklangspec_setofshds');
write(of1,';');
writeln(of1,'GRAPH__nodebefore              :surflinklangspec_int');
write(of1,';');
writeln(of1,'GRAPH__nodeafter              :surflinklangspec_int');
write(of1,';');
writeln(of1,'GRAPH__possempty              :surflinklangspec_bool');
write(of1,';');
writeln(of1,'GRAPH__basestate              :surflinklangspec_int');
write(of1,';');


writeln(of1,'CONCGRAPH__iteration              :surflinklangspec_int');
write(of1,';');
writeln(of1,'CONCGRAPH__shorthands              :surflinklangspec_setofshds');
write(of1,';');
writeln(of1,'CONCGRAPH__nodebefore              :surflinklangspec_int');
write(of1,';');
writeln(of1,'CONCGRAPH__nodeafter              :surflinklangspec_int');
write(of1,';');
writeln(of1,'CONCGRAPH__possempty              :surflinklangspec_bool');
write(of1,';');
writeln(of1,'CONCGRAPH__basestate              :surflinklangspec_int');
write(of1,';');


writeln(of1,'ELEMGRAPH__iteration              :surflinklangspec_int');
write(of1,';');
writeln(of1,'ELEMGRAPH__shorthands              :surflinklangspec_setofshds');
write(of1,';');
writeln(of1,'ELEMGRAPH__nodebefore              :surflinklangspec_int');
write(of1,';');
writeln(of1,'ELEMGRAPH__nodeafter              :surflinklangspec_int');
write(of1,';');
writeln(of1,'ELEMGRAPH__possempty              :surflinklangspec_bool');
write(of1,';');
writeln(of1,'ELEMGRAPH__basestate              :surflinklangspec_int');
write(of1,';');




writeln(of1,'PARAMS__procpars              :LOCALFILE');
write(of1,';');



writeln(of1,'procspas:files_text;');
writeln(of1,'parsenv:files_text;');
writeln(of1,'ascentenv:files_text;');
writeln(of1,'ascentpas1:files_text;');
writeln(of1,'switchpas:files_text;');
writeln(of1,'ascentpas2:files_text;');
writeln(of1,'ascentpas3:files_text;');
writeln(of1,'ascentpas4:files_text;');
writeln(of1,'ascentpas5:files_text;');
end;
     procedure mrusurcomwrite_heading(catname:string;
    var of1:text);
begin
if catname = 'UTT' then begin 



end
;if catname = 'RULESPEC' then begin 



end
;if catname = 'RULEBODY' then begin 

write(of1,';');
writeln(of1,'RULEBODY_rulename              :TSTRING_string');

end
;if catname = 'BLOCK' then begin 



end
;if catname = 'PASCALTOHEKJE' then begin 



end
;if catname = 'PASCALTOGLOBAL' then begin 



end
;if catname = 'PASCALTOEND' then begin 



end
;if catname = 'PSTOSTARRIGHT' then begin 



end
;if catname = 'GRAPH' then begin 

write(of1,';');
writeln(of1,'GRAPH_iteration              :surflinklangspec_int');

write(of1,';');
writeln(of1,'GRAPH_shorthands              :surflinklangspec_setofshds');

write(of1,';');
writeln(of1,'GRAPH_nodebefore              :surflinklangspec_int');

write(of1,';');
writeln(of1,'GRAPH_nodeafter              :surflinklangspec_int');

write(of1,';');
writeln(of1,'var GRAPH_possempty              :surflinklangspec_bool');

write(of1,';');
writeln(of1,'var GRAPH_basestate              :surflinklangspec_int');

end
;if catname = 'CONCGRAPH' then begin 

write(of1,';');
writeln(of1,'CONCGRAPH_iteration              :surflinklangspec_int');

write(of1,';');
writeln(of1,'CONCGRAPH_shorthands              :surflinklangspec_setofshds');

write(of1,';');
writeln(of1,'CONCGRAPH_nodebefore              :surflinklangspec_int');

write(of1,';');
writeln(of1,'CONCGRAPH_nodeafter              :surflinklangspec_int');

write(of1,';');
writeln(of1,'var CONCGRAPH_possempty              :surflinklangspec_bool');

write(of1,';');
writeln(of1,'var CONCGRAPH_basestate              :surflinklangspec_int');

end
;if catname = 'ELEMGRAPH' then begin 

write(of1,';');
writeln(of1,'ELEMGRAPH_iteration              :surflinklangspec_int');

write(of1,';');
writeln(of1,'ELEMGRAPH_shorthands              :surflinklangspec_setofshds');

write(of1,';');
writeln(of1,'ELEMGRAPH_nodebefore              :surflinklangspec_int');

write(of1,';');
writeln(of1,'ELEMGRAPH_nodeafter              :surflinklangspec_int');

write(of1,';');
writeln(of1,'var ELEMGRAPH_possempty              :surflinklangspec_bool');

write(of1,';');
writeln(of1,'var ELEMGRAPH_basestate              :surflinklangspec_int');

end
;if catname = 'NUMBER' then begin 



end
;if catname = 'PARAMS' then begin 

write(of1,';');
writeln(of1,'var PARAMS_procpars              :LOCALFILE');

end
;if catname = 'PASCAL' then begin 



end
end;
     procedure mrusurcomwrite_callist(catname:string;
    var of1:text);
begin
if catname = 'UTT' then begin 

end
;;if catname = 'RULESPEC' then begin 

end
;;if catname = 'RULEBODY' then begin 
write(of1,',');writeln(of1,'RULEBODY__rulename');

end
;;if catname = 'BLOCK' then begin 

end
;;if catname = 'PASCALTOHEKJE' then begin 

end
;;if catname = 'PASCALTOGLOBAL' then begin 

end
;;if catname = 'PASCALTOEND' then begin 

end
;;if catname = 'PSTOSTARRIGHT' then begin 

end
;;if catname = 'GRAPH' then begin 
write(of1,',');writeln(of1,'GRAPH__iteration');

write(of1,',');
writeln(of1,'GRAPH__shorthands');

write(of1,',');
writeln(of1,'GRAPH__nodebefore');

write(of1,',');
writeln(of1,'GRAPH__nodeafter');

write(of1,',');
writeln(of1,'GRAPH__possempty');

write(of1,',');
writeln(of1,'GRAPH__basestate');

end
;;if catname = 'CONCGRAPH' then begin 
write(of1,',');writeln(of1,'CONCGRAPH__iteration');

write(of1,',');
writeln(of1,'CONCGRAPH__shorthands');

write(of1,',');
writeln(of1,'CONCGRAPH__nodebefore');

write(of1,',');
writeln(of1,'CONCGRAPH__nodeafter');

write(of1,',');
writeln(of1,'CONCGRAPH__possempty');

write(of1,',');
writeln(of1,'CONCGRAPH__basestate');

end
;;if catname = 'ELEMGRAPH' then begin 
write(of1,',');writeln(of1,'ELEMGRAPH__iteration');

write(of1,',');
writeln(of1,'ELEMGRAPH__shorthands');

write(of1,',');
writeln(of1,'ELEMGRAPH__nodebefore');

write(of1,',');
writeln(of1,'ELEMGRAPH__nodeafter');

write(of1,',');
writeln(of1,'ELEMGRAPH__possempty');

write(of1,',');
writeln(of1,'ELEMGRAPH__basestate');

end
;;if catname = 'NUMBER' then begin 

end
;;if catname = 'PARAMS' then begin 
write(of1,',');writeln(of1,'PARAMS__procpars');

end
;;if catname = 'PASCAL' then begin 

end
;end;
