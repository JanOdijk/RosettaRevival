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
     maxrnr=32;
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
rulearray[1].args:=1;
lscat:=BVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[1].cat[1]:=licat;;
rulearray[2].args:=1;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[2].cat[1]:=licat;;
rulearray[3].args:=2;
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[3].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[3].cat[2]:=licat;;
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
rulearray[8].args:=1;
lscat:=BNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[8].cat[1]:=licat;;
rulearray[9].args:=1;
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[9].cat[1]:=licat;;
rulearray[10].args:=2;
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[10].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[10].cat[2]:=licat;;
rulearray[11].args:=1;
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[11].cat[1]:=licat;;
rulearray[12].args:=1;
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[12].cat[1]:=licat;;
rulearray[13].args:=1;
lscat:=BADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[13].cat[1]:=licat;;
rulearray[14].args:=2;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[14].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[14].cat[2]:=licat;;
rulearray[15].args:=1;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[15].cat[1]:=licat;;
rulearray[16].args:=2;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[16].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[16].cat[2]:=licat;;
rulearray[17].args:=2;
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[17].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[17].cat[2]:=licat;;
rulearray[18].args:=1;
lscat:=BADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[18].cat[1]:=licat;;
rulearray[19].args:=1;
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[19].cat[1]:=licat;;
rulearray[20].args:=2;
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[20].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[20].cat[2]:=licat;;
rulearray[21].args:=2;
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[21].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[21].cat[2]:=licat;;
rulearray[22].args:=1;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[22].cat[1]:=licat;;
rulearray[23].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[23].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[23].cat[2]:=licat;;
rulearray[24].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[24].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[24].cat[2]:=licat;;
rulearray[25].args:=2;
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[25].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[25].cat[2]:=licat;;
rulearray[26].args:=1;
lscat:=BWHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[26].cat[1]:=licat;;
rulearray[27].args:=2;
lscat:=BWHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[27].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[27].cat[2]:=licat;;
rulearray[28].args:=2;
lscat:=BWHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[28].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[28].cat[2]:=licat;;
rulearray[29].args:=1;
lscat:=BDET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[29].cat[1]:=licat;;
rulearray[30].args:=1;
lscat:=DIGIT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[30].cat[1]:=licat;;
rulearray[31].args:=2;
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[31].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[31].cat[2]:=licat;;
rulearray[32].args:=2;
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[32].cat[1]:=licat;;
lscat:=SFCAT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);rulearray[32].cat[2]:=licat;;
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
lscat:=BADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(13,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(14,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(15,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(16,catarray[licat]);
lscat:=SUBADJ;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(17,catarray[licat]);
lscat:=BADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(18,catarray[licat]);
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(19,catarray[licat]);
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(20,catarray[licat]);
lscat:=SUBADV;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(21,catarray[licat]);
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(31,catarray[licat]);
lscat:=CARD;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(32,catarray[licat]);
lscat:=BDET;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(29,catarray[licat]);
lscat:=DIGIT;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(30,catarray[licat]);
lscat:=BNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(8,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(9,catarray[licat]);
lscat:=SUBNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(10,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(22,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(23,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(24,catarray[licat]);
lscat:=BPERSPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(25,catarray[licat]);
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(11,catarray[licat]);
lscat:=BPROPERNOUN;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(12,catarray[licat]);
lscat:=BVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(1,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(2,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(3,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(4,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(5,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(6,catarray[licat]);
lscat:=SUBVERB;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(7,catarray[licat]);
lscat:=BWHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(26,catarray[licat]);
lscat:=BWHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(27,catarray[licat]);
lscat:=BWHPRO;licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);appendrule(28,catarray[licat]);
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
    ANLEXIF_lexrule:= comLBVerb(s1)
    END;
2: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comLVerbBaseform(s1)
    END;
3: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLVerbSform(s1,s2)
    END;
4: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLVerbPasttense(s1,s2)
    END;
5: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLVerbPastparticiple(s1,s2)
    END;
6: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLVerbIngform(s1,s2)
    END;
7: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLVerbBe(s1,s2)
    END;
8: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comLBNoun(s1)
    END;
9: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comLNounBaseform(s1)
    END;
10: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLNounPlural(s1,s2)
    END;
11: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comLPropernounBaseform(s1)
    END;
12: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comLBPropernounToSubnoun(s1)
    END;
13: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comLBadj(s1)
    END;
14: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLAdjToAdvDeriv(s1,s2)
    END;
15: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comLAdjBaseform(s1)
    END;
16: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLAdjComp(s1,s2)
    END;
17: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLAdjSuper(s1,s2)
    END;
18: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comLBadV(s1)
    END;
19: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comLAdvBaseform(s1)
    END;
20: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLAdvComp(s1,s2)
    END;
21: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLAdvSuper(s1,s2)
    END;
22: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comLPersproNom(s1)
    END;
23: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLPersproAcc(s1,s2)
    END;
24: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLPossadj(s1,s2)
    END;
25: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLPosspro(s1,s2)
    END;
26: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comLWhpro(s1)
    END;
27: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLWhproAcc(s1,s2)
    END;
28: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comLWhpossadj(s1,s2)
    END;
29: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comLDet(s1)
    END;
30: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    ANLEXIF_lexrule:= comCARDrule1(s1)
    END;
31: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comCARDrule2(s1,s2)
    END;
32: BEGIN
    LISTREE_extractfromtuple(s1,tuple);
    LISTREE_extractfromtuple(s2,tuple);
    ANLEXIF_lexrule:= comORDINALrule1(s1,s2)
    END;
END;
END;
