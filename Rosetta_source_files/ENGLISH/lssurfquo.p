 
(*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : lssurfquo
 *  Creation date   :  19-SEP-1989
 *  Author          : rene leermakers
 *
 *  Copyright (c) 1987, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

Export(lssurfquo);
pragma C_include('lssurfquo.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('lsstree.pf');
pragma C_include('lsmatches.pf');
pragma C_include('copyt.pf');
pragma C_include('maket.pf');
pragma C_include('lsauxdom.pf');
pragma C_include('strtokey.pf');
pragma C_include('liiddict.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('lidomaint.pf');
pragma C_include('drawstree.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('ldgetkey.pf');
pragma C_include('lsrulepars.pf');
pragma C_include('listree.pf');

PROGRAM lssurfquo;
WITH lsdomaint,lsstree,lsmatches,copyt,maket,lsauxdom,strtokey,liiddict,
ldcatsets,lidomaint,drawstree,str,strng,ldgetkey,lsrulepars,listree;


FUNCTION convkey(strkey:STRING_string):INTEGER;
VAR int:INTEGER;
BEGIN
STRtoKey_getSkeyHash(strkey,int);
convkey:=int 
END;


FUNCTION GENunderNP(T1:LSSTREE_pstree):BOOLEAN;
   VAR result  : BOOLEAN;
       sonlist : LSSTREE_prelnode;
BEGIN
   result := false;
   sonlist := T1^.sons;
   WHILE NOT (result) AND (sonlist <> NIL) DO
     BEGIN
     IF sonlist^.node^.cat = GEN
        THEN result := TRUE;
     sonlist := sonlist^.brother;
     END;
   GENunderNP := result;
END; {GENunderNP}



FUNCTION QPunderDETP(T1:LSSTREE_pstree):BOOLEAN;
   VAR result  : BOOLEAN;
       sonlist : LSSTREE_prelnode;
BEGIN
   result := false;
   sonlist := T1^.sons;
   WHILE NOT (result) AND (sonlist <> NIL) DO
     BEGIN
     IF sonlist^.node^.cat = QP
        THEN result := TRUE;
     sonlist := sonlist^.brother;
     END;
   QPunderDETP := result;
END; {QPunderDETP}

FUNCTION PNunderCN(T1:LSSTREE_pstree):BOOLEAN;
   VAR result  : BOOLEAN;
       son,sonlist : LSSTREE_prelnode;
BEGIN
   result := false;
   sonlist := T1^.sons;
   WHILE NOT (result) AND (sonlist <> NIL) DO
     BEGIN
     IF sonlist^.node^.cat = NOUN 
     THEN BEGIN
          result := TRUE;
          son := sonlist^.node^.sons
          END;
    sonlist := sonlist^.brother
    END;
  IF result THEN result := (son <> NIL);
  IF result 
  THEN BEGIN
       result := (son^.node^.cat = SUBNOUN);
       IF result THEN son := son^.node^.sons;
       END;
  IF result THEN result := (son <> NIL);
  IF result 
  THEN BEGIN
       result := (son^.node^.cat = BPROPERNOUN);
       END;
  PNunderCN := result;
END; {PNunderCN}

 FUNCTION detpundernp(t1:LSSTREE_pstree):BOOLEAN; 
     VAR result:BOOLEAN;
         son, sonlist:LSSTREE_prelnode;
     BEGIN
     result:=FALSE;
     sonlist:=t1^.sons;
     WHILE NOT(result) AND (sonlist<>NIL) DO
       BEGIN
       IF sonlist^.node^.cat=NP THEN BEGIN 
            result:=TRUE;
            son := sonlist^.node^.sons
                                       END;
       sonlist:=sonlist^.brother
       END;
     IF result THEN result := (son <> NIL);
     IF result THEN BEGIN
                 result := (son^.relation = detrel);
                 END;
     detpundernp :=result;
END; {detpundernp}


FUNCTION letinconj(T1:LSSTREE_pstree):BOOLEAN;
   VAR result  : BOOLEAN;
       sonlist : LSSTREE_prelnode;
BEGIN
   result := false;
   sonlist := T1^.sons;
   IF sonlist <> NIL THEN BEGIN
     sonlist := sonlist^.node^.sons;
     IF sonlist^.node^.CAT = bverb THEN
     result := (sonlist^.node^.ls^.bverbfield^.key = convkey('letsBVERBkey'));
   END;
   letinconj := result;
END; {letinconj}

FUNCTION getsubc(T1:LSSTREE_pstree):LSDOMAINT_verbsubctype;
   VAR result  : LSDOMAINT_verbsubctype;
       sonlist : LSSTREE_prelnode;
BEGIN
   result := notaux;
   sonlist := T1^.sons;
   IF sonlist^.node^.CAT = verb THEN
     result := sonlist^.node^.ls^.verbfield^.subc;
   getsubc := result;
END; {getsubc}

FUNCTION thereNP_(T1:LSSTREE_pstree):BOOLEAN;
   VAR result  : BOOLEAN;
       sonlist : LSSTREE_prelnode;
{
The function checks for an NP whether there is THERE under it
}

BEGIN
   result := false;
   sonlist := T1^.sons;
   WHILE NOT (result) AND (sonlist <> NIL) DO
     BEGIN
     IF sonlist^.node^.cat = THERE
        THEN result := TRUE;
     sonlist := sonlist^.brother;
     END;
   thereNP_ := result;
END; {thereNP}

FUNCTION svaok(VAR rec:SENTENCE1RULErec;b:LSSTREE_pstree):BOOLEAN;
BEGIN WITH rec DO BEGIN
  svaok :=
	  (subjfound       
                <=
		((subjpersonvar IN b^.ls^.VERBfield^.persons) AND
		 (subjnumbervar IN b^.ls^.VERBfield^.numbers) 
		)
	   )                                                        AND
	  ((NOT subjfound)
                          <= (3 IN b^.ls^.VERBfield^.persons))      AND
	  (((NOT subjfound) AND (NOT shiftfound)) <= 
	      (singular IN b^.ls^.VERBfield^.numbers)
          );
END;
END; {svaok}

FUNCTION subjandvpandauxok(VAR rec:SENTENCE1RULErec;b:LSSTREE_pstree): BOOLEAN;
BEGIN WITH rec DO BEGIN
  subjandvpandauxok :=
((auxfound OR VERBconjfound) <=
      (b^.ls^.VERBPfield^.deixis = omegadeixis) 
)
AND
(((NOT auxfound) AND
  (NOT VERBconjfound)
 ) <=
 (((subjfound                                   AND
    (b^.ls^.VERBPfield^.modus IN [subjunctive, indicative]) 
   ) <=
     ((subjpersonvar IN b^.ls^.VERBPfield^.persons) AND
      (subjnumbervar IN b^.ls^.VERBPfield^.numbers)
     )
  )                                                  AND
   (((NOT subjfound)    AND
    (b^.ls^.VERBPfield^.modus IN [subjunctive, indicative])
   ) <=
     (3 IN b^.ls^.VERBPfield^.persons
     )
  )
 )               

)
END;
END; {subjandvpandauxok}

FUNCTION auxandverbpok(VAR rec:SENTENCE1RULErec;m:LSDOMAINT_modustype;
af:LSDOMAINT_auxSETtype;b:LSSTREE_pstree):BOOLEAN;
BEGIN WITH rec DO BEGIN
  auxandverbpok := FALSE;
  IF       verbsubcvar = modalverb THEN auxandverbpok := (m=infinitive) 
  ELSE IF  (verbsubcvar = haveverb) AND (verbthetavpvar = thetavpaux)  
       THEN auxandverbpok := ((m=participle) AND (af * [aux] = []))
  ELSE IF  (verbsubcvar = haveverb) AND (verbthetavpvar = vp120)
       THEN auxandverbpok := (NOT b^.ls^.VERBPfield^.headfound)
  ELSE IF  (verbsubcvar = beverb) AND
           (af = [])              AND
           (verbthetavpvar = thetavpaux)
       THEN auxandverbpok :=((m IN [participle,ingform]) OR 
           (NOT b^.ls^.VERBPfield^.headfound))
  ELSE IF  (verbsubcvar = beverb)   AND
           (af = [])                AND
           (verbthetavpvar <> thetavpaux) AND
           ([synCLOSEDGERUND] * verbsynvpsvar = [])
       THEN auxandverbpok :=(NOT b^.ls^.VERBPfield^.headfound)
  ELSE IF  (verbsubcvar = beverb)   AND
           (af = [pass])            AND
           (verbthetavpvar = thetavpaux)
       THEN auxandverbpok :=(m IN [ingform])
  ELSE IF (verbsubcvar = doaux) 
       THEN IF (NOT infdoinconjfound)
            THEN auxandverbpok := ((m = infinitive)  AND
                                  (vpfirstsubc(b) <> beverb)
                                 )
            ELSE auxandverbpok := (m = infinitive)
  ELSE IF letinconjfound
       THEN auxandverbpok := (m = infinitive);
END;
END;

FUNCTION vpfirstsubc(T:LSSTREE_pstree):LSDOMAINT_verbsubctype;
   VAR result  : LSDOMAINT_verbsubctype;
       sonlist : LSSTREE_prelnode;
       vfound  : BOOLEAN;
{
The function yields the subc of the first verb under VP
}

BEGIN
   vfound := FALSE;
   result := mainverb;
   sonlist := T^.sons;
   WHILE NOT (vfound) AND (sonlist <> NIL) DO
     BEGIN
     IF sonlist^.node^.cat = VERB
        THEN BEGIN vfound := TRUE;
                   result := sonlist^.node^.ls^.verbfield^.subc;
             END;
     sonlist := sonlist^.brother;
     END;
   vpfirstsubc := result;
END; {vpfirstsubc}




