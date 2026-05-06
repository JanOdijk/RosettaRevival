(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : GlobSubst
 *  Creation date   :  24-MAY-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(GLOBSUBST);
pragma C_include('listree.pf');
pragma C_include('globsubst.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)



PROGRAM GlobSubst;
WITH LISTREE;

CONST
   MaxSubsts = 100;

VAR
   TopOfStack : INTEGER;
   Stack      : ARRAY[1..MaxSubsts] OF RECORD
                                          index : INTEGER;
                                          subst : LISTREE_pStree
                                       END;

PROCEDURE GlobSubst_Init;
BEGIN {GlobSubst_Init}
   TopOfStack := 0;
END {GlobSubst_Init};



PROCEDURE GlobSubst_Push(index: INTEGER;
                                  subst: LISTREE_pStree);
BEGIN {GlobSubst_Push}
   TopOfStack := TopOfStack+1;
   Stack[TopOfStack].index := index;
   Stack[TopOfStack].subst := subst;
END {GlobSubst_Push};


PROCEDURE GlobSubst_Pop;
BEGIN {GlobSubst_Pop}
   TopOfStack := TopOfStack-1
END {GlobSubst_Pop};


FUNCTION GlobSubst_Get(index: INTEGER)
                  :LISTREE_pStree ;
VAR i     : INTEGER;
    found : BOOLEAN;
BEGIN {GlobSubst_Get}
   found := FALSE; i := 0;
   WHILE NOT found AND ( i < TopOfStack ) DO BEGIN
      i := i+1;
      found := Stack[i].index = index;
   END;   
   IF found THEN BEGIN
      GlobSubst_Get := Stack[i].subst
      END
   ELSE BEGIN
      GlobSubst_Get:= NIL
   END;
END {GlobSubst_Get};



