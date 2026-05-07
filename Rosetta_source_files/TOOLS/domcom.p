(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : DOMCOM
 *  Creation date   :  29-JUL-1986
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include('domcomdecl.pf');
pragma C_include('domcomscanner.pf');
pragma C_include('domcomparser.pf');
pragma C_include('domcomrules.pf');
pragma C_include('domcomlangspec.pf');
pragma C_include('logname.pf');
pragma C_include('mem.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH DOMCOMDECL,
     DOMCOMSCANNER,
     DOMCOMPARSER,
     DOMCOMRULES,
     DOMCOMLANGSPEC,
     LOGNAME,
     MEM;

PROGRAM DOMCOM(LogName);


VAR
   LogName   : Text;
   inputfile : text;
   if1       : DOMCOMDECL_pConnectionNode;
   if2       : DOMCOMDECL_pLosTree;
   failure   : boolean;
   infile    : STRING(100);
   nep       : boolean;
   memstack  : MEM_stack;
BEGIN
   reset(LogName);
   LogName_Init(LogName);
   nep:=LogName_Translate('inputfile',infile);
   infile := LogName_FindFile(infile);
   reset(inputfile, infile);
   MEM_init;
   MEM_createstack(memstack,10000000);
   MEM_setdefault(memstack);
   DOMCOMDECL_assigndebug(false);
   DOMCOMLANGSPEC_init;
   failure:=false;
   writeln('domain compiler SCANNER....');
   if1 := DOMCOMSCANNER_body(inputfile);
   IF if1 <> nil THEN BEGIN
      writeln('domain compiler PARSER....');
      DOMCOMPARSER_body(if1, if2);
      IF if2 = nil THEN 
   		begin
   		writeln('fatal error; parse not completed');
                failure:=true
                end
      ELSE IF if2^.next<>nil THEN 
   		begin
   		writeln('more than one parse found');
                failure:=true
                end
      END
   ELSE
      begin
      writeln('fatal error in scanner');
      failure:=true
      end;
   close(inputfile);
   if not(failure) then DOMCOMRULES_writeresults
END {DOMCOM}.
