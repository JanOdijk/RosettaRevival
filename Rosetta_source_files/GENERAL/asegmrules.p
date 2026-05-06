(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : ASEGMRULES 
 *  Creation date   :                                               
 *  Author          : J. Rous
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  2-10-87: J. Rous: In the case of two occurrences
 *                     of a specific variable the matching algorithm has
 *                     to assign the same value to both occurrences of the
 *                     variable. This was implemented by checking achteraf
 *                     whether the second variable had the same value as
 *                     the first. In the new implementation the procedure 
 *                     `oldvarmatch' is introduced to match the second
 *                     occurrence of a variable with the previously found
 *                     value.
 *                     5-10-87: J. Rous: For performance reasons the parameter
 *                     `varinst' which was passed to the procedure `searcher',
 *                     `varmatch' and `oldvarmatch' has been replaced by a
 *                     global variable.
 *                     6-10-87: J. Rous: In case of SUFFIX or RGLUE rules the
 *                     the instantiations of the variables must be reversed.
 *                     because the matching algorithm works in these cases from
 *                     right to left. In the changed version of the algorithm
 *                     this is performed inside the procedure `evalresults'
 *                     (by means of the procedure `normalize') in stead of in 
 *                     `varmatch'.
 *
 *EMP:::===================================================================*)

Export(asegmrules);
pragma C_include('string.pf');
pragma C_include('limorfdef.pf');
pragma C_include('asegmrules.pf');
pragma C_include('segmrules.pf');
pragma C_include('mem.pf');
pragma C_include('debug.pf');
pragma C_include('asegmrules.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM ASEGMRULES;
WITH STRNG,LIMORFDEF,SEGMRULES,MEM,DEBUG;

CONST
   MAXPFSEARCHTABLE    = 600;
   MAXPFCHARTABLE      = 700;
   MAXPFVARTABLE       = 10;
   MAXPFVARSTRTABLE    = 10;
   MAXSFSEARCHTABLE    = 6000;
   MAXSFCHARTABLE      = 6000;
   MAXSFVARTABLE       = 170;
   MAXSFVARSTRTABLE    = 80;
   MAXLGLUESEARCHTABLE = 600;
   MAXLGLUECHARTABLE   = 600;
   MAXLGLUEVARTABLE    = 10;
   MAXLGLUEVARSTRTABLE = 10;
   MAXRGLUESEARCHTABLE = 900;
   MAXRGLUECHARTABLE   = 900;
   MAXRGLUEVARTABLE    = 300;
   MAXRGLUEVARSTRTABLE = 70;
   MAXMGLUESEARCHTABLE = 250;
   MAXMGLUECHARTABLE   = 250;
   MAXMGLUEVARTABLE    = 40;
   MAXMGLUEVARSTRTABLE = 40;
   MAXPFRULES          = 200;
   MAXSFRULES          = 3000;
   MAXLGLUERULES       = 200;
   MAXRGLUERULES       = 500;
   MAXMGLUERULES       = 40;

TYPE
   ruletype = (minruletype, PFrule, SFrule, LGLUErule,
               RGLUErule, MGLUErule, omegarule, maxruletype);

   varinsttype = ARRAY[1..SEGMRULES_MAXVARS] OF RECORD 
                                                   vnr : INTEGER;
                                                   v   : STRING_String;
                                                   substv   : STRING_String
                                                END;

VAR 
   varinst        : varinsttype;
   tbl            : ARRAY[1..SEGMRULES_MAXVARSINRULE] OF RECORD 
                                           v: STRING_String;
                                           l: STRING_range
                                      END;
   T              : SEGMRULES_searchtree;

   PFruleTable    : ARRAY[1..MAXPFRULES] OF SEGMRULES_FixRule;
   SFruleTable    : ARRAY[1..MAXSFRULES] OF SEGMRULES_FixRule;
   LGLUEruleTable : ARRAY[1..MAXLGLUERULES] OF SEGMRULES_GLUErule;
   RGLUEruleTable : ARRAY[1..MAXRGLUERULES] OF SEGMRULES_GLUErule;
   MGLUEruleTable : ARRAY[1..MAXMGLUERULES] OF SEGMRULES_GLUErule;

   PFsearchTable    : ARRAY[1..MAXPFSEARCHTABLE] OF SEGMRULES_searchtree;
   PFCharRecTable   : ARRAY[1..MAXPFCHARTABLE] OF SEGMRULES_CharRecord;
   PFVarRecTable    : ARRAY[1..MAXPFVarTABLE] OF SEGMRULES_VarRecord;
   PFVarStrRecTable : ARRAY[1..MAXPFVarStrTABLE] OF SEGMRULES_VarStrRecord;
   SFsearchTable    : ARRAY[1..MAXSFSEARCHTABLE] OF SEGMRULES_searchtree;
   SFCharRecTable   : ARRAY[1..MAXSFCHARTABLE] OF SEGMRULES_CharRecord;
   SFVarRecTable    : ARRAY[1..MAXSFVarTABLE] OF SEGMRULES_VarRecord;
   SFVarStrRecTable : ARRAY[1..MAXSFVarStrTABLE] OF SEGMRULES_VarStrRecord;
   LGLUEsearchTable : ARRAY[1..MAXLGLUESEARCHTABLE] OF SEGMRULES_searchtree;
   LGLUECharRecTable: ARRAY[1..MAXLGLUECHARTABLE] OF SEGMRULES_CharRecord;
   LGLUEVarRecTable : ARRAY[1..MAXLGLUEVarTABLE] OF SEGMRULES_VarRecord;
   LGLUEVarStrRecTable : ARRAY[1..MAXLGLUEVarStrTABLE] OF SEGMRULES_VarStrRecord;
   RGLUEsearchTable : ARRAY[1..MAXRGLUESEARCHTABLE] OF SEGMRULES_searchtree;
   RGLUECharRecTable: ARRAY[1..MAXRGLUECHARTABLE] OF SEGMRULES_CharRecord;
   RGLUEVarRecTable : ARRAY[1..MAXRGLUEVarTABLE] OF SEGMRULES_VarRecord;
   RGLUEVarStrRecTable : ARRAY[1..MAXRGLUEVarStrTABLE] OF SEGMRULES_VarStrRecord;
   MGLUEsearchTable : ARRAY[1..MAXMGLUESEARCHTABLE] OF SEGMRULES_searchtree;
   MGLUECharRecTable: ARRAY[1..MAXMGLUECHARTABLE] OF SEGMRULES_CharRecord;
   MGLUEVarRecTable : ARRAY[1..MAXMGLUEVarTABLE] OF SEGMRULES_VarRecord;
   MGLUEVarStrRecTable : ARRAY[1..MAXMGLUEVarStrTABLE] OF SEGMRULES_VarStrRecord;

   PFresult  : SEGMRULES_pPFruleResult;
   SFresult  : SEGMRULES_pSFruleResult;
   LGLUEresult: SEGMRULES_pGLUEruleResult;
   RGLUEresult: SEGMRULES_pGLUEruleResult;
   MGLUEresult: SEGMRULES_pGLUEruleResult;

   CurPFkey,
   CurSFkey   : integer;

   CurrentType: ruletype;
   FileOpened : BOOLEAN;


PROCEDURE SetRuleType(c: ruletype);
BEGIN
   Currenttype := c
END {SetRuleType};


FUNCTION GetRuleType: ruletype;
BEGIN
   GetRuleType := CurrentType
END {GetRuleType};


PROCEDURE InitVarinst;
VAR
   j : INTEGER;
BEGIN
   FOR j := 1 TO SEGMRULES_MaxVars DO varinst[j].vnr := -1
END {InitVarInst};


(*-------------------------------------------------------------------------*
 * Local MAKE functions     
 *-------------------------------------------------------------------------*)

FUNCTION makeAPFresult(CONST f: LIMORFDEF_PhonMarker;
                       CONST key: integer;
                       CONST s: SEGMRULES_FixString;
                       CONST n: SEGMRULES_pPFruleResult): SEGMRULES_pPFruleResult;
VAR r : SEGMRULES_pPFruleResult;

BEGIN
   Mem_NewDefault(Loopholes.SIZEof(SEGMRULES_PFRuleResult), Loopholes.Retype(r,Mem_Ptr));
   WITH r^ DO BEGIN
      FON := f;
      PFK := key;
      STRING_Constant(a1, s.str, s.l);
      STRING_ConstantEmpty(a);
      nxtamb := n
   END;
   makeAPFresult := r
END {makeAPFresult};
                       

FUNCTION makeASFresult(CONST f: LIMORFDEF_PhonMarker;
                       CONST c: LIMORFDEF_ContextConds;
                       CONST key: integer;
                       CONST s: SEGMRULES_FixString;
                       CONST n: SEGMRULES_pSFruleResult): SEGMRULES_pSFruleResult;
VAR r : SEGMRULES_pSFruleResult;
    rprime : Mem_ptr;

BEGIN
   Mem_NewDefault(Loopholes.SIZEof(SEGMRULES_SFRuleResult), rprime);
   r := Loopholes.Retype(rprime, SEGMRULES_pSFruleResult);
   WITH r^ DO BEGIN
      FON := f;
      CC  := c;
      SFK := key;
      STRING_Constant(a1, s.str, s.l);
      STRING_ConstantEmpty(a);
      nxtamb := n;
   END;
   makeASFresult := r;
END {makeASFresult};
                       

FUNCTION makeAGLUEresult(i: integer;
                         qa: SEGMRULES_GLUEdictconsttype;
                         n: SEGMRULES_pGLUEruleResult): SEGMRULES_pGLUEruleResult;
VAR r : SEGMRULES_pGLUEruleResult;
    j : INTEGER;
BEGIN
   Mem_NewDefault(Loopholes.SIZEof(SEGMRULES_GLUERuleResult), Loopholes.Retype(r,Mem_Ptr));
   WITH r^ DO BEGIN
      M := i;
      FOR j :=1 TO i DO STRING_Constant(q[j], qa[j].str, qa[j].l);
      STRING_ConstantEmpty(a);
      nxtamb := n
   END;
   makeAGLUEresult := r
END {makeAGLUEresult};
                       

(*-------------------------------------------------------------------------*
 * The procedure evalresults eventually applies the segmentation rule if 
 * a match with the input string has been found. 
 * Evalresults will be used for all kind of segmentation rules, 
 * analytical PF, SF, FF and GLUE rules and generative PF, SF, FF and
 * GLUE rules.
 *-------------------------------------------------------------------------*)
   PROCEDURE Normalize(VAR vinst  : varinsttype; cv: INTEGER);
   VAR
      j : INTEGER;
   BEGIN
      FOR j := 1 TO cv DO BEGIN
         STRING_Reverse(vinst[j].substv, varinst[j].substv);
         vinst[j].vnr := varinst[j].vnr;
      END      
   END;


PROCEDURE evalresults(r: integer;           { index in ruletable }
                      i: integer;           { number of processed chars }
                      s: STRING_String;     { processed match string }
                      cv: integer);         { number of processed var's }
VAR
   nindex,
   index  : STRING_range;
   vj,j,k : integer;
   RPF,
   RSF    : SEGMRULES_FixRule;
   RLGLUE,
   RRGLUE,
   RMGLUE : SEGMRULES_GLUErule;
   b      : STRING_String;
   vinst  : varinsttype;


BEGIN
   DEBUG_WriteStr('-> eval ',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(i,10,true);
   DEBUG_WriteInteger(cv,10,true);
   DEBUG_WriteInteger(r,10,true);
   Debug_WriteLine(TRUE);

   CASE GetRuleType OF
   PFrule : BEGIN 
	    WHILE r <> -1 DO BEGIN
	       RPF := PFruleTable[r]; 
	       IF (RPF.exact and ( i = STRING_Length(s))) or
		  ( not RPF.exact ) THEN BEGIN
		  PFresult := makeAPFresult(RPF.FON, RPF.K, RPF.r, PFresult) ;
		  FOR j := 1 TO cv DO BEGIN                      
		     vj := varinst[j].vnr; index := 1;         
		     REPEAT                        
			index := STRING_FindFirstSubString(PFresult^.a1, tbl[vj].v, index);             
			IF index <> 0 THEN                           
			   STRING_replace(PFresult^.a1, PFresult^.a1, index, tbl[vj].l, varinst[j].substv)                   
		     UNTIL index = 0                   
		  END;                  
		  STRING_ExtractEnd(b,s,i+1);
		  STRING_Append(PFresult^.a1,b) 
	       END;
	       r := RPF.nxt
	    END
	    END;
   SFrule : BEGIN 
            Normalize(vinst,cv);
	    WHILE r <> -1 DO BEGIN
	       RSF := SFruleTable[r]; 
	       IF (RSF.exact and ( i = STRING_Length(s))) or
		  ( not RSF.exact ) THEN BEGIN
		  SFresult := makeASFresult(RSF.FON, RSF.CC, RSF.K, RSF.r, SFresult);
		  FOR j := 1 TO cv DO BEGIN
		     vj := vinst[j].vnr; index := 1;
		     REPEAT
			index := STRING_FindFirstSubString(SFresult^.a1, tbl[vj].v, index);
			IF index <> 0 THEN BEGIN
			   STRING_replace(SFresult^.a1, SFresult^.a1, index, tbl[vj].l, vinst[j].substv);
			END
		     UNTIL index = 0;
		  END;
		  STRING_ExtractEnd(b,s,i+1);
		  STRING_Reverse(b,b);
		  STRING_Concat(SFresult^.a1, b, SFresult^.a1);
   DEBUG_WriteStr('eval: ',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteString(SFresult^.a1, DEBUG_MaxIO, TRUE);
   Debug_WriteLine(TRUE);
	       END;
	       r := RSF.nxt
	    END
	    END;
   LGLUErule : 
	    BEGIN 
	    WHILE r <> -1 DO BEGIN
	       RLGLUE := LGLUEruleTable[r]; 
	       LGLUEresult := makeAGLUEresult(RLGLUE.M, RLGLUE.q, LGLUEresult);
	       FOR j := 1 TO cv DO BEGIN
		  vj := varinst[j].vnr; 
		  FOR k := 1 TO RLGLUE.M DO BEGIN
		     index := 1;
		     REPEAT
			index := STRING_FindFirstSubString(LGLUEresult^.q[k], tbl[vj].v, index);
			IF index <> 0 THEN BEGIN
			   STRING_replace(LGLUEresult^.q[k], 
					  LGLUEresult^.q[k], 
					  index, tbl[vj].l, 
					  varinst[j].substv);
			END
		     UNTIL index = 0
		  END
	       END;
	       STRING_ExtractEnd(b,s,i+1);
	       STRING_Append(LGLUEresult^.q[RLGLUE.M],b);
	       r := RLGLUE.nxt
	    END
	    END;
   RGLUErule : 
	    BEGIN 
            Normalize(vinst,cv);
	    WHILE r <> -1 DO BEGIN
	       RRGLUE := RGLUEruleTable[r]; 
	       RGLUEresult := makeAGLUEresult(RRGLUE.M, RRGLUE.q, RGLUEresult);
	       FOR j := 1 TO cv DO BEGIN
		  vj := vinst[j].vnr;
		  FOR k := 1 to RRGLUE.M DO BEGIN
		     index := 1;
		     REPEAT
			index := STRING_FindFirstSubString(RGLUEresult^.q[k], tbl[vj].v, index);
			IF index <> 0 THEN BEGIN
			   STRING_replace(RGLUEresult^.q[k], 
					  RGLUEresult^.q[k], 
					  index, tbl[vj].l,
					  vinst[j].substv);
			END
		     UNTIL index = 0
		  END
	       END;
	       STRING_ExtractEnd(b,s,i+1);
	       STRING_Reverse(b,b);
	       STRING_Concat(RGLUEresult^.q[1], b, RGLUEresult^.q[1]);
	       r := RRGLUE.nxt
	    END
	    END;
   MGLUErule : 
	     BEGIN 
	    IF i = STRING_Length(s) THEN BEGIN
	    WHILE r <> -1 DO BEGIN
	       RMGLUE := MGLUEruleTable[r]; 
{
	       DEBUG_WriteInteger(RMGLUE.M,10,true);
	       Debug_WriteLine(TRUE);
}
	       MGLUEresult := makeAGLUEresult(RMGLUE.M, RMGLUE.q, MGLUEresult);
	       FOR j := 1 TO cv DO BEGIN
		  vj := varinst[j].vnr;
		  FOR k := 1 to RMGLUE.M DO BEGIN
		     index := 1;
		     REPEAT
			index := STRING_FindFirstSubString(MGLUEresult^.q[k], tbl[vj].v, index);
			IF index <> 0 THEN BEGIN
			   STRING_replace(MGLUEresult^.q[k], 
					  MGLUEresult^.q[k], 
					  index, tbl[vj].l,
					  varinst[j].substv);
			END
		     UNTIL index = 0
		  END
	       END;
	       r := RMGLUE.nxt
	    END;
	    END
	    END
   END;

   DEBUG_WriteStr('<- eval ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE)

END {evalresults};   


PROCEDURE GetSearchTableEntry(VAR T: SEGMRULES_searchtree;
                              cur  : integer);
BEGIN
   CASE GetRuleType OF
      PFrule    : T := PFsearchTable[cur]; 
      SFrule    : T := SFsearchTable[cur]; 
      LGLUErule : T := LGLUEsearchTable[cur]; 
      RGLUErule : T := RGLUEsearchTable[cur]; 
      MGLUErule : T := MGLUEsearchTable[cur] 
   END
END {GetSearchTableEntry}; 


PROCEDURE GetChar(cur: INTEGER;
                  VAR W: SEGMRULES_CharRecord);
BEGIN
   CASE GetRuleType OF
      PFrule    : W := PFCharRecTable[cur]; 
      SFrule    : W := SFCharRecTable[cur]; 
      LGLUErule : W := LGLUECharRecTable[cur]; 
      RGLUErule : W := RGLUECharRecTable[cur]; 
      MGLUErule : W := MGLUECharRecTable[cur] 
   END
END {GetChar}; 


PROCEDURE GetVar(cur: INTEGER;
                 VAR U: SEGMRULES_VarRecord);
BEGIN
   CASE GetRuleType OF
      PFrule    : U := PFVarRecTable[cur]; 
      SFrule    : U := SFVarRecTable[cur]; 
      LGLUErule : U := LGLUEVarRecTable[cur]; 
      RGLUErule : U := RGLUEVarRecTable[cur]; 
      MGLUErule : U := MGLUEVarRecTable[cur] 
   END
END {GetVar}; 


PROCEDURE GetVarStr(cur: INTEGER;
                 VAR U: SEGMRULES_VarStrRecord);
BEGIN
   CASE GetRuleType OF
      PFrule    : U := PFVarStrRecTable[cur]; 
      SFrule    : U := SFVarStrRecTable[cur]; 
      LGLUErule : U := LGLUEVarStrRecTable[cur]; 
      RGLUErule : U := RGLUEVarStrRecTable[cur]; 
      MGLUErule : U := MGLUEVarStrRecTable[cur] 
   END
END {GetVarStr}; 


FUNCTION ExistsChar(T: SEGMRULES_SearchTree; c: CHAR): INTEGER;
VAR
   i,
   result : INTEGER;
   W      : SEGMRULES_CharRecord;
BEGIN
   result := -1;
   IF c in T.exists THEN BEGIN
      i  := T.chars;
{
      DEBUG_WriteInteger(i,10,true);
      Debug_WriteLine(TRUE);
}
      GetChar(i, W);
      WHILE W.ch <> c DO BEGIN
         i := W.nxtchar;
{
         DEBUG_WriteInteger(i,10,true);
         Debug_WriteLine(TRUE);
}
         GetChar(i, W)
      END;
      result := W.nxt
   END;
   ExistsChar := result
END;


PROCEDURE searcher(s: STRING_String;      { string to be matched }
                   i: integer;            { number previously matched chars}
                   cur : integer;         { index of current search table entry}
                   curvar: integer);      { number of variables found }
FORWARD;



PROCEDURE oldvarmatch
                  (s: STRING_String;     { match string to be processed }
                   i: integer;           { number previouslys matched chars}
                   index : integer;      { next searchtable entry if varmatch
                                           is successful }
                   oldvar : INTEGER;     { nr of old variable that should match}
                   curvar: integer);     { number of variables found }
VAR
   k         : INTEGER;
   identical : BOOLEAN;
BEGIN
   k := 0; identical := TRUE;
   WHILE (i < STRING_Length(s)) AND (k < STRING_Length(varinst[oldvar].v)) AND
         identical DO BEGIN
      i := i+1; k := k+1;
      identical := s[i] = varinst[oldvar].v[k]    
   END;
   IF identical AND (k = STRING_Length(varinst[oldvar].v)) THEN BEGIN
      searcher(s, i, index, curvar)
   END;
END {oldvarmatch};


PROCEDURE varmatch(s: STRING_String;     { match string to be processed }
                   i: integer;           { number previouslys matched chars}
                   cur : integer;        { current index in search table while
                                           matching a variable of string s }
                   curvar: integer;      { number of variables found }
                   index : integer;      { next searchtable entry if varmatch
                                           is successful }
                   varnr : integer;      { number of the current var } 
                   v     : STRING_String); { current varstring }
VAR
   Vstr      : SEGMRULES_VarStrRecord;
   T         : SEGMRULES_searchtree;
   v1, v2,
   sch       : STRING_String;
   ch        : char;
   j         : integer;
   identical : boolean;
   ci        : integer;

BEGIN

   DEBUG_WriteStr('-> varmatch',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(i,10,true);
   DEBUG_WriteInteger(cur,10,true);
   DEBUG_WriteInteger(curvar,10,true);
   DEBUG_WriteInteger(index,10, true);
   DEBUG_WriteInteger(varnr,10, true);
   DEBUG_WriteString(v,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);

   GetSearchTableEntry(T, cur);
   IF T.endofvar THEN BEGIN
      (*-------------------------------------------------------------------*
       * T.endofvar so we have found a match with an instance of the
       * current variable.
       *-------------------------------------------------------------------*)
      (*----------------------------------------------------------------*
       * Try to find a match with an instance of the current variable
       * that also starts with s[1]..s[i]. 
       * Notice that varinst is a global variable. This is the only place 
       * in the matching software where varinst is changed. 
       * It is necessary to undo these changes because variable `curvar'
       * determines how many different variables have been instantiated but
       * the match strings are stored in such a way that they contain the
       * variables @1@..@curvar@, where the value for `curvar' must be
       * taken at the moment the match was found. If not a complete
       * match has been found, it is unknown which variables have been
       * found and which have not been found.
       *----------------------------------------------------------------*)
      varinst[varnr].v := v;
      varinst[varnr].substv := v;
      varinst[varnr].vnr := varnr;
      searcher(s, i, index, curvar+1);
      varinst[varnr].vnr := -1;
{
      STRING_ConstantEmpty(varinst[varnr].v)
}
   END;

   IF T.result > 0 THEN BEGIN
      Vstr.nxt := T.result;
      REPEAT
   DEBUG_WriteStr('index: ',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(Vstr.nxt,10,true);
   Debug_WriteLine(TRUE);
         GetVarStr(Vstr.nxt, Vstr);
         varinst[varnr].v := v;
         STRING_Constant(varinst[varnr].substv, Vstr.str, Vstr.len);
         varinst[varnr].vnr := varnr;
   DEBUG_WriteStr('str: ',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteString(varinst[varnr].substv, DEBUG_MaxIO, TRUE);
   Debug_WriteLine(TRUE);
   DEBUG_WriteStr('index: ',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(Vstr.nxt,10,true);
   Debug_WriteLine(TRUE);
         searcher(s, i, index, curvar+1);
         varinst[varnr].vnr := -1;
{
         STRING_ConstantEmpty(varinst[varnr].v)
}
      UNTIL (Vstr.nxt = -1)
   END;
      

   (*----------------------------------------------------------------------*
    * If the complete string hasn't been processed yet, look for a match
    * of char s[i+1].
    *----------------------------------------------------------------------*)
   IF i < STRING_length(s) THEN BEGIN
      i := i+1; STRING_ExtractChar(ch, s, i);
      ci := ExistsChar(T, ch);
      IF ci <> -1 THEN BEGIN
         (*----------------------------------------------------------------*
          * A match of char s[i+1] has been found. Now try to match the
          * rest of the string (s[i+1]..s[length]) with an instance of
          * the current variable.
          *----------------------------------------------------------------*)
         v1 := v; 
         STRING_ConstantChar(sch, ch); STRING_Append(v1, sch);
         varmatch(s, i, ci, curvar, index, varnr, v1);
      END;

      (*-------------------------------------------------------------------*
       * The following lines handle a do not care character in a variable
       * value.
       *-------------------------------------------------------------------*)

      ci := ExistsChar(T, '#');
      IF ci <> -1 THEN BEGIN
         DEBUG_WriteStr('Found a do not care character!',DEBUG_MaxIO,0,TRUE);
         Debug_WriteLine(TRUE);
         v2 := v;
         STRING_ConstantChar(sch,ch); STRING_Append(v2, sch);
         varmatch(s, i, ci, curvar, index, varnr, v2)
      END;

   END;

   DEBUG_WriteStr('<- varmatch',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END;      


PROCEDURE searcher;

VAR
   k       : integer;
   T         : SEGMRULES_searchtree;
   U         : SEGMRULES_VarRecord;
   ch        : char;
   v         : STRING_String;
   ci        : integer;
   hlp       : STRING_String;

BEGIN

   DEBUG_WriteStr('-> searcher',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(i,10,true);
   DEBUG_WriteInteger(cur,10,true);
   DEBUG_WriteInteger(curvar,10,true);
   Debug_WriteLine(TRUE);

   GetSearchTableEntry(T, cur);
   IF T.result >= 0 THEN BEGIN
      (*-------------------------------------------------------------------*
       * We have found a match, so now we can try to apply the segmentation
       * rules.
       *-------------------------------------------------------------------*)
      evalresults(T.result, i, s, curvar);
   END;

   IF i < STRING_length(s) THEN BEGIN
      i := i+1; STRING_ExtractChar(ch, s, i);
      STRING_ConstantChar(hlp, ch);

      DEBUG_WriteString(hlp,Debug_MaxIO,TRUE);
      Debug_WriteLine(TRUE);

      ci := ExistsChar(T, ch);
      IF ci <> -1 THEN BEGIN
         searcher(s, i, ci, curvar);
      END;

      STRING_ConstantEmpty(v);

      k := T.vars;
      WHILE k <> -1 DO BEGIN
         GetVar(k, U);
         IF varinst[U.vnr].vnr = U.vnr THEN BEGIN
            oldvarmatch(s, i-1, U.nxt, U.vnr, curvar)
            END
         ELSE BEGIN
            varmatch(s, i-1, U.v, curvar,
                     U.nxt, U.vnr, v);
         END;
         k := U.nxtvar
      END;
   END;

   DEBUG_WriteStr('<- searcher',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {searcher};


PROCEDURE ASEGMRULES_init;

VAR
   InitSearchRecord : SEGMRULES_Searchtree;
   i   : integer;
   ch  : char;
   SD  : SEGMRULES_SearchDict;
   CD  : SEGMRULES_CharDict;
   VD  : SEGMRULES_VarDict;
   VSD : SEGMRULES_VarStrDict;
   FD  : SEGMRULES_FixDict;
   GD  : SEGMRULES_GlueDict;
   
BEGIN

   tbl[1].v := '@1@'; tbl[1].l := 3;
   tbl[2].v := '@2@'; tbl[2].l := 3;
   tbl[3].v := '@3@'; tbl[3].l := 3;
   tbl[4].v := '@4@'; tbl[4].l := 3;
   tbl[5].v := '@5@'; tbl[5].l := 3;
   tbl[6].v := '@6@'; tbl[6].l := 3;
   tbl[7].v := '@7@'; tbl[7].l := 3;
   tbl[8].v := '@8@'; tbl[8].l := 3;
   tbl[9].v := '@9@'; tbl[9].l := 3;

   PFresult := nil;
   SFresult := nil;
   LGLUEresult := nil;
   RGLUEresult := nil;
   MGLUEresult := nil;

   WITH InitSearchRecord DO BEGIN
      result := -1;
      nrvars := 0;
      vars   := -1;
      chars  := -1;
      exists := [];
   END;

   

   SEGMRULES_SearchOpenRead(SD, 'APFSEARCH');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(SD) DO BEGIN
	 SEGMRULES_SearchRead(SD, PFSearchTable[i]);
	 i:=i+1
      END;
      SEGMRULES_SearchClose(SD)
      END
   ELSE BEGIN
      PFSearchTable[1] := InitSearchRecord
   END;

   SEGMRULES_CharOpenRead(CD, 'APFCHAR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(CD) DO BEGIN
	 SEGMRULES_CharRead(CD, PFCharRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_CharClose(CD)
   END;


   SEGMRULES_VarOpenRead(VD, 'APFVAR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(VD) DO BEGIN
	 SEGMRULES_VarRead(VD, PFVarRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_VarClose(VD)
   END;


   SEGMRULES_VarStrOpenRead(VSD, 'APFVARSTR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(VSD) DO BEGIN
	 SEGMRULES_VarStrRead(VSD, PFVarStrRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_VarStrClose(VSD)
   END;


   SEGMRULES_FixRuleOpenRead(FD, 'APFRULE');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(FD) DO BEGIN
	 SEGMRULES_FixRuleRead(FD, PFRuleTable[i]);
	 i:=i+1
      END;
      SEGMRULES_FixruleClose(FD)
   END;


   SEGMRULES_SearchOpenRead(SD, 'ASFSEARCH');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(SD) DO BEGIN
	 SEGMRULES_SearchRead(SD, SFSearchTable[i]);
	 i:=i+1
      END;
      SEGMRULES_SearchClose(SD)
      END
   ELSE BEGIN
      SFSearchTable[1] := InitSearchRecord
   END;

   SEGMRULES_CharOpenRead(CD, 'ASFCHAR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(CD) DO BEGIN
	 SEGMRULES_CharRead(CD, SFCharRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_CharClose(CD)
   END;


   SEGMRULES_VarOpenRead(VD, 'ASFVAR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(VD) DO BEGIN
	 SEGMRULES_VarRead(VD, SFVarRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_VarClose(VD)
   END;

   SEGMRULES_VarStrOpenRead(VSD, 'ASFVARSTR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(VSD) DO BEGIN
	 SEGMRULES_VarStrRead(VSD, SFVarStrRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_VarStrClose(VSD)
   END;


   SEGMRULES_FixRuleOpenRead(FD, 'ASFRULE');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(FD) DO BEGIN
	 SEGMRULES_FixRuleRead(FD, SFRuleTable[i]);
	 i:=i+1
      END;
      SEGMRULES_FixruleClose(FD)
   END;

   SEGMRULES_SearchOpenRead(SD, 'ALGLUESEARCH');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(SD) DO BEGIN
	 SEGMRULES_SearchRead(SD, LGLUESearchTable[i]);
	 i:=i+1
      END;
      SEGMRULES_SearchClose(SD)
      END
   ELSE BEGIN
      LGLUESearchTable[1] := InitSearchRecord
   END;

   SEGMRULES_CharOpenRead(CD, 'ALGLUECHAR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(CD) DO BEGIN
	 SEGMRULES_CharRead(CD, LGLUECharRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_CharClose(CD)
   END;


   SEGMRULES_VarOpenRead(VD, 'ALGLUEVAR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(VD) DO BEGIN
	 SEGMRULES_VarRead(VD, LGLUEVarRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_VarClose(VD)
   END;

   SEGMRULES_VarStrOpenRead(VSD, 'ALGLUEVARSTR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(VSD) DO BEGIN
	 SEGMRULES_VarStrRead(VSD, LGLUEVarStrRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_VarStrClose(VSD)
   END;


   SEGMRULES_GLUERuleOpenRead(GD, 'ALGLUERULE');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(GD) DO BEGIN
	 SEGMRULES_GlueRuleRead(GD, LGLUERuleTable[i]);
	 i:=i+1
      END;
      SEGMRULES_GLUEruleClose(GD)
   END;

   SEGMRULES_SearchOpenRead(SD, 'ARGLUESEARCH');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(SD) DO BEGIN
	 SEGMRULES_SearchRead(SD, RGLUESearchTable[i]);
	 i:=i+1
      END;
      SEGMRULES_SearchClose(SD)
      END
   ELSE BEGIN
      RGLUESearchTable[1] := InitSearchRecord
   END;

   SEGMRULES_CharOpenRead(CD, 'ARGLUECHAR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(CD) DO BEGIN
	 SEGMRULES_CharRead(CD, RGLUECharRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_CharClose(CD)
   END;


   SEGMRULES_VarOpenRead(VD, 'ARGLUEVAR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(VD) DO BEGIN
	 SEGMRULES_VarRead(VD, RGLUEVarRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_VarClose(VD)
   END;

   SEGMRULES_VarStrOpenRead(VSD, 'ARGLUEVARSTR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(VSD) DO BEGIN
	 SEGMRULES_VarStrRead(VSD, RGLUEVarStrRecTable[i]);
         i:=i+1
      END;
      SEGMRULES_VarStrClose(VSD)
   END;


   SEGMRULES_GLUERuleOpenRead(GD, 'ARGLUERULE');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(GD) DO BEGIN
	 SEGMRULES_GlueRuleRead(GD, RGLUERuleTable[i]);
	 i:=i+1
      END;
      SEGMRULES_GLUEruleClose(GD)
   END;


   SEGMRULES_SearchOpenRead(SD, 'AMGLUESEARCH');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(SD) DO BEGIN
	 SEGMRULES_SearchRead(SD, MGLUESearchTable[i]);
	 i:=i+1
      END;
      SEGMRULES_SearchClose(SD)
      END
   ELSE BEGIN
      MGLUESearchTable[1] := InitSearchRecord
   END;

   SEGMRULES_CharOpenRead(CD, 'AMGLUECHAR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(CD) DO BEGIN
	 SEGMRULES_CharRead(CD, MGLUECharRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_CharClose(CD)
   END;


   SEGMRULES_VarOpenRead(VD, 'AMGLUEVAR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(VD) DO BEGIN
	 SEGMRULES_VarRead(VD, MGLUEVarRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_VarClose(VD)
   END;


   SEGMRULES_VarStrOpenRead(VSD, 'AMGLUEVARSTR');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(VSD) DO BEGIN
	 SEGMRULES_VarStrRead(VSD, MGLUEVarStrRecTable[i]);
	 i:=i+1
      END;
      SEGMRULES_VarStrClose(VSD)
   END;


   SEGMRULES_GLUERuleOpenRead(GD, 'AMGLUERULE');
   IF SEGMRULES_FileOpened THEN BEGIN
      i := 1;
      WHILE not EOF(GD) DO BEGIN
	 SEGMRULES_GlueRuleRead(GD, MGLUERuleTable[i]);
	 i:=i+1
      END;
      SEGMRULES_GLUEruleClose(GD)
   END;

END {ASEGMRULES_Init};



FUNCTION ASEGMRULES_ASuffixTableHandler(s: STRING_String):
                                                SEGMRULES_pSFruleResult;
BEGIN
   SetRuleType(SFrule);
   STRING_Reverse(s, s);
   InitVarinst;
   searcher(s, 0, 1, 0);
   ASEGMRULES_ASuffixTableHandler := SFresult;
   SFresult := nil;

END {ASEGMRULES_ASuffixTableHandler};



FUNCTION ASEGMRULES_APrefixTableHandler(s: STRING_String):
                                                SEGMRULES_pPFruleResult;
BEGIN
   SetRuleType(PFrule);
   InitVarinst;
   searcher(s, 0, 1, 0);
   ASEGMRULES_APrefixTableHandler := PFresult;
   PFresult := nil;

END {ASEGMRULES_APrefixTableHandler};

FUNCTION ASEGMRULES_ALGLUE(s: STRING_String):
                                                SEGMRULES_pGLUEruleResult;
BEGIN
   SetRuleType(LGLUErule);
   InitVarinst;
   searcher(s, 0, 1, 0);
   ASEGMRULES_ALGLUE := LGLUEresult;
   LGLUEresult := nil;

END {ASEGMRULES_ALGLUE};


FUNCTION ASEGMRULES_ARGLUE(s: STRING_String): SEGMRULES_pGLUEruleResult;
BEGIN
{
   DEBUG_WriteStr('-> RGLUE ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
}
   SetRuleType(RGLUErule);
   STRING_Reverse(s, s);
   InitVarinst;
   searcher(s, 0, 1, 0);
   ASEGMRULES_ARGLUE := RGLUEresult;
   RGLUEresult := nil;
{
   DEBUG_WriteStr('<- RGLUE ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
}
END {ASEGMRULES_ARGLUE};

FUNCTION ASEGMRULES_AMGLUE(s: STRING_String):
                                                SEGMRULES_pGLUEruleResult;
BEGIN
{
   DEBUG_WriteStr('-> MGLUE ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
}
   SetRuleType(MGLUErule);
   InitVarinst;
   searcher(s, 0, 1, 0);
   ASEGMRULES_AMGLUE := MGLUEresult;
   MGLUEresult := nil;
{
   DEBUG_WriteStr('<- MGLUE ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
}
END {ASEGMRULES_AMGLUE};

