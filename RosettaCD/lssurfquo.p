 
(*:===================================================================*
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
 *EMP:LSDOMAINT_:===================================================================*)


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

function intkey(strkey:STRING_string):INTEGER;
VAR int:INTEGER;
begin
STRtoKey_getSkeyHash(strkey,int);
intkey:=int end;

FUNCTION modifiedADJPincn(t1:LSSTREE_pstree):BOOLEAN; 
     VAR result:BOOLEAN;
         sonlist:LSSTREE_prelnode;
     BEGIN
     result:=FALSE;
     sonlist:=t1^.sons;
     WHILE NOT(result) AND (sonlist<>NIL) DO
       BEGIN
       IF ((sonlist^.node^.cat IN [ADJP]) AND
           (sonlist^.relation = modrel)) THEN
         BEGIN
         IF sonlist^.node^.ls^.ADJPfield^.form IN [comparative,superlative] THEN 
            result:=TRUE;
         IF sonlist^.node^.ls^.ADJPfield^.form =positive THEN 
            BEGIN
            sonlist:=sonlist^.node^.sons;
            IF sonlist^.relation = degreemodrel THEN
              BEGIN
              IF sonlist^.node^.cat=QP THEN
                BEGIN
                IF sonlist^.node^.ls^.QPfield^.thanas IN [dancompl,vancompl,alscompl] 
                  THEN result:=TRUE;
                END;
              IF sonlist^.node^.cat=ADVP THEN
                BEGIN
                IF sonlist^.node^.ls^.ADVPfield^.thanas IN [dancompl,vancompl,alscompl] 
                  THEN result:=TRUE;
                END;
              END;
            END;
         END;
       sonlist:=sonlist^.brother
       END;
     modifiedADJPincn:=result;
END; 


