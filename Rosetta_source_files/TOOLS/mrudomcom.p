(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : mrudomcom
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
pragma C_include('mrudomcomdecl.pf');
pragma C_include('mrudomcomscanner.pf');
pragma C_include('mrudomcomparser.pf');
pragma C_include('mrudomcomrules.pf');
pragma C_include('mrudomcomlangspec.pf');
pragma C_include('logname.pf');
pragma C_include('mem.pf');

WITH mrudomcomdecl,
     mrudomcomscanner,
     mrudomcomparser,
     mrudomcomrules,
     mrudomcomlangspec,
     logname,
     mem;

PROGRAM mrudomcom(LogName);

VAR
   LogName   : text;
   inputfile : text;
   if1       : mrudomcomDECL_pConnectionNode;
   if2       : mrudomcomDECL_pLosTree;
   failure   : boolean;
   infile    : STRING(100);
   memstack  : MEM_stack;

BEGIN
   reset(LogName);
   LogName_Init(LogName);
   LogName_Translate('inputfile',infile);
   infile := LogName_FindFile(infile);
   reset(inputfile, infile);
   MEM_init;
   MEM_createstack(memstack,10000000);
   MEM_setdefault(memstack);
   mrudomcomDECL_assigndebug(false);
   mrudomcomLANGSPEC_init;
   failure:=false;
   writeln('domain compiler SCANNER....');
   if1 := mrudomcomSCANNER_body(inputfile);
   IF if1 <> nil THEN BEGIN
      writeln('domain compiler PARSER....');
      mrudomcomPARSER_body(if1, if2);
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
   if not(failure) then mrudomcomRULES_writeresults
END {mrudomcom}.
