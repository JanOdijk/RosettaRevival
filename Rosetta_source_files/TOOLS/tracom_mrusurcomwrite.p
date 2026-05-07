export(mrusurcomwrite);
pragma c_include('mrusurcomwrite.pf');
pragma c_include('mrusurcomdecl.pf');
pragma c_include('string.pf');
program mrusurcomwrite;
with strng,mrusurcomdecl;
      function mrusurcomwrite_compname:string;
 VAR filestr:STRING_string;
begin
filestr:='tracom';
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



writeln(of1,'LANGVERSION__language              :TSTRING_string');
write(of1,';');


writeln(of1,'RULESTRANS__pairsets              :tracomlangspec_setofpairsets');
write(of1,';');
writeln(of1,'RULESTRANS__anfile              :LOCALFILE');
write(of1,';');
writeln(of1,'RULESTRANS__intequals              :LOCALFILE');
write(of1,';');
writeln(of1,'RULESTRANS__genfile              :LOCALFILE');
write(of1,';');


writeln(of1,'RULETRANS__pairsets              :tracomlangspec_setofpairsets');
write(of1,';');
writeln(of1,'RULETRANS__leftnumcodes              :tracomlangspec_setofnumcodes');
write(of1,';');
writeln(of1,'RULETRANS__intequals              :LOCALFILE');
write(of1,';');
writeln(of1,'RULETRANS__rightnumcodes              :tracomlangspec_setofnumcodes');
write(of1,';');








writeln(of1,'ANDCOND__rulenumber              :tracomlangspec_int');
write(of1,';');
writeln(of1,'ANDCOND__copy              :LOCALFILE');
write(of1,';');
writeln(of1,'ANDCOND__intequals              :LOCALFILE');
write(of1,';');
writeln(of1,'ANDCOND__simple              :tracomlangspec_simple');
write(of1,';');


writeln(of1,'ORCOND__rulenumber              :tracomlangspec_int');
write(of1,';');
writeln(of1,'ORCOND__copy              :LOCALFILE');
write(of1,';');
writeln(of1,'ORCOND__intequals              :LOCALFILE');
write(of1,';');
writeln(of1,'ORCOND__simple              :tracomlangspec_simple');
write(of1,';');


writeln(of1,'ELEMENTARYCOND__rulenumber              :tracomlangspec_int');
write(of1,';');
writeln(of1,'ELEMENTARYCOND__copy              :LOCALFILE');
write(of1,';');
writeln(of1,'ELEMENTARYCOND__simple              :tracomlangspec_simple');
write(of1,';');
writeln(of1,'ELEMENTARYCOND__intequals              :LOCALFILE');
write(of1,';');


writeln(of1,'PASCALEXPR__rulenumber              :tracomlangspec_int');
write(of1,';');
writeln(of1,'PASCALEXPR__copy              :LOCALFILE');
write(of1,';');
writeln(of1,'PASCALEXPR__intequals              :LOCALFILE');
write(of1,';');
writeln(of1,'PASCALEXPR__simple              :tracomlangspec_simple');
write(of1,';');












writeln(of1,'SETVALUENAME__copy              :LOCALFILE');
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

write(of1,';');
writeln(of1,'var LANGVERSION_language              :TSTRING_string');

end
;if catname = 'RULESTRANS' then begin 

write(of1,';');
writeln(of1,'RULESTRANS_pairsets              :tracomlangspec_setofpairsets');

write(of1,';');
writeln(of1,'var RULESTRANS_anfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var RULESTRANS_intequals              :LOCALFILE');

write(of1,';');
writeln(of1,'var RULESTRANS_genfile              :LOCALFILE');

end
;if catname = 'RULETRANS' then begin 

write(of1,';');
writeln(of1,'RULETRANS_pairsets              :tracomlangspec_setofpairsets');

write(of1,';');
writeln(of1,'var RULETRANS_leftnumcodes              :tracomlangspec_setofnumcodes');

write(of1,';');
writeln(of1,'var RULETRANS_intequals              :LOCALFILE');

write(of1,';');
writeln(of1,'var RULETRANS_rightnumcodes              :tracomlangspec_setofnumcodes');

end
;if catname = 'PARAMETERSTRANS' then begin 



end
;if catname = 'PARAMETERTRANS' then begin 



end
;if catname = 'ELEMENTTRANS' then begin 



end
;if catname = 'ANDCOND' then begin 

write(of1,';');
writeln(of1,'ANDCOND_rulenumber              :tracomlangspec_int');

write(of1,';');
writeln(of1,'var ANDCOND_copy              :LOCALFILE');

write(of1,';');
writeln(of1,'var ANDCOND_intequals              :LOCALFILE');

write(of1,';');
writeln(of1,'var ANDCOND_simple              :tracomlangspec_simple');

end
;if catname = 'ORCOND' then begin 

