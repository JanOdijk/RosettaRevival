(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : LEXED / LEXVIEW
 *  Creation date   : 12 juli 1990
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
[INHERIT('TOOLS:LEXEDAUX',
         'LANGUAGE:LSLEXED',
         'GENERAL:GLOBDEF',
         'GENERAL:MB',
         'GENERAL:LIMORFDEF',
         'VMS:VMSRMS',
         'VMS:VMSSYS',
         'LANGUAGE:LSPHONDEF',
         'LANGUAGE:LSDOMAINT',
         'LANGUAGE:LSCONSTRAINTS',
         'GENERAL:LIDOMAINT',
         'LANGUAGE:LSTYPETOSTR',
         'LANGUAGE:LSSTRTOTYPE',
         'LANGUAGE:MAKET',
         'GENERAL:INTERFACE1',
         'GENERAL:MEM',
         'GENERAL:LOG',
         'GENERAL:STRING',
         'GENERAL:STR',
         'GENERAL:FILES',
         'GENERAL:ERROR',
         'GENERAL:RECTOSCREEN',
         'GENERAL:WINDOWS',
         'GENERAL:LDCONVREC',
         'GENERAL:LDTYPETOSTR',
         'GENERAL:LDSTRTOTYPE',
         'GENERAL:LISTREE',
         'LANGUAGE:LSSTREE',
         'GENERAL:LDGETKEY',
         'GENERAL:STRTOKEY',
         'GENERAL:STRTOMKEY',
         'GENERAL:LDMDICT',
         'LANGUAGE:MDICTDEF',
         'GENERAL:LIFIXIDDICT',
         'GENERAL:LDBLEX',
         'GENERAL:LISDICT',
         'GENERAL:LISIDDICT',
         'GENERAL:LIIDDICT',
         'GENERAL:LIILDICT',
         'GENERAL:LISCOMMENT',
         'GENERAL:LIMCOMMENT',
         'GENERAL:LILOCK')]

PROGRAM LEXED(input, output);

[EXTERNAL] FUNCTION LIB$DATE_TIME(var DateTime: packed array[lb..ub: integer] of char
                                 ): INTEGER; EXTERN;

CONST
  MaxFoundKeys  = 50;    { maximum number of selected keys }
  ViewMode      = true;  { Switch between LEXED en LEXVIEW }
  MultiLanguage = true;  { Switch single/multi-language }

var
  lexedmessage,
  lexedinitmessage,
  lexedcontrolmessage: MB_communicationblock;
  mbxlexed,
  mbxlexedinit,
  mbxlexedcontrol    : MB_mbxid;
  CurrentLanguage    : MB_LanguageType;
  StackPtr           : MEM_StackPtr;
  dev                : WINDOWS_Device;
  EditLemmaHelpWindow,
  WaitWindow         : WINDOWS_Window;
  WaitViewport       : WINDOWS_Viewport;
  ChangeLogFile,       { in this file the modifications of all users are logged }
  keynotefile        : FILES_text;
  BverbCat,
  PrepCat,
  PartCat            : LIDOMAINT_SyntCat;
  SiddictBuffer      : LISIDDICT_RecordDef;
  IddictBuffer       : LIIDDICT_RecordDef;
  TranslationMkey    : integer;
  OriginalLanguage,    { TRUE if the current language was selected from the 
                         main menu, FALSE if this process was called from
                         the process of another language (translate function) }
  WaitWindowActive,
  PrepCatExists,
  PartCatExists      : boolean;
  DateTime           : packed array[1..23] of char;
  UserName           : packed array[1..8] of char;

procedure GetUserName;
{
  This procedure extracts the user's name from the logical name 'sys$login'.
  This name will be used when a modification is logged.
}
var intstatus, 
    i, 
    LengthPlusOne,
    len          : integer;
    s            : packed array[1..30] of char;
    LogicalName  : varying[10] of char;
begin
  LogicalName := 'SYS$LOGIN';
  { symbol can not be used in a sub proces, only a logical name }
  intstatus := $TRNLOG(LOGNAM := (LogicalName),
                       DSBMSK := 3,
                       RSLBUF := s);
  if intstatus = SS$_NORMAL 
  then begin
    STR_Extract(UserName, len, s, 30, 11, 8);
    LengthPlusOne := STR_FindFirstInSet(UserName, 8, ']', 1);
    if LengthPlusOne <> 0 { ']' found, so username < 8 characters }
    then
      for i := LengthPlusOne to 8 
      do UserName[i] := ' ';
  end;
end;

procedure InitHelpWindows;
var
  i                : integer;
  EditLemmaHelpText: array[1..24] of STRING_String := 
[1: '                           HELP INFORMATION                            ';
 2: ' ';
 3: 'F10: Edit comments on idioms, meanings or the whole lemma';
 4: ' ';
 5: 'F11: Escape from browsing lemmas   F17: Translate (semi) idiom or meaning';
 6: 'F12: Previous lemma                F18: Show Mkey of (semi) idiom or meaning';
 7: 'F13: Select lemma by number        F19: ';
 8: 'F14: Select related lemmas         F20: Show Skey of lemma';
 9: ' ';
10: 'Do    : Modify object at cursor position';
11: 'Find  : Find object at cursor position';
12: 'Insert: Insert object at cursor position, or insert line below cursor';
13: 'Remove: Remove object at cursor position';
14: 'Select: Select lemma or mkey of (semi) idiom, meaning';
15: ' ';
16: 'PF1-PrevScreen: Top screen/lemma   PF1-NextScreen: Bottom screen/lemma';
17: '';
18: 'Change mkey of (semi) idiom or meaning: cursor to ":" and press Do key';
19: 'Remove (semi) idiom or meaning: cursor to ":" and press Remove key';
20: 'Remove lemma: cursor to ":" on first line and press Remove key';
21: 'Copy lemma: cursor to ":" on first line and press Insert key';
22: 'Mark meaning: cursor to position next to ":" and press Do key';
23: ' ';
24: '                      PRESS ANY KEY TO CONTINUE '];
  ViewLemmaHelpText: array[1..24] of STRING_String := 
[1: '                           HELP INFORMATION                            ';
 2: ' ';
 3: 'F10: View comments on idioms, meanings or the whole lemma';
 4: ' ';
 5: 'F11: Escape from browsing lemmas   F17: Translate (semi) idiom or meaning';
 6: 'F12: Previous lemma                F18: Show Mkey of (semi) idiom or meaning';
 7: 'F13: Select lemma by number        F19: ';
 8: 'F14: Select related lemmas         F20: Show Skey of lemma';
 9: ' ';
10: 'Find  : Find object at cursor position';
11: ' ';
12: 'PF1-PrevScreen: Top screen/lemma   PF1-NextScreen: Bottom screen/lemma';
13: ' ';
14: ' ';
15: ' ';
16: ' ';
17: ' ';
18: ' ';
19: ' ';
20: ' ';
21: ' ';
22: ' ';
23: ' ';
24: '                      PRESS ANY KEY TO CONTINUE '];

BEGIN
  WINDOWS_OpenWindow(EditLemmaHelpWindow, ' ', 0, 24, 80);
  for i := 1 to 23 do begin
    if ViewMode
    then
      WINDOWS_WriteString(EditLemmaHelpWindow, ViewLemmaHelpText[i], 0, true)
    else
      WINDOWS_WriteString(EditLemmaHelpWindow, EditLemmaHelpText[i], 0, true);
    WINDOWS_WriteLine(EditLemmaHelpWindow, true);
  end;
  WINDOWS_WriteString(EditLemmaHelpWindow, EditLemmaHelpText[24], 0, true);
END;

procedure LexedInit;
var
  sid      : MEM_Stack;
  language,
  mbxname  : STRING_String;
  c        : char;
begin
  MEM_init;
  Mem_CreateStack(sid, 1000000);
  if not Mem_Done
  then begin
    GiveMessage('Not enough stack space! ');
    halt;
  end
  else Mem_SetDefault(sid);

  GetUserName;

{  LOG_open('logfile',7, GLOBDEF_yes); }

  GLOBDEF_SetAnGenMode(anmode);

  WINDOWS_initialize;
  WINDOWS_OpenDevice(dev, 'TT', 2, false);
  GLOBDEF_SetDevice(dev);

  CurrentLanguage := LSLEXED_Language;
  case CurrentLanguage of
    dutch  : language := 'dutch';
    english: language := 'english';
    spanish: language := 'spanish';
  end;

{  LEXEDAUX_Log('lexed: open mailbox lexedinit'); }
  if MultiLanguage
  then begin
    MB_Init;
    MB_Open('LEXEDINIT',putaccess,GLOBDEF_No,mbxlexedinit);
    mbxname := 'lexed';
    STRING_Concat(mbxname, language, mbxname); { e.g. 'dutchlexed' }
{    LEXEDAUX_Log('lexed: open mailbox <language>lexed'); }
    MB_Open(mbxname,takeaccess,GLOBDEF_Yes,mbxlexed);
  end;
{  LEXEDAUX_Log('lexed: open lexicons'); }

  if ViewMode 
  then begin
    LDMDICT_OpenMdict;
    LDBLEX_OpenBlex;
    LISDICT_OpenSDict;
    LISIDDICT_OpenSIDDict;
    LIIDDICT_OpenIDDict;
    LIILDICT_OpenILDict;
    LISCOMMENT_OpenSCommentRead;
    LIMCOMMENT_OpenMCommentRead;
    STRTOKEY_OpenSkeyRead;
    STRTOMKEY_OpenMkeyRead;
  end else begin
    LDMDICT_OpenMdictUpdate;
    LDBLEX_OpenBlexUpdate;
    LISDICT_OpenSDictUpdate;
    LISIDDICT_OpenSIDDictUpdate;
    LIIDDICT_OpenIDDictUpdate;
    LIILDICT_OpenILDictUpdate;
    LISCOMMENT_OpenSCommentUpdate;
    LIMCOMMENT_OpenMCommentUpdate;
    STRTOKEY_OpenSkeyUpdate;
    STRTOMKEY_OpenMkeyUpdate;
    LILOCK_OpenLockUpdate;
  end;
  FILES_OPEN(keynotefile, 'keynotes', 8, 3);
  FILES_OPEN(ChangeLogFile, 'changelog', 9, 6);

  { if the category PREP and/or PART do no exist in this language, assign
    a dummy category to PrepCat and/or PartCat in order to prevent
    successful comparisons.
    Reasons for this domain specific knowledge:
    - Lemmas of category PREP or PART cannot yet be removed, because of 
      possible reference in blex, which cannot be checked at runtime 
    - Particles can only be assigned to fonetical keys of category
      BVERB or PREP
  }
  if not LDSTRTOTYPE_Cat('PREP', 4, PrepCat) then PrepCat := LICAT0;
  if not LDSTRTOTYPE_Cat('PART', 4, PartCat) then PartCat := LICAT0;
  if not LDSTRTOTYPE_Cat('BVERB', 5, BverbCat) then BverbCat := LICAT0;

  WaitWindowActive := false; { no wait message on screen }
  InitHelpWindows;           { assign help text to lemma window }

  if MultiLanguage 
  then begin
{    LEXEDAUX_Log('lexed: lexed: put message into lexedinit'); }
    MB_Put(mbxlexedinit, lexedinitmessage);
    MB_Close(mbxlexedinit, GLOBDEF_No); 
{    LEXEDAUX_Log('lexed: lexed: take message from <language>lexed'); }
    MB_Take(mbxlexed, lexedmessage);

    MB_Open('LEXEDCONTROL',putaccess,GLOBDEF_No,mbxlexedcontrol);
  end;  
end; 

procedure LexedEnd;
begin
  WINDOWS_CloseWindow(EditLemmaHelpWindow);
  WINDOWS_CloseDevice(dev);
  LDMDICT_CloseMDict; 
  LDBLEX_CloseBlex;
  LISDICT_CloseSDict;
  LISIDDICT_CloseSIDDict;
  LIIDDICT_CloseIDDict;
  LIILDICT_CloseILDict;
  LISCOMMENT_CloseSComment;
  LIMCOMMENT_CloseMComment;
  STRTOKEY_CloseSkey;
  STRTOMKEY_CloseMkey;
  FILES_Close(keynotefile);
  FILES_Close(ChangeLogfile);
  if not viewmode then LILOCK_CloseLock;
{  LOG_close; }
  if MultiLanguage then MB_Put(mbxlexedcontrol, lexedcontrolmessage);
end;

procedure StartWait;
{
  Displays flashing message 'WORKING' at the center of the screen
}
begin
  if not WaitWindowActive
  then begin
    WINDOWS_OpenWindow(WaitWindow, ' ', 0, 1, 9);
    WINDOWS_WriteString(WaitWindow, ' WORKING ', 9, FALSE);
    WINDOWS_SetVideoAttrExist(WaitWindow, 1, 1, 1, 9, 
                              [WINDOWS_Blink, WINDOWS_Reverse], []);
    WINDOWS_CursorVisible(dev, false);
    WINDOWS_OpenViewport(WaitViewport, dev, WaitWindow, 12, 35);
    WaitWindowActive := true;
  end;
end;

procedure StopWait;
{
  Removes flashing message 'WORKING' at the center of the screen
}
begin
  if WaitWindowActive
  then begin
    WINDOWS_CloseViewport(WaitViewport);
    WINDOWS_CloseWindow(WaitWindow);
    WINDOWS_CursorVisible(dev, true);
    WaitWindowActive := false;
  end;
end;

function SelectLanguage(var l: MB_LanguageType): boolean;
{
  Enables user to select a language from Dutch, English and spanish.
}
var
  choice          : integer;
  LanguageSelected: boolean := true;
  MenuOptions     : array[1..3] of STRING_String :=
                    [ 1: 'Dutch';
                      2: 'English';
                      3: 'Spanish'];
begin
  choice := 1;
  MenuChoice(3, MenuOptions, center, choice);
  case choice of 
    0: LanguageSelected := false;
    1: l := dutch;
    2: l := english;
    3: l := spanish;
  end;
  SelectLanguage := LanguageSelected;
end;

type 
  FileTypeEnumeration = (mdict, sdict, siddict, iddict, ildict, blex, 
                         mkeys, skeys, scomment, mcomment);

  ActionTypeEnumeration = (add, modify, delete);

procedure ChangeLog(f: FileTypeEnumeration;
                    a: ActionTypeEnumeration;
                    skey: integer;
                    key: integer);
{
  Logs a modification to a logfile: date, username, type of action and
  relevant keys.
}
var
  DateTimeString,
  DateString,
  TimeString, 
  KeyString: STRING_String;
begin
  LIB$DATE_TIME(DateTime);
  STRING_Constant(DateTimeString, DateTime, 23);
  STRING_Extract(DateString, DateTimeString, 1, 6);
  STRING_Extract(TimeString, DateTimeString, 12, 6);
  FILES_WriteString(ChangeLogFile, DateString, 6, true);
  FILES_WriteString(ChangeLogFile, TimeString, 6, true);
  FILES_WriteChar(ChangeLogFile, ' ');
  FILES_WriteStr(ChangeLogFile, UserName, 8, 9, true);
  case f of 
    mdict   : FILES_WriteString(ChangeLogFile, 'mdict',    8, true);
    sdict   : FILES_WriteString(ChangeLogFile, 'sdict',    8, true);
    siddict : FILES_WriteString(ChangeLogFile, 'siddict',  8, true);
    iddict  : FILES_WriteString(ChangeLogFile, 'iddict',   8, true);
    ildict  : FILES_WriteString(ChangeLogFile, 'ildict',   8, true);
    blex    : FILES_WriteString(ChangeLogFile, 'blex',     8, true);
    skeys   : FILES_WriteString(ChangeLogFile, 'skeys',    8, true);
    mkeys   : FILES_WriteString(ChangeLogFile, 'mkeys',    8, true);
    scomment: FILES_WriteString(ChangeLogFile, 'scomment', 8, true);
    mcomment: FILES_WriteString(ChangeLogFile, 'mcomment', 8, true);
  end;
  case a of 
    add     : FILES_WriteString(ChangeLogFile, 'added',    9, true);
    modify  : FILES_WriteString(ChangeLogFile, 'modified', 9, true);
    delete  : FILES_WriteString(ChangeLogFile, 'deleted',  9, true);
  end;
  if skey <> 0
  then begin
    STRTOKEY_GetSkeyStr(skey, KeyString);
    FILES_WriteString(ChangeLogfile, KeyString, STRING_Length(KeyString)+1, true);
  end;
  if key <> 0
  then begin
    if (f = ildict) or (f = mkeys)
    then STRTOMKEY_GetMkeyStr(key, KeyString)
    else STRTOKEY_GetSkeyStr(key, KeyString);
    FILES_WriteString(ChangeLogfile, KeyString, STRING_Length(KeyString)+1, true);
  end;
  FILES_WriteLine(ChangeLogfile, true);
end;
 
procedure AskStem(message: STRING_String; var stem: STRING_String);
{
  Asks user for stem.
}
var 
  DummyString: packed array [1..LDMDICT_MaxStem] of char;
  len        : integer;
begin
  DummyString := '';
  AskStr(message, LDMDICT_MaxStem, DummyString, len);
  STRING_Constant(stem, DummyString, len);
  STRING_Trim(stem,stem);
end;

procedure AskNextLemmaNumber(MaxNr: integer; var Nr: integer);
{
  Asks number of desired lemma; checks boundaries
}
begin
  AskInteger('Give number of desired lemma: ', Nr);
  if Nr < 1 then Nr := 1;
  if Nr > MaxNr then Nr := MaxNr;
end;

function CheckSemiIdiomArgument(sid: LISIDDICT_RecordDef;
                                skey: integer): boolean;
{
  Checks if the argument of this semi-idiom refers to specified skey.
}
begin
  CheckSemiIdiomArgument := (sid.arg = skey);
end;

function CheckIdiomArgument(id: LIIDDICT_RecordDef;
                            skey: integer): boolean;
{
  Checks if one of the arguments of this idiom refers to specified skey.
}
var 
  found: boolean;
  i: integer;
begin
  found := false;
  i := 2; { first argument is the head argument }
  while not found and (i <= id.args.nrargs) 
  do begin
    if id.args.argkeys[i] = skey
    then found := true
    else i := i+1;
  end;
  CheckIdiomArgument := found;
end;

procedure GenerateStringKey(KeyType: KeyTypeEnum;
                            ObjectType: ObjectTypeEnum;
                            cat: LIDOMAINT_syntcat;
                            Stem: STRING_String;
                            n: integer;
                            var StringKey: STRING_String);
{ 
  Generates a key string, e.g. s_work_bverb_1
}
var success: boolean;
    DummyString: packed array[1..40] of char;
    DummyLen: integer;
    StringPos: integer;
begin
  { first replace all spaces in stem with the empty string }
  repeat
    StringPos := STRING_FindfirstInSet(stem, ' ');
    if StringPos > 0
    then STRING_Replace(stem, stem, StringPos, 1, '');
  until StringPos = 0;
  case KeyType of
    SkeyType: STRING_Constant(StringKey,'s_',2);
    MkeyType: STRING_Constant(StringKey,'m_',2);
  end;
  case ObjectType of
    LemmaType    : ;
    SemiIdiomType: STRING_AppendChars(StringKey,StringKey,'sid_',4);
    IdiomType    : STRING_AppendChars(StringKey,StringKey,'id_',3);
  end;
  STRING_Concat(StringKey, StringKey, Stem);
  STRING_AppendChars(StringKey,StringKey,'_',1);
  LDTYPETOSTR_Cat(DummyString,DummyLen,cat);
  STRING_AppendChars(StringKey,StringKey,DummyString,DummyLen);
  STRING_AppendChars(StringKey,StringKey,'_',1);
  success := STR_IntegerToStr(n,DummyString,DummyLen);
  STRING_AppendChars(StringKey,StringKey,DummyString,DummyLen);
end;

function GenerateKey(KeyType: KeyTypeEnum;
                     ObjectType: ObjectTypeEnum;
                     cat: LIDOMAINT_syntcat;
                     Stem: STRING_String;
                     var key: integer): boolean;
{
  Generates a new unique key and inserts this key into database.
}
var success: boolean;
    i: integer;
    StringKey: STRING_String;
    UniqueKey: boolean;
    md: LIILDICT_MeaningDescr := ' ';
begin
  success := false;
  case KeyType of 
    SkeyType: begin
                i := 1;
                UniqueKey := false;
                while not UniqueKey do begin
                  GenerateStringKey(KeyType,ObjectType,cat,stem,i,StringKey);
                  UniqueKey := not STRTOKEY_GetSkeyNR(StringKey,key);
                  i := i+1;
                end;
                success := STRTOKEY_GetHighestSkey(key);
                if success 
                then begin
                  key := key+1;
                  success := STRTOKEY_PutSkey(StringKey,key);
                end;
                STRTOKEY_Release;
              end;
    MkeyType: begin
                i := 1;
                UniqueKey := false;
                while not UniqueKey do begin
                  GenerateStringKey(KeyType,ObjectType,cat,stem,i,StringKey);
                  UniqueKey := not STRTOMKEY_GetMkey(StringKey,key);
                  i := i+1;
                end;
                success := STRTOMKEY_GetHighestMkey(key);
                if success 
                then begin
                  key := key+1;
                  success := STRTOMKEY_PutMkey(StringKey,key,md);
                  ChangeLog(Mkeys, add, 0, key);
                end;
                STRTOMKEY_Release;
              end;
  end;
  GenerateKey := success;
end;

procedure ConcatStem(str1,str2: LDMDICT_StemType;
                     var str: LDMDICT_StemType);
{
  Concatenates two stems.
}
var string1, string2: STRING_String;
    len: integer;
begin
  String_Constant(string1, str1, LDMDICT_MaxStem);
  String_Trim(string1, string1);
  String_AppendChar(string1, string1, '_');
  String_Constant(string2, str2, LDMDICT_MaxStem);
  String_Trim(string2, string2);
  String_Append(string1, string2);
  String_ExtractChars(str, len, string1, 1, LDMDICT_MaxStem);
end;

function SearchTranslations(mkey: integer): boolean;
{
  Checks if any translation exists in this language
}
var 
  IldictBuffer: LIILDICT_RecordDef;
begin
  SearchTranslations := LIILDICT_GetGILDictAll(mkey, IldictBuffer);
end;

function SearchReferences(mkey: integer; OwnSkey: integer): boolean;
{ 
  Looks for relations between the specified mkey and an skey other than
  OwnSkey. Used by MkeyReferredTo, which is disabled at the moment.
}
var 
  IldictBuffer: LIILDICT_RecordDef;
  found: boolean;
begin
  found := false;
  if LIILDICT_GetGILDictAll(mkey, IldictBuffer)
  then begin
    if IldictBuffer.skey <> OwnSkey
    then found := true
    else begin
      if LIILDICT_GetNextGILDictAll(mkey, IldictBuffer)
      then found := true;
    end;
  end;
  SearchReferences := found;
end;

function MkeyReferredTo(mkey: integer; OwnSkey: integer): boolean;
{
  Searches every language for references to the specified mkey. This 
  function is called, when a (semi)idiom or meaning is removed. If a 
  relation is found, a warning is generated.
  This function is disabled, because of a new feature, which allowes the
  user to remove a (semi)idiom or meaning in the other language (the only
  modification that can be done in another language than the one selected).
  Not disabling this function would mean, that the process of the other
  language would try to call the 'home-process' of the selected language
  recursively.
}
label
  exit;
var 
  found: boolean;
  l: MB_LanguageType;
begin
  found := false;
  goto exit; { disabled to enable removing items in another language }
  for l := lower(MB_LanguageType) to upper(MB_LanguageType) 
  do begin
    if l = CurrentLanguage
    then found := SearchReferences(mkey, OwnSkey)
    else begin
      LexedControlMessage.action := SearchTranslation;
      LexedControlMessage.TargetLanguage := l;
      LexedControlMessage.mkey := mkey;
      MB_Put(mbxlexedcontrol, LexedControlMessage);
      MB_Take(mbxlexed, LexedMessage);
      found := LexedMessage.TranslationFound;
    end;
    if found then goto exit;
  end;
exit:
  MkeyReferredTo := found;
end;

procedure CountSemiIdioms(var n: integer);
{
  count semi-idioms in database
}
begin
  LISIDDICT_SetIndex(1);
  LISIDDICT_Reset;
  n := 0;
  while LISIDDICT_GetNextSiddict(SiddictBuffer)
  do n := n+1;
end;

procedure CountIdioms(var n: integer);
{
  count idioms in database
}
begin
  LIIDDICT_SetIndex(1);
  LIIDDICT_Reset;
  n := 0;
  while LIIDDICT_GetNextIddict(IddictBuffer)
  do n := n+1;
end;

procedure Statistics;
{ 
  sub-menu with statistical operations on database.
}
var
  MenuOptions: array[1..2] of STRING_String :=
  [ 1: 'Number of semi idioms';
    2: 'Number of idioms'];
  choice: integer;
  n: integer;
  NStr: packed array[1..5] of char;
  NLen: integer;
  message: STRING_String;
begin
  choice := 1;
  MenuChoice(2, MenuOptions, center, choice);
  case choice of
    0: ;
    1: begin
         CountSemiIdioms(n);
         STR_IntegerToStr(n, NStr, Nlen); 
         message := 'Number of semi idioms: ';
         STRING_AppendChars(message, message, NStr, NLen);
         GiveMessage(message);
       end;
    2: begin
         CountIdioms(n); 
         STR_IntegerToStr(n, NStr, Nlen); 
         message := 'Number of idioms: ';
         STRING_AppendChars(message, message, NStr, NLen);
         GiveMessage(message);
       end;
  end;
end;

type
  EditorModeEnum = (ViewLemmaMode, EditLemmaMode, ShowTranslationMode, 
                    SelectSkeyMode, SelectMkeyMode);

{
  The following forward declarations are calling and called by the
  procedure EditLemma.
}

procedure EditSelectedLemmas(NumberSelectedKeys: integer;
                             SelectedKeys: array[lb..ub:integer] of integer;
                             SelectionStem: STRING_String;
                             EditorMode: EditorModeEnum;
                             var KeySelected: boolean;
                             var SelectedKey: integer); forward;

procedure ShowTranslations(mkey: integer; ExceptKey: integer); forward;

function SelectLemma(EditorMode: EditorModeEnum;
                     var SelectedKey: integer): boolean; forward;

function SelectLemmaWithStem(EditorMode: EditorModeEnum;
                             stem: STRING_String;
                             cat: LIDOMAINT_SyntCat;
                             var SelectedKey: integer): boolean; forward;

PROCEDURE EditLemma(LemmaKey: integer;
                    SelectionStem: STRING_String; 
                    EditorMode: EditorModeEnum;
                    var PressedKey : integer;
                    var KeySelected: boolean;
                    var SelectedKey: integer;
                    LemmaNr : integer; { number of lemma }
                    NrLemmas: integer  { total number of lemmas } );
{
  Displays lemma on screen and enables user to modify it. This is the
  most important procedure of Lexed.

  arguments:

  LemmaKey     : Skey of selected lemma.
  SelectionStem: Stem which was supplied by user. This argument is added, 
                 because some lemmas share the same skey. In these cases only
                 the first lemma was found. Now a search is done, until the
                 original user supplied stem was found.
  EditorMode   : Specifies which actions are allowed.
  PressedKey   : Key which is used to leave the lemma. This often determines
                 the next action to be taken by the calling procedure.
  KeySelected  : Indicates that a key is selected.
  SelectedKey  : When EditorMode is SelectSkeyMode or SelectMkeyMode this
                 argument contains the selected skey or mkey.
  LemmaNr      : Number of the selected lemma.
  NrLemmas     : Total number of selected lemmas.
}
label
  EXIT;

const
   MaxSemiIdioms         = 50;
   MaxIdioms             = 50;
   MaxIdiomMkeys         = 5;
   MaxMeanings           = 50;
   MaxNrCommentLines     = 20; { = ScreenHeight-2 }
   MaxParticles          = 50;

type 
   { enumeration of the various parts of a lemma }
   LemmaPartEnum = (mdictpart, sdictpart, particlepart, siddictpart, 
                    iddictpart, ildictpart, blexpart);

var 
  { general information about the lemma parts }
  LemmaPartData: array[LemmaPartEnum] of 
    record
      startline : integer;
      endline   : integer;
      exist     : boolean;
      modified  : boolean;
    end;

  { specific information concerning mdict part }
  MdictPartDescr: 
    record
      stem : LDMDICT_StemType;
      kind : INTERFACE1_KeyType;
      CC   : LIMORFDEF_ContextConds;
      FON  : LIMORFDEF_pPhonInfo;
      where: LDMDICT_WhereType;
      KEY  : INTEGER;
      StemLength: integer;
      StemModified: boolean;
    end;

  { specific information concerning sdict part }
  SdictPartDescr: LISDICT_RecordDef;

  { specific information concerning particle part. It contains of the related
    particles. The user is only allowed to assign new particles. The resulting
    modifications do not influence the current lemma, so no fields like
    'modified' are needed. The stem of each particle is included in the 
    datastructure to allow sorting in the future. }
  ParticlePartDescr: 
    record
      nr: integer;
      particles: array[1..MaxParticles] of 
        record
          key: integer;
          stem: STRING_String;
        end;
    end;

  { specific information concerning siddict part }
  SiddictPartDescr: 
    record
      nr: integer;
      FirstAdded: integer; { always add after last element }
      sids: array [1..MaxSemiIdioms] of 
        record 
          sid: LISIDDICT_RecordDef;
          modified: boolean; { only LISIDDICT_RecordDef }
          removed : boolean;
          StartArg: integer;
          EndArg  : integer;
          ArgStem : STRING_String;
          ArgPresent: boolean;
          ArgnrPresent: boolean;
          mkey        : LIILDICT_RecordDef;
          oldmkey     : LIILDICT_RecordDef;
          MkeyModified: boolean; { only LIILDICT_RecordDef }
          NrComments  : integer;
          Comments    : array[1..MaxNrCommentLines] of STRING_String;
          CommentsModified: boolean;
        end;
    end;

  { specific information concerning iddict part }
  IddictPartDescr : 
    record
      nr: integer;
      FirstAdded: integer; { always add after last element }
      ids: array [1..MaxIdioms] of record 
        idiom : LIIDDICT_RecordDef;
        modified: boolean; { only LIIDDICT_RecordDef }
        removed : boolean;
        ArgsModified: boolean;
        PatternModified: boolean;
        argpos: array[1..LIIDDICT_MaxIdArgs] of 
          record
            startx: integer;
            endx  : integer;
            ArgStem : STRING_String;
          end;
        ArgPresent: boolean;
        PatternPresent: boolean;
        nrmkeys: integer;
        mkeys: array[1..MaxIdiomMkeys] of LIILDICT_RecordDef;
        oldmkeys: array[1..MaxIdiomMkeys] of LIILDICT_RecordDef;
        MkeyModified: array[1..MaxIdiomMkeys] of boolean;
        NrComments  : integer;
        Comments    : array[1..MaxNrCommentLines] of STRING_String;
        CommentsModified: boolean;
      end;
    end;   

  { specific information concerning ildict part }
  IldictPartDescr : 
    record
      nr: integer;
      FirstAdded: integer; { always add after last element }
      meanings: array[1..MaxMeanings] of 
        record 
          m: LIILDICT_RecordDef;
          oldm: LIILDICT_RecordDef;
          modified: boolean;
          removed : boolean;
          DescrPresent: boolean;
          NrComments  : integer;
          Comments    : array[1..MaxNrCommentLines] of STRING_String;
          CommentsModified: boolean;
        end;
    end; 

  { specific information concerning blex part }
  BlexPartDescr   : LISTREE_pStree;

  { specific information concerning comment part }
  CommentPartDescr: 
    record
      NrComments: integer;
      Comments  : array[1..MaxNrCommentLines] of STRING_String;
      modified  : boolean;
    end;

VAR
   EmptyWindow,
   StemWindow, 
   LemmaWindow     : WINDOWS_Window;

   EmptyViewport,
   StemViewPort,
   LemmaViewPort,
   ViewPort        : WINDOWS_ViewPort;

   CommentLine, 
   CurrentAction,       { e.g. "Select Meaning" }
   KeyString,           { string related to numeric key }
   OriginalStem,        { stem of original mdict record. The stem in 
                          MdictPartDescr can differ from this one, e.g. in 
                          case of a particle }
   stem            : STRING_string;
 
   skey, 
   len,
   i,j,k,
   StemWindowXpos,
   LemmaWindowYPos,
   LemmaWindowXPos,
   ScreenPos,           { position of viewport w.r.t. window }
   CursorPos,           { position of cursor w.r.t. viewport }
   LemmaViewportHeight,
   CurrentActionLength, { length of current action description }
   ReturnKey,           { key pressed when leaving recursion e.g. fkeys) }
   NrFonLines,          { number of lines with fonetic info }
   NumberOfLines   : INTEGER;

   CursorInLemmaWindow,
   LemmaRemoved,
   ExitLoop,
   LemmaLocked,         { indicates that lemma has been locked for other users }
   EditingAllowed,      { indicated that the lemma can be modified }
   status,
   isvar           : BOOLEAN;

   StemComposed    : (NotComposed, ViaSdict, ViaBlex) := NotComposed;
                        { ViaSdict: particle relation, e.g. loop_af
                          ViaBlex : particle attribute; in english, Sdict is
                                    hardly used. While displaying the lemma,
                                    Lexed recognizes the particle attribute
                                    and modifies the stem accordingly }
   constraintsfile : FILES_Text;
   BlexRec         : LSDOMAINT_BlexStruct;
   t               : LDCONVREC_pAttrStruct;
   node            : LISTREE_pStree;
   kind            : INTERFACE1_keytype := BAStype;
   CC              : LIMORFDEF_ContextConds;
   FON             : LIMORFDEF_pPhonInfo;
   lsfon           : LSPHONDEF_pPhonInfo;
   where           : LDMDICT_WhereType;
   part            : LemmaPartEnum;
   IdiomPattern    : LSDOMAINT_SynPatternType;
   StackPtr        : MEM_StackPtr;
   DummyString     : packed array[1..40] of char;
   SdictBuffer     : LISDICT_RecordDef;
   SiddictBuffer   : LISIDDICT_RecordDef;
   IddictBuffer    : LIIDDICT_RecordDef;
   IldictBuffer    : LIILDICT_RecordDef;

   PROCEDURE ClearScreen;
   { displays empty window over LemmaWindow }
   begin
     WINDOWS_OpenWindow(EmptyWindow,' ',0,25,80);
     WINDOWS_ClearWindow(EmptyWindow);
     WINDOWS_OpenViewPort(EmptyViewport, dev, EmptyWindow, 1, 1);
   end;
     
   PROCEDURE RepaintScreen;
   { close empty window }
   begin
     WINDOWS_CloseViewport(EmptyViewport);
     WINDOWS_CloseWindow(EmptyWindow);
   end;


   PROCEDURE EditLemmaInit;
   var p: LemmaPartEnum;
   begin
     for p := mdictpart to blexpart do begin
       LemmaPartData[p].startline := 0;
       LemmaPartData[p].endline := 0;
       LemmaPartData[p].exist := false;
       LemmaPartData[p].modified := false;
     end;
     LemmaRemoved := false;
     KeySelected := false;
     ParticlePartDescr.nr := 0;
     SiddictPartDescr.nr := 0;
     IddictPartDescr.nr := 0;
     IldictPartDescr.nr := 0;
     SiddictPartDescr.FirstAdded := 0; { after reading := nr+1 }
     IddictPartDescr.FirstAdded := 0;  { after reading := nr+1 }
     IldictPartDescr.FirstAdded := 0;  { after reading := nr+1 }
     WINDOWS_OpenWINDOW(StemWindow, ' ', 0, 1, 80);
     WINDOWS_OpenWINDOW(LemmaWindow, ' ', 0, 150, 160);
     WINDOWS_NewHelpWindow(LemmaWindow, EditLemmaHelpWindow, dev, 1, 1);
     WINDOWS_NewHelpWindow(StemWindow, EditLemmaHelpWindow, dev, 1, 1);
     SelectedKey := 0;
   end;
   
   PROCEDURE EditLemmaEnd;
   begin
     LDMDICT_Release;
     LISIDDICT_Release;
     LIIDDICT_Release;
     LIILDICT_Release;
     LDBLEX_Release;
     LISDICT_Release;
     LISCOMMENT_Release;
     LIMCOMMENT_Release;
     STRTOKEY_Release;
     STRTOMKEY_Release;
     WINDOWS_CloseViewPort(StemViewPort);
     WINDOWS_CloseViewPort(ViewPort);
     WINDOWS_CloseWINDOW(StemWindow);
     WINDOWS_CloseWINDOW(LemmaWindow);
   end;

  function GetStem(skey: integer; 
                   var ResultStem: STRING_String): boolean;
  {
    Finds stem related to specified skey. If it appears to be a particle
    word, the stem is composed from the stems of the phonetic key and the
    particle.
  }
  var success: boolean;
      SdictBuffer: LISDICT_RecordDef;
      ContextStem: STRING_String;
  begin
    success := false;
    if LISDICT_GetGSDict(skey, SdictBuffer)
    then begin
      if LDMDICT_GetGMDict(ResultStem,kind,CC,FON,where,SdictBuffer.fkey) and
         LDMDICT_GetGMDict(ContextStem,kind,CC,FON,where,SdictBuffer.ctxt[1]) 
      then begin
        String_AppendChar(ResultStem, ResultStem, '_');
        STRING_Append(ResultStem, ContextStem);
        success := true;
      end;
    end
    else
      if LDMDICT_GetGMDict(ResultStem,kind,CC,FON,where,skey)
      then begin
        success := true;
      end;
    GetStem := success;
  end;

