(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LIFIXIDDICT
 *  Creation date   :  7-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(LIFIXIDDICT);
pragma C_Include('cisam.pf');
pragma C_Include('logname.pf');
pragma C_Include('globdef.pf');
pragma C_Include('interface0.pf');
pragma C_Include('string.pf');
pragma C_Include('debug.pf');
pragma C_Include('alayout.pf');
pragma C_Include('lifixiddict.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH    LOGNAME,
        CISAM,
        GLOBDEF,
        INTERFACE0,
        STRNG,
        DEBUG,
        ALAYOUT;
WITH LOOPHOLES;

PROGRAM LIFIXIDDICT;

VAR
   buffer : LIFIXIDDICT_RecordDef;
   IdDict : CISAM_FileType;
   IdList : ARRAY[1..LIFIXIDDICT_MaxIdList] OF LIFIXIDDICT_RecordDef;


PROCEDURE FindChar(ch  : CHAR;
                   VAR Cont: INTEGER;
                   VAR StillCorrect: BOOLEAN;
                   VAR match       : BOOLEAN);
VAR
   found    : BOOLEAN;
   newindex : INTEGER;
   s        : PACKED ARRAY[1..1] OF CHAR;
BEGIN
   DEBUG_WriteStr('-> FIXID_FindChar ',DEBUG_MaxIO,0,TRUE);
   s[1] := ch; 
   DEBUG_WriteStr(s,DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteInteger(Cont, 5, TRUE);
   Debug_WriteLine(TRUE);
   newindex := Cont; found := FALSE;
   WHILE (newindex <> -1) AND ( NOT found ) DO BEGIN
      Cont := newindex;
      IF ( IdList[Cont].ch <> ch ) THEN BEGIN
         newindex := IdList[Cont].nxtchar
         END
      ELSE found := TRUE;
   END;
   IF found THEN BEGIN
      IF IdList[Cont].mark THEN match := TRUE;
      Cont := IdList[Cont].nxtlevel;
      DEBUG_WriteStr('Still Correct',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      END
   ELSE BEGIN
      DEBUG_WriteStr('Not Correct',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      Cont := -1
   END;
   StillCorrect := found;
   DEBUG_WriteStr('<- FIXID_FindChar',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {FindChar};


PROCEDURE FindWord(word: STRING_String;
                   len : INTEGER;
                   VAR NrChar : INTEGER;
                   VAR Cont: INTEGER;
                   VAR StillCorrect: BOOLEAN;
                   VAR match       : BOOLEAN);
VAR
   ch : CHAR;
BEGIN
   DEBUG_WriteStr('-> FIXID_FindWord',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   StillCorrect := TRUE; 
   WHILE (NrChar < len) AND StillCorrect DO BEGIN
      NrChar := NrChar+1;
      STRING_ExtractChar(ch, word, NrChar);
      FindChar(ch, Cont, StillCorrect, match)
   END;
   DEBUG_WriteStr('<- FIXID_FindWord',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {FindWord};


PROCEDURE LIFIXIDDICT_Open;
VAR 
   status : CISAM_StatusType;
   i      : 0..LIFIXIDDICT_MaxIdList;
   bufsize: INTEGER;
BEGIN
   IF GLOBDEF_GetAnGenMode = AnMode THEN
      IdDict := CISAM_initfile(
                        LOGNAME_findfile(LOGNAME_Tr('afixiddict')), 10,
                            Adr(buffer), SIZEof(buffer), CISAM_sequential)
   ELSE
      IdDict := CISAM_initfile(
                        LOGNAME_findfile(LOGNAME_Tr('gfixiddict')), 10,
                            Adr(buffer), SIZEof(buffer), CISAM_sequential);
   CISAM_Open(IdDict, CISAM_inp, CISAM_old);
   CISAM_ReadNext(IdDict, bufsize);
   status := CISAM_OwnStatus; 
   i := 0;
   WHILE NOT (status = CISAM_EndOfFile ) DO BEGIN
      i := i+1;
      IdList[i] := buffer;
      CISAM_ReadNext(IdDict, bufsize);
      status := CISAM_OwnStatus;
   END;
END {LIFIXIDDICT_Open};


PROCEDURE LIFIXIDDICT_AddIds(VAR s: INTERFACE0_pSeqWords;
                                      trailer: INTERFACE0_pSeqWords);
VAR 
   idiom        : STRING_String;
   Match,
   StillCorrect : BOOLEAN;
   NrChar,
   ContinueAt   : INTEGER;
   newlist,
   cur          :INTERFACE0_pSeqWords;
BEGIN
   DEBUG_WriteStr('-> FIXID_Find',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   cur := s;
   ContinueAt := 1; NewList := NIL; StillCorrect := TRUE; NrChar := 0;
   STRING_ConstantEmpty(idiom);
   WHILE (cur <> trailer) AND StillCorrect DO BEGIN
      Match := FALSE;
      IF STRING_Length(idiom) > 0 THEN STRING_AppendChar(idiom, idiom, ' ');
      STRING_Concat(idiom, idiom, cur^.word);
      FindWord(idiom, STRING_Length(idiom), NrChar,
               ContinueAt, StillCorrect, Match);
      IF Match THEN BEGIN
         NewList := INTERFACE0_MakeSeqWords(idiom, NewList);
         WITH NewList^ DO BEGIN
            kind := InputWord;
            X    := s^.X;
            Y    := s^.Y;
            len  := (cur^.Y-s^.Y)*ALAYOUT_WindowWidth + (cur^.x-s^.X) + 
                    cur^.len;
            rn   := cur^.rn
         END
      END;
      IF StillCorrect THEN BEGIN
         cur := cur^.nxt
      END
   END;
   s^.nxtamb := NewList;

   DEBUG_WriteStr('<- FIXID',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {LIFIXIDDICT_AddIds};


PROCEDURE LIFIXIDDICT_Close;
BEGIN
   CISAM_Close(IdDict);
END {LIFIXIDDICT_Close};

