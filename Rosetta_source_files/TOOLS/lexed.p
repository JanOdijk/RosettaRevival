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

pragma C_Include('lexedaux.pf');
pragma C_Include('lslexed.pf');
pragma C_Include('globdef.pf');
pragma C_Include('mb.pf');
pragma C_include('pc.pf');
pragma C_Include('limorfdef.pf');
pragma C_Include('cisam.pf');
pragma C_Include('renamefixid.pf'); 
pragma C_Include('lsphondef.pf');
pragma C_Include('lsdomaint.pf');
(* pragma C_Include('lsconstraints.pf'); *)
pragma C_Include('lidomaint.pf');
pragma C_Include('lstypetostr.pf');
pragma C_Include('lsstrtotype.pf');
pragma C_Include('maket.pf');
pragma C_Include('interface1.pf');
pragma C_Include('mem.pf');
pragma C_Include('log.pf');
pragma C_Include('string.pf');
pragma C_Include('str.pf');
pragma C_Include('files.pf');
pragma C_Include('error.pf');
pragma C_Include('rectoscreen.pf');
pragma C_Include('windows.pf');
pragma C_include('wnd.pf');
pragma C_Include('ldconvrec.pf');
pragma C_Include('ldtypetostr.pf');
pragma C_Include('ldstrtotype.pf');
pragma C_Include('listree.pf');
pragma C_Include('lsstree.pf');
pragma C_Include('ldgetkey.pf');
pragma C_Include('strtokey.pf');
pragma C_Include('strtomkey.pf');
pragma C_Include('ldmdict.pf');
pragma C_Include('mdictdef.pf');
pragma C_Include('lifixiddict.pf');
pragma C_Include('ldblex.pf');
pragma C_Include('lisdict.pf');
pragma C_Include('lisiddict.pf');
pragma C_Include('liiddict.pf');
pragma C_Include('liildict.pf');
pragma C_Include('liscomment.pf');
pragma C_Include('limcomment.pf');
pragma C_Include('lilock.pf');
pragma C_include('loop.pf');
pragma C_include('logname.pf');
pragma C_include('config.pf');
pragma C_include('converts.pf');
pragma C_include('arg.pf');
pragma C_include('sockipc.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
PROGRAM LEXED(input, output);
WITH LEXEDAUX,
     LSLEXED,
     GLOBDEF,
     MB,
     PC,
     LIMORFDEF,
     CISAM,
     RENAMEFIXID, 
     LSPHONDEF,
     LSDOMAINT,
(*     LSCONSTRAINTS,  *)
     LIDOMAINT,
     LSTYPETOSTR,
     LSSTRTOTYPE,
     MAKET,
     INTERFACE1,
     MEM,
     LOG,
     STRNG,
     STR,
     FILES,
     ERROR,
     RECTOSCREEN,
     WINDOWS,
     WND,
     LDCONVREC,
     LDTYPETOSTR,
     LDSTRTOTYPE,
     LISTREE,
     LSSTREE,
     LDGETKEY,
     STRTOKEY,
     STRTOMKEY,
     LDMDICT,
     MDICTDEF,
     LIFIXIDDICT,
     LDBLEX,
     LISDICT,
     LISIDDICT,
     LIIDDICT,
     LIILDICT,
     LISCOMMENT,
     LIMCOMMENT,
     LILOCK,
     LOOP,
     LOGNAME,
     CONFIG,
     SOCKIPC,
     LOOPHOLES;

{
[EXTERNAL] FUNCTION LIB$DATE_TIME(var DateTime: packed array[lb..ub: integer] of char
                                 ): INTEGER; EXTERN;
}

CONST
  MaxFoundKeys  = 50;    { maximum number of selected keys }
  ViewMode      = false; { Switch between LEXED en LEXVIEW }
  MultiLanguage = true;  { Switch single/multi-language }

var
  NextAction         : integer;
  LogNames           : Text;
  lexedmessage       : MB_communicationblock;
  MbxFromControl,
  MbxToControl       : MB_mbxid;
  CurrentLanguage    : MB_LanguageType;
  CurrentLanguageString: STRING_String;
  StackPtr           : MEM_StackPtr;
  dev                : WINDOWS_Device;
  WaitWindow         : WINDOWS_Window;
  WaitViewport       : WINDOWS_Viewport;
  ChangeLogFile    { in this file the modifications of all users are logged }
                     : FILES_text;
  BverbCat,
  PrepCat,
  PartCat            : LIDOMAINT_SyntCat;
  SiddictBuffer      : LISIDDICT_RecordDef;
  IddictBuffer       : LIIDDICT_RecordDef;
  TranslationMkey    : integer;
  OriginalLanguage,    { TRUE if the current language was selected from the 
                         main menu, FALSE if this process was called from
                         the process of another language (translate function) }
  WaitWindowActive   : boolean;
  DateTime           : string(23);
  UserName           : string(8);
  StrLen             : STR_Range;
  MainFunctionKeys   : array[1..7] of WND_Xid;
  InitialScreenState : ScreenStateArray;


  procedure CisamStatus(message: STRING_String);
  { 
    Extends message parameter dependent on status and shows this message
    on the screen.
  }
  var 
    s: STRING_String;
    len: STR_Range;
    OwnStatus: CISAM_StatusType;
  begin
    OwnStatus := CISAM_OwnStatus;
    if OwnStatus <> CISAM_NoError
    then begin
      case Ownstatus of
        CISAM_Error         : s := 'general failure. ';
        CISAM_EndOfFile     : s := 'end of file. ';
        CISAM_RecordNotFound: s := 'record not found. ';
        CISAM_FileNotFound  : s := 'file not found. ';
        CISAM_RecordLocked  : s := 'record locked. ';
        CISAM_FileLocked    : s := 'file locked. ';
        otherwise              s := 'unknown failure. ';
      end;
      STRING_Append(message, s);
      STR_IntegerToStr(CISAM_IntegerStatus, s, len);
      STRING_Append(message, ' ('||s||')');
      GiveMessage(message);
    end;
  end;

procedure AddFixedIdiom(const Name: String);
VAR
   status : CISAM_StatusType;
   IdDict    : CISAM_FileType;
   NrIndices: integer;
   IdList   : ARRAY[1..LIFIXIDDICT_MaxIdList] OF LIFIXIDDICT_RecordDef;
   buffer : LIFIXIDDICT_RecordDef;
   i,bufsize: INTEGER;

FUNCTION AddWord(CONST str: STRING;
                 len: INTEGER;
                 i  : INTEGER;
                 index : INTEGER;
                 VAR lastindex : INTEGER): INTEGER;
VAR
   returnindex,
   nxtindex,
   newindex    : INTEGER;
   found       : BOOLEAN;
BEGIN                                                
   returnindex := index;
   newindex    := index;
   found       := FALSE;
   WHILE (newindex <> -1) AND NOT found DO BEGIN
      index := newindex;
      IF IdList[index].ch <> str[i]
      THEN newindex := IdList[index].nxtchar
      ELSE found := TRUE
   END;
   IF NOT found THEN BEGIN
     lastindex := lastindex+1;
     newindex  := lastindex;
     IF index <> -1
     THEN IdList[index].nxtchar := newindex
     ELSE returnindex := newindex;
     WITH IdList[newindex] DO BEGIN
       ch := str[i];
       mark := FALSE;
       nxtlevel := -1;
       nxtchar  := -1;
     END;
     index := newindex
   END;
  
   IF i = len THEN BEGIN
     IdList[index].mark := TRUE
     END
   ELSE BEGIN
     nxtindex := AddWord(str, len, i+1, IdList[index].nxtlevel, lastindex);
     IdList[index].nxtlevel := nxtindex
   END;
   AddWord := returnindex
END {AddWord};

begin
   IdDict := CISAM_initfile(
               LOGNAME_findfile(LOGNAME_Tr('fixiddict')), 9,
               Adr(buffer), SIZEof(buffer), CISAM_sequential);
   CISAM_Open(IdDict, CISAM_inp, CISAM_old);
   CisamStatus('FIXID.DAT first open: ');
   CISAM_ReadNext(IdDict, bufsize);
   CisamStatus('FIXID.DAT first read next: ');
   NrIndices := 0;
   status := CISAM_NoError;
   WHILE NOT (status = CISAM_EndOfFile ) DO BEGIN
      NrIndices := NrIndices+1;
      IdList[NrIndices] := buffer;
      CISAM_ReadNext(IdDict, bufsize);
      status := CISAM_OwnStatus;
   END;
   CISAM_Close(IdDict);
   
   case CurrentLanguage of
     dutch  : RENAME_RenameFixid(1);
     english: RENAME_RenameFixid(2);
     spanish: RENAME_RenameFixid(3);
   end;
   
   if NrIndices = 0
   then begin 
     NrIndices := 1;
     with IdList[NrIndices]
     do begin
       ch := 'a';
       mark := false;
       nxtlevel := -1;
       nxtchar  := -1;
     end;
   end;

   i := AddWord(Name, length(Name), 1, 1, NrIndices);
   IdDict := CISAM_initfile(
               LOGNAME_findfile(LOGNAME_Tr('fixiddict')), 9,
               Adr(buffer), SIZEof(buffer), CISAM_sequential);
   CISAM_Open(IdDict, CISAM_out, CISAM_new);
   CisamStatus('FIXID.DAT second open: ');
   FOR i:=1 TO NrIndices DO BEGIN
     buffer := IdList[i];
     CISAM_Write(IdDict, Loopholes.SizeOf(buffer));
   END;
   CISAM_Close(IdDict);
   CisamStatus('FIXID.DAT second close: ');
end;

procedure InitSdictRecord(var rec: LISDICT_RecordDef);
var 
  i: integer;
begin
  with rec do
  begin
    fkey := 0;
    skey := 0;
    nr := 1; { lower bound }
    for i := 1 to LISDICT_MaxContextKeys do ctxt[i] := 0;
  end;
end;

procedure InitSiddictRecord(var rec: LISIDDICT_RecordDef);
begin
  with rec do
  begin
    skey := 0;
    arg := 0;
    argnr := 0;
    sidskey := 0;
    sidmkey := 0;
  end;
end;

procedure InitIddictRecord(var rec: LIIDDICT_RecordDef);
var 
  i: integer;
begin
  with rec do
  begin
    headkey := 0;
    with args do
    begin
      nrargs := 0;
      for i := 1 to LIIDDICT_MaxIdArgs do argkeys[i] := 0;
    end;
    idskey := 0;
    pattern := 0;
  end;
end;

procedure InitIldictRecord(var rec: LIILDICT_RecordDef);
begin
  with rec do
  begin
    skey := 0;
    mkey := 0;
    spref := 0;
    mpref := 0;
    md := '';
    info := '';
    ag := LIILDICT_Both;
    marked := false;
  end;
end;

procedure GetUserName;
{
  This procedure extracts the user's name from the logical name 'sys$login'.
  This name will be used when a modification is logged.
}
(*
var intstatus, 
    i, 
    LengthPlusOne,
    len          : integer;
    s            : string(30);
    LogicalName  : varying[10] of char;
*)
begin
(*
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
*)
end;

procedure ClearScreen; 
begin
   WND_SetString(X_le_stem_text, ''); 
   WND_SetString(X_le_category_text, '');  
   WND_SetString(X_le_skey, '');  
   WND_Clear(X_le_part_list);
   WND_Clear(X_le_sid_list);
   WND_Clear(X_le_id_list);
   WND_Clear(X_le_mean_list);
   WND_Clear(X_le_attr_list);
   WND_Clear(X_le_comment_text);
end;

procedure LexedInit;
var
  sid      : MEM_Stack;
  LogNamesFileName,
  mbxname  : STRING_String;
begin
  CurrentLanguage := LSLEXED_Language;
  case CurrentLanguage of
    dutch  : CurrentLanguageString := 'Dutch';
    english: CurrentLanguageString := 'English';
    spanish: CurrentLanguageString := 'Spanish';
  end;

  STRING_Concat(LogNamesFileName, CurrentLanguageString, 'lognames'); 
  reset(LogNames,LogNamesFileName); { e.g. Dutchlognames }
  Logname_Init(LogNames);
  SOCKIPC_set_port (conversions.StoI(arg.Argv(2)), 1);
  Config_Init;
  MEM_init;
  Mem_CreateStack(sid, 1000000);
  if not Mem_Done
  then begin
    GiveMessage('Not enough stack space! ');
    halt;
  end
  else Mem_SetDefault(sid);

  GetUserName;

  NextAction := 0; 

{  LOG_open('logfile',7, GLOBDEF_yes); }

  GLOBDEF_SetAnGenMode(anmode);

  if MultiLanguage
  then begin
    MB_init(Loopholes.SizeOf(MB_Communicationblock), GLOBDEF_no);
    STRING_Concat(mbxname, CurrentLanguageString, 'ToControl'); { e.g. DutchToControl }
    MB_Open(mbxname,putaccess,MbxToControl);
    STRING_Concat(mbxname, 'ControlTo', CurrentLanguageString); 
    MB_Open(mbxname,takeaccess,MbxFromControl);    { e.g. ControlToDutch }
  end;

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

  if MultiLanguage 
  then begin
    MB_Take(MbxFromControl, lexedmessage);
    MB_Put(MbxToControl, lexedmessage);
    MB_Take(MbxFromControl, lexedmessage);
    SOCKIPC_set_port (lexedmessage.wndport, 0);
  end;  
  WND_Initialize;
  InitScreenState;
  StoreScreenState(InitialScreenState);
  MainFunctionKeys[1] := X_le_exit_button;
  MainFunctionKeys[2] := X_le_dutch_button;
  MainFunctionKeys[3] := X_le_english_button;
  MainFunctionKeys[4] := X_le_spanish_button;
  MainFunctionKeys[5] := X_le_find_lemma_button;
  MainFunctionKeys[6] := X_le_insert_lemma_button;
  MainFunctionKeys[7] := X_le_sequential_button;
  if ViewMode
  then begin
    MainFunctionKeys[6] := X_Undefined;
  end;
end; 

procedure LexedEnd;
begin
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
  FILES_Close(ChangeLogfile);
  if not viewmode then LILOCK_CloseLock;
{  LOG_close; }
  if MultiLanguage then 
  begin
    MB_Put(MbxToControl, lexedmessage);
    MB_Close(MbxToControl, GLOBDEF_no);
    MB_Close(MbxFromControl, GLOBDEF_no);
  end;
  WND_Terminate; 
  PC_Terminate;
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
(*  LIB$DATE_TIME(DateTime); *)
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
    DummyString: string(40);
    DummyLen: STR_Range;
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
    md: LIILDICT_MeaningDescr;
begin
  md := ' ';
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
    len: STRING_Range;
    s: string(LDMDICT_MaxStem);
begin
  String_Constant(string1, str1, LDMDICT_MaxStem);
  String_Trim(string1, string1);
  String_AppendChar(string1, string1, '_');
  String_Constant(string2, str2, LDMDICT_MaxStem);
  String_Trim(string2, string2);
  String_Append(string1, string2);
  String_ExtractChars(s, len, string1, 1, LDMDICT_MaxStem);
  str := s;
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
  for l := lowest(MB_LanguageType) to highest(MB_LanguageType) 
  do begin
    if l = CurrentLanguage
    then found := SearchReferences(mkey, OwnSkey)
    else begin
      LexedMessage.action := SearchTranslation;
      LexedMessage.TargetLanguage := l;
      LexedMessage.mkey := mkey;
      MB_Put(MbxToControl, LexedMessage);
      MB_Take(MbxFromControl, LexedMessage);
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
  MenuOptions: array[1..2] of STRING_String;
  choice: integer;
  n: integer;
  NStr: string(5); 
  NLen: STR_Range;
  message: STRING_String;
begin
  MenuOptions[1] := 'Number of semi idioms';
  MenuOptions[2] := 'Number of idioms';;
  choice := 1;
(*
  MenuChoice(2, MenuOptions, center, choice);
*)
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
                         var SelectedKey: integer): boolean; forward;

