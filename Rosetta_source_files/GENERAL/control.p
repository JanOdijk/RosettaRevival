(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : CONTROL
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

pragma C_include('globdef.pf');
pragma C_include('converts.pf');
pragma C_include('pc.pf');
pragma C_include('sockipc.pf');
pragma C_include('mb.pf');
pragma C_include('str.pf');
pragma C_include('globbuf.pf');
pragma C_include('batch.pf');
pragma C_include('log.pf');
pragma C_include('logname.pf');
pragma c_include ('arg.pf');
pragma C_include('wnd.pf');
pragma C_include('error.pf');
pragma C_include('interfaces.pf');
pragma C_include('lastactive.pf');
pragma C_include('level.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM CONTROL(LogNames);
WITH GLOBDEF, PC, MB, STR, BATCH, LOG, LOGNAME, WND, ERROR, LASTACTIVE, LEVEL,
     INTERFACES, GlobBuf, SOCKIPC;

LABEL 99;

CONST
   CurrentMaxComp = 8;
   MaxKey         = 500;
   AnalysisTimer  = 10;
   GenerationTimer= 10;

(*MPC:::===================================================================*
 *
 *  Const name     : Key definitions
 *  Description    : All logical key definitions
 *
 *EMP:::===================================================================*)

CONST
   Stop_Key        = X_mw_exit_button;
   New_Key         = X_mw_new_button;
   Modify_Key      = X_mw_modify_button;
   Do_Key          = X_mw_translate_button;
   Next_Struct_Key = X_mw_nextstruct_button;
   Next_Lex_Key    = X_mw_nextlex_button;
   Next_Key        = X_mw_gnext_button;
   aNext_key       = X_mw_anext_button;
   Inspect_Key     = X_mw_inspect_button;
   Continue_Key    = X_mw_continue_button;
   Start_Key       = X_mw_translate_button;
   Options_Key     = X_undefined;


TYPE
   UNSIGNED_WORD    = -32768..32767;

VAR
   LogNames         : Text;
   intstatus        : integer;
   status           : GLOBDEF_status;
   execmessage,
   readymessage,
   stopmsg,
   xwmessage,
   anclearwindow,
   genclearwindow,
   anstartmessage,
   anresultmessage,
   genstartmessage,
   genresultmessage : MB_communicationblock;
   mbxxw,
   mbxanalysis,
   mbxgeneration,
   mbxcontrola,
   mbxcontrolg      : MB_mbxid;
   key              : INTEGER;
   Batch            : BOOLEAN;
   AnalysisCrash    : BOOLEAN;
   GenerationCrash  : BOOLEAN;
   Stoplevel        : INTERFACES_LevelType;




   PROCEDURE ControlInit;
   VAR
      ExternParm,
      InternParm : String(10);
   BEGIN
      ExternParm := 'MODE';
      LogName_Translate(ExternParm, InternParm);
      Batch := FALSE;
      IF STR_Compare(InternParm, 5, 'BATCH', 5) = 0 THEN BEGIN
          Batch := TRUE
      END;
      GlobDef_SetBatchMode (Batch);

      IF NOT Batch THEN BEGIN
         WND_Initialize;
      END;

      AnalysisCrash   := FALSE;
      GenerationCrash := FALSE;
      Stoplevel       := CurrentMaxComp;

   END;


   PROCEDURE MessageInit(VAR msg: MB_communicationblock);
   BEGIN
      msg.msg       := startmessage;
      msg.stoplevel := Stoplevel;
      msg.BatchMode := Batch;
      msg.wndport   := xwmessage.wndport

   END {MessageInit};


   PROCEDURE SetOptionsInit;
   VAR
      i : GLOBDEF_LevelType;
   BEGIN
      IF NOT Batch THEN BEGIN
         FOR i := 1 TO CurrentMaxComp DO BEGIN
	    WND_SetBoolean (LEVEL_debug_to_Xid (i), FALSE);
	    WND_SetBoolean (LEVEL_printerf_to_Xid (i), FALSE);
	    WND_SetBoolean (LEVEL_last_active_to_Xid (i), FALSE);
            WND_SetBoolean (LEVEL_interact_to_Xid (i), FALSE);
         END;
         WND_SetBoolean (LEVEL_last_active_to_Xid (CurrentMaxComp), TRUE);
         WND_SetBoolean (LEVEL_interact_to_Xid (1), TRUE);
         WND_SetBoolean (LEVEL_interact_to_Xid (4), TRUE);
      END;
   END {SetOptionsInit};


   PROCEDURE ReadKey(screenmsg: WND_Sid;
                     key1, key2, key3 : INTEGER; 
                     VAR key: INTEGER);
   VAR
      keys     : array [1 .. 3] of WND_Xid;
      stop     : Boolean;
   BEGIN
      WND_SetMessage (screenmsg);
      keys [1] := key1;
      keys [2] := key2;
      keys [3] := key3;
      WND_SetKeys (X_mw_window, keys);
      stop := FALSE;
      WHILE not stop DO BEGIN
          WND_GetKey (key);
          IF key <> Stop_Key THEN BEGIN
              stop := TRUE
          END
          ELSE BEGIN
              IF ERROR_QuestionWrite (QUESTION_Exit) THEN BEGIN
                  stop := TRUE
              END;
          END;
      END;
      WND_UnsetKeys (keys);
      WND_ClearMessage;
   END {ReadKey};

   Procedure GetNextAnalysisAction (
		      mbin  : MB_communicationblock; 
		Var   mbout : MB_communicationblock;
		Var   key   : integer);
   Var stop : Boolean;
       forget : Globdef_Status;
   Begin
       stop := False;
       Repeat
           LOG_write('analysis start send and wait', 29, intstatus);
           forget := MB_put (mbxanalysis, mbin);
           LOG_write('analysis start continue', 24, intstatus);
           LOG_write('analysis stop wait', 19, intstatus);
	   forget := MB_take (mbxcontrola, mbout);
           LOG_write('analysis stop  received', 24, intstatus);
	   If mbout.msg = startmessage Then Begin
	       If Batch Then
	           key := Do_Key
	       Else Begin
                   WND_SetInputAllowed (X_mw_input_area, true);
                   WND_NewRowColumn(X_mw_input_area, 1, 1);
	           ReadKey (S_EnterSentence, Do_Key, X_undefined, X_undefined, key);
                   WND_SetInputAllowed (X_mw_input_area, false);
               End;
	       If key = Do_Key Then
	           mbin.msg := startmessage
               Else
	           mbin.msg := stopmessage;
           End
	   Else If mbout.msg = AmbigInfo Then Begin
		ReadKey (S_AmbiguousWords, - aNext_Key, - Inspect_Key, 
		         - Continue_Key, key);
	       If key = aNext_Key Then
	           mbin.msg := NextWord
               Else If key = Inspect_Key Then
	           mbin.msg := Inspect
               Else If key = Continue_Key Then
	           mbin.msg := startmessage
	       Else
	           mbin.msg := stopmessage;
	   End
	   Else
	       stop := True
       Until stop;
   End {GetNextAnalysisAction};

   Procedure GetNextGenerationAction (
       		Const mbin  : MB_communicationblock;
       		Var   mbout : MB_communicationblock; 
		Var  key    : integer);
   Var forget : GlobDef_Status;
   Begin
      { "generate generation communication block" }
      LOG_write('generation start send and wait',50, intstatus);
      forget := MB_put(mbxgeneration, mbin);
      LOG_write('generation start continue',50, intstatus);

      LOG_write('generation stop wait',50, intstatus);
      forget := MB_take(mbxcontrolg, mbout);
      LOG_write('generation stop received',50, intstatus);

      IF (mbout.msg = AmbigInfo) AND
         (mbout.NextSyn AND NOT mbout.NextLexSense AND 
	  NOT mbout.NextStructSense) THEN BEGIN

         IF NOT Batch THEN
            ReadKey(S_MenuNext, Next_Key, X_undefined, X_undefined, key)
         ELSE key := Next_Key
         END
      ELSE IF (mbout.msg = AmbigInfo) AND
              (NOT mbout.NextSyn AND mbout.NextLexSense AND 
	       NOT mbout.NextStructSense) THEN BEGIN

         IF NOT Batch THEN
            ReadKey(S_MenuNextLex, Next_Lex_Key, X_undefined, X_undefined, key)
         ELSE key := Next_Lex_Key
         END
      ELSE IF (mbout.msg = AmbigInfo) AND
              (NOT mbout.NextSyn AND NOT mbout.NextLexSense AND 
	       mbout.NextStructSense) THEN BEGIN

         IF NOT Batch THEN
            ReadKey(S_MenuNextStruct, Next_Struct_Key, X_undefined, 
	            X_undefined, key)
         ELSE key := Next_Struct_Key
         END
      ELSE IF (mbout.msg = AmbigInfo) AND
              (mbout.NextSyn AND mbout.NextLexSense AND 
	       NOT mbout.NextStructSense) THEN BEGIN

         IF NOT Batch THEN
            ReadKey(S_MenuNextLexNext, Next_Lex_Key, Next_Key, X_undefined, key)
         ELSE key := Next_Key
         END
      ELSE IF (mbout.msg = AmbigInfo) AND
              (mbout.NextSyn AND NOT mbout.NextLexSense AND 
	       mbout.NextStructSense) THEN BEGIN

         IF NOT Batch THEN
            ReadKey(S_MenuNextStructNext, Next_Struct_Key, Next_Key, 
	            X_undefined, key)
         ELSE key := Next_Key
         END
      ELSE IF (mbout.msg = AmbigInfo) AND
              (mbout.NextSyn AND mbout.NextLexSense AND 
	       mbout.NextStructSense) THEN BEGIN

         IF NOT Batch THEN
            ReadKey(S_MenuAllNext, Next_Struct_Key, Next_Lex_Key, 
                    Next_Key, key)
         ELSE key := Next_Key
         END
      ELSE IF (mbout.msg = AmbigInfo) AND
              (NOT mbout.NextSyn AND mbout.NextLexSense AND
	       mbout.NextStructSense) THEN BEGIN

         IF NOT Batch THEN
            ReadKey(S_MenuNextStructLex, Next_Struct_Key, 
                    Next_Lex_Key, X_undefined, key)
         ELSE key := Next_Lex_Key
         END
      ELSE IF mbout.msg = ILFinished THEN BEGIN

         IF NOT Batch THEN
            ReadKey(S_MenuStopNew, X_undefined, X_undefined, X_undefined, key)
         ELSE IF Batch_StillInput(Batch)
              THEN key := New_Key
              ELSE key := Stop_Key
         END
      ELSE IF mbout.msg = Crashed THEN BEGIN
         GenerationCrash := TRUE;
         Batch_GenerationCrash(Batch);
         key := Stop_Key;
      END;

   End {GetNextGenerationAction};


VAR
   keys         : array [1 .. 3] of WND_Xid;
   timer        : INTEGER;
   forget       : Globdef_Status;
   args         : Arg.Args_type;
   port         : string(10);
BEGIN
   reset(Lognames);
   LogName_Init(LogNames);
   ControlInit;
   args := Arg.Args ();
   LOG_open('LogFile',7, GLOBDEF_yes);
   MB_init(Loopholes.Sizeof(MB_communicationblock), GLOBDEF_yes);
   conversions.RtoS (SOCKIPC_get_port(1), 10, 0, port);

   IF NOT Batch THEN BEGIN
      status := PC_create ('Xw', Logname_Tr ('Xw'), port, '');
      forget := MB_open('Xw', takeaccess, mbxxw);
      forget := MB_take(mbxxw, xwmessage);
      SOCKIPC_set_port (xwmessage.wndport, 0);
   END;

   forget := MB_open('CONTROLA', takeaccess, mbxcontrola);
   forget := MB_open('CONTROLB', takeaccess, mbxcontrolg);

   MessageInit(execmessage);
   Batch_PrepareBatchMode(Batch);

   intstatus := 0;

   IF NOT Batch THEN BEGIN
      status := PC_create('analysis',Logname_Tr('aimage'), args, port);
      END
   ELSE BEGIN
      timer := 0;
      REPEAT
         timer := timer+1;
         status := PC_create('analysis',Logname_Tr('aimage'), args, port);
         IF status = notsuccessful THEN BEGIN
            writeln('Analysis process cannot be started, wait.....');
            {LIB$WAIT(60.0);}
         END;
      UNTIL (status = successful) OR (timer = AnalysisTimer)
   END;
   IF status = notsuccessful THEN BEGIN
      writeln('Analysis process cannot be started. System stopped');
      GOTO 99
   END;
   LOG_write('analysis created', 16, intstatus);
   LOG_write('analysis initialization ready wait', 35, intstatus);
   forget := MB_take(mbxcontrola,readymessage);
   LOG_write('analysis initialization ready received', 39, intstatus);
   forget := MB_open('ANALYSIS',putaccess, mbxanalysis);
   forget := MB_put (mbxanalysis, execmessage);

   IF NOT Batch THEN BEGIN
      status := PC_create('generation',Logname_Tr('gimage'), args, port);
      END 
   ELSE BEGIN
      timer := 0;
      REPEAT
         timer := timer+1;
         status := PC_create('generation',Logname_Tr('gimage'), args, port);
         IF status = notsuccessful THEN BEGIN
            writeln('Generation process cannot be started, wait.....');
            {LIB$WAIT(60.0);}
         END;
      UNTIL (status = successful) OR (timer = GenerationTimer)
   END;
   IF status = notsuccessful THEN BEGIN
      writeln('Generation process cannot be started. System stopped');
      GOTO 99
   END;
   LOG_write('generation created', 18, intstatus);
   LOG_write('generation initialization ready wait', 37, intstatus);
   forget := MB_take(mbxcontrolg,readymessage);
   LOG_write('generation initialization ready received', 41, intstatus);
   forget := MB_open('GENERATION',putaccess, mbxgeneration);
   forget := MB_put (mbxgeneration, execmessage);

{  this function must not be called on init but when reset is pressed in the
   debug-screen. This initialization overrules the settings in the
   .Xdefaults file !!!!!!!!!!!
   SetOptionsInit;
}

   IF NOT Batch THEN BEGIN
      keys [1] := Stop_Key;
      keys [2] := New_Key;
      keys [3] := Modify_Key;
      WND_SetKeys (X_mw_window, keys);
   END;

   REPEAT
      { "generate analysis communication block" }

      Batch_PrepareInputBuffer(Batch);
      anstartmessage := execmessage;
      GetNextAnalysisAction (anstartmessage, anresultmessage, key);

      IF (anresultmessage.msg = CorrectAnResult) AND 
         (LASTACTIVE_GetLastActive (Stoplevel) > LASTACTIVE_AnalysisMaxLevel) THEN BEGIN

         genstartmessage := execmessage;
         genstartmessage.IfDescr := anresultmessage.IfDescr;

         Batch_BeginOutput(Batch);

         REPEAT

            GetNextGenerationAction (genstartmessage, genresultmessage, key);

            IF key = Next_Struct_Key THEN genstartmessage.msg := ILNextStructSense;
            IF key = Next_Lex_Key    THEN genstartmessage.msg := ILNextLexSense;
            IF key = Next_Key        THEN genstartmessage.msg := ILNextSyn;

            Batch_EvalOutputBuffer(Batch);

         UNTIL (key = Stop_Key) OR (key = New_Key) OR (key = Modify_Key);

         Batch_EndOutput(Batch);

         genclearwindow := execmessage;
	 IF key = Stop_Key THEN genclearwindow.msg := stopmessage;
	 IF key = New_Key  THEN genclearwindow.msg := startmessage;

         IF NOT GenerationCrash THEN BEGIN
   	    LOG_write('generation start send clearwindow', 50, intstatus);
	    MB_put(mbxgeneration, genclearwindow);
	    LOG_write('generation wait windwo cleared ', 50, intstatus);
	    MB_take(mbxcontrolg, genclearwindow);
         END
         END
      ELSE IF anresultmessage.msg = EmptyAnResult THEN BEGIN

         Batch_InCorrectAnalysis(Batch);

         IF NOT Batch THEN
            ReadKey(S_MenuStopNew, X_undefined, X_undefined, X_undefined, key)
         ELSE BEGIN
            IF Batch_StillInput(Batch)
              THEN key := New_Key
              ELSE key := Stop_Key
         END
      END
      ELSE IF anresultmessage.msg = Crashed THEN BEGIN
         AnalysisCrash := TRUE;
         Batch_AnalysisCrash(Batch);
         key           := Stop_key
      END;

      anclearwindow := execmessage;
      If key = Modify_Key Then
	 anclearwindow.clearwindow := FALSE
      Else
	 anclearwindow.clearwindow := TRUE;
      IF key = Stop_Key THEN anclearwindow.msg := stopmessage;
      IF key = New_Key  THEN anclearwindow.msg := startmessage;

      IF NOT AnalysisCrash THEN BEGIN
         LOG_write('analysis start send clearwindow', 0, intstatus);
         MB_put(mbxanalysis, anclearwindow);
         LOG_write('analysis message read', 0, intstatus);
      END;

   UNTIL (key = Stop_Key) OR NOT Batch_StillInput(Batch);

   stopmsg := execmessage;
   stopmsg.msg := stopmessage;
   IF NOT AnalysisCrash THEN BEGIN
      LOG_write('analysis terminate send and wait',0, intstatus);
      MB_put(mbxanalysis, stopmsg);
      LOG_write('analysis terminate continue',0, intstatus);
      MB_close(mbxanalysis, GLOBDEF_yes);
   END;

   IF NOT GenerationCrash THEN BEGIN
      LOG_write('generation terminate send and wait',0, intstatus);
      MB_put(mbxgeneration, stopmsg);
      LOG_write('generation terminate continue',0, intstatus);
      MB_close(mbxgeneration, GLOBDEF_yes);
   END;
99:
   If Not Batch Then WND_Stop;
   GlobBuf_RemoveAllBuffers;
   MB_close(mbxcontrola, GLOBDEF_yes);
   MB_close(mbxcontrolg, GLOBDEF_yes);
   MB_close(mbxanalysis, GLOBDEF_yes);
   MB_close(mbxgeneration, GLOBDEF_yes);
   MB_close(mbxxw, GLOBDEF_yes);
   LOG_close;
   PC_terminate;
END { CONTROL }.
