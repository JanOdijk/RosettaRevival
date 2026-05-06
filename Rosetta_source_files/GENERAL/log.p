(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : LOG 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *   18-AUG-1986    : Adopted to the new module Files by Carel Fellinger
 *
 *EMP:::===================================================================*)

pragma C_include('strings.pf');
Export(LOG);
pragma C_Include('globdef.pf');
pragma C_Include('files.pf');
pragma C_Include('log.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LOG;
WITH GLOBDEF, FILES, STRINGS;

CONST Clock_Max = 0;

TYPE Clock_String = STRING(10);

VAR
   logfile : Files_Text;


{dummy procedure}
PROCEDURE Clock_WallTime(VAR c: Clock_String); 
BEGIN c := '' END;

(*-------------------------------------------------------------------------*
 * Export procedure LOG_open
 *-------------------------------------------------------------------------*)

PROCEDURE LOG_open(CONST name: STRING;
                            len: Files_nameRange;
                            create: GLOBDEF_yntype);
   VAR
      localstatus : GLOBDEF_status;

BEGIN
      {open the log-file}
   IF create=GLOBDEF_yes THEN BEGIN
      Files_Open(logfile,name,len,5);
      END {THEN}
   ELSE BEGIN
      Files_Open(logfile,name,len,6);
   END {IF};
END {LOG_open};


(*-------------------------------------------------------------------------*
 * Export procedure LOG_write     
 *-------------------------------------------------------------------------*)

PROCEDURE LOG_write(CONST str: STRING;
                             len: Files_IORange;
                             status: integer);
   VAR
      currenttime : Clock_String;

BEGIN

   Clock_WallTime(currenttime);
   Files_WriteStr(logfile, currenttime,Clock_Max,Clock_Max, Left);
   Files_WriteStr(logfile, ', ',2,2, Left);
   Files_WriteStr(logfile, str, len, len, Left);
   Files_WriteStr(logfile, ', ',2,2, Left);
   Files_WriteInteger(logfile, status,0, Left);
   Files_WriteLine(logfile,TRUE);

END {LOG_write};



(*-------------------------------------------------------------------------*
 * Export procedure LOG_close     
 *-------------------------------------------------------------------------*)

PROCEDURE LOG_close;
                              
BEGIN

   Files_Close(logfile);

END {LOG_close};



