export(mrusurcomwrite);
pragma c_include('mrusurcomwrite.pf');
pragma c_include('mrusurcomdecl.pf');
pragma c_include('string.pf');
program mrusurcomwrite;
with strng,mrusurcomdecl;
      function mrusurcomwrite_compname:string;
 VAR filestr:STRING_string;
begin
filestr:='surfcom';
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



writeln(of1,'RULESPEC__number              :surfcomlangspec_int');
write(of1,';');
writeln(of1,'RULESPEC__procpars              :LOCALFILE');
write(of1,';');
writeln(of1,'RULESPEC__blockenv              :LOCALFILE');
write(of1,';');
writeln(of1,'RULESPEC__blockpas              :LOCALFILE');
write(of1,';');


writeln(of1,'RULEBODY__number              :surfcomlangspec_int');
write(of1,';');
writeln(of1,'RULEBODY__rulename              :TSTRING_string');
write(of1,';');
writeln(of1,'RULEBODY__procpars              :LOCALFILE');
write(of1,';');
writeln(of1,'RULEBODY__blockenv              :LOCALFILE');
write(of1,';');
writeln(of1,'RULEBODY__blockpas              :LOCALFILE');
write(of1,';');


writeln(of1,'BLOCK__rulename              :TSTRING_string');
write(of1,';');
writeln(of1,'BLOCK__parameters              :surfcomlangspec_setofidents');
write(of1,';');
writeln(of1,'BLOCK__blockenv              :LOCALFILE');
write(of1,';');
writeln(of1,'BLOCK__blockpas              :LOCALFILE');
write(of1,';');


writeln(of1,'PASCALTOHEKJE__parameters              :surfcomlangspec_setofidents');
write(of1,';');
writeln(of1,'PASCALTOHEKJE__copy              :LOCALFILE');
write(of1,';');


writeln(of1,'PASCALTOGLOBAL__parameters              :surfcomlangspec_setofidents');
write(of1,';');
writeln(of1,'PASCALTOGLOBAL__copy              :LOCALFILE');
write(of1,';');


writeln(of1,'PASCALTOEND__parameters              :surfcomlangspec_setofidents');
write(of1,';');
writeln(of1,'PASCALTOEND__copy              :LOCALFILE');
write(of1,';');


writeln(of1,'PSTOSTARRIGHT__parameters              :surfcomlangspec_setofidents');
write(of1,';');
writeln(of1,'PSTOSTARRIGHT__copy              :LOCALFILE');
write(of1,';');






writeln(of1,'INITBLOCK__rulename              :TSTRING_string');
write(of1,';');
writeln(of1,'INITBLOCK__parameters              :surfcomlangspec_setofidents');
write(of1,';');
writeln(of1,'INITBLOCK__blockenv              :LOCALFILE');
write(of1,';');
writeln(of1,'INITBLOCK__blockpas              :LOCALFILE');
write(of1,';');


writeln(of1,'FINALBLOCK__rulename              :TSTRING_string');
write(of1,';');
writeln(of1,'FINALBLOCK__parameters              :surfcomlangspec_setofidents');
write(of1,';');
writeln(of1,'FINALBLOCK__blockenv              :LOCALFILE');
write(of1,';');
writeln(of1,'FINALBLOCK__blockpas              :LOCALFILE');
write(of1,';');

writeln(of1,'blocksenv:files_text;');
writeln(of1,'blockspas:files_text;');
writeln(of1,'RTNfile:files_text;');
end;
     procedure mrusurcomwrite_heading(catname:string;
    var of1:text);
begin
if catname = 'UTT' then begin 



end
;if catname = 'RULESPEC' then begin 

write(of1,';');
writeln(of1,'RULESPEC_number              :surfcomlangspec_int');

write(of1,';');
writeln(of1,'var RULESPEC_procpars              :LOCALFILE');

write(of1,';');
writeln(of1,'var RULESPEC_blockenv              :LOCALFILE');

write(of1,';');
writeln(of1,'var RULESPEC_blockpas              :LOCALFILE');

end
;if catname = 'RULEBODY' then begin 

write(of1,';');
writeln(of1,'RULEBODY_number              :surfcomlangspec_int');

write(of1,';');
writeln(of1,'RULEBODY_rulename              :TSTRING_string');

write(of1,';');
writeln(of1,'var RULEBODY_procpars              :LOCALFILE');

write(of1,';');
writeln(of1,'var RULEBODY_blockenv              :LOCALFILE');

write(of1,';');
writeln(of1,'var RULEBODY_blockpas              :LOCALFILE');

end
;if catname = 'BLOCK' then begin 

write(of1,';');
writeln(of1,'BLOCK_rulename              :TSTRING_string');

write(of1,';');
writeln(of1,'BLOCK_parameters              :surfcomlangspec_setofidents');

write(of1,';');
writeln(of1,'var BLOCK_blockenv              :LOCALFILE');

write(of1,';');
writeln(of1,'var BLOCK_blockpas              :LOCALFILE');

end
;if catname = 'PASCALTOHEKJE' then begin 

