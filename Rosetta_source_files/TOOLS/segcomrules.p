(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : SEGCOMRULES
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *  Changes         : 29-09-87: Particles have been added to the prefix rules.
 *                              The requirement that all prefix keys should
 *                              start with the string 'PFK' is cancelled.
 *
 *EMP:::===================================================================*)

pragma C_Include('strings.pf');
Export(SEGCOMRULES);
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('logname.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('limorfdef.pf');
pragma C_include('segmrules.pf');
pragma C_include('segcomdecl.pf');
pragma C_include('segcomlangspec.pf');
pragma C_include('segcomrules.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM SEGCOMRULES;
WITH STR, STRINGS, STRNG, LDSTRTOTYPE, LIMORFDEF, SEGMRULES, SEGCOMDECL,
     SEGCOMLANGSPEC, LOGNAME;
CONST
   MAXVARS       = 30;
   MAXALIASES    = 30;
   MAXarity      = 4;
   MAXSEARCHRECS = 7000;
   MAXCHARRECS   = 7500;
   MAXVARRECS    = 700;
   MAXVARSTRRECS = 100;
   MAXFIXRULES   = 3000;
   MAXGLUERULES  = 500;
   VARTRAILER    = 2;

TYPE
   stringorder = (normalorder, reverseorder);
   ruletype    = (glueruletype, fixruletype);
   ruleversion = (anversion, genversion);

VAR
{global parameters, accessable for each rule }
   
   vartable             : ARRAY[1..MAXVARS] OF RECORD 
                                                  ident : STRING_String;
                                                  index : integer
                                               END;
   aliastable           : ARRAY[1..MAXALIASES] OF RECORD 
                                                  ident : STRING_String;
                                                  varindex : integer
                                               END;
   searchtable          : ARRAY[1..MAXSEARCHRECS] OF SEGMRULES_searchtree;
   charrectable         : ARRAY[1..MAXCHARRECS] OF SEGMRULES_CharRecord;
   varrectable          : ARRAY[1..MAXVARRECS] OF SEGMRULES_VarRecord;
   varstrrectable       : ARRAY[1..MAXVARSTRRECS] OF SEGMRULES_VarStrRecord;
   varconv              : ARRAY[1..SEGMRULES_MAXVARSINRULE] OF STRING_String;
   initialsearchrec     : SEGMRULES_searchtree;
   maxvar               : 0..MAXVARS;
   maxalias             : 0..MAXALIASES;
   order                : stringorder;   
   arity                : integer;
   currentvarnr         : integer;
   righthandpart        : boolean;
   lefthandmatchvars    : SEGCOMLANGSPEC_VarList;
   KindOfRules          : ruletype;
   NrCharsUsed          : integer;
   NrCharsClashed       : integer;
   NrSearchTableRecords : 0..MAXSEARCHRECS;
   NrRuleTableRecords   : integer;      
   NrCharTableRecords   : integer;
   NrVarTableRecords    : integer;
   NrVarStrTableRecords : integer;
   NrVarValues          : integer;
   NrMatchStrings       : integer;
   version              : ruleversion;
   SUFENTRYNODE         : SEGCOMDECL_pSnode;
   entrynr              : integer;

{local parameters; for one rule only}
   currentvariable      : 1..MAXSEARCHRECS;
   currentline          : integer;
   emptyvar             : boolean;
   nrvars               : 0..SEGMRULES_MAXVARSINRULE;
   nrglueconst,
   nrcomp               : integer;
   matchident           : STRING_String;
   matchvars1,
   matchvars2,
   matchvars            : SEGCOMLANGSPEC_VarList;
   sufstr,
   prestr,
   frestr,
   FONstr,
   CCstr                : STRING_String;
   lastcharindex        : integer;
   q                    : ARRAY[1..4] OF STRING_String;
   qstr,
   r, p                 : STRING_String;
   agchar               : char;
   starpresent          : integer;
   leftidpair,
   rightidpair          : STRING_String;
   curvar               : STRING_String;

{variables for code generation}
   curfix               : 0..MAXFIXRULES;
   FixRuleTable         : ARRAY[1..MAXFIXRULES] OF SEGMRULES_FixRule;
   curglue              : 0..MAXGLUERULES;
   GlueRuleTable        : ARRAY[1..MAXGLUERULES] OF SEGMRULES_GlueRule;


PROCEDURE error(nr: integer; l: integer);

BEGIN
   CASE nr OF
      1: writeln('incorrect variable identifier on line ',l);
      2: writeln('expected /A or /G on line ',l);
      3: writeln('suffix must begin with SFK on line ',l);
      4: writeln('prefix must begin with PFK on line ',l);
      5: writeln('phonetical marker must begin with FON on line ',l);
      6: writeln('context condition must begin with CC on line ',l);
      7: writeln('incorrect affix identifier on line ',l);
      8: writeln('incorrect affix identifier on line ',l);
      9: writeln('incorrect phonetical marker on line ',l);
     10: writeln('incorrect context condition on line ',l);
     11: writeln('not declared variable on line ',l);
     12: writeln('different variables used in match strings on line ',l);
     13: writeln('too many constituents on line ',l);
     14: writeln('multiple declared variable on line ', l);
   END
END {error};


PROCEDURE statistics;

BEGIN
   writeln('Statistics:');
   writeln('Nr of searchtable records used: ',NrSearchTableRecords);
   writeln('Nr of chartable records used  : ',NrCharTableRecords);
   writeln('Nr of vartable records used   : ',NrVarTableRecords);
   writeln('Nr of varstrtable records used: ',NrVarStrTableRecords);
   writeln('Nr of characters processed    : ',NrCharsUsed);
   writeln('Nr of characters clashed      : ',NrCharsClashed);
   writeln('Nr of variable values         : ',NrVarValues);
   writeln('Nr of match strings           : ',NrMatchStrings);
   writeln('Average nr. entries p. string : ',
            NrSearchTableRecords/(NrVarValues + NrMatchStrings));
   writeln('Average nr. chars p. searchtbl: ',
            NrCharsUsed/NrSearchTableRecords);
            
END;


PROCEDURE InitSearchRecord;
VAR
   ch : char;
BEGIN
   WITH initialsearchrec DO BEGIN
      result   := -1;
      nrvars   := 0;
      chars    := -1;
      vars     := -1;
      exists   := [];
      endofvar := FALSE;
   END
END {InitSearchRecord};


PROCEDURE InitCurSearchRecord;      
BEGIN
   searchtable[NrSearchTableRecords] := initialsearchrec
END {InitCurSearchRecord};



FUNCTION ExistsChar(n: INTEGER; c: CHAR): INTEGER;
VAR
   i,
   result : INTEGER;
BEGIN
   result := -1;
   IF c in SearchTable[n].exists THEN BEGIN
      i := SearchTable[n].chars;
      WHILE CharRecTable[i].ch <> c DO i := CharRecTable[i].nxtchar;
      result := CharRecTable[i].nxt
   END;
   ExistsChar := result
END;


PROCEDURE ChangeCharIndex(n: INTEGER; c: CHAR; i: INTEGER);
VAR
   j : INTEGER;
BEGIN
   j := SearchTable[n].chars;
   WHILE CharRecTable[j].ch <> c DO j := CharRecTable[j].nxtchar;
   CharRecTable[j].nxt := i
END;


PROCEDURE NewChar(n: INTEGER; c: CHAR; i: INTEGER);
BEGIN
   NrCharTableRecords := NrCharTableRecords + 1;
   CharRecTable[NrCharTableRecords].nxt     := i;
   CharRecTable[NrCharTableRecords].nxtchar := SearchTable[n].chars;
   CharRecTable[NrCharTableRecords].ch      := c;
   SearchTable[n].chars  := NrCharTableRecords;
   SearchTable[n].exists := SearchTable[n].exists + [c]
END;



FUNCTION ExistsVar(n: INTEGER; vnr, v: INTEGER): INTEGER;
VAR
   found : boolean;
   j,
   i     : INTEGER;

BEGIN {ExistsVar}
   found := false; j := SearchTable[n].vars; i := 0;
   WHILE (NOT found) AND ( i < Searchtable[n].nrvars ) DO BEGIN
      i := i+1;
      found := ((VarRecTable[j].vnr = vnr) and
                (VarRecTable[j].v   = v  ));
      IF not found THEN j := VarRecTable[j].nxtvar;
   END;
   IF found THEN BEGIN
      ExistsVar:= VarRecTable[j].nxt
      END
   ELSE BEGIN
      ExistsVar:= -1
   END
END {ExistsVar};


PROCEDURE NewVar(n: INTEGER; vnr: INTEGER; v: integer; i: INTEGER);
VAR 
   l: integer;
BEGIN
   NrVarTableRecords := NrVarTableRecords + 1;
   VarRecTable[NrVarTableRecords].nxt     := i;
   VarRecTable[NrVarTableRecords].nxtvar  := SearchTable[n].vars;
   VarRecTable[NrVarTableRecords].vnr     := vnr;
   VarRecTable[NrVarTableRecords].v       := v;
   SearchTable[n].vars    := NrVarTableRecords;
   SearchTable[n].nrvars  := SearchTable[n].nrvars + 1
END;


FUNCTION LookUpVarInVartable(v: STRING_String): integer;
VAR
   found : boolean;
   i     : integer;
BEGIN {LookUpVarInVartable}
   i := 1; found := false;
   WHILE (not found) and (i <= maxvar) DO BEGIN
      found := vartable[i].ident = v;
      i := i+1;
   END {WHILE};
   IF found THEN BEGIN
      LookUpVarInVartable := vartable[i-1].index
      END
   ELSE BEGIN
      LookUpVarInVartable :=  -1
   END
END {LookUpVarInVartable};




FUNCTION LookUpVarViaAliasTable(v: STRING_String): integer;
VAR
   found : boolean;
   j,
   i     : integer;
BEGIN {LookUpVarViaAliasTable}
   i := 1; found := false;
   WHILE (not found) and (i <= maxalias) DO BEGIN
      found := aliastable[i].ident = v;
      i := i+1;
   END {WHILE};
   IF found THEN BEGIN
      j := aliastable[i-1].varindex
      END
   ELSE BEGIN
      j :=  -1
   END;
   IF j = -1 THEN BEGIN
      LookUpVarViaAliasTable := LookUpVarInVarTable(v)
      END
   ELSE BEGIN
      LookUpVarViaAliasTable := j
   END;
END {LookUpVarViaAliasTable};




PROCEDURE AddVarToSearchTable(v: STRING_String; i,l : STRING_range; n: integer);
VAR
   ch      : char;
   trailer : 1..MAXSEARCHRECS;      
   ci      : INTEGER;
BEGIN
   STRING_ExtractChar(ch,v,i);
   NrCharsUsed := NrCharsUsed+1;
   IF i < l THEN BEGIN
      ci := ExistsChar(n, ch);
      IF ci <> -1 THEN BEGIN
         NrCharsClashed := NrCharsClashed+1;
{J.R. toegevoegd vrijdag 13 april 1990 de volgende IF statement}
         IF ci = VARTRAILER THEN BEGIN
	    NrSearchTableRecords := NrSearchTableRecords + 1;
	    InitCurSearchRecord;
	    ci := NrSearchTableRecords;
            ChangeCharIndex(n, ch, ci);
            searchtable[ci].endofvar := TRUE;
         END;
         AddVarToSearchTable(v, i+1, l, ci)
         END
      ELSE BEGIN
         NrSearchTableRecords := NrSearchTableRecords + 1;
         InitCurSearchRecord;
         NewChar(n, ch, NrSearchTableRecords);         
         AddVarToSearchTable(v, i+1, l, NrSearchTableRecords)
      END
      END
   ELSE IF (i = l) and (i <> 0) THEN BEGIN
      ci := ExistsChar(n, ch);
      IF ci <> -1 THEN BEGIN
         NrCharsClashed := NrCharsClashed+1;
         trailer := ci;
         searchtable[trailer].endofvar := TRUE;
         END
      ELSE BEGIN
         NewChar(n, ch, VARTRAILER);
      END
      END
   ELSE IF (i = l) and (i = 0) THEN BEGIN
         searchtable[n].endofvar := TRUE;
   END;
END {AddVarToSearchTable};


FUNCTION AddVarStrToSearchTable(v: STRING_String; 
                                i,l : STRING_range; 
                                n: integer): INTEGER;
VAR
   ch      : char;
   trailer : 1..MAXSEARCHRECS;      
   ci      : INTEGER;
   result  : INTEGER;
BEGIN
   STRING_ExtractChar(ch,v,i);
   NrCharsUsed := NrCharsUsed+1;
   IF i < l THEN BEGIN
      ci := ExistsChar(n, ch);
      IF ci <> -1 THEN BEGIN
         NrCharsClashed := NrCharsClashed+1;
         result := AddVarStrToSearchTable(v, i+1, l, ci)
         END
      ELSE BEGIN
         NrSearchTableRecords := NrSearchTableRecords + 1;
         InitCurSearchRecord;
         NewChar(n, ch, NrSearchTableRecords);         
         result := AddVarStrToSearchTable(v, i+1, l, NrSearchTableRecords)
      END
      END
   ELSE IF (i = l) and (i <> 0) THEN BEGIN
      ci := ExistsChar(n, ch);
      IF ci <> -1 THEN BEGIN
         NrCharsClashed := NrCharsClashed+1;
         trailer := ci; 
         IF trailer = VARTRAILER THEN BEGIN
	    NrSearchTableRecords := NrSearchTableRecords + 1;
	    InitCurSearchRecord;
	    trailer := NrSearchTableRecords;
            ChangeCharIndex(n, ch, trailer);
            searchtable[trailer].endofvar := TRUE;
         END;
{J.R. toegevoegd vrijdag 13 april 1990 de volgende regel}
         searchtable[trailer].endofvar := TRUE;
         result := trailer
         END
      ELSE BEGIN
         NrSearchTableRecords := NrSearchTableRecords + 1;
         InitCurSearchRecord;
         trailer := NrSearchTableRecords;
         NewChar(n, ch, trailer);
{J.R. toegevoegd vrijdag 13 april 1990 de volgende regel}
         searchtable[trailer].endofvar := TRUE;
         result := trailer
      END
      END
   ELSE IF (i = l) and (i = 0) THEN BEGIN
{J.R. toegevoegd vrijdag 13 april 1990 de volgende regel}
         searchtable[n].endofvar := TRUE;
         writeln('empty string in idpair', n);
         result := n
   END;
   AddVarStrToSearchTable := result
END {AddVarStrToSearchTable};


PROCEDURE AddVarStrToTable(n: integer; v: STRING_String);
VAR
   length : STRING_Range;
   j      : integer;
   i      : STRING_Range;
BEGIN
   NrVarStrTableRecords := NrVarStrTableRecords+1;
   length := STRING_Length(v);
   IF searchtable[n].result = -1 THEN BEGIN
      searchtable[n].result := NrVarStrTableRecords;
      i := varstrrectable[NrVarStrTableRecords].len;
      STRING_ExtractChars(varstrrectable[NrVarStrTableRecords].str,
                          i,
                          v, 1, length);
      varstrrectable[NrVarStrTableRecords].nxt := -1;
      END
   ELSE BEGIN
      j := searchtable[n].result;
      searchtable[n].result := NrVarStrTableRecords;
      i := varstrrectable[NrVarStrTableRecords].len;
      STRING_ExtractChars(varstrrectable[NrVarStrTableRecords].str,
                          i,
                          v, 1, length);
      varstrrectable[NrVarStrTableRecords].str := v;
      varstrrectable[NrVarStrTableRecords].nxt := j;
   END;

END {AddVarStrToTable};


FUNCTION AddVarToVarTable(v: STRING_String; n: INTEGER): integer;
BEGIN
   maxvar := maxvar + 1;
   vartable[maxvar].ident := v;
   IF n = -1 THEN BEGIN
      NrSearchTableRecords := NrSearchTableRecords + 1;
      InitCurSearchRecord;
      vartable[maxvar].index := NrSearchTableRecords;
      AddVarToVarTable := NrSearchTableRecords
      END
   ELSE BEGIN
      vartable[maxvar].index := n;
      AddVarToVarTable := n
   END
END;


PROCEDURE AddAliasToAliasTable(a, v: STRING_String);
VAR
   i : INTEGER;
BEGIN
   i := LookUpVarInVarTable(v);
   maxalias := maxalias + 1;
   aliastable[maxalias].ident := a;
   aliastable[maxalias].varindex := i;
END;


FUNCTION AddMatchStrToSearchTable(m: STRING_String; {match string}
                                  i,                {index of char to be 
                                                     processed}
                                  l : STRING_range; {match string length}
                                  v,                {nr of the variable}
                                  n: integer;       {index in searchtable to
                                                     look at}
                                  b: SEGCOMLANGSPEC_VarList
                                                    {information about the vars
                                                     in the match string}
                                  ): integer;       {returns searchtable entry
                                                     where match string ends}
VAR
   ch      : char;
   result  : 1..MAXSEARCHRECS;      
   nrv     : integer;
   varnr   : 1..SEGMRULES_MAXVARS;
   varstr  : STRING_String;
   vi,
   ci      : INTEGER;

   FUNCTION FindVarNr(v: STRING_String)
	    : integer;
   VAR
      found : boolean;
      i     : INTEGER;
   BEGIN {FindVarNr}
      found := false; i := 1;
      WHILE (NOT found) AND ( i <= SEGMRULES_MAXVARS ) DO BEGIN
         found := varconv[i] = v;
         i := i+1
      END;
      IF found THEN BEGIN
         FindVarNr:= i-1
         END
      ELSE BEGIN
         FindVarNr:= -1
      END
   END {FindVarNr};

BEGIN

   IF i <= l THEN BEGIN 
      STRING_ExtractChar(ch,m,i);
      IF ch <> '@' THEN BEGIN 
         NrCharsUsed := NrCharsUsed+1;
         { not the beginning of a variable }
         ci := ExistsChar(n, ch);
	 IF ci <> -1 THEN BEGIN 
	    { ch is also in the current entry }
            NrCharsClashed := NrCharsClashed+1;
	    result := AddMatchStrToSearchTable(m, i+1, l, v, ci, b)
	    END
	 ELSE BEGIN
	    { ch is not in the current entry, so a new one must be added }
	    NrSearchTableRecords := NrSearchTableRecords + 1;
	    InitCurSearchRecord;
            NewChar(n, ch, NrSearchTableRecords);
	    result := AddMatchStrToSearchTable(m, i+1, l, v, 
                                               NrSearchTableRecords, b)
	 END
	 END
      ELSE BEGIN
	 {ch = '@', so we must enter a variable}
	 STRING_Extract(varstr, m, i, 3);
	 varnr := FindVarNr(varstr);
         vi    := ExistsVar(n, varnr, b[varnr]);
         IF vi = -1 THEN BEGIN
	    {no entry with same string added before}
	    NrSearchTableRecords := NrSearchTableRecords + 1;
	    InitCurSearchRecord;
            NewVar(n, varnr, b[varnr], NrSearchTableRecords);
	    result := AddMatchStrToSearchTable(m, i+3, l, v, 
					       NrSearchTableRecords, b)
	    END
	 ELSE BEGIN
{
            writeln('variable clashed');
}
	    result := AddMatchStrToSearchTable(m, i+3, l, v, vi, b)
	 END
      END
      END
   ELSE IF (i > l) and (i <> 0) THEN BEGIN 
      { m completely processed, so the result is the value of parameter n }
      result := n;
   END;
  
   AddMatchStrToSearchTable := result;

END {AddMatchStrToSearchTable};


procedure SEGCOMRULES_init;

VAR i: integer;

BEGIN
   version              := anversion;
   maxvar               := 0;
   maxalias             := 0;
   currentvarnr         := 0;
   righthandpart        := false;
   entrynr              := 0;
   FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
      lefthandmatchvars[i] := -1;
   END;
   curfix               := 0;
   curglue              := 0;
   NrRuleTableRecords   := 0;
   NrCharsUsed          := 0;
   NrCharsClashed       := 0;
   NrVarValues          := 0;
   NrMatchStrings       := 0;
   NrCharTableRecords   := 0;
   NrVarTableRecords    := 0;
   NrVarStrTableRecords := 0;


   (*----------------------------------------------------------------------*
    * SearchTable[1]: beginning of normal matchstrings
    * SearchTable[2]: trailer record of all variables
    * SearchTable[3]: beginning of variable strings 
    *----------------------------------------------------------------------*)

   NrSearchTableRecords := 1;
   InitSearchRecord;
   InitCurSearchRecord;

   NrSearchTableRecords := VARTRAILER;
   InitCurSearchRecord;
   SearchTable[VARTRAILER].endofvar := TRUE;

   STRING_Constant(varconv[1],'@1@',3);
   STRING_Constant(varconv[2],'@2@',3);
   STRING_Constant(varconv[3],'@3@',3);
   STRING_Constant(varconv[4],'@4@',3);
   STRING_Constant(varconv[5],'@5@',3);
   STRING_Constant(varconv[6],'@6@',3);
   STRING_Constant(varconv[7],'@7@',3);
   STRING_Constant(varconv[8],'@8@',3);
   STRING_Constant(varconv[9],'@9@',3);

   SUFENTRYNODE := SEGCOMDECL_MakeNonTerminal(SUFENTRYSPEC);

END {SEGCOMRULES_init};


PROCEDURE SEGCOMRULES_SetAnVersion;

BEGIN
   version := anversion
END {SEGCOMRULES_SetAnVersion};


PROCEDURE SEGCOMRULES_SetGenVersion;

BEGIN
   version := genversion
END {SEGCOMRULES_SetGenVersion};


procedure SEGCOMRULES_rule(rnr:integer;
                                    a: SEGCOMDECL_nodeid;
                                    b: SEGCOMDECL_pSnode;
                                    la: SEGCOMDECL_pSnode;
                                    mode: SEGCOMDECL_surfrulemode);
LABEL 99;

PROCEDURE AddEntryToFixTable(i: integer; r,p,fix,F,C: STRING_String; sp: integer);
VAR
   StrMax,
   length : STRING_Range;
   j      : integer;
   fixstr,
   Cstr,
   Fstr   : STR_String;
   found  : boolean;
BEGIN
   curfix := curfix+1;
   IF searchtable[i].result = -1 THEN BEGIN
      searchtable[i].result := curfix
      END
   ELSE BEGIN
      j := searchtable[i].result;
      WHILE FixRuleTable[j].nxt <> -1 DO BEGIN
         j := FixRuleTable[j].nxt;
      END;
      FixRuleTable[j].nxt := curfix
   END;

   FixRuleTable[curfix].nxt := -1;
   STRING_ExtractChars(FixRuleTable[curfix].r.str, StrMax, r, 1, STRING_Length(r));
   FixRuleTable[curfix].r.l := StrMax;
   STRING_ExtractChars(FixRuleTable[curfix].p.str, StrMax, p, 1, STRING_Length(p));
   FixRuleTable[curfix].p.l := StrMax;
   STRING_ExtractChars(fixstr, StrMax, fix, 1, STRING_Length(fix));
   
   found := LDSTRTOTYPE_Affix(fixstr, StrMax, FixRuleTable[curfix].K );
   IF not found THEN BEGIN
      error(8,0);
      goto 99
   END;
   length := STRING_length(F);
   IF length = 0 THEN BEGIN
      FixRuleTable[curfix].FON := LIFON0
      END
   ELSE BEGIN
      STRING_ExtractChars(Fstr, StrMax, F, 1, STRING_Length(F));
      found := LDSTRTOTYPE_FON(fstr, StrMax, FixRuleTable[curfix].FON);
      IF not found THEN BEGIN
         error(9,0);
         goto 99
      END
   END;
   length := STRING_length(C);
   IF length = 0 THEN BEGIN
      FixRuleTable[curfix].CC := LICC0
      END
   ELSE BEGIN
      STRING_ExtractChars(Cstr, StrMax, C, 1, STRING_Length(C));
      found := LDSTRTOTYPE_CC(fstr, StrMax, FixRuleTable[curfix].CC);
      IF not found THEN BEGIN
         error(10,0);
         goto 99
      END
   END;
   IF sp = 0 THEN BEGIN
      FixRuleTable[curfix].exact := true
      END
   ELSE BEGIN
      FixRuleTable[curfix].exact := false
   END;
      
END {AddEntryToFixTable};


PROCEDURE AddEntryToGlueTable(i: integer; 
                              M: integer;
                              q: ARRAY[l1..l2:integer] OF STRING_String;
                              p: STRING_String; sp: integer);
VAR
   j      : integer;
   StrMax : STRING_Range;
BEGIN
   curglue := curglue+1;
   IF searchtable[i].result = -1 THEN BEGIN
      searchtable[i].result := curglue
      END
   ELSE BEGIN
      j := searchtable[i].result;
      WHILE GlueRuleTable[j].nxt <> -1 DO j := GlueRuleTable[j].nxt;
      GlueRuleTable[j].nxt := curglue
   END;

   GlueRuleTable[curglue].nxt := -1;
   GlueRuleTable[curglue].M := M;
   STRING_ExtractChars(GlueRuleTable[curglue].p.str, StrMax, p, 1, 
                       STRING_Length(p));
   GlueRuleTable[curglue].p.l := StrMax;
   FOR j := l1 TO l2 DO BEGIN
      STRING_ExtractChars(GlueRuleTable[curglue].q[j].str, StrMax, q[j], 1, 
                          STRING_Length(q[j]));
      GlueRuleTable[curglue].q[j].l := StrMax;
   END;
   IF sp = 0 THEN BEGIN
      GlueRuleTable[curglue].exact := true
      END
   ELSE BEGIN
      GlueRuleTable[curglue].exact := false
   END;
      
END {AddEntryToGlueTable};


FUNCTION NotEqualVars(m1, m2: SEGCOMLANGSPEC_VarList)
	 : boolean;
VAR
   equal : boolean;
   i : 1..SEGMRULES_MAXVARS;
BEGIN {NotEqualVars}
   equal := true;
   FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
      IF equal THEN equal := m1[i] = m2[i]
   END {FOR};
   NotEqualVars:=not equal
END {NotEqualVars};


PROCEDURE UTTrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN 
          END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   5: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   6: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(UTT));
                 SEGCOMDECL_assignstatus(true);
                 statistics;
	   END
   END
END;

PROCEDURE LGLUEDEFrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(LGLUEDEF));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;

