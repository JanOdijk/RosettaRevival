(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : GSEGCOM
 *  Creation date   :  29-JUL-1986
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
pragma C_include('segcomdecl.pf');
pragma C_include('segcomscanner.pf');
pragma C_include('segcomparser.pf');
pragma C_include('segcomrules.pf');
pragma C_include('segcomlangspec.pf');
pragma C_include ('logname.pf');


PROGRAM GSEGCOM(LogNames);
WITH SEGCOMDECL, 
     SEGCOMSCANNER,
     SEGCOMPARSER,
     SEGCOMRULES,
     SEGCOMLANGSPEC,
     LOGNAME;
VAR
   LogNames  : Text;
   inputfile : text;
   if1       : SEGCOMDECL_pConnectionNode;
   if2       : SEGCOMDECL_pLosTree;
   infile    : STRING(100);

BEGIN
   reset(LogNames);
   LogName_Init(LogNames);
   LogName_Translate('inputfile',infile);
   infile := LogName_FindFile(infile);
   reset(inputfile, infile);
   SEGCOMDECL_assigndebug(false);
   SEGCOMLANGSPEC_init;
   SEGCOMRULES_init;
   SEGCOMRULES_SetGenVersion;
   writeln('Segmentationrule compiler SCANNER....');
   if1 := SEGCOMSCANNER_body(inputfile);
   IF if1 <> nil THEN BEGIN
      writeln('Segmentationrule compiler GENERATIVE PARSER....');
      SEGCOMPARSER_body(if1, if2);
      IF if2 = nil THEN BEGIN 
         writeln('fatal error; parse not completed');
         halt
         END
      ELSE BEGIN
         writeln('Segmentationrule compiler GENERATIVE CODE GENERATION....');
         SEGCOMRULES_GCode;
      END              
      END
   ELSE BEGIN
      writeln('fatal error in scanner');
      halt
   END;
   close(inputfile);

END {GSEGCOM}.
