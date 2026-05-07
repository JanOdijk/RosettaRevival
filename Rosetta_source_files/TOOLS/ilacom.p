(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : ilacom
 *  Creation date   :  29-JUL-1986
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include ('ilacomdecl.pf');
pragma C_include ('ilacomscanner.pf');
pragma C_include ('ilacomparser.pf');
pragma C_include ('ilacomcode.pf');
pragma C_include ('ilacomlangspec.pf');
pragma C_include ('strtokey.pf');
pragma C_include ('mem.pf');
pragma C_include ('logname.pf');

WITH ilacomDECL,
     ilacomSCANNER,
     ilacomPARSER,
     ilacomCODE,
     strtokey,
     mem,
     logname,
     ilacomLANGSPEC;

PROGRAM ilacom(LogName);

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

VAR
   LogName  : Text;
   inputfile : text;
   if1       : ilacomDECL_pConnectionNode;
   if2       : ilacomDECL_pLosTree;
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
   ilacomDECL_assigndebug(false);
   ilacomLANGSPEC_init;
   failure:=false;
   writeln('ilacom SCANNER....');
   if1 := ilacomSCANNER_body(inputfile);
   IF if1 <> nil THEN BEGIN
      writeln('ilacom PARSER....');
      ilacomPARSER_body(if1, if2);
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
   if not(failure) then ilacomCODE_UTTproc(if2^.arg) else
      begin
      writeln('Please neglect the following error message');
      ptr:=NIL;
      dispose(ptr);
      end;
END {ilacom}.
