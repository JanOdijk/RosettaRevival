(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : ERROR
 *  Creation date   : 
 *  Author          : J. Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : cf. ERROR.ENV
 *
 *EMP:::===================================================================*)

Export(ERROR);
pragma C_include('globdef.pf');
pragma C_include('wnd.pf');
pragma C_include('string.pf');
pragma C_include('error.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM ERROR;
WITH GLOBDEF, WND, STRNG;

PROCEDURE ERROR_Write(msg: ERROR_Msg);
VAR
   keys      : array [1..1] of WND_Xid;
   key       : WND_Xid;
   sid       : WND_Sid;
BEGIN
   CASE msg OF
   ERROR_ASegm             : sid := S_ERROR_ASegm;
   ERROR_ALextree          : sid := S_ERROR_ALextree;
   ERROR_InCorrectRuleName : sid := S_ERROR_InCorrectRuleName;
   ERROR_UnknownStreeSpec  : sid := S_ERROR_UnknownStreeSpec;
   ERROR_InCorrectNode     : sid := S_ERROR_InCorrectNode;
   ERROR_NoTreesFound      : sid := S_ERROR_NoTreesFound;
   ERROR_NoLastRule        : sid := S_ERROR_NoLastRule;
   ERROR_NoNodeSelected    : sid := S_ERROR_NoNodeSelected;
   ERROR_NoAttrSelected    : sid := S_ERROR_NoAttrSelected;
   ERROR_NoExtraInfo       : sid := S_ERROR_NoExtraInfo;
   ERROR_NoAttributes      : sid := S_ERROR_NoAttributes;
   ERROR_MaxNrScreens      : sid := S_ERROR_MaxNrScreens;
   END;

   WND_SetStringId ( X_err_window, sid );
   WND_Manage ( X_err_window, X_undefined );
   keys[1] := X_err_ok_button;
   WND_SetKeys (X_err_window, keys);
   WND_GetKey (key);
   WND_Unmanage ( X_err_window );

END {ERROR_Write};

FUNCTION ERROR_QuestionWrite (msg: QUESTION_Msg): Boolean;
VAR
   keys      : array [1..2] of WND_Xid;
   key       : WND_Xid;
   sid       : WND_Sid;
BEGIN
   CASE msg OF
   QUESTION_Exit           : sid := S_QUESTION_Exit;
   QUESTION_ZeroMeanings   : sid := S_QUESTION_ZeroMeanings;
   END;

   WND_SetStringId ( X_question_window, sid );
   WND_Manage ( X_question_window, X_undefined );
   keys[1] := X_question_ok_button;
   keys[2] := X_question_cancel_button;
   WND_SetKeys (X_question_window, keys);
   WND_GetKey (key);
   CASE key OF
   X_question_ok_button     : ERROR_QuestionWrite := TRUE;
   X_question_cancel_button : ERROR_QuestionWrite := FALSE;
   X_undefined              :
       BEGIN
           IF msg = QUESTION_ZeroMeanings THEN
               ERROR_QuestionWrite := TRUE
           ELSE
               ERROR_QuestionWrite := FALSE;
       END;
   END;
   WND_Unmanage ( X_question_window );

END {ERROR_QuestionWrite};
