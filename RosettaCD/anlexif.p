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
     maxrnr=75;
     maxargs=4;
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
lscat:=PART;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[1].cat[1]:=licat;;
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[1].cat[2]:=licat;;
rulearray[2].args:=1;
lscat:=BVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[2].cat[1]:=licat;;
rulearray[3].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[3].cat[1]:=licat;;
rulearray[4].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[4].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[4].cat[2]:=licat;;
rulearray[5].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[5].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[5].cat[2]:=licat;;
rulearray[6].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[6].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[6].cat[2]:=licat;;
rulearray[7].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[7].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[7].cat[2]:=licat;;
rulearray[8].args:=3;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[8].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[8].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[8].cat[3]:=licat;;
rulearray[9].args:=3;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[9].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[9].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[9].cat[3]:=licat;;
rulearray[10].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[10].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[10].cat[2]:=licat;;
rulearray[11].args:=3;
lscat:=PFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[11].cat[1]:=licat;;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[11].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[11].cat[3]:=licat;;
rulearray[12].args:=4;
lscat:=PFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[12].cat[1]:=licat;;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[12].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[12].cat[3]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[12].cat[4]:=licat;;
rulearray[13].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[13].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[13].cat[2]:=licat;;
rulearray[14].args:=3;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[14].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[14].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[14].cat[3]:=licat;;
rulearray[15].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[15].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[15].cat[2]:=licat;;
rulearray[16].args:=3;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[16].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[16].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[16].cat[3]:=licat;;
rulearray[17].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[17].cat[1]:=licat;;
rulearray[18].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[18].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[18].cat[2]:=licat;;
rulearray[19].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[19].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[19].cat[2]:=licat;;
rulearray[20].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[20].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[20].cat[2]:=licat;;
rulearray[21].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[21].cat[1]:=licat;;
rulearray[22].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[22].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[22].cat[2]:=licat;;
rulearray[23].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[23].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[23].cat[2]:=licat;;
rulearray[24].args:=3;
lscat:=PFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[24].cat[1]:=licat;;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[24].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[24].cat[3]:=licat;;
rulearray[25].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[25].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[25].cat[2]:=licat;;
rulearray[26].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[26].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[26].cat[2]:=licat;;
rulearray[27].args:=3;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[27].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[27].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[27].cat[3]:=licat;;
rulearray[28].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[28].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[28].cat[2]:=licat;;
rulearray[29].args:=3;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[29].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[29].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[29].cat[3]:=licat;;
rulearray[30].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[30].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[30].cat[2]:=licat;;
rulearray[31].args:=2;
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[31].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[31].cat[2]:=licat;;
rulearray[32].args:=3;
lscat:=NOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[32].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[32].cat[2]:=licat;;
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[32].cat[3]:=licat;;
rulearray[33].args:=3;
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[33].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[33].cat[2]:=licat;;
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[33].cat[3]:=licat;;
rulearray[34].args:=1;
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[34].cat[1]:=licat;;
rulearray[35].args:=2;
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[35].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[35].cat[2]:=licat;;
rulearray[36].args:=2;
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[36].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[36].cat[2]:=licat;;
rulearray[37].args:=3;
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[37].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[37].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[37].cat[3]:=licat;;
rulearray[38].args:=1;
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[38].cat[1]:=licat;;
rulearray[39].args:=1;
lscat:=BNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[39].cat[1]:=licat;;
rulearray[40].args:=2;
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[40].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[40].cat[2]:=licat;;
rulearray[41].args:=1;
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[41].cat[1]:=licat;;
rulearray[42].args:=2;
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[42].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[42].cat[2]:=licat;;
rulearray[43].args:=2;
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[43].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[43].cat[2]:=licat;;
rulearray[44].args:=3;
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[44].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[44].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[44].cat[3]:=licat;;
rulearray[45].args:=1;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[45].cat[1]:=licat;;
rulearray[46].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[46].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[46].cat[2]:=licat;;
rulearray[47].args:=1;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[47].cat[1]:=licat;;
rulearray[48].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[48].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[48].cat[2]:=licat;;
rulearray[49].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[49].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[49].cat[2]:=licat;;
rulearray[50].args:=1;
lscat:=BWHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[50].cat[1]:=licat;;
rulearray[51].args:=2;
lscat:=BWHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[51].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[51].cat[2]:=licat;;
rulearray[52].args:=2;
lscat:=DEMPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[52].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[52].cat[2]:=licat;;
rulearray[53].args:=1;
lscat:=BDET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[53].cat[1]:=licat;;
rulearray[54].args:=2;
lscat:=BDET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[54].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[54].cat[2]:=licat;;
rulearray[55].args:=1;
lscat:=BINDEFPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[55].cat[1]:=licat;;
rulearray[56].args:=2;
lscat:=BINDEFPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[56].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[56].cat[2]:=licat;;
rulearray[57].args:=1;
lscat:=BADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[57].cat[1]:=licat;;
rulearray[58].args:=1;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[58].cat[1]:=licat;;
rulearray[59].args:=2;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[59].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[59].cat[2]:=licat;;
rulearray[60].args:=2;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[60].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[60].cat[2]:=licat;;
rulearray[61].args:=3;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[61].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[61].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[61].cat[3]:=licat;;
rulearray[62].args:=2;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[62].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[62].cat[2]:=licat;;
rulearray[63].args:=3;
lscat:=PFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[63].cat[1]:=licat;;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[63].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[63].cat[3]:=licat;;
rulearray[64].args:=2;
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[64].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[64].cat[2]:=licat;;
rulearray[65].args:=2;
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[65].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[65].cat[2]:=licat;;
rulearray[66].args:=1;
lscat:=BADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[66].cat[1]:=licat;;
rulearray[67].args:=1;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[67].cat[1]:=licat;;
rulearray[68].args:=1;
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[68].cat[1]:=licat;;
rulearray[69].args:=2;
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[69].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[69].cat[2]:=licat;;
rulearray[70].args:=2;
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[70].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[70].cat[2]:=licat;;
rulearray[71].args:=3;
lscat:=PFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[71].cat[1]:=licat;;
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[71].cat[2]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[71].cat[3]:=licat;;
rulearray[72].args:=2;
lscat:=ADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[72].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[72].cat[2]:=licat;;
rulearray[73].args:=1;
lscat:=DIGIT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[73].cat[1]:=licat;;
rulearray[74].args:=2;
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[74].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[74].cat[2]:=licat;;
rulearray[75].args:=2;
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[75].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[75].cat[2]:=licat;;
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
lscat:=BADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(57,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(58,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(59,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(60,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(61,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(62,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(67,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(64,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(65,catarray[licat]);
lscat:=BADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(66,catarray[licat]);
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(68,catarray[licat]);
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(69,catarray[licat]);
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(70,catarray[licat]);
lscat:=ADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(72,catarray[licat]);
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(74,catarray[licat]);
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(75,catarray[licat]);
lscat:=DEMPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(52,catarray[licat]);
lscat:=BDET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(53,catarray[licat]);
lscat:=BDET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(54,catarray[licat]);
lscat:=DIGIT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(73,catarray[licat]);
lscat:=BINDEFPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(55,catarray[licat]);
lscat:=BINDEFPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(56,catarray[licat]);
lscat:=BNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(39,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(40,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(41,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(42,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(43,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(44,catarray[licat]);
lscat:=NOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(32,catarray[licat]);
lscat:=PART;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(1,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(45,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(46,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(47,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(48,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(49,catarray[licat]);
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(34,catarray[licat]);
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(35,catarray[licat]);
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(36,catarray[licat]);
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(37,catarray[licat]);
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(38,catarray[licat]);
lscat:=BVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(2,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(3,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(4,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(5,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(6,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(7,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(8,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(9,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(10,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(13,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(14,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(15,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(16,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(17,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(18,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(19,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(20,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(21,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(22,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(23,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(25,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(26,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(27,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(28,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(29,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(30,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(31,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(33,catarray[licat]);
lscat:=BWHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(50,catarray[licat]);
lscat:=BWHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(51,catarray[licat]);
lscat:=PFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(11,catarray[licat]);
lscat:=PFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(12,catarray[licat]);
lscat:=PFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(24,catarray[licat]);
lscat:=PFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(63,catarray[licat]);
lscat:=PFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(71,catarray[licat]);
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
    ANLEXIF_lexrule:= comParticleToVerb(s1,s2)
    END;
2: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comVerbBtoSub(s1)
    END;
3: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comVerbOttEnk1(s1)
    END;
4: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbOttEnk1extra(s1,s2)
    END;
5: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbOttEnk2(s1,s2)
    END;
6: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbOttMv(s1,s2)
    END;
7: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbOvtEnk(s1,s2)
    END;
8: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comVerbOvtEnkPers5extra(s1,s2,s3)
    END;
9: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comVerbOvtMv(s1,s2,s3)
    END;
10: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbOvtMvPers4en5extra(s1,s2)
    END;
11: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comVerbVd1(s1,s2,s3)
    END;
12: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    LISTREE_extractfromtuple(s4,tuple);
    ANLEXIF_lexrule:= comVerbVd2(s1,s2,s3,s4)
    END;
13: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbVd3(s1,s2)
    END;
14: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comVerbVd4(s1,s2,s3)
    END;
15: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbInf(s1,s2)
    END;
16: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comVerbTd(s1,s2,s3)
    END;
17: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comVerbGbEnk(s1)
    END;
18: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbGbEnkExtra(s1,s2)
    END;
19: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbGbMv(s1,s2)
    END;
20: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbConjunctiefOtt(s1,s2)
    END;
21: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comVerbZorOttExtra(s1)
    END;
22: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbZorOtt(s1,s2)
    END;
23: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbZorOvt(s1,s2)
    END;
24: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comVerbZorVd1(s1,s2,s3)
    END;
25: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbZorVd2(s1,s2)
    END;
26: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbZorInf(s1,s2)
    END;
27: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comVerbZorTd(s1,s2,s3)
    END;
28: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbZorGbEnk(s1,s2)
    END;
29: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comVerbZorGbMv(s1,s2,s3)
    END;
30: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbZorConjunctief(s1,s2)
    END;
31: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comVerbeORenvorm(s1,s2)
    END;
32: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comNOUNcomp1(s1,s2,s3)
    END;
33: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comVerbNOUNcomp(s1,s2,s3)
    END;
34: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= combpropernountopropernoun(s1)
    END;
35: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= combpropertopropergenitief(s1,s2)
    END;
36: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPropernounWithDimForm(s1,s2)
    END;
37: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comPropernounWithGeniDimForm(s1,s2,s3)
    END;
38: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= combpropernountosubnoun(s1)
    END;
39: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= combnountosub(s1)
    END;
40: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comDimForm(s1,s2)
    END;
41: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comnounenkelvoud(s1)
    END;
42: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comnounmeervoud(s1,s2)
    END;
43: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comnoungenitiefenkelvoud(s1,s2)
    END;
44: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comnoungenitiefmeervoud(s1,s2,s3)
    END;
45: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comPerspro1(s1)
    END;
46: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPerspro2(s1,s2)
    END;
47: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comPerspro3(s1)
    END;
48: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPersproToPossadj(s1,s2)
    END;
49: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comPersproToPosspro(s1,s2)
    END;
50: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comBwhProToWhPro(s1)
    END;
51: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comWhproToPossadj(s1,s2)
    END;
52: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comDemproToPossadj(s1,s2)
    END;
53: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comBDetToDet1(s1)
    END;
54: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comBDetToDet2(s1,s2)
    END;
55: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comBindefprotoindefpro1(s1)
    END;
56: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comBindefprotoindefpro2(s1,s2)
    END;
57: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comadjbtosub(s1)
    END;
58: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comadjposvorm(s1)
    END;
59: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comadjsPositive(s1,s2)
    END;
60: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comadjcompvorm(s1,s2)
    END;
61: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comadjsComparative(s1,s2,s3)
    END;
62: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comadjsupvorm(s1,s2)
    END;
63: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comadjallersupvorm(s1,s2,s3)
    END;
64: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comadjEform(s1,s2)
    END;
65: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comadjENform(s1,s2)
    END;
66: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= combadvtosubadv(s1)
    END;
67: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comAdvFromAdj(s1)
    END;
68: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comadvposvorm(s1)
    END;
69: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comadvcompvorm(s1,s2)
    END;
70: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comadvsupvorm(s1,s2)
    END;
71: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    LISTREE_extractfromtuple(s3,tuple);
    ANLEXIF_lexrule:= comadvallersupvorm(s1,s2,s3)
    END;
72: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comadveform(s1,s2)
    END;
73: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comCARDrule1(s1)
    END;
74: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comCARDrule2(s1,s2)
    END;
75: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comORDINALrule1(s1,s2)
    END;
END;
END;
