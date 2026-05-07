(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : auxcom
 *  Creation date   :  29-JUL-1986
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include ('auxcomdecl.pf');
pragma C_include ('auxcomscanner.pf');
pragma C_include ('auxcomparser.pf');
pragma C_include ('auxcomcode.pf');
pragma C_include ('auxcomlangspec.pf');
pragma C_include ('strtokey.pf');
pragma C_include ('mem.pf');
pragma C_include ('logname.pf');

WITH auxcomDECL,
     auxcomSCANNER,
     auxcomPARSER,
     auxcomCODE,
     strtokey,
     mem,
     logname,
     auxcomLANGSPEC;

PROGRAM auxcom(LogName);

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

VAR
   LogName  : Text;
   inputfile : text;
   if1       : auxcomDECL_pConnectionNode;
   if2       : auxcomDECL_pLosTree;
   failure   : boolean;
   ptr       : ^INTEGER;
   memstack  : MEM_stack;
   infile    : String(100);
BEGIN
   reset(Logname);
   LogName_Init(logname);
   LogName_Translate('inputfile',infile);
   infile := LogName_FindFile(infile);
   reset(inputfile,infile);
   StrToKey_OpenSkeyRead;
   MEM_init;
   MEM_createstack(memstack,20000000);
   MEM_setdefault(memstack);
   auxcomDECL_assigndebug(false);
   auxcomLANGSPEC_init;
   failure:=false;
   writeln('auxcom SCANNER....');
   if1 := auxcomSCANNER_body(inputfile);
   IF if1 <> nil THEN BEGIN
      writeln('auxcom PARSER....');
      auxcomPARSER_body(if1, if2);
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
   if not(failure) then auxcomCODE_UTTproc(if2^.arg) else
      begin
      writeln('Please neglect the following error message');
      ptr:=NIL;
      dispose(ptr);
      end;
END {auxcom}.
