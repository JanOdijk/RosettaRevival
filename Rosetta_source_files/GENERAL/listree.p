(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LISTREE
 *  Creation date   :  7-NOV-1986
 *  Author          : RENE LEERMAKERS
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *  Modified at  27-APR-1987 by Carel Fellinger
 *                    Added the routines LIStree_ParserResultSaved,
 *                    LIStree_SaveParseResult and LIStree_ReturnParseResult.
 *                    Adapted LIStree_MakeStree to initialize LI.Done.
 *               2-JAN-88: Joep Rous
 *                    Added functions LISTREE_InitLIRecord
 *EMP:::===================================================================*)

Export(LISTREE);
pragma C_Include('mem.pf');
pragma C_Include('listree.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LISTREE;
WITH MEM;

TYPE
   SearchMode = (syn, sem);



PROCEDURE LISTREE_InitLIRecord(VAR s: LISTREE_pStree);
BEGIN
   WITH s^.LI^ DO BEGIN
   n        := 0;
   minpos   := 0;
   maxpos   := 0;
   Done     := FALSE;
   synbonus := 0;
   sembonus := 0;
{  Dtrees   := ;
   HyperNodeElt :=
}
   X        := 0;
   Y        := 0;
   len      := 0;
   BxprId   := 0;
   First    := FALSE;
   BugString:= NIL;
   END
END {LISTREE_InitLIRecord};


PROCEDURE LISTREE_MakeStree(VAR s:LISTREE_pStree);
BEGIN 
   Mem_NewDefault(Loopholes.SizeOf(LISTREE_Stree), Loopholes.Retype(s,Mem_Ptr));
   Mem_NewDefault(Loopholes.SizeOf(LISTREE_LIRecord), Loopholes.Retype(s^.LI,Mem_Ptr));
   LISTREE_InitLIRecord(s);
   s^.LS    := nil;
   s^.twin  := nil;
   s^.sons  := nil;
END {LISTREE_MakeStree};


PROCEDURE LISTREE_MakeRelNode(VAR rs:LISTREE_pRelnode);
BEGIN
MEM_NewDefault(Loopholes.SizeOf(LISTREE_RelNode), Loopholes.Retype(rs,MEM_ptr));
rs^.brother:=NIL;
END;

PROCEDURE LISTREE_InitSetOfStrees(VAR S:LISTREE_SetOfStrees);
BEGIN {LISTREE_InitSetOfStrees}
S.first:=nil;S.last:=nil;S.cur:=nil;
END {LISTREE_InitSetOfStrees};


PROCEDURE LISTREE_AppendStree(stree:LISTREE_pStree;
                                       VAR S:LISTREE_SetOfStrees);
VAR p:LISTREE_pLoStree;
BEGIN {LISTREE_AppendStree}
Mem_NewDefault(Loopholes.SizeOf(LISTREE_LoStree), Loopholes.Retype(p,Mem_Ptr));
p^.arg:=stree;
p^.next:=nil;
p^.bonus := 0;
if S.first=nil then
   begin
   S.first:=p;
   S.last:=p;
   S.cur:=p
   end
else
   begin
   S.last^.next:=p;
   S.last:=p
   end
END {LISTREE_AppendStree};

PROCEDURE LISTREE_AppendStreebonus(stree:LISTREE_pStree;
                                       VAR S:LISTREE_SetOfStrees;
                                       bonus:INTEGER);
VAR p:LISTREE_pLoStree;
BEGIN {LISTREE_AppendStreebonus}
Mem_NewDefault(Loopholes.SizeOf(LISTREE_LoStree), Loopholes.Retype(p,Mem_Ptr));
p^.arg:=stree;
p^.next:=nil;
p^.bonus := bonus;
if S.first=nil then
   begin
   S.first:=p;
   S.last:=p;
   S.cur:=p
   end
else
   begin
   S.last^.next:=p;
   S.last:=p
   end
END {LISTREE_AppendStreebonus};


PROCEDURE LISTREE_AppendSortStree(stree:LISTREE_pStree;
                                       VAR S:LISTREE_SetOfStrees);
VAR 
   f, prev, p:LISTREE_pLoStree;
   stop : BOOLEAN;
   mode : SearchMode;
BEGIN {LISTREE_AppendStree}
Mem_NewDefault(Loopholes.SizeOf(LISTREE_LoStree), Loopholes.Retype(p,Mem_Ptr));
p^.arg:=stree;
p^.next:=nil;
p^.bonus := 0;
IF S.first=nil THEN BEGIN
   S.first:=p;
   S.last:=p;
   S.cur:=p
   END
ELSE BEGIN
   stop := FALSE; f := S.first; prev := NIL; mode := sem;
   REPEAT
      IF mode = sem THEN BEGIN
         IF stree^.LI^.sembonus > f^.arg^.LI^.sembonus THEN stop := TRUE;
         IF stree^.LI^.sembonus = f^.arg^.LI^.sembonus THEN mode := syn;
      END;
      IF NOT stop AND (mode = syn) THEN BEGIN
           IF (stree^.LI^.sembonus = f^.arg^.LI^.sembonus) THEN BEGIN
              IF (stree^.LI^.synbonus >= f^.arg^.LI^.synbonus) THEN stop := TRUE;
              END
           ELSE stop := TRUE
      END;
      IF NOT stop THEN BEGIN
         prev := f;
         IF f = S.last THEN f := NIL
                       ELSE f := f^.next;
      END
   UNTIL stop OR (f=NIL);
   IF stop THEN BEGIN
      IF prev = NIL THEN BEGIN
         S.first := p;
         p^.next := f
         END
      ELSE BEGIN
         p^.next := f;
         prev^.next := p
      END
      END
   ELSE BEGIN
      S.last^.next := p;
      s.last := p
   END;
END
END {LISTREE_AppendSortStree};


PROCEDURE LISTREE_TakeStree(VAR stree:LISTREE_pStree;
                                     VAR S:LISTREE_SetOfStrees);
BEGIN {LISTREE_TakeStree}
if S.first=nil then stree:=nil
else
   begin
   stree:=S.first^.arg;
   if S.first=S.last then
   	begin
   	S.first:=nil;S.last:=nil;S.cur:=nil
   	end
   ELSE BEGIN
      S.first := S.first^.next;
      S.cur:=S.first
   END
   end
END {LISTREE_TakeStree};


PROCEDURE LISTREE_TakeStreeBonus(VAR stree:LISTREE_pStree;
                                          VAR S:LISTREE_SetOfStrees;
                                          VAR bonus: INTEGER);
BEGIN {LISTREE_TakeStree}
bonus := 0;
if S.first=nil then stree:=nil
else
   begin
   bonus := s.first^.bonus;
   stree:=S.first^.arg;
   if S.first=S.last then
   	begin
   	S.first:=nil;S.last:=nil;S.cur:=nil
   	end
   ELSE BEGIN
      S.first := S.first^.next;
      S.cur:=S.first
   END
   end
END {LISTREE_TakeStreeBonus};


FUNCTION LISTREE_StillStrees(S:LISTREE_SetOfStrees)
                  :BOOLEAN ;
BEGIN {LISTREE_StillStrees}
if S.first<>nil then LISTREE_StillStrees:=TRUE
else LISTREE_StillStrees:=false
END {LISTREE_StillStrees};


PROCEDURE LISTREE_EmptyTuple(VAR T:LISTREE_TupleOfStrees);
BEGIN {LISTREE_EmptyTuple}
T.first:=nil;T.last:=nil
END {LISTREE_EmptyTuple};


PROCEDURE LISTREE_AddToTuple(stree:LISTREE_pstree;
                                      VAR T:LISTREE_TupleOfStrees);
VAR p:LISTREE_pLoStree;
BEGIN {LISTREE_AddToTuple}
Mem_NewDefault(Loopholes.SizeOf(LISTREE_LoStree), Loopholes.Retype(p,Mem_Ptr));
p^.arg:=stree;
p^.next:=nil;
p^.bonus := 0;
if T.first=nil then
   begin
   T.first:=p;
   T.last:=p
   end
else
   begin
   T.last^.next:=p;
   T.last:=p
   end
END {LISTREE_AddToTuple};


PROCEDURE LISTREE_ExtractFromTuple(VAR stree:LISTREE_pstree;
                                            VAR T:LISTREE_TupleOfStrees);
BEGIN {LISTREE_ExtractFromTuple}
if T.first=nil then stree:=nil
else
   begin
   stree:=T.first^.arg;
   if T.first=T.last then
   	begin
   	T.first:=nil;T.last:=nil
   	end
   ELSE BEGIN
      T.first := T.first^.next
   END
   end
END {LISTREE_ExtractFromTuple};


FUNCTION LISTREE_StillElements(T:LISTREE_TupleOfStrees)
                  :BOOLEAN ;
BEGIN {LISTREE_StillElements}
if T.first<>nil then LISTREE_StillElements:=TRUE
else LISTREE_StillElements:=false
END {LISTREE_StillElements};


PROCEDURE LISTREE_InitSetOfTupleOfStrees(
                            VAR S:LISTREE_SetOfTupleOfStrees);
BEGIN {LISTREE_InitSetOfTupleOfStrees}
S.first:=nil;S.last:=nil
END {LISTREE_InitSetOfTupleOfStrees};


PROCEDURE LISTREE_AppendTupleOfStrees(T:LISTREE_TupleOfStrees;
                           VAR S:LISTREE_SetOfTupleOfStrees);
VAR p:LISTREE_pLoTupleOfStrees;
BEGIN {LISTREE_AppendTupleOfStrees}
Mem_NewDefault(Loopholes.SizeOf(LISTREE_LoTupleOfStrees), Loopholes.Retype(p,Mem_Ptr));
p^.arg:=T;
p^.next:=nil;
p^.bonus := 0;
if S.first=nil then
   begin
   S.first:=p;
   S.last:=p
   end
else
   begin
   S.last^.next:=p;
   S.last:=p
   end
END {LISTREE_AppendTupleOfStrees};

PROCEDURE LISTREE_AppendTupleOfStreesbon(T:LISTREE_TupleOfStrees;
                           VAR S:LISTREE_SetOfTupleOfStrees;bonus:INTEGER);
VAR p:LISTREE_pLoTupleOfStrees;
BEGIN {LISTREE_AppendTupleOfStreesbon}
Mem_NewDefault(Loopholes.SizeOf(LISTREE_LoTupleOfStrees), Loopholes.Retype(p,Mem_Ptr));
p^.arg:=T;
p^.next:=nil;
p^.bonus := bonus;
if S.first=nil then
   begin
   S.first:=p;
   S.last:=p
   end
else
   begin
   S.last^.next:=p;
   S.last:=p
   end
END {LISTREE_AppendTupleOfStreesbon};

PROCEDURE LISTREE_TakeTupleOfStrees(VAR T:LISTREE_TupleOfStrees;
                                       VAR S:LISTREE_SetOfTupleOfStrees);
BEGIN {LISTREE_TakeTupleOfStrees}
if S.first=nil then LISTREE_EmptyTuple(T)
else
   begin
   T:=S.first^.arg;
   if S.first=S.last then
   	begin
   	S.first:=nil;S.last:=nil
   	end
   ELSE BEGIN
      S.first := S.first^.next
   END
   end
END {LISTREE_TakeTupleOfStrees};


PROCEDURE LISTREE_TakeTupleOfStreesBonus(VAR T:LISTREE_TupleOfStrees;
                                       VAR S:LISTREE_SetOfTupleOfStrees;
                                       VAR bonus: INTEGER);
BEGIN {LISTREE_TakeTupleOfStrees}
bonus := 0;
if S.first=nil then LISTREE_EmptyTuple(T)
else
   begin
   bonus := S.first^.bonus;
   T:=S.first^.arg;
   if S.first=S.last then
   	begin
   	S.first:=nil;S.last:=nil
   	end
   ELSE BEGIN
      S.first := S.first^.next
   END
   end
END {LISTREE_TakeTupleOfStreesBonus};


FUNCTION LISTREE_StillTupleOfStrees(S:LISTREE_SetOfTupleOfStrees)
                  :BOOLEAN ;
BEGIN {LISTREE_StillTupleOfStrees}
if S.first<>nil then LISTREE_StillTupleOfStrees:=TRUE
else LISTREE_StillTupleOfStrees:=false
END {LISTREE_StillTupleOfStrees};




PROCEDURE LIStree_SaveParseResult (ds : LIStree_pSetOfSuperDtree;
                                            VAR t : LIStree_pStree);
BEGIN {LIStree_SaveParseResult}
   t^.LI^.Dtrees:= ds;
   t^.LI^.Done:= TRUE
END {LIStree_SaveParseResult};


FUNCTION LIStree_IsParseResultSaved (t : LIStree_pStree)
                  : BOOLEAN;
BEGIN {LIStree_ParseResultSaved}
   LIStree_IsParseResultSaved:= t^.LI^.Done
END {LIStree_IsParseResultSaved};


FUNCTION LIStree_ReturnParseResult (t : LIStree_pStree)
                  : LIStree_pSetOfSuperDtree;

BEGIN {LIStree_ReturnParseResult}
   LIStree_ReturnParseResult:= t^.LI^.Dtrees
END {LIStree_ReturnParseResult};


PROCEDURE LISTREE_MergeSetsOfStrees(S1:LISTREE_SetOfStrees;
                                               VAR S2:LISTREE_SetOfStrees);
BEGIN
IF (S2.first=NIL) AND (S2.last=NIL) THEN
	BEGIN
	S2.first:=S1.first;S2.last:=S1.last
	END
ELSE
	BEGIN
	IF (S1.first<>NIL) OR (S1.last<>NIL) THEN
		BEGIN
		S2.last^.next:=S1.first;
		S2.last:=S1.last
		END
	END
END;

PROCEDURE LISTREE_MergeSetsOfTupleStrees(S1:LISTREE_SetOfTupleOfStrees;
                                               VAR S2:LISTREE_SetOfTupleOfStrees);
BEGIN
IF (S2.first=NIL) AND (S2.last=NIL) THEN
	BEGIN
	S2.first:=S1.first;S2.last:=S1.last
	END
ELSE
	BEGIN
	IF (S1.first<>NIL) OR (S1.last<>NIL) THEN
		BEGIN
		S2.last^.next:=S1.first;
		S2.last:=S1.last
		END
	END
END;


PROCEDURE LISTREE_EmptyTofSofStrees(VAR T:LISTREE_TupleOfSetOfStrees);
BEGIN
   T.first := NIL; T.last := NIL;
END;

PROCEDURE LISTREE_AddToTofSofStrees(strees:LISTREE_SetOfStrees;
                                          VAR T:LISTREE_TupleOfSetOfStrees);
VAR p:LISTREE_plossetofstrees;
BEGIN {LISTREE_AddToTofSofStrees}
Mem_NewDefault(Loopholes.SizeOf(LISTREE_LoSSetOfStrees), Loopholes.Retype(p,Mem_Ptr));
p^.arg:=strees;
p^.next:=nil;
if T.first=nil then
   begin
   T.first:=p;
   T.last:=p
   end
else
   begin
   T.last^.next:=p;
   T.last:=p
   end
END {LISTREE_AddToTofSofStrees};

PROCEDURE LISTREE_AddBackToTofSofStrees(strees:LISTREE_SetOfStrees;
                                          VAR T:LISTREE_TupleOfSetOfStrees);
VAR p:LISTREE_plossetofstrees;
BEGIN {LISTREE_AddBackToTofSofStrees}
Mem_NewDefault(Loopholes.SizeOf(LISTREE_LoSSetOfStrees), Loopholes.Retype(p,Mem_Ptr));
p^.arg:=strees;
p^.next:=nil;
if T.first=nil then
   begin
   T.first:=p;
   T.last:=p
   end
else
   begin
   p^.next := T.first;
   T.first := p
   end
END {LISTREE_AddBackToTofSofStrees};

PROCEDURE LISTREE_TakeFromTofSofStrees(VAR strees:LISTREE_SetOfStrees;
                                              VAR T:LISTREE_TupleOfSetOfStrees);
BEGIN {LISTREE_TakeFromTofSoStrees}
if T.first=nil then begin
   strees.first:=nil; strees.last:=nil; strees.cur:=nil
   end
else
   begin
   strees:=T.first^.arg;
   if T.first=T.last then
   	begin
   	T.first:=nil;T.last:=nil
   	end
   ELSE BEGIN
      T.first := T.first^.next
   END
   end
END {LISTREE_TakeFromTofSofStrees};


PROCEDURE LISTREE_TakeTupleFromCartProd(VAR tupl:LISTREE_TupleOfStrees;
                                              VAR T:LISTREE_TupleOfSetOfStrees);
VAR
   w            : LISTREE_pLosSetOfStrees;
   CurShifted   : BOOLEAN;
BEGIN {LISTREE_TakeTupleFromCartProd}
   w := T.first; LISTREE_EmptyTuple(tupl);
   WHILE (w <> NIL) DO BEGIN
      LISTREE_AddToTuple(w^.arg.cur^.arg, tupl);      
      w := w^.next
   END;
   CurShifted := FALSE;
   w := T.first;
   WHILE (w<>NIL) AND (NOT CurShifted) DO BEGIN
      IF ( w^.arg.cur <> w^.arg.last ) THEN BEGIN
         w^.arg.cur := w^.arg.cur^.next; CurShifted := TRUE
         END
      ELSE BEGIN
         w^.arg.cur := w^.arg.first
      END;
      w := w^.next
   END;
   T.StillCartProdElts := CurShifted;
END {LISTREE_TakeTupleFromCartProd};


FUNCTION LISTREE_StillCartProdElts(T:LISTREE_TupleOfSetOfStrees)
                    :BOOLEAN;
BEGIN {LISTREE_StillCartProdElts}
   LISTREE_StillCartProdElts := T.StillCartProdElts
END {LISTREE_StillCartProdElts};


PROCEDURE LISTREE_InitCartProdElts(VAR T:LISTREE_TupleOfSetOfStrees);
VAR
   w            : LISTREE_pLosSetOfStrees;
BEGIN {LISTREE_StillInitProdElts}
   w := T.first; T.StillCartProdElts := TRUE;
   WHILE (w<>NIL) DO BEGIN
      w^.arg.cur := w^.arg.first;
      w := w^.next
   END;
END {LISTREE_InitCartProdElts};

