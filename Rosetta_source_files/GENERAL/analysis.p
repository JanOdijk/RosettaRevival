(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : ANALYSIS 
 *  Creation date   :                                               
 *  Author          : J. Rous
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

pragma C_include('globdef.pf');
pragma C_include('awhere.pf');
pragma C_include('debug.pf');
pragma C_include('wnd.pf');
pragma C_include('asegmrules.pf');
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
pragma C_include('level.pf');
pragma C_include('sockipc.pf');
pragma C_include('pc.pf');
pragma C_include('mb.pf');
pragma C_include('globbuf.pf');
pragma C_include('log.pf');
pragma C_include('mem.pf');
pragma C_include('ldsucc.pf');
pragma C_include('ldanmrules.pf');
pragma C_include('ldmrules.pf');
pragma C_include('limrules.pf');
pragma C_include('alayout.pf');
pragma C_include('amorph.pf');
pragma C_include('surfparser.pf');
pragma C_include('mparser.pf');
pragma C_include('atransfer.pf');
pragma C_include('hiltree.pf');
pragma C_include('printerf.pf');
pragma C_include('debugmparser.pf');
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

PROGRAM ANALYSIS(LogNames);
WITH GLOBDEF,
     AWHERE,
     DEBUG,
     WND,
     ASEGMRULES,
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
     LEVEL,
     SOCKIPC,
     PC,
     MB,
     GlobBuf,
     LOG,
     MEM,
     LDSUCC,
     LDANMRULES,
     LDMRULES,
     LIMRULES,
     ALAYOUT,
     AMORPH,
     SURFPARSER,
     MPARSER,
     ATRANSFER,
     HILTREE,
     PRINTERF,
     DEBUGMPARSER,
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
   mbxanalysis     : MB_mbxid;
   readymessage,
   resultmessage,
   message         : MB_communicationblock;
   sentenceid      : integer;


PROCEDURE AnalysisInit;
VAR
   sid : MEM_Stack;
BEGIN
   GLOBDEF_SetAnGenMode(AnMode);
   Config_Init;
   Mem_Init;
   Mem_CreateStack(sid, 10000000);
   Mem_SetDefault(sid);
   ASEGMRULES_Init;
   DEBUG_Init;
   StrToMKey_OpenMkeyRead;
   StrToKey_OpenSkeyRead;
   LDMDICT_OpenMdict;
   LISDICT_OpenSdict;
   LISIDDICT_OpenSIDdict;
   LIIDDICT_OpenIDdict;
   LDBLEX_OpenBlex;
   LIFIXIDDICT_Open;
   LIILDICT_OpenILDict;
   LDSUCC_Init;
   LDANMRULES_Init;
   LDMRULES_Init;
   LIMRULES_Init;
   HILtree_AnInit;
   AWhere_Init;
   IF GlobDef_GetBatchMode THEN 
      ALAYOUT_BatchInit
   Else Begin
      WND_Initialize;
      DrawTree_Initialize;
      Loop_Initialize;
      OldTree_Initialize;
      DebugMparser_Init;
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
                      VAR stoplevel: Interfaces_LevelType);
BEGIN
   stoplevel := msg.stoplevel;
   LOG_Write('Stop level ', 11, msg.stoplevel);
END {ReadMessage};


FUNCTION AnalysisBody( message: MB_communicationblock): MB_communicationblock;

VAR interfacelevel,
    stoplevel         : INTERFACES_leveltype;
    returnmessage     : MB_communicationblock;
    interface         : INTERFACES_IfDescrList;
    component         : INTEGER;
    stackptr          : Mem_StackPtr;
    starttime,
    stoptime          : INTEGER;
    stop              : Boolean;
    error             : Boolean;
    interaction       : Boolean;

  Procedure GetUserAction (Var stop : Boolean);
  Var mb : MB_communicationblock;
      forget : GlobDef_Status;
  Begin
      mb.msg := startmessage;
      forget := MB_put (mbxcontrol, mb);
      forget := MB_take (mbxanalysis, mb);
      if mb.msg = stopmessage then
          stop := True
      else
          stop := false;
  End;

