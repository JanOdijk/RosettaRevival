(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GENBLEXDICT
 *  Creation date   : 31 oktober 1990
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Generates blex.dict
 *
 *  Logical Names   : logfile, ablex (source), blexdict (target), askeyfile
 *
 *EMP:::===================================================================*)

pragma C_Include('globdef.pf');
pragma C_Include('lsdomaint.pf');
pragma C_Include('maket.pf');
pragma C_Include('lsstree.pf');
pragma C_Include('listree.pf');
pragma C_Include('logname.pf');
pragma C_Include('lidomaint.pf');
pragma C_Include('mem.pf');
pragma C_Include('log.pf');
pragma C_Include('string.pf');
pragma C_Include('str.pf');
pragma C_Include('files.pf');
pragma C_Include('ldconvrec.pf');
pragma C_Include('ldtypetostr.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('strkeyrecdef.pf');
pragma C_Include('ldblex.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM GENBLEXDICT(LogNames);
WITH     GLOBDEF,
         LOGNAME,
         LSDOMAINT,
         MAKET,
         LSSTREE,
         LISTREE,
         LIDOMAINT,
         MEM,
         LOG,
         STRNG,
         STR,
         FILES,
         LDCONVREC,
         LDTYPETOSTR,
         STRTOKEY,
         STRKEYRECDEF,
         LDBLEX;

const
  MaxFieldNameLength = 20;
  Width = 80;

var
  Lognames : Text;
  b: LDBLEX_pBlexStruct;
  BlexRec : LSDOMAINT_BlexStruct;
  pBlexRec: ^LSDOMAINT_BlexStruct;
  logfile,
  BlexDictfile: FILES_Text;
  NrRejected,
  NrAccepted: INTEGER;
  sid      : MEM_Stack;
  stackptr : MEM_StackPtr;
  MemAvail : integer;

PROCEDURE ToFile(var f  : FILES_Text;
                 BlexRec: LSDOMAINT_BlexStruct);
VAR
   savet    : LDCONVREC_pAttrStruct;
   s        : LDCONVREC_pSetValueType;
   DumKey   : INTEGER;
   inverse, 
   t        : LDCONVREC_pAttrStruct;
   listree  : LISTREE_pStree;
   lsstree  : LSSTREE_pStree;
   KeyStr   : STRING_String;
   CatStr   : String(40);
   len      : STR_Range;
   NumberOfLines: integer;
BEGIN
  lsstree := MAKET_StreeFromBlexrec(Blexrec.cat, BlexRec);
  listree := Loopholes.Retype(lsstree,LISTREE_pStree);
  inverse := LDCONVREC_GetAttrbs(listree);
  t := NIL;
  savet := NIL;
  while inverse <> NIL 
  do begin
    t := inverse;
    inverse := inverse^.NextAttr;
    t^.NextAttr := savet;
    savet := t;
  end;
  IF t = NIL 
  THEN BEGIN
    NrRejected := NrRejected+1;
    FILES_WriteString(logfile,'Empty blex for key: ', 0, true);
    FILES_WriteInteger(logfile,BlexRec.key,8,true);
    FILES_WriteLine(logfile, true);
  END
  ELSE BEGIN
    if not STRTOKEY_GetSkeyStr(BlexRec.key, KeyStr)
    then begin
      NrRejected := NrRejected+1;
      FILES_WriteString(logfile,'No string found for key: ', 0, true);
      FILES_WriteInteger(logfile,BlexRec.key,8,true);
      FILES_WriteLine(logfile, true);
    end
    else begin
      NrAccepted := NrAccepted+1;
      FILES_WriteChar(f, '$');
      FILES_WriteString(f, KeyStr, STRKEYRECDEF_MaxStrLength+1, true);
      LDTYPETOSTR_Cat(CatStr, len, 
                      Loopholes.Retype(BlexRec.cat,LIDOMAINT_SyntCat));
      FILES_WriteStr(f, CatStr, len, len, true);
      FILES_WriteChar(f, '(');
      t := t^.NextAttr; { ignore first (key) field }
      if (t <> nil) then FILES_WriteLine(f, true);
      WHILE ( t <> NIL ) 
      DO BEGIN 
        NumberOfLines := NumberOfLines + 1;
        FILES_WriteChar(f, '{');
        FILES_WriteStr(f, t^.Fieldname.Str, t^.Fieldname.Len,
                       t^.Fieldname.Len, TRUE);
        FILES_WriteStr(f, ':}', 2, MaxFieldNameLength-t^.Fieldname.Len, TRUE);
        IF t^.Typeindicator = EnumSet THEN BEGIN
          FILES_WriteStr(f, '[ ', 2, 2, TRUE);
          s := t^.SetValue;
          WHILE s <> NIL DO BEGIN
            IF (( FILES_Position(f) + s^.EltValue.len + 2 ) > Width) 
            THEN BEGIN
              FILES_WriteLine(f, TRUE);
              NumberOfLines := NumberOfLines + 1;
              FILES_WriteSpace(f, Maxfieldnamelength + 6);
            END;
            FILES_WriteStr(f, s^.EltValue.Str, s^.EltValue.Len, 
                           S^.EltValue.Len, TRUE);
           s := s^.NextValue;
            if s <> NIL 
            then FILES_WriteStr(f, ', ', 2, 2, true);
          END;
          FILES_WriteChar(f, ']');
        END 
        ELSE BEGIN
          FILES_WriteStr(f, t^.FieldValue.Str, t^.FieldValue.Len,
                         t^.FieldValue.Len, TRUE);
        END;
        t := t^.NextAttr;
        if t <> NIL then FILES_WriteChar(f, ',');
        FILES_WriteLine(f, TRUE);
      END;
      FILES_WriteString(f, ');', 2, true);
      FILES_WriteLine(f, TRUE);
      FILES_WriteLine(f, TRUE);
    END
  END;
END {ToFile};

BEGIN
  reset(Lognames);
  Logname_Init(LogNames);
  MEM_Init;
  MEM_CreateStack(sid, 100000);
  MEM_SetDefault(sid);
  FILES_Open(logfile,'logfile',8,3);
  FILES_Open(BlexDictfile,'blexdict',8,3);
  STRTOKEY_OpenSkeyRead;
  LDBLEX_OpenBlex;
  LDBLEX_Reset;
  NrAccepted := 0;
  NrRejected := 0;
  MEM_BottomDefault;
  MEM_MarkDefault(stackptr);
  while LDBLEX_ReadSequential(b) do begin
    Loopholes.Retype(pBlexRec,LDBLEX_pBLEXStruct) := b;
    BlexRec := pBlexRec^;
    ToFile(BlexDictFile, BlexRec);
    MEM_ReleaseDefault(stackptr);
  end;
  FILES_WriteString(logfile,'Number of processed records: ', 0, true);
  FILES_WriteInteger(logfile,NrAccepted,8,true);
  FILES_WriteLine(logfile, true);
  FILES_WriteString(logfile,'Number of rejected records: ', 0, true);
  FILES_WriteInteger(logfile,NrRejected,8,true);
  FILES_WriteLine(logfile, true);
  LDBLEX_CloseBlex;
  STRTOKEY_CloseSkey;
  FILES_WriteLine(BlexDictfile, true);
  FILES_WriteChar(BlexDictfile, '@');
  FILES_WriteLine(BlexDictfile, true);
  FILES_Close(BlexDictfile);
  FILES_Close(logfile);
END.
