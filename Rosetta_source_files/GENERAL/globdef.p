(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GLOBDEF 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Contains globally available constants and types.
 *
 *EMP:::===================================================================*)

Export(GLOBDEF);
pragma C_Include('globdef.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM GLOBDEF;

VAR
   agmode     : GLOBDEF_AnGenMode;
   interaction: BOOLEAN;
   batch      : BOOLEAN;
   SentenceID : INTEGER;

FUNCTION GLOBDEF_GetAnGenMode: GLOBDEF_AnGenMode;
BEGIN
   GLOBDEF_GetAnGenMode := agmode
END {GLOBDEF_GetAnGenMode};

PROCEDURE GLOBDEF_SetAnGenMode(mode: GLOBDEF_AnGenMode);
BEGIN
   agmode := mode
END {GLOBDEF_SetAnGenMode};

PROCEDURE GLOBDEF_SetInteractionMode(i: BOOLEAN);
BEGIN
   interaction := i
END {GLOBDEF_SetInteractionMode};

FUNCTION GLOBDEF_GetInteractionMode: BOOLEAN;
BEGIN
   GLOBDEF_GetInteractionMode := interaction
END {GLOBDEF_GetInteractionMode};

PROCEDURE GLOBDEF_SetBatchMode(i: BOOLEAN);
BEGIN
   Batch := i
END {GLOBDEF_SetBatchMode};

FUNCTION GLOBDEF_GetBatchMode: BOOLEAN;
BEGIN
   GLOBDEF_GetBatchMode := Batch
END {GLOBDEF_GetBatchMode};

PROCEDURE GLOBDEF_SetSentenceID(i: INTEGER);
BEGIN
   SentenceID := i
END {GLOBDEF_SetSentenceID};

FUNCTION GLOBDEF_GetSentenceID: INTEGER;
BEGIN
   GLOBDEF_GetSentenceId := SentenceID
END {GLOBDEF_GetSentenceId};

