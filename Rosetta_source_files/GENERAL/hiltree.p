(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : HILtree
 *  Creation date   : 20 JAN 1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(HILTREE);
pragma C_Include('liilrules.pf');
pragma C_Include('globbuf.pf');
pragma C_Include('mem.pf');
pragma C_Include('log.pf');
pragma C_Include('debug.pf');
pragma C_Include('hiltree.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM HILtree;
WITH LOOPHOLES:[POINTER_ARITHMETIC], LIILRULES, GLOBBUF, MEM, LOG, DEBUG;

CONST
   MaxHyperILtree   = 5000;
   MaxLoHyperILtree = 5000;
   MaxHyperNodeElt  = 5000;
   MaxLoHyperNodeElt= 5000;
   HILStackPtr      = 1;
   LHILStackPtr     = 2;
   HNEStackPtr      = 3;
   LHNEStackPtr     = 4;

TYPE 
   HyperILtreeBuffer  =  ARRAY[1..MaxHyperILtree] OF HILtree_HyperILtree;
   pHyperILtreeBuffer =  Loopholes.Address(HyperILtreeBuffer);

   LoHyperILtreeBuffer  =  ARRAY[1..MaxLoHyperILtree] OF HILtree_LoHyperILtree;
   pLoHyperILtreeBuffer =  Loopholes.Address(LoHyperILtreeBuffer);
   
   HyperNodeEltBuffer  =  ARRAY[1..MaxHyperNodeElt] OF HILtree_HyperNodeElt;
   pHyperNodeEltBuffer =  Loopholes.Address(HyperNodeEltBuffer);

   LoHyperNodeEltBuffer  =  ARRAY[1..MaxLoHyperNodeElt] OF HILtree_LoHyperNodeElt;
   pLoHyperNodeEltBuffer =  Loopholes.Address(LoHyperNodeEltBuffer);

   StackPtrBuffer        =  ARRAY[1..4] OF INTEGER;   
   pStackPtrBuffer       =  Loopholes.Address(StackPtrBuffer);
VAR
   HILBufAddr     : pHyperILtreeBuffer;
   LHILBufAddr    : pLoHyperILtreeBuffer;
   HNEBufAddr     : pHyperNodeEltBuffer;
   LHNEBufAddr    : pLoHyperNodeEltBuffer;
   StackPtrBufAddr: pStackPtrBuffer;

PROCEDURE HILtree_AnInit;
VAR
   DumAddr : Loopholes.Address;
   status  : INTEGER;
BEGIN

   GlobBuf_CreateBuffer('HyperILTree', LoopHoles.SizeOf(HyperILtreeBuffer), DumAddr);
   status := GLOBBUF_GetIntegerStatus;
   LOG_write('Buffer HyperILTree ', 19, status); 
   HILBufAddr := Loopholes.Retype(DumAddr,pHyperILtreeBuffer);
   GlobBuf_CreateBuffer('LoHyperILTree', LoopHoles.SizeOf(LoHyperILtreeBuffer), DumAddr);
   status := GLOBBUF_GetIntegerStatus;
   LOG_write('Buffer LoHyperILTree ', 21, status); 
   LHILBufAddr := Loopholes.Retype(DumAddr,pLoHyperILtreeBuffer);
   GlobBuf_CreateBuffer('HyperNodeElt', LoopHoles.SizeOf(HyperNodeEltBuffer), DumAddr);
   status := GLOBBUF_GetIntegerStatus;
   LOG_write('Buffer HyperNodeElt ', 20, status); 
   HNEBufAddr := Loopholes.Retype(DumAddr,pHyperNodeEltBuffer);
   GlobBuf_CreateBuffer('LoHyperNodeElt', LoopHoles.SizeOf(LoHyperNodeEltBuffer), DumAddr);
   status := GLOBBUF_GetIntegerStatus;
   LOG_write('Buffer LoHyperNodeElt ', 22, status); 
   LHNEBufAddr := Loopholes.Retype(DumAddr,pLoHyperNodeEltBuffer);

   GlobBuf_CreateBuffer('StackPtr', LoopHoles.SizeOf(StackPtrBuffer), DumAddr);
   status := GLOBBUF_GetIntegerStatus;
   LOG_write('StackPtrBuffer', 22, status); 
   StackPtrBufAddr := Loopholes.Retype(DumAddr,pStackPtrBuffer);

   StackPtrBufAddr^[HILStackPtr]  := 0;
   StackPtrBufAddr^[LHILStackPtr] := 0;
   StackPtrBufAddr^[HNEStackPtr]  := 0;
   StackPtrBufAddr^[LHNEStackPtr] := 0;

END {HILtree_AnInit};

PROCEDURE HILtree_GenInit;
VAR
   DumAddr : Loopholes.Address;
   status  : INTEGER;
BEGIN

   GlobBuf_CreateBuffer('HyperILTree', LoopHoles.SizeOf(HyperILtreeBuffer), DumAddr);
   status := GLOBBUF_GetIntegerStatus;
   LOG_write('Buffer HyperILTree ', 19, status);
   HILBufAddr := Loopholes.Retype(DumAddr,pHyperILtreeBuffer);
   GlobBuf_CreateBuffer('LoHyperILTree', LoopHoles.SizeOf(LoHyperILtreeBuffer), DumAddr);
   status := GLOBBUF_GetIntegerStatus;
   LOG_write('Buffer LoHyperILTree ', 21, status);
   LHILBufAddr := Loopholes.Retype(DumAddr,pLoHyperILtreeBuffer);
   GlobBuf_CreateBuffer('HyperNodeElt', LoopHoles.SizeOf(HyperNodeEltBuffer), DumAddr);
   status := GLOBBUF_GetIntegerStatus;
   LOG_write('Buffer HyperNodeElt ', 20, status);
   HNEBufAddr := Loopholes.Retype(DumAddr,pHyperNodeEltBuffer);
   GlobBuf_CreateBuffer('LoHyperNodeElt', LoopHoles.SizeOf(LoHyperNodeEltBuffer), DumAddr);
   status := GLOBBUF_GetIntegerStatus;
   LOG_write('Buffer LoHyperNodeElt ', 22, status);
   LHNEBufAddr := Loopholes.Retype(DumAddr,pLoHyperNodeEltBuffer);

   GlobBuf_CreateBuffer('StackPtr', LoopHoles.SizeOf(StackPtrBuffer), DumAddr);
   status := GLOBBUF_GetIntegerStatus;
   LOG_write('StackPtrBuffer', 22, status);
   StackPtrBufAddr := Loopholes.Retype(DumAddr,pStackPtrBuffer);

END {HILtree_GenInit};




PROCEDURE HILTREE_Reset;
BEGIN
   StackPtrBufAddr^[HILStackPtr]  := 0;
   StackPtrBufAddr^[LHILStackPtr] := 0;
   StackPtrBufAddr^[HNEStackPtr]  := 0;
   StackPtrBufAddr^[LHNEStackPtr] := 0;

END {HILTREE_Reset};


PROCEDURE HILTREE_AnDump;
TYPE
    memory = Loopholes.Address(CHAR);
VAR a, 
    endbuf  : memory;
    f1 : text;
    i  : INTEGER;
BEGIN
   rewrite(f1,'general/target/hilbuf.a');
   a := Loopholes.Retype(StackPtrBufAddr,memory);
   endbuf := a + Loopholes.SizeOf(StackPtrBuffer);
   i := 0;
   WHILE a <> endbuf DO BEGIN
      i := i+1;
      IF ( i mod 79) = 0 THEN writeln(f1);
      write(f1, a^);
      a := a+1;
   END;
   close(f1);
END {HILTREE_AnDump};


PROCEDURE HILTREE_AnBuf(CONST str: STRING);
VAR
   j : INTEGER;
   f1 : Text;
BEGIN
   rewrite(f1,'general/target/hilbuftxt.a'||str);

   writeln(f1,'stackptrbuffer');
   FOR j:= 1 TO 4 DO writeln(f1,StackPtrBufAddr^[j]);
   writeln(f1);
   writeln(f1,'hyperiltreebuffer');
   FOR j := 1 TO StackPtrBufAddr^[1] DO BEGIN
      WITH HILBufAddr^[j] DO BEGIN
         writeln(f1,'***',j:4,'***');
         writeln(f1,'f', Elts.first:5,' l', Elts.last:5,' c',Elts.cur:5);
      END
   END;
   writeln(f1);
   writeln(f1,'lohyperiltreebuffer');
   FOR j := 1 TO StackPtrBufAddr^[2] DO BEGIN
      WITH LHILBufAddr^[j] DO BEGIN
         writeln(f1,'***',j:4,'***');
         writeln(f1,'a', arg:5,' n', next:5);
      END
   END;
   writeln(f1);
   writeln(f1,'hypernodeeltbuffer');
   FOR j := 1 TO StackPtrBufAddr^[3] DO BEGIN
      WITH HNEBufAddr^[j] DO BEGIN
         writeln(f1,'***',j:4,'***');
         CASE nodekind of 
         HILtree_VarNode : writeln(f1,'var');
         HILtree_BasicNode : writeln(f1,'basic');
         HILtree_RuleNode : writeln(f1,'rule');
         END
      END
   END;
   writeln(f1);
   writeln(f1,'hypernodeeltbuffer');
   FOR j := 1 TO StackPtrBufAddr^[4] DO BEGIN
      WITH LHNEBufAddr^[j] DO BEGIN
         writeln(f1,'***',j:4,'***');
         writeln(f1,'a', arg:5,' n', next:5);
      END
   END;
   close(f1);
END {HILTREE_AnBuf};

PROCEDURE HILTREE_GenBuf(CONST str: STRING);
VAR
   j : INTEGER;
   f1 : Text;
   zero: BOOLEAN;
BEGIN
{
   zero := TRUE; j := 0;
writeln('waiting for stackbuffer to become non-zero');
   WHILE zero DO BEGIN
      zero := (StackPtrBufAddr^[4] = 0);
      j := j+1;
   END;
writeln('continued...',j);
}
   rewrite(f1,'general/target/hilbuftxt.g'||str);

   writeln(f1,'stackptrbuffer');
   FOR j:= 1 TO 4 DO writeln(f1,StackPtrBufAddr^[j]);
   writeln(f1);
   writeln(f1,'hyperiltreebuffer');
   FOR j := 1 TO 5{StackPtrBufAddr^[1]} DO BEGIN
      WITH HILBufAddr^[j] DO BEGIN
         writeln(f1,'***',j:4,'***');
         writeln(f1,'f', Elts.first:5,' l', Elts.last:5,' c',Elts.cur:5);
      END
   END;
   writeln(f1);
   writeln(f1,'lohyperiltreebuffer');
   FOR j := 1 TO 5{StackPtrBufAddr^[2]} DO BEGIN
      WITH LHILBufAddr^[j] DO BEGIN
         writeln(f1,'***',j:4,'***');
         writeln(f1,'a', arg:5,' n', next:5);
      END
   END;
   writeln(f1);
   writeln(f1,'hypernodeeltbuffer');
   FOR j := 1 TO 5{StackPtrBufAddr^[3]} DO BEGIN
      WITH HNEBufAddr^[j] DO BEGIN
         writeln(f1,'***',j:4,'***');
         CASE nodekind of 
         HILtree_VarNode : writeln(f1,'var');
         HILtree_BasicNode : writeln(f1,'basic');
         HILtree_RuleNode : writeln(f1,'rule');
         END
      END
   END;
   writeln(f1);
   writeln(f1,'hypernodeeltbuffer');
   FOR j := 1 TO 5{StackPtrBufAddr^[4]} DO BEGIN
      WITH LHNEBufAddr^[j] DO BEGIN
         writeln(f1,'***',j:4,'***');
         writeln(f1,'a', arg:5,' n', next:5);
      END
   END;
   close(f1);
END {HILTREE_GenBuf};

PROCEDURE HILTREE_GenDump;
TYPE
    memory = Loopholes.Address(CHAR);
VAR a, 
    endbuf  : memory;
    f1 : text;
    i  : INTEGER;
BEGIN

   rewrite(f1,'general/target/hilbuf.g');

   a := Loopholes.Retype(StackPtrBufAddr,memory);
   endbuf := a + Loopholes.SizeOf(StackPtrBuffer);
   i := 0;
   WHILE a <> endbuf DO BEGIN
      i := i+1;
      IF ( i mod 79) = 0 THEN writeln(f1);

      write(f1, a^);

      a := a+1;
   END;

   close(f1);

END {HILTREE_GenDump};



PROCEDURE NewHyperILtree(VAR d : HILtree_pHyperILtree);
BEGIN
   IF StackPtrBufAddr^[HILStackPtr] < MaxHyperILtree THEN BEGIN
      StackPtrBufAddr^[HILStackPtr] := StackPtrBufAddr^[HILStackPtr]+1;
      d := StackPtrBufAddr^[HILStackPtr]
      END
   ELSE BEGIN
      d := -1;
      LOG_Write('Overflow HyperILtreeStack', 24, 0);
      DEBUG_WriteStr('Overflow HyperILtreeStack', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE)
   END;
END {NewHyperILtree};


PROCEDURE HILtree_LoadHyperILtree(p: HILtree_pHyperILtree;
                                                VAR d : HILtree_HyperILtree);
BEGIN
   d := HILBufAddr^[p];
END {HILtree_LoadHyperILtree};


PROCEDURE HILtree_StoreHyperILtree(p: HILtree_pHyperILtree;
                                            d : HILtree_HyperILtree);
BEGIN
   HILBufAddr^[p] := d;
END {HILtree_StoreHyperILtree};


PROCEDURE NewLoHyperILtree(VAR d : HILtree_pLoHyperILTree);
BEGIN
   IF StackPtrBufAddr^[LHILStackPtr] < MaxLoHyperILtree THEN BEGIN
      StackPtrBufAddr^[LHILStackPtr] := StackPtrBufAddr^[LHILStackPtr]+1;
      d := StackPtrBufAddr^[LHILStackPtr]
      END
   ELSE BEGIN
      d := -1;
      LOG_Write('Overflow LoHyperILtreeStack', 26, 0);
      DEBUG_WriteStr('Overflow LoHyperILtreeStack', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE)
   END;
END {NewLoHyperILtree};


PROCEDURE HILtree_LoadLoHyperILtree(p: HILtree_pLoHyperILTree;
                                                VAR d : HILtree_LoHyperILtree);
BEGIN
   d := LHILBufAddr^[p];
END {HILtree_LoDerefHyperILtree};


PROCEDURE HILtree_StoreLoHyperILtree(p: HILtree_pLoHyperILTree;
                                             d : HILtree_LoHyperILtree);
BEGIN
   LHILBufAddr^[p] := d;
END {HILtree_StoreHyperILtree};


PROCEDURE NewHyperNodeElt(VAR d : HILtree_pHyperNodeElt);
BEGIN
   IF StackPtrBufAddr^[HNEStackPtr] < MaxHyperNodeElt THEN BEGIN
      StackPtrBufAddr^[HNEStackPtr] := StackPtrBufAddr^[HNEStackPtr]+1;
      d := StackPtrBufAddr^[HNEStackPtr]
      END
   ELSE BEGIN
      d := -1;
      LOG_Write('Overflow HyperNodeEltStack', 24, 0);
      DEBUG_WriteStr('Overflow HyperNodeEltStack', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE)
   END;
END {NewHyperNodeElt};


PROCEDURE HILtree_LoadHyperNodeElt(p: HILtree_pHyperNodeElt;
                                                VAR d : HILtree_HyperNodeElt);
BEGIN
   d := HNEBufAddr^[p]
END {HILtree_LoadHyperNodeElt};


PROCEDURE HILtree_StoreHyperNodeElt(p: HILtree_pHyperNodeElt;
                                             d : HILtree_HyperNodeElt);
BEGIN
   HNEBufAddr^[p] := d;
END {HILtree_StoreHyperNodeElt};


PROCEDURE NewLoHyperNodeElt(VAR d : HILtree_pLoHyperNodeElt);
BEGIN
   IF StackPtrBufAddr^[LHNEStackPtr] < MaxLoHyperNodeElt THEN BEGIN
      StackPtrBufAddr^[LHNEStackPtr] := StackPtrBufAddr^[LHNEStackPtr]+1;
      d := StackPtrBufAddr^[LHNEStackPtr]
      END
   ELSE BEGIN
      d := -1;
      LOG_Write('Overflow LoHyperNodeEltStack', 24, 0);
      DEBUG_WriteStr('Overflow LoHyperNodeEltStack', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE)
   END;
END {NewLoHyperNodeElt};


PROCEDURE HILtree_LoadLoHyperNodeElt(p: HILtree_pLoHyperNodeElt;
                                                VAR d : HILtree_LoHyperNodeElt);
BEGIN
   d := LHNEBufAddr^[p];
END {HILtree_LoadLoHyperNodeElt};


PROCEDURE HILtree_StoreLoHyperNodeElt(p: HILtree_pLoHyperNodeElt;
                                               d : HILtree_LoHyperNodeElt);
BEGIN
   LHNEBufAddr^[p] := d;
END {HILtree_StoreLoHyperNodeElt};


PROCEDURE HILtree_NewHyperILtreeLeave (VAR d : HILtree_pHyperILtree);
VAR
   dr : HILtree_HyperILtree;
BEGIN
   NewHyperILtree(d);
   HILtree_LoadHyperILtree(d, dr);
   Mem_NewDefault(LoopHoles.SizeOf(HILTREE_LIRecord), Loopholes.Retype(dr.LI,Mem_Ptr));
   dr.LI^.dtree := NIL;
   dr.LI^.done  := FALSE;
   dr.synbonus := 0;
   dr.IsRuleNode := FALSE;
   dr.Elts.first := HNIL;
   dr.Elts.last  := HNIL;
   dr.Elts.cur   := HNIL;
   dr.Elts.NrOfElts := 0;
   HILtree_StoreHyperILtree(d, dr);
END {HILtree_NewHyperILtreeLeave};



PROCEDURE HILtree_NewHyperILtree (VAR d : HILtree_pHyperILtree);
VAR
   dr : HILtree_HyperILtree;
BEGIN
   NewHyperILtree(d);
   HILtree_LoadHyperILtree(d, dr);
   Mem_NewDefault(LoopHoles.SizeOf(HILTREE_LIRecord), Loopholes.Retype(dr.LI,Mem_Ptr));
   dr.LI^.dtree := NIL;
   dr.LI^.done  := FALSE;
   dr.synbonus := 0;
   dr.IsRuleNode := TRUE;
   dr.EndOfSg    := FALSE;
   dr.nrOfArgs   := 0;
   dr.args.first := HNIL; 
   dr.args.last  := HNIL; 
   dr.Elts.first := HNIL;
   dr.Elts.last  := HNIL;
   dr.Elts.cur   := HNIL;
   dr.Elts.NrOfElts   := 0;
   HILtree_StoreHyperILtree(d, dr);
END {HILtree_NewHyperILtree};


PROCEDURE HILtree_NewHyperILtreeBxpr (VAR d : HILtree_pHyperNodeElt;
                                                  key : INTEGER);
VAR
   dr : HILtree_HyperNodeElt;
BEGIN
   NewHyperNodeElt(d);
   HILtree_LoadHyperNodeElt(d, dr);
   dr.nodekind := HILtree_BasicNode;
   dr.key:= key;
   dr.sembonus := 0;
   HILtree_StoreHyperNodeElt(d, dr);
END {HILtree_NewHyperILtreeBxpr};



PROCEDURE HILtree_NewHyperILtreeVar (VAR d : HILtree_pHyperNodeElt;
                                              index : INTEGER);
VAR
   dr : HILtree_HyperNodeElt;
BEGIN
   NewHyperNodeElt(d);
   HILtree_LoadHyperNodeElt(d, dr);
   dr.nodekind := HILtree_VarNode;
   dr.index  := index;
   dr.sembonus := 0;
   HILtree_StoreHyperNodeElt(d, dr);
END {HILtree_NewHyperILtreeVar};



PROCEDURE HILtree_NewHyperILtreeRule (VAR d : HILtree_pHyperNodeElt;
                                             R  : LIILrules_RuleIndex;
                                             params : LIILRules_LIParameters);
VAR
   dr : HILtree_HyperNodeElt;
BEGIN
   NewHyperNodeElt(d);
   HILtree_LoadHyperNodeElt(d, dr);
   dr.nodekind := HILtree_RuleNode;
   dr.R:= R;
   dr.parameters:= params;
   dr.sembonus := 0;
   HILtree_StoreHyperNodeElt(d, dr);
END {HILtree_NewHyperILtreeRule};



PROCEDURE HILtree_MarkFirstDtree (VAR d : HILtree_pHyperILtree);
   VAR son : HILtree_pLoHyperILtree;
       sonr: HILtree_LoHyperILtree;
       dr  : HILtree_HyperILtree;
BEGIN
   IF d<>HNIL THEN BEGIN
      HILtree_LoadHyperILtree(d, dr);
      dr.Elts.cur := dr.Elts.first;
      IF dr.IsRuleNode THEN BEGIN
         son := dr.args.first;
         WHILE son <> HNIL DO BEGIN
            HILtree_LoadLoHyperILtree(son, sonr);
            HILtree_MarkFirstDtree(sonr.arg);
            HILtree_StoreLoHyperILtree(son, sonr);
            son := sonr.next
         END
      END;
      HILtree_StoreHyperILtree(d, dr);
   END;
END {HILtree_MarkFirstDtree};



FUNCTION HILtree_MarkNextDtree (VAR d : HILtree_pHyperILtree)
                    : BOOLEAN;
VAR 
   son  : HILtree_pLoHyperILtree;
   sonr: HILtree_LoHyperILtree;
   dr  : HILtree_HyperILtree;
   curr: HILtree_LoHyperNodeElt;
   done : BOOLEAN;
BEGIN
   done := FALSE;
   IF d<>HNIL THEN BEGIN
      HILtree_LoadHyperILtree(d, dr);
      IF dr.IsRuleNode THEN BEGIN
         son := dr.args.first;
         WHILE (son <> HNIL) AND NOT done DO BEGIN
            HILtree_LoadLoHyperILtree(son, sonr);
            IF HILtree_MarkNextDtree(sonr.arg) THEN BEGIN
               done := TRUE
               END
            ELSE BEGIN
               son := sonr.next
            END {IF};
         END {WHILE};
         IF NOT done THEN BEGIN
            IF dr.Elts.cur <> dr.Elts.last THEN BEGIN
               HILtree_LoadLoHyperNodeElt(dr.Elts.cur, curr);
               dr.Elts.cur := curr.next;
               done := TRUE
               END
            ELSE BEGIN
               dr.Elts.cur := dr.Elts.first
            END {IF}
         END {IF}
         END 
      ELSE BEGIN
	 IF dr.Elts.cur <> dr.Elts.last THEN BEGIN
	    HILtree_LoadLoHyperNodeElt(dr.Elts.cur, curr);
	    dr.Elts.cur := curr.next;
	    done := TRUE
	    END
	 ELSE BEGIN
	    dr.Elts.cur := dr.Elts.first
	 END {IF}
      END {IF};
      HILtree_StoreHyperILtree(d, dr);
   END {IF};
   HILtree_MarkNextDtree:= done
END {HILtree_MarkNextDtree};



FUNCTION HILtree_ExistsNextDtree (VAR d : HILtree_pHyperILtree)
                    : BOOLEAN;
VAR 
   son  : HILtree_pLoHyperILtree;
   sonr: HILtree_LoHyperILtree;
   dr  : HILtree_HyperILtree;
   done : BOOLEAN;
BEGIN
   done := FALSE;
   IF d<>HNIL THEN BEGIN
      HILtree_LoadHyperILtree(d, dr);
      IF dr.IsRuleNode THEN BEGIN
         son := dr.args.first;
         WHILE (son <> HNIL) AND NOT done DO BEGIN
            HILtree_LoadLoHyperILtree(son, sonr);
            IF HILtree_ExistsNextDtree(sonr.arg) THEN BEGIN
               done := TRUE
               END
            ELSE BEGIN
               son := sonr.next
            END {IF};
         END {WHILE};
         IF NOT done THEN BEGIN
            IF dr.Elts.cur <> dr.Elts.last THEN BEGIN
               done := TRUE
               END
            ELSE BEGIN
            END {IF}
         END {IF}
         END 
      ELSE BEGIN
	 IF dr.Elts.cur <> dr.Elts.last THEN BEGIN
	    done := TRUE
	    END
	 ELSE BEGIN
	 END {IF}
      END {IF};
   END {IF};
   HILtree_ExistsNextDtree:= done
END {HILtree_ExistsNextDtree};



PROCEDURE HILtree_EmptyNode(VAR ds:HILtree_SetOfHyperNodeElt);
BEGIN
   ds.first:= HNIL;
   ds.last := HNIL;
   ds.NrOfElts := 0;
   ds.cur  := HNIL;
END {HILtree_EmptyNode};


PROCEDURE HILtree_AddToNode(d:HILtree_pHyperNodeElt;
                                       VAR ds:HILtree_SetOfHyperNodeElt);
   VAR p  :HILtree_pLoHyperNodeElt;
       pr : HILtree_LoHyperNodeElt;
       lastr: HILtree_LoHyperNodeElt;
BEGIN
   IF d=HNIL THEN BEGIN
      (*should not occur*)
      END {THEN}
   ELSE BEGIN
      NewLoHyperNodeElt(p);
      HILtree_LoadLoHyperNodeElt(p, pr);
      pr.arg:=d;
      pr.next:=HNIL;
      IF ds.first=HNIL THEN BEGIN
	 ds.first:=p;
	 ds.last :=p;
         ds.cur  :=p;
	 END
      ELSE BEGIN
         HILtree_LoadLoHyperNodeElt(ds.last, lastr);
	 lastr.next:=p;
         HILtree_StoreLoHyperNodeElt(ds.last, lastr);
	 ds.last:=p
      END {IF};
      ds.NrOfElts := ds.NrOfElts+1;
      HILtree_StoreLoHyperNodeElt(p, pr);
   END {IF}
END {HILtree_AddToNode};


PROCEDURE HILtree_TakeFromNode(VAR d:HILtree_pHyperNodeElt;
                                          VAR ds:HILtree_SetOfHyperNodeElt);
VAR
   firstr : HILtree_LoHyperNodeElt;
BEGIN
   IF ds.first=HNIL THEN BEGIN
      d:=HNIL
      END
   ELSE BEGIN
      HILtree_LoadLoHyperNodeElt(ds.first, firstr);
      d:=firstr.arg;
      IF ds.first=ds.last THEN BEGIN
     	 ds.first:= HNIL;
         ds.last := HNIL;
         ds.cur  := HNIL
         END
      ELSE BEGIN
         IF ds.cur = ds.first THEN ds.cur := firstr.next;
         ds.first := firstr.next
      END;
      ds.NrOfElts := ds.NrOfElts-1;
   END
END {HILtree_TakeFromNode};


FUNCTION HILtree_IsEmptyNode(ds:HILtree_SetOfHyperNodeElt)
                    :BOOLEAN;
BEGIN
   HILtree_IsEmptyNode:= ds.first=HNIL
END {HILtree_IsEmptyNode};


PROCEDURE HILtree_EmptyTuple(VAR dn:HILtree_TupleOfHyperILtree);
BEGIN
   dn.first:=HNIL;
   dn.last:=HNIL;
END {HILtree_EmptyTuple};


PROCEDURE HILtree_AddToTuple(d:HILtree_pHyperILtree;
                                         VAR dn:HILtree_TupleOfHyperILtree);
   VAR p:HILtree_pLoHyperILtree;
       pr,
       lastr : HILtree_LoHyperILtree;
BEGIN
   IF d=HNIL THEN BEGIN
      (*should not occur*)
      END {THEN}
   ELSE BEGIN
      NewLoHyperILtree(p);
      HILtree_LoadLoHyperILtree(p, pr);
      pr.arg:=d;
      pr.next:=HNIL;
      IF dn.first=HNIL THEN BEGIN
	 dn.first:=p;
	 dn.last:=p
	 END
      ELSE BEGIN
         HILtree_LoadLoHyperILtree( dn.last , lastr);
	 lastr.next:=p;
         HILtree_StoreLoHyperILtree( dn.last , lastr);
	 dn.last:=p
      END {IF};
      HILtree_StoreLoHyperILtree(p, pr);
   END {IF}
END {HILtree_AddToTuple};


PROCEDURE HILtree_TakeFromTuple(VAR d:HILtree_pHyperILtree;
                                            VAR dn:HILtree_TupleOfHyperILtree);
VAR
   firstr : HILtree_LoHyperILtree;
BEGIN
   IF dn.first=HNIL THEN BEGIN
      d:=HNIL
      END
   ELSE BEGIN
      HILtree_LoadLoHyperILtree(dn.first , firstr);
      d:=firstr.arg;
      IF dn.first=dn.last THEN BEGIN
     	 dn.first:=HNIL; dn.last:=HNIL
         END
      ELSE BEGIN
         dn.first := firstr.next
      END;
   END
END {HILtree_TakeFromTuple};


FUNCTION HILtree_IsEmptyTuple(dn:HILtree_TupleOfHyperILtree)
                    :BOOLEAN;
BEGIN
   HILtree_IsEmptyTuple:= dn.first=HNIL
END {HILtree_IsEmptyTuple};



PROCEDURE HILtree_EmptySet(VAR dn:HILtree_SetOfHyperILtree);
BEGIN
   dn.first:=HNIL;
   dn.last:=HNIL
END {HILtree_EmptySet};


PROCEDURE HILtree_AddToSet(d:HILtree_pHyperILtree;
                                         VAR dn:HILtree_SetOfHyperILtree);
   VAR p:HILtree_pLoHyperILtree;
       pr,
       lastr : HILtree_LoHyperILtree;
BEGIN
   IF d=HNIL THEN BEGIN
      (*should not occur*)
      END {THEN}
   ELSE BEGIN
      NewLoHyperILtree(p);
      HILtree_LoadLoHyperILtree(p, pr);
      pr.arg:=d;
      pr.next:=HNIL;
      IF dn.first=HNIL THEN BEGIN
	 dn.first:=p;
	 dn.last:=p
	 END
      ELSE BEGIN
         HILtree_LoadLoHyperILtree( dn.last , lastr);
	 lastr.next:=p;
         HILtree_StoreLoHyperILtree( dn.last , lastr);
	 dn.last:=p
      END {IF};
      HILtree_StoreLoHyperILtree(p, pr);
   END {IF}
END {HILtree_AddToSet};


PROCEDURE HILtree_AddToSynSortSet(d:HILtree_pHyperILtree;
                                         VAR dn:HILtree_SetOfHyperILtree);
   VAR p, prev, f:HILtree_pLoHyperILtree;
       pr, prevr, fr,
       lastr : HILtree_LoHyperILtree;
       dcur,
       dr    : HILtree_HyperILtree;
       stop  : BOOLEAN;
BEGIN
   IF d=HNIL THEN BEGIN
      (*should not occur*)
      END {THEN}
   ELSE BEGIN
      NewLoHyperILtree(p);
      HILtree_LoadLoHyperILtree(p, pr);
      HILtree_LoadHyperILtree(d, dr);
      pr.arg:=d;
      pr.next:=HNIL;
      IF dn.first=HNIL THEN BEGIN
	 dn.first:=p;
	 dn.last:=p
	 END
      ELSE BEGIN
         f := dn.first; prev := HNIL; stop := FALSE;
         REPEAT
            HILtree_LoadLoHyperILtree(f, fr);
            HILtree_LoadHyperILtree(fr.arg, dcur);
            IF dr.synbonus > dcur.synbonus THEN stop:=TRUE
            ELSE BEGIN
               prev := f;
               f := fr.next
            END
         UNTIL stop OR (f = HNIL);
         IF stop THEN BEGIN
            IF prev = HNIL THEN BEGIN
	       dn.first:= p;
               pr.next := f;
               END
            ELSE BEGIN
               HILtree_LoadLoHyperILtree(prev, prevr);
   	       prevr.next:=p;
               HILtree_StoreLoHyperILtree(prev, prevr);
               pr.next := f;
            END
            END
         ELSE BEGIN
            HILtree_LoadLoHyperILtree( dn.last , lastr);
	    lastr.next:=p;
            HILtree_StoreLoHyperILtree( dn.last , lastr);
	    dn.last:=p
         END;
      END {IF};
      HILtree_StoreLoHyperILtree(p, pr);
   END {IF}
END {HILtree_AddToSynSortSet};


PROCEDURE HILtree_TakeFromSet(VAR d:HILtree_pHyperILtree;
                                            VAR dn:HILtree_SetOfHyperILtree);
VAR
   firstr : HILtree_LoHyperILtree;
BEGIN
   IF dn.first=HNIL THEN BEGIN
      d:=HNIL
      END
   ELSE BEGIN
      HILtree_LoadLoHyperILtree(dn.first , firstr);
      d:=firstr.arg;
      IF dn.first=dn.last THEN BEGIN
     	 dn.first:=HNIL;dn.last:=HNIL
         END
      ELSE BEGIN
         dn.first := firstr.next
      END
   END
END {HILtree_TakeFromSet};


FUNCTION HILtree_IsEmptySet(dn:HILtree_SetOfHyperILtree)
                    :BOOLEAN;
BEGIN
   HILtree_IsEmptySet:= dn.first=HNIL
END {HILtree_IsEmptySet};



PROCEDURE HILtree_SaveOrigin (t : HILtree_pDnode;
                                               VAR d : HILtree_pHyperILtree);
VAR
   dr : HILtree_HyperILtree;
BEGIN
   HILtree_LoadHyperILtree( d, dr);
   dr.LI^.Dtree:= t;
   dr.LI^.Done:= TRUE;
   HILtree_StoreHyperILtree( d, dr);
END {HILtree_SaveOrigin};


FUNCTION HILtree_IsOriginSaved (d : HILtree_pHyperILtree)
                  : BOOLEAN;
BEGIN
   HILtree_IsOriginSaved:= FALSE
END {HILtree_IsOriginSaved};


FUNCTION HILtree_ReturnOrigin (d : HILtree_pHyperILtree)
                  : HILtree_pDnode;
VAR
   dr : HILtree_HyperILtree;
BEGIN
   HILtree_LoadHyperILtree( d, dr);
   HILtree_ReturnOrigin:= dr.LI^.Dtree;
   HILtree_StoreHyperILtree( d, dr);
END {HILtree_ReturnOrigin};