function CheckCategory(cat: LIDOMAINT_SyntCat): boolean;
{
  Checks if category of current lemma is equal to a specific category.
}
begin
  if not LemmaPartData[Blexpart].exist
  then CheckCategory := false
  else CheckCategory := (BlexPartDescr^.cat = cat);
end;

function RefindMdict(OriginalStem: STRING_String;
                     key : integer;
                     var kind: INTERFACE1_keytype;
                     var CC  : LIMORFDEF_ContextConds;
                     var FON : LIMORFDEF_pPhonInfo;
                     var where: LDMDICT_WhereType): boolean;
var success: boolean;
    stem: STRING_String;
    ExitLoop: boolean;
begin
  kind := BAStype;
  if LDMDICT_GetGMdict(stem, kind, CC, FON, where, key)
  then begin
    ExitLoop := false;
    while not ExitLoop
    do begin
      if STRING_Compare(OriginalStem, stem) <> 0
      then begin { stems are not equal, search next record }
        if not LDMDICT_GetNextGMdict(stem, kind, CC, FON, where, key)
        then begin { no record found with same key and same stem }
          success := false;
          ExitLoop := true;
        end;
      end
      else begin { stems are equal: search successfull }
        ExitLoop := true;
        Success := true;
      end;
    end;
  end
  else success := false; { no record found }
  RefindMdict := success;
end;

FUNCTION FromScreen(Window: WINDOWS_Window;
                    VAR t  : LDCONVREC_pAttrStruct;
                    StartLine: integer;
                    NumberOfLines: INTEGER): BOOLEAN;
{
  Reads attribute values from the screen and checks for syntactic errors.
}
VAR
   ch         : CHAR;
   cc,
   rownr      : INTEGER;
   line       : String_String;
   correct,
   EndOfScreen: BOOLEAN;

   PROCEDURE GetChar;
   BEGIN
      IF cc > WindowWidth THEN BEGIN
	 IF rownr < NumberOfLines THEN BEGIN
	    rownr := rownr+1; cc := 0;
	    Windows_ReadLineFromDisplay(Window, line, rownr);
	    cc := cc+1; String_ExtractChar(ch, line, cc);
	    END
	 ELSE BEGIN
	    ch := ' ';         
	    EndOfScreen := TRUE
	 END;
	 END
      ELSE BEGIN
	 cc := cc+1; String_ExtractChar(ch, line, cc);
      END;
   END {GetChar};


   PROCEDURE SkipSpaces;
   BEGIN
      WHILE (ch = ' ') AND (NOT EndOfScreen) DO GetChar;
   END {SkipSpaces};


   PROCEDURE ReadString(VAR s: PACKED ARRAY[lb1..ub1: INTEGER] OF CHAR;
                        VAR l: INTEGER;
                        VAR c: BOOLEAN);
   BEGIN
     l := 0;
     WHILE ch in ['a'..'z', 'A'..'Z', '0'..'9', '_'] DO BEGIN
        l := l+1; s[l] := ch;
        GetChar
     END;
     correct := l > 0;
     SkipSpaces
   END {ReadString};


   PROCEDURE Pass1;
   VAR
      attrname,
      attrvalue : LDCONVREC_Str;
      len       : INTEGER;
   BEGIN
      SkipSpaces;
      WHILE (NOT EndOfScreen) AND correct DO BEGIN
	 ReadString(attrname, len, correct);
	 IF (ch <> ':' ) THEN BEGIN
	    correct := FALSE;
	    END
	 ELSE BEGIN
	    GetChar; SkipSpaces;
	    IF ch = '[' THEN BEGIN
	       GetChar; SkipSpaces;
	       IF ch <> ']' THEN BEGIN
                  REPEAT
		     ReadString(attrvalue, len, correct);
		  UNTIL (ch = ']') OR NOT correct;
                  IF correct THEN BEGIN
                     GetChar; SkipSpaces;
                  END
		  END
	       ELSE BEGIN
		  GetChar; SkipSpaces
	       END;
	       END
	    ELSE BEGIN
	       ReadString(attrvalue, len, correct)
	    END
	 END;
	 IF NOT correct THEN Error_Write(Error_IncorrectNode);
      END;
   END {Pass1};


   PROCEDURE Pass2;

      FUNCTION MakeAttr(a: LDCONVREC_pAttrStruct): LDCONVREC_pAttrStruct;
         VAR h: LDCONVREC_pAttrStruct;
      BEGIN
         Mem_NewDefault(SIZE(LDCONVREC_AttrStruct), h::Mem_ptr);
         WITH h^ DO BEGIN
            SetValue := NIL;
            NextAttr := a
         END;
         MakeAttr := h
      END {MakeAttr};

      FUNCTION MakeSetElt(a: LDCONVREC_pSetValueType): LDCONVREC_pSetValueType;
         VAR h: LDCONVREC_pSetValueType;
      BEGIN
         Mem_NewDefault(SIZE(LDCONVREC_SetValueType), h::Mem_ptr);
         WITH h^ DO BEGIN
            NextValue := a;
         END;
         MakeSetElt := h
      END {MakeSetElt};

   BEGIN
      t := NIL;
      SkipSpaces;
      WHILE NOT EndOfScreen DO BEGIN
         t := MakeAttr(t);
	 ReadString(t^.fieldname.str, t^.fieldname.len, correct);
         GetChar; SkipSpaces;
	 IF ch = '[' THEN BEGIN
	    GetChar; SkipSpaces;
	    IF ch <> ']' THEN BEGIN
               REPEAT
                  t^.setvalue := MakeSetElt(t^.setvalue);
	          ReadString(t^.setvalue^.eltvalue.str, 
                             t^.setvalue^.eltvalue.len, correct);
	       UNTIL (ch = ']');
               GetChar; SkipSpaces;
	       END
	    ELSE BEGIN
	       GetChar; SkipSpaces
	    END;
	    END
	 ELSE BEGIN
	    ReadString(t^.fieldvalue.str, t^.fieldvalue.len, correct)
	 END;
      END;
   END {Pass2};

BEGIN
   EndOfScreen := FALSE; cc := WindowWidth+1; ch := ' ';
   rownr := StartLine-1; { first line is skipped }
   correct := TRUE;

   Pass1;

   IF correct THEN BEGIN 
      EndOfScreen := FALSE; cc := WindowWidth+1; ch := ' ';
      rownr := StartLine-1; { first line is skipped }
      Pass2
   END;

   FromScreen := correct

END {FromScreen};


PROCEDURE ToScreen(Window: Windows_Window;
                   t  : LDCONVREC_pAttrStruct;
                   VAR NumberOfLines: INTEGER);
{ 
  Displays attribute values on the screen.
}
VAR
   savet    : LDCONVREC_pAttrStruct;
   s        : LDCONVREC_pSetValueType;
   DummyKey : integer;
   DummyStem: STRING_String;
BEGIN

   savet := t;
   IF t <> NIL THEN BEGIN
      WHILE ( t <> NIL ) AND ( NumberOfLines < WindowLength ) DO BEGIN
         WINDOWS_WriteStr(Window, t^.Fieldname.Str, t^.Fieldname.Len,
                          MaxFieldNameLength, TRUE);
         WINDOWS_WriteStr(Window, ' : ', 3, 3, TRUE);
         IF t^.Typeindicator = EnumSet THEN BEGIN
            WINDOWS_WriteStr(Window, '[ ', 2, 2, TRUE);
            s := t^.SetValue;
            WHILE s <> NIL DO BEGIN
               IF (( WINDOWS_Column(Window) + s^.EltValue.len + 2 ) 
                  > WindowWidth) THEN BEGIN
                  WINDOWS_WriteLine(Window, TRUE);
                  NumberOfLines := NumberOfLines + 1;
                  WINDOWS_NewRowColumn(Window, NumberOfLines, 
                                       Maxfieldnamelength + 6);
               END;
               WINDOWS_WriteStr(Window, s^.EltValue.Str, s^.EltValue.Len, 
                                S^.EltValue.Len+1, TRUE);
               s := s^.NextValue
            END;
            WINDOWS_WriteChar(Window, ']');
            END 
         ELSE BEGIN
            WINDOWS_WriteStr(Window, t^.FieldValue.Str, t^.FieldValue.Len,
                             t^.FieldValue.Len, TRUE);
            if t^.FieldName.str = 'particle'
            then begin
              if Str_StrToInteger(t^.FieldValue.Str, t^.FieldValue.Len, DummyKey) 
              then
                if (DummyKey <> 0) and 
                   GetStem(DummyKey, DummyStem) and
                   not (StemComposed = ViaSdict)
                then begin
                  ConcatStem(MdictPartDescr.stem, DummyStem, MdictPartDescr.stem);
                  StemComposed := ViaBlex;
                end;
            end;
         END;
         WINDOWS_WriteLine(Window, TRUE); 
         t := t^.NextAttr;
         NumberOfLines := NumberOfLines + 1;
      END;
      END
   ELSE BEGIN
   END;      
END {ToScreen};


PROCEDURE ToFile(Dev: WINDOWS_Device;
                 t  : LDCONVREC_pAttrStruct);
{ 
  Writes attribute values to file. Not used at the moment
}
VAR
   savet    : LDCONVREC_pAttrStruct;
   s        : LDCONVREC_pSetValueType;
   Window   : WINDOWS_Window;
   ViewPort : WINDOWS_ViewPort;
   DumKey   : INTEGER;
   FileName    : FILES_NameBuffer;
   FileNameLen : INTEGER;
   f           : FILES_Text;
   NumberOfLines : INTEGER;

BEGIN

   WINDOWS_OpenWindow(Window, ' ', 1, 3, 70);
   WINDOWS_ClearWindow(Window);
   WINDOWS_NewRowColumn(Window, 2, 2);
   WINDOWS_WriteStr(Window, 'Enter filename : ', WINDOWS_MaxIO, 0, TRUE);
   WINDOWS_NewRowColumn(Window, 2, 19);
   WINDOWS_OpenViewPort(ViewPort, Dev, Window, 1, 1);
   WINDOWS_ReadStr(Window, FileName, FileNameLen);
   WINDOWS_Readkey(Window, DumKey);

   FILES_Open(f, FileName, FileNameLen, 3);

   IF NOT FILES_Done THEN BEGIN
{
      ERROR_Write(ERROR_ErrorInFileName)
}
      END
   ELSE BEGIN

      NumberOfLines := 0;
      savet := t;
      IF t <> NIL THEN BEGIN
	 WHILE ( t <> NIL ) DO BEGIN
	    NumberOfLines := NumberOfLines + 1;
	    FILES_WriteStr(f, t^.Fieldname.Str, t^.Fieldname.Len,
			     MaxFieldNameLength, TRUE);
	    FILES_WriteStr(f, ' : ', 3, 3, TRUE);
	    IF t^.Typeindicator = EnumSet THEN BEGIN
	       FILES_WriteStr(f, '[ ', 2, 2, TRUE);
	       s := t^.SetValue;
	       WHILE s <> NIL DO BEGIN
		  IF (( FILES_Position(f) + s^.EltValue.len + 2 ) 
		     > WindowWidth) THEN BEGIN
		     FILES_WriteLine(f, TRUE);
		     NumberOfLines := NumberOfLines + 1;
		     FILES_WriteSpace(f, Maxfieldnamelength + 6);
		  END;
		  FILES_WriteStr(f, s^.EltValue.Str, s^.EltValue.Len, 
				   S^.EltValue.Len+1, TRUE);
		  s := s^.NextValue
	       END;
	       FILES_WriteChar(f, ']');
	       END 
	    ELSE BEGIN
	       FILES_WriteStr(f, t^.FieldValue.Str, t^.FieldValue.Len,
				t^.FieldValue.Len, TRUE);
	    END;
	    FILES_WriteLine(f, TRUE);
	    t := t^.NextAttr
	 END;
	 END
      ELSE BEGIN
      END;      
      FILES_Close(f)
   END;

   WINDOWS_CloseViewport(Viewport);
   WINDOWS_CloseWindow(Window);