write(of1,';');
writeln(of1,'ORCOND_rulenumber              :tracomlangspec_int');

write(of1,';');
writeln(of1,'var ORCOND_copy              :LOCALFILE');

write(of1,';');
writeln(of1,'var ORCOND_intequals              :LOCALFILE');

write(of1,';');
writeln(of1,'var ORCOND_simple              :tracomlangspec_simple');

end
;if catname = 'ELEMENTARYCOND' then begin 

write(of1,';');
writeln(of1,'ELEMENTARYCOND_rulenumber              :tracomlangspec_int');

write(of1,';');
writeln(of1,'var ELEMENTARYCOND_copy              :LOCALFILE');

write(of1,';');
writeln(of1,'var ELEMENTARYCOND_simple              :tracomlangspec_simple');

write(of1,';');
writeln(of1,'var ELEMENTARYCOND_intequals              :LOCALFILE');

end
;if catname = 'PASCALEXPR' then begin 

write(of1,';');
writeln(of1,'PASCALEXPR_rulenumber              :tracomlangspec_int');

write(of1,';');
writeln(of1,'var PASCALEXPR_copy              :LOCALFILE');

write(of1,';');
writeln(of1,'var PASCALEXPR_intequals              :LOCALFILE');

write(of1,';');
writeln(of1,'var PASCALEXPR_simple              :tracomlangspec_simple');

end
;if catname = 'VALUENAME' then begin 



end
;if catname = 'PARAMNAME' then begin 



end
;if catname = 'TYPENAME' then begin 



end
;if catname = 'MRULENAME' then begin 



end
;if catname = 'ILRULENAME' then begin 



end
;if catname = 'SETVALUENAME' then begin 

write(of1,';');
writeln(of1,'var SETVALUENAME_copy              :LOCALFILE');

end
end;
     procedure mrusurcomwrite_callist(catname:string;
    var of1:text);
begin
if catname = 'UTT' then begin 

end
;;if catname = 'LANGVERSION' then begin 
write(of1,',');writeln(of1,'LANGVERSION__language');

end
;;if catname = 'RULESTRANS' then begin 
write(of1,',');writeln(of1,'RULESTRANS__pairsets');

write(of1,',');
writeln(of1,'RULESTRANS__anfile');

write(of1,',');
writeln(of1,'RULESTRANS__intequals');

write(of1,',');
writeln(of1,'RULESTRANS__genfile');

end
;;if catname = 'RULETRANS' then begin 
write(of1,',');writeln(of1,'RULETRANS__pairsets');

write(of1,',');
writeln(of1,'RULETRANS__leftnumcodes');

write(of1,',');
writeln(of1,'RULETRANS__intequals');

write(of1,',');
writeln(of1,'RULETRANS__rightnumcodes');

end
;;if catname = 'PARAMETERSTRANS' then begin 

end
;;if catname = 'PARAMETERTRANS' then begin 

end
;;if catname = 'ELEMENTTRANS' then begin 

end
;;if catname = 'ANDCOND' then begin 
write(of1,',');writeln(of1,'ANDCOND__rulenumber');

write(of1,',');
writeln(of1,'ANDCOND__copy');

write(of1,',');
writeln(of1,'ANDCOND__intequals');

write(of1,',');
writeln(of1,'ANDCOND__simple');

end
;;if catname = 'ORCOND' then begin 
write(of1,',');writeln(of1,'ORCOND__rulenumber');

write(of1,',');
writeln(of1,'ORCOND__copy');

write(of1,',');
writeln(of1,'ORCOND__intequals');

write(of1,',');
writeln(of1,'ORCOND__simple');

end
;;if catname = 'ELEMENTARYCOND' then begin 
write(of1,',');writeln(of1,'ELEMENTARYCOND__rulenumber');

write(of1,',');
writeln(of1,'ELEMENTARYCOND__copy');

write(of1,',');
writeln(of1,'ELEMENTARYCOND__simple');

write(of1,',');
writeln(of1,'ELEMENTARYCOND__intequals');

end
;;if catname = 'PASCALEXPR' then begin 
write(of1,',');writeln(of1,'PASCALEXPR__rulenumber');

write(of1,',');
writeln(of1,'PASCALEXPR__copy');

write(of1,',');
writeln(of1,'PASCALEXPR__intequals');

write(of1,',');
writeln(of1,'PASCALEXPR__simple');

end
;;if catname = 'VALUENAME' then begin 

end
;;if catname = 'PARAMNAME' then begin 

end
;;if catname = 'TYPENAME' then begin 

end
;;if catname = 'MRULENAME' then begin 

end
;;if catname = 'ILRULENAME' then begin 

end
;;if catname = 'SETVALUENAME' then begin 
write(of1,',');writeln(of1,'SETVALUENAME__copy');

end
;end;