PROCEDURE RGLUEDEFrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(RGLUEDEF));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE MGLUEDEFrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(MGLUEDEF));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE PREDEFrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(PREDEF));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE SUFDEFrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(SUFDEF));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE FREEDEFrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(FREEDEF));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE LGLUETYPESPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   arity := 2;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   arity := 3;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   arity := 4;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   5: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(LGLUETYPESPEC));
                 SEGCOMDECL_assignstatus(true);
                 order := normalorder;
                 KindOfRules := glueruletype
	   END
   END
END;


PROCEDURE RGLUETYPESPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   arity := 2;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   arity := 3;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   arity := 4;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   5: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(RGLUETYPESPEC));
                 SEGCOMDECL_assignstatus(true);
                 order := reverseorder;
                 KindOfRules := glueruletype
	   END
   END
END;


PROCEDURE MGLUETYPESPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   arity := 2;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(MGLUETYPESPEC));
                 SEGCOMDECL_assignstatus(true);
                 order := normalorder;
                 KindOfRules := glueruletype
	   END
   END
END;


PROCEDURE PRETYPESPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(PRETYPESPEC));
                 SEGCOMDECL_assignstatus(true);
                 order := normalorder;
                 KindOfRules := fixruletype
	   END
   END
END;


PROCEDURE SUFTYPESPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(SUFTYPESPEC));
                 SEGCOMDECL_assignstatus(true);
                 order := reverseorder;
                 KindOfRules := fixruletype
	   END
   END
