(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : tracom
 *  Creation date   :  29-JUL-1986
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include ('tracomdecl.pf');
pragma C_include ('tracomscanner.pf');
pragma C_include ('tracomparser.pf');
pragma C_include ('tracomcode.pf');
pragma C_include ('tracomlangspec.pf');
pragma C_include ('strtokey.pf');
pragma C_include ('mem.pf');
pragma C_include ('logname.pf');

WITH tracomDECL,
     tracomSCANNER,
     tracomPARSER,
     tracomCODE,
     strtokey,
     mem,
     logname,
     tracomLANGSPEC;

PROGRAM tracom(LogName);

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

VAR
   LogName  : Text;
   inputfile : text;
   if1       : tracomDECL_pConnectionNode;
   if2       : tracomDECL_pLosTree;
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
   tracomDECL_assigndebug(false);
   tracomLANGSPEC_init;
   failure:=false;
   writeln('tracom SCANNER....');
   if1 := tracomSCANNER_body(inputfile);
   IF if1 <> nil THEN BEGIN
      writeln('tracom PARSER....');
      tracomPARSER_body(if1, if2);
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
   if not(failure) then tracomCODE_UTTproc(if2^.arg) else
      begin
      writeln('Please neglect the following error message');
      ptr:=NIL;
      dispose(ptr);
      end;
END {tracom}.
