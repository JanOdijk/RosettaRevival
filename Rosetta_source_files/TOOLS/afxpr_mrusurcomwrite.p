export(mrusurcomwrite);
pragma c_include('mrusurcomwrite.pf');
pragma c_include('mrusurcomdecl.pf');
pragma c_include('string.pf');
program mrusurcomwrite;
with strng,mrusurcomdecl;
      function mrusurcomwrite_compname:string;
 VAR filestr:STRING_string;
begin
filestr:='afxpr';
STRING_LowerCase(filestr,filestr);
mrusurcomwrite_compname:=filestr;
end;
     procedure mrusurcomwrite_init(
    var of1:text);
begin
writeln(of1,'initint(afxid);');
end;
     procedure mrusurcomwrite_tables(
    var of1:text);
begin
writeln(of1,'afxid              :afxprlangspec_int;');
end;
     procedure mrusurcomwrite_inhsynatts(
    var of1:text);
begin

writeln(of1,'EXPR__Succ              :afxprlangspec_SETOFatomnodes');
write(of1,';');


writeln(of1,'LEAVE__Succ              :afxprlangspec_SETOFatomnodes');
write(of1,';');


writeln(of1,'ROUND__Succ              :afxprlangspec_SETOFatomnodes');
write(of1,';');


writeln(of1,'REP__Succ              :afxprlangspec_SETOFatomnodes');
write(of1,';');


writeln(of1,'LOR__Succ              :afxprlangspec_SETOFatomnodes');
write(of1,';');


writeln(of1,'LOPT__Succ              :afxprlangspec_SETOFatomnodes');
write(of1,';');


writeln(of1,'LAND__Succ              :afxprlangspec_SETOFatomnodes');
write(of1,';');



writeln(of1,'of1:files_text;');
end;
     procedure mrusurcomwrite_heading(catname:string;
    var of1:text);
begin
if catname = 'EXPR' then begin 

write(of1,';');
writeln(of1,'EXPR_Succ              :afxprlangspec_SETOFatomnodes');

end;
if catname = 'LEAVE' then begin 

write(of1,';');
writeln(of1,'LEAVE_Succ              :afxprlangspec_SETOFatomnodes');

end;
if catname = 'ROUND' then begin 

write(of1,';');
writeln(of1,'ROUND_Succ              :afxprlangspec_SETOFatomnodes');

end;
if catname = 'REP' then begin 

write(of1,';');
writeln(of1,'REP_Succ              :afxprlangspec_SETOFatomnodes');

end;
if catname = 'LOR' then begin 

write(of1,';');
writeln(of1,'LOR_Succ              :afxprlangspec_SETOFatomnodes');

end;
if catname = 'LOPT' then begin 

write(of1,';');
writeln(of1,'LOPT_Succ              :afxprlangspec_SETOFatomnodes');

end;
if catname = 'LAND' then begin 

write(of1,';');
writeln(of1,'LAND_Succ              :afxprlangspec_SETOFatomnodes');

end
;if catname = 'UTT' then begin 



end
end;
     procedure mrusurcomwrite_callist(catname:string;
    var of1:text);
begin
if catname = 'EXPR' then begin 
write(of1,',');writeln(of1,'EXPR__Succ');

end;
if catname = 'LEAVE' then begin 
write(of1,',');writeln(of1,'LEAVE__Succ');

end;
if catname = 'ROUND' then begin 
write(of1,',');writeln(of1,'ROUND__Succ');

end;
if catname = 'REP' then begin 
write(of1,',');writeln(of1,'REP__Succ');

end;
if catname = 'LOR' then begin 
write(of1,',');writeln(of1,'LOR__Succ');

end;
if catname = 'LOPT' then begin 
write(of1,',');writeln(of1,'LOPT__Succ');

end;
if catname = 'LAND' then begin 
write(of1,',');writeln(of1,'LAND__Succ');

end
;;if catname = 'UTT' then begin 

end
;end;