END;


PROCEDURE FREETYPESPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(FREETYPESPEC));
                 SEGCOMDECL_assignstatus(true);
                 order := normalorder;
                 KindOfRules := fixruletype
	   END
   END
END;


PROCEDURE LGLUETABLESPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  BEGIN
                   currentvarnr := 0;
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(LGLUETABLESPEC));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE RGLUETABLESPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  BEGIN
                   currentvarnr := 0;
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(RGLUETABLESPEC));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE MGLUETABLESPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  BEGIN
                   currentvarnr := 0;
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(MGLUETABLESPEC));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE PRETABLESPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  BEGIN
                   currentvarnr := 0;
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(PRETABLESPEC));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE SUFTABLESPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN 
             { Returning status false means, that no sons have to be made }
             SEGCOMDECL_assignstatus(false);
          END;
   1: CASE mode OF
      loccond:  BEGIN
                   currentvarnr := 0;
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(SUFTABLESPEC));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE FREETABLESPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  BEGIN
                   currentvarnr := 0;
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(FREETABLESPEC));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE LGLUEENTRYSPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   i : integer;
   ch,
   ident : STRING_String;
BEGIN

   CASE a OF
   Hinit: BEGIN 
             nrglueconst := 1;
             agchar := ' ';
             FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                matchvars1[i] := -1;
                matchvars2[i] := -1
             END;
             FOR i:=1 TO MAXarity DO STRING_ConstantEmpty(q[i]);
             lastcharindex    := -1;
             STRING_ConstantEmpty(p);
             STRING_ConstantEmpty(qstr);
             starpresent := 0;
          END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   agchar := b^.ldfield.angenspecfield.agchar;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                CASE version OF
                anversion: 
                   BEGIN
                   IF nrglueconst <= MAXarity THEN BEGIN
                      q[nrglueconst] := b^.ldfield.matchstringfield.str;
                      FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                         IF b^.ldfield.matchstringfield.vars[i] <> -1 THEN BEGIN
                            matchvars1[i] := b^.ldfield.matchstringfield.vars[i]
                         END
                      END;
                      SEGCOMDECL_assignstatus(true);
                      END
                   ELSE BEGIN
                      error(13, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END;
                genversion: 
                   BEGIN
                   IF nrglueconst <= MAXarity THEN BEGIN
                      q[nrglueconst] := b^.ldfield.matchstringfield.str;
                      STRING_Append(qstr,q[nrglueconst]);
                      FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                         IF b^.ldfield.matchstringfield.vars[i] <> -1 THEN BEGIN
                            matchvars1[i] := b^.ldfield.matchstringfield.vars[i]
                         END
                      END;
                      SEGCOMDECL_assignstatus(true);
                      END
                   ELSE BEGIN
                      error(13, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END
                END
                END;
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   nrglueconst := nrglueconst + 1;
                   STRING_ConstantChar(ch,'|');
                   STRING_append(qstr,ch);
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   nrglueconst := nrglueconst + 1;
                   STRING_ConstantChar(ch,'|');
                   STRING_append(qstr,ch);
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
   5: CASE mode of
      loccond:  BEGIN
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: BEGIN
                   starpresent := starpresent + 1;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   6: CASE mode of
      loccond:  BEGIN
{                   currentvarnr := 0;
}                   righthandpart := true;
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   7: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
  10: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                CASE version OF
                anversion:
                   BEGIN         
		  (*-------------------------------------------------------------*
		   * Because this is an lglue rule, the matchstring has to be added in normal
		   * order to the search table. 
		   *-------------------------------------------------------------*)
                   p := b^.ldfield.matchstringfield.str;
                   ident := b^.ldfield.matchstringfield.str;

		  (*-------------------------------------------------------------*
		   * Call AddMatchStrToSearchTable for the string ident:
		   * start with character 1 of this string,
		   * number of variables processed in this string: 0,
		   * begin the insertion at entry 1 of the searchtable.
		   *-------------------------------------------------------------*)
                   NrMatchStrings := NrMatchStrings+1;
                   IF ( agchar <> 'G' ) THEN BEGIN
                      lastcharindex := AddMatchStrToSearchTable(ident, 1, 
                                                   STRING_Length(ident), 0, 1,
                                                   matchvars1);
{
                      writeln('Added MatchString ',ident, ' to Table........');
}
                      END
                   ELSE BEGIN
{
                      writeln('Skipped MatchString ',ident)
}
                   END;
                   SEGCOMDECL_assignstatus(true);
                   matchvars2 := b^.ldfield.matchstringfield.vars;
                   IF NotEqualVars(matchvars1, matchvars2) THEN BEGIN
                      error(12, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END;
                genversion:
                   BEGIN         
		  (*-------------------------------------------------------------*
		   * Because this is an lglue rule, the matchstring has to be added in normal
		   * order to the search table. 
		   *-------------------------------------------------------------*)
                   p := b^.ldfield.matchstringfield.str;
                   ident := b^.ldfield.matchstringfield.str;

		  (*-------------------------------------------------------------*
		   * Call AddMatchStrToSearchTable for the string ident:
		   * start with character 1 of this string,
		   * number of variables processed in this string: 0,
		   * begin the insertion at entry 1 of the searchtable.
		   *-------------------------------------------------------------*)
                   NrMatchStrings := NrMatchStrings+1;
                   IF ( agchar <> 'A' ) THEN BEGIN
                      lastcharindex := AddMatchStrToSearchTable(qstr, 1, 
                                                   STRING_Length(qstr), 0, 1,
                                                   matchvars1);
{
                      writeln('Added MatchString ',qstr, ' to Table........');
}
                      END
                   ELSE BEGIN
{
                      writeln('Skipped MatchString ',ident)
}
                   END;
                   SEGCOMDECL_assignstatus(true);
                   matchvars2 := b^.ldfield.matchstringfield.vars;
                   IF NotEqualVars(matchvars1, matchvars2) THEN BEGIN
                      error(12, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END
                END
                END
      END;
   Hfinal: BEGIN currentvarnr := 0;
                 righthandpart := false;
                 FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                     lefthandmatchvars[i] := -1;
                 END;
                 IF (( starpresent = 0 ) and 
                     (STRING_length(q[nrglueconst]) <> 0) and
                     (STRING_length(p) <> 0 )) or ( starpresent = 2 ) THEN BEGIN
                    IF lastcharindex <> -1 THEN BEGIN
                       AddEntryToGlueTable(lastcharindex, nrglueconst, q, p, 
                                           starpresent);
                    END;
                    SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(LGLUEENTRYSPEC));
                    SEGCOMDECL_assignstatus(true) 
                    END
                 ELSE BEGIN
                    SEGCOMDECL_assignstatus(false) 
                 END
	   END
   END
END;


PROCEDURE RGLUEENTRYSPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   i,j,k : integer;
   ch,
   ident : STRING_String;
BEGIN

   CASE a OF
   Hinit: BEGIN 
             nrglueconst := 1;
             agchar := ' ';
             FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                matchvars1[i] := -1;
                matchvars2[i] := -1
             END;
             FOR i:=1 TO MAXarity DO STRING_ConstantEmpty(q[i]);
             lastcharindex    := -1;
             STRING_ConstantEmpty(p);
             STRING_ConstantEmpty(qstr);
             starpresent := 0;
          END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   agchar := b^.ldfield.angenspecfield.agchar;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                CASE version OF
                anversion:
                   BEGIN
                   IF nrglueconst <= MAXarity THEN BEGIN
                      q[nrglueconst] := b^.ldfield.matchstringfield.str;
                      FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                         IF b^.ldfield.matchstringfield.vars[i] <> -1 THEN BEGIN
                            matchvars1[i] := b^.ldfield.matchstringfield.vars[i]
                         END
                      END;
                      SEGCOMDECL_assignstatus(true);
                      END
                   ELSE BEGIN
                      error(13, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END;
                genversion:
                   BEGIN
                   IF nrglueconst <= MAXarity THEN BEGIN
                      q[nrglueconst] := b^.ldfield.matchstringfield.str;
                      STRING_Append(qstr, q[nrglueconst]);
                      FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                         IF b^.ldfield.matchstringfield.vars[i] <> -1 THEN BEGIN
                            matchvars1[i] := b^.ldfield.matchstringfield.vars[i]
                         END
                      END;
                      SEGCOMDECL_assignstatus(true);
                      END
                   ELSE BEGIN
                      error(13, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END
                END
                END;
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   nrglueconst := nrglueconst + 1;
                   STRING_ConstantChar(ch,'|');
                   STRING_append(qstr,ch);
                SEGCOMDECL_assignstatus(true);
                END;
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   nrglueconst := nrglueconst + 1;
                   STRING_ConstantChar(ch,'|');
                   STRING_append(qstr,ch);
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
   5: CASE mode of
      loccond:  BEGIN
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: BEGIN
                   starpresent := starpresent + 1;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   6: CASE mode of
      loccond:  BEGIN
{                   currentvarnr := 0;
}                   righthandpart := true;
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   7: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
  10: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                CASE version OF
                anversion:
                   BEGIN
		  (*-------------------------------------------------------------*
		   * Because this is a rglue rule, the matchstring has to be added in reverse
		   * order to the search table. Also the order of the variables
		   * has to be reversed.
		   * Notice that variables in this string can still be detected,
		   * because they are of the form '@i@'
		   *-------------------------------------------------------------*)
                   p := b^.ldfield.matchstringfield.str;
                   matchvars2 := b^.ldfield.matchstringfield.vars;
                   STRING_Reverse(ident, b^.ldfield.matchstringfield.str);
                   j := b^.ldfield.matchstringfield.nrvars;
	           FOR i:=1 TO (j div 2) DO BEGIN
                      k := b^.ldfield.matchstringfield.vars[i];
                      b^.ldfield.matchstringfield.vars[i] := 
                      b^.ldfield.matchstringfield.vars[j-i+1]
	           END {FOR};

		  (*-------------------------------------------------------------*
		   * Call AddMatchStrToSearchTable for the string ident:
		   * start with character 1 of this string,
		   * number of variables processed in this string: 0,
		   * begin the insertion at entry 1 of the searchtable.
		   *-------------------------------------------------------------*)
                   NrMatchStrings := NrMatchStrings+1;
                   IF ( agchar <> 'G' ) THEN BEGIN
                      lastcharindex := AddMatchStrToSearchTable(ident, 1, 
                                                   STRING_Length(ident), 0, 1,
                                                   matchvars1);
{
                      writeln('Added MatchString ',ident, ' to Table........');
}
                      END
                   ELSE BEGIN
{
                      writeln('Skipped MatchString ',ident)
}
                   END;
                   SEGCOMDECL_assignstatus(true);
                   IF NotEqualVars(matchvars1, matchvars2) THEN BEGIN
                      error(12, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END;
                genversion:
                   BEGIN
		  (*-------------------------------------------------------------*
		   * Because this is a rglue rule, the matchstring has to be added in reverse
		   * order to the search table. Also the order of the variables
		   * has to be reversed. As you see the variables of b are 
                   * reversed, whereas in the generation the lefthandmatchstring
                   * has to be added to the search table. This is possible
                   * because the lefthand variables and righthand variables
                   * have to be equal.
		   * Notice that variables in this string can still be detected,
		   * because they are of the form '@i@'.
		   *-------------------------------------------------------------*)
                   p := b^.ldfield.matchstringfield.str;
                   matchvars2 := b^.ldfield.matchstringfield.vars;
                   STRING_Reverse(ident, qstr);
                   j := b^.ldfield.matchstringfield.nrvars;
	           FOR i:=1 TO (j div 2) DO BEGIN
                      k := b^.ldfield.matchstringfield.vars[i];
                      b^.ldfield.matchstringfield.vars[i] := 
                      b^.ldfield.matchstringfield.vars[j-i+1]
	           END {FOR};

		  (*-------------------------------------------------------------*
		   * Call AddMatchStrToSearchTable for the string ident:
		   * start with character 1 of this string,
		   * number of variables processed in this string: 0,
		   * begin the insertion at entry 1 of the searchtable.
		   *-------------------------------------------------------------*)
                   NrMatchStrings := NrMatchStrings+1;
                   IF ( agchar <> 'A' ) THEN BEGIN
                      lastcharindex := AddMatchStrToSearchTable(ident, 1, 
                                                   STRING_Length(ident), 0, 1,
                                                   matchvars1);
{
                      writeln('Added MatchString ',ident, ' to Table........');
}
                      END
                   ELSE BEGIN
{
                      writeln('Skipped MatchString ',ident)
}
                   END;
                   SEGCOMDECL_assignstatus(true);
                   IF NotEqualVars(matchvars1, matchvars2) THEN BEGIN
                      error(12, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END
                END
                END
      END;
   Hfinal: BEGIN currentvarnr := 0;
                 righthandpart := false;
                 FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                     lefthandmatchvars[i] := -1;
                 END;
                 IF (( starpresent = 0 ) and (STRING_length(q[1]) <> 0) and
                     (STRING_length(p) <> 0 )) or ( starpresent = 2 ) THEN BEGIN
                    IF lastcharindex <> -1 THEN BEGIN
                       AddEntryToGlueTable(lastcharindex, nrglueconst, q, p, 
                                           starpresent);
                    END;
                    SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(RGLUEENTRYSPEC));
                    SEGCOMDECL_assignstatus(true) 
                    END
                 ELSE BEGIN
                    SEGCOMDECL_assignstatus(false) 
                 END
	   END
   END
END;


PROCEDURE MGLUEENTRYSPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   i,j,k : integer;
   ch,
   ident : STRING_String;
BEGIN

   CASE a OF
   Hinit: BEGIN 
             nrglueconst := 0;
             agchar := ' ';
             FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                matchvars1[i] := -1;
                matchvars2[i] := -1
             END;
             FOR i:=1 TO MAXarity DO STRING_ConstantEmpty(q[i]);
             lastcharindex    := -1;
             STRING_ConstantEmpty(p);
             STRING_ConstantEmpty(qstr);
             starpresent := 0;
          END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   agchar := b^.ldfield.angenspecfield.agchar;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                CASE version OF
                anversion:
                   BEGIN 
                   nrglueconst := nrglueconst+1;
                   IF nrglueconst <= MAXarity THEN BEGIN
                      q[nrglueconst] := b^.ldfield.matchstringfield.str;
                      FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                         IF b^.ldfield.matchstringfield.vars[i] <> -1 THEN BEGIN
                            matchvars1[i] := b^.ldfield.matchstringfield.vars[i]
                         END
                      END;
                      SEGCOMDECL_assignstatus(true);
                      END
                   ELSE BEGIN
                      error(13, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END;
                genversion:
                   BEGIN 
                   nrglueconst := nrglueconst+1;
                   IF nrglueconst <= MAXarity THEN BEGIN
                      q[nrglueconst] := b^.ldfield.matchstringfield.str;
                      STRING_ConstantChar(ch,'|');
                      IF STRING_Length(qstr) > 0 THEN STRING_Append(qstr, ch);
                      STRING_Append(qstr, q[nrglueconst]);
                      FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                         IF b^.ldfield.matchstringfield.vars[i] <> -1 THEN BEGIN
                            matchvars1[i] := b^.ldfield.matchstringfield.vars[i]
                         END
                      END;
                      SEGCOMDECL_assignstatus(true);
                      END
                   ELSE BEGIN
                      error(13, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END
                END
                END;
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   5: CASE mode of
      loccond:  BEGIN
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: BEGIN
                   starpresent := starpresent + 1;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   6: CASE mode of
      loccond:  BEGIN
{                   currentvarnr := 0;
}                   righthandpart := true;
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   7: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
  10: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                CASE version OF
                anversion:
                   BEGIN
		  (*-------------------------------------------------------------*
		   * Because this is an lglue rule, the matchstring has to be added in normal
		   * order to the search table. 
		   *-------------------------------------------------------------*)
                   p := b^.ldfield.matchstringfield.str;
                   ident := b^.ldfield.matchstringfield.str;

		  (*-------------------------------------------------------------*
		   * Call AddMatchStrToSearchTable for the string ident:
		   * start with character 1 of this string,
		   * number of variables processed in this string: 0,
		   * begin the insertion at entry 1 of the searchtable.
		   *-------------------------------------------------------------*)
                   NrMatchStrings := NrMatchStrings+1;
                   IF ( agchar <> 'G' ) THEN BEGIN
                      lastcharindex := AddMatchStrToSearchTable(ident, 1, 
                                                   STRING_Length(ident), 0, 1,
                                                   matchvars1);
{
                      writeln('Added MatchString ',ident, ' to Table........');
}
                      END
                   ELSE BEGIN
{
                      writeln('Skipped MatchString ',ident)
}
                   END;
                   SEGCOMDECL_assignstatus(true);
                   matchvars2 := b^.ldfield.matchstringfield.vars;
                   IF NotEqualVars(matchvars1, matchvars2) THEN BEGIN
                      error(12, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END;
                genversion:
                   BEGIN
		  (*-------------------------------------------------------------*
		   * Because this is an lglue rule, the matchstring has to be added in normal
		   * order to the search table. 
		   *-------------------------------------------------------------*)
                   p := b^.ldfield.matchstringfield.str;
                   ident := b^.ldfield.matchstringfield.str;

		  (*-------------------------------------------------------------*
		   * Call AddMatchStrToSearchTable for the string ident:
		   * start with character 1 of this string,
		   * number of variables processed in this string: 0,
		   * begin the insertion at entry 1 of the searchtable.
		   *-------------------------------------------------------------*)
                   NrMatchStrings := NrMatchStrings+1;
                   IF ( agchar <> 'A' ) THEN BEGIN
                      lastcharindex := AddMatchStrToSearchTable(qstr, 1, 
                                                   STRING_Length(qstr), 0, 1,
                                                   matchvars1);
{
                      writeln('Added MatchString ',qstr, ' to Table........');
}
                      END
                   ELSE BEGIN
{
                      writeln('Skipped MatchString ',ident)
}
                   END;
                   SEGCOMDECL_assignstatus(true);
                   matchvars2 := b^.ldfield.matchstringfield.vars;
                   IF NotEqualVars(matchvars1, matchvars2) THEN BEGIN
                      error(12, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END
                END
                END
      END;
   Hfinal: BEGIN currentvarnr := 0;
                 righthandpart := false;
                 FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                     lefthandmatchvars[i] := -1;
                 END;
                 IF ( starpresent = 0 ) and ( nrglueconst > 1 ) THEN BEGIN
                    IF lastcharindex <> -1 THEN BEGIN
                       AddEntryToGlueTable(lastcharindex, nrglueconst, q, p, 
                                           starpresent);
                    END;
                    SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(MGLUEENTRYSPEC));
                    SEGCOMDECL_assignstatus(true) 
                    END
                 ELSE BEGIN
                    SEGCOMDECL_assignstatus(false) 
                 END
	   END
   END
END;


PROCEDURE PREENTRYSPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   t     : SEGCOMDECL_pSnode;
   i,j,k : integer;
   ident : STRING_String;
BEGIN

   CASE a OF
   Hinit: BEGIN 
             lastcharindex    := -1;
             FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                matchvars1[i] := -1;
                matchvars2[i] := -1
             END;
             agchar := ' ';
             STRING_ConstantEmpty(r);
             STRING_ConstantEmpty(p);
             STRING_ConstantEmpty(prestr);
             STRING_ConstantEmpty(FONstr);
             STRING_ConstantEmpty(CCstr);
             starpresent := 0;
          END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   agchar := b^.ldfield.angenspecfield.agchar;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   matchvars1 := b^.ldfield.matchstringfield.vars;
                   r := b^.ldfield.matchstringfield.str;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   starpresent := starpresent + 1;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   5: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   6: CASE mode of
      loccond:  BEGIN
{
                   currentvarnr := 0;
}                  righthandpart := true;
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   7: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   8: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   9: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond:  BEGIN
                   FONstr := b^.sonlist^.node^.ldfield.terminal^.str;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
  10: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                CASE version OF
                anversion:
                   BEGIN
		  (*-------------------------------------------------------------*
		   * Because this is a prefix rule, the matchstring has to be added in normal
		   * order to the search table. 
		   *-------------------------------------------------------------*)
                   p := b^.ldfield.matchstringfield.str;
                   ident := b^.ldfield.matchstringfield.str;

		  (*-------------------------------------------------------------*
		   * Call AddMatchStrToSearchTable for the string ident:
		   * start with character 1 of this string,
		   * number of variables processed in this string: 0,
		   * begin the insertion at entry 1 of the searchtable.
		   *-------------------------------------------------------------*)
                   NrMatchStrings := NrMatchStrings+1;
                   IF ( agchar <> 'G' ) THEN BEGIN
                      lastcharindex := AddMatchStrToSearchTable(ident, 1, 
                                                   STRING_Length(ident), 0, 1,
                                                  b^.ldfield.matchstringfield.vars);
{
                      writeln('Added MatchString ',ident, ' to Table........');
}
                      END
                   ELSE BEGIN
{
                      writeln('Skipped MatchString ',ident)
}
                   END;
                   SEGCOMDECL_assignstatus(true);
                   matchvars2 := b^.ldfield.matchstringfield.vars;
                   IF NotEqualVars(matchvars1, matchvars2) THEN BEGIN
                      error(12, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END;
                genversion:
                   BEGIN
		  (*-------------------------------------------------------------*
		   * Because this is a prefix rule, the matchstring has to be added in normal
		   * order to the search table. 
		   *-------------------------------------------------------------*)
                   p := b^.ldfield.matchstringfield.str;
                   ident := b^.ldfield.matchstringfield.str;

		  (*-------------------------------------------------------------*
		   * Call AddMatchStrToSearchTable for the string ident:
		   * start with character 1 of this string,
		   * number of variables processed in this string: 0,
		   * begin the insertion at entry 1 of the searchtable.
		   *-------------------------------------------------------------*)
                   NrMatchStrings := NrMatchStrings+1;
                   IF ( agchar <> 'A' ) THEN BEGIN
                      lastcharindex := AddMatchStrToSearchTable(r, 1, 
                                                   STRING_Length(r), 0, 1,
                                                   matchvars1);
{
                      writeln('Added MatchString ', r, ' to Table........');
}
                      END
                   ELSE BEGIN
{
                      writeln('Skipped MatchString ',ident)
}
                   END;
                   SEGCOMDECL_assignstatus(true);
                   matchvars2 := b^.ldfield.matchstringfield.vars;
                   IF NotEqualVars(matchvars1, matchvars2) THEN BEGIN
                      error(12, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END
                END
                END
      END;
  11: CASE mode of
      loccond: SEGCOMDECL_assignstatus(true);
      globcond:  BEGIN
                   prestr := b^.sonlist^.node^.ldfield.terminal^.str;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
     Hfinal: BEGIN 
                 currentvarnr := 0;
                 righthandpart := false;
                 FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                     lefthandmatchvars[i] := -1;
                 END;
                 IF (( starpresent = 0 ) and (STRING_length(r) <> 0) and
                     (STRING_length(p) <> 0 )) or ( starpresent = 2 ) THEN BEGIN
                    IF lastcharindex <> -1 THEN BEGIN
                    AddEntryToFixTable(lastcharindex, r, p, 
                                       prestr, FONstr, CCstr,
                                       starpresent);
                    END;
                    t := SEGCOMDECL_MakeNonTerminal(PREENTRYSPEC);
                    SEGCOMDECL_addnewtop(t);
                    SEGCOMDECL_assignstatus(true) 
                    END
                 ELSE BEGIN
                    SEGCOMDECL_assignstatus(true) 
                 END
	   END
   END
END;


PROCEDURE SUFENTRYSPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   t     : SEGCOMDECL_pSnode;
   i,j,k : integer;
   ident : STRING_String;
BEGIN

   CASE a OF
   Hinit: BEGIN 
             lastcharindex    := -1;
             FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                matchvars1[i] := -1;
                matchvars2[i] := -1
             END;
             agchar := ' ';
             STRING_ConstantEmpty(r);
             STRING_ConstantEmpty(p);
             STRING_ConstantEmpty(sufstr);
             STRING_ConstantEmpty(FONstr);
             STRING_ConstantEmpty(CCstr);
             starpresent := 0;
          END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   agchar := b^.ldfield.angenspecfield.agchar;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   matchvars1 := b^.ldfield.matchstringfield.vars;
                   r := b^.ldfield.matchstringfield.str;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   starpresent := starpresent + 1;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   5: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   6: CASE mode of
      loccond:  BEGIN
{
                   currentvarnr := 0;
}                  righthandpart := true;
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: BEGIN
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   7: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   SEGCOMDECL_assignstatus(true);
                   entrynr := entrynr+1;
                END
      END;
   8: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   9: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond:  BEGIN
                   FONstr := b^.sonlist^.node^.ldfield.terminal^.str;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
  10: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                CASE version OF
                anversion:
                   BEGIN
		  (*-------------------------------------------------------------*
		   * Because this is a suffix rule, the matchstring has to be added in reverse
		   * order to the search table. Also the order of the variables
		   * has to be reversed.
		   * Notice that variables in this string can still be detected,
		   * because they are of the form '@i@'
		   *-------------------------------------------------------------*)
                   p := b^.ldfield.matchstringfield.str;
                   matchvars2 := b^.ldfield.matchstringfield.vars;
                   STRING_Reverse(ident, b^.ldfield.matchstringfield.str);
                   j := b^.ldfield.matchstringfield.nrvars;
	           FOR i:=1 TO (j div 2) DO BEGIN
                      k := b^.ldfield.matchstringfield.vars[i];
                      b^.ldfield.matchstringfield.vars[i] := 
                      b^.ldfield.matchstringfield.vars[j-i+1]
	           END {FOR};

		  (*-------------------------------------------------------------*
		   * Call AddMatchStrToSearchTable for the string ident:
		   * start with character 1 of this string,
		   * number of variables processed in this string: 0,
		   * begin the insertion at entry 1 of the searchtable.
		   *-------------------------------------------------------------*)
                   NrMatchStrings := NrMatchStrings+1;
                   IF ( agchar <> 'G' ) THEN BEGIN
                      lastcharindex := AddMatchStrToSearchTable(ident, 1, 
                                                   STRING_Length(ident), 0, 1,
                                                   matchvars1);
{
                      writeln('Added MatchString ',ident, ' to Table........')
}
                      END
                   ELSE BEGIN
{
                      writeln('Skipped MatchString ',ident)
}
                   END;
                   SEGCOMDECL_assignstatus(true);
                   IF NotEqualVars(matchvars1, matchvars2) THEN BEGIN
                      error(12, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                   END;
                genversion:
                   BEGIN
		  (*-------------------------------------------------------------*
		   * Because this is a suffix rule, the matchstring has to be added in reverse
		   * order to the search table. Also the order of the variables
		   * has to be reversed.
		   * Notice that variables in this string can still be detected,
		   * because they are of the form '@i@'
		   *-------------------------------------------------------------*)
                   p := b^.ldfield.matchstringfield.str;
                   matchvars2 := b^.ldfield.matchstringfield.vars;
                   STRING_Reverse(ident, r);
                   j := b^.ldfield.matchstringfield.nrvars;
	           FOR i:=1 TO (j div 2) DO BEGIN
                      k := b^.ldfield.matchstringfield.vars[i];
                      b^.ldfield.matchstringfield.vars[i] := 
                      b^.ldfield.matchstringfield.vars[j-i+1]
	           END {FOR};

		  (*-------------------------------------------------------------*
		   * Call AddMatchStrToSearchTable for the string ident:
		   * start with character 1 of this string,
		   * number of variables processed in this string: 0,
		   * begin the insertion at entry 1 of the searchtable.
		   *-------------------------------------------------------------*)
                   NrMatchStrings := NrMatchStrings+1;
                   IF ( agchar <> 'A' ) THEN BEGIN
                      lastcharindex := AddMatchStrToSearchTable(ident, 1, 
                                                   STRING_Length(ident), 0, 1,
                                                   matchvars1);
{
                      writeln('Added MatchString ',ident, ' to Table........') 
}
                      END
                   ELSE BEGIN
{
                      writeln('Skipped MatchString ',ident)
}
                   END;
                   SEGCOMDECL_assignstatus(true);
                   IF NotEqualVars(matchvars1, matchvars2) THEN BEGIN
                      error(12, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END;
                   END
                END
                END
      END;
  11: CASE mode of
      loccond: SEGCOMDECL_assignstatus(true);
      globcond:  BEGIN
                   sufstr := b^.sonlist^.node^.ldfield.terminal^.str;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
   Hfinal: BEGIN 
                 currentvarnr := 0;
                 righthandpart := false;
                 FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                     lefthandmatchvars[i] := -1;
                 END;
                 IF (( starpresent = 0 ) and (STRING_length(r) <> 0) and
                     (STRING_length(p) <> 0 )) or ( starpresent = 2 ) THEN BEGIN
                    IF lastcharindex <> -1 THEN BEGIN
                    AddEntryToFixTable(lastcharindex, r, p, 
                                       sufstr, FONstr, CCstr,
                                       starpresent);
                    END;
                    t := SUFENTRYNODE;
                    { the next statement indicates that all sons can be thrown
                      away }
                    t^.n := -1;
                    SEGCOMDECL_addnewtop(t);
                    SEGCOMDECL_assignstatus(true) 
                    END
                 ELSE BEGIN
                    SEGCOMDECL_assignstatus(false) 
                 END
	   END
   END
END;


PROCEDURE FREEENTRYSPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   t     : SEGCOMDECL_pSnode;
   i,j,k : integer;
   ident : STRING_String;
BEGIN

   CASE a OF
   Hinit: BEGIN 
             lastcharindex    := -1;
             STRING_ConstantEmpty(r);
             STRING_ConstantEmpty(p);
             STRING_ConstantEmpty(frestr);
             STRING_ConstantEmpty(FONstr);
             STRING_ConstantEmpty(CCstr);
             starpresent := 0;
          END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   agchar := b^.ldfield.angenspecfield.agchar;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   matchvars1 := b^.ldfield.matchstringfield.vars;
                   r := b^.ldfield.matchstringfield.str;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   starpresent := starpresent + 1;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   5: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   6: CASE mode of
      loccond:  BEGIN
{                   currentvarnr := 0;
}                  righthandpart := true;
                   SEGCOMDECL_assignstatus(true);
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   7: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   8: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   9: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond:  BEGIN
                   FONstr := b^.sonlist^.node^.ldfield.terminal^.str;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
  10: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond:  BEGIN
                   CCstr := b^.sonlist^.node^.ldfield.terminal^.str;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
  12: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN

		  (*-------------------------------------------------------------*
		   * Because this is a freefix rule, the matchstring has to be added in normal
		   * order to the search table. 
		   *-------------------------------------------------------------*)
                   p := b^.ldfield.matchstringfield.str;
                   ident := b^.ldfield.matchstringfield.str;

		  (*-------------------------------------------------------------*
		   * Call AddMatchStrToSearchTable for the string ident:
		   * start with character 1 of this string,
		   * number of variables processed in this string: 0,
		   * begin the insertion at entry 1 of the searchtable.
		   *-------------------------------------------------------------*)
                   NrMatchStrings := NrMatchStrings+1;
                   IF ( agchar <> 'G' ) THEN BEGIN
                      lastcharindex := AddMatchStrToSearchTable(ident, 1, 
                                                   STRING_Length(ident), 0, 1,
                                                  b^.ldfield.matchstringfield.vars);
{
                      writeln('Added MatchString ',ident, ' to Table........');
}
                      END
                   ELSE BEGIN
{
                      writeln('Skipped MatchString ',ident)
}
                   END;
                   SEGCOMDECL_assignstatus(true);
                   matchvars2 := b^.ldfield.matchstringfield.vars;
                   IF NotEqualVars(matchvars1, matchvars2) THEN BEGIN
                      error(12, b^.cl);
                      SEGCOMDECL_assignstatus(false);
                   END
                END
      END;
  11: CASE mode of
      loccond: SEGCOMDECL_assignstatus(true);
      globcond:  BEGIN
                   frestr := b^.sonlist^.node^.ldfield.terminal^.str;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
     Hfinal: BEGIN 
                 currentvarnr := 0;
                 righthandpart := false;
                 FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                     lefthandmatchvars[i] := -1;
                 END;
                 IF (( starpresent = 0 ) and (STRING_length(r) <> 0) and
                     (STRING_length(p) <> 0 )) or ( starpresent = 2 ) THEN BEGIN
                    AddEntryToFixTable(lastcharindex, r, p, 
                                       frestr, FONstr, CCstr, starpresent);
                    t := SEGCOMDECL_MakeNonTerminal(FREEENTRYSPEC);
                    SEGCOMDECL_addnewtop(t);
                    SEGCOMDECL_assignstatus(true) 
                    END
                 ELSE BEGIN 
                    SEGCOMDECL_assignstatus(false) 
                 END
	   END
   END
END;


PROCEDURE VARSPECPARTrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN 
                 SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(VARSPECPART));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE ALIASSPECPARTrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN 
                 SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(ALIASSPECPART));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE VARSPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   i, l : INTEGER;
   e,
   ident2,
   ident: STRING_String;
   ch   : char;
   isident: boolean;
   r    : SEGCOMDECL_pRsnode;
   dummy : INTEGER;

BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  BEGIN
                   ident := b^.ldfield.terminal^.str; isident := true;
                   l := STRING_Length(ident); i := 1;
                   WHILE (i <= l) AND isident DO BEGIN
                      STRING_ExtractChar(ch,ident,i);
                      IF i = 1 THEN
                         isident := ch in ['a'..'z','A'..'Z']
                      ELSE
                         isident := ch in ['a'..'z','A'..'Z','0'..'9'];
                      i := i+1
                   END;     
                   IF isident THEN BEGIN
                      i := LookUpVarInVarTable(ident);
                      IF i = -1 THEN BEGIN
                         SEGCOMDECL_assignstatus(true)
                         END
                      ELSE BEGIN
                         error(14, b^.cl); 
                         SEGCOMDECL_assignstatus(false)
                      END
                      END
                   ELSE BEGIN
                      error(1, b^.cl);
                      SEGCOMDECL_assignstatus(false)
                   END
                END;
      globcond: BEGIN
                   ident := b^.ldfield.terminal^.str;
                   currentvariable := AddVarToVarTable(ident, -1);
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   5: CASE mode OF
      loccond:  BEGIN
                   ident := b^.ldfield.terminal^.str; isident := true;
                   l := STRING_Length(ident); i := 1;
                   WHILE (i <= l) AND isident DO BEGIN
                      STRING_ExtractChar(ch,ident,i);
                      IF i = 1 THEN
                         isident := ch in ['a'..'z','A'..'Z']
                      ELSE
                         isident := ch in ['a'..'z','A'..'Z','0'..'9'];
                      i := i+1
                   END;     
                   IF isident THEN BEGIN
                      i := LookUpVarInVarTable(ident);
                      IF i = -1 THEN BEGIN
                         SEGCOMDECL_assignstatus(true)
                         END
                      ELSE BEGIN
                         error(14, b^.cl); 
                         SEGCOMDECL_assignstatus(false)
                      END
                      END
                   ELSE BEGIN
                      error(1, b^.cl);
                      SEGCOMDECL_assignstatus(false)
                   END
                END;
      globcond: BEGIN
                   ident := b^.ldfield.terminal^.str;
                   dummy := AddVarToVarTable(ident, currentvariable);
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   r := b^.sonlist;
                   WHILE r <> nil DO BEGIN
                      IF r^.node^.cat = IDENTIFIER THEN BEGIN
                         l := STRING_Length(r^.node^.ldfield.terminal^.str);
                         IF order = reverseorder THEN 
                            STRING_Reverse(ident, r^.node^.ldfield.terminal^.str )
                         ELSE
                            ident := r^.node^.ldfield.terminal^.str;
{
                         writeln('Adding Var ',ident, ' to Table......');
}
                         NrVarValues := NrVarValues+1;
                         AddVarToSearchTable(ident, 1, l, currentvariable);
                      END;
                      IF r^.node^.cat = IDPAIR THEN BEGIN
                         CASE version OF
                         anversion:
                            BEGIN
			    l := STRING_Length(r^.node^.ldfield.idpairfield.right);
			    IF order = reverseorder THEN BEGIN
			       STRING_Reverse(ident, r^.node^.ldfield.idpairfield.right);
			       STRING_Reverse(ident2, r^.node^.ldfield.idpairfield.left)
                               END
			    ELSE BEGIN
			       ident := r^.node^.ldfield.idpairfield.right;
			       ident2 := r^.node^.ldfield.idpairfield.left;
                            END;
   {
			    writeln('Adding Var ',ident, ' to Table......');
   }
			    NrVarValues := NrVarValues+1;
			    lastcharindex := AddVarStrToSearchTable(ident, 1, l, currentvariable);
                            AddVarStrToTable(lastcharindex, ident2)
                            END;
                         genversion:
                            BEGIN
			    l := STRING_Length(r^.node^.ldfield.idpairfield.left);
			    IF order = reverseorder THEN BEGIN
			       STRING_Reverse(ident, r^.node^.ldfield.idpairfield.left);
			       STRING_Reverse(ident2, r^.node^.ldfield.idpairfield.right)
                               END
			    ELSE BEGIN
			       ident := r^.node^.ldfield.idpairfield.left;
			       ident2 := r^.node^.ldfield.idpairfield.right;
                            END;
   {
			    writeln('Adding Var ',ident, ' to Table......');
   }
			    NrVarValues := NrVarValues+1;
			    lastcharindex := AddVarStrToSearchTable(ident, 1, l, currentvariable);
                            AddVarStrToTable(lastcharindex, ident2)
                            END
                         END
                      END;
                      r := r^.brother
                   END;
                   IF b^.ldfield.setconstrfield.emptyvar THEN BEGIN
                      STRING_ConstantEmpty(e);
{
                      writeln('Adding Emptyvar to Table......');
}
                      NrVarValues := NrVarValues+1;
                      AddVarToSearchTable(e, 0, 0, currentvariable);
                   END;
                   SEGCOMDECL_assignstatus(true);
                END;
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(VARSPEC));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE ALIASSPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   l,
   i, j : INTEGER;
   ident: STRING_String;
   isident: boolean;
   ch     : CHAR;

BEGIN

   CASE a OF
   Hinit: BEGIN 
             STRING_ConstantEmpty(ident);    
             STRING_ConstantEmpty(curvar);    
          END;
   1: CASE mode OF
      loccond:  BEGIN
                   ident := b^.ldfield.terminal^.str; isident := true;
                   l := STRING_Length(ident); i := 1;
                   WHILE (i <= l) AND isident DO BEGIN
                      STRING_ExtractChar(ch,ident,i);
                      IF i = 1 THEN
                         isident := ch in ['a'..'z','A'..'Z']
                      ELSE
                         isident := ch in ['a'..'z','A'..'Z','0'..'9'];
                      i := i+1
                   END;     
                   IF isident THEN BEGIN
                      i := LookUpVarInVarTable(ident);
                      IF i <> -1 THEN BEGIN
                         SEGCOMDECL_assignstatus(true)
                         END
                      ELSE BEGIN
                         error(11, b^.cl); 
                         SEGCOMDECL_assignstatus(false)
                      END
                      END
                   ELSE BEGIN
                      error(1, b^.cl);
                      SEGCOMDECL_assignstatus(false)
                   END
                END;
      globcond: BEGIN
                   curvar := b^.ldfield.terminal^.str;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode OF
      loccond:  BEGIN
                   ident := b^.ldfield.terminal^.str; isident := true;
                   l := STRING_Length(ident); i := 1;
                   WHILE (i <= l) AND isident DO BEGIN
                      STRING_ExtractChar(ch,ident,i);
                      IF i = 1 THEN
                         isident := ch in ['a'..'z','A'..'Z']
                      ELSE
                         isident := ch in ['a'..'z','A'..'Z','0'..'9'];
                      i := i+1
                   END;     
                   IF isident THEN BEGIN
                      i := LookUpVarViaAliasTable(ident);
                      j := LookUpVarInVarTable(ident);
                      IF (i = -1) AND (j = -1) THEN BEGIN
                         SEGCOMDECL_assignstatus(true)
                         END
                      ELSE BEGIN
                         error(14, b^.cl); 
                         SEGCOMDECL_assignstatus(false)
                      END
                      END
                   ELSE BEGIN
                      error(1, b^.cl);
                      SEGCOMDECL_assignstatus(false)
                   END
                END;
      globcond: BEGIN
                   ident := b^.ldfield.terminal^.str;
                   AddAliasToAliasTable(ident, curvar);
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(ALIASSPEC));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE SETCONSTRrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR 
   t : SEGCOMDECL_pSnode;
BEGIN

   CASE a OF
   Hinit: BEGIN 
             emptyvar := false;
          END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   emptyvar := true;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   5: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN t := SEGCOMDECL_MakeNonTerminal(SETCONSTR);
                 t^.ldfield.setconstrfield.emptyvar := emptyvar;
                 SEGCOMDECL_addnewtop(t);
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE ANGENSPECrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   t      : SEGCOMDECL_pSnode;
   isident: boolean;
   l      : STRING_range;
   ident  : STRING_String;
   ch     : char;
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   2: CASE mode OF
      loccond:  BEGIN
                   ident := b^.ldfield.terminal^.str; isident := true;
                   l := STRING_Length(ident);
                   IF l <> 1 THEN isident := false
                   ELSE BEGIN
                      STRING_ExtractChar(ch,ident,1);
                      agchar := ch;
                      IF not((ch = 'A') or (ch = 'G')) THEN
                         isident := false
                   END;     
                   IF isident THEN SEGCOMDECL_assignstatus(true)
                   ELSE BEGIN
                      error(2, b^.cl);
                      SEGCOMDECL_assignstatus(false)
                   END
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN t := SEGCOMDECL_MakeNonTerminal(ANGENSPEC);
                 t^.ldfield.angenspecfield.agchar := agchar;
                 SEGCOMDECL_addnewtop(t);
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE PFKCATrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   ident,
   PFKstr1,
   PFKstr2 : STRING_String;
   i,l,r     : integer;
   isident : boolean;
   ch : char;
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  BEGIN
                   ident := b^.ldfield.terminal^.str; isident := true;
                   l := STRING_Length(ident);
                   IF l < 3 THEN isident := false
                   ELSE BEGIN

                  (*-------------------------------------------------------*
                   * @@Change 29-9-87
                   *-------------------------------------------------------*)
                      {
                      STRING_Extract(PFKstr1, ident, 1, 3);
                      STRING_Constant(PFKstr2, 'PFK',3);
                      r := STRING_Compare(PFKstr1, PFKstr2);
                      IF r <> 0 THEN isident := false
                      }
                   END;     
                   IF isident THEN BEGIN
                      i := 4;
                      WHILE (i <=l) and isident DO BEGIN
                         STRING_ExtractChar(ch, ident, i);
                         isident := ch in ['a'..'z','A'..'Z','0'..'9'];
                         i := i+1
                      END;
                      IF not isident THEN error(7, b^.cl);
                      SEGCOMDECL_assignstatus(isident)
                      END
                   ELSE BEGIN
                      error(4, b^.cl);
                      SEGCOMDECL_assignstatus(false)
                   END
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(PFKCAT));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE SFKCATrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   ident,
   SFKstr1,
   SFKstr2 : STRING_String;
   i,l,r     : integer;
   isident : boolean;
   ch : char;
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  BEGIN
                   ident := b^.ldfield.terminal^.str; isident := true;
                   l := STRING_Length(ident);
                   IF l < 3 THEN isident := false
                   ELSE BEGIN
                      STRING_Extract(SFKstr1, ident, 1, 3);
                      STRING_Constant(SFKstr2, 'SFK', 3);
                      r := STRING_Compare(SFKstr1, SFKstr2);
                      IF r <> 0 THEN isident := false
                   END;     
                   IF isident THEN BEGIN
                      i := 4;
                      WHILE (i <=l) and isident DO BEGIN
                         STRING_ExtractChar(ch, ident, i);
                         isident := ch in ['a'..'z','A'..'Z','0'..'9'];
                         i := i+1
                      END;
                      IF not isident THEN error(8, b^.cl);
                      SEGCOMDECL_assignstatus(isident)
                      END
                   ELSE BEGIN
                      error(3, b^.cl);
                      SEGCOMDECL_assignstatus(false)
                   END
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(SFKCAT));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE MATCHSTRINGrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   localvarnr,
   j,
   i : integer;
   t : SEGCOMDECL_pSnode;
   found : boolean;
BEGIN

   CASE a OF
   Hinit: BEGIN 
             STRING_ConstantEmpty(matchident);
             nrvars := currentvarnr;
             nrcomp := 0;
             FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                IF righthandpart THEN BEGIN
                   matchvars[i] := -1
                   END
                ELSE BEGIN
                   matchvars[i] := lefthandmatchvars[i]
                END
             END;
          END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   currentline := b^.cl;
                   nrcomp := nrcomp + 1;
                   STRING_Append(matchident, b^.ldfield.terminal^.str);
                  IF nrcomp > 1 THEN BEGIN
                      SEGCOMDECL_assignstatus(b^.connected)
                      END
                   ELSE BEGIN
                      SEGCOMDECL_assignstatus(true);
                   END;                  
                END;
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                  currentline := b^.cl;
                   nrcomp := nrcomp + 1;
                   IF nrcomp > 1 THEN BEGIN
                      SEGCOMDECL_assignstatus(b^.connected)
                      END
                   ELSE BEGIN
                      SEGCOMDECL_assignstatus(true);
                   END;                  
                END;
      END;
   3: CASE mode of
      loccond:  BEGIN
                   i := LookUpVarViaAliasTable(b^.ldfield.terminal^.str);
                   IF i <> -1 THEN BEGIN
                      SEGCOMDECL_assignstatus(true);
                      END
                   ELSE BEGIN
                      SEGCOMDECL_assignstatus(false);
                      error(11, b^.cl)
                   END
                END;
      globcond: BEGIN
                   i := LookUpVarViaAliasTable(b^.ldfield.terminal^.str);
                   j := 1; found := false;
                   WHILE ( j <= nrvars ) and not found DO BEGIN
                      found := lefthandmatchvars[j] = i;
                      j := j+1
                   END;
                   IF not found THEN BEGIN
                      nrvars := nrvars + 1;
                      matchvars[nrvars] := i;
                      localvarnr := nrvars;
                      END
                   ELSE BEGIN
                      matchvars[j-1] := i;
                      localvarnr := j-1
                   END;
                   STRING_Append(matchident, varconv[localvarnr]);
                   nrcomp := nrcomp + 1;
                   IF nrcomp > 1 THEN BEGIN
                      SEGCOMDECL_assignstatus(b^.connected)
                      END
                   ELSE BEGIN
                      SEGCOMDECL_assignstatus(true);
                   END;                  

                END
      END;
   4: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   nrcomp := nrcomp + 1;
                   IF nrcomp > 1 THEN BEGIN
                      SEGCOMDECL_assignstatus(b^.connected)
                      END
                   ELSE BEGIN
                      SEGCOMDECL_assignstatus(true);
                   END;                  
                END
      END;
   Hfinal: BEGIN 
 

             IF ( la <> nil ) and 
                ( la^.cat in [PLUS,SEMCOLON,MULT,COLON,COMMA]) THEN BEGIN
                 t := SEGCOMDECL_MakeNonTerminal(MATCHSTRING);
                t^.cl := currentline;
                t^.ldfield.matchstringfield.str := matchident;
                 t^.ldfield.matchstringfield.nrvars := nrvars;
                 FOR i:=1 TO SEGMRULES_MAXVARS DO BEGIN
                    t^.ldfield.matchstringfield.vars[i] := -1;
                 END;
                 FOR i:=1 TO nrvars DO BEGIN
                    t^.ldfield.matchstringfield.vars[i] := matchvars[i];
                 END;
                 currentvarnr := nrvars;
                 IF not righthandpart THEN lefthandmatchvars := matchvars;
                 SEGCOMDECL_addnewtop(t);
                SEGCOMDECL_assignstatus(true); 
                 END
             ELSE BEGIN
                 SEGCOMDECL_assignstatus(false) 
             END                 
	   END
   END
END;


PROCEDURE FONCATrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   ident,
   FONstr1,
   FONstr2 : STRING_String;
   i,l,r     : integer;
   isident : boolean;
   ch : char;
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  BEGIN
                   ident := b^.ldfield.terminal^.str; isident := true;
                   l := STRING_Length(ident);
                   IF l < 3 THEN isident := false
                   ELSE BEGIN
                      STRING_Extract(FONstr1, ident, 1, 3);
                      STRING_Constant(FONstr2, 'FON', 3);
                      r := STRING_Compare(FONstr1, FONstr2);
                      IF r <> 0 THEN isident := false
                   END;     
                   IF isident THEN BEGIN
                      i := 4;
                      WHILE (i <=l) and isident DO BEGIN
                         STRING_ExtractChar(ch, ident, i);
                         isident := ch in ['a'..'z','A'..'Z','0'..'9'];
                         i := i+1
                      END;
                      IF not isident THEN error(9, b^.cl);
                      SEGCOMDECL_assignstatus(isident)
                      END
                   ELSE BEGIN
                      SEGCOMDECL_assignstatus(false)
                   END
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(FONCAT));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE CCCATrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR
   ident,
   CCstr1,
   CCstr2 : STRING_String;
   i,l,r   : integer;
   isident : boolean;
   ch : char;
BEGIN

   CASE a OF
   Hinit: BEGIN END;
   1: CASE mode OF
      loccond:  BEGIN
                   ident := b^.ldfield.terminal^.str; isident := true;
                   l := STRING_Length(ident);
                   IF l < 2 THEN isident := false
                   ELSE BEGIN
                      STRING_Extract(CCstr1, ident, 1, 2);
                      STRING_Constant(CCstr2, 'CC', 2);
                      r := STRING_Compare(CCstr1, CCstr2);
                      IF r <> 0 THEN isident := false
                   END;     
                   IF isident THEN BEGIN
                      i := 3;
                      WHILE (i <=l) and isident DO BEGIN
                         STRING_ExtractChar(ch, ident, i);
                         isident := ch in ['a'..'z','A'..'Z','0'..'9'];
                         i := i+1
                      END;
                      IF not isident THEN error(10, b^.cl);
                      SEGCOMDECL_assignstatus(isident)
                      END
                   ELSE BEGIN
                      SEGCOMDECL_assignstatus(false)
                   END
                END;
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   Hfinal: BEGIN SEGCOMDECL_addnewtop(SEGCOMDECL_MakeNonTerminal(CCCAT));
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


PROCEDURE IDPAIRrule(a: SEGCOMDECL_nodeid;b: SEGCOMDECL_pSnode;
                  mode: SEGCOMDECL_Surfrulemode);
VAR 
   t : SEGCOMDECL_pSnode;
BEGIN

   CASE a OF
   Hinit: BEGIN 
             STRING_ConstantEmpty(leftidpair);             
             STRING_ConstantEmpty(rightidpair);             
          END;
   1: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   leftidpair := b^.ldfield.terminal^.str;
                   SEGCOMDECL_assignstatus(true)
                END
      END;
   2: CASE mode OF
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: SEGCOMDECL_assignstatus(true);
      END;
   3: CASE mode of
      loccond:  SEGCOMDECL_assignstatus(true);
      globcond: BEGIN
                   rightidpair := b^.ldfield.terminal^.str;
                   SEGCOMDECL_assignstatus(true);
                END
      END;
   Hfinal: BEGIN t := SEGCOMDECL_MakeNonTerminal(IDPAIR);
                 t^.ldfield.idpairfield.left := leftidpair;
                 t^.ldfield.idpairfield.right := rightidpair;
                 SEGCOMDECL_addnewtop(t);
                 SEGCOMDECL_assignstatus(true) 
	   END
   END
END;


BEGIN
   CASE rnr OF
   1 :  UTTrule(a,b,mode); 
   2 :  LGLUEDEFrule(a,b,mode); 
   3 :  RGLUEDEFrule(a,b,mode); 
   4 :  MGLUEDEFrule(a,b,mode); 
   5 :  PREDEFrule(a,b,mode); 
   6 :  SUFDEFrule(a,b,mode); 
   7 :  FREEDEFrule(a,b,mode); 
   8 :  LGLUETYPESPECrule(a,b,mode); 
   9 :  RGLUETYPESPECrule(a,b,mode); 
   10:  MGLUETYPESPECrule(a,b,mode); 
   11:  PRETYPESPECrule(a,b,mode); 
   12:  SUFTYPESPECrule(a,b,mode); 
   13:  FREETYPESPECrule(a,b,mode); 
   14:  LGLUETABLESPECrule(a,b,mode); 
   15:  RGLUETABLESPECrule(a,b,mode); 
   16:  MGLUETABLESPECrule(a,b,mode); 
   17:  PRETABLESPECrule(a,b,mode); 
   18:  SUFTABLESPECrule(a,b,mode); 
   19:  FREETABLESPECrule(a,b,mode); 
   20:  LGLUEENTRYSPECrule(a,b,mode); 
   21:  RGLUEENTRYSPECrule(a,b,mode); 
   22:  MGLUEENTRYSPECrule(a,b,mode); 
   23:  PREENTRYSPECrule(a,b,mode); 
   24:  SUFENTRYSPECrule(a,b,mode); 
   25:  FREEENTRYSPECrule(a,b,mode); 
   26:  VARSPECPARTrule(a,b,mode); 
   27:  VARSPECrule(a,b,mode); 
   28:  SETCONSTRrule(a,b,mode); 
   29:  ANGENSPECrule(a,b,mode); 
   30:  PFKCATrule(a,b,mode); 
   31:  SFKCATrule(a,b,mode); 
   32:  MATCHSTRINGrule(a,b,mode); 
   33:  FONCATrule(a,b,mode); 
   34:  CCCATrule(a,b,mode);
   35:  IDPAIRrule(a, b, mode);
   36:  ALIASSPECPARTrule(a, b, mode);
   37:  ALIASSPECrule(a, b, mode);
   END;
99:
END;


(*-------------------------------------------------------------------------*
 * File I/O package for writing the tables to file. The routines
 * defined here are a copy of the routines in the implementation
 * module SEGMRULES. They are not inherited because a number of 
 * large arrays are defined in that module, causing a virtual memory
 * crash.
 *-------------------------------------------------------------------------*)


PROCEDURE FIXruleOpenWrite(
                    VAR f: SEGMRULES_FIXdict;
                    CONST name: STRING);
VAR   infile    : STRING(32);
     
BEGIN
   LogName_Translate(name,infile);
   rewrite(f,infile);

END {FIXruleOpenWrite};


PROCEDURE FIXruleWrite(VAR f: SEGMRULES_FIXdict;
                                r: SEGMRULES_FIXrule);
BEGIN

   write(f, r)

END {FIXruleWrite};


PROCEDURE FIXruleClose( VAR f: SEGMRULES_FIXdict);

BEGIN

   close(f)

END {FIXruleClose};


PROCEDURE GLUEruleOpenWrite(
                    VAR f: SEGMRULES_GLUEdict;
                    CONST name: STRING);
VAR   infile    : STRING(32);
     
BEGIN
   LogName_Translate(name,infile);
   rewrite(f,infile);
END {GLUEruleOpenWrite};


PROCEDURE GLUEruleWrite(VAR f: SEGMRULES_GLUEdict;
                                r: SEGMRULES_GLUErule);
BEGIN

   write(f, r)

END {GLUEruleWrite};



PROCEDURE GLUEruleClose( VAR f: SEGMRULES_GLUEdict);

BEGIN

   close(f)

END {GLUEruleClose};


PROCEDURE SearchOpenWrite(
                    VAR f: SEGMRULES_SearchDict;
                    CONST name: STRING);
    
VAR   infile    : STRING(32);
     
BEGIN
   LogName_Translate(name,infile);
   rewrite(f,infile);

END {SearchOpenWrite};



PROCEDURE SearchWrite(VAR f: SEGMRULES_SearchDict;
                                r: SEGMRULES_SearchTree);
BEGIN

   write(f, r)

END {SearchWrite};


PROCEDURE SearchClose( VAR f: SEGMRULES_SearchDict);

BEGIN

   close(f)

END {SearchClose};

PROCEDURE VarOpenWrite(
                    VAR f: SEGMRULES_VarDict;
                    CONST name: STRING);
VAR   infile    : STRING(32);
     
BEGIN
   LogName_Translate(name,infile);
   rewrite(f,infile);

END {VarOpenWrite};



PROCEDURE VarWrite(VAR f: SEGMRULES_VarDict;
                   r: SEGMRULES_VarRecord);
BEGIN

   write(f, r)

END {VarWrite};


PROCEDURE VarClose( VAR f: SEGMRULES_VarDict);

BEGIN

   close(f)

END {VarClose};


PROCEDURE VarStrOpenWrite(
                    VAR f: SEGMRULES_VarStrDict;
                    CONST name: STRING);
VAR   infile    : STRING(32);
     
BEGIN
   LogName_Translate(name,infile);
   rewrite(f, infile);

END {VarStrOpenWrite};



PROCEDURE VarStrWrite(VAR f: SEGMRULES_VarStrDict;
                   r: SEGMRULES_VarStrRecord);
BEGIN

   write(f, r)

END {VarStrWrite};


PROCEDURE VarStrClose( VAR f: SEGMRULES_VarStrDict);

BEGIN

   close(f)

END {VarStrClose};


PROCEDURE CharOpenWrite(
                    VAR f: SEGMRULES_CharDict;
                    CONST name: STRING);
VAR   infile    : STRING(32);
     
BEGIN
   LogName_Translate(name,infile);

   rewrite(f,infile);

END {CharOpenWrite};



PROCEDURE CharWrite(VAR f: SEGMRULES_CharDict;
                                r: SEGMRULES_CharRecord);
BEGIN

   write(f, r)

END {CharWrite};


PROCEDURE CharClose( VAR f: SEGMRULES_CharDict);

BEGIN

   close(f)

END {CharClose};


(*-------------------------------------------------------------------------*
 * Code generation part
 *-------------------------------------------------------------------------*)


PROCEDURE SEGCOMRULES_ACode;

   PROCEDURE GenerateFixCode;

   VAR f1 : SEGMRULES_FixDict;
       f2 : SEGMRULES_SearchDict;       
       f3 : SEGMRULES_VarDict;
       f4 : SEGMRULES_CharDict;
       f5 : SEGMRULES_VarStrDict;
       k,
       i  : integer;
       j  : char;

   BEGIN
      FixRuleOpenWrite(f1,'arulefile');
      FOR i:=1 to curfix DO FixRuleWrite(f1,FixRuleTable[i]);
      FixRuleClose(f1);

      SearchOpenWrite(f2,'asearchfile');
      FOR i:=1 to NrSearchTableRecords DO BEGIN
{
         WITH SearchTable[i] DO BEGIN
            writeln(i);
            writeln('nrvars : ',nrvars:10,'   result: ',result:10);
            FOR j:='0' TO 'ý' DO
               IF ( cindex[j] <> -1 ) and
                  ( j in 
                    ['0'..'9','A'..'Z','a'..'z','À'..'Ý','à'..'ý','.',''''] )
                   THEN writeln('char:  ', j, '  value: ', cindex[j]);
            FOR k:=1 TO nrvars DO
               writeln('vnr: ', vindex[k].vnr:10,'  v: ', vindex[k].v:10, 
                       '  nxt: ', vindex[k].nxt:10)
         END;
}
         SearchWrite(f2,SearchTable[i]);
      END;
      SearchClose(f2);

      VarOpenWrite(f3,'avarfile');
      FOR i:=1 to NrVarTableRecords DO BEGIN
         VarWrite(f3,VarRecTable[i]);
      END;
      VarClose(f3);

      VarStrOpenWrite(f5,'avarstrfile');
      FOR i:=1 to NrVarStrTableRecords DO BEGIN
         VarStrWrite(f5,VarStrRecTable[i]);
      END;
      VarStrClose(f5);

      CharOpenWrite(f4,'acharfile');
      FOR i:=1 to NrCharTableRecords DO BEGIN
         CharWrite(f4,CharRecTable[i]);
      END;
      CharClose(f4)

   END {GenerateFixCode};


   PROCEDURE GenerateGlueCode;

   VAR f1 : SEGMRULES_GlueDict;
       f2 : SEGMRULES_SearchDict;       
       f3 : SEGMRULES_VarDict;
       f4 : SEGMRULES_CharDict;
       f5 : SEGMRULES_VarStrDict;
       k,
       i  : integer;
       j  : char;

   BEGIN
      GlueRuleOpenWrite(f1,'arulefile');
      FOR i:=1 to curGlue DO GlueRuleWrite(f1,GlueRuleTable[i]);
      GlueRuleClose(f1);

      SearchOpenWrite(f2,'asearchfile');
      FOR i:=1 to NrSearchTableRecords DO BEGIN
{
         WITH SearchTable[i] DO BEGIN
            writeln('nrvars : ',nrvars:10,'   result: ',result:10);
            FOR j:='0' TO 'ý' DO
               IF ( cindex[j] <> -1 ) and
                  ( j in 
                    ['0'..'9','A'..'Z','a'..'z','À'..'Ý','à'..'ý','.',''''] )
                   THEN writeln('char:  ', j, '  value: ', cindex[j]);
            FOR k:=1 TO nrvars DO
               writeln('vnr: ', vindex[k].vnr:10,'  v: ', vindex[k].v:10, 
                       '  nxt: ', vindex[k].nxt:10)
         END;
}
         SearchWrite(f2,SearchTable[i]);
      END;
      SearchClose(f2);

      VarOpenWrite(f3,'avarfile');
      FOR i:=1 to NrVarTableRecords DO BEGIN
         VarWrite(f3,VarRecTable[i]);
      END;
      VarClose(f3);

      VarStrOpenWrite(f5,'avarstrfile');
      FOR i:=1 to NrVarStrTableRecords DO BEGIN
         VarStrWrite(f5,VarStrRecTable[i]);
      END;
      VarStrClose(f5);

      CharOpenWrite(f4,'acharfile');
      FOR i:=1 to NrCharTableRecords DO BEGIN
         CharWrite(f4,CharRecTable[i]);
      END;
      CharClose(f4)

   END {GenerateGlueCode};


BEGIN

   IF KindOfRules = fixruletype THEN BEGIN
      GenerateFixCode
      END
   ELSE BEGIN
      GenerateGlueCode
   END;

END {SEGCOMRULES_ACode};


PROCEDURE SEGCOMRULES_GCode;

   PROCEDURE GenerateFixCode;

   VAR f1 : SEGMRULES_FixDict;
       f2 : SEGMRULES_SearchDict;       
       f3 : SEGMRULES_VarDict;
       f4 : SEGMRULES_CharDict;
       f5 : SEGMRULES_VarStrDict;
       k,
       i  : integer;
       j  : char;

   BEGIN
      FixRuleOpenWrite(f1,'grulefile');
      FOR i:=1 to curfix DO FixRuleWrite(f1,FixRuleTable[i]);
      FixRuleClose(f1);

      SearchOpenWrite(f2,'gsearchfile');
      FOR i:=1 to NrSearchTableRecords DO BEGIN
{
         WITH SearchTable[i] DO BEGIN
            writeln('nrvars : ',nrvars:10,'   result: ',result:10);
            FOR j:='0' TO 'ý' DO
               IF ( cindex[j] <> -1 ) and
                  ( j in 
                    ['0'..'9','A'..'Z','a'..'z','À'..'Ý','à'..'ý','.',''''] )
                   THEN writeln('char:  ', j, '  value: ', cindex[j]);
            FOR k:=1 TO nrvars DO
               writeln('vnr: ', vindex[k].vnr:10,'  v: ', vindex[k].v:10, 
                       '  nxt: ', vindex[k].nxt:10)
         END;
}
         SearchWrite(f2,SearchTable[i]);
      END;
      SearchClose(f2);

      VarOpenWrite(f3,'gvarfile');
      FOR i:=1 to NrVarTableRecords DO BEGIN
         VarWrite(f3,VarRecTable[i]);
      END;
      VarClose(f3);

      VarStrOpenWrite(f5,'gvarstrfile');
      FOR i:=1 to NrVarStrTableRecords DO BEGIN
         VarStrWrite(f5,VarStrRecTable[i]);
      END;
      VarStrClose(f5);

      CharOpenWrite(f4,'gcharfile');
      FOR i:=1 to NrCharTableRecords DO BEGIN
         CharWrite(f4,CharRecTable[i]);
      END;
      CharClose(f4);

   END {GenerateFixCode};


   PROCEDURE GenerateGlueCode;

   VAR f1 : SEGMRULES_GlueDict;
       f2 : SEGMRULES_SearchDict;       
       f3 : SEGMRULES_VarDict;
       f4 : SEGMRULES_CharDict;
       f5 : SEGMRULES_VarStrDict;
       k,
       i  : integer;
       j  : char;

   BEGIN
      GlueRuleOpenWrite(f1,'grulefile');
      FOR i:=1 to curGlue DO GlueRuleWrite(f1,GlueRuleTable[i]);
      GlueRuleClose(f1);

      SearchOpenWrite(f2,'gsearchfile');
      FOR i:=1 to NrSearchTableRecords DO BEGIN
{
         WITH SearchTable[i] DO BEGIN
            writeln('nrvars : ',nrvars:10,'   result: ',result:10);
            FOR j:='0' TO 'ý' DO
               IF ( cindex[j] <> -1 ) and
                  ( j in 
                    ['0'..'9','A'..'Z','a'..'z','À'..'Ý','à'..'ý','.',''''] )
                   THEN writeln('char:  ', j, '  value: ', cindex[j]);
            FOR k:=1 TO nrvars DO
               writeln('vnr: ', vindex[k].vnr:10,'  v: ', vindex[k].v:10, 
                       '  nxt: ', vindex[k].nxt:10)
         END;
}
         SearchWrite(f2,SearchTable[i]);
      END;
      SearchClose(f2);

      VarOpenWrite(f3,'gvarfile');
      FOR i:=1 to NrVarTableRecords DO BEGIN
         VarWrite(f3,VarRecTable[i]);
      END;
      VarClose(f3);

      VarStrOpenWrite(f5,'gvarstrfile');
      FOR i:=1 to NrVarStrTableRecords DO BEGIN
         VarStrWrite(f5,VarStrRecTable[i]);
      END;
      VarStrClose(f5);

      CharOpenWrite(f4,'gcharfile');
      FOR i:=1 to NrCharTableRecords DO BEGIN
         CharWrite(f4,CharRecTable[i]);
      END;
      CharClose(f4)

   END {GenerateGlueCode};


BEGIN

   IF KindOfRules = fixruletype THEN BEGIN
      GenerateFixCode
      END
   ELSE BEGIN
      GenerateGlueCode
   END;

END {SEGCOMRULES_GCode};

