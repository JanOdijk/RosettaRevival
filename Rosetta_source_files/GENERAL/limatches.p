
(*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LIMATCHES
 *  Creation date   :  07-APR-1987
 *  Author          : rene leermakers
 *
 *  Copyright (c) 1987, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Contains matching procedures for use in translated
 *                    Mrules
 *
 *EMP:::===================================================================*)

Export(LIMATCHES);
pragma C_Include('lidomaint.pf');
pragma C_Include('listree.pf');
pragma C_Include('lisiddict.pf');
pragma C_Include('liiddict.pf');
pragma C_Include('limatches.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM LIMATCHES;
WITH LIDOMAINT, LISTREE, LISIDDICT, LIIDDICT;

VAR level     : INTEGER;
    newskey   : INTEGER;
    newsidskey: INTEGER;
    newidskey : INTEGER;
    newargs   : LIIDDICT_IdArgs;

FUNCTION LImatches_TEST1rels (rel1 : LIDOMAINT_synrel;
                                         list : LISTREE_prelnode;
                                         nothinginbetween:BOOLEAN)
                    : BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=false;
WHILE (list<>nil) and NOT(result) DO
  BEGIN
  result:= (rel1=list^.relation);
  list:=list^.brother
  END;
LImatches_TEST1rels:=result
END;
FUNCTION LImatches_TEST2rels (rel1,rel2 : LIDOMAINT_synrel;
                                         list : LISTREE_prelnode;
                                         nothinginbetween:BOOLEAN)
                    : BOOLEAN;
VAR result,result1:BOOLEAN;
BEGIN
result:=FALSE;
result1:=FALSE;
WHILE (list<>nil) and NOT(result) DO
  BEGIN
  result:= (rel1=list^.relation);
  list:=list^.brother;
  IF result THEN 
    BEGIN
    IF nothinginbetween THEN 
      BEGIN
      IF (list<>nil) THEN result1:= (rel2=list^.relation)
      END
    ELSE
     BEGIN
     WHILE (list<>nil) AND NOT(result1) DO
       BEGIN
       result1:=(rel2=list^.relation);
       list:=list^.brother
       END
     END
    END
  END;
LImatches_TEST2rels:=result AND result1
END;
FUNCTION LImatches_TEST3rels (rel1,rel2,rel3 : LIDOMAINT_synrel;
                                         list : LISTREE_prelnode;
                                         nothinginbetween:BOOLEAN)
                    : BOOLEAN;
VAR result,result1,result2:BOOLEAN;
BEGIN
result:=FALSE;
result1:=FALSE;
result2:=FALSE;
WHILE (list<>nil) and NOT(result) DO
  BEGIN
  result:= (rel1=list^.relation);
  list:=list^.brother;
  IF result THEN 
    BEGIN
    IF nothinginbetween THEN 
     BEGIN
     IF (list<>nil) THEN
       BEGIN
       result1:= (rel2=list^.relation);
       IF result1 THEN IF list^.brother<>nil THEN 
          result2:= (rel3=list^.brother^.relation)
       END
     END
    ELSE
     BEGIN
     WHILE (list<>nil) AND NOT(result1) DO
       BEGIN
       result1:=(rel2=list^.relation);
       list:=list^.brother;
       IF result1 THEN 
         BEGIN
         WHILE (list<>nil) AND NOT(result2) DO
           BEGIN
           result2:=(rel3=list^.relation);
           list:=list^.brother
           END
         END
       END
     END
    END
  END;
LIMATCHES_TEST3rels:=result AND result1 AND result2
END;
FUNCTION LImatches_TEST4rels (rel1,rel2,rel3,rel4 : LIDOMAINT_synrel;
                                         list : LISTREE_prelnode;
                                         nothinginbetween:BOOLEAN)
                    : BOOLEAN;
VAR result,result1,result2,result3:BOOLEAN;
BEGIN
result:=FALSE;
result1:=FALSE;
result2:=FALSE;
result3:=FALSE;
WHILE (list<>nil) and NOT(result) DO
  BEGIN
  result:= (rel1=list^.relation);
  list:=list^.brother;
  IF result THEN 
    BEGIN
    IF nothinginbetween THEN 
     BEGIN
     IF (list<>nil) THEN
       BEGIN
       result1:= (rel2=list^.relation);
       IF result1 THEN IF list^.brother<>nil THEN 
          result2:= (rel3=list^.brother^.relation);
       IF result2 THEN IF list^.brother^.brother<>nil THEN
          result3:= (rel4=list^.brother^.brother^.relation)
       END       
     END
    ELSE
     BEGIN
     WHILE (list<>nil) AND NOT(result1) DO
       BEGIN
       result1:=(rel2=list^.relation);
       list:=list^.brother;
       IF result1 THEN 
         BEGIN
         WHILE (list<>nil) AND NOT(result2) DO
           BEGIN
           result2:=(rel3=list^.relation);
           list:=list^.brother;
           IF result2 THEN
             BEGIN
             WHILE (list<>nil) AND NOT(result3) DO
               BEGIN
               result3:=(rel4=list^.relation);
               list:=list^.brother;
               END
             END
           END
         END
       END
     END
    END
  END;
LIMATCHES_TEST4rels:=result AND result1 AND result2 AND result3
END;

PROCEDURE LImatches_setlevel(L:INTEGER);
BEGIN
level:=L;
END;

FUNCTION LImatches_newlevel:INTEGER;
BEGIN
LImatches_newlevel:=level;
END;


FUNCTION LImatches_DecompInSidDict(skey  : INTEGER;
                                            argkey: INTEGER;
                                            arg   : INTEGER)
                    : BOOLEAN;
VAR
   found : BOOLEAN;
   rec   : LISIDDICT_RecordDef;
BEGIN
   found := FALSE;
   LISIDDICT_GetASidDict(skey, rec);
   REPEAT
      IF (rec.arg = argkey) AND (rec.argnr = arg) AND
         (rec.skey = skey) THEN found := TRUE
      ELSE BEGIN
         rec.skey := -1;
         LISIDDICT_GetNextASidDict(skey, rec)
      END;
   UNTIL found OR (rec.skey <> skey);

   IF found THEN BEGIN
      LImatches_DecompInSidDict := TRUE;
      newsidskey := rec.sidskey
      END
   ELSE BEGIN
      LImatches_DecompInSidDict := FALSE;
   END;

END {LImatches_DecompInSidDict};


FUNCTION LImatches_DecompGetSidDict(skey  : INTEGER;
                                            argkey: INTEGER;
                                            arg   : INTEGER)
                    : INTEGER;
BEGIN
   LImatches_DecompGetSidDict := newsidskey
END {LImatches_DecompGetSidDict};


FUNCTION LImatches_CompInSidDict(sidskey  : INTEGER;
                                            argkey: INTEGER;
                                            arg   : INTEGER)
                    : BOOLEAN;
VAR
   found : BOOLEAN;
   rec   : LISIDDICT_RecordDef;
BEGIN
   found := FALSE;
   LISIDDICT_GetGSidDict(sidskey, rec);
   REPEAT
      IF (rec.arg = argkey) AND (rec.argnr = arg) AND
         (rec.sidskey = sidskey) THEN found := TRUE
      ELSE BEGIN
         rec.sidskey := -1;
         LISIDDICT_GetNextGSidDict(sidskey, rec)
      END;
   UNTIL found OR (rec.sidskey <> sidskey);

   IF found THEN BEGIN
      LImatches_CompInSidDict := TRUE;
      newskey := rec.skey
      END
   ELSE BEGIN
      LImatches_CompInSidDict := FALSE;
   END;

END {LImatches_CompInSidDict};


FUNCTION LImatches_CompGetSidDict(sidskey  : INTEGER;
                                            argkey: INTEGER;
                                            arg   : INTEGER)
                    : INTEGER;
BEGIN
   LImatches_CompGetSidDict := newskey
END {LImatches_CompGetSidDict};


FUNCTION LImatches_DecompInIdDict(args: LIIDDICT_IdArgs;
                                           pattern: INTEGER)
                    : BOOLEAN;
VAR
   found : BOOLEAN;
   rec   : LIIdDict_RecordDef;

   FUNCTION EqualArgs(k1, k2: LIIDDICT_IdArgs): BOOLEAN;
   VAR
      equal : BOOLEAN;
      i     : INTEGER;
   BEGIN
      equal := FALSE;
      IF k1.nrargs = k2.nrargs THEN BEGIN
         equal := TRUE; i := 0;
         WHILE equal AND (i < k1.nrargs) DO BEGIN
            i := i+1;
            equal := (k1.argkeys[i] = k2.argkeys[i])
         END;
      END;
      EqualArgs := equal
   END {EqualArgs};


BEGIN
   found := FALSE;
   LIIdDict_GetAIdDict(args, rec);
   REPEAT
      IF EqualArgs(rec.args,args) AND (rec.pattern = pattern) THEN found := TRUE
      ELSE BEGIN
         rec.args.nrargs := -1;
         LIIdDict_GetNextAIdDict(args, rec)
      END;
   UNTIL found OR NOT EqualArgs(rec.args, args);

   IF found THEN BEGIN
      LImatches_DecompInIdDict := TRUE;
      newidskey := rec.idskey
      END
   ELSE BEGIN
      LImatches_DecompInIdDict := FALSE;
   END;

END {LImatches_DecompInIdDict};


FUNCTION LImatches_DecompGetIdDict(args: LIIDDICT_IdArgs;
                                            pattern: INTEGER)
                    : INTEGER;
BEGIN
   LImatches_DecompGetIdDict := newidskey
END {LImatches_DecompGetIdDict};


FUNCTION LImatches_CompInIdDict(idskey  : INTEGER;
                                         pattern : INTEGER)
                    : BOOLEAN;
VAR
   found : BOOLEAN;
   rec   : LIIdDict_RecordDef;
BEGIN
   found := FALSE;
   LIIdDict_GetGIdDict(idskey, rec);
   REPEAT
      IF (rec.idskey = idskey) AND (rec.pattern = pattern) THEN found := TRUE
      ELSE BEGIN
         rec.idskey := -1;
         LIIdDict_GetNextGIdDict(idskey, rec)
      END;
   UNTIL found OR (rec.idskey <> idskey);

   IF found THEN BEGIN
      LImatches_CompInIdDict := TRUE;
      newargs := rec.args
      END
   ELSE BEGIN
      LImatches_CompInIdDict := FALSE;
   END;

END {LImatches_CompInIdDict};


FUNCTION LImatches_CompGetIdDict(idskey  : INTEGER;
                                          pattern : INTEGER)
                    : LIIDDICT_IdArgs;
BEGIN
   LImatches_CompGetIdDict := newargs
END {LImatches_CompGetIdDict};