function SelectLemmaWithStemAndCat(EditorMode: EditorModeEnum;
                                   stem: STRING_String;
                                   cat: LIDOMAINT_SyntCat;
                               var SelectedKey: integer): boolean; forward;

PROCEDURE EditLemma(LemmaKey: integer;
                    SelectionStem: STRING_String; 
                    EditorMode: EditorModeEnum;
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
   MaxContextSpecs       = 50;
   MaxBlexLines          = 75;

type 
   { enumeration of the various parts of a lemma }
   LemmaPartEnum = (mdictpart, sdictpart, ContextPart, siddictpart, 
                    iddictpart, ildictpart, blexpart);
   CommentText = array[1..MaxNrCommentLines] of STRING_String;
   AttrText    = array[1..MaxBlexLines] of STRING_String;

var 
  { general information about the lemma parts }
  LemmaPartData: array[LemmaPartEnum] of 
    record
      exist     : boolean;
      modified  : boolean;
    end;

  ShowItemData: record { in case of ShowTranslationMode }
    LemmaPart : LemmaPartEnum;
    Number    : integer;
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

  { specific information concerning context part. It contains the related
    context keys. The user is only allowed to assign new context keys. 
    The resulting
    modifications do not influence the current lemma, so no fields like
    'modified' are needed. The stem of each context key is included in the 
    datastructure to allow sorting in the future. }
  ContextPartDescr: 
    record
      nr: integer;
      contextkeys: array[1..MaxContextSpecs] of 
        record
          key: integer; 
          ctxt: integer;
          stem: STRING_String;
        end;
      ScreenList: array[1..MaxContextSpecs] of STRING_String;
    end;

  { specific information concerning siddict part }
  SiddictPartDescr: 
    record
      nr: integer;
      FirstAdded: integer; { always add after last element }
      sids: array [1..MaxSemiIdioms] of 
        record 
          sid: LISIDDICT_RecordDef;
          temporary: boolean; { true if not yet complete and confirmed }
          modified: boolean; { only LISIDDICT_RecordDef }
          removed : boolean;
          ArgStem : STRING_String;
          mkey        : LIILDICT_RecordDef;
          oldmkey     : LIILDICT_RecordDef;
          MkeyModified: boolean; { only LIILDICT_RecordDef }
          NrComments  : integer;
          Comments    : CommentText;
          CommentsModified: boolean;
        end;
      ScreenList: array[1..MaxSemiIdioms] of STRING_String;
    end;

  { specific information concerning iddict part }
  IddictPartDescr : 
    record
      nr: integer;
      FirstAdded: integer; { always add after last element }
      ids: array [1..MaxIdioms] of record 
        idiom : LIIDDICT_RecordDef;
        temporary: boolean; { true if not yet complete and confirmed }
        modified: boolean; { only LIIDDICT_RecordDef }
        removed : boolean;
        ArgsModified: boolean;
        PatternModified: boolean;
        argstems: array[1..LIIDDICT_MaxIdArgs] of STRING_String;
        nrmkeys: integer;
        mkeys: array[1..MaxIdiomMkeys] of LIILDICT_RecordDef;
        oldmkeys: array[1..MaxIdiomMkeys] of LIILDICT_RecordDef;
        MkeyModified: array[1..MaxIdiomMkeys] of boolean;
        NrComments  : integer;
        Comments    : CommentText;
        CommentsModified: boolean;
      end;
      ScreenList: array[1..MaxIdioms] of STRING_String;
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
          temporary: boolean; { true if not yet complete and confirmed }
          modified: boolean;
          removed : boolean;
          DescrPresent: boolean;
          NrComments  : integer;
          Comments    : CommentText;
          CommentsModified: boolean;
        end;
      ScreenList: array[1..MaxMeanings] of STRING_String;
    end; 

  { specific information concerning blex part }
  BlexPartDescr   :
    record
      Attr         : LISTREE_pStree;
      nr           : integer;
      ScreenList   : AttrText;
      KeyLine      : String_String; { to hold key value line }
    end; 

  { specific information concerning comment part }
  CommentPartDescr: 
    record
      NrComments: integer;
      Comments  : CommentText;
      modified  : boolean;
    end;

VAR
   CommentLine, 
(*   CurrentAction,       { e.g. "Select Meaning" } *)
   OriginalStem,        { stem of original mdict record. The stem in 
                          MdictPartDescr can differ from this one, e.g. in 
                          case of a particle }
   stem            : STRING_string;
   r               : STR_Range;
 
   len,
   i,
   PressedKey      : INTEGER;

   LemmaRemoved,
   ExitLoop,
   LockedForOthers,
   EditingAllowed, { indicated that the lemma can be modified (locked) }
   status          : BOOLEAN;

   StemComposed    : (NotComposed, ViaSdict, ViaBlex);
                        { ViaSdict: particle relation, e.g. loop_af
                          ViaBlex : particle attribute; in english, Sdict is
                                    hardly used. While displaying the lemma,
                                    Lexed recognizes the particle attribute
                                    and modifies the stem accordingly }
   constraintsfile : FILES_Text;
   BlexRec         : LSDOMAINT_BlexStruct;
   t               : LDCONVREC_pAttrStruct;
   kind            : INTERFACE1_keytype;
   CC              : LIMORFDEF_ContextConds;
   FON             : LIMORFDEF_pPhonInfo;
   lsfon           : LSPHONDEF_pPhonInfo;
   where           : LDMDICT_WhereType;
   StackPtr        : MEM_StackPtr;
   DummyString     : string(40); 
   SdictBuffer     : LISDICT_RecordDef;
   SiddictBuffer   : LISIDDICT_RecordDef;
   IddictBuffer    : LIIDDICT_RecordDef;
   IldictBuffer    : LIILDICT_RecordDef;
   ScreenState     : ScreenStateArray; 
   SelectedListItems: array[1..1] of integer; { selected elements from
     a list on the screen. Only one selection is allowed at a time. }
   NrSelectedListItems: integer;


   procedure SetEditingAllowed(b: boolean);
   begin
     EditingAllowed := b;
     if EditingAllowed
     then begin
       WND_SetString(X_le_modify_lemma_button, 'View lemma');
       MakeKeySensitive(X_le_insert_particle_button);
       MakeKeySensitive(X_le_insert_meaning_button); 
       MakeKeySensitive(X_le_insert_semi_idiom_button);
       MakeKeySensitive(X_le_insert_idiom_button); 
       MakeKeySensitive(X_le_copy_lemma_button); 
       MakeKeySensitive(X_le_delete_lemma_button); 
       MakeKeySensitive(X_le_analysis_toggle);
       MakeKeySensitive(X_le_generation_toggle);
       MakeKeySensitive(X_le_angen_toggle);
       MakeKeySensitive(X_le_sjwa_toggle);
       MakeKeySensitive(X_le_wissel_toggle);
       MakeKeySensitive(X_le_cons_toggle);
       MakeKeySensitive(X_le_gg_toggle);
       MakeKeySensitive(X_le_ch_toggle);
       MakeKeySensitive(X_le_kk_toggle);
       MakeKeySensitive(X_le_th_toggle);
       MakeKeySensitive(X_le_comment_text);
       MakeKeySensitive(X_le_attr_list);
     end
     else begin
       WND_SetString(X_le_modify_lemma_button, 'Modify lemma');
       MakeKeyInsensitive(X_le_insert_particle_button);
       MakeKeyInsensitive(X_le_insert_meaning_button); 
       MakeKeyInsensitive(X_le_insert_semi_idiom_button);
       MakeKeyInsensitive(X_le_insert_idiom_button); 
       MakeKeyInsensitive(X_le_copy_lemma_button); 
       MakeKeyInsensitive(X_le_delete_lemma_button); 
       MakeKeyInsensitive(X_le_analysis_toggle);
       MakeKeyInsensitive(X_le_generation_toggle);
       MakeKeyInsensitive(X_le_angen_toggle);
       MakeKeyInsensitive(X_le_sjwa_toggle);
       MakeKeyInsensitive(X_le_wissel_toggle);
       MakeKeyInsensitive(X_le_cons_toggle);
       MakeKeyInsensitive(X_le_gg_toggle);
       MakeKeyInsensitive(X_le_ch_toggle);
       MakeKeyInsensitive(X_le_kk_toggle);
       MakeKeyInsensitive(X_le_th_toggle);
       MakeKeyInsensitive(X_le_comment_text);
       MakeKeyInsensitive(X_le_attr_list);
     end;
     UpdateScreen;
   end;

   PROCEDURE EditLemmaInit;
   var p: LemmaPartEnum;
   begin
     kind := BAStype;
     StemComposed := NotComposed;
     for p := mdictpart to blexpart do begin
       LemmaPartData[p].exist := false;
       LemmaPartData[p].modified := false;
     end;
     LemmaRemoved := false;
     KeySelected := false;
     ContextPartDescr.nr := 0;
     SiddictPartDescr.nr := 0;
     IddictPartDescr.nr := 0;
     IldictPartDescr.nr := 0;
     SiddictPartDescr.FirstAdded := 0; { after reading := nr+1 }
     IddictPartDescr.FirstAdded := 0;  { after reading := nr+1 }
     IldictPartDescr.FirstAdded := 0;  { after reading := nr+1 }
     SelectedKey := 0;
     if LemmaNr > 1 
     then MakeKeySensitive(X_le_previous_button)
     else MakeKeyInsensitive(X_le_previous_button);
     if LemmaNr < NrLemmas 
     then MakeKeySensitive(X_le_next_button)
     else MakeKeyInsensitive(X_le_next_button);
     if NrLemmas > 1
     then MakeKeySensitive(X_le_jump_button)
     else MakeKeyInsensitive(X_le_jump_button);
     MakeKeySensitive(X_le_return_button);
     if EditorMode = SelectSkeyMode
     then MakeKeySensitive(X_le_select_button);
     MakeKeySensitive(X_le_modify_lemma_button); 
     MakeKeySensitive(X_le_show_semi_idioms_button); 
     MakeKeySensitive(X_le_show_idioms_button); 
     { Update Screen will be done in SetEditingAllowed } 
     SetEditingAllowed(false); 
     if ViewMode
     then LockedForOthers := false
     else LockedForOthers := LILOCK_write(LemmaKey); { try to lock lemma }

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
     WND_UnManage(X_le_analysis_toggle);
     WND_UnManage(X_le_generation_toggle);
     WND_UnManage(X_le_angen_toggle);
     case CurrentLanguage of
       dutch:
         begin
           WND_UnManage(X_le_sjwa_toggle); 
           WND_UnManage(X_le_wissel_toggle); 
         end;
       english:
         begin
           WND_UnManage(X_le_cons_toggle); 
         end;
       spanish:
         begin
           WND_UnManage(X_le_gg_toggle); 
           WND_UnManage(X_le_ch_toggle); 
           WND_UnManage(X_le_kk_toggle); 
           WND_UnManage(X_le_th_toggle); 
         end;
     end;
     RestoreScreenState(InitialScreenState);
   end;

  function GetStem(skey: integer; 
                   var ResultStem: STRING_String): boolean;
  {
    Finds stem related to specified skey. If it appears to be a word with a
    context key, the stem is composed from the stems of the phonetic key and 
    the context key.
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

function CheckLemmaCategory(cat: LIDOMAINT_SyntCat): boolean;
{
  Checks if category of current lemma is equal to a specific category.
}
begin
  if not LemmaPartData[Blexpart].exist
  then CheckLemmaCategory := false
  else CheckLemmaCategory := (BlexPartDescr.Attr^.cat = cat);
end;

function RefindMdict(OriginalStem: STRING_String;
                     key : integer;
                     var kind: INTERFACE1_keytype;
                     var CC  : LIMORFDEF_ContextConds;
                     var FON : LIMORFDEF_pPhonInfo;
                     var where: LDMDICT_WhereType): boolean;
var stem: STRING_String;
    success,
    ExitLoop: boolean;
begin
  success := false; { avoid warning }
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

FUNCTION FromScreen(VAR t  : LDCONVREC_pAttrStruct): BOOLEAN;
{
  Reads attribute values from the screen and checks for syntactic errors.
}
VAR
   ch         : CHAR;
   len,
   cc,
   rownr      : INTEGER;
   correct,
   EndOfScreen: BOOLEAN;

   PROCEDURE GetChar;
   BEGIN
     with BlexPartDescr
     do begin
      IF cc > WindowWidth THEN BEGIN
	 IF rownr < Nr THEN BEGIN 
	    rownr := rownr+1; cc := 0;
	    cc := cc+1; String_ExtractChar(ch, ScreenList[rownr], cc);
	    END
	 ELSE BEGIN
	    ch := ' ';         
	    EndOfScreen := TRUE
	 END;
	 END
      ELSE BEGIN
	 cc := cc+1; String_ExtractChar(ch, ScreenList[rownr], cc);
      END;
      write(ch);
     end;
   END {GetChar};


   PROCEDURE SkipSpaces;
   BEGIN
      WHILE (ch = ' ') AND (NOT EndOfScreen) DO GetChar;
   END {SkipSpaces};

   PROCEDURE ReadString(VAR s: string;
                        VAR l: INTEGER;
                        VAR correct: BOOLEAN);
   BEGIN
     l := 0;
     s := '';
     WHILE ch in ['a'..'z', 'A'..'Z', '0'..'9', '_'] DO BEGIN
        l := l+1; s := s || ch;
        GetChar
     END;
     correct := l > 0;
     SkipSpaces;
   END {ReadString};


   PROCEDURE Pass1;
   VAR
      attrname,
      attrvalue : LDCONVREC_Str;
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
	 IF NOT correct THEN GiveMessage('Syntax errors in attributes. ');
      END;
   END {Pass1};


   PROCEDURE Pass2;

      FUNCTION MakeAttr(a: LDCONVREC_pAttrStruct): LDCONVREC_pAttrStruct;
         VAR h: LDCONVREC_pAttrStruct;
      BEGIN
         Mem_NewDefault(SIZEof(LDCONVREC_AttrStruct), Retype(h,Mem_ptr));
         WITH h^ DO BEGIN
            SetValue := NIL;
            NextAttr := a
         END;
         MakeAttr := h
      END {MakeAttr};

      FUNCTION MakeSetElt(a: LDCONVREC_pSetValueType): LDCONVREC_pSetValueType;
         VAR h: LDCONVREC_pSetValueType;
      BEGIN
         Mem_NewDefault(SIZEof(LDCONVREC_SetValueType), Retype(h,Mem_ptr));
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
	 ReadString(t^.fieldname.str, len, correct);
         t^.fieldname.len := len;
         GetChar; SkipSpaces;
	 IF ch = '[' THEN BEGIN
	    GetChar; SkipSpaces;
	    IF ch <> ']' THEN BEGIN
               REPEAT
                  t^.setvalue := MakeSetElt(t^.setvalue);
	          ReadString(t^.setvalue^.eltvalue.str, len, correct);
                  t^.setvalue^.eltvalue.len := len;
	       UNTIL (ch = ']');
               GetChar; SkipSpaces;
	       END
	    ELSE BEGIN
	       GetChar; SkipSpaces
	    END;
	    END
	 ELSE BEGIN
	    ReadString(t^.fieldvalue.str, len, correct);
            t^.fieldvalue.len := len;
	 END;
      END;
   END {Pass2};

BEGIN
   With BlexPartDescr
   do begin { append line with key value to screen list again }
     nr := nr+1;
     ScreenList[nr] := KeyLine;
   end;   
   EndOfScreen := FALSE; cc := WindowWidth+1; ch := ' ';
   rownr := 0; { first line is skipped }
   correct := TRUE;

   Pass1;

   IF correct THEN BEGIN 
      EndOfScreen := FALSE; cc := WindowWidth+1; ch := ' ';
      rownr := 0; { first line is skipped }
      Pass2
   END;

   FromScreen := correct

END {FromScreen};


PROCEDURE ToScreen(t  : LDCONVREC_pAttrStruct);
{ 
  Displays attribute values on the screen.
}
VAR
   savet    : LDCONVREC_pAttrStruct;
   s        : LDCONVREC_pSetValueType;
   i,
   DummyKey : integer;
   DummyStem: STRING_String;
BEGIN
  with BlexpartDescr do
  begin 
   nr := 0;
   savet := t;
   IF t <> NIL THEN BEGIN
      WHILE ( t <> NIL ) DO BEGIN
         nr := nr+1;
         ScreenList[nr] := '';
         STRING_AppendChars(ScreenList[nr], ScreenList[nr], 
                            t^.Fieldname.Str, t^.Fieldname.Len);
         for i := String_Length(ScreenList[nr]) to MaxFieldNameLength
         do String_AppendChar(ScreenList[nr], ScreenList[nr], ' ');
         String_Append(ScreenList[nr], ' : ');

         IF t^.Typeindicator = EnumSet THEN BEGIN
            String_Append(ScreenList[nr], '[ ');
            s := t^.SetValue;
            WHILE s <> NIL DO BEGIN
               IF (( String_Length(ScreenList[nr]) + s^.EltValue.len + 2 ) 
                  > WindowWidth) THEN BEGIN
                  nr := nr+1;
                  ScreenList[nr] := '';
                  for i := 1 to MaxFieldNameLength+6
                  do String_AppendChar(ScreenList[nr], ScreenList[nr], ' ');
               END;
               STRING_AppendChars(ScreenList[nr], ScreenList[nr], 
                                  s^.EltValue.Str, s^.EltValue.Len);
               String_AppendChar(ScreenList[nr], ScreenList[nr], ' ');
               s := s^.NextValue;
            END;
            String_AppendChar(ScreenList[nr], ScreenList[nr], ']');
            END 
         ELSE BEGIN
            STRING_AppendChars(ScreenList[nr], ScreenList[nr], 
                                t^.FieldValue.Str, t^.FieldValue.Len);
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
         t := t^.NextAttr;
      END;
      END
   ELSE BEGIN
   END;      
   KeyLine := ScreenList[nr]; { key value not to screen }
   ScreenList[nr] := '';
   nr := nr-1;
   for i := 1 to nr
   do begin
     WND_WriteString(X_le_attr_list, ScreenList[i], 
                     String_Length(ScreenList[i]), true);
     if i <> nr then WND_WriteLine(X_le_attr_list, true);
   end;
  end;
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
   FileNameLen : STR_Range;
   f           : FILES_Text;
   NumberOfLines : INTEGER;

BEGIN

   WINDOWS_OpenWindow(Window, ' ', 1, 3, 70);
   WINDOWS_ClearWindow(Window);
   WINDOWS_NewRowColumn(Window, 2, 2);
   WINDOWS_WriteStr(Window, 'Enter filename : ', WINDOWS_MaxIO, 0, TRUE);
   WINDOWS_NewRowColumn(Window, 2, 19);
   WINDOWS_OpenViewPort(ViewPort, Dev, Window, 1, 1);
   WINDOWS_ReadStr(Window, FileName, retype(FileNameLen, Windows_IORange));
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
      (PressedKey = X_le_exit_button) or
      (PressedKey = X_le_dutch_button) or
      (PressedKey = X_le_english_button) or
      (PressedKey = X_le_spanish_button) or
      (PressedKey = X_le_find_lemma_button) or
      (PressedKey = X_le_insert_lemma_button) or
      (PressedKey = X_le_delete_lemma_button) or
      (PressedKey = X_le_sequential_button) or
      (PressedKey = X_le_previous_button) or
      (PressedKey = X_le_next_button) or
      (PressedKey = X_le_jump_button) or
      (PressedKey = X_le_return_button) or
      KeySelected;
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
    s: string(80);
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

(*
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
      strkey : string(50);
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
*)

procedure ShowSemiIdioms;
var
  i: integer;
begin
   { Show Siddict part }
   WND_Clear(X_le_sid_list);
   if LemmaPartData[siddictpart].exist
   then with SiddictPartDescr do begin
     for i := 1 to nr do with sids[i] do begin
       if not GetStem(sid.arg, argstem)
       then begin
         GiveMessage('Semi idiom key not found. ');
         ScreenList[i] := '??????';
       end
       else begin
         ScreenList[i] := argstem;
       end;
       if removed then STRING_Prefix(ScreenList[i], '-');
     end;
     WND_SetStringList(X_le_sid_list, SiddictPartDescr.ScreenList,
                       SiddictPartDescr.nr);
   end;

end;

procedure ShowIdioms;
var
  i,j: integer;
begin
   { Show iddict part }
   WND_Clear(X_le_id_list);
   if LemmaPartData[iddictpart].exist
   then with IddictPartDescr do begin
     for i := 1 to nr do with ids[i] do begin
       ScreenList[i] := '';

       { show keys except for the first one which is the head }
       for j := 2 to idiom.args.nrargs do begin
         if not GetStem(idiom.args.argkeys[j], argstems[j])
         then begin
           STRING_Append(ScreenList[i], '?????');
         end
         else begin
           STRING_Append(ScreenList[i], argstems[j]);
         end;
         STRING_Append(ScreenList[i], ' ');
       end;
       if removed then STRING_Prefix(ScreenList[i], '- ');

       { show idiom pattern, only one for the time being }
     end;
     WND_SetStringList(X_le_id_list, IddictPartDescr.ScreenList,
                       IddictPartDescr.nr);
   end;

end;

procedure ShowMeanings;
var
  i: integer;
begin
   WND_Clear(X_le_mean_list);
   if LemmaPartData[ildictpart].exist
   then with IldictPartDescr do
   begin
     for i := 1 to nr do with meanings[i] do
     begin
       STRING_Constant(ScreenList[i], m.md, LDMDICT_MaxStem);
       STRING_Trim(ScreenList[i], ScreenList[i]);
       if ScreenList[i] = ''
       then STRING_Constant(ScreenList[i], '< NO DESCRIPTION ! >', 20);
       if removed then STRING_Prefix(ScreenList[i], '-')
       else if m.marked then STRING_Prefix(ScreenList[i], '*');
     end;
     WND_SetStringList(X_le_mean_list, ScreenList, Nr);
   end;
end;

procedure ShowLemma; 
var
  i: integer;
  DummyString,
  KeyString: String_String;
  lsfon: LSPHONDEF_pPhonInfo;
begin
   WND_SetString(X_le_language, CurrentLanguageString);
   WND_SetString(X_le_stem_text, MdictPartDescr.stem); 
   if LemmaPartData[blexpart].exist
   then begin
     LDTYPETOSTR_Cat(DummyString,r,BlexPartDescr.Attr^.cat);
     len := r;
     WND_SetString(X_le_category_text, DummyString);
   end 
   else begin
     WND_SetString(X_le_category_text, '?????');
   end;
   if STRTOKEY_GetSkeyStr(LemmaKey, KeyString)
   then WND_SetString(X_le_skey, KeyString)
   else WND_SetString(X_le_skey, '?????');
   case MdictPartDescr.where of
     OnlyAn   : WND_SetBoolean(X_le_analysis_toggle, true);
     OnlyGen  : WND_SetBoolean(X_le_generation_toggle, true);
     BothAnGen: WND_SetBoolean(X_le_angen_toggle, true);
   end;
   lsfon := Retype(MdictPartDescr.FON,LSPHONDEF_pPhonInfo);
   Lslexed_ShowLSMdict(MdictPartDescr.CC, lsfon);
   WND_Manage(X_le_analysis_toggle, -1);
   WND_Manage(X_le_generation_toggle, -1);
   WND_Manage(X_le_angen_toggle, -1);
   case CurrentLanguage of
     dutch:
       begin
         WND_Manage(X_le_sjwa_toggle, -1); 
         WND_Manage(X_le_wissel_toggle, -1); 
       end;
     english:
       begin
         WND_Manage(X_le_cons_toggle, -1); 
       end;
     spanish:
       begin
         WND_Manage(X_le_gg_toggle, -1); 
         WND_Manage(X_le_ch_toggle, -1); 
         WND_Manage(X_le_kk_toggle, -1); 
         WND_Manage(X_le_th_toggle, -1); 
       end;
   end;

   { Show context part } 
   WND_Clear(X_le_part_list);
   if LemmaPartData[ContextPart].exist
   then begin
     with ContextPartDescr do begin
       for i := 1 to nr do with ContextKeys[i] do begin
         ScreenList[i] := stem;
       end;
     end;
     WND_SetStringList(X_le_part_list, ContextPartDescr.ScreenList,
                       ContextPartDescr.nr); 
   end;

   ShowSemiIdioms;
   ShowIdioms;
   ShowMeanings;

   { show blex part }
   WND_Clear(X_le_attr_list);
   { convert blex part to screen format and display attribute values }
   if LemmaPartData[blexpart].exist
   then with BlexPartDescr do begin
     if nr = 0
     then begin
       t := LDCONVREC_GetAttrbs(Attr);
       ToScreen(t);
     end
     else begin
       for i := 1 to Nr
       do begin
         WND_WriteString(X_le_attr_list, ScreenList[i], 
                         STRING_Length(ScreenList[i]), true);
         if i <> nr then WND_WriteLine(X_le_attr_list, true);
       end;
     end;
   end;

   with CommentPartDescr 
   do begin
     WND_Clear(X_le_comment_text);
     for i := 1 to NrComments
     do begin
       WND_WriteString(X_le_comment_text, Comments[i],
                       STRING_Length(Comments[i]), true);
       if i <> NrComments then WND_WriteLine(X_le_comment_text, true);
     end;
   end;

   if STR_IntegerToStr(NrLemmas, DummyString, StrLen)
   then WND_SetString(X_le_selected_number, DummyString)
   else WND_SetString(X_le_selected_number, '?????');
   if STR_IntegerToStr(LemmaNr, DummyString, StrLen)
   then WND_SetString(X_le_current_lemma, DummyString)
   else WND_SetString(X_le_current_lemma, '?????');

end; { ShowLemma }

procedure ReadWhere;
var
  b: boolean;
  old: LDMDICT_WhereType;
begin
  with MdictPartDescr
  do begin
    old := where;
    WND_GetBoolean(X_le_analysis_toggle, b);
    if b then where := OnlyAn;
    WND_GetBoolean(X_le_generation_toggle, b);
    if b then where := OnlyGen;
    WND_GetBoolean(X_le_angen_toggle, b);
    if b then where := BothAnGen;
    if old <> where
    then begin
      LemmaPartData[mdictpart].modified := true;
      writeln('Where modified. ');
    end;
  end;
end;

procedure ReadComments;
var
  i: integer;
  DummyString: String_String;
  OldNr: integer;
  OldText: CommentText;
begin
  with CommentPartDescr
  do begin
    OldNr := NrComments;
    OldText := Comments;
    i := 1;
    WND_ReadString(X_le_comment_text, DummyString, i);
    while (i <= MaxNrCommentLines) and WND_Done
    do begin
      Comments[i] := DummyString;
      NrComments := i;
      i := i+1;
      WND_ReadString(X_le_comment_text, DummyString, i);
    end;
    if (NrComments = 1) and (Comments[1] = '')
    then NrComments := 0;
    if (OldNr <> NrComments) or (OldText <> Comments)
    then begin
      modified := true;
      writeln('Comments modified. ');
    end;
  end; 
end;

procedure ReadContextAndPhon;
var
  modified: boolean;
  lsfon: LSPHONDEF_pPhonInfo;
begin
  with MdictPartDescr
  do begin
    lsfon := Retype(FON,LSPHONDEF_pPhonInfo);
    Lslexed_ReadLSMdict(CC, lsfon, modified);
    if modified 
    then begin
      LemmaPartData[mdictpart].modified := true;
      writeln('Context and phon modified. ');
    end;
  end;
end;

procedure ReadBlex;
var
  i: integer;
  DummyString: String_String;
  OldNr: integer;
  OldText: AttrText;
begin
  with BlexPartDescr
  do begin
    OldNr := Nr;
    OldText := ScreenList;
    i := 1;
    WND_ReadString(X_le_attr_list, DummyString, i);
    while (i <= MaxBlexLines) and WND_Done 
    do begin
      ScreenList[i] := DummyString;
      Nr := i;
      i := i+1;
      WND_ReadString(X_le_attr_list, DummyString, i);
    end;
    writeln('OldNr: ', OldNr);
    writeln('Nr before: ', Nr);
    if (Nr = 1) and (ScreenList[1] = '')
    then Nr := 0;
    writeln('Nr after: ', Nr);
    if (OldNr <> Nr) or (OldText <> ScreenList)
    then begin
      LemmaPartData[blexpart].modified := true;
      writeln('Blex modified. ');
    end;
  end; 
end;

procedure ReadFromMainScreen;
begin
  ReadWhere;
  ReadContextAndPhon;
  ReadComments;
  ReadBlex;
end;

procedure StartRecursion;
begin
  if EditingAllowed then ReadFromMainScreen;
  StoreScreenState(ScreenState);
  MakeKeysInsensitive(MainFunctionKeys);
  UpdateScreen;
end;

procedure EndRecursion;
begin
  ShowLemma;
  RestoreScreenState(ScreenState);
end;

procedure SplitLemma;
label
  exit;
var
  DummyKey,
  NewKey          : integer;
  DummyBoolean    : boolean;
  ContextStem,
  NewStem         : STRING_String;
  MdictRec        : { [volatile] } MDICTDEF_RecordDef;
  pMdictRec       : Address(MDICTDEF_RecordDef);
  SdictRec        : LISDICT_RecordDef;
  IldictRec       : LIILDICT_RecordDef;
  BlexRec         : { [volatile] } LSDOMAINT_BlexStruct;
  pBlexRec        : Address(LSDOMAINT_BlexStruct);
  listree         : LISTREE_pStree;
  kind            : INTERFACE1_keytype;
  CC              : LIMORFDEF_ContextConds;
  FON             : LIMORFDEF_pPhonInfo;
  lsfon           : LSPHONDEF_pPhonInfo;
  where           : LDMDICT_WhereType;
  i,j,
  NrMeanings,
  NrComments      : integer;
  MeaningsBuffer  : array[1..MaxMeanings] of LIILDICT_RecordDef;
  CommentsBuffer  : CommentText;

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
  if not AskBoolean(
         'The current lemma will be copied, including meanings. Proceed? ')
  then goto exit;
  kind := BAStype;
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
      If not GetStem(SdictPartDescr.ctxt[1], ContextStem)
      then begin
        GiveMessage('Stem of context key not found. ');
        goto exit;
      end;
      STRING_Concat(NewStem, OriginalStem, ContextStem);
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
      lsfon := Retype(FON,LSPHONDEF_pPhonInfo);
      MdictRec.FON  := lsfon^;
      MdictRec.where:= where;
      pMdictRec     := adr(MdictRec);
      LDMDICT_WriteSequential(Retype(pMdictRec,LDMDICT_pMdictStruct));
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
    NrMeanings := 0;
    if LIILDICT_GetAildictAll(LemmaKey, IldictRec)
    then begin
      NrMeanings := 1;
      IldictRec.skey := NewKey;
      MeaningsBuffer[NrMeanings] := IldictRec;
      while LIILDICT_GetNextAildictAll(LemmaKey, IldictRec)
      do begin
        NrMeanings := NrMeanings+1;
        IldictRec.skey := NewKey;
        MeaningsBuffer[NrMeanings] := IldictRec;
      end;
    end;
    for i := 1 to NrMeanings
    do begin
      LIILDICT_WriteSequential(MeaningsBuffer[i]);
      NrComments := 0;
      if LIMCOMMENT_GetCommentLine(LemmaKey, MeaningsBuffer[i].mkey, 
                                   commentline)
      then begin
        NrComments := 1;
        CommentsBuffer[NrComments] := CommentLine;
        while LIMCOMMENT_GetNextCommentline(LemmaKey,MeaningsBuffer[i].mkey,
                                            commentline)
        do begin
          NrComments := NrComments+1;
          CommentsBuffer[NrComments] := CommentLine;
        end;
      end;
      for j := 1 to NrComments
      do LIMCOMMENT_WriteSequential(NewKey, MeaningsBuffer[i].mkey, 
                                    commentline);
    end;

    LDGETKEY_Put(listree, NewKey);
    BlexRec := MAKET_BlexrecFromStree(NewKey,Retype(listree,LSSTREE_pStree));
    BlexRec.IsBxpr := true;
    pBlexRec := adr(BlexRec);
    LDBLEX_WriteSequential(Retype(pBlexRec,LDBLEX_pBlexStruct));
  end;
  StartRecursion;
  EditLemma(Newkey,'',EditLemmaMode,DummyBoolean,Dummykey,1,1);
  EndRecursion;
exit:
end;

procedure DeleteLemma;
begin
  IF STRING_FindFirstSubString(OriginalStem, ' ', 1) <> 0
  then GiveMessage('A fixed idiom cannot be removed yet. ')
  else begin
    if (BlexPartDescr.Attr^.cat = PrepCat) or
       (BlexPartDescr.Attr^.cat = PartCat)
    then begin
      if AskBoolean(
         'References from attributes will not be checked. Proceed Anyway? ')
      then LemmaRemoved := true;
    end
    else LemmaRemoved := true;
  end;
end;

  procedure ShowRelatedSemiIdioms;
  {
    This procedure finds all semi-idioms with its argument equal to 
    the current lemma.
    For this option a sequential search through the whole database is
    necessary. This will take some time, so when the number of semi-idioms
    will increase, a kind of cross-reference file table will be desirable.
  }
  const
   MaxSelectedKeys      = 50;
  var 
    { global: SelectedKey }
    SelectedKeys   : array[1..MaxSelectedKeys] of integer;
    NumberSelectedKeys: integer;
    LastSelectedKey: integer;
  begin
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
    then GiveMessage('No semi-idioms found with this argument. ')
    else begin
      { show (evt. edit) selected lemmas }
      StartRecursion;
      EditSelectedLemmas(NumberSelectedKeys, SelectedKeys, '',
                         EditorMode, KeySelected, SelectedKey);
      EndRecursion;
    end;
  end;
  
  procedure ShowRelatedIdioms;
  {
    This procedure finds all idioms with an argument equal to 
    the current lemma.
    For this option a sequential search through the whole database is
    necessary. This will take some time, so when the number of idioms
    will increase, a kind of cross-reference file table will be desirable.
  }
  const
   MaxSelectedKeys      = 50;
  var   
    { global: SelectedKey }
    SelectedKeys   : array[1..MaxSelectedKeys] of integer;
    NumberSelectedKeys: integer;
    LastSelectedKey: integer;
  begin
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
      StartRecursion;
      EditSelectedLemmas(NumberSelectedKeys, SelectedKeys, '',
                         EditorMode, KeySelected, SelectedKey);
      EndRecursion;
    end;
  end;

procedure TranslateMeaning(l: MB_LanguageType; mkey: integer);
var i: integer;
begin
  if l = CurrentLanguage
  then ShowTranslations(mkey, LemmaKey)
  else begin
    LexedMessage.action := ShowTranslation;
    LexedMessage.TargetLanguage := l;
    LexedMessage.mkey := mkey;
(* probably synchronization problems
    i := 1; 
    while i < 10000000
    do i := i+1;
*)
    MB_Put(mbxToControl, LexedMessage);
    MB_Take(mbxFromControl, LexedMessage);
  end;
end;

procedure SelectExistingMeaning(l: MB_LanguageType; var mkey: integer);
var
  key: integer;
begin
  if l = CurrentLanguage
  then begin
    if SelectLemma(SelectMkeymode, key)
    then mkey := key;
  end
  else begin
    LexedMessage.action := SelectMkey;
    LexedMessage.TargetLanguage := l;
    MB_Put(mbxToControl, LexedMessage);
    MB_Take(mbxFromControl, LexedMessage);
    if LexedMessage.Mkey <> 0
    then Mkey := LexedMessage.Mkey;
  end;
end;

procedure ParticleActions(ListItem: integer); 
begin
  StartRecursion;
  EditLemma(ContextPartDescr.ContextKeys[ListItem].key, '',
            EditorMode, KeySelected, SelectedKey, 1, 1);
  EndRecursion;
end;

procedure InsertParticle;
label
  exit;
var
  DummyBoolean: boolean;
  NewKey,
  DummyKey,
  ContextKey : integer;
  NewStem, 
  ContextStem: STRING_String;
  SdictRec    : LISDICT_RecordDef;
  BlexRec     : LSDOMAINT_BlexStruct;
  BlexRecVol  : { [volatile] } LSDOMAINT_BlexStruct;
  pBlexRec    : Address(LSDOMAINT_BlexStruct);
  listree     : LISTREE_pStree;
begin 
  with ContextPartDescr do begin
    StartRecursion;
    if SelectLemma(SelectSkeyMode, ContextKey)
    then begin
      GetStem(ContextKey, ContextStem);
      if AskBoolean(
      'The new lemma will be created immediately. Do you want to continue? ') 
      then begin
        STRING_Concat(NewStem, OriginalStem, ContextStem);
        listree := LDBLEX_ReadDirect(LemmaKey);
        LDBLEX_Release;
        if listree = nil
        then begin
          GiveMessage('Original Blex record not found. ');
          goto exit;
        end;
        GenerateKey(SkeyType, LemmaType, listree^.cat,
                    NewStem, NewKey);
        SdictRec.fkey := LemmaKey;
        SdictRec.skey := NewKey;
        SdictRec.nr := 1;
        SdictRec.ctxt[1] := ContextKey;
        LISDICT_WriteSequential(SdictRec);
        ChangeLog(sdict, add, NewKey, 0);
        LDGETKEY_Put(listree, NewKey);
        BlexRec := MAKET_BlexrecFromStree(NewKey,
                                          Retype(listree,LSSTREE_pStree));
        BlexRec.IsBxpr := true;
        if CheckCategory(ContextKey, PartCat)
        then LSLEXED_AssignParticle(BlexRec, ContextKey); 
        BlexRecVol := BlexRec;
        pBlexRec := adr(BlexRecVol); 
        LDBLEX_WriteSequential(Retype(pBlexRec,LDBLEX_pBlexStruct));
        nr := nr+1;
        ContextKeys[nr].key := NewKey;
        ContextKeys[nr].stem := ContextStem;
        ScreenList[nr] := ContextStem;
(*        GiveMessage('The new lemma will be shown on the next screen. '); *)
        EditLemma(Newkey,'',EditLemmaMode,DummyBoolean,Dummykey,0,0);
      end;
    end;
    EndRecursion;
  end; 
exit:
end; 

procedure MeaningActions(ListItem: integer);
var 
  OriginalScreenState: ScreenStateArray;
  key: integer;
  ExitLoop: boolean;
  DummyInteger: integer;
  DummyString,
  KeyString: STRING_String;
  LocalData: record
    Meaning   : LIILDICT_RecordDef;
    NrComments: integer;
    Comments  : CommentText;
    Removed   : boolean;
  end;

procedure ReadDescription;
var
  MdString: String_String;
  i: integer;
begin
  WND_GetString(X_le_il_description, MdString); 
  for i := 1 to LIILDict_MaxMDLength 
  do LocalData.meaning.md[i] := MdString[i];
end; 

procedure ReadWhere;
var
  yn: boolean;
begin
  WND_GetBoolean(X_le_il_analysis_toggle, yn);
  if yn then LocalData.meaning.ag := LIILDICT_Analysis;
  WND_GetBoolean(X_le_il_generation_toggle, yn);
  if yn then LocalData.meaning.ag := LIILDICT_Generation;
  WND_GetBoolean(X_le_il_angen_toggle, yn);
  if yn then LocalData.meaning.ag := LIILDICT_Both;
end;

procedure ReadComments;
var
  i: integer;
begin
  i := 1;
  WND_ReadString(X_le_il_comments, DummyString, i);
  while (i <= MaxNrCommentLines) and WND_Done
  do begin
    LocalData.Comments[i] := DummyString;
    LocalData.NrComments := i;
    i := i+1;
    WND_ReadString(X_le_il_comments, DummyString, i);
  end;
  if (LocalData.NrComments = 1) and (LocalData.Comments[1] = '')
  then LocalData.NrComments := 0;
end;

procedure ReadFromScreen;
begin
  ReadDescription;
  ReadWhere;
  ReadComments;
end;

procedure ShowSpref;
begin
  with LocalData
  do begin
    if STR_IntegerToStr(meaning.spref, DummyString, StrLen) 
    then WND_SetString(X_le_il_spref, DummyString)
    else WND_SetString(X_le_il_spref, '?????');
  end;
end;

procedure ShowMpref;
begin
  with LocalData
  do begin
    if STR_IntegerToStr(meaning.mpref, DummyString, StrLen) 
    then WND_SetString(X_le_il_mpref, DummyString)
    else WND_SetString(X_le_il_mpref, '?????');
  end;
end;

procedure ShowMarked;
begin
  with LocalData
  do begin
    if meaning.marked
    then begin
      WND_SetString(X_le_il_mark_il_button, 'Put On Meaning');
      if not removed
      then WND_SetString(X_le_il_status, 'INACTIVE');
    end
    else begin
      WND_SetString(X_le_il_mark_il_button, 'Put Off Meaning');
      if not removed
      then WND_SetString(X_le_il_status, '');
    end;
  end;
end;

procedure ShowDeleted;
begin
  with LocalData
  do begin
    if removed
    then WND_SetString(X_le_il_delete_il_button, 'Undelete Meaning')
    else WND_SetString(X_le_il_delete_il_button, 'Delete Meaning');
    if removed
    then WND_SetString(X_le_il_status, 'DELETED')
    else begin
      if meaning.marked
      then WND_SetString(X_le_il_status, 'INACTIVE')
      else WND_SetString(X_le_il_status, '');
    end;
  end;
end;

procedure ShowMeaning;
var
  i: integer;
begin
  with LocalData
  do begin
    WND_SetString(X_le_il_description, meaning.md);
    ShowSpref;
    ShowMpref;
    if Meaning.Mkey = 0
    then WND_SetString(X_le_il_mkey, 'New meaning')
    else begin
      if STRTOMKEY_GetMkeyStr(meaning.Mkey, KeyString)
      then WND_SetString(X_le_il_mkey, KeyString)
      else WND_SetString(X_le_il_mkey, '?????');
      STRTOMKEY_Release;
    end;
    case meaning.ag of
      LIILDICT_Analysis  : WND_SetBoolean(X_le_il_analysis_toggle, true);
      LIILDICT_Generation: WND_SetBoolean(X_le_il_generation_toggle, true);
      LIILDICT_Both      : WND_SetBoolean(X_le_il_angen_toggle, true);
    end;
    WND_Clear(X_le_il_comments);
    for i := 1 to NrComments
    do begin
      WND_WriteString(X_le_il_comments, Comments[i],
                      STRING_Length(Comments[i]), true);
      if i < NrComments then WND_WriteLine(X_le_il_comments, true);
    end;
    ShowMarked;
    ShowDeleted;
  end;
end;

procedure StartRecursion;
{ sss }
begin

  if EditingAllowed
  then begin
    ReadFromScreen;
    ReadFromMainScreen;
  end;

  StoreScreenState(ScreenState);
  RestoreScreenState(InitialScreenState);
  WND_Unmanage(X_le_il_window);
  WND_UnManage(X_le_analysis_toggle);
  WND_UnManage(X_le_generation_toggle);
  WND_UnManage(X_le_angen_toggle);
  case CurrentLanguage of
    dutch:
      begin
        WND_UnManage(X_le_sjwa_toggle); 
        WND_UnManage(X_le_wissel_toggle); 
      end;
    english:
      begin
        WND_UnManage(X_le_cons_toggle); 
      end;
    spanish:
      begin
         WND_UnManage(X_le_gg_toggle); 
         WND_UnManage(X_le_ch_toggle); 
         WND_UnManage(X_le_kk_toggle); 
         WND_UnManage(X_le_th_toggle); 
      end;
  end;

  MakeKeysInsensitive(MainFunctionKeys);
  UpdateScreen;
end;

procedure EndRecursion;
begin
  ShowLemma;
  ShowMeaning;
  WND_Manage(X_le_il_window, X_undefined);
  RestoreScreenState(ScreenState);
end;

begin
  with IldictPartDescr.meanings[ListItem] do begin
    LocalData.Meaning    := m;
    LocalData.NrComments := NrComments;
    LocalData.Comments   := Comments;
    LocalData.Removed    := Removed;
    ShowMeaning;
    WND_Manage(X_le_il_window, X_undefined);
    StoreScreenState(OriginalScreenState);
    if EditingAllowed
    then begin
      MakeKeySensitive(X_le_il_modify_spref_button);
      MakeKeySensitive(X_le_il_modify_mpref_button);
      MakeKeySensitive(X_le_il_mark_il_button);
      MakeKeySensitive(X_le_il_delete_il_button);
      MakeKeySensitive(X_le_il_new_meaning_button);
      MakeKeySensitive(X_le_il_analysis_toggle);
      MakeKeySensitive(X_le_il_generation_toggle);
      MakeKeySensitive(X_le_il_angen_toggle);
      MakeKeySensitive(X_le_il_description);
      MakeKeySensitive(X_le_il_comments);
      if OriginalLanguage
      then begin
        MakeKeySensitive(X_le_il_dutch_meaning_button);
        MakeKeySensitive(X_le_il_english_meaning_button);
        MakeKeySensitive(X_le_il_spanish_meaning_button);
      end
      else begin
        case CurrentLanguage of
          dutch  : MakeKeySensitive(X_le_il_dutch_meaning_button);
          english: MakeKeySensitive(X_le_il_english_meaning_button);
          spanish: MakeKeySensitive(X_le_il_spanish_meaning_button);
        end;
      end;
    end
    else MakeKeyInsensitive(X_le_il_comments); { different treatment!? }
    MakeKeySensitive(X_le_il_help_button);
    MakeKeySensitive(X_le_il_ok_button);
    MakeKeySensitive(X_le_il_cancel_button);
    if EditorMode = SelectMkeyMode
    then MakeKeySensitive(X_le_il_select_button);
    if OriginalLanguage
    then begin
      MakeKeySensitive(X_le_il_translate_dutch_button);
      MakeKeySensitive(X_le_il_translate_english_button);
      MakeKeySensitive(X_le_il_translate_spanish_button);
    end
    else begin
      case CurrentLanguage of
        dutch  : MakeKeySensitive(X_le_il_translate_dutch_button);
        english: MakeKeySensitive(X_le_il_translate_english_button);
        spanish: MakeKeySensitive(X_le_il_translate_spanish_button);
      end;
    end;
    UpdateScreen;
    ExitLoop := false;
    repeat
      WND_GetKey(key);
      case key of
        X_le_il_cancel_button: 
          { restore old values }
          ExitLoop := true;
        X_le_il_help_button: ;
        X_le_il_ok_button: 
          { store new values }
          begin
            ReadFromScreen;
            Modified := (m <> LocalData.Meaning);
            CommentsModified := (Comments <> LocalData.Comments) or
                                (NrComments <> LocalData.NrComments);
            m := LocalData.Meaning;
            NrComments := LocalData.NrComments;
            Comments := LocalData.Comments;
            Removed := LocalData.Removed;
            LemmapartData[ildictpart].modified := (Removed or temporary or
              Modified or CommentsModified);
            if temporary then temporary := false; { accept new meaning }
            ExitLoop := true;
          end;
        X_le_il_select_button:
          begin
            SelectedKey := m.mkey;
            KeySelected := true;
            ExitLoop := true;
          end;
        X_le_il_modify_spref_button: 
          begin
            if AskInteger('Give new spref: ', DummyInteger)
            then LocalData.meaning.spref := DummyInteger;
            ShowSpref;
          end;
        X_le_il_modify_mpref_button: 
          begin
            if AskInteger('Give new mpref: ', DummyInteger)
            then LocalData.meaning.mpref := DummyInteger;
            ShowMpref;
          end;
        X_le_il_new_meaning_button:
          begin
            LocalData.meaning.mkey := 0;
            WND_SetString(X_le_il_mkey, 'New meaning');
          end;
        X_le_il_dutch_meaning_button: 
          begin
            StartRecursion;
            SelectExistingMeaning(dutch, LocalData.meaning.mkey);
            EndRecursion;
          end; 
        X_le_il_english_meaning_button: 
          begin
            StartRecursion;
            SelectExistingMeaning(english, LocalData.meaning.mkey);
            EndRecursion;
          end; 
        X_le_il_spanish_meaning_button: 
          begin
            StartRecursion;
            SelectExistingMeaning(spanish, LocalData.meaning.mkey);
            EndRecursion;
          end; 
        X_le_il_mark_il_button:
          begin
            LocalData.meaning.marked := not LocalData.meaning.marked;
            ShowMarked;
          end;
        X_le_il_delete_il_button:
          begin
            LocalData.Removed := not LocalData.Removed;
            ShowDeleted;
          end;
        X_le_il_translate_dutch_button:
          begin
            lexedmessage.mkey := LocalData.meaning.mkey;
            lexedmessage.action := ShowTranslation;
            StartRecursion;
{  aaa }
            TranslateMeaning(dutch, LocalData.meaning.mkey);
            EndRecursion;
          end;
        X_le_il_translate_english_button:
          begin

            lexedmessage.mkey := LocalData.meaning.mkey;
            lexedmessage.action := ShowTranslation;
            StartRecursion;
            TranslateMeaning(english, LocalData.meaning.mkey);
            EndRecursion;            
          end;
        X_le_il_translate_spanish_button:
          begin
            lexedmessage.mkey := LocalData.meaning.mkey;
            lexedmessage.action := ShowTranslation;
            StartRecursion;
            TranslateMeaning(spanish, LocalData.meaning.mkey);
            EndRecursion;
          end;
        otherwise ;  
      end;
    until ExitLoop;
    RestoreScreenState(OriginalScreenState);
    WND_Unmanage(X_le_il_window);
  end;
end;

procedure InsertMeaning;
begin
  with IldictPartDescr do begin
    if nr = MaxMeanings
    then GiveMessage('Maximum number of meanings reached. ')
    else begin
      with meanings[nr+1] do begin
        InitIldictRecord(m);
        InitIldictRecord(oldm);
        m.skey := LemmaKey;
        temporary := true; 
        modified := false;
        removed  := false;
        NrComments := 0;
        CommentsModified := false;
        MeaningActions(nr+1);
      end;
      if not meanings[nr+1].temporary
      then begin
        LemmaPartData[ildictpart].exist := true;
        nr := nr+1;
        ShowMeanings;
      end;
    end;
  end;
end;

procedure SemiIdiomActions(ListItem: integer);
var 
  OriginalScreenState: ScreenStateArray;
  key: integer;
  ExitLoop: boolean;
  DummyInteger: integer;
  DummyString,
  KeyString: STRING_String;
  LocalData: record
    Argument  : integer;
    ArgStem   : STRING_String;
    ArgNr     : integer;
    Skey      : integer;
    Mkey      : integer;
    NrComments: integer;
    Comments  : CommentText;
    Removed   : boolean;
  end;

procedure ReadComments;
var
  i: integer;
begin
  i := 1;
  WND_ReadString(X_le_sid_comments, DummyString, i);
  while (i <= MaxNrCommentLines) and WND_Done
  do begin
    LocalData.Comments[i] := DummyString;
    LocalData.NrComments := i;
    i := i+1;
    WND_ReadString(X_le_sid_comments, DummyString, i);
  end;
  if (LocalData.NrComments = 1) and (LocalData.Comments[1] = '')
  then LocalData.NrComments := 0;
end;

procedure ShowArgNr;
begin
  with LocalData
  do begin
    if ArgNr = 0
    then WND_SetString(X_le_sid_argnr, '')
    else begin
      if STR_IntegerToStr(ArgNr, DummyString, StrLen) 
      then WND_SetString(X_le_sid_argnr, DummyString)
      else WND_SetString(X_le_sid_argnr, '?????');
    end;
  end;
end;

procedure ShowSemiIdiom;
var
  i: integer;
begin
  with LocalData
  do begin
    WND_SetString(X_le_sid_argument, ArgStem);
    ShowArgNr;
    if Skey = 0
    then WND_SetString(X_le_sid_skey, 'New skey')
    else begin
      if STRTOKEY_GetSkeyStr(Skey, KeyString)
      then WND_SetString(X_le_sid_skey, KeyString)
      else WND_SetString(X_le_sid_skey, '?????');
      STRTOKEY_Release;
    end;
    if Mkey = 0
    then WND_SetString(X_le_sid_mkey, 'New meaning')
    else begin
      if STRTOMKEY_GetMkeyStr(Mkey, KeyString)
      then WND_SetString(X_le_sid_mkey, KeyString)
      else WND_SetString(X_le_sid_mkey, '?????');
      STRTOMKEY_Release;
    end;
    WND_Clear(X_le_sid_comments);
    for i := 1 to NrComments
    do begin
      WND_WriteString(X_le_sid_comments, Comments[i],
                      STRING_Length(Comments[i]), true);
      if i < NrComments then WND_WriteLine(X_le_sid_comments, true);
    end;
    if removed
    then begin
      WND_SetString(X_le_sid_deleted, 'DELETED');
      WND_SetString(X_le_sid_delete_sid_button, 'Undelete Idiom');
    end
    else begin
      WND_SetString(X_le_sid_deleted, '');
      WND_SetString(X_le_sid_delete_sid_button, 'Delete Idiom');
    end;
  end;
end;

procedure StartRecursion;
begin
  if EditingAllowed
  then begin
    ReadComments;
    ReadFromMainScreen;
  end;
  StoreScreenState(ScreenState);
  RestoreScreenState(OriginalScreenState);
  MakeKeysInsensitive(MainFunctionKeys);
  UpdateScreen;
  WND_Unmanage(X_le_sid_window);
end;

procedure EndRecursion;
begin
  ShowLemma;
  ShowSemiIdiom;
  WND_Manage(X_le_sid_window, X_undefined);
  RestoreScreenState(ScreenState);
end;

begin
  with SiddictPartDescr.sids[ListItem] do begin
    LocalData.Argument   := sid.arg;
    LocalData.ArgStem    := ArgStem;
    LocalData.ArgNr      := sid.argnr;
    LocalData.Skey       := sid.sidskey;
    LocalData.Mkey       := mkey.mkey;
    LocalData.NrComments := NrComments;
    LocalData.Comments   := Comments;
    LocalData.Removed    := Removed;
    ShowSemiIdiom;
    StoreScreenState(OriginalScreenState);
    WND_Manage(X_le_sid_window, X_undefined);
    if EditingAllowed
    then begin
      MakeKeySensitive(X_le_sid_modify_argument_button);
      MakeKeySensitive(X_le_sid_modify_number_button);
      MakeKeySensitive(X_le_sid_delete_sid_button);
      MakeKeySensitive(X_le_sid_new_meaning_button);
      MakeKeySensitive(X_le_sid_comments);
      if OriginalLanguage
      then begin
        MakeKeySensitive(X_le_sid_dutch_meaning_button);
        MakeKeySensitive(X_le_sid_english_meaning_button);
        MakeKeySensitive(X_le_sid_spanish_meaning_button);
      end
      else begin
        case CurrentLanguage of
          dutch  : MakeKeySensitive(X_le_sid_dutch_meaning_button);
          english: MakeKeySensitive(X_le_sid_english_meaning_button);
          spanish: MakeKeySensitive(X_le_sid_spanish_meaning_button);
        end;
      end;
    end
    else MakeKeyInsensitive(X_le_sid_comments); { different treatment !? }
    MakeKeySensitive(X_le_sid_show_argument_button);
    MakeKeySensitive(X_le_sid_help_button);
    if (LocalData.Argument <> 0) and (LocalData.ArgNr <> 0)
    then MakeKeySensitive(X_le_sid_ok_button);
    MakeKeySensitive(X_le_sid_cancel_button);
    if EditorMode = SelectMkeyMode
    then MakeKeySensitive(X_le_sid_select_button);
    if OriginalLanguage
    then begin
      MakeKeySensitive(X_le_sid_translate_dutch_button);
      MakeKeySensitive(X_le_sid_translate_english_button);
      MakeKeySensitive(X_le_sid_translate_spanish_button);
    end
    else begin
      case CurrentLanguage of
        dutch  : MakeKeySensitive(X_le_sid_translate_dutch_button);
        english: MakeKeySensitive(X_le_sid_translate_english_button);
        spanish: MakeKeySensitive(X_le_sid_translate_spanish_button);
      end;
    end;
    UpdateScreen;
    ExitLoop := false;
    repeat
      WND_GetKey(key);
      case key of
        X_le_sid_cancel_button: 
          { restore old values }
          ExitLoop := true;
        X_le_sid_help_button: ;
        X_le_sid_ok_button: 
          { store new values }
          begin
            ReadComments;
            MkeyModified := (mkey.mkey <> LocalData.Mkey);
            CommentsModified := (Comments <> LocalData.Comments) or
                                (NrComments <> LocalData.NrComments);
            Modified := (sid.arg <> LocalData.Argument) or
                        (sid.argnr <> LocalData.ArgNr);
            sid.arg := LocalData.Argument;
            ArgStem := LocalData.ArgStem;
            sid.argnr := LocalData.ArgNr;
            sid.sidskey := LocalData.Skey;
            mkey.mkey := LocalData.Mkey;
            NrComments := LocalData.NrComments;
            Comments := LocalData.Comments;
            Removed := LocalData.Removed;
            LemmapartData[siddictpart].modified := (Removed or temporary or
              Modified or MkeyModified or CommentsModified);
            if temporary then temporary := false; { accept new idiom }
            ExitLoop := true;
          end;
        X_le_sid_select_button:
          begin
            SelectedKey := mkey.mkey;
            KeySelected := true;
            ExitLoop := true;
          end;
        X_le_sid_show_argument_button: 
          begin
            StartRecursion;
            EditLemma(LocalData.argument, '',
                     EditorMode, KeySelected, SelectedKey, 1, 1);
            EndRecursion;
          end;
        X_le_sid_modify_argument_button:  
          begin
            StartRecursion;
            if (LocalData.Argument = 0) or { no argument yet }
               (LocalData.Skey = 0)        { no skey assigned yet }
            then begin
              if SelectLemma(SelectSkeyMode, SelectedKey)
              then begin
                LocalData.Argument := SelectedKey;
                if not GetStem(LocalData.Argument, LocalData.ArgStem)
                then LocalData.ArgStem := '?????';
              end;
            end
            else begin
              { stem of argument cannot change because of skey-name }
              if SelectLemmaWithStem(SelectSkeyMode, 
                 LocalData.ArgStem, SelectedKey)
              then LocalData.Argument := SelectedKey;
            end;
            EndRecursion;
            if (LocalData.Argument <> 0) and (LocalData.ArgNr <> 0)
            then MakeKeySensitive(X_le_sid_ok_button);
            UpdateScreen;    
          end;
        X_le_sid_modify_number_button: 
          begin
            if AskInteger('Give new argument number: ', DummyInteger)
            then LocalData.ArgNr := DummyInteger;
            ShowArgNr;
            if (LocalData.Argument <> 0) and (LocalData.ArgNr <> 0)
            then MakeKeySensitive(X_le_sid_ok_button)
            else MakeKeyInsensitive(X_le_sid_ok_button);
            UpdateScreen;    
          end;
        X_le_sid_new_meaning_button:
          begin
            LocalData.mkey := 0;
            WND_SetString(X_le_sid_mkey, 'New meaning');
          end;
        X_le_sid_dutch_meaning_button: 
          begin
            StartRecursion;
            SelectExistingMeaning(dutch, LocalData.mkey);
            EndRecursion;
          end; 
        X_le_sid_english_meaning_button: 
          begin
            StartRecursion;
            SelectExistingMeaning(english, LocalData.mkey);
            EndRecursion;
          end; 
        X_le_sid_spanish_meaning_button: 
          begin
            StartRecursion;
            SelectExistingMeaning(spanish, LocalData.mkey);
            EndRecursion;
          end; 
        X_le_sid_delete_sid_button:
          begin
            if LocalData.Removed
            then begin
              LocalData.Removed := false;
              WND_SetString(X_le_sid_deleted, '');
              WND_SetString(X_le_sid_delete_sid_button, 'Delete Idiom');
            end
            else begin
              LocalData.Removed := true;
              WND_SetString(X_le_sid_deleted, 'DELETED');
              WND_SetString(X_le_sid_delete_sid_button, 'Undelete Idiom');
            end;
          end;
        X_le_sid_translate_dutch_button:
          begin
            StartRecursion;
            TranslateMeaning(dutch, LocalData.mkey);
            EndRecursion;
          end;
        X_le_sid_translate_english_button:
          begin
            StartRecursion;
            TranslateMeaning(english, LocalData.mkey);
            EndRecursion;
          end;
        X_le_sid_translate_spanish_button:
          begin
            StartRecursion;
            TranslateMeaning(spanish, LocalData.mkey);
            EndRecursion;
          end;
        otherwise ;  
      end;
    until ExitLoop;
    RestoreScreenState(OriginalScreenState);
    WND_Unmanage(X_le_sid_window);
  end;
end;

procedure InsertSemiIdiom;
begin
  with SiddictPartDescr do begin
    if nr = MaxSemiIdioms
    then GiveMessage('Maximum number of semi idioms reached. ')
    else begin
      with sids[nr+1] do begin
        InitSiddictRecord(sid);
        sid.skey := LemmaKey;
        InitIldictRecord(mkey);
        InitIldictRecord(oldmkey);
        temporary := true; 
        modified := false;
        removed  := false;
        MkeyModified := false;
        NrComments := 0;
        CommentsModified := false;
        SemiIdiomActions(nr+1);
      end;
      if not sids[nr+1].temporary
      then begin
        LemmaPartData[siddictpart].exist := true;
        nr := nr+1;
        ShowSemiIdioms;
      end;
    end;
  end;
end;

procedure IdiomActions(ListItem: integer);
var 
  OriginalScreenState: ScreenStateArray;
  i,
  key: integer;
  FixedStem,
  ExitLoop: boolean;
  SelectedArgument,
  DummyInteger: integer;
  DummyString,
  KeyString: STRING_String;
  LocalData: record
    idiom     : LIIDDICT_RecordDef;
    ArgStems  : array[1..LIIDDICT_MaxIdArgs] of STRING_String;
    Mkey      : integer;
    NrComments: integer;
    Comments  : CommentText;
    Removed   : boolean;
  end;
  IdiomPattern: LSDOMAINT_SynPatternType;
  PatternName: String_string;

procedure ReadComments;
var
  i: integer;
begin
  i := 1;
  WND_ReadString(X_le_id_comments, DummyString, i);
  while (i <= MaxNrCommentLines) and WND_Done
  do begin
    LocalData.Comments[i] := DummyString;
    LocalData.NrComments := i;
    i := i+1;
    WND_ReadString(X_le_id_comments, DummyString, i);
  end;
  if (LocalData.NrComments = 1) and (LocalData.Comments[1] = '')
  then LocalData.NrComments := 0;
end;

procedure ShowArguments;
var
  i: integer;
  s: STRING_String;
begin
  s := '';
  for i := 1 to LocalData.idiom.args.nrargs
  do begin
    STRING_Append(s, LocalData.ArgStems[i]);
    STRING_AppendChar(s,s, ' ');
  end;
  WND_SetString(X_le_id_arguments, s);
end;

procedure ShowPattern;
begin
  with LocalData
  do begin
    if idiom.pattern = 0
    then WND_SetString(X_le_id_pattern, '')
    else begin
      IdiomPattern := Retype(idiom.pattern,LSDOMAINT_synpatterntype);
      LSTYPETOSTR_SynPatternType(DummyString, r, IdiomPattern);
      WND_SetString(X_le_id_pattern, DummyString);
    end;
  end;
end;

procedure ShowIdiom;
var
  i: integer;
  r: STR_Range;
  IdiomPattern    : LSDOMAINT_SynPatternType;
begin
  with LocalData
  do begin
    ShowArguments;
    ShowPattern;
    if idiom.idskey = 0
    then WND_SetString(X_le_id_skey, 'New skey')
    else begin
      if STRTOKEY_GetSkeyStr(idiom.idskey, KeyString)
      then WND_SetString(X_le_id_skey, KeyString)
      else WND_SetString(X_le_id_skey, '?????');
      STRTOKEY_Release;
    end;
    if Mkey = 0
    then WND_SetString(X_le_id_mkey, 'New meaning')
    else begin
      if STRTOMKEY_GetMkeyStr(Mkey, KeyString)
      then WND_SetString(X_le_id_mkey, KeyString)
      else WND_SetString(X_le_id_mkey, '?????');
      STRTOMKEY_Release;
    end;
    WND_Clear(X_le_id_comments);
    for i := 1 to NrComments
    do begin
      WND_WriteString(X_le_id_comments, Comments[i],
                      STRING_Length(Comments[i]), true);
      if i < NrComments then WND_WriteLine(X_le_id_comments, true);
    end;
    if removed
    then begin
      WND_SetString(X_le_id_deleted, 'DELETED');
      WND_SetString(X_le_id_delete_id_button, 'Undelete Idiom');
    end
    else begin
      WND_SetString(X_le_id_deleted, '');
      WND_SetString(X_le_id_delete_id_button, 'Delete Idiom');
    end;
  end;
end;

procedure StartRecursion;
begin
  if EditingAllowed
  then begin
    ReadComments;
    ReadFromMainScreen;
  end;
  StoreScreenState(ScreenState);
  RestoreScreenState(OriginalScreenState);
  MakeKeysInsensitive(MainFunctionKeys);
  UpdateScreen;
  WND_Unmanage(X_le_id_window);
end;

procedure EndRecursion;
begin
  ShowLemma;
  ShowIdiom;
  WND_Manage(X_le_id_window, X_undefined);
  RestoreScreenState(ScreenState);
end;

function InsertArgpos(pos: integer): boolean;
var
  i: integer;
begin
  with LocalData 
  do begin
    if (pos < 2) or (pos > idiom.args.nrargs+1) or
       (idiom.args.nrargs = LIIDDICT_MaxIdArgs)
    then InsertArgPos := false
    else begin
      for i := idiom.args.nrargs downto pos
      do begin
        idiom.args.argkeys[i+1] := idiom.args.argkeys[i];
        argstems[i+1] := argstems[i]; 
      end;
      idiom.args.argkeys[pos] := 0;
      argstems[pos] := '';
      idiom.args.nrargs := idiom.args.nrargs+1;
      InsertArgPos := true;
    end;
  end;
end;

function DeleteArgpos(pos: integer): boolean;
var
  i: integer;
begin
  with LocalData 
  do begin
    if (pos < 2) or (pos > idiom.args.nrargs) or
       (idiom.args.nrargs = 2)
    then DeleteArgPos := false
    else begin
      for i := pos to idiom.args.nrargs-1
      do begin
        idiom.args.argkeys[i] := idiom.args.argkeys[i+1];
        argstems[i] := argstems[i+1]; 
      end;
      idiom.args.nrargs := idiom.args.nrargs-1;
      DeleteArgPos := true;
    end;
  end;
end;

procedure InsertArgument(pos: integer);
begin
  if InsertArgPos(pos)
  then begin
    StartRecursion;
    if SelectLemma(SelectSkeyMode, SelectedKey)
    then begin
      LocalData.idiom.args.argkeys[pos] := SelectedKey;
      if not GetStem(LocalData.idiom.args.argkeys[pos], 
                     LocalData.ArgStems[pos])
      then LocalData.ArgStems[pos] := '?????';
    end
    else DeleteArgPos(pos);
    EndRecursion;
    if (LocalData.idiom.pattern <> 0) and
       (LocalData.idiom.args.nrargs >= 2) 
    then MakeKeySensitive(X_le_id_ok_button);
    UpdateScreen;    
  end;
end;

procedure SelectArgument;
begin
  if LocalData.idiom.args.nrargs <= 2
  then SelectedArgument := 2   { 1st = head }
  else begin
    if not AskInteger('Give number of argument: ', DummyInteger)
    then SelectedArgument := 0
    else begin
      if (DummyInteger > 0) or
         (DummyInteger <= LocalData.idiom.args.nrargs-1)
      then SelectedArgument := DummyInteger+1 { 1st = head }
      else begin
        GiveMessage('Incorrect number. ');
        SelectedArgument := 0;
      end;
    end;
  end;
end;

begin
  with IddictPartDescr.ids[ListItem] do begin
    LocalData.idiom      := idiom; 
    for i := 1 to idiom.args.nrargs
    do LocalData.ArgStems[i] := ArgStems[i];
    LocalData.Mkey       := mkeys[1].mkey;
    LocalData.NrComments := NrComments;
    LocalData.Comments   := Comments;
    LocalData.Removed    := Removed;
    ShowIdiom;
    StoreScreenState(OriginalScreenState);
    WND_Manage(X_le_id_window, X_undefined);
    if EditingAllowed
    then begin
      MakeKeySensitive(X_le_id_modify_argument_button);
      MakeKeySensitive(X_le_id_modify_pattern_button);
      MakeKeySensitive(X_le_id_new_meaning_button);
      if LocalData.idiom.idskey = 0
      then MakeKeySensitive(X_le_id_insert_argument_button);
      MakeKeySensitive(X_le_id_delete_id_button);
      MakeKeySensitive(X_le_id_comments);
      if OriginalLanguage
      then begin
        MakeKeySensitive(X_le_id_dutch_meaning_button);
        MakeKeySensitive(X_le_id_english_meaning_button);
        MakeKeySensitive(X_le_id_spanish_meaning_button);
      end
      else begin
        case CurrentLanguage of
          dutch  : MakeKeySensitive(X_le_id_dutch_meaning_button);
          english: MakeKeySensitive(X_le_id_english_meaning_button);
          spanish: MakeKeySensitive(X_le_id_spanish_meaning_button);
        end;
      end;
    end
    else MakeKeyInsensitive(X_le_id_comments); { different treatment !? }
    MakeKeySensitive(X_le_id_show_argument_button);
    MakeKeySensitive(X_le_id_help_button);
    if (LocalData.idiom.args.nrargs <> 0) and (LocalData.idiom.Pattern <> 0)
    then MakeKeySensitive(X_le_id_ok_button);
    MakeKeySensitive(X_le_id_cancel_button);
    if EditorMode = SelectMkeyMode
    then MakeKeySensitive(X_le_id_select_button);
    if OriginalLanguage
    then begin
      MakeKeySensitive(X_le_id_translate_dutch_button);
      MakeKeySensitive(X_le_id_translate_english_button);
      MakeKeySensitive(X_le_id_translate_spanish_button);
    end
    else begin
      case CurrentLanguage of
        dutch  : MakeKeySensitive(X_le_id_translate_dutch_button);
        english: MakeKeySensitive(X_le_id_translate_english_button);
        spanish: MakeKeySensitive(X_le_id_translate_spanish_button);
      end;
    end;
    UpdateScreen;
    ExitLoop := false;
    repeat
      WND_GetKey(key);
      case key of
        X_le_id_cancel_button: 
          { restore old values }
          ExitLoop := true;
        X_le_id_help_button: ;
        X_le_id_ok_button: 
          { store new values }
          begin
            ReadComments;
            MkeyModified[1] := (mkeys[1].mkey <> LocalData.Mkey);
            CommentsModified := (Comments <> LocalData.Comments) or
                                (NrComments <> LocalData.NrComments);
            Modified := (idiom <> LocalData.idiom);
            idiom := LocalData.idiom;
            for i := 1 to LocalData.idiom.args.nrargs
            do ArgStems[i] := LocalData.ArgStems[i];
            mkeys[1].mkey := LocalData.Mkey;
            NrComments := LocalData.NrComments;
            Comments := LocalData.Comments;
            Removed := LocalData.Removed;
            LemmapartData[iddictpart].modified := (Removed or temporary or
              Modified or MkeyModified[1] or CommentsModified);
            if temporary then temporary := false; { accept new idiom }
            ExitLoop := true; 
          end;
        X_le_id_select_button:
          begin
            SelectedKey := mkeys[1].mkey;
            KeySelected := true;
            ExitLoop := true;
          end;
        X_le_id_show_argument_button: 
          begin
            if LocalData.idiom.args.nrargs < 2 { always head present }
            then GiveMessage('No arguments assigned yet. ')
            else begin
              SelectArgument;
              if SelectedArgument <> 0
              then begin
                StartRecursion;
                EditLemma(LocalData.idiom.args.argkeys[SelectedArgument], '',
                          EditorMode, KeySelected, SelectedKey, 1, 1);
                EndRecursion;
              end;
            end;
          end;
        X_le_id_modify_argument_button: 
          begin
            if LocalData.idiom.args.nrargs = 1 { only head present }
            then InsertArgument(2)
            else begin
              if LocalData.idiom.idskey = 0
              then FixedStem := false
              else FixedStem := true;
              SelectArgument;
              if SelectedArgument <> 0
              then begin
                StartRecursion;
                if not FixedStem
                then begin
                  if SelectLemma(SelectSkeyMode, SelectedKey)
                  then begin
                    LocalData.idiom.args.argkeys[SelectedArgument] := 
                      SelectedKey;
                    if not GetStem(
                             LocalData.idiom.args.argkeys[SelectedArgument], 
                             LocalData.ArgStems[SelectedArgument])
                    then LocalData.ArgStems[SelectedArgument] := '?????';
                  end;
                end
                else begin
                  { stem of argument cannot change because of skey-name }
                  if SelectLemmaWithStem(SelectSkeyMode, 
                     LocalData.ArgStems[SelectedArgument], SelectedKey)
                  then LocalData.idiom.args.argkeys[SelectedArgument]
                         := SelectedKey;
                end;
                EndRecursion;
              end;
            end;
          end;
        X_le_id_modify_pattern_button: 
          begin
            if AskString('Give idiom pattern: ', PatternName)
            then begin
              if not LSSTRTOTYPE_SynPatternType(PatternName,
                          String_length(PatternName), IdiomPattern) 
              then GiveMessage('Incorrect idiom pattern. ')
              else begin
                LocalData.idiom.pattern := ord(IdiomPattern);
                ShowPattern;
                if (LocalData.idiom.args.nrargs > 1) 
                then MakeKeySensitive(X_le_id_ok_button);
                UpdateScreen;    
              end;
            end;
          end;
        X_le_id_new_meaning_button:
          begin
            LocalData.mkey := 0;
            WND_SetString(X_le_id_mkey, 'New meaning');
          end;
        X_le_id_dutch_meaning_button: 
          begin
            StartRecursion;
            SelectExistingMeaning(dutch, LocalData.mkey);
            EndRecursion;
          end; 
        X_le_id_english_meaning_button: 
          begin
            StartRecursion;
            SelectExistingMeaning(english, LocalData.mkey);
            EndRecursion;
          end; 
        X_le_id_spanish_meaning_button: 
          begin
            StartRecursion;
            SelectExistingMeaning(spanish, LocalData.mkey);
            EndRecursion;
          end; 
        X_le_id_insert_argument_button:
          begin
            if LocalData.idiom.args.nrargs = 1 { only head present }
            then InsertArgument(2)
            else if LocalData.idiom.idskey = 0 then begin
              { select pos, insert arg }
              if not AskInteger('Give number of new argument: ', DummyInteger)
              then SelectedArgument := 0
              else begin
                if (DummyInteger > 0) or
                   (DummyInteger <= LocalData.idiom.args.nrargs)
                then SelectedArgument := DummyInteger+1 { 1st = head }
                else begin
                  GiveMessage('Incorrect number. ');
                  SelectedArgument := 0;
                end;
              end;
              if SelectedArgument <> 0
              then InsertArgument(SelectedArgument);
            end;
          end;
        X_le_id_delete_id_button:
          begin
            if LocalData.Removed
            then begin
              LocalData.Removed := false;
              WND_SetString(X_le_id_deleted, '');
              WND_SetString(X_le_id_delete_id_button, 'Delete Idiom');
            end
            else begin
              LocalData.Removed := true;
              WND_SetString(X_le_id_deleted, 'DELETED');
              WND_SetString(X_le_id_delete_id_button, 'Undelete Idiom');
            end;
          end;
        X_le_id_translate_dutch_button:
          begin
            StartRecursion;
            TranslateMeaning(dutch, LocalData.mkey);
            EndRecursion;
          end;
        X_le_id_translate_english_button:
          begin
            StartRecursion;
            TranslateMeaning(english, LocalData.mkey);
            EndRecursion;
          end;
        X_le_id_translate_spanish_button:
          begin
            StartRecursion;
            TranslateMeaning(spanish, LocalData.mkey);
            EndRecursion;
          end;
        otherwise ;  
      end;
    until ExitLoop;
    RestoreScreenState(OriginalScreenState);
    WND_Unmanage(X_le_id_window);
  end;
end;

procedure InsertIdiom;
begin
  with IddictPartDescr do begin
    if nr = MaxIdioms
    then GiveMessage('Maximum number of idioms reached. ')
    else begin
      with ids[nr+1] do begin
        InitIddictRecord(idiom);
        idiom.headkey := LemmaKey;
        idiom.idskey := 0;
        idiom.args.nrargs := 1;
        idiom.args.argkeys[1] := Lemmakey;
        InitIldictRecord(mkeys[1]);
        InitIldictRecord(oldmkeys[1]);
        temporary := true; 
        modified := false;
        removed  := false;
        MkeyModified[1] := false;
        NrComments := 0;
        CommentsModified := false;
        IdiomActions(nr+1);
      end;
      if not ids[nr+1].temporary
      then begin
        LemmaPartData[iddictpart].exist := true;
        nr := nr+1;
        ShowIdioms;
      end;
    end;
  end;
end;

  procedure SaveChanges;
  { 
    In this procedure all modifications are made definite in the database.
  }
  label
    exit;
  var 
    MdictRec: { [volatile] } MDICTDEF_RecordDef;
    pMdictRec: Address(MDICTDEF_RecordDef);
    BlexRec: { [volatile] } LSDOMAINT_BlexStruct;
    pBlexRec: Address(LSDOMAINT_BlexStruct);
    UpdateStatus : CISAM_StatusType;
    i,j: integer;
    DummyBlex: LISTREE_pStree;
    DummySiddict: LISIDDICT_RecordDef;
    DummyIddict: LIIDDICT_RecordDef;
    DummyIldict: LIILDICT_RecordDef;
    StringKey: STRING_String;


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
    Checks whether this lemma is used as an argument in a semi-idiom.
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
    Checks whether this lemma is used as an argument in an idiom.
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
      if SemiIdiomReferences(LemmaKey)
      then begin
        LemmaRemoved := false;
        StopWait;
        GiveMessage('A semi idiom is still referring to this lemma: lemma not removed. ');
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
          GiveMessage('A context key is still assigned to this lemma: lemma not removed. ');
        end;
      end;
      if not LemmaRemoved
      then begin { stay in lemma, don't save }
        PressedKey := 0;
        goto exit;
      end;
    end;

    if LemmaRemoved
    then begin { remove all (semi)idioms and meanings }
      with SiddictPartDescr do begin
        for i := 1 to nr
        do sids[i].removed := true;
      end;
      with IddictPartDescr do begin
        for i := 1 to nr
        do ids[i].removed := true;
      end;
      with IldictPartDescr do begin
        for i := 1 to nr
        do meanings[i].removed := true;
      end;
      LemmaPartData[siddictpart].modified := true;
      LemmaPartData[iddictpart].modified  := true;
      LemmaPartData[ildictpart].modified  := true;
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
      lsfon := Retype(MdictPartDescr.FON,LSPHONDEF_pPhonInfo);
      MdictRec.FON  := lsfon^;
      MdictRec.where:= MdictpartDescr.where;
      MdictRec.KEY  := MdictpartDescr.KEY;
      pMdictRec := adr(MdictRec);
      if MdictPartDescr.StemModified
      then begin
        LDMDICT_WriteSequential(Retype(pMdictRec,LDMDICT_pMdictStruct));
        { No test on status, because CISAM does not handle the status
          OK_DUP correctly }
        ChangeLog(mdict, add, LemmaKey, 0);
      end;
      if not RefindMdict(OriginalStem, LemmaKey, kind, CC, FON, where)
      then GiveMessage('Cannot refind mdict record. ')
      else begin
        if MdictPartDescr.StemModified
        then begin
          UpdateStatus := LDMDICT_Delete;
          if UpdateStatus = CISAM_NoError
          then ChangeLog(mdict, Delete, MdictRec.key, 0)
          else CisamStatus('Delete Mdict: ');
        end
        else begin
          UpdateStatus := LDMDICT_Update(Retype(pMdictRec,LDMDICT_pMDictStruct));
          if UpdateStatus = CISAM_NoError
          then ChangeLog(mdict, Modify, MdictRec.key, 0)
          else CisamStatus('Update Mdict: ');
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
              if UpdateStatus = CISAM_NoError
              then ChangeLog(siddict, modify, LemmaKey, sid.sidskey)
              else CisamStatus('Update Siddict: ');
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
                GenerateKey(MkeyType, SemiIdiomType, BlexPartDescr.Attr^.cat,
                            StringKey, Mkey.mkey);
              end;
              UpdateStatus := LIIldict_Delete;
              if UpdateStatus = CISAM_NoError
              then ChangeLog(ildict, delete, sid.sidskey, OldMkey.mkey)
              else CisamStatus('Delete Ildict: ');
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
            if GenerateKey(SkeyType, SemiIdiomType, BlexPartDescr.Attr^.cat,
                           StringKey, sid.sidskey) 
            then begin
              if Mkey.mkey = 0
              then
                GenerateKey(MkeyType, SemiIdiomType, BlexPartDescr.Attr^.cat,
                            StringKey, Mkey.mkey);
              LISiddict_WriteSequential(sid);
              ChangeLog(siddict, add, LemmaKey, sid.sidskey);
              InitIldictRecord(DummyIldict);
              DummyIldict.skey := sid.sidskey;
              DummyIldict.mkey := Mkey.mkey;
              LIILDICT_WriteSequential(DummyIldict);
              ChangeLog(ildict, add, sid.sidskey, Mkey.mkey);
              LDGETKEY_Put(BlexPartDescr.Attr, sid.sidskey); 
              BlexRec := MAKET_BlexrecFromStree(LemmaKey,
                           Retype(BlexPartDescr.Attr,LSSTREE_pStree));
              BlexRec.key := sid.sidskey;
              BlexRec.IsBxpr := true;
              pBlexRec := adr(BlexRec);
              LDBLEX_WriteSequential(Retype(pBlexRec,LDBLEX_pBlexStruct));
              LDGETKEY_Put(BlexPartDescr.Attr, LemmaKey); 
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
                if UpdateStatus = CISAM_NoError
                then ChangeLog(iddict, modify, LemmaKey, idiom.idskey)
                else CisamStatus('Update Iddict: ');
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
                  STRING_Append(StringKey,argstems[j]);
                GenerateKey(MkeyType, IdiomType, BlexPartDescr.Attr^.cat,
                            StringKey, mkeys[1].mkey);
              end;
              UpdateStatus := LIIldict_Delete;
              if UpdateStatus = CISAM_NoError
              then ChangeLog(ildict, delete, idiom.idskey, OldMkeys[1].mkey)
              else CisamStatus('Delete Ildict: ');
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
              STRING_Append(StringKey,argstems[j]); 
            if GenerateKey(SkeyType, IdiomType, BlexPartDescr.Attr^.cat,
                           StringKey, idiom.idskey) 
            then begin
              if mkeys[1].mkey = 0
              then GenerateKey(MkeyType, IdiomType, BlexPartDescr.Attr^.cat,
                               StringKey, mkeys[1].mkey);
              LIiddict_WriteSequential(idiom);
              ChangeLog(iddict, add, LemmaKey, idiom.idskey);
              InitIldictRecord(DummyIldict);
              with DummyIldict do begin
                skey := idiom.idskey;
                mkey := mkeys[1].mkey;
              end;
              LIILDICT_WriteSequential(DummyIldict);
              ChangeLog(ildict, add, idiom.idskey, Mkeys[1].mkey);
              LDGETKEY_Put(BlexPartDescr.Attr, idiom.idskey); 
              BlexRec := MAKET_BlexrecFromStree(LemmaKey,
                           Retype(BlexPartDescr.Attr,LSSTREE_pStree));
              BlexRec.key := idiom.idskey;
              BlexRec.IsBxpr := true;
              pBlexRec := adr(BlexRec);
              LDBLEX_WriteSequential(Retype(pBlexRec,LDBLEX_pBlexStruct));
              LDGETKEY_Put(BlexPartDescr.Attr, LemmaKey); 
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
              if m.mkey <> OldM.mkey
              then begin
                CommentsModified := true; { other key }
                if m.mkey = 0
                then begin
                  STRING_Constant(StringKey, MdictPartDescr.stem, LDMDICT_MaxStem);
                  STRING_Trim(StringKey,StringKey);
                  GenerateKey(MkeyType, IdiomType, BlexPartDescr.Attr^.cat,
                              StringKey, m.mkey);
                end;
                UpdateStatus := LIILDICT_Delete; 
                if UpdateStatus = CISAM_NoError
                then ChangeLog(ildict, delete, LemmaKey, Oldm.mkey)
                else CisamStatus('Delete Ildict: ');
                LIILdict_WriteSequential(m);
                changeLog(ildict, add, LemmaKey, m.mkey);
              end else begin
                UpdateStatus := LIIldict_Update(m);
                if UpdateStatus = CISAM_NoError
                then ChangeLog(ildict, modify, LemmaKey, m.mkey)
                else CisamStatus('Update Ildict: ');
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
            STRING_Constant(StringKey, MdictPartDescr.stem, LDMDICT_MaxStem);
            STRING_Trim(StringKey,StringKey);
            if m.mkey = 0
            then GenerateKey(MkeyType, LemmaType, BlexPartDescr.Attr^.cat,
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
                              Retype(BlexPartDescr.Attr,LSSTREE_pStree));
        pBlexRec := adr(BlexRec);
        UpdateStatus := LDBLEX_Update(Retype(pBlexRec,LDBLEX_pBlexStruct));
        if UpdateStatus = CISAM_NoError
        then ChangeLog(blex, modify, LemmaKey, 0)
        else CisamStatus('Update Blex: ');
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
          if UpdateStatus = CISAM_NoError
          then ChangeLog(mdict, Delete, LemmaKey, 0)
          else CisamStatus('Delete Mdict: ');
        end;
      end;
      if LemmaPartData[sdictpart].exist
      then begin
        if not LISDICT_GetGSDict(LemmaKey, SdictBuffer)
        then GiveMessage('Cannot refind sdict record. ')
        else begin
          UpdateStatus := LISDICT_Delete;
          if UpdateStatus = CISAM_NoError
          then ChangeLog(sdict, Delete, SdictBuffer.skey, 0)
          else CisamStatus('Delete Sdict: ');
        end;
      end;
      if LemmaPartData[blexpart].exist
      then begin
        DummyBlex := LDBLEX_ReadDirect(LemmaKey);
        if DummyBlex = nil
        then GiveMessage('Cannot refind blex record. ')
        else begin
          UpdateStatus := LDBLEX_Delete;
          if UpdateStatus = CISAM_NoError
          then ChangeLog(blex, Delete, LemmaKey, 0)
          else CisamStatus('Delete Blex: ');
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
       if (EditorMode = ShowTranslationMode) and
          (mkey.mkey = TranslationMkey)
       then with ShowItemData do begin
         Lemmapart := SiddictPart;
         Number := nr;
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
       if (EditorMode = ShowTranslationMode) and
          (mkeys[1].mkey = TranslationMkey)
       then with ShowItemData do begin
         Lemmapart := IddictPart;
         Number := nr;
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
       if (EditorMode = ShowTranslationMode) and
          (m.mkey = TranslationMkey)
       then with ShowItemData do begin
         Lemmapart := IldictPart;
         Number := nr;
       end;
    end; { with Meanings[nr] }
  end;
end;

BEGIN
   MEM_MarkDefault(StackPtr);
   EditLemmaInit;

   { Read all lemma information from databases}

   { If there is aan Sdict entry for this key, a context key is specified. 
     In that case the stem will be composed from the stems of the fonetic key 
     and the context key.
     If there is no Sdict entry, a normal Mdict entry is expected }
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
       STR_Trim(DummyString, r,
                OriginalStem, STRING_Length(OriginalStem));
       MdictPartDescr.StemLength := r;
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
   BlexPartDescr.Attr := LDBLEX_ReadDirect( LemmaKey);
   BlexPartDescr.Nr := 0;
   if BlexPartDescr.Attr <> nil 
   then LemmaPartData[blexpart].exist := true
   else begin
     GiveMessage('Blex part not found. ');
     SetEditingAllowed(false);
   end;

   { Read context part }
   if ( CheckLemmaCategory(BverbCat) or CheckLemmaCategory(PrepCat) ) and not
      ( (StemComposed = ViaSdict) and { lemma has already context key }
        not LemmaPartData[mdictpart].exist { e.g. kondig_aan: allowed to add context keys }
      ) 
   then with ContextPartDescr do begin
     LemmaPartData[ContextPart].exist := true;
     nr := 0;
     if LISDICT_GetASDict(LemmaKey, SdictBuffer)
     then begin
       repeat
         if SdictBuffer.skey <> LemmaKey { e.g. 'kondig_aan' }
         then begin
           nr := nr+1;
           ContextKeys[nr].key := SdictBuffer.skey;
           ContextKeys[nr].ctxt := SdictBuffer.ctxt[1];
(*
           WND_WriteString(X_le_comment_text, ContextKeys[nr].stem,
                           STRING_Length(ContextKeys[nr].stem), true);
           WND_WriteLine(X_le_comment_text, true);
*)
         end; 
       until (not LISDICT_GetNextASdict(LemmaKey, SdictBuffer)) or
             (Nr = MaxContextSpecs);
       for i := 1 to nr
       do begin
           if not GetStem(ContextKeys[i].ctxt, ContextKeys[i].stem) 
           then begin
             GiveMessage('Stem of context key not found. ');
             ContextKeys[i].stem := '?????';
           end;
       end;
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

(*
   case EditorMode of
     ViewLemmaMode      : CurrentAction := 'View lemma';
     EditLemmaMode      : CurrentAction := 'Edit lemma';
     ShowTranslationMode: CurrentAction := 'Show translation';
     SelectMkeyMode     : CurrentAction := 'Select meaning';
     SelectSkeyMode     : CurrentAction := 'Select lemma';
   end;
*)
   ShowLemma;

   if EditorMode = ShowTranslationMode
   then with ShowItemData do begin
     case LemmaPart of
       SiddictPart: 
         begin
           SemiIdiomActions(Number);
         end;
       IddictPart : 
         begin
           IdiomActions(Number);
         end;
       Ildictpart : 
         begin
           MeaningActions(Number);
{ ttt }
         end;
       otherwise  ; 
     end;
   end;

   repeat
     WND_GetKey(PressedKey); 
     case PressedKey of
       X_le_modify_lemma_button:
         begin
           if EditingAllowed
           then SetEditingAllowed(false)
           else begin
             if LockedForOthers and not ViewMode 
             then SetEditingAllowed(true)
             else begin
               if AskBoolean(
 'This lemma is currently locked by someone else. Proceed anyway?')
               then SetEditingAllowed(true);
               (*
               GiveMessage('This lemma cannot be modified now! ');
               *)
             end;
           end;
         end;
       X_le_insert_particle_button  : InsertParticle;
       X_le_insert_meaning_button   : InsertMeaning;
       X_le_insert_semi_idiom_button: InsertSemiIdiom;
       X_le_insert_idiom_button     : InsertIdiom;
       X_le_copy_lemma_button       : SplitLemma;
       X_le_delete_lemma_button     : DeleteLemma;
       X_le_show_semi_idioms_button : ShowRelatedSemiIdioms;
       X_le_show_idioms_button      : ShowRelatedIdioms;
       X_le_part_list: 
         begin
           WND_GetSelectedPos(X_le_part_list, 
                              SelectedListItems, NrSelectedListItems);
           if NrSelectedListItems = 1
           then ParticleActions(SelectedListItems[1]);
         end;
       X_le_sid_list: 
         begin
           WND_GetSelectedPos(X_le_sid_list, 
                              SelectedListItems, NrSelectedListItems);
           if NrSelectedListItems = 1
           then SemiIdiomActions(SelectedListItems[1]);
           ShowSemiIdioms; { prefix '-' before deleted idioms }
         end;
       X_le_id_list: 
         begin
           WND_GetSelectedPos(X_le_id_list, 
                              SelectedListItems, NrSelectedListItems);
           if NrSelectedListItems = 1
           then IdiomActions(SelectedListItems[1]);
           ShowIdioms; { prefix '-' before deleted idioms }
         end;
       X_le_mean_list: 
         begin
           WND_GetSelectedPos(X_le_mean_list, 
                              SelectedListItems, NrSelectedListItems);
           if NrSelectedListItems = 1
           then MeaningActions(SelectedListItems[1]);
           ShowMeanings; { prefix '-' before deleted meanings }
         end;
       X_le_select_button:
         begin { current lemma selected }
           SelectedKey := LemmaKey;
           KeySelected := true;
         end;
       otherwise ;
     end;
     if ExitLemma and EditingAllowed
     then begin
       if LemmaRemoved
       then begin
         if AskBoolean('Are you sure? ')
         then SaveChanges
         else begin
           PressedKey := 0; { don't leave lemma }
           LemmaRemoved := false;
         end;
       end
       else begin
         ReadFromMainScreen;
         if  SomethingModified
         then begin
           if AskBoolean('Save modifications (y/n)? ')
           then begin
             status := true;
             with LemmaPartData[blexpart] 
             do begin
               if modified 
               then begin { check for syntax errors and constraint violations}
                 status := FromScreen(t);
                 IF status THEN begin
                   status := LDCONVREC_GetNode(t, BlexPartDescr.Attr);
                   if not status 
                   then begin
                     GiveMessage('Syntax error(s) in attributes. ');
                   end
                   else begin
                     BlexRec := MAKET_BlexrecFromStree(LemmaKey,
                                    Retype(BlexPartDescr.Attr,LSSTREE_pStree));
                     BlexRec.IsBxpr := true;
                     { functions which checks for constraint violations, writes
                       its output to a file (also used by compiler). }
  (*
                     FILES_Open(constraintsfile, 'constraints',11, 3);
                     status := LSCONSTRAINTS_Blex(BlexRec, constraintsfile, 0);
                     FILES_Close(constraintsfile);
  *)
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
             end;
             IF status THEN 
               SaveChanges
             ELSE PressedKey := 0; { Do not leave lemma }
           end;
         end;
       end;
     END;
   until ExitLemma;
   NextAction := PressedKey;

EXIT:
  if LockedForOthers
  then LILOCK_Delete(LemmaKey); 

  EditLemmaEnd;
  MEM_ReleaseDefault(StackPtr);

END; { EditLemma }

procedure EditSelectedLemmas; (* (NumberSelectedKeys: integer;
                              SelectedKeys: array[lb..ub:integer] of integer;
                              SelectionStem: STRING_String;
                              EditorMode: EditorModeEnum;
                              var KeySelected: boolean;
                              var SelectedKey: integer); *)
{
  This procedure enables the user to browse through a set of selected lemmas.
}
var
  i: integer;
  ExitLoop : boolean; 
begin
  i := 1;
  KeySelected := false;
  ExitLoop := false;
  while not ExitLoop 
  do begin
    NextAction := 0;
    EditLemma(SelectedKeys[i], SelectionStem, EditorMode, 
              KeySelected, SelectedKey, i, NumberSelectedKeys);
    case NextAction of
      X_le_previous_button: 
          if i > 1 then i := i-1;
      X_le_next_button    : 
          if i < NumberSelectedKeys then i := i+1;
      X_le_return_button  : 
        begin 
          ExitLoop := true; 
          NextAction := 0; 
        end;
      X_le_jump_button    : 
        AskNextLemmaNumber(NumberSelectedKeys, i); 
      otherwise    ExitLoop := true;
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
  DummyKey,
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

function SelectLemmaWithStemAndCat;
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
  SelectLemmaWithStemAndCat := LemmaSelected;
end;

function SelectLemmaWithStem;
{
  This function tries to select lemmas with a specific stem.
}
CONST
  MaxFoundKeys = 50;

var 
  LemmaSelected: boolean;
  kind: INTERFACE1_keytype;
  CC  : LIMORFDEF_ContextConds;
  FON : LIMORFDEF_pPhonInfo;
  where: LDMDICT_WhereType;
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
    NumberFoundKeys := 1;
    while (NumberFoundKeys < MaxFoundKeys) and 
          LDMDICT_GetNextAmDict(stem, kind, CC, FON, where, 
                                FoundKeys[NumberFoundKeys+1]) do
      NumberFoundKeys := NumberFoundKeys + 1;
  end;
  If NumberFoundKeys = 0
  then GiveMessage('No lemma found. ')
  else EditSelectedLemmas(NumberFoundKeys, FoundKeys, stem,
                          EditorMode, LemmaSelected, SelectedKey);
  SelectLemmaWithStem := LemmaSelected;
end;

function GetStemAndCategory(StemRequired, CategoryRequired: boolean;
                            var Stem: STRING_String;
                            var Category: LIDOMAINT_SyntCat): boolean;
{
  Asks for a stem and a category. 
  Stem can remain empty and category will be LIBUG if not entered.
}
var 
  ExitLoop: boolean;
  Cat: LIDOMAINT_SyntCat;
  Keys: array[1..3] of WND_Xid;
  key: integer;
  StemString: string(LDMDICT_MaxStem);
  CategoryString: string(25);
begin
  GetStemAndCategory := true; { avoid warning }
  WND_Manage(X_le_select_window, X_undefined);
  Keys[1] := X_le_select_ok_button;
  Keys[2] := X_le_select_cancel_button;
  Keys[3] := X_le_select_help_button;
  MakeKeysSensitive(Keys);
  WND_SetString(X_le_select_stem, '');
  WND_SetString(X_le_select_category, '');
  UpdateScreen;
  Stem := '';
  Category := LIBUG;
  repeat
    ExitLoop := true;
    WND_GetKey(key);
    case key of
      X_le_select_cancel_button:
        begin
          GetStemAndCategory := false;
        end;
      X_le_select_help_button: ;
      X_le_select_ok_button:
        begin
          GetStemAndCategory := true;
          WND_GetString(X_le_select_stem, StemString);
          if StemString = ''
          then begin
            if StemRequired 
            then begin
              GiveMessage('Stem required! ');
              ExitLoop := false;
            end;
          end
          else STRING_Constant(stem, StemString, LDMDICT_MaxStem);

          WND_GetString(X_le_select_category, CategoryString);
          if CategoryString = ''
          then begin
            if CategoryRequired
            then begin
              GiveMessage('Category required! ');
              ExitLoop := false;
            end;
          end
          else begin
            if not LDSTRTOTYPE_Cat(CategoryString, 25, Cat)
            then begin
              GiveMessage('Incorrect category. ');
              ExitLoop := false;
            end
            else Category := Cat;
          end;
        end;
    end;
  until ExitLoop;
  MakeKeysInsensitive(Keys);
  UpdateScreen;
  WND_Unmanage(X_le_select_window);
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
  DummyKey: integer;
  FoundKeys: array[1..MaxFoundKeys] of integer;
  NumberFoundKeys: integer;
  stem: STRING_String;
  cat: LIDOMAINT_SyntCat;
  CatSpecified: boolean;
begin
  NumberFoundKeys := 0;
  if not GetStemAndCategory(false, false, stem, cat)
  then goto exit;
  CatSpecified := (cat <> LIBUG);
  if not AskInteger('Enter maximum number of entries (<=50): ', MaxKeys)
  then goto exit;
  if MaxKeys > 50 
  then MaxKeys := 50;
  if MaxKeys < 1
  then MaxKeys := 1;
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

function SelectLemma; { (EditorMode: EditorModeEnum;
                         var SelectedKey: integer): boolean;  }
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
  stem: STRING_string;
  FoundKeys: array[1..MaxFoundKeys] of integer;
  NumberFoundKeys: integer;
  CatSpecified: boolean;
  Cat: LIDOMAINT_SyntCat;
begin
  NumberFoundKeys := 0;
  if GetStemAndCategory(true, false, Stem, Cat)
  then begin
    CatSpecified := (Cat <> LIBUG);
    LemmaSelected := false;
    SelectedKey := 0;
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
    then GiveMessage('No lemma found. ');
  end;
  if NumberFoundKeys <> 0
  then EditSelectedLemmas(NumberFoundKeys, FoundKeys, stem, 
                          EditorMode, LemmaSelected, SelectedKey); 
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
  stem: STRING_string;
  FoundKeys: array[1..MaxFoundKeys] of integer;
  NumberFoundKeys: integer;

begin
  LemmaSelected := false;
  SelectedKey := 0;
  AskString('Enter stem: ', stem);
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
    if not LemmaSelected then AskString('Enter stem: ', stem); 
  end;
  SelectLemmaWithCat := LemmaSelected;
end;

procedure AddLemma;
label
  exit;
var
  BareStem,
  NewStem: STRING_String;
  ContextStem: STRING_String;
  StemText: LDMDICT_StemType;
  i, StemLength: integer;
  PrepCat,
  BverbCat,
  PartCat,
  NewCat : LIDOMAINT_Syntcat;
  NewMdictRec: { [volatile] } MDICTDEF_RecordDef;
  pNewMdictRec: Address(MDICTDEF_RecordDef);
  NewSdictRec: LISDICT_RecordDef;
  BlexRec: LSDOMAINT_BlexStruct;
  NewBlexRec: { [volatile] } LSDOMAINT_BlexStruct;
  pNewBlexRec: Address(LSDOMAINT_BlexStruct);
  CopyBlexTree: LISTREE_pStree;
  lsstree: LSSTREE_pStree;
  NewKey: integer;
  CopyKey: integer;
  ContextKey: integer;
  DummyKey  : integer;
  lsfon: LSPHONDEF_pPhonInfo;
  IsFixedIdiom,
  CopyMeanings,
  DummyBoolean,
  ExitLoop: boolean;
  BlexCopied, 
  ContextKeySelected: boolean;
  r: STRING_Range;
  s: string(LDMDICT_MaxStem);

begin
  if not GetStemAndCategory(true, true, NewStem, NewCat)
  then goto exit;
  STRING_Trim(NewStem, NewStem);
  { stem cannot include spaces (fixed idioms can not yet be handled) }
  IsFixedIdiom := (STRING_FindFirstSubString(NewStem, ' ', 1) <> 0);
  BareStem := NewStem;

  ContextKeySelected := false;
  If not IsFixedIdiom
  then begin
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
          AskString('Enter stem of particle: ', ContextStem); 
          if SelectLemmaWithStemAndCat(SelectSkeyMode, ContextStem, PartCat, ContextKey) 
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
                            Retype(CopyBlexTree,LSSTREE_pStree));
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
    lsstree := MAKET_StreeFromBlexrec(Retype(NewCat,LSDOMAINT_Syntcat),BlexRec);
    LDGETKEY_Put( Retype(lsstree,LISTREE_pStree), NewKey);
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
  STRING_ExtractChars(s, r, BareStem, 1, STRING_Length(BareStem));
  StemText := s;
  StemLength := r;
  writeln('BareStem: ', BareStem);
  writeln('NewStem : ', NewStem);
  writeln('Length  : ', StemLength);
  writeln('StemText before: ', StemText);
  for i := StemLength+1 to LDMDICT_MaxStem do StemText[i] := ' ';
  writeln('StemText after: ', StemText);
  with NewMdictRec do begin
    stem := StemText;
    kind := BasType;
    CC   := LICC0;
    lsfon := retype(adr(FON), LSPHONDEF_pPhonInfo);
    LSLEXED_DefaultFonInfo(lsfon, newstem);
    where := BothAnGen;
    key := NewKey;
  end;
  pNewMdictRec := adr(NewMdictRec);
  LDMDICT_Release;
  if not LDMDICT_WriteSequential(Retype(pNewMdictRec,LDMDICT_pMdictStruct))
  then begin
{    GiveMessage('Add Mdict failure. ');
    goto exit; 
    !! This message is disabled, because of a bug in LDMDICT. 
}
  end;
  NewBlexRec := BlexRec;
  pNewBlexRec := adr(NewBlexRec);
  LDBLEX_WriteSequential(Retype(pNewBlexRec,LDBLEX_pBlexStruct)); 

  if IsFixedIdiom
  then AddFixedIdiom(NewStem);

  EditLemma(NewKey,'',EditLemmaMode,DummyBoolean,DummyKey,1,1);

exit:
end;

procedure MainMenu;
var 
  key: integer;
  skey: integer;
  ExitLoop: boolean;
  StackPtr: MEM_StackPtr;
  ScreenState: ScreenStateArray;
begin
  ExitLoop := false;
  MakeKeysSensitive(MainFunctionKeys);
  UpdateScreen;
  StoreScreenState(ScreenState);
  while not ExitLoop do begin
    ClearScreen;
    RestoreScreenState(ScreenState); 
    if NextAction = 0 
    then WND_GetKey(key)
    else key := NextAction;
    NextAction := 0;
    MEM_MarkDefault(StackPtr);
    case key of
      X_le_exit_button:
        begin
          LexedMessage.Action := ExitLexed;
          ExitLoop := true;
        end;
      X_le_dutch_button:
        begin
          LexedMessage.Action := EditLemmas;
          LexedMessage.TargetLanguage := Dutch;
          ExitLoop := true;
        end;
      X_le_english_button:
        begin
          LexedMessage.Action := EditLemmas;
          LexedMessage.TargetLanguage := English;
          ExitLoop := true;
        end;
      X_le_spanish_button:
        begin
          LexedMessage.Action := EditLemmas;
          LexedMessage.TargetLanguage := Spanish;
          ExitLoop := true;
        end;
      X_le_find_lemma_button:
        begin
          SelectLemma(EditLemmaMode, skey);
        end;
      X_le_insert_lemma_button:
        begin
          AddLemma;
        end;
      X_le_sequential_button:
        begin
          SelectLemmasSequential;
        end;
      otherwise ;
    end;
    MEM_ReleaseDefault(StackPtr);
  end;
end;

begin
  LexedInit;
  if MultiLanguage then
    while lexedmessage.action <> exitlexed do begin
      MEM_MarkDefault(StackPtr);
      WND_SetString(X_le_language, CurrentLanguageString);
      case lexedmessage.action of
        editlemmas:
          begin
            OriginalLanguage := true; { current language selected from main menu }
            MainMenu;
          end;
        showtranslation:
          begin
            OriginalLanguage := false; 
            ShowTranslations(lexedmessage.mkey,0);
            lexedmessage.action := editlemmas;
          end;
        searchtranslation:
          begin
            OriginalLanguage := false; 
            if SearchTranslations(lexedmessage.mkey)
            then lexedmessage.TranslationFound := true
            else lexedmessage.TranslationFound := false;
            lexedmessage.action := editlemmas;
          end;
        selectmkey: 
          begin
            OriginalLanguage := false; 
            SelectLemma(SelectMkeyMode, Lexedmessage.mkey);
            LexedMessage.action := editlemmas;
          end;
        exitlexed : ;
      end;
      MEM_ReleaseDefault(StackPtr);
      MB_Put(MbxToControl, lexedmessage);
      MB_Take(MbxFromControl, lexedmessage);
    end
  else MainMenu;
  LexedEnd;
end.

