(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : mrucom
 *  Creation date   :  29-JUL-1986
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include ('mrucomdecl.pf');
pragma C_include ('mrucomscanner.pf');
pragma C_include ('mrucomparser.pf');
pragma C_include ('mrucomcode.pf');
pragma C_include ('mrucomlangspec.pf');
pragma C_include ('strtokey.pf');
pragma C_include ('mem.pf');
pragma C_include ('logname.pf');

WITH mrucomDECL,
     mrucomSCANNER,
     mrucomPARSER,
     mrucomCODE,
     strtokey,
     mem,
     logname,
     mrucomLANGSPEC;

PROGRAM mrucom(LogName);

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

VAR
   LogName  : Text;
   inputfile : text;
   if1       : mrucomDECL_pConnectionNode;
   if2       : mrucomDECL_pLosTree;
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
   mrucomDECL_assigndebug(false);
   mrucomLANGSPEC_init;
   failure:=false;
   writeln('mrucom SCANNER....');
   if1 := mrucomSCANNER_body(inputfile);
   IF if1 <> nil THEN BEGIN
      writeln('mrucom PARSER....');
      mrucomPARSER_body(if1, if2);
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
   if not(failure) then mrucomCODE_UTTproc(if2^.arg) else
      begin
      writeln('Please neglect the following error message');
      ptr:=NIL;
      dispose(ptr);
      end;
END {mrucom}.
