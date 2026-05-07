(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : surfcom
 *  Creation date   :  29-JUL-1986
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include ('surfcomdecl.pf');
pragma C_include ('surfcomscanner.pf');
pragma C_include ('surfcomparser.pf');
pragma C_include ('surfcomcode.pf');
pragma C_include ('surfcomlangspec.pf');
pragma C_include ('strtokey.pf');
pragma C_include ('mem.pf');
pragma C_include ('logname.pf');

WITH surfcomDECL,
     surfcomSCANNER,
     surfcomPARSER,
     surfcomCODE,
     strtokey,
     mem,
     logname,
     surfcomLANGSPEC;

PROGRAM surfcom(LogName);

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

VAR
   LogName  : Text;
   inputfile : text;
   if1       : surfcomDECL_pConnectionNode;
   if2       : surfcomDECL_pLosTree;
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
   surfcomDECL_assigndebug(false);
   surfcomLANGSPEC_init;
   failure:=false;
   writeln('surfcom SCANNER....');
   if1 := surfcomSCANNER_body(inputfile);
   IF if1 <> nil THEN BEGIN
      writeln('surfcom PARSER....');
      surfcomPARSER_body(if1, if2);
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
   if not(failure) then surfcomCODE_UTTproc(if2^.arg) else
      begin
      writeln('Please neglect the following error message');
      ptr:=NIL;
      dispose(ptr);
      end;
END {surfcom}.
