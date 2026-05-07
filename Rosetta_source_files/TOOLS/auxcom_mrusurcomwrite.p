export(mrusurcomwrite);
pragma c_include('mrusurcomwrite.pf');
pragma c_include('mrusurcomdecl.pf');
pragma c_include('string.pf');
program mrusurcomwrite;
with strng,mrusurcomdecl;
      function mrusurcomwrite_compname:string;
 VAR filestr:STRING_string;
begin
filestr:='auxcom';
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







writeln(of1,'ARGUMENTS__keyrec              :auxcomlangspec_KEY');
write(of1,';');
writeln(of1,'ARGUMENTS__maxstringlength              :auxcomlangspec_int');
write(of1,';');


writeln(of1,'ARGLIST__numb              :TSTRING_string');
write(of1,';');


writeln(of1,'NUMBER__numb              :TSTRING_string');
write(of1,';');


writeln(of1,'TERMARGUMENT__term              :TSTRING_string');
write(of1,';');


writeln(of1,'PUNCTUATION__punct              :auxcomlangspec_leesteken');
write(of1,';');






writeln(of1,'TYPESECTION__typeId              :TSTRING_string');
write(of1,';');


writeln(of1,'FIELDLIST__recassign              :LOCALFILE');
write(of1,';');


writeln(of1,'FIELDVALUE__fieldId              :TSTRING_string');
write(of1,';');
writeln(of1,'FIELDVALUE__NumberOfFieldsInh              :auxcomlangspec_INT');
write(of1,';');
writeln(of1,'FIELDVALUE__NumberOfFieldsSyn              :auxcomlangspec_INT');
write(of1,';');
writeln(of1,'FIELDVALUE__recassign              :LOCALFILE');
write(of1,';');






writeln(of1,'ABBRLIST__NumOfAbbrsInh              :auxcomlangspec_INT');
write(of1,';');
writeln(of1,'ABBRLIST__NumOfAbbrsSyn              :auxcomlangspec_INT');
write(of1,';');


writeln(of1,'NUMABBRS__NumOfAbbrsInh              :auxcomlangspec_INT');
write(of1,';');
writeln(of1,'NUMABBRS__NumOfAbbrsSyn              :auxcomlangspec_INT');
write(of1,';');

writeln(of1,'of1:files_text;');
writeln(of1,'of2:files_text;');
writeln(of1,'of3:files_text;');
end;
     procedure mrusurcomwrite_heading(catname:string;
    var of1:text);
begin
if catname = 'UTT' then begin 



end
;if catname = 'LANGVERSION' then begin 



end
;if catname = 'KEYSECTION' then begin 



end
;if catname = 'ARGUMENTS' then begin 

write(of1,';');
writeln(of1,'var ARGUMENTS_keyrec              :auxcomlangspec_KEY');

write(of1,';');
writeln(of1,'var ARGUMENTS_maxstringlength              :auxcomlangspec_int');

end
;if catname = 'ARGLIST' then begin 

write(of1,';');
writeln(of1,'var ARGLIST_numb              :TSTRING_string');

end
;if catname = 'NUMBER' then begin 

write(of1,';');
writeln(of1,'var NUMBER_numb              :TSTRING_string');

end
;if catname = 'TERMARGUMENT' then begin 

write(of1,';');
writeln(of1,'var TERMARGUMENT_term              :TSTRING_string');

end
;if catname = 'PUNCTUATION' then begin 

write(of1,';');
writeln(of1,'var PUNCTUATION_punct              :auxcomlangspec_leesteken');

end
;if catname = 'RECSECTION' then begin 



end
;if catname = 'NUMRECORDS' then begin 



end
;if catname = 'TYPESECTION' then begin 

write(of1,';');
writeln(of1,'var TYPESECTION_typeId              :TSTRING_string');

end
;if catname = 'FIELDLIST' then begin 

write(of1,';');
writeln(of1,'var FIELDLIST_recassign              :LOCALFILE');

end
;if catname = 'FIELDVALUE' then begin 

write(of1,';');
writeln(of1,'FIELDVALUE_fieldId              :TSTRING_string');

write(of1,';');
writeln(of1,'FIELDVALUE_NumberOfFieldsInh              :auxcomlangspec_INT');

write(of1,';');
writeln(of1,'var FIELDVALUE_NumberOfFieldsSyn              :auxcomlangspec_INT');

write(of1,';');
writeln(of1,'var FIELDVALUE_recassign              :LOCALFILE');

end
;if catname = 'VARCATSECTION' then begin 



end
;if catname = 'ABBRSECTION' then begin 



end
;if catname = 'ABBRLIST' then begin 

write(of1,';');
writeln(of1,'ABBRLIST_NumOfAbbrsInh              :auxcomlangspec_INT');

write(of1,';');
writeln(of1,'var ABBRLIST_NumOfAbbrsSyn              :auxcomlangspec_INT');

end
;if catname = 'NUMABBRS' then begin 

write(of1,';');
writeln(of1,'NUMABBRS_NumOfAbbrsInh              :auxcomlangspec_INT');

write(of1,';');
writeln(of1,'var NUMABBRS_NumOfAbbrsSyn              :auxcomlangspec_INT');

end
end;
     procedure mrusurcomwrite_callist(catname:string;
    var of1:text);
begin
if catname = 'UTT' then begin 

end
;;if catname = 'LANGVERSION' then begin 

end
;;if catname = 'KEYSECTION' then begin 

end
;;if catname = 'ARGUMENTS' then begin 
write(of1,',');writeln(of1,'ARGUMENTS__keyrec');

write(of1,',');
writeln(of1,'ARGUMENTS__maxstringlength');

end
;;if catname = 'ARGLIST' then begin 
write(of1,',');writeln(of1,'ARGLIST__numb');

end
;;if catname = 'NUMBER' then begin 
write(of1,',');writeln(of1,'NUMBER__numb');

end
;;if catname = 'TERMARGUMENT' then begin 
write(of1,',');writeln(of1,'TERMARGUMENT__term');

end
;;if catname = 'PUNCTUATION' then begin 
write(of1,',');writeln(of1,'PUNCTUATION__punct');

end
;;if catname = 'RECSECTION' then begin 

end
;;if catname = 'NUMRECORDS' then begin 

end
;;if catname = 'TYPESECTION' then begin 
write(of1,',');writeln(of1,'TYPESECTION__typeId');

end
;;if catname = 'FIELDLIST' then begin 
write(of1,',');writeln(of1,'FIELDLIST__recassign');

end
;;if catname = 'FIELDVALUE' then begin 
write(of1,',');writeln(of1,'FIELDVALUE__fieldId');

write(of1,',');
writeln(of1,'FIELDVALUE__NumberOfFieldsInh');

write(of1,',');
writeln(of1,'FIELDVALUE__NumberOfFieldsSyn');

write(of1,',');
writeln(of1,'FIELDVALUE__recassign');

end
;;if catname = 'VARCATSECTION' then begin 

end
;;if catname = 'ABBRSECTION' then begin 

end
;;if catname = 'ABBRLIST' then begin 
write(of1,',');writeln(of1,'ABBRLIST__NumOfAbbrsInh');

write(of1,',');
writeln(of1,'ABBRLIST__NumOfAbbrsSyn');

end
;;if catname = 'NUMABBRS' then begin 
write(of1,',');writeln(of1,'NUMABBRS__NumOfAbbrsInh');

write(of1,',');
writeln(of1,'NUMABBRS__NumOfAbbrsSyn');

end
;end;