FUNCTION meest2qunderqp(t1:LSSTREE_pstree):BOOLEAN;  
                            (* This condition is supposed to be 
                              met if the head of the QP
                              is the q `meeste'; FJ, 19-11-90*)

     VAR result:BOOLEAN;
         sonlist:LSSTREE_prelnode;
     BEGIN
     result:=FALSE;
     sonlist:=t1^.sons;
     WHILE NOT result AND (sonlist<>NIL) DO
       BEGIN
       IF sonlist^.node^.cat=Q THEN 
        IF sonlist^.relation=head THEN
         BEGIN
         IF sonlist^.node^.ls^.qfield^.key=intkey('meest2qkey') THEN 
            result:=TRUE;
         END;
       sonlist:=sonlist^.brother
       END;
     meest2qunderqp:=result;
     END; (* meest2qunderqp *)

FUNCTION perfauxok(rec:VCOMPLEXrec;pa:LSDOMAINT_perfauxSETtype):BOOLEAN;
BEGIN WITH rec DO BEGIN
perfauxok :=
(
 (passive IN possvoicesvar)                                             OR
 (
  ((NOT (hebaux IN pa)) OR (hebbenaux IN foundauxesvar)) AND
  ((NOT (isaux  IN pa)) OR (zijnaux   IN foundauxesvar))  
 )
)                                                                          AND
(
 (NOT (passive IN possvoicesvar))                                      OR
 (
  ((NOT (hebaux IN pa))                    OR 
   (foundauxesvar * [hebbenaux, zijnaux, wordenaux] <> [])
  )                                                    AND
  ((NOT (isaux IN pa)) OR 
   (foundauxesvar * [zijnaux, wordenaux] <> [])
  )
 )
);
{
It checks whether the auxiliary combined  with some verb is compatible with it;

If the verb cannot in passive, then the auxiliary must be hebben, if it 
requires hebben as a perfaux; zijn, if it requires zijn as a perfaux

If the verb can occur in passive, then the auxiliary must be
hebben, zijn or worden if it requires hebben as a perfaux; zijn or worden
if it requires zijn as a perfaux.

Due to the extremely primitive programming language used, this condition is 
totally unreadable.
}
END;
END {perfauxok};

FUNCTION qpunderdetp(t1:LSSTREE_pstree):BOOLEAN;
     VAR result:BOOLEAN;
         sonlist:LSSTREE_prelnode;
     BEGIN
     result:=FALSE;
     sonlist:=t1^.sons;
     WHILE NOT(result) AND (sonlist<>NIL) DO
       BEGIN
       IF sonlist^.node^.cat=QP THEN result:=TRUE;
       sonlist:=sonlist^.brother
       END;
     qpunderdetp:=result;
END; (*qpunderdetp*)

FUNCTION extrappok(rec:SENTENCESRULErec):BOOLEAN;
BEGIN WITH rec DO BEGIN
  extrappok := (verbpfound OR postvok(adjppredrelfound,advppredrelfound,nppredrelfound,
                           prepppredrelfound,strandedrelfound,prepobjrelfound,
                           locargrelfound,dirargrelfound,objrelfound,
                           indobjrelfound,particlekey) OR 
                postvporelfound OR postvrelfound  );
END;
END (*extrappok*);

FUNCTION postvok(VAR adjppredrelfound,advppredrelfound,nppredrelfound,
                         prepppredrelfound,strandedrelfound,prepobjrelfound,
                         locargrelfound,dirargrelfound,objrelfound,
                         indobjrelfound:BOOLEAN;VAR particlekey:INTEGER):BOOLEAN;
BEGIN
 postvok := (postvpook(adjppredrelfound,advppredrelfound,nppredrelfound,
                           prepppredrelfound,strandedrelfound,prepobjrelfound,
                           locargrelfound,dirargrelfound,particlekey)  OR
             objrelfound                                               OR
             indobjrelfound  
            );
END (*postvok*);

FUNCTION postvpook(VAR adjppredrelfound,advppredrelfound,nppredrelfound,
                           prepppredrelfound,strandedrelfound,prepobjrelfound,
                           locargrelfound,dirargrelfound:BOOLEAN;
                           VAR particlekey:INTEGER):BOOLEAN;
BEGIN
 postvpook := (adjppredrelfound     OR 
               advppredrelfound     OR
               nppredrelfound       OR
               prepppredrelfound    OR
               (particlekey <> 0)   OR 
               strandedrelfound     OR 
               prepobjrelfound      OR
               locargrelfound       OR
               dirargrelfound
              );
END (*postvpook*);

PROCEDURE assqmax(s1:LSDOMAINT_specqtype; VAR s2:LSDOMAINT_specqtype);
BEGIN
  IF s1 = yesspec THEN s2 := s1;
END {assqmax};



PROCEDURE compnumber(VAR numbervar:LSDOMAINT_numbertype;
                         possnumbersvar:LSDOMAINT_numberSETtype;
                         b:LSSTREE_pSTREE
                    );
VAR NPac:LSDOMAINT_posscomaSETTYpe;               
    NPno:LSDOMAINT_numbertype;
    NPdf:LSDOMAINT_deftype; 
    NPh:LSDOMAINT_NPheadtype; 

BEGIN
  NPac := b^.ls^.NPfield^.actcomas;
  NPno := b^.ls^.NPfield^.number;
  NPdf := b^.ls^.NPfield^.definite;
  NPh  := b^.ls^.NPfield^.NPhead;

  IF (numbervar = plural) OR (NPno = plural)       THEN numbervar := plural
(*ELSE IF Negated(b)                               THEN numbervar := singular *)
  ELSE IF (NPh IN [ditNP, datNP])                  THEN numbervar := singular
  ELSE IF (mass IN NPac)         AND 
          (NPdf = indef)                           THEN numbervar := singular
  ELSE IF (count IN NPac)         AND
          (NPdf = indef)                           THEN numbervar := plural{+}

(*ELSE IF iederenzo(b)                             THEN numbervar := singular*)
  ELSE IF (count IN NPac)         AND
          (NPdf = def)            AND
          (plural IN possnumbersvar)               THEN numbervar := plural
  ELSE IF (count IN NPac)         AND
          (NPdf = def)            AND
          (singular IN possnumbersvar)             THEN numbervar := singular{+}
  ELSE IF (mass IN NPac)          AND
          (NPdf = def)            AND
          (plural IN possnumbersvar)               THEN numbervar := plural
  ELSE IF  (mass IN NPac)         AND
          (NPdf = def)           AND
          (singular IN possnumbersvar)             THEN numbervar := singular{+}
(*  ELSE IF **indefpro                               *)
  ELSE IF possnumbersvar=[singular]                THEN numbervar := singular
  ELSE IF true                                     THEN numbervar := plural;
END {compnumber};

