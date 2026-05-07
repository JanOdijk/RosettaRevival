EXPORT(genlexif);
pragma C_include('genlexif.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('listree.pf');
pragma C_include('lidomaint.pf');
pragma C_include('mem.pf');
pragma C_include('decomlexrules1.pf');
pragma C_include('decomlexrules2.pf');
WITH genlexif;
pragma C_include('decomlexrules3.pf');
PROGRAM GENLEXIF;WITH lsdomaint,listree,lidomaint,mem,
decomlexrules1,decomlexrules2,decomlexrules3;

CONST
     maxrnr=32;
VAR licat:LIDOMAINT_syntcat;lscat:LSDOMAINT_syntcat;
   catarray:ARRAY[LIDOMAINT_syntcat] OF GENLEXIF_setofrules;

PROCEDURE MakePlosrule(VAR p:GENLEXIF_plosrule);
begin
MEM_NewDefault(LoopHoles.SIZEof(GENLEXIF_losrule),LoopHoles.Retype(p,Mem_Ptr));
end;
PROCEDURE initsetofrules(VAR S1:GENLEXIF_setofrules);
begin
S1.first:=nil;S1.last:=nil
end;
 FUNCTION GENLEXIF_stillrules(setofrules:GENLEXIF_setofrules):BOOLEAN;
begin
if setofrules.first<>nil then GENLEXIF_stillrules:=true
else GENLEXIF_stillrules:=false
end;
PROCEDURE appendrule(rule:GENLEXIF_lexruletype;VAR S1:GENLEXIF_setofrules);
VAR p:GENLEXIF_plosrule;
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
 PROCEDURE GENLEXIF_takerule(VAR rule:GENLEXIF_lexruletype;
                                       VAR setofRules:GENLEXIF_setofRules);
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
FUNCTION GENLEXIF_maxlexrulenr:INTEGER;
BEGIN
GENLEXIF_maxlexrulenr:=maxrnr
END;
 PROCEDURE GENLEXIF_init;
BEGIN
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
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(13,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(32,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(15,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(16,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(17,catarray[licat]);
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(14,catarray[licat]);
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(18,catarray[licat]);
lscat:=ADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(19,catarray[licat]);
lscat:=ADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(20,catarray[licat]);
lscat:=ADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(21,catarray[licat]);
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(30,catarray[licat]);
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(31,catarray[licat]);
lscat:=DET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(29,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(8,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(12,catarray[licat]);
lscat:=NOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(9,catarray[licat]);
lscat:=NOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(10,catarray[licat]);
lscat:=PERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(22,catarray[licat]);
lscat:=PERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(23,catarray[licat]);
lscat:=POSSADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(24,catarray[licat]);
lscat:=POSSADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(28,catarray[licat]);
lscat:=POSSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(25,catarray[licat]);
lscat:=PROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(11,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(1,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(2,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(3,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(4,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(5,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(6,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(7,catarray[licat]);
lscat:=WHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(26,catarray[licat]);
lscat:=WHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(27,catarray[licat]);
END;
 FUNCTION GENLEXIF_switch(t:LISTREE_pstree)
:GENLEXIF_setofRules;
BEGIN
GENLEXIF_switch:=catarray[t^.cat]
END;
 FUNCTION GENLEXIF_lexrule(L:GENLEXIF_lexruletype;
                                    t:LISTREE_pstree)
                : LISTREE_setoftupleofstrees;
BEGIN
CASE L of
1: GENLEXIF_lexrule:= decLBVerb(t);
2: GENLEXIF_lexrule:= decLVerbBaseform(t);
3: GENLEXIF_lexrule:= decLVerbSform(t);
4: GENLEXIF_lexrule:= decLVerbPasttense(t);
5: GENLEXIF_lexrule:= decLVerbPastparticiple(t);
6: GENLEXIF_lexrule:= decLVerbIngform(t);
7: GENLEXIF_lexrule:= decLVerbBe(t);
8: GENLEXIF_lexrule:= decLBNoun(t);
9: GENLEXIF_lexrule:= decLNounBaseform(t);
10: GENLEXIF_lexrule:= decLNounPlural(t);
11: GENLEXIF_lexrule:= decLPropernounBaseform(t);
12: GENLEXIF_lexrule:= decLBPropernounToSubnoun(t);
13: GENLEXIF_lexrule:= decLBadj(t);
14: GENLEXIF_lexrule:= decLAdjToAdvDeriv(t);
15: GENLEXIF_lexrule:= decLAdjBaseform(t);
16: GENLEXIF_lexrule:= decLAdjComp(t);
17: GENLEXIF_lexrule:= decLAdjSuper(t);
18: GENLEXIF_lexrule:= decLBadV(t);
19: GENLEXIF_lexrule:= decLAdvBaseform(t);
20: GENLEXIF_lexrule:= decLAdvComp(t);
21: GENLEXIF_lexrule:= decLAdvSuper(t);
22: GENLEXIF_lexrule:= decLPersproNom(t);
23: GENLEXIF_lexrule:= decLPersproAcc(t);
24: GENLEXIF_lexrule:= decLPossadj(t);
25: GENLEXIF_lexrule:= decLPosspro(t);
26: GENLEXIF_lexrule:= decLWhpro(t);
27: GENLEXIF_lexrule:= decLWhproAcc(t);
28: GENLEXIF_lexrule:= decLWhpossadj(t);
29: GENLEXIF_lexrule:= decLDet(t);
30: GENLEXIF_lexrule:= decCARDrule1(t);
31: GENLEXIF_lexrule:= decCARDrule2(t);
32: GENLEXIF_lexrule:= decORDINALrule1(t);
END;
END;
