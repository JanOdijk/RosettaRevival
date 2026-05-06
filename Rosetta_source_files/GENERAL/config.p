(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Config
 *  Creation date   :  18-JAN-1990
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(CONFIG);
pragma C_include('files.pf');
pragma C_include('log.pf');
pragma C_include('globdef.pf');
pragma C_include('str.pf');
pragma C_include('config.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM Config;
WITH FILES, LOG, GLOBDEF, STR;

VAR
   GluedCompounds : BOOLEAN;
   config         : FILES_Text;

PROCEDURE Config_Init;
VAR 
   str: STR_String;
   len: FILES_IORange;
BEGIN {Config_Init}
   IF GlobDef_GetAnGenMode = AnMode
      THEN Files_Open(config, 'aconfigsys', 10, 1)
      ELSE Files_Open(config, 'gconfigsys', 10, 1); 
  
   GluedCompounds := FALSE;

   WHILE NOT FILES_EndOfFile(config) DO BEGIN
      FILES_ReadStr(config, str, len); FILES_SkipSpace(config, FALSE);
      IF STR_Compare(str, 15, 'GLUED_COMPOUNDS', 15) = 0  THEN BEGIN
         FILES_ReadStr(config, str, len);
         IF STR_Compare(str, 3, 'YES', 3) = 0 THEN GluedCompounds := TRUE;
         END
      ELSE LOG_Write('error in configfile', 50, 1);
      FILES_Skipspace(config,TRUE)
   END;

   FILES_Close(config)

END {Config_Init};



FUNCTION Config_GluedCompounds
                  : BOOLEAN;
BEGIN {Config_GluedCompounds}
   Config_GluedCompounds:=GluedCompounds
END {Config_GluedCompounds};