END {ToFile};

  function SomethingModified: boolean;
  { 
    Checks for modifications in lemma
  }
  begin
    SomethingModified := 
      (LemmaPartData[mdictpart].exist and LemmaPartData[mdictpart].modified) 
      or
      (LemmaPartData[sdictpart].exist and LemmaPartData[sdictpart].modified) 
      or
      (LemmaPartData[siddictpart].exist and LemmaPartData[siddictpart].modified) 
      or
      (LemmaPartData[iddictpart].exist and LemmaPartData[iddictpart].modified) 
      or
      (LemmaPartData[ildictpart].exist and LemmaPartData[ildictpart].modified) 
      or
      (LemmaPartData[blexpart].exist and LemmaPartData[blexpart].modified)
      or
      (CommentPartDescr.modified)
      or
      (LemmaRemoved);
  end;

  function ExitLemma: boolean;
  { 
    Specifies the conditions for leaving a lemma
  }
  begin
    ExitLemma := 
      (PressedKey = WINDOWS_EndOfLineKey) or
      ( KeySelected and
        ( (EditorMode = SelectSkeyMode) or
          (EditorMode = SelectMkeyMode)
        ) 
      ) or
      (PressedKey = WINDOWS_F11Key) or
      (PressedKey = WINDOWS_F12Key) or
      (PressedKey = WINDOWS_F13Key);
  end;

   PROCEDURE SeparateParts(NextPart: LemmaPartEnum);
   {
     Separates lemmas on screen
   }
   begin
     WINDOWS_WriteStr(LemmaWindow, 
'------------------------------------------------------------',
     60, 61, true);
     case NextPart of
     sdictpart   : WINDOWS_WriteString(LemmaWindow,'phonetical info',15,true);
     particlepart: WINDOWS_WriteString(LemmaWindow,'particles',15,true);
     siddictpart : WINDOWS_WriteString(LemmaWindow,'semi idioms',15,true);
     iddictpart  : WINDOWS_WriteString(LemmaWindow,'idioms',15,true);
     ildictpart  : WINDOWS_WriteString(LemmaWindow,'meanings',15,true);
     blexpart    : WINDOWS_WriteString(LemmaWindow,'attributes',15,true);
     end;
     WINDOWS_WriteLine(LemmaWindow, true);
     NumberOfLines := NumberOfLines+1;
   end;

  function FindLemmaPart(var LemmaPart: LemmaPartEnum): boolean;
  {
    Determines in which part of the lemma the cursor is positioned.
  }
  var p: LemmaPartEnum;
      found: boolean;
  begin
    { algorithm could be more efficient !!! }
    found := false;
    for p := mdictpart to blexpart do begin
      if (LemmaPartData[p].startline <= LemmaWindowYPos) and
         (LemmaPartData[p].endline >= LemmaWindowYPos)
      then begin
        found := true;
        LemmaPart := p;
      end;
    end;
    FindLemmaPart := found;
  end;

  procedure CommentKey;
  var LemmaPart: LemmaPartEnum;
      RelLine  : integer; { line number relative to start of lemma part }
      mkey     : integer; { meaning to be translated }
      w        : WINDOWS_Window;
      v        : WINDOWS_Viewport;
      i        : integer;
      key      : integer;
      CommentsXPos,
      CommentsYPos: integer;

    procedure show(NrComments: integer; 
                   Comments: array[lb..ub:integer] of STRING_String);
    {
      Shows commentlines on screen.
    }
    begin
      WINDOWS_ClearWindow(w);
      WINDOWS_WriteStr(w, 
'--------------------------------------------------------------------------------',
      80, 80, true);
      WINDOWS_WriteLine(w, true);
      for i := 1 to NrComments do begin
        WINDOWS_WriteString(w, Comments[i], 80, TRUE);
        WINDOWS_WriteLine(w, true);
      end;
      WINDOWS_WriteStr(w, 
'--------------------------------------------------------------------------------',
      80, 80, true);
      WINDOWS_WriteLine(w, true);
      CommentsXPos := 1;
      if NrComments > 0
      then CommentsYpos := 2
      else CommentsYpos := 1; { on dotted line: only allowed insert key }
      WINDOWS_NewRowColumn(w, CommentsYpos, CommentsXPos);
    end;
  
  procedure EditComments(GeneralComment: boolean;
                         var Comments: array[lb..ub: integer] of STRING_String;
                         var DefNrLines: integer;
                         var DefModified: boolean);
  {
    Allowes user to modify commentlines. Modifications are confirmed with
    the return-key. When leaving with F11 (escape) all modifications are lost.
  }
  var
    confirmed: boolean;
    NrLines  : integer;
    Modified : boolean;
  begin
    NrLines := DefNrLines;
    WINDOWS_OpenWindow(w, ' ', 0, 100, 132);
    Show(NrLines, Comments);
    WINDOWS_CreateViewport(w, v, dev, 1, 1, ScreenHeight, 80);
    WINDOWS_OpenViewport(v, dev, w, 3, 1);
    if (EditorMode = EditLemmaMode) and
       (not ViewMode)
    then begin
      Modified := false;
      repeat
        WINDOWS_ReadKey(w, key); 
        case key of 
          WINDOWS_PrevScreenKey: 
            if NrLines > 0 then CommentsYPos := 2; { = first commentline }
          WINDOWS_NextScreenKey:
            if NrLines > 0 then CommentsYPos := NrLines+1; { = last commentline }
          WINDOWS_UpArrowKey:
            if CommentsYPos > 1 then CommentsYPos := CommentsYPos - 1;
          WINDOWS_DownArrowKey:
            if CommentsYPos < NrLines+1 then CommentsYPos := CommentsYPos + 1;
          WINDOWS_LeftArrowKey:
            if CommentsXPos > 1 then CommentsXPos := CommentsXPos - 1;
          WINDOWS_RightArrowKey:
            if CommentsXPos < 80 then CommentsXPos := CommentsXPos + 1;
          WINDOWS_DelKey:
            if (CommentsYpos > 1) and (CommentsYpos <= NrLines + 1) and
               (CommentsXpos > 1)
            then begin
              WINDOWS_DeleteInLine(w, CommentsYpos, CommentsXpos-1, 1);
              CommentsXpos := CommentsXpos-1;
              modified := true;
            end;
          WINDOWS_InsertHereKey: 
            if NrLines < MaxNrCommentLines
            then begin
              WINDOWS_InsertLines(w, CommentsYPos+1,1);
              CommentsYpos := CommentsYPos+1;
              CommentsXpos := 1;
              modified := true;
              NrLines := NrLines+1;
            end;
          WINDOWS_RemoveKey:
            if CommentsYpos > 1 then
            begin
              WINDOWS_DeleteLines(w, CommentsYPos,1);
              modified := true;
              NrLines := NrLines-1;
              if NrLines = 0 then CommentsYpos := 1
              else
                if CommentsYpos = NrLines+2 { when last line removed }
                then CommentsYpos := CommentsYpos-1;
            end;
          WINDOWS_EndOfLineKey:
            begin
              confirmed := true;
              DefNrLines := NrLines;
              if modified
              then DefModified := true; { otherwise: don't change value, because
                                          actual parameter could be true already! }
            end;
          WINDOWS_F11Key:
            begin
              confirmed := false;
            end;
          otherwise 
            if WINDOWS_IsPrintableChar(key)
            then begin
              if (CommentsYpos > 1) and (CommentsYpos <= NrLines + 1) and
                 (CommentsXpos < 80)
              then begin
                WINDOWS_InsertInLine(w, CommentsYpos, CommentsXpos, 2); 
                  { 2 because of bug in windows! }
                WINDOWS_NewRowColumn(w, CommentsYPos, CommentsXPos);
                WINDOWS_WriteChar(w, chr(key));
                CommentsXpos := CommentsXPos + 1;
                modified := true;
              end;
            end;
        end;
        WINDOWS_NewRowColumn(w, CommentsYPos, CommentsXPos);
      until (key = WINDOWS_EndOfLineKey) or
            (key = WINDOWS_F11Key);
      if Confirmed and Modified
      then begin
        for i := 1 to DefNrLines do 
          WINDOWS_ReadLineFromDisplay(w, Comments[i], i+1);
        { place comment marker: }
        if GeneralComment
        then begin
          WINDOWS_NewRowColumn(StemWindow, 1, MaxFieldnameLength+1);
          if DefNrLines > 0
          then WINDOWS_WriteChar(StemWindow, '*')
          else WINDOWS_WriteChar(StemWindow, ' ');
          if CursorInLemmaWindow
          then WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos)
          else WINDOWS_NewRowColumn(StemWindow, 1, StemWindowXPos);
        end 
        else begin
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, 
                               MaxFieldnameLength+1);
          if DefNrLines > 0
          then WINDOWS_WriteChar(LemmaWindow, '*')
          else WINDOWS_WriteChar(LemmaWindow, ' ');
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
        end;
      end
    end
    else WINDOWS_ReadKey(w, key); { wait for user pressing any key }
    WINDOWS_CloseViewport(v);
    WINDOWS_CloseWindow(w);
  end;

  procedure CommentKeyRest;
  {
    General comments on lemma (not specific to (semi)idiom or meaning).
  }
  begin
    with CommentPartDescr do EditComments(True, Comments, NrComments, Modified);
  end;

  procedure CommentKeySiddict;
  { 
    Comments specific to semi-idioms.
  }
  begin
    RelLine := LemmaWindowYPos - LemmaPartData[siddictpart].startline + 1;
    if (RelLine > 0) and (RelLine <= SiddictPartDescr.nr)
    then with siddictPartDescr.sids[RelLine] do begin
      EditComments(False, Comments, NrComments, CommentsModified);
      if CommentsModified
      then LemmaPartData[siddictpart].modified := true;
    end
    else CommentKeyRest;
  end;

  procedure CommentKeyIddict;
  { 
    Comments specific to idioms.
  }
  begin
    RelLine := LemmaWindowYPos - LemmaPartData[iddictpart].startline + 1;
    if (RelLine > 0) and (RelLine <= IddictPartDescr.nr)
    then with IddictPartDescr.ids[RelLine] do begin
      EditComments(False, Comments, NrComments, CommentsModified);
      if CommentsModified
      then LemmaPartData[iddictpart].modified := true;
    end
    else CommentKeyRest;
  end;

  procedure CommentKeyIldict;
  { 
    Comments specific to meanings.
  }
  begin
    RelLine := LemmaWindowYPos - LemmaPartData[ildictpart].startline + 1;
    if (RelLine > 0) and (RelLine <= IldictPartDescr.nr)
    then with IldictPartDescr.meanings[RelLine] do begin
      EditComments(False, Comments, NrComments, CommentsModified);
      if CommentsModified
      then LemmaPartData[ildictpart].modified := true;
    end
    else CommentKeyRest;
  end;

  begin
    if CursorInLemmaWindow
    then begin
      { find out which part of lemma }
      if FindLemmaPart(LemmaPart) 
      then begin
        case LemmaPart of 
          siddictpart: CommentKeySiddict;
          iddictpart : CommentKeyIddict;
          ildictpart : CommentKeyIldict;
          otherwise    CommentKeyRest;
        end;
      end
      else CommentKeyRest;
    end
    else CommentKeyRest; { CurrentWindow = StemWindow }
  end;

  procedure StemWindowKey; forward;

   PROCEDURE ScrollBackward(ScrollAmount: INTEGER);
   { 
     Scroll backward in lemma window. If already on top, go to stem window.
   }
   BEGIN
    if LemmaWindowYPos = 1
    then begin
      StemWindowXPos := LemmaWindowXPos;
      StemWindowKey { go to stem window = top line }
    end
    else begin 
      { always first to top of window }
      if (CursorPos > 1) and (CursorPos - ScrollAmount < 1)
      then ScrollAmount := CursorPos - 1;

      IF LemmaWindowYPos <= ScrollAmount
      then ScrollAmount := (LemmaWindowYPos - 1);
      LemmaWindowYPos := LemmaWindowYPos - ScrollAmount;
      if CursorPos - ScrollAmount < 1
      then begin
        WINDOWS_ScrollViewport(ViewPort, WINDOWS_Down, 
                               ScrollAmount-CursorPos+1);
        CursorPos := 1;
      end else 
        CursorPos := CursorPos - ScrollAmount;
      WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
    end;
   END {ScrollBackward};

   PROCEDURE ScrollForward(ScrollAmount: INTEGER);
   {
     Scroll forward in lemma window.
   }
   BEGIN
      { always first to bottom of window }
      if (CursorPos < ScreenHeight) and 
         (CursorPos + ScrollAmount > ScreenHeight)
      then ScrollAmount := (ScreenHeight - CursorPos);

      IF LemmaWindowYPos > ( NumberOfLines - ScrollAmount ) 
      then ScrollAmount := ( NumberOfLines - LemmaWindowYPos );

      LemmaWindowYPos := LemmaWindowYPos + ScrollAmount;
      if CursorPos + ScrollAmount > ScreenHeight
      then begin
        WINDOWS_ScrollViewport(ViewPort, WINDOWS_Up, 
                               CursorPos+ScrollAmount-ScreenHeight);
        CursorPos := ScreenHeight;
      end else 
        CursorPos := CursorPos + ScrollAmount;
      WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
   END {ScrollForward};


   PROCEDURE Left;
   { 
     move cursor to the left in lemma window.
   }
   BEGIN
      IF LemmaWindowXPos > 1 THEN BEGIN
         LemmaWindowXPos := LemmaWindowXPos-1;
         WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
         END
      ELSE BEGIN
         LemmaWindowXPos := WindowWidth;
         ScrollBackWard(1)
      END;
   END {Left};

   PROCEDURE Right;
   { 
     move cursor to the right in lemma window.
   }
   BEGIN
      IF LemmaWindowXPos < WindowWidth THEN BEGIN
         LemmaWindowXPos := LemmaWindowXPos+1;
         WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
         END
      ELSE BEGIN
         LemmaWindowXPos := 1;
         ScrollForward(1)
      END;
   END {Right};

   PROCEDURE DeleteChar;
   { 
     Delete character before cursor in lemma window.
   }
   BEGIN
      IF LemmaWindowXPos > 1 THEN BEGIN
         Windows_DeleteInLine(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos-1, 1);
         Left
      END;
   END {DeleteChar};

    procedure InsertEmptyLine;
    { 
      Inserts an empty line on the screen, when a newly added (semi)idiom,
      particle or meaning is completed. This empty line enables the user to 
      insert another item.
    }
    var DummyLemmaPart: LemmaPartEnum;
    begin
      WINDOWS_InsertLines(LemmaWindow, LemmaWindowYPos+1,1);
      NumberOfLines := NumberOfLines+1;
      LemmaWindowXPos := MaxFieldNameLength+2;
      if LemmaViewportHeight < ScreenHeight
      then begin
        LemmaViewportHeight := LemmaViewportHeight+1;
        WINDOWS_ChangeViewport(Viewport, 1, 1, LemmaViewportHeight, 80);
      end;
      ScrollForward(1);
      for DummyLemmaPart := mdictpart to blexpart do 
        if LemmaPartData[DummyLemmaPart].startline > LemmaWindowYPos
        then with LemmaPartData[DummyLemmaPart] do begin
          startline := startline + 1;
          endline := endline + 1;
        end;
    end;

  procedure ShowConstraintErrors;
  { 
    Lexed makes use of procedures, which are originally meant for batch
    processing. When checking for constraint violations, the messages are
    written to a file. This procedure reads this file again and shows the
    contents on the screen.
  }
  var 
    w: WINDOWS_Window;
    v: WINDOWS_Viewport;
    s: packed array[1..80] of char;
    l: FILES_IORange;
    key: integer;
  begin 
    WINDOWS_OpenWindow(w, ' ', 0, 100, 132);
    WINDOWS_CreateViewport(w, v, dev, 1, 1, ScreenHeight, 80);
    WINDOWS_OpenViewport(v, dev, w, 3, 1);
    FILES_Open(constraintsfile, 'constraints',11, 0);
    while not FILES_EndOfFile(constraintsfile) do begin
      FILES_ReadToEndOfLine(constraintsfile, s, l);
      WINDOWS_WriteStr(w, s, l, l, true);
      WINDOWS_WriteLine(w, true);
      FILES_SkipLine(constraintsfile);
    end;
    FILES_Close(constraintsfile);
    WINDOWS_ReadKey(w, key);
    WINDOWS_CloseViewport(v);
    WINDOWS_CloseWindow(w);
  end;

  function ReadIntegerFromWindow(w: WINDOWS_Window;
                                 var key: integer;
                                 var strkeystart: integer;
                                 var strkeylen: integer): boolean;
  { 
    Reads integer value only if surrounded by spaces.
    This function is used to process skeys in blex.
  }
  var success: boolean;
      line   : String_String;
      cc     : INTEGER;
      strkey : PACKED ARRAY [1..50] OF CHAR;
      stringkey : String_String;
      DumKey : INTEGER;
      ch     : CHAR;
  begin
    success := false;
    key     := 0;
    Windows_ReadLineFromDisplay(w, line, LemmaWindowYPos);
    cc := LemmaWindowXPos;
    String_ExtractChar(ch, line, cc);
    WHILE (cc > 1) AND (ch <> ' ') DO BEGIN
      cc := cc-1;
      String_ExtractChar(ch, line, cc);
    END;
    strkeystart := cc+1;
    ch := '@';
    strkeylen := 0; 
    WHILE (cc < WindowWidth) AND (ch <> ' ') DO BEGIN 
      cc := cc+1;
      String_ExtractChar(ch, line, cc);
      IF ch <> ' ' THEN BEGIN
        strkeylen := strkeylen+1;
        strkey[strkeylen] := ch
      END
    END;
    IF Str_StrToInteger(strkey, strkeylen, key) 
    THEN 
      ReadIntegerFromWindow := true
    ELSE
      ReadIntegerFromWindow := false;
  end;

  procedure ReferenceKey;
  {
    This procedure offers 2 options to the user:
      1. Find all semi-idioms with its argument equal to the current lemma.
      2. Find all idioms with an argument equal to the current lemma.
    For these options a sequential search through the whole database is
    necessary. This will take some time, so when the number of (semi)idioms
    will increase, a kind of cross-reference file table will be desirable.
  }
  const
   MaxSelectedKeys      = 50;
  var 
    { global: SelectedKey }
    SelectedKeys   : array[1..MaxSelectedKeys] of integer;
    NumberSelectedKeys: integer;
    LastSelectedKey: integer;
    ReferenceOptions: array[1..2] of STRING_String :=
     [1: 'Semi idioms';
      2: 'Idioms'];
    Choice: 0..2;
  begin
    choice := 1;
    MenuChoice(2, ReferenceOptions, center, choice);
    case choice of
    0: ;
    1: begin
         StartWait;
         LISIDDICT_SetIndex(1);
         LISIDDICT_Reset;
         NumberSelectedKeys := 0;
         LastSelectedKey := 0;
         while (NumberSelectedKeys < MaxSelectedKeys) and
               LISIDDICT_GetNextSiddict(SiddictBuffer)
         do begin
           if CheckSemiIdiomArgument(SiddictBuffer, LemmaKey) and
              (SiddictBuffer.skey <> LastSelectedKey)
           then begin
             NumberSelectedKeys := NumberSelectedKeys + 1;
             SelectedKeys[NumberSelectedKeys] := SiddictBuffer.skey;
             LastSelectedKey := SiddictBuffer.skey;
           end;
         end;
         StopWait;
         If NumberSelectedKeys = 0
         then GiveMessage('No semi idioms found with this argument. ')
         else begin
           { show (evt. edit) selected lemmas }
           ClearScreen;
           EditSelectedLemmas(NumberSelectedKeys, SelectedKeys, '',
                              EditorMode, KeySelected, SelectedKey);
           RepaintScreen;
         end;
       end;
    2: begin
         StartWait;
         LIIDDICT_SetIndex(1);
         LIIDDICT_Reset;
         NumberSelectedKeys := 0;
         LastSelectedKey := 0;
         while (NumberSelectedKeys < MaxSelectedKeys) and
               LIIDDICT_GetNextIddict(IddictBuffer)
         do begin
           if CheckIdiomArgument(IddictBuffer, LemmaKey) and
              (IddictBuffer.headkey <> LastSelectedKey)
           then begin
             NumberSelectedKeys := NumberSelectedKeys + 1;
             SelectedKeys[NumberSelectedKeys] := IddictBuffer.headkey;
             LastSelectedKey := IddictBuffer.headkey;
           end;
         end;
         StopWait;
         If NumberSelectedKeys = 0
         then GiveMessage('No idioms found with this argument. ')
         else begin
           { show (evt. edit) selected lemmas }
           ClearScreen;
           EditSelectedLemmas(NumberSelectedKeys, SelectedKeys, '',
                              EditorMode, KeySelected, SelectedKey);
           RepaintScreen;
         end;
       end;
    end; {case}

  end;

  procedure FindKey;
  { 
    When the Find-key is pressed while the cursor is on an argument of a 
    (semi)idiom, or a key value (particle and prepkey attributes), this 
    procedure will show the corresponding lemma. If the cursor is on an 
    asterisk ('*'), the system will show comments related to the current
    object.
  }
  var LemmaPart: LemmaPartEnum;
      RelLine  : integer; { line number relative to start of lemma part }

    procedure FindKeyParticles;
    begin
      RelLine := LemmaWindowYPos - LemmaPartData[particlepart].startline + 1;
      if (RelLine > 0) and (RelLine <= ParticlePartDescr.nr) 
      then with ParticlePartDescr.particles[RelLine] do begin
        ClearScreen;
        EditLemma(key, '',
                  EditorMode, ReturnKey, KeySelected, SelectedKey, 0, 0);
        RepaintScreen;
      end;
    end;

    procedure FindKeySiddict;
    begin
      RelLine := LemmaWindowYPos - LemmaPartData[siddictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= SiddictPartDescr.nr) 
      then with SiddictPartDescr.sids[RelLine] do begin
        if (LemmaWindowXPos = MaxFieldnameLength + 1) { cursor on '*' }
        then CommentKey;
        if (LemmaWindowXPos >= StartArg) and
           (LemmaWindowXPos <= EndArg) and
           ArgPresent { could be new inserted semi idiom }
        then begin { cursor on argument }
          ClearScreen;
          EditLemma(SiddictPartDescr.sids[RelLine].sid.arg, '',
                    EditorMode, ReturnKey, KeySelected, SelectedKey, 0, 0);
          RepaintScreen;
        end;
      end;
    end;

    procedure FindKeyIddict;
    var i: integer;
        found: boolean;
    begin
      RelLine := LemmaWindowYPos - LemmaPartData[iddictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= IddictPartDescr.nr)
      then with IddictPartDescr.ids[RelLine] do begin
         if LemmaWindowXPos = MaxFieldnameLength+1 { cursor on '*' }
         then CommentKey;
         if LemmaWindowXPos > MaxFieldnameLength+2 { cursor on argument }
         then begin
           found := false;
           i := 2; { head argument is hidden }
           while (i <= idiom.args.nrargs) and
                  not found do 
             if (LemmaWindowXPos>=argpos[i].startx)
                and
                (LemmaWindowXPos<=argpos[i].endx)
             then found := true
             else i := i+1;
           if found then begin
             ClearScreen;
             EditLemma(idiom.args.argkeys[i], '',
                       EditorMode, ReturnKey, KeySelected, SelectedKey, 0, 0);
             RepaintScreen;
           end;
        end;
      end;
    end;

    procedure FindKeyIldict;
    begin
      RelLine := LemmaWindowYPos - LemmaPartData[ildictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= IldictPartDescr.nr) 
      then with IldictPartDescr.meanings[RelLine] do begin
        if (LemmaWindowXPos = MaxFieldnameLength + 1) { cursor on '*' }
        then CommentKey;
      end;
    end;

    procedure FindKeyBlex;
    VAR
      key        : INTEGER;
      strkeystart: INTEGER;
      strkeylen  : INTEGER;
      stem       : STRING_String;
    begin
      if LemmaWindowXPos > MaxFieldnameLength + 3
      then begin
        IF ReadIntegerFromWindow(LemmaWindow, key, strkeystart, strkeylen)
        THEN BEGIN
          { try to interpret integer value as an skey }
          IF GetStem(key, stem)
          THEN BEGIN
            ClearScreen;
            EditLemma(key, '', EditorMode, ReturnKey, 
                      KeySelected, SelectedKey, 0, 0);
            RepaintScreen;
          END
          ELSE GiveMessage('No lemma found for this key. ');
        END
        ELSE GiveMessage('No integer value. ');
      end;
    end;

  begin
    { find out which part of lemma }
    if FindLemmaPart(LemmaPart) then
    case LemmaPart of
      particlepart: FindKeyParticles;
      siddictpart : FindKeySiddict;
      iddictpart  : FindKeyIddict;
      ildictpart  : FindKeyIldict;
      blexpart    : FindKeyBlex; { e.g. find particle or prepkey }
      otherwise ;
    end;
  end;

  procedure ShowMkey;
  {
    Shows mkey-string of (semi)idiom or meaning at cursor position on screen
    and writes this string to a file.
  }
  var LemmaPart: LemmaPartEnum;
      RelLine  : integer; { line number relative to start of lemma part }
      mkey     : integer; { meaning to be translated }

    procedure ShowMeaning(mkey: integer);
    var KeyString: STRING_String;
    begin
        if STRTOMKEY_GetMkeyStr(mkey, KeyString)
        then begin
          GiveMessage(KeyString);
          FILES_WriteString(keynotefile, KeyString, STRING_Length(KeyString)+1,
                            true);
          FILES_WriteLine(keynotefile, true);
        end
        else GiveMessage('Key string not found. ');
    end;

  procedure ShowMkeySiddict;
  begin 
    with SiddictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[siddictpart].startline + 1;
      IF (RelLine > 0) and (RelLine <= nr)
      then begin
        mkey := sids[RelLine].mkey.mkey;
        if mkey = 0
        then GiveMessage('No mkey assigned yet. ')
        else ShowMeaning(mkey);
      end;
    end;
  end;

  procedure ShowMkeyIddict;
  begin
    with IddictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[iddictpart].startline + 1;
      IF (RelLine > 0) and (RelLine <= nr)
      then begin
        mkey := ids[RelLine].mkeys[1].mkey;
        if mkey = 0
        then GiveMessage('No mkey assigned yet. ')
        else ShowMeaning(mkey);
      end;
    end;
  end;

  procedure ShowMkeyIldict;
  begin
    with IldictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[ildictpart].startline + 1;
      IF (RelLine > 0) and (RelLine <= nr)
      then begin
        mkey := meanings[RelLine].m.mkey;
        if mkey = 0
        then GiveMessage('No mkey assigned yet. ')
        else ShowMeaning(mkey);
      end;
    end;
  end;

  begin
    { find out which part of lemma }
    if FindLemmaPart(LemmaPart) then
    case LemmaPart of
      siddictpart: ShowMkeySiddict;
      iddictpart : ShowMkeyIddict;
      ildictpart : ShowMkeyIldict;
      otherwise ;
    end;
    STRTOMKEY_Release;
  end;

  function GetExistingOrZeroMkey(var mkey: integer;
                                     EscapeAllowed: boolean): boolean;
  { 
    This function is called when the user wants to modify the mkey of
    a (semi)idiom or a meaning, or when an mkey must be assigned to a
    newly added (semi)idiom or meaning. In the last case escaping is 
    not allowed. 
    there are two options:
      1. existing meaning: the user can select a meaning in the same language
         or one of the other languages.
      2. new meaning: a temporary key value zero will be assigned. The new
         key will be generated when the user comfirms the modifications.
    The function result will be false if the user escaped. The mkey will
    remain unchanged in that case.
  }
  var 
    ExitLoop1,
    ExitLoop2: boolean;
    Escaped: boolean := false;
    MenuItems: array[1..2] of STRING_String := 
      [1: 'Existing meaning'; 2: 'New meaning'];
    choice: 0..2;
    TargetLanguage: MB_LanguageType;
  begin
    ExitLoop1 := false;
    while not ExitLoop1 do begin
      choice := 1;
      MenuChoice(2, MenuItems, Center, choice);
      case choice of
      0: if EscapeAllowed
         then begin
           Escaped := true;
           ExitLoop1 := true;
         end;
      1: begin
           ClearScreen;
           ExitLoop2 := false;
           while not ExitLoop2 do     
             if SelectLanguage(TargetLanguage)
             then begin
               if TargetLanguage = CurrentLanguage
               then begin
                 if SelectLemma(SelectMkeyMode, Mkey)
                 then begin
                   ExitLoop1 := true;
                   ExitLoop2 := true;
                 end;
               end
               else begin
                 LexedControlMessage.action := SelectMkey;
                 LexedControlMessage.TargetLanguage := TargetLanguage;
                 MB_Put(mbxlexedcontrol, LexedControlMessage);
                 MB_Take(mbxlexed, LexedMessage);
                 if LexedMessage.Mkey <> 0
                 then begin
                   Mkey := LexedMessage.Mkey;
                   ExitLoop2 := true;
                   ExitLoop1 := true;
                 end; 
               end;
             end else begin 
               ExitLoop2 := true;
             end;
           RepaintScreen;
         end;
      2: begin
           Mkey := 0;
           ExitLoop1 := true;
         end;
      end;
    end;
    GetExistingOrZeroMkey := not Escaped;
  end;
  

  procedure TranslateKey;
  {
    When the translate key is pressed (F17) and the cursor is placed on a
    (semi)idiom or a meaning, this procedure will show all synonyms in the
    same language or all translations in one of the other languages.
  }
  var LemmaPart: LemmaPartEnum;
      RelLine  : integer; { line number relative to start of lemma part }
      mkey     : integer; { meaning to be translated }

  procedure TranslateMeaning(mkey: integer);
  var TargetLanguage: MB_LanguageType;
  begin
    ClearScreen;
    if SelectLanguage(TargetLanguage)
    then begin
      if TargetLanguage = CurrentLanguage
      then ShowTranslations(mkey, Lemmakey)
      else begin
        LexedControlMessage.action := showtranslation;
        LexedControlMessage.TargetLanguage := TargetLanguage;
        LexedControlMessage.mkey := mkey;
        MB_Put(mbxlexedcontrol, lexedcontrolmessage);
        MB_Take(mbxlexed, lexedmessage);
      end;
    end;
    RepaintScreen; 
  end;

  procedure TranslateKeySiddict;
  begin 
    with SiddictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[siddictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= nr)
      then begin
        mkey := sids[RelLine].mkey.mkey;
        TranslateMeaning(mkey);
      end;
    end;
  end;

  procedure TranslateKeyIddict;
  begin
    with IddictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[iddictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= nr)
      then begin
        mkey := ids[RelLine].mkeys[1].mkey;
        TranslateMeaning(mkey);
      end;
    end;
  end;

  procedure TranslateKeyIldict;
  begin
    with IldictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[ildictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= nr)
      then begin
        mkey := meanings[RelLine].m.mkey;
        TranslateMeaning(mkey);
      end;
    end;
  end;

  begin
    if OriginalLanguage
    then begin
      { find out which part of lemma }
      if FindLemmaPart(LemmaPart) then
      case LemmaPart of
        siddictpart: TranslateKeySiddict;
        iddictpart : TranslateKeyIddict;
        ildictpart : TranslateKeyIldict;
        otherwise ;
      end;
    end
    else GiveMessage('Only allowed in the originally choosen language. ');
  end;

  procedure InsertKey;
  {
    This procedure inserts new (semi)idioms and meanings, undeletes 
    these objects when the user has removed them before and finally
    inserts idiom arguments and empty lines in the attribute part.
  }
  var LemmaPart: LemmaPartEnum;
      RelLine  : integer; { line number relative to start of lemma part }

    procedure InsertKeyParticles;
    label
      exit;
    var
      DummyBoolean: boolean;
      NewKey,
      DummyKey,
      ParticleKey : integer;
      NewStem, 
      ParticleStem: STRING_String;
      SdictRec    : LISDICT_RecordDef;
      BlexRec     : LSDOMAINT_BlexStruct;
      BlexRecVol  : [volatile] LSDOMAINT_BlexStruct;
      pBlexRec    : ^LSDOMAINT_BlexStruct;
      listree     : LISTREE_pStree;
      lsstree     : LSSTREE_pStree;
    begin with ParticlePartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[particlepart].startline + 1;
      if (RelLine = nr+1) { insert new particle }
      then begin
        AskStem('Enter stem of particle: ', ParticleStem);
        if ParticleStem <> ''
        then begin
          ClearScreen;
          if SelectLemmaWithStem(SelectSkeyMode, ParticleStem,
                                 PartCat, ParticleKey)
          then if AskBoolean(
'The new lemma will be created immediately. Do you want to continue? ') 
          then begin
            STRING_Concat(NewStem, OriginalStem, ParticleStem);
            listree := LDBLEX_ReadDirect(LemmaKey);
            LDBLEX_Release;
            if listree = nil
            then begin
              GiveMessage('original Blex record not found. ');
              goto exit;
            end;
            GenerateKey(SkeyType, LemmaType, listree^.cat,
                        NewStem, NewKey);
            SdictRec.fkey := LemmaKey;
            SdictRec.skey := NewKey;
            SdictRec.nr := 1;
            SdictRec.ctxt[1] := ParticleKey;
            LISDICT_WriteSequential(SdictRec);
            ChangeLog(sdict, add, NewKey, 0);
            LDGETKEY_Put(listree, NewKey);
            BlexRec := MAKET_BlexrecFromStree(NewKey,listree::LSSTREE_pStree);
            BlexRec.IsBxpr := true;
            LSLEXED_AssignParticle(BlexRec, ParticleKey);
            BlexRecVol := BlexRec;
            pBlexRec := address(BlexRecVol);
            LDBLEX_WriteSequential(pBlexRec::LDBLEX_pBlexStruct);
            GiveMessage('The new lemma will be shown on the next screen. ');
            EditLemma(Newkey,'',EditLemmaMode,ReturnKey,DummyBoolean,Dummykey,0,0);
            WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYpos, 1);
            WINDOWS_WriteString(LemmaWindow, 'particle', MaxFieldnameLength, true);
            WINDOWS_WriteString(LemmaWindow, ' : ', 3, true);
            WINDOWS_WriteString(LemmaWindow, ParticleStem, 
                                STRING_Length(ParticleStem), true);
            InsertEmptyLine;
            nr := nr+1;
            particles[nr].key := NewKey;
            particles[nr].stem := ParticleStem;
            LemmaPartData[particlepart].endline := 
              LemmaPartData[particlepart].endline+1;
          end;
          RepaintScreen; 
        end;
      end; 
    exit:
    end;
    end;

    procedure InsertKeySiddict;
    begin with SiddictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[siddictpart].startline + 1;

      if (RelLine > 0) and (RelLine <= nr) and 
         (LemmaWindowXPos = MaxFieldnameLength+2)
      then with sids[RelLine] do begin { undelete semi idiom }
        removed  := false;
        WINDOWS_WriteChar(LemmaWindow, ':');
        WINDOWS_NewRowColumn(LemmaWindow, 
                             LemmaWindowYPos, LemmaWindowXPos);
      end; { with }

      if (RelLine = nr+1) { insert new semi-idiom }
      then if Originallanguage then begin
        if nr = MaxSemiIdioms
        then GiveMessage('Maximum number of semi idioms reached. ')
        else begin
          nr := nr+1;
          with sids[nr] do begin
            modified := false;
            removed  := false;
            ArgPresent := false;
            ArgnrPresent := false;
            sid.skey := LemmaKey;
            Mkey.mkey := 0;
            MkeyModified := false;
            NrComments := 0;
            CommentsModified := false;
          end;
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, 1);
          WINDOWS_WriteStr(LemmaWindow,'semi-idiom',10,MaxFieldnameLength,true);
          WINDOWS_WriteStr(LemmaWindow,' : ', 3, 3, true);
          sids[nr].StartArg := WINDOWS_Column(LemmaWindow);
          WINDOWS_WriteStr(LemmaWindow,'<argument>',10,11,true);
          sids[nr].EndArg := WINDOWS_Column(LemmaWindow)-2;
          WINDOWS_WriteStr(LemmaWindow,'<argument number>',17,18,true);
          LemmaWindowXPos := sids[nr].StartArg;
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
        end;
      end
      else GiveMessage('Only allowed in the originally choosen language. ');
    end; { with SiddictPartDescr }
    end;

    procedure InsertKeyIddict;

      function InsertIdiomArg(idnr: integer; pos: integer; len: integer): boolean;
      {
        Inserts new argument in idiom data structure.
      }
      var success: boolean;
          j: integer;
      begin
        with IddictPartDescr.ids[idnr] 
        do begin
          success := false;
          if (idiom.args.nrargs < LIIDDICT_MaxIdArgs) and
             (pos > 1) and (pos <= idiom.args.nrargs+1)
          then begin
            for j := idiom.args.nrargs downto pos do begin
              argpos[j].startx := argpos[j].startx + len + 1;
              argpos[j].endx := argpos[j].endx + len + 1;
              idiom.args.argkeys[j+1] := idiom.args.argkeys[j];
              argpos[j+1] := argpos[j];
            end;
            idiom.args.nrargs := idiom.args.nrargs+1;
            idiom.args.argkeys[pos] := 0;
            if pos = idiom.args.nrargs
            then argpos[pos].startx := argpos[pos-1].endx+2
            else argpos[pos].startx := argpos[pos+1].startx-1-len;
            argpos[pos].endx := argpos[pos].startx+len-1;
            success := true;
          end; 
          InsertIdiomArg := success;
        end; { with }
      end;

    var i: integer;
        found: boolean;
        CursorInsertPosition: boolean;
        argkey: integer;
    begin with IddictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[iddictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= nr) 
      then with ids[RelLine] do begin
        if (LemmaWindowXPos = MaxFieldnameLength+2) { undelete idiom }
        then begin 
          removed  := false;
          WINDOWS_WriteChar(LemmaWindow, ':');
          WINDOWS_NewRowColumn(LemmaWindow, 
                               LemmaWindowYPos, LemmaWindowXPos);
        end; 
        if argpresent and (LemmaWindowXPos > MaxFieldnameLength+2)
        then begin { insert idiom argument }
          CursorInsertPosition := false;
          i := 2; { head argument is hidden }
          while (i <= idiom.args.nrargs) and not CursorInsertPosition do
            if (LemmaWindowXPos = argpos[i].startx-1) 
            then CursorInsertPosition := true
            else i := i+1;
          if not CursorInsertPosition and
             (LemmaWindowXPos = argpos[idiom.args.nrargs].endx+1)
          then CursorInsertPosition := true; { i has already correct value }
          if CursorInsertPosition 
          then begin
            { select stem, replace key, replace stem on window }
            ClearScreen;
            if SelectLemma(SelectSkeyMode, argkey) and 
               GetStem(argkey, argpos[i].argstem) 
            then begin
              len := STRING_length(argpos[i].argstem);
              if InsertIdiomArg(RelLine, i, len) 
              then begin
                idiom.args.argkeys[i] := argkey;
                WINDOWS_InsertInLine(LemmaWindow, LemmaWindowYPos, 
                                     argpos[i].startx, len+2); { len+2 due to a 
                                     bug in WINDOWS !!! To be changed to len+1 }
                WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, 
                                     argpos[i].startx);
                WINDOWS_WriteString(LemmaWindow,argpos[i].argstem,len+1,true);
                LemmaWindowXPos := WINDOWS_Column(LemmaWindow);
                if PatternPresent
                then begin
                  modified := true;
                  LemmaPartData[iddictpart].modified := true;
                  { there is always at least one argument present, so need not
                    bother about accepting new valid idiom }
                end;
                ArgPresent := true; { in fact unnecessary , to be deleted !!! }
                ArgsModified := true;
              end
              else GiveMessage('Number of arguments to high. ');
            end
            else GiveMessage('No lemma selected. ');
            RepaintScreen;
          end;
        end;
      end; { with }
      if (RelLine = nr+1) { insert new idiom }
      then if OriginalLanguage then begin
        if nr = MaxIdioms
        then GiveMessage('Maximum number of idioms reached. ')
        else begin
          nr := nr+1;
          with ids[nr] do begin
            modified := false;
            removed  := false;
            ArgsModified := false;
            PatternModified := false;
            ArgPresent := false;
            PatternPresent := false;
            NrMkeys := 0;
            idiom.args.nrargs := 2; { 1st=head, 2nd=empty }
            idiom.args.argkeys[1] := Lemmakey;
            idiom.args.argkeys[2] := 0;
            idiom.idskey := 0;
            idiom.headkey := LemmaKey;
            NrComments := 0;
            CommentsModified := false;
          end;
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, 1);
          WINDOWS_WriteStr(LemmaWindow,'idiom',5,MaxFieldnameLength,true);
          WINDOWS_WriteStr(LemmaWindow,' : ', 3, 3, true);
          { first argument on screen is in fact second argument }
          ids[nr].argpos[2].startx:= WINDOWS_Column(LemmaWindow);
          WINDOWS_WriteStr(LemmaWindow,'<argument>',10,11,true);
          ids[nr].argpos[2].endx := WINDOWS_Column(LemmaWindow)-2;
          WINDOWS_WriteStr(LemmaWindow,'<pattern>',9,10,true);
          LemmaWindowXPos := ids[nr].argpos[2].startx;
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
        end;
      end
      else GiveMessage('Only allowed in the originally choosen language. ');
    end; { with IddictPartDescr }
    end;

    procedure InsertKeyIldict;
    begin with IldictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[ildictpart].startline + 1;

      if (RelLine > 0) and (RelLine <= nr) and 
         (LemmaWindowXPos = MaxFieldnameLength+2)
      then with meanings[RelLine] do begin  { undelete meaning }
        removed  := false;
        WINDOWS_WriteChar(LemmaWindow, ':');
        WINDOWS_NewRowColumn(LemmaWindow, 
                             LemmaWindowYPos, LemmaWindowXPos);
      end; { with }

      if (RelLine = nr+1) { insert new meaning }
      then if OriginalLanguage then begin
        if nr = MaxMeanings
        then GiveMessage('Maximum number of meanings reached. ')
        else begin
          nr := nr+1;
          with meanings[nr] do begin
            m.skey := LemmaKey;
            { mkey must be generated when accepting }
            m.spref := 0;
            m.mpref := 0;
            m.md    := ' ';
            m.ag    := LIILDICT_Both;
            m.marked := false;
            modified := false;
            removed  := false;
            DescrPresent := false;
            NrComments := 0;
            CommentsModified := false;
            { info not yet done }
          end;

          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, 1);
          WINDOWS_WriteStr(LemmaWindow,'s0  m0  An/Gen',14,MaxFieldnameLength,true);
          WINDOWS_WriteStr(LemmaWindow,' : ', 3, 3, true);
          WINDOWS_WriteStr(LemmaWindow,'<meaning description>',21,22,true);
          LemmaWindowXPos := MaxFieldnameLength+4;
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
        end;
      end
      else GiveMessage('Only allowed in the originally choosen language. ');
 
    end; { with IldictPartDescr }
    end;

  procedure InsertKeyBlex;
  begin
    WINDOWS_InsertLines(LemmaWindow, LemmaWindowYPos+1,1);
    LemmaPartData[blexpart].endline := LemmaPartData[blexpart].endline+1;
    NumberOfLines := NumberOfLines+1;
    LemmaWindowXPos := MaxFieldnameLength+6;
    ScrollForward(1);
  end;

  begin
    { find out which part of lemma }
    if EditingAllowed and
       FindLemmaPart(LemmaPart) then
    case LemmaPart of
      particlepart: InsertKeyParticles;
      siddictpart : InsertKeySiddict;
      iddictpart  : InsertKeyIddict;
      ildictpart  : InsertKeyIldict;
      blexpart    : InsertKeyBlex;
      otherwise ;
    end;
  end;

  procedure RemoveKey;
  { 
    This procedure removes (semi)idioms, meanings and idiom arguments and
    it resets skey-values of attributes (prepkey, particle) to zero.
  }
  var
    LemmaPart: LemmaPartEnum;
    RelLine  : integer; { line number relative to start of lemma part }

    procedure RemoveKeySiddict;
    begin with siddictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[siddictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= nr) and 
         (LemmaWindowXPos = MaxFieldnameLength+2)
      then with sids[RelLine] do begin
        removed  := true;
        LemmaPartData[siddictpart].modified := true;
        WINDOWS_WriteChar(LemmaWindow, '-');
        WINDOWS_NewRowColumn(LemmaWindow, 
                             LemmaWindowYPos, LemmaWindowXPos);
        if MkeyReferredTo(oldmkey.mkey, sid.sidskey)
        then GiveMessage('Warning: this semi idiom is still referred to. ');
      end; { with }
    end; { with siddictpartdescr }
    end;

    procedure RemoveKeyIddict;

      function DeleteIdiomArg(idnr: integer; pos: integer; len: integer): boolean;
      var success: boolean;
          j: integer;
      begin
        with IddictPartDescr.ids[idnr] do begin
          len := len+1; { include space after argument to be deleted }
          success := false;
          if (idiom.args.nrargs > 2) and { = 2 should delete the last argument except
              for the head. This argument can only be modified, not deleted. }
             (pos > 1) and (pos <= idiom.args.nrargs)
          then begin
            for j := pos to idiom.args.nrargs-1 do begin
              idiom.args.argkeys[j] := idiom.args.argkeys[j+1];
              argpos[j] := argpos[j+1];
              argpos[j].startx := argpos[j].startx-len;
              argpos[j].endx := argpos[j].endx-len;
            end;
            idiom.args.nrargs := idiom.args.nrargs-1;
            success := true;
          end; 
          DeleteIdiomArg := success;
        end; { with }
      end;

    var i: integer;
        CursorRemovePosition: boolean;
    begin with IddictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[iddictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= nr) 
      then with ids[RelLine] do begin
        if (LemmaWindowXPos = MaxFieldnameLength+2)
        then begin
          removed  := true;
          LemmaPartData[iddictpart].modified := true;
          WINDOWS_WriteChar(LemmaWindow, '-');
          WINDOWS_NewRowColumn(LemmaWindow, 
                               LemmaWindowYPos, LemmaWindowXPos);
          if MkeyReferredTo(OldMkeys[1].mkey, idiom.idskey)
          then GiveMessage('Warning: this idiom is still referred to. ');
        end; { with }
        if (LemmaWindowXPos > MaxFieldnameLength+2) and
           (ids[RelLine].idiom.args.nrargs > 2) and
           (EditorMode = EditLemmaMode)
        then begin
          CursorRemovePosition := false;
          i := 2; { head argument is hidden }
          while (i <= idiom.args.nrargs) and not CursorRemovePosition do
            if (LemmaWindowXPos >= argpos[i].startx) and
               (LemmaWindowXPos <= argpos[i].endx)
            then CursorRemovePosition := true
            else i := i+1;
          if CursorRemovePosition 
          then begin
              len := STRING_length(argpos[i].argstem);
              if DeleteIdiomArg(RelLine, i, len) 
              then begin
                WINDOWS_DeleteInLine(LemmaWindow, LemmaWindowYPos, 
                                     argpos[i].startx, len+1); 
                WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, 
                                     argpos[i].startx);
                LemmaWindowXPos := WINDOWS_Column(LemmaWindow);
                if PatternPresent
                then begin
                  modified := true;
                  LemmaPartData[iddictpart].modified := true;
                  { there is always at least one argument present, so need not
                    bother about accepting new valid idiom }
                end;
                ArgsModified := true;
              end;
          end;
        end;
      end; { with }
    end; { with iddictpartdescr }
    end;

    procedure RemoveKeyIldict;
    begin with IldictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[ildictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= nr) and 
         (LemmaWindowXPos = MaxFieldnameLength+2)
      then with meanings[RelLine] do begin
        removed  := true;
        LemmaPartData[ildictpart].modified := true;
        WINDOWS_WriteChar(LemmaWindow, '-');
        WINDOWS_NewRowColumn(LemmaWindow, 
                             LemmaWindowYPos, LemmaWindowXPos);
        if MkeyReferredTo(m.mkey, Lemmakey)
        then GiveMessage('Warning: this meaning is still referred to. ');
      end; { with }
    end; { with ildictpartdescr }
    end;

    procedure RemoveKeyBlex;
    VAR
      key        : INTEGER;
      strkeystart: INTEGER;
      strkeylen  : INTEGER;
    begin
      if LemmaWindowXPos > MaxFieldnameLength + 3
      then begin
        IF ReadIntegerFromWindow(LemmaWindow, key, strkeystart, strkeylen)
        THEN BEGIN 
          WINDOWS_DeleteInLine(LemmaWindow, LemmaWindowYPos, strkeystart,
                               strkeylen); 
          WINDOWS_InsertInLine(LemmaWindow, LemmaWindowYPos, 
                               strkeystart, 2);
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, strkeystart);
          WINDOWS_WriteStr(LemmaWindow, '0 ', 2, 2, true);
          WINDOWS_NewRowColumn(LemmaWindow, 
                               LemmaWindowYPos, LemmaWindowXPos);
          LemmaPartData[blexpart].modified := true;
        END
        ELSE GiveMessage('No integer value. ');
      end;
    end;

  begin
    { find out which part of lemma }
    if EditingAllowed and
       FindLemmaPart(LemmaPart) then
    case LemmaPart of
      siddictpart: RemoveKeySiddict;
      iddictpart : RemoveKeyIddict;
      ildictpart : RemoveKeyIldict;
      blexpart   : if EditorMode = EditLemmaMode then RemoveKeyBlex;
      otherwise ;
    end;
  end;


  procedure SelectKey;
  {
    This procedure selects the whole lemma or the mkey of a particular 
    (semi)idiom or meaning, dependent of the cursor position and the 
    editor mode.
  }
  var
    LemmaPart: LemmaPartEnum;
    RelLine  : integer; { line number relative to start of lemma part }

    procedure SelectKeySiddict;
    begin 
      with SiddictPartDescr do begin
        RelLine := LemmaWindowYPos - LemmaPartData[siddictpart].startline + 1;
        if (RelLine > 0) and (RelLine <= nr) and 
           not ( (RelLine >= FirstAdded) and not sids[RelLine].modified )
        then begin
          SelectedKey := sids[RelLine].Mkey.mkey;
          KeySelected := true;
        end;
      end;
    end;

    procedure SelectKeyIddict;
    begin 
      with IddictPartDescr do begin
        RelLine := LemmaWindowYPos - LemmaPartData[iddictpart].startline + 1;
        if (RelLine > 0) and (RelLine <= nr) and 
           not ( (RelLine >= FirstAdded) and not ids[RelLine].modified )
        then begin
          SelectedKey := ids[RelLine].mkeys[1].mkey; 
             { only 1 mkey allowed at the moment! }
          KeySelected := true;
        end;
      end;
    end;

    procedure SelectKeyIldict;
    begin 
      with IldictPartDescr do begin
        RelLine := LemmaWindowYPos - LemmaPartData[ildictpart].startline + 1;
        if (RelLine > 0) and (RelLine <= nr) and 
           not ( (RelLine >= FirstAdded) and not meanings[RelLine].modified )
        then begin
          SelectedKey := meanings[RelLine].m.mkey; 
          KeySelected := true;
        end;
      end;
    end;

  begin 
    if EditorMode = SelectSkeyMode { Select whole lemma }
    then begin
      SelectedKey := LemmaKey;
      KeySelected := true;
    end;
    if (EditorMode = SelectMkeyMode) and { Select meaning }   
       CursorInLemmaWindow 
    then begin 
      { find out which part of lemma }
      if FindLemmaPart(LemmaPart) then
      case LemmaPart of
        siddictpart: SelectKeySiddict;
        iddictpart : SelectKeyIddict;
        ildictpart : SelectKeyIldict;;
        otherwise ;
      end;
    end;
  end;


  procedure DoKey;
  {
    This procedure is used to modify the various items on the screen and is
    activated when the user presses the Do-key while the cursor is positioned
    on the desired item, e.g. an idiom-argument. In most cases text values 
    can also be changed by directly editing on the screen. Attribute values can
    only be changed in this way (for the time being and with a few exceptions:
    prepkey and particle attributes).
  }
  var
    LemmaPart: LemmaPartEnum;
    RelLine  : integer; { line number relative to start of lemma part }

    procedure InsertEmptyLine;
    { 
      Inserts an empty line on the screen, when a newly added (semi)idiom
      or meaning is completed. This empty line enables the user to insert
      another item.
    }
    var DummyLemmaPart: LemmaPartEnum;
    begin
      WINDOWS_InsertLines(LemmaWindow, LemmaWindowYPos+1,1);
      NumberOfLines := NumberOfLines+1;
      LemmaWindowXPos := MaxFieldNameLength+2;
      if LemmaViewportHeight < ScreenHeight
      then begin
        LemmaViewportHeight := LemmaViewportHeight+1;
        WINDOWS_ChangeViewport(Viewport, 1, 1, LemmaViewportHeight, 80);
      end;
      ScrollForward(1);
      for DummyLemmaPart := mdictpart to blexpart do 
        if LemmaPartData[DummyLemmaPart].startline > LemmaWindowYPos
        then with LemmaPartData[DummyLemmaPart] do begin
          startline := startline + 1;
          endline := endline + 1;
        end;
    end;

    procedure DoKeyMdict;
    { 
      Modifies phonetical information and the an/gen switch. The phonetical
      information is different for every language, so it is implemented in
      the language specific sub-module LSLEXED.
    }
    const startpos = MaxFieldnameLength + 4;
    var lsfon: LSPHONDEF_pPhonInfo;
        modified: boolean;
        MenuElements: array[1..3] of STRING_String;
        choice: 0..3;
    begin
      modified := false;
      RelLine := LemmaWindowYPos - LemmaPartData[mdictpart].startline + 1;
      lsfon := MdictPartDescr.FON::LSPHONDEF_pPhonInfo;
      LemmaWindowXPos := startpos;
      if RelLine = 1
      then begin
        MenuElements[1] := 'Analysis';
        MenuElements[2] := 'Generation';
        MenuElements[3] := 'Both';
        choice := 1;
        MenuChoice(3,MenuElements,RightSide,choice);
        WINDOWS_NewRowColumn(LemmaWindow,LemmaWindowYPos,startpos);
        case choice of 
          0: ;
          1: begin
               MdictPartDescr.where := OnlyAn;
               WINDOWS_EraseLine(LemmaWindow, LemmaWindowYPos,
                                 startpos);
               WINDOWS_WriteStr(LemmaWindow, 'Analysis',8,8,true);
               modified := true;
             end;
           2: begin
                MdictPartDescr.where := OnlyGen;
                WINDOWS_EraseLine(LemmaWindow, LemmaWindowYPos,
                                  startpos);
                WINDOWS_WriteStr(LemmaWindow, 'Generation',10,10,true);
                modified := true;
              end;
           3: begin
                MdictPartDescr.where := BothAnGen;
                WINDOWS_EraseLine(LemmaWindow, LemmaWindowYPos,
                                  startpos);
                WINDOWS_WriteStr(LemmaWindow, 
                                 'Analysis and Generation',23,23,true);
                modified := true;
              end;
        end;
      end
      else LSLEXED_DoKeyLSMdict(LemmaWindow, MdictpartDescr.CC, 
                                lsfon, RelLine, modified);
      if modified
      then LemmaPartData[mdictpart].modified := true;
      WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
    end;

    procedure DoKeySiddict;
    {
      Modifies comments, mkey, argument and argument number of semi-idioms.
      A newly added semi-idiom is 'accepted' when both the argument and
      the argument number are filled. An mkey is assigned then and the 
      user is urged to write some specific comments.
    }
    var argkey: integer;

      procedure AcceptNewSemiIdiom;
      begin
        with SiddictPartDescr.sids[RelLine] do begin 
          if not MkeyModified
          then GetExistingOrZeroMkey(Mkey.mkey, false); { always returns true }
          CommentKey;
          InsertEmptyLine;
          LemmaPartData[siddictpart].endline := 
            LemmaPartData[siddictpart].endline+1;
          { yet no key assigning !!! }
          if SiddictPartDescr.FirstAdded = 0
          then SiddictPartDescr.FirstAdded := RelLine;
        end;
        LemmaPartData[siddictpart].exist := true;
      end;

    begin
      RelLine := LemmaWindowYPos - LemmaPartData[siddictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= SiddictPartDescr.nr)
      then with SiddictPartDescr.sids[RelLine] do begin
        if (LemmaWindowXPos = MaxFieldnameLength + 1) { cursor on '*' }
        then CommentKey;
        if (LemmaWindowXPos = MaxFieldnameLength + 2) { cursor on ':' }
        then begin
          if OriginalLanguage
          then begin
            if GetExistingOrZeroMkey(Mkey.mkey, true)
            then begin
              MkeyModified := true; 
              LemmapartData[siddictpart].modified := true;
            end;
          end 
          else GiveMessage(
'Modification of mkey only allowed in the originally choosen language. ');
        end else
          if (LemmaWindowXPos >= StartArg) and
             (LemmaWindowXPos <= EndArg)              { cursor on argument }
          then begin
            { select stem, replace key, replace stem on window }
            ClearScreen;
            if SelectLemma(SelectSkeyMode, argkey) and
               GetStem(argkey, argstem) then begin
              len := STRING_Length(argstem);
             WINDOWS_DeleteInLine(LemmaWindow, LemmaWindowYPos,
                                  StartArg, EndArg-StartArg+2);
              WINDOWS_InsertInLine(LemmaWindow, LemmaWindowYPos, StartArg,
                                   len+2); { len+2 due to a 
                                   bug in WINDOWS !!! To be changed to len+1 }
              WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, StartArg);
              WINDOWS_WriteString(LemmaWindow,argstem,len+1,true);
              EndArg := WINDOWS_Column(LemmaWindow)-2;
              LemmaWindowXPos := EndArg+3;
              if ArgnrPresent
              then begin
                modified := true;
                LemmaPartData[siddictpart].modified := true;
                if not ArgPresent
                then AcceptNewSemiIdiom;
              end;
              ArgPresent := true;
              sid.arg := argkey;
            end
            else GiveMessage('No lemma selected. ');
            RepaintScreen;
          end
          else
            if (LemmaWindowXPos >= EndArg+2) { cursor on argument number }
            then begin
              { edit argument number }
              AskInteger('Give integer value: ',sid.argnr);
              WINDOWS_EraseLine(LemmaWindow, LemmaWindowYPos, EndArg+2);
              WINDOWS_WriteStr(LemmaWindow, '#',1,1,true);
              WINDOWS_WriteInteger(LemmaWindow,sid.argnr,5,true);
              if ArgPresent
              then begin
                modified := true;
                LemmaPartData[siddictpart].modified := true;
                if not ArgnrPresent
                then AcceptNewSemiIdiom;
              end;
              ArgnrPresent := true;
            end;
        WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
      end;
    end;

    procedure DoKeyIddict;
    {
      Modifies comments, mkey, arguments and idiom pattern of idioms.
      A newly added idiom is 'accepted' when at least one argument as well as
      the idiom pattern are filled. An mkey is assigned then and the 
      user is urged to write some specific comments.
    }
    var argkey: integer;
        CursorOnArgument: boolean;
        i: integer;
        dist: integer; { difference in length between new and old argument }
        IdiomPattern: LSDOMAINT_SynPatternType;
        PatternName: packed array[1..30] of char;
        PatternNameLength: integer;

      procedure AcceptNewIdiom;
      begin
        with IddictPartDescr.ids[RelLine] do begin
          if not MkeyModified[1]
          then GetExistingOrZeroMkey(mkeys[1].mkey, false); { always returns true }
          CommentKey;
          InsertEmptyLine;
          LemmaPartData[iddictpart].endline := 
            LemmaPartData[iddictpart].endline+1;
          { yet no key assigning !!! }
          if IddictPartDescr.FirstAdded = 0
          then IddictPartDescr.FirstAdded := RelLine;
        end;
        LemmaPartData[iddictpart].exist := true;
      end;

    begin
      RelLine := LemmaWindowYPos - LemmaPartData[iddictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= IddictPartDescr.nr)
      then with IddictPartDescr.ids[RelLine] do begin
        if (LemmaWindowXPos = MaxFieldnameLength + 1)   { cursor on '*' }
        then CommentKey;
        if (LemmaWindowXPos = MaxFieldnameLength + 2)   { cursor on ':' }
        then begin
          if OriginalLanguage
          then begin
            if GetExistingOrZeroMkey(mkeys[1].mkey, true)
            then begin
              MkeyModified[1] := true; 
              LemmapartData[iddictpart].modified := true;
            end;
          end 
          else GiveMessage(
'Modification of mkey only allowed in the originally choosen language. ');
        end else begin
          CursorOnArgument := false;
          i := 2; { head argument is hidden }
          while (i <= idiom.args.nrargs) and not CursorOnArgument do
            if (LemmaWindowXPos >= argpos[i].startx) and
               (LemmaWindowXPos <= argpos[i].endx) 
            then CursorOnArgument := true
            else i := i+1;
          if CursorOnArgument
          then begin { modify argument }
            { select stem, replace key, replace stem on window }
            ClearScreen;
            if SelectLemma(SelectSkeyMode, argkey) and 
               GetStem(argkey, argpos[i].argstem) 
            then begin
              len := STRING_Length(argpos[i].argstem);
              idiom.args.argkeys[i] := argkey;
              WINDOWS_DeleteInLine(LemmaWindow, LemmaWindowYPos,
                                   argpos[i].startx, { also delete space }
                                   argpos[i].endx-argpos[i].startx+2); 
              WINDOWS_InsertInLine(LemmaWindow, LemmaWindowYPos, 
                                   argpos[i].startx, len+2); { len+2 due to a 
                                   bug in WINDOWS !!! To be changed to len+1 }
              WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, 
                                   argpos[i].startx);
              WINDOWS_WriteString(LemmaWindow,argpos[i].argstem,len+1,true);
              dist := len - (argpos[i].endx - argpos[i].startx + 1);
              if dist <> 0
              then begin
                for j := i+1 to idiom.args.nrargs do begin
                  argpos[j].startx := argpos[j].startx + dist;
                  argpos[j].endx := argpos[j].endx + dist;
                end;
                argpos[i].endx := argpos[i].endx + dist;
              end;
              LemmaWindowXPos := WINDOWS_Column(LemmaWindow);
              if PatternPresent
              then begin
                modified := true;
                LemmaPartData[iddictpart].modified := true;
                if not ArgPresent
                then AcceptNewIdiom;
              end;
              ArgPresent := true;
              ArgsModified := true;
            end
            else GiveMessage('No lemma selected. ');
            RepaintScreen;
          end
          else
            if (LemmaWindowXPos >= argpos[idiom.args.nrargs].endx+2) 
            then begin
              { edit pattern }
              AskStr('Give idiom pattern: ',6,
                        PatternName,PatternNameLength);
              while not LSSTRTOTYPE_SynPatternType(PatternName,
                          PatternNameLength, IdiomPattern) do begin
                GiveMessage('Incorrect idiom pattern. ');  
                AskStr('Give idiom pattern: ',6,
                          PatternName,PatternNameLength);
              end;
              idiom.pattern := ord(IdiomPattern);
              WINDOWS_EraseLine(LemmaWindow, LemmaWindowYPos, 
                                argpos[idiom.args.nrargs].endx+2);
              WINDOWS_WriteStr(LemmaWindow, '[',1,1,true);
              WINDOWS_WriteStr(LemmaWindow,PatternName,PatternNameLength,
                               PatternNameLength,true);
              WINDOWS_WriteStr(LemmaWindow, ']',1,1,true);
              if ArgPresent
              then begin
                modified := true;
                LemmaPartData[iddictpart].modified := true;
                if not PatternPresent
                then AcceptNewIdiom;
              end;
              PatternPresent := true;
              PatternModified := true;
            end;
        end;
      end;
    end;

    procedure DokeyIldict;
    {
      Modifies comments, mkey, description, an/gen switch and prefs of meanings.
      Marking and unmarking of meanings is also done in this procedure.
      A newly added meaning is 'accepted' when it has a description.
      An mkey is assigned then and the user is urged to write some specific 
      comments.
    }
    var MenuElements: array[1..3] of STRING_String;
        choice: 0..3;
        SomethingModified: boolean;
        DescrLength: integer;

      procedure AcceptNewMeaning;
      begin
        with IldictPartDescr.meanings[RelLine] do begin 
          if not Modified
          then GetExistingOrZeroMkey(m.mkey, false); { always returns true }
          CommentKey;
          InsertEmptyLine;
          LemmaPartData[ildictpart].endline := 
            LemmaPartData[ildictpart].endline+1;
          { yet no key assigning !!! }
          if IldictPartDescr.FirstAdded = 0
          then IldictPartDescr.FirstAdded := RelLine;
        end;
        LemmaPartData[ildictpart].exist := true;
      end;

    begin
      SomethingModified := false;
      RelLine := LemmaWindowYPos - LemmaPartData[ildictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= IldictPartDescr.nr)
      then with IldictPartDescr.meanings[RelLine] do begin
        if (LemmaWindowXPos >= 1) and (LemmaWindowXPos <= 3)  { s-pref }
        then begin
          AskInteger('Give integer value: ',m.spref);
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, 2);
          WINDOWS_WriteInteger(LemmaWindow, m.spref, 2, true);
          SomethingModified := true;
        end;
        if (LemmaWindowXPos >= 5) and (LemmaWindowXPos <= 7)  { m-pref }
        then begin
          AskInteger('Give integer value: ',m.mpref);
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, 6);
          WINDOWS_WriteInteger(LemmaWindow, m.mpref, 2, true);
          SomethingModified := true;
        end;
        if (LemmaWindowXPos >= 9) and (LemmaWindowXPos <= 14) { an/gen switch }
        then begin
          MenuElements[1] := 'Analysis';
          MenuElements[2] := 'Generation';
          MenuElements[3] := 'Both';
          choice := 1;
          MenuChoice(3,MenuElements,RightSide,choice);
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, 9);
          case choice of 
            0: ;
            1: begin
                 m.ag := LIILDICT_Analysis;
                 WINDOWS_WriteStr(LemmaWindow, 'An    ',6,6,true);
               end;
            2: begin
                 m.ag := LIILDICT_Generation;
                 WINDOWS_WriteStr(LemmaWindow, 'Gen   ',6,6,true);
               end;
            3: begin
                 m.ag := LIILDICT_Both;
                 WINDOWS_WriteStr(LemmaWindow, 'An/Gen ',6,6,true);
               end;
          end;
          SomethingModified := true;
        end;
        if (LemmaWindowXPos = MaxFieldnameLength + 1)  { cursor on '*' }
        then CommentKey;
        if (LemmaWindowXPos = MaxFieldnameLength+2)    { cursor on ':' }
        then begin
          if OriginalLanguage
          then begin
            if GetExistingOrZeroMkey(m.mkey, true)
            then SomethingModified := true;
          end 
          else GiveMessage(
'Modification of mkey only allowed in the originally choosen language. ');
        end;
        if (LemmaWindowXPos = MaxFieldnameLength+3)    
        then begin  { mark or unmark meaning }
          m.marked := not m.marked;
          SomethingModified := true;
          if m.marked
          then WINDOWS_WriteChar(LemmaWindow, '-')
          else WINDOWS_WriteChar(LemmaWindow, ' ');
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos,
                               LemmaWindowXPos);
        end;
        if (LemmaWindowXPos >= MaxFieldnameLength+4) { cursor on description }
        then begin
          m.md := ' ';
          AskStr('Give description: ', LIILDICT_MaxMDLength, 
                    m.md, DescrLength);
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos,
                               MaxFieldnameLength+4);
          WINDOWS_EraseLine(LemmaWindow,LemmaWindowYPos,
                               MaxFieldnameLength+4);
          WINDOWS_WriteStr(LemmaWindow, m.md, LIILDICT_MaxMDLength, 
                           LIILDICT_MaxMDLength, true);
          SomethingModified := true;
          WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos,
                               LemmaWindowXPos);
          if not DescrPresent
          then begin
            DescrPresent := true;
            AcceptNewMeaning;
          end;
        end;
        WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
        If SomethingModified and DescrPresent
        then begin
          modified := true;
          LemmaPartData[ildictpart].modified := true;
        end;
      end;
    end;

    procedure DoKeyBlex;
    { 
      Attributes are normally edited directly on the screen (for the time 
      being). The only exceptions are integer values which are interpreted
      as skeys. This is the case with prepkey and particle attributes.
      Pressing the Do-key will start a normal lemma-selection procedure.
    }
    VAR
      key        : INTEGER;
      strkey     : PACKED ARRAY [1..50] OF CHAR;
      strkeystart: INTEGER;
      strkeylen  : INTEGER;
      stem       : STRING_String;
    begin
      if LemmaWindowXPos > MaxFieldnameLength + 3
      then begin
        IF ReadIntegerFromWindow(LemmaWindow, key, strkeystart, strkeylen)
        THEN BEGIN 
          ClearScreen;
          IF SelectLemma(SelectSkeyMode, key) and
             GetStem(key, stem)
          THEN BEGIN
            WINDOWS_DeleteInLine(LemmaWindow, LemmaWindowYPos, strkeystart,
                                 strkeylen); 
            Str_IntegerToStr(key, strkey, strkeylen);
            WINDOWS_InsertInLine(LemmaWindow, LemmaWindowYPos, 
                                 strkeystart, strkeylen+2);
            WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, strkeystart);
            WINDOWS_WriteStr(LemmaWindow, strkey, strkeylen, strkeylen+1, true);

