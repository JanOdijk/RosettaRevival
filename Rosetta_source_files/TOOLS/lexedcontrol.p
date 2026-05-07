(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : LEXEDCONTROL
 *  Creation date   : 14 sept 1990
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
pragma C_Include('mb.pf');
pragma C_Include('globdef.pf');
pragma C_Include('log.pf');
pragma C_include('logname.pf');
pragma C_Include('string.pf');
pragma C_Include('pc.pf');
pragma C_include('sockipc.pf');
pragma C_Include('windows.pf');
pragma C_include('wnd.pf');
pragma C_Include('lexedaux.pf');
pragma C_include('arg.pf');
pragma C_include('converts.pf');

PROGRAM LEXEDCONTROL(Lognames);
WITH MB,GLOBDEF,STRNG,LOG,LOGNAME,PC,WND,WINDOWS,LEXEDAUX,SOCKIPC;

var
  LogNames         : Text;
   status           : GLOBDEF_status;
   mbxxw,
  MbxToDutch,
  MbxToEnglish,
  MbxToSpanish, 
  MbxFromDutch,
  MbxFromEnglish,
  MbxFromSpanish: MB_mbxid;
  xwmessage,
  LexedMessage  : MB_communicationblock;
   port         : string(10);
  stop          : boolean;
  key           : integer;
  keys          : array[1..4] of WND_Xid;
   args         : Arg.Args_type;
   forget       : Globdef_Status;
  SourceLanguage: MB_LanguageType;

  procedure SendMessage(TargetLanguage: MB_LanguageType);
  begin
    case TargetLanguage of 
      Dutch  : MB_Put(MbxToDutch,   lexedmessage);
      English: MB_Put(MbxToEnglish, lexedmessage);
      Spanish: MB_Put(MbxToSpanish, lexedmessage);
    end;
  end;

  procedure ReceiveMessage(TargetLanguage: MB_LanguageType);
  begin
    case TargetLanguage of 
      Dutch  : MB_Take(MbxFromDutch,   lexedmessage);
      English: MB_Take(MbxFromEnglish, lexedmessage);
      Spanish: MB_Take(MbxFromSpanish, lexedmessage);
    end;
  end;

  procedure ProcessMessages(SourceLanguage: MB_LanguageType);
  var exitloop: boolean;
  begin
    exitloop := false;
    repeat
      case lexedmessage.action of
        EditLemmas: exitloop := true;
        ShowTranslation: 
          begin
            SendMessage(LexedMessage.TargetLanguage);
            ReceiveMessage(LexedMessage.TargetLanguage);
            LexedMessage.action := EditLemmas;
            SendMessage(SourceLanguage);
          end;
        SearchTranslation: 
          begin
            SendMessage(LexedMessage.TargetLanguage);
            ReceiveMessage(LexedMessage.TargetLanguage);
            LexedMessage.action := EditLemmas;
            SendMessage(SourceLanguage);
          end;
        SelectMkey: 
          begin
            SendMessage(LexedMessage.TargetLanguage);
            ReceiveMessage(LexedMessage.TargetLanguage);
            LexedMessage.action := EditLemmas;
            SendMessage(SourceLanguage);
          end;
        ExitLexed: ;
      end;
    until exitloop;
    LexedMessage.action := EditLemmas;
  end;

BEGIN
   reset(Lognames);
   LogName_Init(LogNames);
   args := Arg.Args ();
  LOG_Open('loglexedcontrol', 15, GLOBDEF_Yes);
  WND_Initialize;
   MB_init(Loopholes.Sizeof(MB_communicationblock), GLOBDEF_yes);
   conversions.RtoS (SOCKIPC_get_port(1), 10, 0, port);

  status := PC_create ('Xlex', Logname_Tr ('Xlex'), port, '');
  if status = notsuccessful
  then writeln('Process creation failure. ');

  forget := MB_open('Xw', takeaccess, mbxxw);
  forget := MB_take(mbxxw, xwmessage);
  SOCKIPC_set_port (xwmessage.wndport, 0);
  LexedMessage.WndPort := xwmessage.wndport;

  status := PC_create ('dutchlexed', Logname_Tr ('lexeddutch'), args, port);
  if status = notsuccessful
  then writeln('Process creation failure. ')
  else begin
    forget := MB_Open('DutchToControl',takeaccess,MbxFromDutch);
    forget := MB_Open('ControlToDutch',putaccess,MbxToDutch);
    forget := MB_Put(MbxToDutch, LexedMessage);
    forget := MB_Take(MbxFromDutch, LexedMessage);
  end;

  status := PC_create('englishlexed',Logname_Tr('lexedenglish'),args,port);
  if status = notsuccessful
  then writeln('Process creation failure. ')
  else begin
    forget := MB_Open('EnglishToControl',takeaccess,MbxFromEnglish);
    forget := MB_Open('ControlToEnglish',putaccess,MbxToEnglish);
    forget := MB_Put(MbxToEnglish, LexedMessage);
    forget := MB_Take(MbxFromEnglish, LexedMessage);
  end;

  status := PC_create('spanishlexed',Logname_Tr('lexedspanish'),args,port);
  if status = notsuccessful
  then writeln('Process creation failure. ')
  else begin
    forget := MB_Open('SpanishToControl',takeaccess,MbxFromSpanish);
    forget := MB_Open('ControlToSpanish',putaccess,MbxToSpanish);
    forget := MB_Put(MbxToSpanish, LexedMessage);
    forget := MB_Take(MbxFromSpanish, LexedMessage);
  end;


(*
  InitScreenState;

  keys[1] := LEXEDAUX_ExitKey;
  keys[2] := LEXEDAUX_DutchKey;
  keys[3] := LEXEDAUX_EnglishKey;
  keys[4] := LEXEDAUX_SpanishKey;
  MakeKeysSensitive(keys);
  UpdateScreen;
  WND_GetKey(key);

  MakeKeysInsensitive(keys);
  UpdateScreen;

  case key of
    LEXEDAUX_DutchKey: 
       begin
         forget := MB_Put(MbxToDutch, lexedmessage);
         forget := MB_take(MbxFromDutch, lexedmessage);
         SourceLanguage := Dutch;
       end;
    LEXEDAUX_EnglishKey: 
       begin
         forget := MB_Put(MbxToEnglish, lexedmessage);
         forget := MB_take(MbxFromEnglish, lexedmessage);
         SourceLanguage := English;
       end;
    LEXEDAUX_SpanishKey: 
       begin
         forget := MB_Put(MbxToSpanish, lexedmessage);
         forget := MB_take(MbxFromSpanish, lexedmessage);
         SourceLanguage := Spanish;
       end;
    LEXEDAUX_ExitKey: 
       begin
         stop := true;
       end;
  end;
*)

  lexedmessage.action := editlemmas;


  forget := MB_Put(MbxToDutch, lexedmessage);
  forget := MB_take(MbxFromDutch, lexedmessage);
  SourceLanguage := Dutch;
(*
  forget := MB_Put(MbxToEnglish, lexedmessage);
  forget := MB_take(MbxFromEnglish, lexedmessage);
  SourceLanguage := English;
*)
  stop := false;
  while not stop do
  begin
(*
    lexedmessage.action := ShowTranslation;

    lexedmessage.mkey := 1;
*)    
    case lexedmessage.action of
      EditLemmas: 
        begin
          SourceLanguage := LexedMessage.TargetLanguage;
        end;
      ShowTranslation: 
        begin
          SendMessage(LexedMessage.TargetLanguage);
          ReceiveMessage(LexedMessage.TargetLanguage);
        end;
      SearchTranslation: 
        begin
          SendMessage(LexedMessage.TargetLanguage);
          ReceiveMessage(LexedMessage.TargetLanguage);
        end;
      SelectMkey: 
        begin
          SendMessage(LexedMessage.TargetLanguage);
          ReceiveMessage(LexedMessage.TargetLanguage);
        end;
      ExitLexed: 
        begin
          stop := true;
        end;
    end;
    if not stop
    then begin
      LexedMessage.action := EditLemmas;
      SendMessage(SourceLanguage);
      ReceiveMessage(SourceLanguage);
    end;
  end;
  lexedmessage.action := exitlexed;
  forget := MB_Put(MbxToDutch, lexedmessage);
  forget := MB_take(MbxFromDutch,LexedMessage); 

  forget := MB_Put(MbxToEnglish, lexedmessage);
  forget := MB_take(MbxFromEnglish,LexedMessage);

  forget := MB_Put(MbxToSpanish, lexedmessage);
  forget := MB_take(MbxFromSpanish,LexedMessage);

  MB_Close(MbxToDutch, GLOBDEF_Yes);
  MB_Close(MbxFromDutch, GLOBDEF_Yes);

  MB_Close(MbxToEnglish, GLOBDEF_Yes);
  MB_Close(MbxFromEnglish, GLOBDEF_Yes);

  MB_Close(MbxToSpanish, GLOBDEF_Yes); 
  MB_Close(MbxFromSpanish, GLOBDEF_Yes);

  LOG_Close;
  WND_stop;
  PC_Terminate;
END. { LEXEDCONTROL }
