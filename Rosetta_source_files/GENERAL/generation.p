(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GENERATION
 *  Creation date   : 22-01-88                                    
 *  Author          : J. Rous
 *                                                                  
 *  Copyright (c) 1988, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)
pragma C_include('globdef.pf');
pragma C_include('gwhere.pf');
pragma C_include('debug.pf');
pragma C_include('wnd.pf');
pragma C_include('gsegmrules.pf');
pragma C_include('ldmdict.pf');
pragma C_include('ldblex.pf');
pragma C_include('lisdict.pf');
pragma C_include('lisiddict.pf');
pragma C_include('liiddict.pf');
pragma C_include('lifixiddict.pf');
pragma C_include('liildict.pf');
pragma C_include('strtokey.pf');
pragma C_include('strtomkey.pf');
pragma C_include('interfaces.pf');
pragma C_include('lastactive.pf');
pragma C_include('pc.pf');
pragma C_include('sockipc.pf');
pragma C_include('mb.pf');
pragma C_include('log.pf');
pragma C_include('globbuf.pf');
pragma C_include('mem.pf');
pragma C_include('ldgenmrules.pf');
pragma C_include('ldmrules.pf');
pragma C_include('limrules.pf');
pragma C_include('glayout.pf');
pragma C_include('gmorph.pf');
pragma C_include('linearizer.pf');
pragma C_include('mgenerator.pf');
pragma C_include('gtransfer.pf');
pragma C_include('hiltree.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('listree.pf');
pragma C_include('printerf.pf');
pragma C_include('ldsucc.pf');
pragma C_include('debugmgenerator.pf');
pragma C_include('drawtree.pf');
pragma C_include('oldtree.pf');
pragma C_include('loop.pf');
pragma C_include('logname.pf');
pragma C_include('config.pf');
pragma C_include('converts.pf');
pragma C_include('arg.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM GENERATION(LogNames);
WITH GLOBDEF,
     GWHERE,
     DEBUG,
     WND,
     GSEGMRULES,
     LDMDICT,
     LDBLEX,
     LISDICT,
     LISIDDICT,
     LIIDDICT,
     LIFIXIDDICT,
     LIILDICT,
     STRTOKEY,
     STRTOMKEY,
     INTERFACES,
     LASTACTIVE,
     PC,
     SOCKIPC,
     MB,
     GlobBuf,
     LOG,
     MEM,
     LDSUCC,
     LDGENMRULES,
     LDMRULES,
     LIMRULES,
     GLAYOUT,
     GMORPH,
     LINEARIZER,
     MGENERATOR,
     GTRANSFER,
     HILTREE,
     HYPERDTREE,
     LISTREE,
     PRINTERF,
     DEBUGMGENERATOR,
     DRAWTREE,
     OLDTREE,
     LOOP,
     LOGNAME,
     CONFIG;


TYPE
   Sigargstype = ARRAY[0..1] OF INTEGER;
   MechArgsType = ARRAY[0..5] OF INTEGER;

VAR 
   LogNames        : Text;
   mbxhandler      : MB_mbxid;
   mbxcontrol,
   mbxgeneration   : MB_mbxid;
   readymessage,
   resultmessage,
   message         : MB_communicationblock;
   sentenceid      : integer;



PROCEDURE GenerationInit;
VAR
   sid : MEM_Stack;
BEGIN
   GLOBDEF_SetAnGenMode(GenMode);
   Config_Init;
   Mem_Init;
   Mem_CreateStack(sid, 8000000);
   Mem_SetDefault(sid);
   GSEGMRULES_Init;
   DEBUG_Init;
   {StrToMKey_OpenMkeyRead;}
   StrToKey_OpenSkeyRead;
   LDMDICT_OpenMdict;
   LISDICT_OpenSdict;
   LISIDDICT_OpenSIDdict;
   LIIDDICT_OpenIDdict;
   LDBLEX_OpenBlex;
   LIILDICT_OpenILDict;
   LIFIXIDDICT_Open;
   LDSUCC_Init;
   LDGENMRULES_Init;
   LDMRULES_Init;
   LIMRULES_Init;
   HILtree_GenInit;
   GWhere_Init;
   IF GlobDef_GetBatchMode THEN
      GLAYOUT_BatchInit
   ELSE Begin
      WND_Initialize;
      DrawTree_Initialize;
      Loop_Initialize;
      OldTree_Initialize;
      DebugMgenerator_Init
   End;
END;


PROCEDURE DummyInit(VAR message: MB_Communicationblock);
BEGIN
   WITH message DO BEGIN
      msg:= startmessage;
      status:= successful;
      stoplevel:= 0;
      clearwindow:= TRUE
   END; 
   {* dummy initialization to prevent compiler warning *}
END {DummyInit};


PROCEDURE ReadMessage(msg: MB_CommunicationBlock; 
                      VAR stoplevel: INTERFACES_LevelType;
                      VAR interf: INTERFACES_IfDescr);
BEGIN
   stoplevel := msg.stoplevel;
   interf := msg.IfDescr;
END {ReadMessage};


PROCEDURE GenerationBody( message: MB_communicationblock);

VAR stoplevel         : INTERFACES_leveltype;
    statusmessage     : MB_communicationblock;
    DFinterface,
    interface         : INTERFACES_IfDescrList;
    hyp               : HyperDtree_pHyperDtree;
    hypil             : HILtree_pHyperILtree;
    stree             : LISTREE_pStree;
    Translation,
    NewInput,
    Stop              : BOOLEAN;
    semptr,
    syn1ptr,
    syn2ptr,
    stackptr4         : Mem_StackPtr;
    starttime,
    stoptime          : INTEGER;
    curlev            : INTEGER;

 
   FUNCTION StillNextSyn1: BOOLEAN;
   BEGIN
      StillNextSyn1  := NOT HyperDtree_IsEmptySet(interface[5].if5)
   END {StillNextSyn1};

   FUNCTION StillNextSyn2: BOOLEAN;
   BEGIN
      StillNextSyn2  := LISTree_StillStrees(Interface[6].if6) 
   END {StillNextSyn2};

   FUNCTION StillNextStructSense: BOOLEAN;
   BEGIN
      StillNextStructSense := NOT HILtree_IsEmptySet(interface[4].if4)
   END {StillNextStructSense};

   FUNCTION StillNextLexSense: BOOLEAN;
   BEGIN
      StillNextLexSense := HILTREE_ExistsNextDtree(hypil) AND 
                           NOT GLOBDEF_GetBatchMode;
   END {StillNextLexSense};


PROCEDURE InformUserAboutResult;
BEGIN
   statusmessage.NextSyn         := StillNextSyn1 OR StillNextSyn2;
   statusmessage.NextStructSense := StillNextStructSense;
   statusmessage.NextLexSense    := StillNextLexSense;
   IF NOT (StillNextSyn1 OR StillNextSyn2 OR StillNextStructSense OR 
	   StillNextLexSense)
   THEN statusmessage.msg := ILFinished
   ELSE statusmessage.msg := AmbigInfo;

   MB_put(mbxcontrol, statusmessage);
END {InformUserAboutResult};


PROCEDURE AskUserWhatToDo(VAR curlev: INTEGER;
                          VAR Stop, NewInput: BOOLEAN);
BEGIN
   MB_take(mbxGeneration, message);

   IF message.msg = ILNextStructSense THEN curlev := 3
   ELSE IF message.msg = ILNextLexSense THEN curlev := 4
   ELSE IF message.msg = ILNextSyn THEN BEGIN
      IF StillNextSyn2 THEN curlev := 6
      ELSE { IF NOT HyperDtree_IsEmptySet(interface[5].if5) } curlev := 5
      END
   ELSE IF message.msg = stopmessage THEN Stop := TRUE
   ELSE IF message.msg = startmessage THEN NewInput := TRUE;

END {AskUserWhatToDo};


PROCEDURE InitInterfaces(VAR ifc: Interfaces_IfDescrList);
BEGIN
   HyperDtree_EmptySet(ifc[5].if5);
   LISTREE_InitSetOfStrees(ifc[6].if6);
   HILtree_EmptySet(ifc[4].if4);
END {InitInterfaces};


FUNCTION StillAlternatives(VAR curlev: INTEGER): BOOLEAN;
BEGIN
   CASE curlev OF
   3 :   StillAlternatives := StillNextStructSense;
   4 :   StillAlternatives := StillNextLexSense;
   5 :   StillAlternatives := StillNextSyn1;
   6 :   StillAlternatives := StillNextSyn2;
   7 :   StillAlternatives := FALSE;
   OTHERWISE 
         StillAlternatives := FALSE;
   END
END {StillAlternatives};


PROCEDURE PrepareAlternative(VAR curlev: INTEGER);
BEGIN
   CASE curlev OF
   3: BEGIN
      DFinterface[4].level := 4;
      HILtree_TakeFromSet(hypil, interface[4].if4);
      HILtree_EmptySet(DFinterface[4].if4);
      HILtree_AddToSet(hypil, DFinterface[4].if4);
      HILTREE_MarkFirstDtree(hypil);
      END;
   4: BEGIN
      HILTREE_MarkNextDtree(hypil);
      END;
   5: BEGIN
      DFinterface[5].level := 5;
      HyperDtree_TakeFromSet(hyp, interface[5].if5);
      HyperDtree_EmptySet(DFinterface[5].if5);
      HyperDtree_AddToSet(hyp, DFinterface[5].if5);
      END;
   6: BEGIN
      DFinterface[6].level := 6;
      LISTREE_TakeStree(stree, interface[6].if6);
      LISTREE_InitSetOfStrees(DFinterface[6].if6);
      LISTREE_AppendStree(stree, DFinterface[6].if6);
      END;
   7: BEGIN END
   END;
END {PrepareAlternatives};


PROCEDURE SetIndicator(VAR curlev: INTEGER);
BEGIN
   CASE curlev OF
   3 : GLAYOUT_SetIndicator(1);
   4 : GLAYOUT_SetIndicator(1);
   5 : GLAYOUT_SetIndicator(2);
   6 : GLAYOUT_SetIndicator(2);
   7 : GLAYOUT_SetIndicator(3)
   END;
END {SetIndicator};


PROCEDURE MarkMem(curlev: INTEGER);
BEGIN
   CASE curlev OF
   3,4 : Mem_MarkDefault(semptr);
   5   : Mem_MarkDefault(syn1ptr);
   6   : Mem_MarkDefault(syn2ptr);
   7   : BEGIN END
   END
END {MarkMem};


PROCEDURE ReleaseMem(curlev: INTEGER);
BEGIN
   CASE curlev OF
   3,4 : Mem_ReleaseDefault(semptr);
   5   : Mem_ReleaseDefault(syn1ptr);
   6   : Mem_ReleaseDefault(syn2ptr);
   7   : BEGIN END
   END
END {ReleaseMem};


PROCEDURE EvaluateAlternative(VAR curlev: INTEGER);
BEGIN
   IF StillAlternatives(curlev) OR (curlev=7) THEN BEGIN
      PrepareAlternative(curlev);
      MarkMem(curlev);
      CASE curlev OF
      3:  BEGIN
	    HyperDtree_EmptySet(interface[5].if5);
	    IF LASTACTIVE_GetLastActive(stoplevel) >= 5 THEN BEGIN
	       DEBUG_Open(5);  
	       GWhere_Component(5);
	       interface[5] := GTransfer_Body(DFinterface[4]);      
	       DEBUG_Close(5);
	       PRINTERF_Write(5, interface[5]);
	       curlev := curlev+2;
	       EvaluateAlternative(curlev)
	    END;
	    END;
      4:  BEGIN
	    HyperDtree_EmptySet(interface[5].if5);
	    IF LASTACTIVE_GetLastActive(stoplevel) >= 5 THEN BEGIN
	       DEBUG_Open(5);  
	       GWhere_Component(5);
	       interface[5] := GTransfer_Body(DFinterface[4]);      
	       DEBUG_Close(5);
	       PRINTERF_Write(5, interface[5]);
	       curlev := curlev+1;
	       EvaluateAlternative(curlev)
	    END;
	    END;
      5 :   BEGIN
	    LISTREE_InitSetOfStrees(interface[6].if6);
	    IF LASTACTIVE_GetLastActive(stoplevel) >= 6 THEN BEGIN
	       DEBUG_Open(6); 
	       GWhere_Component(6);
	       interface[6]:= MGenerator_Body(DFinterface[5]);      
	       DEBUG_Close(6);
	       PRINTERF_Write(6, interface[6]);
	       curlev := curlev+1;
	       EvaluateAlternative(curlev)
	    END;
	    END;
       6 :  IF LASTACTIVE_GetLastActive(stoplevel) >= 7 THEN BEGIN
	       DEBUG_Open(7);
	       GWhere_Component(7);
	       interface[7] := Linearizer_Body(DFinterface[6]);      
	       DEBUG_Close(7);
	       PRINTERF_Write(7, interface[7]);
	       curlev := curlev+1;
	       EvaluateAlternative(curlev)
	    END;
       7 :  IF LASTACTIVE_GetLastActive(stoplevel) >= 8 THEN BEGIN
	       DEBUG_Open(8);
	       GWhere_Component(8);
	       interface[8] := GMORPH(interface[7]);
	       DEBUG_Close(8);
	       GWhere_Component(9);
	       GLAYOUT(interface[8]);
               Translation := interface[8].if8 <> NIL;
	    END
      END;
  END;
END {EvaluateAlternative};


BEGIN
   starttime := 0{Clock};

   InitInterfaces(interface);

   ReadMessage(message, stoplevel, interface[4]);
   curlev := 3;
   Stop        := FALSE; 
   NewInput    := FALSE; 
   DebugMgenerator_Reset;
   GWhere_Pop;
   SetIndicator(curlev);

   MEM_MarkDefault(stackptr4);
   WHILE StillAlternatives(curlev) AND NOT Stop AND NOT NewInput DO BEGIN
      Translation := FALSE;
      EvaluateAlternative(curlev);
      IF Translation = FALSE THEN GLAYOUT_NoTranslationfound;
      InformUserAboutResult;
      AskUserWhatToDo(curlev, Stop, NewInput);
      ReleaseMem(curlev);
      SetIndicator(curlev);
   END;
   Mem_ReleaseDefault(stackptr4);

   GWhere_Hide;

   stoptime := 0{Clock};
   LOG_Write('Total Generation time ', 22, (stoptime-starttime));

END;

BEGIN
   reset(LogNames,'lognames');
   LogName_Init(LogNames);
   LOG_open('glogfile',8, GLOBDEF_yes);
   SOCKIPC_set_port (conversions.StoI(arg.Argv(2)), 1);
   MB_init(Loopholes.SizeOf(MB_Communicationblock), GLOBDEF_no);
   MB_open('GENERATION', takeaccess, mbxGeneration);
   MB_open('CONTROL', putaccess, mbxcontrol);
   LOG_Write('Generation mailbox ',18,Loopholes.Retype(mbxGeneration,INTEGER));
   LOG_Write('Generation initialization ready send and wait ', 44, 0);
   DummyInit(readymessage);
   DummyInit(resultmessage);
   MB_put(mbxcontrol, readymessage);
   MB_take(mbxGeneration, message);
   GlobDef_SetBatchMode (message.BatchMode);
   If Not message.BatchMode Then SOCKIPC_set_port (message.wndport, 0);

   (*----------------------------------------------------------------------*
    * Initialization Phase
    *----------------------------------------------------------------------*)

   GenerationInit;

   LOG_Write('Generation initialization ready continue ', 39, 0);
   LOG_Write('Generation start wait ', 20, 0);
   MB_take(mbxGeneration, message);
   LOG_Write('Generation start received ', 23, 0);

   mbxhandler := mbxcontrol;
   {Establish(Handler);}

   sentenceid := 0;
   WHILE message.msg <> stopmessage DO BEGIN

      sentenceid := sentenceid+1;

      GlobDef_SetSentenceId(sentenceid);


      LOG_Write('Starting GLAYOUT INIT ', 23, 0);


      GLAYOUT_Init;

      LOG_Write('Starting Body', 23, 0);

      GenerationBody(message);

      GLAYOUT_exit;

      LOG_Write('Generation window cleared, wait ', 40, 0);
      MB_put(mbxcontrol, resultmessage);
      LOG_Write('Generation stop continue ', 24, 0);
      LOG_Write('Generation message receive wait ', 31, 0);
      MB_take(mbxGeneration, message);
      LOG_Write('Generation message received', 27, 0);

   END;

   If Not GlobDef_GetBatchMode Then WND_Terminate;
   GlobBuf_RemoveAllBuffers;
   MB_close(mbxcontrol, GLOBDEF_no);
   MB_close(mbxGeneration, GLOBDEF_no);
   PC_TERMINATE;
   LOG_Write('Generation terminated', 20, 0);
   LOG_Close
END {Generation}.
