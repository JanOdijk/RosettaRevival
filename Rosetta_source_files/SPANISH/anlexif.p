EXPORT(anlexif);
pragma C_include('anlexif.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('listree.pf');
pragma C_include('lidomaint.pf');
pragma C_include('mem.pf');
pragma C_include('comlexrules1.pf');
pragma C_include('comlexrules2.pf');
pragma C_include('comlexrules3.pf');
WITH anlexif;
PROGRAM ANLEXIF;
WITH lsdomaint,listree,lidomaint,mem,
comlexrules1,comlexrules2,comlexrules3;
CONST
     maxrnr=141;
     maxargs=2;
VAR licat:LIDOMAINT_syntcat;lscat:LSDOMAINT_syntcat;
   rulearray:ARRAY[1..maxrnr] OF ANLEXIF_ruleinfo;
   catarray:ARRAY[LIDOMAINT_syntcat] OF ANLEXIF_setofrules;

PROCEDURE MakePlosrule(VAR p:ANLEXIF_plosrule);
begin
MEM_NewDefault(LoopHoles.SIZEof(ANLEXIF_losrule),LoopHoles.Retype(p,Mem_Ptr));
end;
PROCEDURE initsetofrules(VAR S1:ANLEXIF_setofrules);
begin
S1.first:=nil;S1.last:=nil
end;
 FUNCTION ANLEXIF_stillrules(setofrules:ANLEXIF_setofrules):BOOLEAN;
begin
if setofrules.first<>nil then ANLEXIF_stillrules:=true
else ANLEXIF_stillrules:=false
end;
PROCEDURE appendrule(rule:ANLEXIF_lexruletype;VAR S1:ANLEXIF_setofrules);
VAR p:ANLEXIF_plosrule;
begin
makeplosrule(p);
p^.arg:=rule;
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
 PROCEDURE ANLEXIF_takerule(VAR rule:ANLEXIF_lexruletype;
                                       VAR setofRules:ANLEXIF_setofRules);
begin
if setofrules.first=nil then rule:=0
else
  begin
  rule:=setofrules.first^.arg;
  if setofrules.first=setofrules.last then
    begin
    setofrules.first:=nil;setofrules.last:=nil
    end
  else setofrules.first:=setofrules.first^.next
  end
end;
FUNCTION ANLEXIF_maxlexrulenr:INTEGER;
BEGIN
ANLEXIF_maxlexrulenr:=maxrnr
END;
FUNCTION ANLEXIF_maxargs:INTEGER;
BEGIN
ANLEXIF_maxargs:=maxargs
END;
 PROCEDURE ANLEXIF_init;
BEGIN
rulearray[1].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[1].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[1].cat[2]:=licat;;
rulearray[2].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[2].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[2].cat[2]:=licat;;
rulearray[3].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[3].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[3].cat[2]:=licat;;
rulearray[4].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[4].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[4].cat[2]:=licat;;
rulearray[5].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[5].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[5].cat[2]:=licat;;
rulearray[6].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[6].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[6].cat[2]:=licat;;
rulearray[7].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[7].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[7].cat[2]:=licat;;
rulearray[8].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[8].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[8].cat[2]:=licat;;
rulearray[9].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[9].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[9].cat[2]:=licat;;
rulearray[10].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[10].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[10].cat[2]:=licat;;
rulearray[11].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[11].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[11].cat[2]:=licat;;
rulearray[12].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[12].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[12].cat[2]:=licat;;
rulearray[13].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[13].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[13].cat[2]:=licat;;
rulearray[14].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[14].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[14].cat[2]:=licat;;
rulearray[15].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[15].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[15].cat[2]:=licat;;
rulearray[16].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[16].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[16].cat[2]:=licat;;
rulearray[17].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[17].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[17].cat[2]:=licat;;
rulearray[18].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[18].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[18].cat[2]:=licat;;
rulearray[19].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[19].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[19].cat[2]:=licat;;
rulearray[20].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[20].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[20].cat[2]:=licat;;
rulearray[21].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[21].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[21].cat[2]:=licat;;
rulearray[22].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[22].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[22].cat[2]:=licat;;
rulearray[23].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[23].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[23].cat[2]:=licat;;
rulearray[24].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[24].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[24].cat[2]:=licat;;
rulearray[25].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[25].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[25].cat[2]:=licat;;
rulearray[26].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[26].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[26].cat[2]:=licat;;
rulearray[27].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[27].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[27].cat[2]:=licat;;
rulearray[28].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[28].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[28].cat[2]:=licat;;
rulearray[29].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[29].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[29].cat[2]:=licat;;
rulearray[30].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[30].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[30].cat[2]:=licat;;
rulearray[31].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[31].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[31].cat[2]:=licat;;
rulearray[32].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[32].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[32].cat[2]:=licat;;
rulearray[33].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[33].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[33].cat[2]:=licat;;
rulearray[34].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[34].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[34].cat[2]:=licat;;
rulearray[35].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[35].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[35].cat[2]:=licat;;
rulearray[36].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[36].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[36].cat[2]:=licat;;
rulearray[37].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[37].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[37].cat[2]:=licat;;
rulearray[38].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[38].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[38].cat[2]:=licat;;
rulearray[39].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[39].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[39].cat[2]:=licat;;
rulearray[40].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[40].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[40].cat[2]:=licat;;
rulearray[41].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[41].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[41].cat[2]:=licat;;
rulearray[42].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[42].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[42].cat[2]:=licat;;
rulearray[43].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[43].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[43].cat[2]:=licat;;
rulearray[44].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[44].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[44].cat[2]:=licat;;
rulearray[45].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[45].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[45].cat[2]:=licat;;
rulearray[46].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[46].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[46].cat[2]:=licat;;
rulearray[47].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[47].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[47].cat[2]:=licat;;
rulearray[48].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[48].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[48].cat[2]:=licat;;
rulearray[49].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[49].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[49].cat[2]:=licat;;
rulearray[50].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[50].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[50].cat[2]:=licat;;
rulearray[51].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[51].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[51].cat[2]:=licat;;
rulearray[52].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[52].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[52].cat[2]:=licat;;
rulearray[53].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[53].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[53].cat[2]:=licat;;
rulearray[54].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[54].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[54].cat[2]:=licat;;
rulearray[55].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[55].cat[1]:=licat;;
rulearray[56].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[56].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[56].cat[2]:=licat;;
rulearray[57].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[57].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[57].cat[2]:=licat;;
rulearray[58].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[58].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[58].cat[2]:=licat;;
rulearray[59].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[59].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[59].cat[2]:=licat;;
rulearray[60].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[60].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[60].cat[2]:=licat;;
rulearray[61].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[61].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[61].cat[2]:=licat;;
rulearray[62].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[62].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[62].cat[2]:=licat;;
rulearray[63].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[63].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[63].cat[2]:=licat;;
rulearray[64].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[64].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[64].cat[2]:=licat;;
rulearray[65].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[65].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[65].cat[2]:=licat;;
rulearray[66].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[66].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[66].cat[2]:=licat;;
rulearray[67].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[67].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[67].cat[2]:=licat;;
rulearray[68].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[68].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[68].cat[2]:=licat;;
rulearray[69].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[69].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[69].cat[2]:=licat;;
rulearray[70].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[70].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[70].cat[2]:=licat;;
rulearray[71].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[71].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[71].cat[2]:=licat;;
rulearray[72].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[72].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[72].cat[2]:=licat;;
rulearray[73].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[73].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[73].cat[2]:=licat;;
rulearray[74].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[74].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[74].cat[2]:=licat;;
rulearray[75].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[75].cat[1]:=licat;;
rulearray[76].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[76].cat[1]:=licat;;
rulearray[77].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[77].cat[1]:=licat;;
rulearray[78].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[78].cat[1]:=licat;;
rulearray[79].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[79].cat[1]:=licat;;
rulearray[80].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[80].cat[1]:=licat;;
rulearray[81].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[81].cat[1]:=licat;;
rulearray[82].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[82].cat[1]:=licat;;
rulearray[83].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[83].cat[1]:=licat;;
rulearray[84].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[84].cat[1]:=licat;;
rulearray[85].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[85].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[85].cat[2]:=licat;;
rulearray[86].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[86].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[86].cat[2]:=licat;;
rulearray[87].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[87].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[87].cat[2]:=licat;;
rulearray[88].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[88].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[88].cat[2]:=licat;;
rulearray[89].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[89].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[89].cat[2]:=licat;;
rulearray[90].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[90].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[90].cat[2]:=licat;;
rulearray[91].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[91].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[91].cat[2]:=licat;;
rulearray[92].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[92].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[92].cat[2]:=licat;;
rulearray[93].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[93].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[93].cat[2]:=licat;;
rulearray[94].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[94].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[94].cat[2]:=licat;;
rulearray[95].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[95].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[95].cat[2]:=licat;;
rulearray[96].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[96].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[96].cat[2]:=licat;;
rulearray[97].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[97].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[97].cat[2]:=licat;;
rulearray[98].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[98].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[98].cat[2]:=licat;;
rulearray[99].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[99].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[99].cat[2]:=licat;;
rulearray[100].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[100].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[100].cat[2]:=licat;;
rulearray[101].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[101].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[101].cat[2]:=licat;;
rulearray[102].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[102].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[102].cat[2]:=licat;;
rulearray[103].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[103].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[103].cat[2]:=licat;;
rulearray[104].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[104].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[104].cat[2]:=licat;;
rulearray[105].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[105].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[105].cat[2]:=licat;;
rulearray[106].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[106].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[106].cat[2]:=licat;;
rulearray[107].args:=2;
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[107].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[107].cat[2]:=licat;;
rulearray[108].args:=1;
lscat:=BVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[108].cat[1]:=licat;;
rulearray[109].args:=1;
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[109].cat[1]:=licat;;
rulearray[110].args:=1;
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[110].cat[1]:=licat;;
rulearray[111].args:=2;
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[111].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[111].cat[2]:=licat;;
rulearray[112].args:=1;
lscat:=BNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[112].cat[1]:=licat;;
rulearray[113].args:=1;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[113].cat[1]:=licat;;
rulearray[114].args:=2;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[114].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[114].cat[2]:=licat;;
rulearray[115].args:=1;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[115].cat[1]:=licat;;
rulearray[116].args:=2;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[116].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[116].cat[2]:=licat;;
rulearray[117].args:=2;
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[117].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[117].cat[2]:=licat;;
rulearray[118].args:=1;
lscat:=BADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[118].cat[1]:=licat;;
rulearray[119].args:=1;
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[119].cat[1]:=licat;;
rulearray[120].args:=1;
lscat:=BADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[120].cat[1]:=licat;;
rulearray[121].args:=2;
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[121].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[121].cat[2]:=licat;;
rulearray[122].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[122].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[122].cat[2]:=licat;;
rulearray[123].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[123].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[123].cat[2]:=licat;;
rulearray[124].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[124].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[124].cat[2]:=licat;;
rulearray[125].args:=1;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[125].cat[1]:=licat;;
rulearray[126].args:=1;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[126].cat[1]:=licat;;
rulearray[127].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[127].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[127].cat[2]:=licat;;
rulearray[128].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[128].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[128].cat[2]:=licat;;
rulearray[129].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[129].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[129].cat[2]:=licat;;
rulearray[130].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[130].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[130].cat[2]:=licat;;
rulearray[131].args:=2;
lscat:=POSSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[131].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[131].cat[2]:=licat;;
rulearray[132].args:=2;
lscat:=BDEMADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[132].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[132].cat[2]:=licat;;
rulearray[133].args:=1;
lscat:=BDEMADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[133].cat[1]:=licat;;
rulearray[134].args:=2;
lscat:=BWHADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[134].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[134].cat[2]:=licat;;
rulearray[135].args:=1;
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[135].cat[1]:=licat;;
rulearray[136].args:=1;
lscat:=BWHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[136].cat[1]:=licat;;
rulearray[137].args:=2;
lscat:=BDET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[137].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[137].cat[2]:=licat;;
rulearray[138].args:=1;
lscat:=BDET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[138].cat[1]:=licat;;
rulearray[139].args:=1;
lscat:=DIGIT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[139].cat[1]:=licat;;
rulearray[140].args:=2;
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[140].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[140].cat[2]:=licat;;
rulearray[141].args:=2;
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[141].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[141].cat[2]:=licat;;
initsetofrules(catarray[licat1]);
initsetofrules(catarray[licat2]);
initsetofrules(catarray[licat3]);
initsetofrules(catarray[licat4]);
initsetofrules(catarray[licat5]);
initsetofrules(catarray[licat6]);
initsetofrules(catarray[licat7]);
initsetofrules(catarray[licat8]);
initsetofrules(catarray[licat9]);
initsetofrules(catarray[licat10]);
initsetofrules(catarray[licat11]);
initsetofrules(catarray[licat12]);
initsetofrules(catarray[licat13]);
initsetofrules(catarray[licat14]);
initsetofrules(catarray[licat15]);
initsetofrules(catarray[licat16]);
initsetofrules(catarray[licat17]);
initsetofrules(catarray[licat18]);
initsetofrules(catarray[licat19]);
initsetofrules(catarray[licat20]);
initsetofrules(catarray[licat21]);
initsetofrules(catarray[licat22]);
initsetofrules(catarray[licat23]);
initsetofrules(catarray[licat24]);
initsetofrules(catarray[licat25]);
initsetofrules(catarray[licat26]);
initsetofrules(catarray[licat27]);
initsetofrules(catarray[licat28]);
initsetofrules(catarray[licat29]);
initsetofrules(catarray[licat30]);
initsetofrules(catarray[licat31]);
initsetofrules(catarray[licat32]);
initsetofrules(catarray[licat33]);
initsetofrules(catarray[licat34]);
initsetofrules(catarray[licat35]);
initsetofrules(catarray[licat36]);
initsetofrules(catarray[licat37]);
initsetofrules(catarray[licat38]);
initsetofrules(catarray[licat39]);
initsetofrules(catarray[licat40]);
initsetofrules(catarray[licat41]);
initsetofrules(catarray[licat42]);
initsetofrules(catarray[licat43]);
initsetofrules(catarray[licat44]);
initsetofrules(catarray[licat45]);
initsetofrules(catarray[licat46]);
initsetofrules(catarray[licat47]);
initsetofrules(catarray[licat48]);
initsetofrules(catarray[licat49]);
initsetofrules(catarray[licat50]);
initsetofrules(catarray[licat51]);
initsetofrules(catarray[licat52]);
initsetofrules(catarray[licat53]);
initsetofrules(catarray[licat54]);
initsetofrules(catarray[licat55]);
initsetofrules(catarray[licat56]);
initsetofrules(catarray[licat57]);
initsetofrules(catarray[licat58]);
initsetofrules(catarray[licat59]);
initsetofrules(catarray[licat60]);
initsetofrules(catarray[licat61]);
initsetofrules(catarray[licat62]);
initsetofrules(catarray[licat63]);
initsetofrules(catarray[licat64]);
initsetofrules(catarray[licat65]);
initsetofrules(catarray[licat66]);
initsetofrules(catarray[licat67]);
initsetofrules(catarray[licat68]);
initsetofrules(catarray[licat69]);
initsetofrules(catarray[licat70]);
initsetofrules(catarray[licat71]);
initsetofrules(catarray[licat72]);
initsetofrules(catarray[licat73]);
initsetofrules(catarray[licat74]);
initsetofrules(catarray[licat75]);
initsetofrules(catarray[licat76]);
initsetofrules(catarray[licat77]);
initsetofrules(catarray[licat78]);
initsetofrules(catarray[licat79]);
initsetofrules(catarray[licat80]);
initsetofrules(catarray[licat81]);
initsetofrules(catarray[licat82]);
initsetofrules(catarray[licat83]);
initsetofrules(catarray[licat84]);
initsetofrules(catarray[licat85]);
initsetofrules(catarray[licat86]);
initsetofrules(catarray[licat87]);
initsetofrules(catarray[licat88]);
initsetofrules(catarray[licat89]);
initsetofrules(catarray[licat90]);
initsetofrules(catarray[licat91]);
initsetofrules(catarray[licat92]);
initsetofrules(catarray[licat93]);
initsetofrules(catarray[licat94]);
initsetofrules(catarray[licat95]);
initsetofrules(catarray[licat96]);
initsetofrules(catarray[licat97]);
initsetofrules(catarray[licat98]);
initsetofrules(catarray[licat99]);
initsetofrules(catarray[licat100]);
initsetofrules(catarray[licat101]);
initsetofrules(catarray[licat102]);
initsetofrules(catarray[licat103]);
initsetofrules(catarray[licat104]);
initsetofrules(catarray[licat105]);
initsetofrules(catarray[licat106]);
initsetofrules(catarray[licat107]);
initsetofrules(catarray[licat108]);
initsetofrules(catarray[licat109]);
initsetofrules(catarray[licat110]);
initsetofrules(catarray[licat111]);
initsetofrules(catarray[licat112]);
initsetofrules(catarray[licat113]);
initsetofrules(catarray[licat114]);
initsetofrules(catarray[licat115]);
initsetofrules(catarray[licat116]);
initsetofrules(catarray[licat117]);
initsetofrules(catarray[licat118]);
initsetofrules(catarray[licat119]);
initsetofrules(catarray[licat120]);
initsetofrules(catarray[licat121]);
initsetofrules(catarray[licat122]);
initsetofrules(catarray[licat123]);
initsetofrules(catarray[licat124]);
initsetofrules(catarray[licat125]);
initsetofrules(catarray[licat126]);
initsetofrules(catarray[licat127]);
initsetofrules(catarray[licat128]);
initsetofrules(catarray[licat129]);
initsetofrules(catarray[licat130]);
initsetofrules(catarray[licat131]);
initsetofrules(catarray[licat132]);
initsetofrules(catarray[licat133]);
initsetofrules(catarray[licat134]);
initsetofrules(catarray[licat135]);
initsetofrules(catarray[licat136]);
initsetofrules(catarray[licat137]);
initsetofrules(catarray[licat138]);
initsetofrules(catarray[licat139]);
initsetofrules(catarray[licat140]);
initsetofrules(catarray[licat141]);
initsetofrules(catarray[licat142]);
initsetofrules(catarray[licat143]);
initsetofrules(catarray[licat144]);
initsetofrules(catarray[licat145]);
initsetofrules(catarray[licat146]);
initsetofrules(catarray[licat147]);
initsetofrules(catarray[licat148]);
initsetofrules(catarray[licat149]);
initsetofrules(catarray[licat150]);
lscat:=BADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(118,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(113,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(114,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(115,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(116,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(117,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(121,catarray[licat]);
lscat:=BADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(120,catarray[licat]);
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(119,catarray[licat]);
lscat:=BDEMADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(132,catarray[licat]);
lscat:=BDEMADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(133,catarray[licat]);
lscat:=BDET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(137,catarray[licat]);
lscat:=BDET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(138,catarray[licat]);
lscat:=DIGIT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(139,catarray[licat]);
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(140,catarray[licat]);
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(141,catarray[licat]);
lscat:=BNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(112,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(109,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(110,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(111,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(122,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(123,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(124,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(125,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(126,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(127,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(128,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(129,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(130,catarray[licat]);
lscat:=POSSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(131,catarray[licat]);
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(135,catarray[licat]);
lscat:=BVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(108,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(1,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(2,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(3,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(4,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(5,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(6,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(7,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(8,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(9,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(10,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(11,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(12,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(13,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(14,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(15,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(16,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(17,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(18,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(19,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(20,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(21,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(22,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(23,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(24,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(25,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(26,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(27,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(28,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(29,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(30,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(31,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(32,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(33,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(34,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(35,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(36,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(37,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(38,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(39,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(40,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(41,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(42,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(43,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(44,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(45,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(46,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(47,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(48,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(49,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(50,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(51,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(52,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(53,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(54,catarray[licat]);
lscat:=ALOVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(107,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(55,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(56,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(57,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(58,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(59,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(60,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(61,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(62,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(63,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(64,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(65,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(66,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(67,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(68,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(69,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(70,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(71,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(72,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(73,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(74,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(75,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(76,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(77,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(78,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(79,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(80,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(81,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(82,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(83,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(84,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(85,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(86,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(87,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(88,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(89,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(90,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(91,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(92,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(93,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(94,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(95,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(96,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(97,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(98,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(99,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(100,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(101,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(102,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(103,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(104,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(105,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(106,catarray[licat]);
lscat:=BWHADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(134,catarray[licat]);
lscat:=BWHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(136,catarray[licat]);
END;
 FUNCTION ANLEXIF_info(L:ANLEXIF_lexruletype)
:ANLEXIF_ruleinfo;
BEGIN
ANLEXIF_info:=rulearray[L]
END;
 FUNCTION ANLEXIF_switch(t:LISTREE_pstree)
:ANLEXIF_setofRules;
BEGIN
ANLEXIF_switch:=catarray[t^.cat]
END;
 FUNCTION ANLEXIF_lexrule(L:ANLEXIF_lexruletype;
                                    tuple:LISTREE_tupleofstrees)
                : LISTREE_setofstrees;
VAR
   s1,s2,s3,s4,s5:LISTREE_pstree;
BEGIN
CASE L of
1: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPtcpasSG(s1,s2)
    END;
2: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPtcpasPL(s1,s2)
    END;
3: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comGerundio(s1,s2)
    END;
4: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresIndSG1(s1,s2)
    END;
5: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresSubjSG1(s1,s2)
    END;
6: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperfSG1(s1,s2)
    END;
7: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDsg1(s1,s2)
    END;
8: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasSG1(s1,s2)
    END;
9: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasaSG1(s1,s2)
    END;
10: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comFuturoSG1(s1,s2)
    END;
11: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comCondicSG1(s1,s2)
    END;
12: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresIndSG2(s1,s2)
    END;
13: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresSubjSG2(s1,s2)
    END;
14: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperfSG2(s1,s2)
    END;
15: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDsg2(s1,s2)
    END;
16: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasSG2(s1,s2)
    END;
17: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasaSG2(s1,s2)
    END;
18: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comFuturoSG2(s1,s2)
    END;
19: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comCondicSG2(s1,s2)
    END;
20: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperatSG(s1,s2)
    END;
21: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresIndSG3(s1,s2)
    END;
22: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresSubjSG3(s1,s2)
    END;
23: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperfSG3(s1,s2)
    END;
24: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDsg3(s1,s2)
    END;
25: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasSG3(s1,s2)
    END;
26: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasaSG3(s1,s2)
    END;
27: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comFuturoSG3(s1,s2)
    END;
28: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comCondicSG3(s1,s2)
    END;
29: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresIndPL1(s1,s2)
    END;
30: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresSubjPL1(s1,s2)
    END;
31: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperfPL1(s1,s2)
    END;
32: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDpl1(s1,s2)
    END;
33: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasPL1(s1,s2)
    END;
34: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasaPL1(s1,s2)
    END;
35: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comFuturoPL1(s1,s2)
    END;
36: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comCondicPL1(s1,s2)
    END;
37: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresIndPL2(s1,s2)
    END;
38: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresSubjPL2(s1,s2)
    END;
39: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperfPL2(s1,s2)
    END;
40: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDpl2(s1,s2)
    END;
41: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasPL2(s1,s2)
    END;
42: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasaPL2(s1,s2)
    END;
43: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comFuturoPL2(s1,s2)
    END;
44: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comCondicPL2(s1,s2)
    END;
45: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperatPL(s1,s2)
    END;
46: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresIndPL3(s1,s2)
    END;
47: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresSubjPL3(s1,s2)
    END;
48: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperfPL3(s1,s2)
    END;
49: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDpl3(s1,s2)
    END;
50: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasPL3(s1,s2)
    END;
51: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasaPL3(s1,s2)
    END;
52: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comFuturoPL3(s1,s2)
    END;
53: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comCondicPL3(s1,s2)
    END;
54: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comInfinitivo(s1,s2)
    END;
55: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comInfIRR(s1)
    END;
56: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPtcpasIRR(s1,s2)
    END;
57: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comGerundioIRR(s1,s2)
    END;
58: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresIndIRRsg(s1,s2)
    END;
59: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresIndIRRpl(s1,s2)
    END;
60: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresSubjIRRsg(s1,s2)
    END;
61: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresSubjIRRpl(s1,s2)
    END;
62: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperfIRRsg(s1,s2)
    END;
63: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperfIRRpl(s1,s2)
    END;
64: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDirrSG(s1,s2)
    END;
65: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDirrPL(s1,s2)
    END;
66: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasIRRsg(s1,s2)
    END;
67: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasIRRpl(s1,s2)
    END;
68: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasaIRRsg(s1,s2)
    END;
69: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasaIRRpl(s1,s2)
    END;
70: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comFuturoIRRsg(s1,s2)
    END;
71: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comFuturoIRRpl(s1,s2)
    END;
72: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comCondIRRsg(s1,s2)
    END;
73: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comCondIRRpl(s1,s2)
    END;
74: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperatIRR(s1,s2)
    END;
75: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comALOSUBnadadiftong(s1)
    END;
76: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comALOSUBirrMedek(s1)
    END;
77: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comALOSUBsterk(s1)
    END;
78: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comALOSUBeiouHalf(s1)
    END;
79: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comALOSUBeiouHeel(s1)
    END;
80: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comALOSUByMinPres(s1)
    END;
81: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comALOSUBumlaut(s1)
    END;
82: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comALOSUBve(s1)
    END;
83: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comALOSUBirrMedek_sterk(s1)
    END;
84: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comALOSUBdiftong_eiouHalf(s1)
    END;
85: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresIndALOsg1(s1,s2)
    END;
86: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresIndALOsg23(s1,s2)
    END;
87: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresIndALOpl3(s1,s2)
    END;
88: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresSubjALOsg123(s1,s2)
    END;
89: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresSubjALOpl1(s1,s2)
    END;
90: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresSubjALOpl2(s1,s2)
    END;
91: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPresSubjALOpl3(s1,s2)
    END;
92: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperatALOsg(s1,s2)
    END;
93: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasALOsg1(s1,s2)
    END;
94: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasALOsg2(s1,s2)
    END;
95: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasALOsg3(s1,s2)
    END;
96: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasALOpl1(s1,s2)
    END;
97: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasALOpl2(s1,s2)
    END;
98: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comSubjPasALOpl3(s1,s2)
    END;
99: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDaloSG1(s1,s2)
    END;
100: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDaloSG2(s1,s2)
    END;
101: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDaloSG3(s1,s2)
    END;
102: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDaloPL1(s1,s2)
    END;
103: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDaloPL2(s1,s2)
    END;
104: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPDaloPL3(s1,s2)
    END;
105: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comGerundioALO(s1,s2)
    END;
106: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comImperfALO(s1,s2)
    END;
107: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comIRRPtcpas(s1,s2)
    END;
108: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comSUBBASICverb(s1)
    END;
109: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comNOUNsg(s1)
    END;
110: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comsincambioNOUNpl(s1)
    END;
111: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comcambioNOUNpl(s1,s2)
    END;
112: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comSUBBASICnoun(s1)
    END;
113: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comADJsgNOCAMBIO(s1)
    END;
114: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comADJsgCAMBIOfem(s1,s2)
    END;
115: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comADJsgCAMBIOmasc(s1)
    END;
116: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comApocopeADJ(s1,s2)
    END;
117: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comADJpl(s1,s2)
    END;
118: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comSUBBASICadj(s1)
    END;
119: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comADVSUBadv(s1)
    END;
120: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comSUBBASICadv(s1)
    END;
121: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comAdjToAdvDerivMENTE(s1,s2)
    END;
122: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comDOclitics(s1,s2)
    END;
123: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comIOclitics(s1,s2)
    END;
124: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPrepPronFuerte(s1,s2)
    END;
125: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comPronNomfuerte(s1)
    END;
126: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comPronPrepfuerte(s1)
    END;
127: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= composADJsg(s1,s2)
    END;
128: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= composADJpl(s1,s2)
    END;
129: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= composPROsg(s1,s2)
    END;
130: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= composPROsgFEM(s1,s2)
    END;
131: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= composPROplur(s1,s2)
    END;
132: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comDemAdj(s1,s2)
    END;
133: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comDemAdjMascSing(s1)
    END;
134: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comWhADJ(s1,s2)
    END;
135: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comProperTObpropernoun(s1)
    END;
136: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comWHPROtoBWHPRO(s1)
    END;
137: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comDETflection(s1,s2)
    END;
138: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comDETnoflection(s1)
    END;
139: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comCARDrule1(s1)
    END;
140: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comCARDrule2(s1,s2)
    END;
141: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comCardTOord(s1,s2)
    END;
END;
END;
