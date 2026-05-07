(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : #
 *  Creation date   :  29-JUL-1986
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include ('#decl.pf');
pragma C_include ('#scanner.pf');
pragma C_include ('#parser.pf');
pragma C_include ('#code.pf');
pragma C_include ('#langspec.pf');
pragma C_include ('strtokey.pf');
pragma C_include ('mem.pf');
pragma C_include ('logname.pf');

WITH #DECL,
     #SCANNER,
     #PARSER,
     #CODE,
     strtokey,
     mem,
     logname,
     #LANGSPEC;

PROGRAM #(LogName);

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

VAR
   LogName  : Text;
   inputfile : text;
   if1       : #DECL_pConnectionNode;
   if2       : #DECL_pLosTree;
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
   #DECL_assigndebug(false);
   #LANGSPEC_init;
   failure:=false;
   writeln('# SCANNER....');
   if1 := #SCANNER_body(inputfile);
   IF if1 <> nil THEN BEGIN
      writeln('# PARSER....');
      #PARSER_body(if1, if2);
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
   if not(failure) then #CODE_UTTproc(if2^.arg) else
      begin
      writeln('Please neglect the following error message');
      ptr:=NIL;
      dispose(ptr);
      end;
END {#}.
