(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : SEGMRULES 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

pragma C_include('strings.pf');
Export(segmrules);
pragma C_include('files.pf');
pragma C_include('log.pf');
pragma C_include('logname.pf');
pragma C_include('segmrules.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM SEGMRULES;
WITH  STRINGS, FILES, LOG, LOGNAME;

VAR
   FileOpened : BOOLEAN;
   newname    : STRING(100);

(*-------------------------------------------------------------------------*
 * I/O routines for reading and writing segmentation rule data files
 *-------------------------------------------------------------------------*)

FUNCTION SEGMRULES_FileOpened: BOOLEAN;
BEGIN
   SEGMRULES_FileOpened := {FileOpened} TRUE;
END;


PROCEDURE SEGMRULES_FIXruleOpenWrite(
                    VAR f: SEGMRULES_FIXdict;
                    CONST name: STRING);
    
BEGIN
   LOGNAME_Translate(name, newname);
   rewrite(f,LOGNAME_findfile(newname));

END {SEGMRULES_FIXruleOpenWrite};


PROCEDURE SEGMRULES_FIXruleOpenRead(
                    VAR f: SEGMRULES_FIXdict;
                    CONST name: STRING);
    
BEGIN
   LOGNAME_Translate(name, newname);
   reset(f,LOGNAME_findfile(newname));

END {SEGMRULES_FIXruleOpenRead};


PROCEDURE SEGMRULES_FIXruleWrite(VAR f: SEGMRULES_FIXdict;
                                r: SEGMRULES_FIXrule);
BEGIN

   write(f, r)

END {SEGMRULES_FIXruleWrite};


PROCEDURE SEGMRULES_FIXruleRead(VAR f: SEGMRULES_FIXdict;
                               VAR r: SEGMRULES_FIXrule);
BEGIN

   read(f, r)

END {SEGMRULES_FIXruleRead};


PROCEDURE SEGMRULES_FIXruleClose( VAR f: SEGMRULES_FIXdict);

BEGIN

   close(f)

END {SEGMRULES_FIXruleClose};


PROCEDURE SEGMRULES_GLUEruleOpenWrite(
                    VAR f: SEGMRULES_GLUEdict;
                    CONST name: STRING);
    
BEGIN

   LOGNAME_Translate(name, newname);
   rewrite(f,LOGNAME_findfile(newname));

END {SEGMRULES_GLUEruleOpenWrite};


PROCEDURE SEGMRULES_GLUEruleOpenRead(
                    VAR f: SEGMRULES_GLUEdict;
                    CONST name: STRING);
    
BEGIN

   LOGNAME_Translate(name, newname);
   reset(f,LOGNAME_findfile(newname));

END {SEGMRULES_GLUEruleOpenRead};


PROCEDURE SEGMRULES_GLUEruleWrite(VAR f: SEGMRULES_GLUEdict;
                                r: SEGMRULES_GLUErule);
BEGIN

   write(f, r)

END {SEGMRULES_GLUEruleWrite};


PROCEDURE SEGMRULES_GLUEruleRead(VAR f: SEGMRULES_GLUEdict;
                               VAR r: SEGMRULES_GLUErule);
BEGIN

   read(f, r)

END {SEGMRULES_GLUEruleRead};


PROCEDURE SEGMRULES_GLUEruleClose( VAR f: SEGMRULES_GLUEdict);

BEGIN

   close(f)

END {SEGMRULES_GLUEruleClose};


PROCEDURE SEGMRULES_SearchOpenWrite(
                    VAR f: SEGMRULES_SearchDict;
                    CONST name: STRING);
    
BEGIN


   LOGNAME_Translate(name, newname);
   rewrite(f,LOGNAME_findfile(newname));

END {SEGMRULES_SearchOpenWrite};


PROCEDURE SEGMRULES_SearchOpenRead(
                    VAR f: SEGMRULES_SearchDict;
                    CONST name: STRING);
    
BEGIN

   LOGNAME_Translate(name, newname);
   reset(f,LOGNAME_findfile(newname));

END {SEGMRULES_SearchOpenRead};


PROCEDURE SEGMRULES_SearchWrite(VAR f: SEGMRULES_SearchDict;
                                r: SEGMRULES_SearchTree);
BEGIN

   write(f, r)

END {SEGMRULES_SearchWrite};


PROCEDURE SEGMRULES_SearchRead(VAR f: SEGMRULES_SearchDict;
                               VAR r: SEGMRULES_SearchTree);
BEGIN

   read(f, r)

END {SEGMRULES_SearchRead};


PROCEDURE SEGMRULES_SearchClose( VAR f: SEGMRULES_SearchDict);

BEGIN

   close(f)

END {SEGMRULES_SearchClose};



PROCEDURE SEGMRULES_VarOpenWrite(
                    VAR f: SEGMRULES_VarDict;
                    CONST name: STRING);
    
BEGIN

   LOGNAME_Translate(name, newname);
   rewrite(f,LOGNAME_findfile(newname));

END {SEGMRULES_VarOpenWrite};



PROCEDURE SEGMRULES_VarOpenRead(
                    VAR f: SEGMRULES_VarDict;
                    CONST name: STRING);
    
BEGIN

   LOGNAME_Translate(name, newname);
   reset(f,LOGNAME_findfile(newname));

END {SEGMRULES_VarOpenRead};


PROCEDURE SEGMRULES_VarWrite(VAR f: SEGMRULES_VarDict;
                   r: SEGMRULES_VarRecord);
BEGIN

   write(f, r)

END {SEGMRULES_VarWrite};


PROCEDURE SEGMRULES_VarRead(VAR f: SEGMRULES_VarDict;
                               VAR r: SEGMRULES_VarRecord);
BEGIN

   read(f, r)

END {SEGMRULES_VarRead};


PROCEDURE SEGMRULES_VarClose( VAR f: SEGMRULES_VarDict);

BEGIN

   close(f)

END {SEGMRULES_VarClose};


PROCEDURE SEGMRULES_VarStrOpenWrite(
                    VAR f: SEGMRULES_VarStrDict;
                    CONST name: STRING);
    
BEGIN

   LOGNAME_Translate(name, newname);
   rewrite(f,LOGNAME_findfile(newname));

END {SEGMRULES_VarStrOpenWrite};



PROCEDURE SEGMRULES_VarStrOpenRead(
                    VAR f: SEGMRULES_VarStrDict;
                    CONST name: STRING);
    
BEGIN

   LOGNAME_Translate(name, newname);
   reset(f,LOGNAME_findfile(newname));

END {SEGMRULES_VarStrOpenRead};


PROCEDURE SEGMRULES_VarStrWrite(VAR f: SEGMRULES_VarStrDict;
                   r: SEGMRULES_VarStrRecord);
BEGIN

   write(f, r)

END {SEGMRULES_VarStrWrite};


PROCEDURE SEGMRULES_VarStrRead(VAR f: SEGMRULES_VarStrDict;
                               VAR r: SEGMRULES_VarStrRecord);
BEGIN

   read(f, r)

END {SEGMRULES_VarStrRead};


PROCEDURE SEGMRULES_VarStrClose( VAR f: SEGMRULES_VarStrDict);

BEGIN

   close(f)

END {SEGMRULES_VarStrClose};


PROCEDURE SEGMRULES_CharOpenWrite(
                    VAR f: SEGMRULES_CharDict;
                    CONST name: STRING);
    
BEGIN


   LOGNAME_Translate(name, newname);
   rewrite(f,LOGNAME_findfile(newname));

END {SEGMRULES_CharOpenWrite};



PROCEDURE SEGMRULES_CharOpenRead(
                    VAR f: SEGMRULES_CharDict;
                    CONST name: STRING);
    
BEGIN

   LOGNAME_Translate(name, newname);
   reset(f,LOGNAME_findfile(newname));

END {SEGMRULES_CharOpenRead};


PROCEDURE SEGMRULES_CharWrite(VAR f: SEGMRULES_CharDict;
                    r: SEGMRULES_CharRecord);
BEGIN

   write(f, r)

END {SEGMRULES_CharWrite};


PROCEDURE SEGMRULES_CharRead(VAR f: SEGMRULES_CharDict;
                               VAR r: SEGMRULES_CharRecord);
BEGIN

   read(f, r)

END {SEGMRULES_CharRead};


PROCEDURE SEGMRULES_CharClose( VAR f: SEGMRULES_CharDict);

BEGIN

   close(f)

END {SEGMRULES_CharClose};


