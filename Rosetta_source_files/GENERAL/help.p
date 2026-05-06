(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Help
 *  Creation date   :  16-MAR-1990
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include('strings.pf');
Export(HELP);
pragma C_include('windows.pf');
pragma C_include('globdef.pf');
pragma C_include('help.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM Help;
WITH GLOBDEF, WINDOWS;


CONST
   WXsize = 80;
   WYSize = 24;
   WXpos  = 1;
   WYPos  = 1;

VAR
   HelpTable : ARRAY [Help_Windows] OF Windows_Window;
   wind      : WINDOWS_Window;


PROCEDURE wln(CONST s: STRING);
BEGIN
   WINDOWS_WriteStr(wind, s, WINDOWS_MaxIO, 0, TRUE);
   WINDOWS_WriteLine(wind, TRUE);
END {wln};


PROCEDURE InitHelpInput;
BEGIN
   WINDOWS_OpenWindow(wind, ' ', 0, WYSize, WXSize);
   HelpTable[Help_Input] := wind;
   wln('  ');
   wln('  ');
   wln('In this window you can enter the text that has to be translated.');
   wln('Please use the standard VMS edit keys.');
   wln('  ');
   wln('Press the <<DO>> key to start the translation');
END;

PROCEDURE InitHelpInteractionmain;
BEGIN
   WINDOWS_OpenWindow(wind, ' ', 0, WYSize, WXSize);
   HelpTable[Help_InteractionMain] := wind;
   wln('  ');
   wln('  ');
   wln('In the INPUT WINDOW you see that some of the words in the text');
   wln('have been marked. Each of these words has more than one meaning.');
   wln('The word that is highlighted is the current word. Other words');
   wln('with more than one meaning are blinking.');
   wln('  ');
   wln('You can make another (blinking) word current by pushing the <<RIGHTARROW>>');
   wln('key. Press the <<DO>> key if you want to look at the meaning descriptions');
   wln('of the current word. If you do so you can choose between the presented');
   wln('meanings.');
   wln('  ');
   wln('If you press the <<RETURN>> key, the system continues and generates');
   wln('translations for the meanings that have been selected by you. In case');
   wln('you did not press the <<DO>> key before, the system will generate all');
   wln('translations.');
END;


PROCEDURE InitHelpInteraction;
BEGIN
   WINDOWS_OpenWindow(wind, ' ', 0, WYSize, WXSize);
   HelpTable[Help_Interaction] := wind;
   wln('  ');
   wln('  ');
   wln('In this window some meaning descriptions of the highlighted word');
   wln('are presented. If the highlighted word can be derived from different');
   wln('stem forms, you can find the meanings associated with other stems');
   wln('by pressing the <<Next Screen>> key');
   wln('  ');
   wln('You can select the meaning under the cursor by pressing the <<DO>> key. ');
   wln('Press <<BACKSPACE>> to undo a choice.  Use the <<UP ARROW>> and ');
   wln('<<DOWN ARROW>> keys to move the cursor.');
   wln(' ');
   wln('Press <<RETURN>> to return to the previous menu.');
END;


PROCEDURE InitHelpMainMenu;
BEGIN
   WINDOWS_OpenWindow(wind, ' ', 0, WYSize, WXSize);
   HelpTable[Help_MainMenu] := wind;
   wln('  ');
   wln('  ');
   wln(' NEXT-STRUCT  : Generate translations belonging to the next ');
   wln('                structurally different interlingua expression.');
   wln(' NEXT-LEX     : Generate translations belonging to the next');
   wln('                interlingua expression which only differs with');
   wln('                respect to the basic meanings');
   wln(' NEXT         : Generate translations belonging to the next ');
   wln('                syntactic ambiguity.');
   wln('  ');
   wln(' STOP         : System is stopped. ');
   wln(' NEW          : The user may enter new text in th INPUT WINDOW. ');
   wln(' START        : The system is started. ');
   wln(' OPTIONS      : (Toggle switch) If pressed the user is prompted');
   wln('                for more information when pressing the NEW key or');
   wln('                the START key. In the OPTIONS mode the user can');
   wln('                debug the system, set the interaction modes, etc.');
END;


PROCEDURE Help_Init;
BEGIN
   InitHelpInput;
   InitHelpInteractionMain;
   InitHelpInteraction;
   InitHelpMainMenu;
{
   InitHelpControl;
   InitHelpEdit;
   InitHelpOptions;
   InitHelpOutPut;
}
END {Help_Init};



PROCEDURE Help_Connect(hw: Help_Windows;
                                VAR w : Windows_Window);

BEGIN
   IF hw IN [Help_Input,Help_Interaction,Help_InteractionMain,
             Help_MainMenu] THEN BEGIN
      WINDOWS_NewHelpWindow(w, HelpTable[hw], GlobDef_GetDevice, 1, 1)
   END;
END {Help_Connect};
   