BEGIN
   starttime := 0{Clock};

   ReadMessage(message, stoplevel);
   DummyInit(returnmessage);

   interfacelevel    := -1;
   MEM_MarkDefault(stackptr);

   HILTREE_EmptySet(interface[4].if4);
   AWhere_Pop;
   stop := False;
   REPEAT
      error := False;
      component := interfacelevel + 1;
      DEBUG_Open(component);
      AWhere_Component(component);

      LOG_Write('evaluating component ', 22, component);
      LOG_Write('interface level      ', 22, interfacelevel);
      IF interfacelevel = 0 THEN starttime := 0{Clock};

      If (component = 0) or GlobDef_GetBatchMode Then
          interaction := False
      Else
          WND_GetBoolean (LEVEL_interact_to_Xid (component), interaction);
      GLOBDEF_SetInteractionMode(interaction);

      CASE interfacelevel OF
      -1:
          Begin
	      GetUserAction (stop);
	      If Not stop Then interface[0] := ALAYOUT;
	  End;
       0:   interface[1] := AMORPH(interface[0], error);
       1:   interface[2] := SURFPARSER_body(interface[1]);
       2:   interface[3] := MPARSER_body(interface[2]);
       3:   BEGIN 
            HILtree_Reset;
            interface[4] := ATRANSFER_body(interface[3], mbxanalysis, mbxcontrol, stop);
            END;
      END;

      DEBUG_Close(component);
      If Error Then
          interfacelevel := -1
      Else
          interfacelevel := succ(interfacelevel);
      PRINTERF_Write(interfacelevel, interface[interfacelevel]);

   UNTIL (interfacelevel >= LASTACTIVE_GetLastActive (stoplevel)) or 
         (interfacelevel = LASTACTIVE_AnalysisMaxLevel) or
         (stop);

   AWhere_Hide;
   MEM_ReleaseDefault(stackptr); 

   returnmessage.IfDescr := interface[4];
   IF stop THEN BEGIN
      returnmessage.msg := stopmessage
      END
   ELSE IF ( HILTREE_IsEmptySet(interface[4].if4)) OR 
      ( stoplevel < 4 ) THEN BEGIN
      LOG_Write('empty analysis result ', 22, component);
      returnmessage.msg := EmptyAnResult
      END
   ELSE BEGIN
      LOG_Write('correct analysis result ', 22, component);
      returnmessage.msg := CorrectAnResult;
   END;

   stoptime := 0{Clock};
   LOG_Write('Total analysis time ', 20, (stoptime-starttime));

   AnalysisBody := returnmessage

END;

VAR
    forget               : Globdef_Status;

BEGIN
   reset(LogNames,'lognames');
   Logname_Init(LogNames);
   LOG_open('alogfile',8, GLOBDEF_yes);
   SOCKIPC_set_port (conversions.StoI(arg.Argv(2)), 1);
   MB_init(Loopholes.SizeOf(MB_Communicationblock), GLOBDEF_no);
   forget := MB_open('ANALYSIS', takeaccess, mbxanalysis);
   forget := MB_open('CONTROL', putaccess, mbxcontrol);
   LOG_Write('analysis mailbox ', 18, Loopholes.Retype(mbxanalysis,INTEGER));
   LOG_Write('analysis initialization ready send and wait ', 44, 0);
   DummyInit(readymessage);
   forget := MB_put(mbxcontrol, readymessage);
   forget := MB_take(mbxanalysis, message);
   GlobDef_SetBatchMode(message.BatchMode);
   If Not message.BatchMode Then SOCKIPC_set_port (message.wndport, 0);

   (*----------------------------------------------------------------------*
    * Initialization Phase
    *----------------------------------------------------------------------*)
   AnalysisInit;

   LOG_Write('analysis initialization ready continue ', 39, 0);
   LOG_Write('analysis start wait ', 20, 0);
   forget := MB_take(mbxanalysis, message);
   LOG_Write('analysis start received ', 23, 0);

   mbxhandler := mbxcontrol;
   {Establish(Handler);}

   sentenceid := 0;
   WHILE message.msg <> stopmessage DO BEGIN
      sentenceid := sentenceid+1;
      GlobDef_SetSentenceId(sentenceid);

      ALAYOUT_init;
     
      resultmessage := AnalysisBody(message);

      LOG_Write('analysis stop send and wait ', 29, 0);
      forget := MB_put(mbxcontrol, resultmessage);
      LOG_Write('analysis stop continue ', 24, 0);
      LOG_Write('analysis message receive wait ', 31, 0);
      forget := MB_take(mbxanalysis, message);
      LOG_Write('analysis message received', 27, 0);

      IF message.clearwindow THEN BEGIN
         ALAYOUT_exit;
      END;

      forget := MB_take(mbxanalysis, message);
      LOG_Write('analysis message received', 27, 0);
   END;

   If Not GlobDef_GetBatchMode Then WND_Terminate;
   GlobBuf_RemoveAllBuffers;
   MB_close(mbxcontrol, GLOBDEF_no);
   MB_close(mbxanalysis, GLOBDEF_no);
   PC_TERMINATE;
   LOG_Write('analysis terminated', 20, 0);
   LOG_Close
END {ANALYSIS}.