write(of1,';');
writeln(of1,'PASCALTOHEKJE_parameters              :surfcomlangspec_setofidents');

write(of1,';');
writeln(of1,'var PASCALTOHEKJE_copy              :LOCALFILE');

end
;if catname = 'PASCALTOGLOBAL' then begin 

write(of1,';');
writeln(of1,'PASCALTOGLOBAL_parameters              :surfcomlangspec_setofidents');

write(of1,';');
writeln(of1,'var PASCALTOGLOBAL_copy              :LOCALFILE');

end
;if catname = 'PASCALTOEND' then begin 

write(of1,';');
writeln(of1,'PASCALTOEND_parameters              :surfcomlangspec_setofidents');

write(of1,';');
writeln(of1,'var PASCALTOEND_copy              :LOCALFILE');

end
;if catname = 'PSTOSTARRIGHT' then begin 

write(of1,';');
writeln(of1,'PSTOSTARRIGHT_parameters              :surfcomlangspec_setofidents');

write(of1,';');
writeln(of1,'var PSTOSTARRIGHT_copy              :LOCALFILE');

end
;if catname = 'GRAPH' then begin 



end
;if catname = 'NUMBER' then begin 



end
;if catname = 'INITBLOCK' then begin 

write(of1,';');
writeln(of1,'INITBLOCK_rulename              :TSTRING_string');

write(of1,';');
writeln(of1,'INITBLOCK_parameters              :surfcomlangspec_setofidents');

write(of1,';');
writeln(of1,'var INITBLOCK_blockenv              :LOCALFILE');

write(of1,';');
writeln(of1,'var INITBLOCK_blockpas              :LOCALFILE');

end
;if catname = 'FINALBLOCK' then begin 

write(of1,';');
writeln(of1,'FINALBLOCK_rulename              :TSTRING_string');

write(of1,';');
writeln(of1,'FINALBLOCK_parameters              :surfcomlangspec_setofidents');

write(of1,';');
writeln(of1,'var FINALBLOCK_blockenv              :LOCALFILE');

write(of1,';');
writeln(of1,'var FINALBLOCK_blockpas              :LOCALFILE');

end
end;
     procedure mrusurcomwrite_callist(catname:string;
    var of1:text);
begin
if catname = 'UTT' then begin 

end
;;if catname = 'RULESPEC' then begin 
write(of1,',');writeln(of1,'RULESPEC__number');

write(of1,',');
writeln(of1,'RULESPEC__procpars');

write(of1,',');
writeln(of1,'RULESPEC__blockenv');

write(of1,',');
writeln(of1,'RULESPEC__blockpas');

end
;;if catname = 'RULEBODY' then begin 
write(of1,',');writeln(of1,'RULEBODY__number');

write(of1,',');
writeln(of1,'RULEBODY__rulename');

write(of1,',');
writeln(of1,'RULEBODY__procpars');

write(of1,',');
writeln(of1,'RULEBODY__blockenv');

write(of1,',');
writeln(of1,'RULEBODY__blockpas');

end
;;if catname = 'BLOCK' then begin 
write(of1,',');writeln(of1,'BLOCK__rulename');

write(of1,',');
writeln(of1,'BLOCK__parameters');

write(of1,',');
writeln(of1,'BLOCK__blockenv');

write(of1,',');
writeln(of1,'BLOCK__blockpas');

end
;;if catname = 'PASCALTOHEKJE' then begin 
write(of1,',');writeln(of1,'PASCALTOHEKJE__parameters');

write(of1,',');
writeln(of1,'PASCALTOHEKJE__copy');

end
;;if catname = 'PASCALTOGLOBAL' then begin 
write(of1,',');writeln(of1,'PASCALTOGLOBAL__parameters');

write(of1,',');
writeln(of1,'PASCALTOGLOBAL__copy');

end
;;if catname = 'PASCALTOEND' then begin 
write(of1,',');writeln(of1,'PASCALTOEND__parameters');

write(of1,',');
writeln(of1,'PASCALTOEND__copy');

end
;;if catname = 'PSTOSTARRIGHT' then begin 
write(of1,',');writeln(of1,'PSTOSTARRIGHT__parameters');

write(of1,',');
writeln(of1,'PSTOSTARRIGHT__copy');

end
;;if catname = 'GRAPH' then begin 

end
;;if catname = 'NUMBER' then begin 

end
;;if catname = 'INITBLOCK' then begin 
write(of1,',');writeln(of1,'INITBLOCK__rulename');

write(of1,',');
writeln(of1,'INITBLOCK__parameters');

write(of1,',');
writeln(of1,'INITBLOCK__blockenv');

write(of1,',');
writeln(of1,'INITBLOCK__blockpas');

end
;;if catname = 'FINALBLOCK' then begin 
write(of1,',');writeln(of1,'FINALBLOCK__rulename');

write(of1,',');
writeln(of1,'FINALBLOCK__parameters');

write(of1,',');
writeln(of1,'FINALBLOCK__blockenv');

write(of1,',');
writeln(of1,'FINALBLOCK__blockpas');

end
;end;
