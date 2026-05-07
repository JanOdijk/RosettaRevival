export(mrusurcomwrite);
pragma c_include('mrusurcomwrite.pf');
pragma c_include('mrusurcomdecl.pf');
pragma c_include('string.pf');
program mrusurcomwrite;
with strng,mrusurcomdecl;
      function mrusurcomwrite_compname:string;
 VAR filestr:STRING_string;
begin
filestr:='ilacom';
STRING_LowerCase(filestr,filestr);
mrusurcomwrite_compname:=filestr;
end;
     procedure mrusurcomwrite_init(
    var of1:text);
begin
writeln(of1,'initsetoftypespecs(TYPEStable);');
writeln(of1,'initsetofrulespecs(RULEStable);');
end;
     procedure mrusurcomwrite_tables(
    var of1:text);
begin
writeln(of1,'TYPEStable              :ilacomlangspec_setoftypespecs;');
writeln(of1,'RULEStable              :ilacomlangspec_setofrulespecs;');
end;
     procedure mrusurcomwrite_inhsynatts(
    var of1:text);
begin













writeln(of1,'TYPESPEC__parametertypes              :LOCALFILE');
write(of1,';');
writeln(of1,'TYPESPEC__converttypes              :LOCALFILE');
write(of1,';');


writeln(of1,'TYPEDEFINITION__parametertypes              :LOCALFILE');
write(of1,';');
writeln(of1,'TYPEDEFINITION__converttypes              :LOCALFILE');
write(of1,';');


writeln(of1,'ENUMDEF__parametertype              :LOCALFILE');
write(of1,';');
writeln(of1,'ENUMDEF__converttype              :LOCALFILE');
write(of1,';');


writeln(of1,'SUBRANGEDEF__parametertype              :LOCALFILE');
write(of1,';');
writeln(of1,'SUBRANGEDEF__converttype              :LOCALFILE');
write(of1,';');


writeln(of1,'INTEGERDEF__parametertype              :LOCALFILE');
write(of1,';');
writeln(of1,'INTEGERDEF__converttype              :LOCALFILE');
write(of1,';');


writeln(of1,'BOOLEANDEF__parametertype              :LOCALFILE');
write(of1,';');
writeln(of1,'BOOLEANDEF__converttype              :LOCALFILE');
write(of1,';');


writeln(of1,'SETDEF__parametertype              :LOCALFILE');
write(of1,';');
writeln(of1,'SETDEF__converttype              :LOCALFILE');
write(of1,';');

writeln(of1,'of1:files_text;');
writeln(of1,'of2:files_text;');
end;
     procedure mrusurcomwrite_heading(catname:string;
    var of1:text);
begin
if catname = 'UTT' then begin 



end
;if catname = 'LANGVERSION' then begin 



end
;if catname = 'ILRULESspec' then begin 



end
;if catname = 'ILRULE' then begin 



end
;if catname = 'PARAMname' then begin 



end
;if catname = 'TYPEname' then begin 



end
;if catname = 'TYPESPEC' then begin 

write(of1,';');
writeln(of1,'var TYPESPEC_parametertypes              :LOCALFILE');

write(of1,';');
writeln(of1,'var TYPESPEC_converttypes              :LOCALFILE');

end
;if catname = 'TYPEDEFINITION' then begin 

write(of1,';');
writeln(of1,'var TYPEDEFINITION_parametertypes              :LOCALFILE');

write(of1,';');
writeln(of1,'var TYPEDEFINITION_converttypes              :LOCALFILE');

end
;if catname = 'ENUMDEF' then begin 

write(of1,';');
writeln(of1,'var ENUMDEF_parametertype              :LOCALFILE');

write(of1,';');
writeln(of1,'var ENUMDEF_converttype              :LOCALFILE');

end
;if catname = 'SUBRANGEDEF' then begin 

write(of1,';');
writeln(of1,'var SUBRANGEDEF_parametertype              :LOCALFILE');

write(of1,';');
writeln(of1,'var SUBRANGEDEF_converttype              :LOCALFILE');

end
;if catname = 'INTEGERDEF' then begin 

write(of1,';');
writeln(of1,'var INTEGERDEF_parametertype              :LOCALFILE');

write(of1,';');
writeln(of1,'var INTEGERDEF_converttype              :LOCALFILE');

end
;if catname = 'BOOLEANDEF' then begin 

write(of1,';');
writeln(of1,'var BOOLEANDEF_parametertype              :LOCALFILE');

write(of1,';');
writeln(of1,'var BOOLEANDEF_converttype              :LOCALFILE');

end
;if catname = 'SETDEF' then begin 

write(of1,';');
writeln(of1,'var SETDEF_parametertype              :LOCALFILE');

write(of1,';');
writeln(of1,'var SETDEF_converttype              :LOCALFILE');

end
end;
     procedure mrusurcomwrite_callist(catname:string;
    var of1:text);
begin
if catname = 'UTT' then begin 

end
;;if catname = 'LANGVERSION' then begin 

end
;;if catname = 'ILRULESspec' then begin 

end
;;if catname = 'ILRULE' then begin 

end
;;if catname = 'PARAMname' then begin 

end
;;if catname = 'TYPEname' then begin 

end
;;if catname = 'TYPESPEC' then begin 
write(of1,',');writeln(of1,'TYPESPEC__parametertypes');

write(of1,',');
writeln(of1,'TYPESPEC__converttypes');

end
;;if catname = 'TYPEDEFINITION' then begin 
write(of1,',');writeln(of1,'TYPEDEFINITION__parametertypes');

write(of1,',');
writeln(of1,'TYPEDEFINITION__converttypes');

end
;;if catname = 'ENUMDEF' then begin 
write(of1,',');writeln(of1,'ENUMDEF__parametertype');

write(of1,',');
writeln(of1,'ENUMDEF__converttype');

end
;;if catname = 'SUBRANGEDEF' then begin 
write(of1,',');writeln(of1,'SUBRANGEDEF__parametertype');

write(of1,',');
writeln(of1,'SUBRANGEDEF__converttype');

end
;;if catname = 'INTEGERDEF' then begin 
write(of1,',');writeln(of1,'INTEGERDEF__parametertype');

write(of1,',');
writeln(of1,'INTEGERDEF__converttype');

end
;;if catname = 'BOOLEANDEF' then begin 
write(of1,',');writeln(of1,'BOOLEANDEF__parametertype');

write(of1,',');
writeln(of1,'BOOLEANDEF__converttype');

end
;;if catname = 'SETDEF' then begin 
write(of1,',');writeln(of1,'SETDEF__parametertype');

write(of1,',');
writeln(of1,'SETDEF__converttype');

end
;end;