{ When adding or modifying a particle, the stem should change, but a user
  can change the article key without using this procedure, so nothing is done
  yet.
            WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, 1);
            ... check if attribute name = article ...
            if (StemComposed = NotComposed) or (StemComposed = ViaBlex)
            then begin
              ConcatStem(OriginalStem, stem, MdictPartDescr.stem);
              ShowStemWindow;
              StemComposed := ViaBlex;
            end;
}
            WINDOWS_NewRowColumn(LemmaWindow, 
                                 LemmaWindowYPos, LemmaWindowXPos);
            LemmaPartData[blexpart].modified := true;
          END
          ELSE GiveMessage('No lemma selected. ');
          RepaintScreen;
        END
        ELSE GiveMessage('No integer value. ');
      end;
    end;

  begin
    { find out which part of lemma }
    if EditingAllowed and
       FindLemmaPart(LemmaPart) then
    case LemmaPart of
      mdictpart  : DokeyMdict;
      siddictpart: DoKeySiddict;
      iddictpart : DoKeyIddict;
      ildictpart : DoKeyIldict;
      blexpart   : DoKeyBlex;
      otherwise ;
    end;
  end;

  procedure PrintableCharacter;
  {
    Some items can be edited directly on the screen. The modified text will
    not be checked for syntactic errors until the user's confirmation when
    leaving the lemma. Direct editing is anabled by this procedure and 
    'DeleteKey'.
  }
  var LemmaPart: LemmaPartEnum;
      RelLine  : integer; { line number relative to start of lemma part }

  procedure PrintableCharIldict;
  begin
    with IldictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[ildictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= nr) and
         (meanings[RelLine].DescrPresent) and
         (LemmaWindowXPos > MaxFieldnameLength+3) and
         (LemmaWindowXPos < WindowWidth-1)
      then with meanings[RelLine] do begin
        Windows_InsertInLine(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos, 2);
        LemmaWindowXPos := LemmaWindowXPos+1;
        Left;
        Windows_WriteChar(LemmaWindow, CHR(PressedKey));
        Right;
        LemmaPartData[ildictpart].modified := true;
        modified := true;
      end;
    end;
  end;

  procedure PrintableCharBlex;
  begin
    if (LemmaWindowXPos > MaxFieldnameLength+3) and
       (LemmaWindowXPos < WindowWidth-1)
    THEN BEGIN
      Windows_InsertInLine(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos, 2);
      LemmaWindowXPos := LemmaWindowXPos+1;
      Left;
      Windows_WriteChar(LemmaWindow, CHR(PressedKey));
      Right;
      LemmaPartData[blexpart].modified := true;
    END;
  end;

  begin
    if EditingAllowed and
       FindLemmaPart(LemmaPart) 
    then
       case LemmaPart of
         ildictpart : PrintableCharIldict;
         blexpart   : PrintableCharBlex;
         otherwise ;
       end;
  end;

  procedure DeleteKey;
  {
    This procedure implements the backspace key, enabling direct editing 
    on the screen.
  }
  var LemmaPart: LemmaPartEnum;
      RelLine  : integer; { line number relative to start of lemma part }

  procedure DeleteKeyIldict;
  begin
    with IldictPartDescr do begin
      RelLine := LemmaWindowYPos - LemmaPartData[ildictpart].startline + 1;
      if (RelLine > 0) and (RelLine <= nr) and
         (meanings[RelLine].DescrPresent) and
         (LemmaWindowXPos > MaxFieldnameLength+4) and
         (LemmaWindowXPos < WindowWidth)
      then with meanings[RelLine] do begin 
        DeleteChar;
        LemmaPartData[ildictpart].modified := true;
        modified := true;
      end;
    end;
  end;

  procedure DeleteKeyBlex;
  begin
    if (LemmaWindowXPos > MaxFieldnameLength+4) and
       (LemmaWindowXPos < WindowWidth)
    THEN BEGIN
      DeleteChar;
      LemmaPartData[blexpart].modified := true;
    END;
  end;

  begin
    if EditingAllowed and
       FindLemmaPart(LemmaPart) 
    then
       case LemmaPart of
         ildictpart : DeleteKeyIldict;
         blexpart   : DeleteKeyBlex;
         otherwise ;
       end;
  end;

  procedure StemWindowKey;
  {
    This procedure handles all actions as long as the cursor is positioned
    in the stem window (top line of the screen). These actions can be:
    - viewing/modifying general lemma-comments
    - removing lemma
    - modifying stem of lemma
    When the cursor is moved downward to the lemma-window, the calling
    procedure will take over again.
  }

  procedure CopyLemma;
  label
    exit;
  var
    Returnkey,
    DummyKey,
    NewKey          : integer;
    DummyBoolean    : boolean;
    ParticleStem,
    NewStem         : STRING_String;
    MdictRec        : [volatile] MDICTDEF_RecordDef;
    pMdictRec       : ^MDICTDEF_RecordDef;
    SdictRec        : LISDICT_RecordDef;
    IldictRec       : LIILDICT_RecordDef;
    BlexRec         : [volatile] LSDOMAINT_BlexStruct;
    pBlexRec        : ^LSDOMAINT_BlexStruct;
    listree         : LISTREE_pStree;
    lsstree         : LSSTREE_pStree;
    kind            : INTERFACE1_keytype := BAStype;
    CC              : LIMORFDEF_ContextConds;
    FON             : LIMORFDEF_pPhonInfo;
    lsfon           : LSPHONDEF_pPhonInfo;
    where           : LDMDICT_WhereType;

  procedure CopyMeaning;
  begin
    IldictRec.skey := NewKey;
    LIILDICT_WriteSequential(IldictRec);
    if LIMCOMMENT_GetCommentLine(LemmaKey, IldictRec.mkey, commentline)
    then begin
      LIMCOMMENT_WriteSequential(NewKey, IldictRec.mkey, commentline);
      while LIMCOMMENT_GetNextCommentline(LemmaKey, IldictRec.mkey, commentline)
      do LIMCOMMENT_WriteSequential(NewKey, IldictRec.mkey, commentline);
    end;
  end;

  begin
    if not LemmaPartData[BlexPart].exist
    then GiveMessage('Lemma can not be copied. ')
    else begin
      listree := LDBLEX_ReadDirect(LemmaKey);
      LDBLEX_Release;
      if listree = nil
      then begin
        GiveMessage('original Blex record not found. ');
        goto exit;
      end;
      if LemmaPartData[sdictpart].exist
      then begin
        If not GetStem(SdictPartDescr.ctxt[1], ParticleStem)
        then begin
          GiveMessage('Stem of particle not found. ');
          goto exit;
        end;
        STRING_Concat(NewStem, OriginalStem, ParticleStem);
      end
      else NewStem := OriginalStem;
      GenerateKey(SkeyType, LemmaType, listree^.cat,
                  NewStem, NewKey);
      if LemmaPartData[MdictPart].exist
      then begin
        if not RefindMdict(OriginalStem, LemmaKey, kind, CC, FON, where)
        then begin
          GiveMessage('Original Mdict record not found. ');
          goto exit;
        end;
        MdictRec.stem := OriginalStem;
        MdictRec.key  := NewKey;
        MdictRec.kind := kind;
        MdictRec.CC   := CC;
        lsfon := FON::LSPHONDEF_pPhonInfo;
        MdictRec.FON  := lsfon^;
        MdictRec.where:= where;
        pMdictRec     := address(MdictRec);
        LDMDICT_WriteSequential(pMdictRec::LDMDICT_pMdictStruct);
        ChangeLog(mdict, add, NewKey, 0);
      end;
      if LemmaPartData[SdictPart].exist
      then begin
        SdictRec.skey := NewKey;
        if LemmaPartData[MdictPart].exist { e.g. kondig_af }
        then SdictRec.fkey := NewKey  { self-referring }
        else SdictRec.fkey := SdictPartDescr.fkey;
        SdictRec.nr   := SdictPartDescr.nr;
        SdictRec.ctxt[1] := SdictPartDescr.ctxt[1];
        LISDICT_WriteSequential(SdictRec);
        ChangeLog(sdict, add, NewKey, 0);
      end;
      { copy meanings from current lemma to new lemma }
      if LIILDICT_GetAildictAll(LemmaKey, IldictRec)
      then begin
        CopyMeaning;
        while LIILDICT_GetNextAildictAll(LemmaKey, IldictRec)
        do CopyMeaning;
      end;
      LDGETKEY_Put(listree, NewKey);
      BlexRec := MAKET_BlexrecFromStree(NewKey,listree::LSSTREE_pStree);
      BlexRec.IsBxpr := true;
      pBlexRec := address(BlexRec);
      LDBLEX_WriteSequential(pBlexRec::LDBLEX_pBlexStruct);
    end;
    GiveMessage('The new lemma will be shown on the next screen. ');
    EditLemma(Newkey,'',EditLemmaMode,ReturnKey,DummyBoolean,Dummykey,0,0);
  exit:
  end;

  function ExitStemWindow: boolean;
  begin
    ExitStemWindow := 
      ExitLemma or
      (PressedKey = WINDOWS_DownArrowKey) or
      (PressedKey = WINDOWS_NextScreenKey);
  end;

  var
    NewStem: STRING_String;
  begin
    CursorInLemmaWindow := false;
    WINDOWS_NewRowColumn(StemWindow, 1, StemWindowXpos);
    Repeat
      WINDOWS_ReadKey(StemWindow, PressedKey);
      case PressedKey of
        WINDOWS_LeftArrowKey:
         if
           (StemWindowXpos > 1)
         then begin
           StemWindowXpos := StemWindowXpos-1;
           WINDOWS_NewRowColumn(StemWindow, 1, StemWindowXpos);
         end;
        WINDOWS_RightArrowKey:
          if
            (StemWindowXpos < WindowWidth)
          then begin
            StemWindowXpos := StemWindowXpos+1;
            WINDOWS_NewRowColumn(StemWindow, 1, StemWindowXpos);
          end;
        WINDOWS_RemoveKey:
          if EditingAllowed and
             (StemWindowXpos = MaxFieldnameLength+2)
          then begin { remove lemma }
            IF STRING_FindFirstSubString(OriginalStem, ' ', 1) <> 0
            then GiveMessage('A fixed idiom cannot be removed yet. ')
            else begin
              if (BlexPartDescr^.cat = PrepCat) or
                 (BlexPartDescr^.cat = PartCat)
              then begin
                GiveMessage('Not all references to category PREP or PART can be traced. ');
                if AskBoolean('Do you still want to remove this lemma? (y/n) ')
                then begin
                  WINDOWS_WriteChar(StemWindow, '-');
                  WINDOWS_NewRowColumn(StemWindow, 1, StemWindowXpos);
                  LemmaRemoved := true;
                end;
              end
              else begin
                WINDOWS_WriteChar(StemWindow, '-');
                WINDOWS_NewRowColumn(StemWindow, 1, StemWindowXpos);
                LemmaRemoved := true;
              end;
            end;
          end;
        WINDOWS_InsertHereKey:
          if EditingAllowed and
             (StemWindowXpos = MaxFieldnameLength+2)
          then begin { 'un-'remove lemma }
            if LemmaRemoved 
            then begin
              WINDOWS_WriteChar(StemWindow, ':');
              WINDOWS_NewRowColumn(StemWindow, 1, StemWindowXpos);
              LemmaRemoved := false;
            end
            else if AskBoolean(
      'Do you want to copy this lemma (without current modifications)? (y/n) ')
            then begin { copy lemma }
              CopyLemma;
            end;
          end;
        WINDOWS_FindKey:
          if
            (StemWindowXpos = MaxFieldnameLength+1)
          then begin
            CommentKey;
          end;
        WINDOWS_DoKey:
          if EditingAllowed 
          then begin
            if (StemWindowXpos = MaxFieldnameLength+1)
            then CommentKey;
            if (StemWindowXpos > MaxFieldnameLength+3) and
               (StemComposed = NotComposed) 
            then begin { enter new stem }
              IF STRING_FindFirstSubString(OriginalStem, ' ', 1) <> 0
              then GiveMessage('The stem of a fixed idiom cannot be modified yet. ')
              else begin
                AskStem('Enter new stem: ', NewStem);
                if NewStem <> ' '
                then with MdictPartDescr do begin
                  STRING_Trim(NewStem, NewStem);
                  if STRING_FindFirstSubString(NewStem, ' ', 1) <> 0
                  then begin
                    GiveMessage('It is not yet possible to insert fixed idioms. ');
                  end
                  else begin
                    STRING_ExtractChars(stem, StemLength, NewStem, 
                                        1, STRING_Length(NewStem));
                    for i := StemLength+1 to LDMDICT_MaxStem 
                    do stem[i] := ' '; 
                    WINDOWS_NewRowColumn(StemWindow, 1, MaxFieldNameLength+4);
                    WINDOWS_WriteStr(StemWindow, stem, LDMDICT_MaxStem,
                                     LDMDICT_MaxStem, false);
                    WINDOWS_NewRowColumn(Stemwindow, 1, StemWindowXpos);
                    StemModified := true;
                    LemmaPartData[mdictpart].modified := true;
                  end;
                end;
              end;
            end;
          end;
        WINDOWS_F10Key: CommentKey;
        WINDOWS_DownArrowKey:
          begin
            LemmaWindowXPos := StemWindowXpos;
            LemmaWindowYPos := 1;
            CursorPos := 1;
            WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
          end;
        WINDOWS_NextScreenKey:
          begin
            LemmaWindowXPos := StemWindowXpos;
            LemmaWindowYPos := 12;
            CursorPos := 12;
            WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
          end;
        WINDOWS_F14Key: ReferenceKey;
        WINDOWS_F20Key:
          begin
            if STRTOKEY_GetSkeyStr(LemmaKey, KeyString)
            then begin
              GiveMessage(KeyString);
              FILES_WriteString(keynotefile, KeyString, STRING_Length(KeyString)+1,
                                true);
              FILES_WriteLine(keynotefile, true);
            end
            else GiveMessage('Key string not found. ');
            STRTOKEY_Release;
          end;
        WINDOWS_SelectKey: SelectKey;
        Otherwise ;
      end;
    until ExitStemWindow;
    if (PressedKey = WINDOWS_DownArrowKey) or
       (PressedKey = WINDOWS_NextScreenKey)
    then PressedKey := 0; { to prevent action in calling procedure, function
                            already handled in this procedure }
    CursorInLemmaWindow := true;
  end;

  procedure SaveChanges;
  { 
    In this procedure all modifications are made definite in the database.
  }
  label
    exit;
  var 
    MdictRec: [volatile] MDICTDEF_RecordDef;
    pMdictRec: ^MDICTDEF_RecordDef;
    BlexRec: [volatile] LSDOMAINT_BlexStruct;
    pBlexRec: ^LSDOMAINT_BlexStruct;
    UpdateStatus : VMSRMS_StatusType;
    i: integer;
    NoNext,
    found: boolean;
    DummyBlex: LISTREE_pStree;
    DummySiddict: LISIDDICT_RecordDef;
    DummyIddict: LIIDDICT_RecordDef;
    DummyIldict: LIILDICT_RecordDef;
    DummyMkey: integer;
    StringKey: STRING_String;
    s: STRING_String;

  procedure Error(status: VMSRMS_StatusType;
                  message: STRING_String);
  { 
    Extends message parameter dependent on status and shows this message
    on the screen.
  }
  var 
    s: STRING_String;
  begin
    case status of
      VMSRMS_Error         : s := 'general failure. ';
      VMSRMS_EndOfFile     : s := 'end of file. ';
      VMSRMS_RecordNotFound: s := 'record not found. ';
      VMSRMS_FileNotFound  : s := 'file not found. ';
      VMSRMS_RecordLocked  : s := 'record locked. ';
      VMSRMS_FileLocked    : s := 'file locked. ';
      otherwise              s := 'unknown failure. ';
    end;
    STRING_Append(message, s);
    GiveMessage(message);
  end;

  function RefindILRecord(m: LIILDICT_RecordDef): boolean;
  {
    Reads again a specific IL-record.
  }
  var NoNext, found: boolean;
      DummyIldict: LIILDICT_RecordDef;
  begin
    found := false;
    if LIILDICT_GetGILDictAll(m.mkey, DummyIldict)
    then begin
      found := (DummyIldict.skey = m.skey);
      NoNext := false;
      while not (found or NoNext) do 
        if LIILDICT_GetNextGILDictAll(m.mkey, DummyIldict) 
        then found := (DummyIldict.skey = m.skey)
        else NoNext := true;
    end;
    RefindILRecord := found;
  end;

  function SemiIdiomReferences(skey: integer): boolean;
  { 
    Checks if this lemma is used as an argument in a semi-idiom.
  }
  var 
    found: boolean;
  begin
    found := false;
    LISIDDICT_SetIndex(1);
    LISIDDICT_Reset;
    while not found and LISIDDICT_GetNextSiddict(SiddictBuffer)
    do begin
      found := CheckSemiIdiomArgument(SiddictBuffer, skey);
    end;
    SemiIdiomReferences := found;
  end;

  function IdiomReferences(skey: integer): boolean;
  { 
    Checks if this lemma is used as an argument in an idiom.
  }
  var 
    found: boolean;
  begin
    found := false;
    LIIDDICT_SetIndex(1);
    LIIDDICT_Reset;
    while not found and LIIDDICT_GetNextIddict(IddictBuffer)
    do begin
      found := CheckIdiomArgument(IddictBuffer, skey);
    end;
    IdiomReferences := found;
  end;

  begin
    StartWait;

    if LemmaRemoved
    then begin
      with SiddictPartDescr do begin
        i := 1;
        while LemmaRemoved and (i <= nr) do begin
          if not sids[i].removed
          then begin
            LemmaRemoved := false;
            StopWait;
            GiveMessage('There are still semi idioms: lemma not removed. ');
          end
          else i := i+1;
        end;
      end;
      if LemmaRemoved
      then with IddictPartDescr do begin
        i := 1;
        while LemmaRemoved and (i <= nr) do begin
          if not ids[i].removed
          then begin
            LemmaRemoved := false;
            StopWait;
            GiveMessage('There are still idioms: lemma not removed. ');
          end 
          else i := i+1;
        end;
      end;
      if LemmaRemoved
      then with IldictPartDescr do begin
        i := 1;
        while LemmaRemoved and (i <= nr) do begin
          if not meanings[i].removed
          then begin
            LemmaRemoved := false;
            StopWait;
            GiveMessage('There are still meanings: lemma not removed. ');
          end
          else i := i+1;
        end;
      end;
      if LemmaRemoved
      then begin
        if SemiIdiomReferences(LemmaKey)
        then begin
          LemmaRemoved := false;
          StopWait;
          GiveMessage('A semi idiom is still referring to this lemma: lemma not removed. ');
        end;
      end;
      if LemmaRemoved
      then begin
        if IdiomReferences(LemmaKey)
        then begin
          LemmaRemoved := false;
          StopWait;
          GiveMessage('An idiom is still referring to this lemma: lemma not removed. ');
        end;
      end; 
      if LemmaRemoved
      then begin
        if LISDICT_GetASDict(LemmaKey, SdictBuffer)
        then begin
          LemmaRemoved := false;
          StopWait;
          GiveMessage('A particle is still assigned to this lemma: lemma not removed. ');
        end;
      end;
      if not LemmaRemoved
      then begin { stay in lemma, don't save }
        PressedKey := 0;
        goto exit;
      end;
    end;

    if LemmaPartData[mdictpart].exist and
       LemmaPartData[mdictpart].modified and
       not LemmaRemoved { removal of mdict later in this procedure }
    then begin
      if StemComposed <> NotComposed
      then MdictRec.stem := OriginalStem
      else MdictRec.stem := MdictPartDescr.stem;
      MdictRec.kind := MdictpartDescr.kind;
      MdictRec.CC   := MdictpartDescr.CC;
      lsfon := MdictPartDescr.FON::LSPHONDEF_pPhonInfo;
      MdictRec.FON  := lsfon^;
      MdictRec.where:= MdictpartDescr.where;
      MdictRec.KEY  := MdictpartDescr.KEY;
      pMdictRec := address(MdictRec);
      if MdictPartDescr.StemModified
      then begin
        LDMDICT_WriteSequential(pMdictRec::LDMDICT_pMdictStruct);
        { No test on status, because VMSRMS does not handle the status
          OK_DUP correctly }
        ChangeLog(mdict, add, LemmaKey, 0);
      end;
      if not RefindMdict(OriginalStem, LemmaKey, kind, CC, FON, where)
      then GiveMessage('Cannot refind mdict record. ')
      else begin
        if MdictPartDescr.StemModified
        then begin
          UpdateStatus := LDMDICT_Delete;
          if UpdateStatus = VMSRMS_NoError
          then ChangeLog(mdict, Delete, MdictRec.key, 0)
          else Error(UpdateStatus, 'Delete Mdict: ');
        end
        else begin
          UpdateStatus := LDMDICT_Update(pMdictRec::LDMDICT_pMDictStruct);
          if UpdateStatus = VMSRMS_NoError
          then ChangeLog(mdict, Modify, MdictRec.key, 0)
          else Error(UpdateStatus, 'Update Mdict: ');
        end; 
      end;
    end;

    if LemmaPartData[siddictpart].exist and
       LemmaPartData[siddictpart].modified
    then with SiddictPartDescr do begin
      i := 1;
      while (i <= nr) and (i < FirstAdded) do with sids[i] do begin
        if removed
        then begin
          if LISIDDICT_GetGSiddict(sid.sidskey, DummySiddict)
          then begin
            LISIDDICT_Delete;
            ChangeLog(siddict, delete, LemmaKey, sid.sidskey);
          end;
          if RefindIlRecord(OldMkey)
          then begin
            LIILDICT_Delete;
            ChangeLog(ildict, delete, sid.sidskey, OldMkey.mkey);
          end;
          DummyBlex := LDBLEX_ReadDirect(sid.sidskey);
          if DummyBlex <> nil
          then LDBLEX_Delete;
          if LISCOMMENT_GetCommentLine(sid.sidskey, commentline)
          then begin
            LISCOMMENT_Delete;
            while LISCOMMENT_GetNextCommentLine(sid.sidskey, commentline)
            do LISCOMMENT_Delete;
          end;
        end
        else begin
          if modified
          then 
            if not LISIDDICT_GetGSiddict(sid.sidskey, DummySiddict)
            then GiveMessage('Cannot refind Siddict record. ')
            else begin
              UpdateStatus := LISiddict_Update(sid);
              if UpdateStatus = VMSRMS_NoError
              then ChangeLog(siddict, modify, LemmaKey, sid.sidskey)
              else Error(UpdateStatus, 'Update Siddict: ');
            end;
          if MkeyModified
          then
            if not RefindILRecord(OldMkey)
            then GiveMessage('Cannot refind Ildict record. ')
            else begin
              if Mkey.mkey = 0
              then begin
                STRING_Constant(StringKey, MdictPartDescr.stem, LDMDICT_MaxStem);
                STRING_Trim(StringKey,StringKey);
                STRING_Append(StringKey,argstem);
                GenerateKey(MkeyType, SemiIdiomType, BlexPartDescr^.cat,
                            StringKey, Mkey.mkey);
              end;
              UpdateStatus := LIIldict_Delete;
              if UpdateStatus = VMSRMS_NoError
              then ChangeLog(ildict, delete, sid.sidskey, OldMkey.mkey)
              else Error(UpdateStatus, 'Delete Ildict: ');
              LIILDICT_WriteSequential(Mkey);
              ChangeLog(ildict, add, sid.sidskey, Mkey.mkey);
            end;
          if CommentsModified 
          then begin
            j := 0;
            if LISCOMMENT_GetCommentLine(sid.sidskey, CommentLine)
            then begin
              j := 1;
              if j > NrComments 
              then LISCOMMENT_Delete
              else LISCOMMENT_Update(Comments[j]);
              while LISCOMMENT_GetNextCommentLine(sid.sidskey, CommentLine)
              do begin
                j := j+1;
                if j > NrComments 
                then LISCOMMENT_Delete
                else LISCOMMENT_Update(Comments[j]);
              end;
            end;
            while j < NrComments do begin
              j := j+1;
              LISCOMMENT_WriteSequential(sid.sidskey, Comments[j]);
            end;
          end;
        end;
        i := i+1; 
      end;
      while (i <= nr) do with sids[i] do begin
        if not removed
        then begin
          if modified
          then begin
            STRING_Constant(StringKey, MdictPartDescr.stem, LDMDICT_MaxStem);
            STRING_Trim(StringKey,StringKey);
            STRING_Append(StringKey,argstem);
            if GenerateKey(SkeyType, SemiIdiomType, BlexPartDescr^.cat,
                           StringKey, sid.sidskey) 
            then begin
              if Mkey.mkey = 0
              then
                GenerateKey(MkeyType, SemiIdiomType, BlexPartDescr^.cat,
                            StringKey, Mkey.mkey);
              LISiddict_WriteSequential(sid);
              ChangeLog(siddict, add, LemmaKey, sid.sidskey);
              DummyIldict.skey := sid.sidskey;
              DummyIldict.mkey := Mkey.mkey;
              DummyIldict.spref := 0;
              DummyIldict.mpref := 0;
              DummyIldict.md := ' ';
              DummyIldict.ag := LIILDICT_Both;
              DummyIldict.marked := false;
              LIILDICT_WriteSequential(DummyIldict);
              ChangeLog(ildict, add, sid.sidskey, Mkey.mkey);
              LDGETKEY_Put(BlexPartDescr, sid.sidskey); 
              BlexRec := MAKET_BlexrecFromStree(LemmaKey,
                           BlexPartDescr::LSSTREE_pStree);
              BlexRec.key := sid.sidskey;
              BlexRec.IsBxpr := true;
              pBlexRec := address(BlexRec);
              LDBLEX_WriteSequential(pBlexRec::LDBLEX_pBlexStruct);
              LDGETKEY_Put(BlexPartDescr, LemmaKey); 
            end;
          end;
          if CommentsModified 
          then begin
            for j := 1 to NrComments do 
              LISCOMMENT_WriteSequential(sid.sidskey, comments[j]);
          end;
        end;
        i := i+1;
      end;
    end; { with SiddictPartDescr }
      

    if LemmaPartData[Iddictpart].exist and
       LemmaPartData[Iddictpart].modified
    then with IddictPartDescr do begin
      i := 1;
      while (i <= nr) and (i < FirstAdded) do with ids[i] do begin
        if removed
        then begin
          if LIIDDICT_GetGiddict(idiom.idskey, DummyIddict)
          then begin
            LIIDDICT_Delete;
            ChangeLog(iddict, delete, LemmaKey, idiom.idskey);
          end;
          if RefindIlRecord(OldMkeys[1])
          then begin
            LIILDICT_Delete;
            ChangeLog(ildict, delete, idiom.idskey, OldMkeys[1].mkey);
          end;
          DummyBlex := LDBLEX_ReadDirect(idiom.idskey);
          if DummyBlex <> nil
          then LDBLEX_Delete;
          if LISCOMMENT_GetCommentLine(idiom.idskey, commentline)
          then begin
            LISCOMMENT_Delete;
            while LISCOMMENT_GetNextCommentLine(idiom.idskey, commentline)
            do LISCOMMENT_Delete;
          end;
        end
        else begin
          if modified
          then 
            if not LIIddict_GetGIddict(idiom.idskey, DummyIddict)
            then GiveMessage('Cannot refind Iddict record. ')
            else begin
              if ArgsModified 
              then begin
                LIIDDICT_Delete;
                if not LIIDDICT_WriteSequential(idiom)
                { RMS returns error status but apparently nothing goes wrong !!! }
                then { GiveMessage('Update Iddict: delete-write failure. ') };
                ChangeLog(iddict, modify, LemmaKey, idiom.idskey);
              end 
              else begin
                UpdateStatus := LIIddict_Update(idiom);
                if UpdateStatus = VMSRMS_NoError
                then ChangeLog(iddict, modify, LemmaKey, idiom.idskey)
                else Error(UpdateStatus, 'Update Iddict: ');
              end;
            end;
          if MkeyModified[1]
          then
            if not RefindILRecord(OldMkeys[1])
            then GiveMessage('Cannot refind Ildict record. ')
            else begin
              if mkeys[1].mkey = 0
              then begin
                STRING_Constant(StringKey, MdictPartDescr.stem, LDMDICT_MaxStem);
                STRING_Trim(StringKey,StringKey);
                for j := 2 to idiom.args.nrargs do 
                  STRING_Append(StringKey,argpos[j].argstem);
                GenerateKey(MkeyType, IdiomType, BlexPartDescr^.cat,
                            StringKey, mkeys[1].mkey);
              end;
              UpdateStatus := LIIldict_Delete;
              if UpdateStatus = VMSRMS_NoError
              then ChangeLog(ildict, delete, idiom.idskey, OldMkeys[1].mkey)
              else Error(UpdateStatus, 'Delete Ildict: ');
              LIILDICT_WriteSequential(Mkeys[1]);
              ChangeLog(ildict, add, idiom.idskey, Mkeys[1].mkey);
            end;
          if CommentsModified 
          then begin
            j := 0;
            if LISCOMMENT_GetCommentLine(idiom.idskey, CommentLine)
            then begin
              j := 1;
              if j > NrComments 
              then LISCOMMENT_Delete
              else LISCOMMENT_Update(Comments[j]);
              while LISCOMMENT_GetNextCommentLine(idiom.idskey, CommentLine)
              do begin
                j := j+1;
                if j > NrComments 
                then LISCOMMENT_Delete
                else LISCOMMENT_Update(Comments[j]);
              end;
            end;
            while j < NrComments do begin
              j := j+1;
              LISCOMMENT_WriteSequential(idiom.idskey, Comments[j]);
            end;
          end;
        end;
        i := i+1; 
      end;
      while (i <= nr) do with ids[i] do begin
        if not removed
        then begin
          if modified
          then begin
            STRING_Constant(StringKey, MdictPartDescr.stem, LDMDICT_MaxStem);
            STRING_Trim(StringKey,StringKey);
            for j := 2 to idiom.args.nrargs do 
              STRING_Append(StringKey,argpos[j].argstem);
            if GenerateKey(SkeyType, IdiomType, BlexPartDescr^.cat,
                           StringKey, idiom.idskey) 
            then begin
              if mkeys[1].mkey = 0
              then GenerateKey(MkeyType, IdiomType, BlexPartDescr^.cat,
                               StringKey, mkeys[1].mkey);
              LIiddict_WriteSequential(idiom);
              ChangeLog(iddict, add, LemmaKey, idiom.idskey);
              with DummyIldict do begin
                skey := idiom.idskey;
                mkey := mkeys[1].mkey;
                spref := 0;
                mpref := 0;
                md := ' ';
                ag := LIILDICT_Both;
                marked := false;
              end;
              LIILDICT_WriteSequential(DummyIldict);
              ChangeLog(ildict, add, idiom.idskey, Mkeys[1].mkey);
              LDGETKEY_Put(BlexPartDescr, idiom.idskey); 
              BlexRec := MAKET_BlexrecFromStree(LemmaKey,
                           BlexPartDescr::LSSTREE_pStree);
              BlexRec.key := idiom.idskey;
              BlexRec.IsBxpr := true;
              pBlexRec := address(BlexRec);
              LDBLEX_WriteSequential(pBlexRec::LDBLEX_pBlexStruct);
              LDGETKEY_Put(BlexPartDescr, LemmaKey); 
            end;
          end;
          if CommentsModified 
          then begin
            for j := 1 to NrComments do 
              LISCOMMENT_WriteSequential(idiom.idskey, comments[j]);
          end;
        end;
        i := i+1;
      end;
{abc}
    end; { with IddictPartDescr }
      
    if LemmaPartData[Ildictpart].exist and
       LemmaPartData[Ildictpart].modified
    then with IldictPartDescr do begin
      i := 1;
      while (i <= nr) and (i < FirstAdded) do with meanings[i] do begin
        if removed
        then begin
          if not RefindIlRecord(OldM)
          then GiveMessage('Cannot refind Ildict record. ')
          else begin
            UpdateStatus := LIILDICT_Delete;
            ChangeLog(ildict, delete, LemmaKey, OldM.mkey);
            if LIMCOMMENT_GetCommentLine(LemmaKey, OldM.mkey, commentline)
            then begin
              LIMCOMMENT_Delete;
              while LIMCOMMENT_GetNextCommentLine(LemmaKey, OldM.mkey, commentline)
              do LIMCOMMENT_Delete;
            end;
          end;
        end 
        else begin
          if modified
          then 
            if not RefindILRecord(OldM)
            then GiveMessage('Cannot refind Ildict record. ')
            else begin
              WINDOWS_ReadLineFromDisplay(LemmaWindow, s, 
                                          LemmaPartData[ildictpart].startline+i-1);
              STRING_ExtractChars(m.md, len, s, MaxFieldnameLength+4, 
                                  STRING_Length(s)-MaxFieldnameLength-4);
              if m.mkey <> OldM.mkey
              then begin
                CommentsModified := true; { other key }
                if m.mkey = 0
                then begin
                  STRING_Constant(StringKey, MdictPartDescr.stem, LDMDICT_MaxStem);
                  STRING_Trim(StringKey,StringKey);
                  GenerateKey(MkeyType, IdiomType, BlexPartDescr^.cat,
                              StringKey, m.mkey);
                end;
                UpdateStatus := LIILDICT_Delete; 
                if UpdateStatus = VMSRMS_NoError
                then ChangeLog(ildict, delete, LemmaKey, Oldm.mkey)
                else Error(UpdateStatus, 'Delete Ildict: ');
                LIILdict_WriteSequential(m);
                changeLog(ildict, add, LemmaKey, m.mkey);
              end else begin
                UpdateStatus := LIIldict_Update(m);
                if UpdateStatus = VMSRMS_NoError
                then ChangeLog(ildict, modify, LemmaKey, m.mkey)
                else Error(UpdateStatus, 'Update Ildict: ');
              end;
            end;
          if CommentsModified 
          then begin
            j := 0;
            if LIMCOMMENT_GetCommentLine(LemmaKey, oldm.mkey, CommentLine)
            then begin
              if m.mkey = OldM.mkey
              then begin
                j := 1;
                if j > NrComments 
                then LIMCOMMENT_Delete
                else LIMCOMMENT_Update(Comments[j]);
                while LIMCOMMENT_GetNextCommentLine(LemmaKey, m.mkey, CommentLine)
                do begin
                  j := j+1;
                  if j > NrComments 
                  then LIMCOMMENT_Delete
                  else LIMCOMMENT_Update(Comments[j]);
                end;
                while j < NrComments do begin
                  j := j+1;
                  LIMCOMMENT_WriteSequential(LemmaKey, m.mkey, Comments[j]);
                end;
              end
              else begin
                { other key: add records with new key and delete old ones }
                for j := 1 to NrComments do
                  LIMCOMMENT_WriteSequential(LemmaKey, m.mkey, comments[j]);
                if LIMCOMMENT_GetCommentLine(LemmaKey, OldM.mkey, commentline)
                then begin
                  LIMCOMMENT_Delete;
                  while LIMCOMMENT_GetNextCommentLine(LemmaKey, OldM.mkey, commentline)
                  do LIMCOMMENT_Delete;
                end;
              end;
            end
            else begin
              while j < NrComments do begin
                j := j+1;
                LIMCOMMENT_WriteSequential(LemmaKey, m.mkey, Comments[j]);
              end;
            end;
          end;
        end;
        i := i+1; 
      end;
      while (i <= nr) do with meanings[i] do begin
        if not removed
        then begin
          if modified
          then begin
            WINDOWS_ReadLineFromDisplay(LemmaWindow, s, 
                                        LemmaPartData[ildictpart].startline+i-1);
            STRING_ExtractChars(m.md, len, s, MaxFieldnameLength+4, 
                                STRING_Length(s)-MaxFieldnameLength-4);
            STRING_Constant(StringKey, MdictPartDescr.stem, LDMDICT_MaxStem);
            STRING_Trim(StringKey,StringKey);
            if m.mkey = 0
            then GenerateKey(MkeyType, LemmaType, BlexPartDescr^.cat,
                             StringKey, m.mkey);
            LIILdict_WriteSequential(m);
            ChangeLog(ildict, add, LemmaKey, m.mkey);
          end;
          if CommentsModified 
          then begin
            for j := 1 to NrComments do 
              LIMCOMMENT_WriteSequential(LemmaKey, m.mkey, comments[j]);
          end;
        end;
        i := i+1;
      end;
    end; { with IldictPartDescr }
      
    if LemmaPartData[blexpart].exist and
       LemmaPartData[blexpart].modified and
       not LemmaRemoved { removal of blex record later in this procedure }
    then begin
      DummyBlex := LDBLEX_ReadDirect(LemmaKey);
      if DummyBlex = nil
      then GiveMessage('Cannot refind blex record. ')
      else begin
        BlexRec := MAKET_BlexrecFromStree(LemmaKey, 
                              BlexPartDescr::LSSTREE_pStree);
        pBlexRec := address(BlexRec);
        UpdateStatus := LDBLEX_Update(pBlexRec::LDBLEX_pBlexStruct);
        if UpdateStatus = VMSRMS_NoError
        then ChangeLog(blex, modify, LemmaKey, 0)
        else Error(UpdateStatus, 'Update Blex: ');
      end;
    end;

    if CommentPartDescr.modified and
       not LemmaRemoved { removal of comments later in this procedure }
    then with CommentPartDescr do begin
      i := 0;
      if LISCOMMENT_GetCommentLine(LemmaKey, CommentLine)
      then begin
        i := 1;
        if i > NrComments 
        then LISCOMMENT_Delete
        else LISCOMMENT_Update(Comments[i]);
        while LISCOMMENT_GetNextCommentLine(LemmaKey, CommentLine)
        do begin
          i := i+1;
          if i > NrComments 
          then LISCOMMENT_Delete
          else LISCOMMENT_Update(Comments[i]);
        end;
      end;
      while i < NrComments do begin
        i := i+1;
        LISCOMMENT_WriteSequential(LemmaKey, Comments[i]);
      end;
    end;

    if LemmaRemoved
    then begin
      if LemmaPartData[mdictpart].exist
      then begin
        if not RefindMdict(OriginalStem,LemmaKey,kind,CC,FON,where)
        then GiveMessage('Cannot refind mdict record. ')
        else begin
          UpdateStatus := LDMDICT_Delete;
          if UpdateStatus = VMSRMS_NoError
          then ChangeLog(mdict, Delete, LemmaKey, 0)
          else Error(UpdateStatus, 'Delete Mdict: ');
        end;
      end;
      if LemmaPartData[sdictpart].exist
      then begin
        if not LISDICT_GetGSDict(LemmaKey, SdictBuffer)
        then GiveMessage('Cannot refind sdict record. ')
        else begin
          UpdateStatus := LISDICT_Delete;
          if UpdateStatus = VMSRMS_NoError
          then ChangeLog(sdict, Delete, SdictBuffer.skey, 0)
          else Error(UpdateStatus, 'Delete Sdict: ');
        end;
      end;
      if LemmaPartData[blexpart].exist
      then begin
        DummyBlex := LDBLEX_ReadDirect(LemmaKey);
        if DummyBlex = nil
        then GiveMessage('Cannot refind blex record. ')
        else begin
          UpdateStatus := LDBLEX_Delete;
          if UpdateStatus = VMSRMS_NoError
          then ChangeLog(blex, Delete, LemmaKey, 0)
          else Error(UpdateStatus, 'Delete Blex: ');
        end;
      end;
      with CommentPartDescr do begin
        if LISCOMMENT_GetCommentLine(LemmaKey, CommentLine)
        then begin
          LISCOMMENT_Delete;
          while LISCOMMENT_GetNextCommentLine(LemmaKey, CommentLine)
          do begin
            LISCOMMENT_Delete;
          end;
        end;
      end;    
    end;

  exit:
    StopWait;
  end;

procedure ProcessSiddictRecord;
{
  A Siddict record has been read successfully. This procedure does 
  initializations and reads related records.
}
begin
  with SiddictPartDescr do begin
    with sids[nr] do begin
       sid := SiddictBuffer;
       modified := false;
       removed  := false;
       ArgPresent := true;
       ArgnrPresent := true;
       { find mkey for this semi idiom }
       if LIILDICT_GetAILDictAll(sid.sidskey, mkey)
       then begin
         oldmkey := mkey;
         MkeyModified := false;
       end;
       { read idiom comments }
       CommentsModified := false;
       NrComments := 0;
       if LISCOMMENT_GetCommentLine(sid.sidskey, Comments[1]) then begin
         NrComments := 1;
         ExitLoop := false;
         while not ExitLoop do begin
           if LISCOMMENT_GetNextCommentLine(sid.sidskey, Comments[NrComments+1]) 
           then NrComments := NrComments+1
           else ExitLoop := true;
           if NrComments = MaxNrCommentLines
           then ExitLoop := true;
         end;
       end;
    end;
  end;
end;
 
procedure ProcessIddictRecord;
{
  An Iddict record has been read successfully. This procedure does 
  initializations and reads related records.
}
var j: integer;
begin
  with IddictPartDescr do begin
     with ids[nr] do begin
       idiom := IddictBuffer;
       modified := false;
       removed  := false;
       ArgsModified := false;
       PatternModified := false;
       ArgPresent := true;
       PatternPresent := true;

       { find mkey(s) for this idiom }
       if LIILDICT_GetAILDictAll(idiom.idskey, mkeys[1])
       then begin
         nrmkeys := 1;
         oldmkeys[1] := mkeys[1];
         MkeyModified[1] := false;
         j := 2;
         while (j <= MaxIdiomMkeys) and
             LIILDICT_GetNextAILDictAll(idiom.idskey, mkeys[j]) 
           do begin
             nrmkeys := j;
             oldmkeys[j] := mkeys[j];
             MkeyModified[j] := false;
             j := j+1;
           end;
       end 
       else GiveMessage('No mkey found for idiom. ');

       { read idiom comments }
       CommentsModified := false;
       NrComments := 0;
       if LISCOMMENT_GetCommentLine(idiom.idskey, Comments[1]) then begin
         NrComments := 1;
         ExitLoop := false;
         while not ExitLoop do begin
           if LISCOMMENT_GetNextCommentLine(idiom.idskey, Comments[NrComments+1]) 
           then NrComments := NrComments+1
           else ExitLoop := true;
           if NrComments = MaxNrCommentLines
           then ExitLoop := true;
         end;
       end;
     end;
  end;
end; 

procedure ProcessIldictRecord;
{
  An Ilddict record has been read successfully. This procedure does 
  initializations and reads related records.
}
begin
  with IldictPartDescr do begin
    with Meanings[nr] do begin
       m := IldictBuffer;
       oldm := IldictBuffer;
       modified := false;
       removed  := false;
       DescrPresent := true;
       { Read ildict Comment part }
       CommentsModified := false;
       NrComments := 0;
       if LIMCOMMENT_GetCommentLine(LemmaKey, m.mkey, Comments[1]) then begin
         NrComments := 1;
         while (NrComments < MaxNrCommentLines) and
               LIMCOMMENT_GetNextCommentLine(LemmaKey, m.mkey, Commentline)
         do begin
           NrComments := NrComments+1;
           Comments[NrComments] := Commentline;
         end;
       end;
    end; { with Meanings[nr] }
  end;
end;

BEGIN
   MEM_MarkDefault(StackPtr);
   EditLemmaInit;

   LemmaLocked := false;
   EditingAllowed := false;
   if ( (EditorMode = EditLemmaMode) or
        (EditorMode = ShowTranslationMode) 
      ) and not ViewMode
   then begin
     if not LILOCK_write(LemmaKey) { try to lock lemma }
     then begin
       GiveMessage('This lemma is currently locked by another user. It can only be viewed now. ');
       if EditorMode = EditLemmaMode
       then EditorMode := ViewLemmaMode; { otherwise unchanged }
     end
     else begin
       LemmaLocked := true; { lemma locked for other users }
       EditingAllowed := true;
     end;
   end;
   if ViewMode and (EditorMode = EditLemmaMode)
   then EditorMode := ViewLemmaMode;

   { Read all lemma information from databases}

   { If there is aan Sdict entry for this key, it is an particle word. In that
     case the stem will be composed from the stems of the fonetic key and the
     particle. If there is no Sdict entry, a normal Mdict entry is expected }
   if LISDICT_GetGSDICT(lemmakey, SdictPartDescr)
   then begin
     LemmaPartData[sdictpart].exist := true;
     { Read phonetical key }
     if not LDMDICT_GetGMDict(OriginalStem, kind, CC, FON, where, SdictPartDescr.fkey)
     then GiveMessage('Phonetical key not found. ')
     else begin
       MdictPartDescr.stem  := OriginalStem;
       MdictPartDescr.kind  := kind;
       MdictPartDescr.CC    := CC;
       MdictPartDescr.FON   := FON;
       MdictPartDescr.where := where;
       MdictPartDescr.KEY   := SdictPartDescr.fkey;
       if not LDMDICT_GetGMDict(stem, kind, CC, FON, where, 
                                SdictPartDescr.ctxt[1])
       then GiveMessage('Context key not found. ')
       else begin
         { concatenate stem + contextkey }
         ConcatStem(MdictPartDescr.stem, stem, MdictPartDescr.stem);
         StemComposed := ViaSdict;
       end;
       if (SdictPartDescr.fkey = SdictPartDescr.skey) {e.g. kondig_aan }
       then LemmaPartData[mdictpart].exist := true;
     end
   end
   else begin { no phonetical key: read mdict entry }
     if SelectionStem <> '' { user has supplied a specific stem }
     then begin
       { search for stem with the original user supplied stem, to prevent
         that a lemma with the same skey but a different stem (e.g. a, an) will
         be taken. }
       if RefindMdict(SelectionStem, Lemmakey, kind, CC, FON, where)
       then begin
         OriginalStem := SelectionStem;
         LemmaPartData[mdictpart].exist := true;
       end
       else begin
         OriginalStem := '';
         LemmaPartData[mdictpart].exist := false;
       end
     end
     else begin
       if LDMDICT_GetGMDict(OriginalStem, kind, CC, FON, where, LemmaKey)
       then LemmaPartData[mdictpart].exist := true;
     end;
       
     if LemmaPartData[mdictpart].exist 
     then begin
       MdictPartDescr.stem  := OriginalStem;
       MdictPartDescr.kind  := kind;
       MdictPartDescr.CC    := CC;
       MdictPartDescr.FON   := FON;
       MdictPartDescr.where := where;
       MdictPartDescr.KEY   := LemmaKey;
       STR_Trim(DummyString, MdictPartDescr.StemLength, 
                OriginalStem, STRING_Length(OriginalStem));
       MdictPartDescr.StemModified := false;
     end
     else MdictPartDescr.stem := '';
   end;
     
   { Read Siddict part }
   if LISIDDICT_GetASIDDict(LemmaKey, SiddictBuffer)
   then with SiddictPartDescr do begin
     LemmaPartData[siddictpart].exist := true;
     nr := 1; { initialization }
     ProcessSiddictRecord;
     while (nr < MaxSemiIdioms) and
           LISIDDICT_GetNextASIDDict(LemmaKey, SiddictBuffer) 
     do begin
       nr := nr+1;
       ProcessSiddictRecord;
     end;
     FirstAdded := nr+1;
   end;

   { Read Iddict part }

   if LIIDDICT_GetHeadIDDict(LemmaKey, IddictBuffer)
   then with IddictPartDescr do begin
     LemmaPartData[iddictpart].exist := true;
     nr := 1;
     ProcessIddictRecord;
     while (nr < MaxIdioms) and
           LIIDDICT_GetNextHeadIDDict(LemmaKey, IddictBuffer) 
     do begin
       nr := nr+1;
       ProcessIddictRecord;
     end;
     FirstAdded := nr+1;
   end;

   { Read Ildict part }
   if LIILDICT_GetAILDictAll(LemmaKey, IldictBuffer)
   then with IldictPartDescr do begin
     LemmaPartData[ildictpart].exist := true;
     nr := 1;
     ProcessIldictRecord;
     while (nr < MaxMeanings) and
           LIILDICT_GetNextAILDictAll(LemmaKey, IldictBuffer) 
     do begin
       nr := nr+1;
       ProcessIldictRecord;
     end;
     FirstAdded := nr+1;
   end;

   { Read Blex part }
   BlexPartDescr := LDBLEX_ReadDirect( LemmaKey);
   if BlexPartDescr <> nil 
   then LemmaPartData[blexpart].exist := true
   else begin
     GiveMessage('Blex part not found. ');
     if EditorMode = EditLemmaMode
     then EditorMode := ViewLemmaMode; 
   end;

   { Read Particle part }
   if not (PartCat = LICAT0) { category particle unknown } and 
      ( CheckCategory(BverbCat) or CheckCategory(PrepCat) ) and not
      ( (StemComposed = ViaSdict) and
        not LemmaPartData[mdictpart].exist { e.g. kondig_aan: allowed to add particles }
      ) { lemma is already particle word }
   then with ParticlePartDescr do begin
     LemmaPartData[ParticlePart].exist := true;
     nr := 0;
     if LISDICT_GetASDict(LemmaKey, SdictBuffer)
     then begin
       repeat
         if SdictBuffer.skey <> LemmaKey { e.g. 'kondig_aan' }
         then begin
           nr := nr+1;
           particles[nr].key := SdictBuffer.skey;
           if not GetStem(SdictBuffer.ctxt[1], particles[nr].stem) 
           then begin
             GiveMessage('Stem of particle not found. ');
             particles[nr].stem := '?????';
           end;
         end; 
       until not LISDICT_GetNextASdict(LemmaKey, SdictBuffer) or
             (Nr = MaxParticles);
     end;
   end;

   { Read Comment part }
   with CommentPartDescr do begin
     modified := false;
     NrComments := 0;
     if LISCOMMENT_GetCommentLine(LemmaKey, Comments[1]) then begin
       NrComments := 1;
       ExitLoop := false;
       while not ExitLoop do begin
       if LISCOMMENT_GetNextCommentLine(LemmaKey, Comments[NrComments+1]) 
         then NrComments := NrComments+1
         else ExitLoop := true;
         if NrComments = MaxNrCommentLines
         then ExitLoop := true;
       end;
     end;
   end;

   { release all records; locking is achieved explicitly by storing the
     lemma skey in a special file temporary }
   LDMDICT_Release;
   LISIDDICT_Release;
   LIIDDICT_Release;
   LIILDICT_Release;
   LDBLEX_Release;
   LISDICT_Release;
   LISCOMMENT_Release;
   LIMCOMMENT_Release;
   STRTOKEY_Release;
   STRTOMKEY_Release;

   { Show lemma parts }

   WINDOWS_ClearWindow(LemmaWindow);
   NumberOfLines := 1;

   { Show Mdict part, except for the stem }
   if LemmaPartData[mdictpart].exist
   then begin
     LemmaPartData[mdictpart].startline := NumberOfLines;
     { context conditions }
     { where info }
     WINDOWS_WriteStr(LemmaWindow, 'where ', 
                      MaxFieldNameLength, MaxFieldNameLength, true);
     WINDOWS_WriteStr(LemmaWindow, ' : ', 3, 3, true);
     case MdictPartDescr.where of
       OnlyAn   : WINDOWS_WriteStr(LemmaWindow, 'Analysis', 8, 8, true);
       OnlyGen  : WINDOWS_WriteStr(LemmaWindow, 'Generation', 10, 10, true);
       BothAngen: WINDOWS_WriteStr(LemmaWindow, 'Analysis and Generation', 
                                   23, 23, true);
     end;
     WINDOWS_WriteLine(LemmaWindow, true);
     NumberOfLines := NumberOfLines+1;
     { phonetical info }
     lsfon := MdictPartDescr.FON::LSPHONDEF_pPhonInfo;
     LSLEXED_ShowLSMdict(LemmaWindow, MdictPartDescr.CC, lsfon, NrFonLines);
     NumberOfLines := NumberOfLines+NrFonLines;
     LemmaPartData[mdictpart].endline := NumberOfLines-1;
   end;

   { Show Ildict part }
   SeparateParts(ildictpart);
   LemmaPartData[ildictpart].startline := NumberOfLines;
   if LemmaPartData[ildictpart].exist
   then with IldictPartDescr do begin
     for i := 1 to nr do with meanings[i] do begin
       WINDOWS_WriteStr(LemmaWindow, 's', 1, 1, true);
       WINDOWS_WriteInteger(LemmaWindow, m.spref,3,true);
       WINDOWS_WriteStr(LemmaWindow, 'm', 1, 1, true);
       WINDOWS_WriteInteger(LemmaWindow, m.mpref,3,true);
       case m.ag of
         LIILDICT_Analysis  : WINDOWS_WriteStr(LemmaWindow, 'An     ',7,7,true);
         LIILDICT_Generation: WINDOWS_WriteStr(LemmaWindow, 'Gen    ',7,7,true);
         LIILDICT_Both      : WINDOWS_WriteStr(LemmaWindow, 'An/Gen ',7,7,true);
       end;
       if NrComments > 0
       then WINDOWS_WriteChar(LemmaWindow, '*')
       else WINDOWS_WriteChar(LemmaWindow, ' ');
       if m.marked
       then WINDOWS_WriteStr(LemmaWindow, ':-',2,2,true)
       else WINDOWS_WriteStr(LemmaWindow, ': ',2,2,true);
       WINDOWS_WriteStr(LemmaWindow, m.md, 
                        LIILDICT_MaxMDLength, LIILDICT_MaxMDLength, true);
       WINDOWS_WriteLine(LemmaWindow, false);
       if (EditorMode = ShowTranslationMode) and
          (m.mkey = TranslationMkey)
       then
         WINDOWS_SetVideoAttrExist(LemmaWindow,NumberOfLines,1,1,80,
                                [Windows_Reverse],[]);
       NumberOfLines := NumberOfLines+1;
     end;
   end;
   WINDOWS_WriteLine(LemmaWindow, true); { empty line for inserting }
   LemmaPartData[ildictpart].endline := NumberOfLines;
   NumberOfLines := NumberOfLines + 1;

   { Show Particle part } 
   if LemmaPartData[particlepart].exist
   then begin
     SeparateParts(particlepart);
     LemmaPartData[particlepart].startline := NumberOfLines;
     with ParticlePartDescr do begin
       for i := 1 to nr do with particles[i] do begin
         WINDOWS_WriteString(LemmaWindow, 'particle', MaxFieldNameLength, true);
         WINDOWS_WriteString(LemmaWindow, ' : ', 3, true);
         WINDOWS_WriteString(LemmaWindow, stem, STRING_Length(stem), true);
         WINDOWS_WriteLine(LemmaWindow, true);
         NumberOfLines := NumberOfLines+1;
       end;
     end;
     WINDOWS_WriteLine(LemmaWindow, true);
     NumberOfLines := NumberOfLines+1;
     LemmaPartData[particlepart].endline := NumberOfLines;
   end;

   { Show Siddict part }
   SeparateParts(siddictpart);
   LemmaPartData[siddictpart].startline := NumberOfLines;
   if LemmaPartData[siddictpart].exist
   then with SiddictPartDescr do begin
     for i := 1 to nr do with sids[i] do begin
       WINDOWS_WriteStr(LemmaWindow, 'semi-idiom', MaxFieldNameLength, 
                        MaxFieldNameLength, true);
       if NrComments > 0
       then WINDOWS_WriteChar(LemmaWindow, '*')
       else WINDOWS_WriteChar(LemmaWindow, ' ');
       WINDOWS_WriteStr(LemmaWindow, ': ', 2, 2, true);
       if not GetStem(sid.arg, argstem)
       then begin
         GiveMessage('Semi idiom key not found. ');
         StartArg := WINDOWS_Column(LemmaWindow);
         WINDOWS_WriteStr(LemmaWindow, '?????', 5, 6, true);
         EndArg := WINDOWS_Column(LemmaWindow)-2;
       end
       else begin
         StartArg := WINDOWS_Column(LemmaWindow);
         WINDOWS_WriteString(LemmaWindow, argstem, STRING_length(argstem)+1, true);
         EndArg := WINDOWS_Column(LemmaWindow)-2;
       end;
       WINDOWS_WriteStr(LemmaWindow, '#', 1, 1, true);
       WINDOWS_WriteInteger(LemmaWindow,
                            sid.argnr,5,true);
       WINDOWS_WriteLine(LemmaWindow, true);
       if (EditorMode = ShowTranslationMode) and
          (mkey.mkey = TranslationMkey)
       then
         WINDOWS_SetVideoAttrExist(LemmaWindow,NumberOfLines,1,1,80,
                                [Windows_Reverse],[]);
       NumberOfLines := NumberOfLines+1;
     end;
   end;
   WINDOWS_WriteLine(LemmaWindow, true); { empty line for inserting semi idioms }
   LemmaPartData[siddictpart].endline := NumberOfLines;
   NumberOfLines := NumberOfLines+1;

   { Show iddict part }
   SeparateParts(iddictpart);
   LemmaPartData[iddictpart].startline := NumberOfLines;
   if LemmaPartData[iddictpart].exist
   then with IddictPartDescr do begin
     for i := 1 to nr do with ids[i] do begin
       WINDOWS_WriteStr(LemmaWindow, 'idiom', MaxFieldNameLength, 
                        MaxFieldNameLength, true);
       if NrComments > 0
       then WINDOWS_WriteChar(LemmaWindow, '*')
       else WINDOWS_WriteChar(LemmaWindow, ' ');
       WINDOWS_WriteStr(LemmaWindow, ': ', 2, 2, true);
       { show keys except for the first one which is the head }
       for j := 2 to idiom.args.nrargs do begin
         if not GetStem(idiom.args.argkeys[j], argpos[j].argstem)
         then begin
           GiveMessage('Idiom argument key not found. ');
           argpos[j].startx := WINDOWS_Column(LemmaWindow);
           WINDOWS_WriteStr(LemmaWindow, '?????', 5, 6, true);
           argpos[j].endx := WINDOWS_Column(LemmaWindow)-2;
         end
         else begin
           argpos[j].startx := WINDOWS_Column(LemmaWindow);
           WINDOWS_WriteString(LemmaWindow, argpos[j].argstem, 
                               STRING_length(argpos[j].argstem)+1, true);
           argpos[j].endx := WINDOWS_Column(LemmaWindow)-2;
         end;
       end;

       { show idiom pattern, only one for the time being }

       IdiomPattern := 
         idiom.pattern::LSDOMAINT_synpatterntype;
       LSTYPETOSTR_SynPatternType(DummyString, len, IdiomPattern);
       WINDOWS_WriteStr(LemmaWindow, '[', 1, 1, true);
       WINDOWS_WriteStr(LemmaWindow, DummyString, len, len, true);
       WINDOWS_WriteStr(LemmaWindow, ']', 1, 1, true);

       WINDOWS_WriteLine(LemmaWindow, true);
       if (EditorMode = ShowTranslationMode) and
          (mkeys[1].mkey = TranslationMkey)
       then
         WINDOWS_SetVideoAttrExist(LemmaWindow,NumberOfLines,1,1,80,
                                [Windows_Reverse],[]);
       NumberOfLines := NumberOfLines+1;
     end;
   end;
   WINDOWS_WriteLine(LemmaWindow, true); { empty line for inserting idioms }
   LemmaPartData[iddictpart].endline := NumberOfLines;
   NumberOfLines := NumberOfLines+1;

   { convert blex part to screen format and display attribute values }
   if LemmaPartData[blexpart].exist
   then begin
     t := LDCONVREC_GetAttrbs(BlexPartDescr);
     if t <> nil then SeparateParts(blexpart);

     LemmaPartData[blexpart].startline := NumberOfLines;
     ToScreen(LemmaWindow, t, NumberOfLines);
     LemmaPartData[blexpart].endline := NumberOfLines-1;
   end;

   { Show stem window: must be done after ToScreen, because particle stem
     could be detected in Blex }
   WINDOWS_ClearWindow(StemWindow);

   if LemmaPartData[blexpart].exist
   then begin
     LDTYPETOSTR_Cat(DummyString,len,BlexPartDescr^.cat);
     WINDOWS_WriteStr(StemWindow, DummyString,len, 
                      MaxFieldNameLength, true);
   end
   else begin
     WINDOWS_WriteString(StemWindow, '?????',MaxFieldNameLength, true);
   end;
   if CommentPartDescr.NrComments > 0
   then WINDOWS_WriteChar(StemWindow, '*')
   else WINDOWS_WriteChar(StemWindow, ' ');
   WINDOWS_WriteStr(StemWindow, ': ', 2, 2, true);
   WINDOWS_WriteStr(StemWindow,MdictPartDescr.stem,
                    LDMDICT_MAXSTEM,LDMDICT_MAXSTEM,true);
   case EditorMode of
     ViewLemmaMode      : CurrentAction := 'View lemma';
     EditLemmaMode      : CurrentAction := 'Edit lemma';
     ShowTranslationMode: CurrentAction := 'Show translation';
     SelectMkeyMode     : CurrentAction := 'Select meaning';
     SelectSkeyMode     : CurrentAction := 'Select lemma';
   end;
   CurrentActionLength := STRING_Length(CurrentAction);
   if LemmaNr <> 0
   then begin
     WINDOWS_NewRowColumn(StemWindow, 1, 80 - CurrentActionLength-7);
     WINDOWS_WriteInteger(StemWindow, LemmaNr, 3, true);
     WINDOWS_WriteInteger(StemWindow, NrLemmas, 3, true);
   end;
   WINDOWS_NewRowColumn(StemWindow, 1, 80 - CurrentActionLength);
   WINDOWS_WriteString(StemWindow, CurrentAction, 
                       CurrentActionLength, false); 
   WINDOWS_SetVideoAttrExist(StemWindow,1,1,
                             80 - CurrentActionLength - 1,
                             CurrentActionLength + 2,
                             [Windows_Reverse],[]);

   (*----------------------------------------------------------------------*
    * open a viewport to make the window visible on the screen
    *----------------------------------------------------------------------*)

   { correct number of lines for last end of line and hide last line (key) }
   NumberOfLines := NumberOfLines - 2; 

   LemmaWindowYPos := 1;
   LemmaWindowXPos := MaxFieldNameLength + 2;
   ScreenPos        := 1;
   CursorPos        := LemmaWindowYPos;
   CursorInLemmaWindow := true;
   if (NumberOfLines < ScreenHeight) then begin
     if (NumberOfLines > 0) 
     then begin
       LemmaViewportHeight := NumberOfLines;
       WINDOWS_CreateViewport(LemmaWindow,Viewport,Dev,1,1,NumberOfLines,80);
     end;
   end 
   else begin
     LemmaViewportHeight := ScreenHeight;
     WINDOWS_CreateViewport(LemmaWindow, Viewport, Dev, 1, 1, ScreenHeight, 80);
   end;
   WINDOWS_OpenViewPort(StemViewPort, dev, StemWindow, 1, 1);
   WINDOWS_OpenViewPort(ViewPort, Dev, LemmaWindow, 3, 1);
   WINDOWS_NewRowColumn(LemmaWindow, LemmaWindowYPos, LemmaWindowXPos);
   (*----------------------------------------------------------------------*
    * Next, support the NextScreen and PrevScreen function keys.
    *----------------------------------------------------------------------*)
   REPEAT
      WINDOWS_ReadKey(LemmaWindow, PressedKey);
      IF (PressedKey = Windows_F10Key) THEN BEGIN
        CommentKey;
      END;
      IF PressedKey = WINDOWS_PF1Key THEN BEGIN
        WINDOWS_ReadKey(LemmaWindow, PressedKey);
        if PressedKey = WINDOWS_PrevScreenKey 
        then ScrollBackward(LemmaWindowYPos);
        if PressedKey = WINDOWS_NextScreenKey 
        then ScrollForward(NumberOfLines-LemmaWindowYPos);
        if (PressedKey = WINDOWS_DoKey) and LemmaLocked
        then LemmaLocked := true; { becomes own lock which will be removed }
        PressedKey := 0; { to prevent 'normal' actions }
      END;
      IF PressedKey = WINDOWS_PrevScreenKey THEN BEGIN
         ScrollBackWard(ScrollAmount);
         END;
      IF PressedKey = WINDOWS_NextScreenKey THEN BEGIN
         ScrollForward(ScrollAmount);
      END;
      IF (PressedKey = Windows_UpArrowKey) THEN BEGIN
         ScrollBackward(1);
      END;
      IF (PressedKey = Windows_DownArrowKey) THEN BEGIN
         ScrollForward(1);
      END;
      IF (PressedKey = Windows_LeftArrowKey) THEN BEGIN
         Left;
      END;
      IF (PressedKey = Windows_RightArrowKey) THEN BEGIN
         Right;
      END;
      IF (PressedKey = Windows_DelKey)
      THEN BEGIN
         DeleteKey;
      END;
      IF Windows_IsPrintableChar(PressedKey) 
      THEN BEGIN
         PrintableCharacter;
      END;
      IF (PressedKey = Windows_F18Key) THEN BEGIN
        ShowMkey;
      END;
      IF (PressedKey = Windows_F20Key) THEN BEGIN
        if STRTOKEY_GetSkeyStr(LemmaKey, KeyString)
        then begin
          GiveMessage(KeyString);
          FILES_WriteString(keynotefile, KeyString, STRING_Length(KeyString)+1,
                            true);
          FILES_WriteLine(keynotefile, true);
        end
        else GiveMessage('Key string not found. ');
        STRTOKEY_Release;
      END;
      IF (PressedKey = Windows_InsertHereKey) THEN BEGIN
        InsertKey;
      END;
      IF (PressedKey = Windows_RemoveKey) THEN BEGIN
        RemoveKey;
      END;
      IF (PressedKey = Windows_F17Key) THEN BEGIN
        TranslateKey;
      END;
      IF (PressedKey = Windows_SelectKey) 
      THEN BEGIN 
         SelectKey;
      END;
      IF (PressedKey = Windows_DoKey) THEN BEGIN
        DoKey;
      end;
      IF (PressedKey = Windows_FindKey) THEN BEGIN
         FindKey;
      END;
      IF (PressedKey = Windows_F14Key) THEN BEGIN
        ReferenceKey;
      END;
      if ExitLemma and SomethingModified
      then begin
        if AskBoolean('Save modifications (y/n)? ')
        then begin
          status := true;
          with LemmaPartData[blexpart] do 
            if modified 
            then begin { check for syntax errors and constraint violations}
              status := FromScreen(LemmaWindow,t,
                             startline,NumberOfLines+2); { include last line
                                                           with key again: +2 }
              IF status THEN begin
                status := LDCONVREC_GetNode(t, BlexPartDescr);
                if not status then Error_Write(Error_InCorrectNode)
                else begin
                  BlexRec := MAKET_BlexrecFromStree(LemmaKey,
                                 BlexPartDescr::LSSTREE_pStree);
                  BlexRec.IsBxpr := true;
                  { functions which checks for constraint violations, writes
                    its output to a file (also used by compiler). }
                  FILES_Open(constraintsfile, 'constraints',11, 3);
                  status := LSCONSTRAINTS_Blex(BlexRec, constraintsfile, 0);
                  FILES_Close(constraintsfile);
                  if not status
                  then begin
                    { constraints are violated but the user is allowed to
                      ignore this }
                    if AskBoolean(
                       'Constraint violations found. Proceed anyway? (y/n) ') 
                    then status := true
                    else ShowConstraintErrors;
                  end;
                end;
              end;
            end;
          IF status THEN 
             SaveChanges
          ELSE PressedKey := 0; { Do not leave lemma }
        end;
      END;
          
   UNTIL ExitLemma;
   
   WINDOWS_CloseViewport(Viewport);

EXIT:
  if LemmaLocked
  then LILOCK_Delete(LemmaKey); 

  EditLemmaEnd;
  MEM_ReleaseDefault(StackPtr);

END; { EditLemma }

procedure EditSelectedLemmas;
{
  This procedure enables the user to browse through a set of selected lemmas.
}
var
  i,
  ReturnKey: integer;
begin
  i := 1;
  Returnkey := 0;
  KeySelected := false;
  while (i <= NumberSelectedKeys) and 
        (ReturnKey <> WINDOWS_F11Key) and { escape }
        not KeySelected
  do begin
    EditLemma(SelectedKeys[i], SelectionStem, EditorMode, 
              ReturnKey, KeySelected, SelectedKey, i, NumberSelectedKeys);
    case ReturnKey of
      WINDOWS_F11Key: ;
      WINDOWS_F12Key: if i > 1 then i := i-1; { previous lemma }
      WINDOWS_F13Key: AskNextLemmaNumber(NumberSelectedKeys, i);
      otherwise       i := i+1;
    end;
  end;
end;

procedure ShowTranslations;
{ 
  This procedure shows the lemmas which contain a (semi)idiom or meaning
  with a specific mkey.
}
var 
  IldictBuffer: LIILDICT_RecordDef;
  FoundKeys: array[1..MaxFoundKeys] of integer;
  i,
  DummyKey,
  ReturnKey,
  NumberFoundKeys: integer;
  DummyBoolean   : boolean;

  procedure GetTranslationLemma(skey: integer; var LemmaKey: integer);
  { 
    When an related skey is found, this procedure finds out if it belongs
    to a lemma or a (semi)idiom.
  }
  var SiddictBuffer: LISIDDICT_RecordDef;
      IddictBuffer: LIIDDICT_RecordDef;
  begin
    if LISIDDICT_GetGSiddict(skey, SiddictBuffer)
    then LemmaKey := SiddictBuffer.skey
    else
      if LIIDDICT_GetGIddict(skey, IddictBuffer)
      then LemmaKey := IddictBuffer.headkey
      else LemmaKey := skey;
  end;

begin
  NumberFoundKeys := 0;
  if LIILDICT_GetGILDictAll(mkey, IldictBuffer)
  then begin
    GetTransLationLemma(IldictBuffer.skey, DummyKey);
    if DummyKey <> ExceptKey
    then begin
      NumberFoundKeys := 1;
      FoundKeys[1] := DummyKey;
    end;
    while LIILDICT_GetNextGILDictAll(mkey, IldictBuffer) and
          (NumberFoundKeys < MaxFoundKeys)
    do begin
      GetTransLationLemma(IldictBuffer.skey, DummyKey);
      if DummyKey <> ExceptKey
      then begin
        NumberFoundKeys := NumberFoundKeys + 1;
        FoundKeys[NumberFoundKeys] := DummyKey;
      end;
    end;
  end;
  if NumberFoundKeys = 0
  then GiveMessage('No translation found. ')
  else begin
    TranslationMkey := mkey; { Global variable TranslationMkey }
    EditSelectedLemmas(NumberFoundKeys, FoundKeys, '',
                       ShowTranslationMode, DummyBoolean, DummyKey);
  end;
end;

function AskCategory(prompt: STRING_String;
                     var NewCat: LIDOMAINT_SyntCat): boolean;
{
  This function ask the user for a category.
}
var 
  EmptyCategory: boolean;
  CatName: packed array[1..50] of char;
  CatNameLength: integer;  
begin
  EmptyCategory := false;
  AskStr(prompt, STRING_Length(prompt)+15, 
            CatName, CatNameLength);
  if CatNameLength = 0 then EmptyCategory := true; 
  while not LDSTRTOTYPE_Cat(CatName, CatNameLength, NewCat) and
        not EmptyCategory
  do begin
    GiveMessage('Incorrect category. ');
    AskStr(prompt, STRING_Length(prompt)+15, 
              CatName, CatNameLength);
    if CatNameLength = 0 then EmptyCategory := true; 
  end;
  AskCategory := not EmptyCategory;
end;

function CheckCategory(key: integer; cat: LIDOMAINT_SyntCat): boolean;
{
  Checks if category of a lemma is equal to a specific category.
}
var 
  stree: LISTREE_pStree;
  KeyString,
  message: STRING_String;
begin
  stree := LDBLEX_ReadDirect(key);
  LDBLEX_Release;
  if stree = nil
  then begin
    message := 'Cannot check category of key: ';
    if STRTOKEY_GetSkeyStr(key, KeyString)
    then begin
      STRING_Append(message, KeyString);
      GiveMessage(message);
    end;
    { There exist some mdict-records with unknown skey and no corresponding
      blex-records in the Rosetta lexicons; No warning is given in these 
      cases, however they should be removed! }
    CheckCategory := false;
  end
  else begin
    CheckCategory := (cat = stree^.cat);
  end;
end;

function SelectLemmaWithStem;
{
  This function tries to select lemmas with a specific stem and category.
}
CONST
  MaxFoundKeys = 50;

var 
  LemmaSelected: boolean;
  kind: INTERFACE1_keytype;
  CC  : LIMORFDEF_ContextConds;
  FON : LIMORFDEF_pPhonInfo;
  where: LDMDICT_WhereType;
  len: integer;
  FoundKeys: array[1..MaxFoundKeys] of integer;
  NumberFoundKeys: integer;
begin
  LemmaSelected := false;
  SelectedKey := 0;
  NumberFoundKeys := 0;
  if not LDMDICT_GetAMDict(stem, kind, CC, FON, where, FoundKeys[1])
  then begin
    if STRTOKEY_GetSkeyNR(stem, FoundKeys[1])
    then NumberFoundKeys := 1;
  end
  else begin
    if CheckCategory(FoundKeys[1], cat) then NumberFoundKeys := 1;
    while (NumberFoundKeys < MaxFoundKeys) and 
          LDMDICT_GetNextAmDict(stem, kind, CC, FON, where, 
                                FoundKeys[NumberFoundKeys+1]) do
      if CheckCategory(FoundKeys[NumberFoundKeys+1], cat) 
      then NumberFoundKeys := NumberFoundKeys + 1;
  end;
  If NumberFoundKeys = 0
  then GiveMessage('No lemma found. ')
  else EditSelectedLemmas(NumberFoundKeys, FoundKeys, stem,
                          EditorMode, LemmaSelected, SelectedKey);
  SelectLemmaWithStem := LemmaSelected;
end;

procedure SelectLemmasSequential;
{
  This procedure starts a sequential search through the lexicon in alphabetical
  order. The user can specify tree parameters:
    1. stem of the first word. If ignored then the system starts searching at
       the first record in the lexicon.
    2. Category. If specified, only lemmas with this category will be selected.
    3. Number of lemmas. If ignored, a default value of 25 is assumed. There
       is a maximum of 50.
}
LABEL
  exit;

CONST
  MaxFoundKeys = 50;

var 
  DummyBoolean: boolean;
  kind: INTERFACE1_keytype;
  CC  : LIMORFDEF_ContextConds;
  FON : LIMORFDEF_pPhonInfo;
  where: LDMDICT_WhereType;
  MaxKeys: integer;
  i : integer;
  len: integer;
  DummyKey: integer;
  FoundKeys: array[1..MaxFoundKeys] of integer;
  NumberFoundKeys: integer;
  stem: STRING_String;
  cat: LIDOMAINT_SyntCat;
  CorrectNumber,
  CatSpecified: boolean;
  Str: packed array[1..3] of char;
begin
  NumberFoundKeys := 0;
  AskStem('Enter stem of first lemma: ', stem);
  CatSpecified := AskCategory('Enter category: ', cat);
  CorrectNumber := false;
  while not CorrectNumber 
  do begin
    AskStr('Enter maximum number of entries (<=50): ', 3, Str, len);
    if len = 0
    then begin
      MaxKeys := 25;
      CorrectNumber := true;
    end
    else begin
      if Str_StrToInteger (str, len, MaxKeys)
      then begin
        CorrectNumber := true;
        if MaxKeys > 50 
        then MaxKeys := 50;
        if MaxKeys < 1
        then MaxKeys := 1;
      end;
    end;
  end;
  StartWait;
  if stem = ' '
  then begin
    { Do a read in order to set index=1. Of course this is a temporary solution }
    LDMDICT_GetAMDict(stem, kind, CC, FON, where, DummyKey);
    LDMDICT_Reset;
  end
  else begin
    if not LDMDICT_GetAMDict(stem, kind, CC, FON, where, FoundKeys[1])
    then begin
      GiveMessage('Lemma not found. ');
      goto exit;
    end;
  end;

  if CatSpecified
  then begin
    if CheckCategory(FoundKeys[1], cat) then NumberFoundKeys := 1;
  end
  else NumberFoundKeys := 1;
  while (NumberFoundKeys < MaxKeys) and 
        LDMDICT_GetNextMDict(DummyKey)
  do begin
    if CatSpecified
    then begin
      if CheckCategory(DummyKey, cat) 
      then begin
        NumberFoundKeys := NumberFoundKeys + 1;
        FoundKeys[NumberFoundKeys] := DummyKey;
      end;
    end
    else begin
      NumberFoundKeys := NumberFoundKeys + 1;
      FoundKeys[NumberFoundKeys] := DummyKey;
    end;
  end;
  StopWait;

  If NumberFoundKeys = 0
  then GiveMessage('No lemma found. ')
  else EditSelectedLemmas(NumberFoundKeys, FoundKeys, '', 
                          EditLemmaMode, DummyBoolean, DummyKey);                       
exit:
end;

function SelectLemma;
{
  Asks for a stem (obligatory) and a category (optional). Then tries to 
  select lemmas which meet these requirements.
}
var 
  LemmaSelected: boolean;
  kind: INTERFACE1_keytype;
  CC  : LIMORFDEF_ContextConds;
  FON : LIMORFDEF_pPhonInfo;
  where: LDMDICT_WhereType;
  i : integer;
  len: integer;
  stem: STRING_string;
  FoundKeys: array[1..MaxFoundKeys] of integer;
  NumberFoundKeys: integer;
  CatSpecified: boolean;
  Cat: LIDOMAINT_SyntCat;

begin
  LemmaSelected := false;
  SelectedKey := 0;
  AskStem('Enter stem: ', stem);
  while (stem <> ' ') and not LemmaSelected do begin
    CatSpecified := AskCategory('Enter Category: ', Cat);
    NumberFoundKeys := 0;
    if not LDMDICT_GetAMDict(stem, kind, CC, FON, where, FoundKeys[1])
    then begin
      if STRTOKEY_GetSkeyNR(stem, FoundKeys[1])
      then begin
        NumberFoundKeys := 1;
        stem := ''; { because it will be used as selection stem }
      end;
    end
    else begin
      if CatSpecified
      then begin
        if CheckCategory(FoundKeys[1], Cat) then NumberFoundKeys := 1;
      end 
      else NumberfoundKeys := 1;
      while (NumberFoundKeys < MaxFoundKeys-1) and 
            LDMDICT_GetNextAmDict(stem, kind, CC, FON, where, 
                                  FoundKeys[NumberFoundKeys+1]) do
        if CatSpecified
        then begin
          if CheckCategory(FoundKeys[NumberFoundKeys+1], Cat) 
          then NumberFoundKeys := NumberFoundKeys + 1;
        end
        else NumberFoundKeys := NumberFoundKeys + 1;
    end;
    if NumberFoundKeys = 0
    then GiveMessage('No lemma found. ')
    else EditSelectedLemmas(NumberFoundKeys, FoundKeys, stem, EditorMode,
                            LemmaSelected, SelectedKey);                       
    if not LemmaSelected then AskStem('Enter stem: ', stem); 
  end;
  SelectLemma := LemmaSelected;
end;

function SelectLemmaWithCat(EditorMode: EditorModeEnum;
                            cat: LIDOMAINT_SyntCat;
                            var SelectedKey: integer): boolean; 
{
  Enables user to select lemmas which belong to a certain category.
}
var 
  LemmaSelected: boolean;
  kind: INTERFACE1_keytype;
  CC  : LIMORFDEF_ContextConds;
  FON : LIMORFDEF_pPhonInfo;
  where: LDMDICT_WhereType;
  len: integer;
  stem: STRING_string;
  FoundKeys: array[1..MaxFoundKeys] of integer;
  NumberFoundKeys: integer;

begin
  LemmaSelected := false;
  SelectedKey := 0;
  AskStem('Enter stem: ', stem);
  while (stem <> ' ') and not LemmaSelected do begin
    NumberFoundKeys := 0;
    if not LDMDICT_GetAMDict(stem, kind, CC, FON, where, FoundKeys[1])
    then begin
      if STRTOKEY_GetSkeyNR(stem, FoundKeys[1])
      then NumberFoundKeys := 1;
    end
    else begin
      if CheckCategory(FoundKeys[1], cat) then NumberFoundKeys := 1;
      while (NumberFoundKeys < MaxFoundKeys) and 
            LDMDICT_GetNextAmDict(stem, kind, CC, FON, where, 
                                  FoundKeys[NumberFoundKeys+1]) do
        if CheckCategory(FoundKeys[NumberFoundKeys+1], cat) 
        then NumberFoundKeys := NumberFoundKeys + 1;
    end;
    If NumberFoundKeys = 0
      then GiveMessage('No lemma found. ')
    else EditSelectedLemmas(NumberFoundKeys, FoundKeys, stem, EditorMode,
                            LemmaSelected, SelectedKey);                       
    if not LemmaSelected then AskStem('Enter stem: ', stem); 
  end;
  SelectLemmaWithCat := LemmaSelected;
end;

procedure AddLemma;
label
  exit;
var
  CommentLine,
  message,
  BareStem,
  NewStem: STRING_String;
  ContextStem: STRING_String;
  StemText: LDMDICT_StemType;
  i, StemLength: integer;
  PrepCat,
  BverbCat,
  PartCat,
  NewCat : LIDOMAINT_Syntcat;
  NewMdictRec: [volatile] MDICTDEF_RecordDef;
  pNewMdictRec: ^MDICTDEF_RecordDef;
  NewSdictRec: LISDICT_RecordDef;
  IldictRec: LIILDICT_RecordDef;
  CopyBlexRec, 
  BlexRec: LSDOMAINT_BlexStruct;
  NewBlexRec: [volatile] LSDOMAINT_BlexStruct;
  pNewBlexRec: ^LSDOMAINT_BlexStruct;
  CopyBlexTree: LISTREE_pStree;
  lsstree: LSSTREE_pStree;
  NewKey: integer;
  CopyKey: integer;
  ContextKey: integer;
  ReturnKey,
  DummyKey  : integer;
  lsfon: LSPHONDEF_pPhonInfo;
  CopyMeanings,
  DummyBoolean,
  ExitLoop: boolean;
  BlexCopied, 
  ContextKeySelected: boolean;

begin
  AskStem('Enter stem: ', NewStem);
  if NewStem = ' ' then goto exit; 
  STRING_Trim(NewStem, NewStem);
  { stem cannot include spaces (fixed idioms can not yet be handled) }
  if STRING_FindFirstSubString(NewStem, ' ', 1) <> 0
  then begin
    GiveMessage('It is not yet possible to insert fixed idioms. ');
    goto exit;
  end;
  BareStem := NewStem;

  if not AskCategory('Give category: ', NewCat)
  then goto exit; { category obligatory }

  ContextKeySelected := false;
  { Some domain-specific knowledge is used now: first it is checked if the 
    categories 'bverb' and 'prep' do exist. It is assumed that only these
    categories can have particle-words. Then it is checked if category
    'part' exists (which is not the case in Spanish). 
    In principle these domain-dependent statements are undesirable, because
    the domain may change. Questions which are not appropriate however are
    undesirable too. }
  if LDSTRTOTYPE_Cat('BVERB', 5, BverbCat) and
     LDSTRTOTYPE_Cat('PREP', 4, PrepCat) { should be true! }
  then begin
    if (BverbCat = NewCat) 
       { only verbs (and preps??) can have a particle ! } and
       LDSTRTOTYPE_Cat('PART', 4, PartCat) { for spanish no PART category
                                                   has been defined }
    then begin
      if not AskBoolean('Can this word occur without a particle? (y/n) ') 
      then begin { e.g. kondig_aan }
        AskStem('Enter stem of particle: ', ContextStem); 
        if SelectLemmaWithStem(SelectSkeyMode, ContextStem, PartCat, ContextKey) 
        then begin
          STRING_Append(NewStem, ContextStem);
          ContextKeySelected := true;
        end else begin
          GiveMessage('No particle selected. ');
          goto exit; 
        end;
      end;
    end;
  end;
  BlexCopied := false;
  CopyMeanings := false;
  if AskBoolean('Do you want to copy attribute values? (y/n) ') 
  then begin
    if SelectLemmaWithCat(SelectSkeyMode, NewCat, CopyKey)
    then begin
      CopyBlexTree := LDBLEX_ReadDirect(CopyKey);
      LDBLEX_Release;
      if CopyBlexTree = nil 
      then begin
        GiveMessage('Blex record not found. ');
        goto exit;
      end
      else begin
          GenerateKey(Skeytype, LemmaType, NewCat, NewStem, NewKey);
          LDGETKEY_Put(CopyBlexTree, NewKey);
          BlexRec := MAKET_BlexrecFromStree(NewKey, 
                            CopyBlexTree::LSSTREE_pStree);
          BlexRec.IsBxpr := true;
          BlexCopied := true;
          ExitLoop := true;
      end;
    end
    else goto exit; { a last opportunity to escape }
  end;
  if not BlexCopied
  then begin { generate default record }
    GenerateKey(Skeytype, LemmaType, NewCat, NewStem, NewKey);
    MAKET_BlexStruct(NewCat, BlexRec);
    lsstree := MAKET_StreeFromBlexrec(NewCat::LSDOMAINT_Syntcat, BlexRec);
    LDGETKEY_Put(lsstree::LISTREE_pStree, NewKey);
    BlexRec := MAKET_BlexRecFromStree(NewKey, lsstree);
    BlexRec.key := NewKey;
    BlexRec.IsBxpr := true;
  end;

  if ContextKeySelected
  then begin
    with NewSdictRec do begin
      fkey := Newkey;
      skey := NewKey;
      nr   := 1;
      ctxt[1] := ContextKey;
    end;
    LISDICT_WriteSequential(NewSdictRec);
  end;
  STRING_ExtractChars(StemText, StemLength, 
                      BareStem, 1, STRING_Length(NewStem));
  for i := StemLength+1 to LDMDICT_MaxStem do StemText[i] := ' ';
  with NewMdictRec do begin
    stem := StemText;
    kind := BasType;
    CC   := LICC0;
    lsfon := address(FON);
    LSLEXED_DefaultFonInfo(lsfon, newstem);
    where := BothAnGen;
    key := NewKey;
  end;
  pNewMdictRec := address(NewMdictRec);
  LDMDICT_Release;
  if not LDMDICT_WriteSequential(pNewMdictRec::LDMDICT_pMdictStruct)
  then begin
{    GiveMessage('Add Mdict failure. ');
    goto exit; 
    !! This message is disabled, because of a bug in LDMDICT. 
}
  end;
  NewBlexRec := BlexRec;
  pNewBlexRec := address(NewBlexRec);
  LDBLEX_WriteSequential(pNewBlexRec::LDBLEX_pBlexStruct);
  EditLemma(NewKey,'',EditLemmaMode,ReturnKey,DummyBoolean,DummyKey,0,0);

exit:
end;

procedure MainMenu;
var 
  LexviewOptions: array[1..4] of STRING_string :=
      ('view lemma',
       'sequential',
       'statistics',
       'exit');
  LexedOptions: array[1..5] of STRING_string :=
      ('edit lemma',
       'insert lemma',
       'sequential',
       'statistics',
       'exit');
  choice: integer;
  skey: integer;
  ExitLoop: boolean;
  StackPtr: MEM_StackPtr;
begin
  ExitLoop := false;
  choice := 1;
  while not ExitLoop do begin
    MEM_MarkDefault(StackPtr);
    if ViewMode
    then begin
      MenuChoice(4,LexviewOptions,center,choice);
      case choice of
        0: ExitLoop := true; { F11: escape }
        1: SelectLemma(ViewLemmaMode, skey);
        2: SelectLemmasSequential;
        3: Statistics;
        4: ExitLoop := true;
      end;
    end
    else begin
      MenuChoice(5,LexedOptions,center,choice);
      case choice of
        0: ExitLoop := true; { F11: escape }
        1: SelectLemma(EditLemmaMode, skey);
        2: if not ViewMode then AddLemma;
        3: SelectLemmasSequential;
        4: Statistics;
        5: ExitLoop := true;
      end;
    end;
    MEM_ReleaseDefault(StackPtr);
  end;
end;

begin
  LexedInit;
  if MultiLanguage then
    while lexedmessage.action <> exitlexed do begin
      MEM_MarkDefault(StackPtr);
      case lexedmessage.action of
        editlemmas:
          begin
            OriginalLanguage := true; { current language selected from main menu }
            MainMenu;
            lexedcontrolmessage.action := editlemmas;
          end;
        showtranslation:
          begin
            OriginalLanguage := false; 
            ShowTranslations(lexedmessage.mkey,0);
            lexedcontrolmessage.action := editlemmas;
          end;
        searchtranslation:
          begin
            OriginalLanguage := false; 
            if SearchTranslations(lexedmessage.mkey)
            then lexedcontrolmessage.TranslationFound := true
            else lexedcontrolmessage.TranslationFound := false;
            lexedcontrolmessage.action := editlemmas;
          end;
        selectmkey: 
          begin
            OriginalLanguage := false; 
            SelectLemma(SelectMkeyMode, LexedControlmessage.mkey);
            LexedControlMessage.action := editlemmas;
          end;
        exitlexed : ;
      end;
      MEM_ReleaseDefault(StackPtr);
      MB_Put(mbxlexedcontrol, lexedcontrolmessage);
      MB_Take(mbxlexed, lexedmessage);
    end
  else MainMenu;
  LexedEnd;
end.
