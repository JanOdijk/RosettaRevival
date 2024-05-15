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
     maxrnr=75;
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
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(57,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(75,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(58,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(59,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(60,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(61,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(62,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(63,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(64,catarray[licat]);
lscat:=ADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(65,catarray[licat]);
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(66,catarray[licat]);
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(67,catarray[licat]);
lscat:=ADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(68,catarray[licat]);
lscat:=ADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(69,catarray[licat]);
lscat:=ADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(70,catarray[licat]);
lscat:=ADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(71,catarray[licat]);
lscat:=ADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(72,catarray[licat]);
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(73,catarray[licat]);
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(74,catarray[licat]);
lscat:=DET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(53,catarray[licat]);
lscat:=DET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(54,catarray[licat]);
lscat:=INDEFPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(55,catarray[licat]);
lscat:=INDEFPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(56,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(32,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(33,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(38,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(39,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(40,catarray[licat]);
lscat:=NOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(41,catarray[licat]);
lscat:=NOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(42,catarray[licat]);
lscat:=NOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(43,catarray[licat]);
lscat:=NOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(44,catarray[licat]);
lscat:=PERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(45,catarray[licat]);
lscat:=PERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(46,catarray[licat]);
lscat:=PERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(47,catarray[licat]);
lscat:=POSSADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(48,catarray[licat]);
lscat:=POSSADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(51,catarray[licat]);
lscat:=POSSADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(52,catarray[licat]);
lscat:=POSSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(49,catarray[licat]);
lscat:=PROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(34,catarray[licat]);
lscat:=PROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(35,catarray[licat]);
lscat:=PROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(36,catarray[licat]);
lscat:=PROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(37,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(2,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(1,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(3,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(4,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(5,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(6,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(7,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(8,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(9,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(10,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(11,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(12,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(13,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(14,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(15,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(16,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(17,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(18,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(19,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(20,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(21,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(22,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(23,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(24,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(25,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(26,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(27,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(28,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(29,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(30,catarray[licat]);
lscat:=VERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(31,catarray[licat]);
lscat:=WHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(50,catarray[licat]);
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
1: GENLEXIF_lexrule:= decParticleToVerb(t);
2: GENLEXIF_lexrule:= decVerbBtoSub(t);
3: GENLEXIF_lexrule:= decVerbOttEnk1(t);
4: GENLEXIF_lexrule:= decVerbOttEnk1extra(t);
5: GENLEXIF_lexrule:= decVerbOttEnk2(t);
6: GENLEXIF_lexrule:= decVerbOttMv(t);
7: GENLEXIF_lexrule:= decVerbOvtEnk(t);
8: GENLEXIF_lexrule:= decVerbOvtEnkPers5extra(t);
9: GENLEXIF_lexrule:= decVerbOvtMv(t);
10: GENLEXIF_lexrule:= decVerbOvtMvPers4en5extra(t);
11: GENLEXIF_lexrule:= decVerbVd1(t);
12: GENLEXIF_lexrule:= decVerbVd2(t);
13: GENLEXIF_lexrule:= decVerbVd3(t);
14: GENLEXIF_lexrule:= decVerbVd4(t);
15: GENLEXIF_lexrule:= decVerbInf(t);
16: GENLEXIF_lexrule:= decVerbTd(t);
17: GENLEXIF_lexrule:= decVerbGbEnk(t);
18: GENLEXIF_lexrule:= decVerbGbEnkExtra(t);
19: GENLEXIF_lexrule:= decVerbGbMv(t);
20: GENLEXIF_lexrule:= decVerbConjunctiefOtt(t);
21: GENLEXIF_lexrule:= decVerbZorOttExtra(t);
22: GENLEXIF_lexrule:= decVerbZorOtt(t);
23: GENLEXIF_lexrule:= decVerbZorOvt(t);
24: GENLEXIF_lexrule:= decVerbZorVd1(t);
25: GENLEXIF_lexrule:= decVerbZorVd2(t);
26: GENLEXIF_lexrule:= decVerbZorInf(t);
27: GENLEXIF_lexrule:= decVerbZorTd(t);
28: GENLEXIF_lexrule:= decVerbZorGbEnk(t);
29: GENLEXIF_lexrule:= decVerbZorGbMv(t);
30: GENLEXIF_lexrule:= decVerbZorConjunctief(t);
31: GENLEXIF_lexrule:= decVerbeORenvorm(t);
32: GENLEXIF_lexrule:= decNOUNcomp1(t);
33: GENLEXIF_lexrule:= decVerbNOUNcomp(t);
34: GENLEXIF_lexrule:= decbpropernountopropernoun(t);
35: GENLEXIF_lexrule:= decbpropertopropergenitief(t);
36: GENLEXIF_lexrule:= decPropernounWithDimForm(t);
37: GENLEXIF_lexrule:= decPropernounWithGeniDimForm(t);
38: GENLEXIF_lexrule:= decbpropernountosubnoun(t);
39: GENLEXIF_lexrule:= decbnountosub(t);
40: GENLEXIF_lexrule:= decDimForm(t);
41: GENLEXIF_lexrule:= decnounenkelvoud(t);
42: GENLEXIF_lexrule:= decnounmeervoud(t);
43: GENLEXIF_lexrule:= decnoungenitiefenkelvoud(t);
44: GENLEXIF_lexrule:= decnoungenitiefmeervoud(t);
45: GENLEXIF_lexrule:= decPerspro1(t);
46: GENLEXIF_lexrule:= decPerspro2(t);
47: GENLEXIF_lexrule:= decPerspro3(t);
48: GENLEXIF_lexrule:= decPersproToPossadj(t);
49: GENLEXIF_lexrule:= decPersproToPosspro(t);
50: GENLEXIF_lexrule:= decBwhProToWhPro(t);
51: GENLEXIF_lexrule:= decWhproToPossadj(t);
52: GENLEXIF_lexrule:= decDemproToPossadj(t);
53: GENLEXIF_lexrule:= decBDetToDet1(t);
54: GENLEXIF_lexrule:= decBDetToDet2(t);
55: GENLEXIF_lexrule:= decBindefprotoindefpro1(t);
56: GENLEXIF_lexrule:= decBindefprotoindefpro2(t);
57: GENLEXIF_lexrule:= decadjbtosub(t);
58: GENLEXIF_lexrule:= decadjposvorm(t);
59: GENLEXIF_lexrule:= decadjsPositive(t);
60: GENLEXIF_lexrule:= decadjcompvorm(t);
61: GENLEXIF_lexrule:= decadjsComparative(t);
62: GENLEXIF_lexrule:= decadjsupvorm(t);
63: GENLEXIF_lexrule:= decadjallersupvorm(t);
64: GENLEXIF_lexrule:= decadjEform(t);
65: GENLEXIF_lexrule:= decadjENform(t);
66: GENLEXIF_lexrule:= decbadvtosubadv(t);
67: GENLEXIF_lexrule:= decAdvFromAdj(t);
68: GENLEXIF_lexrule:= decadvposvorm(t);
69: GENLEXIF_lexrule:= decadvcompvorm(t);
70: GENLEXIF_lexrule:= decadvsupvorm(t);
71: GENLEXIF_lexrule:= decadvallersupvorm(t);
72: GENLEXIF_lexrule:= decadveform(t);
73: GENLEXIF_lexrule:= decCARDrule1(t);
74: GENLEXIF_lexrule:= decCARDrule2(t);
75: GENLEXIF_lexrule:= decORDINALrule1(t);
END;
END;
