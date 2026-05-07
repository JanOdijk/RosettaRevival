(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Files
 *  Creation date   :  30-JUL-1986
 *  Author          : Carel Fellinger, copied from general:files.pas
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Some VAX/VMS specific features are used in this module
 *                    to handle files and logical names. (open and close
 *                    statement, VARYING data-type)
 *
 *                    This module takes care that no unnecessary end-of-lines
 *                    are written and that an end-of-page marker is only written
 *                    directly after an end-of-line marker. In order to do this
 *                    correctly the following condition has to hold during the
 *                    write state of an file f :
 *                       f.pos<>0  <-> 'current-line is not closed yet'.
 *
 *  Modified at 23-SEP-1986
 *                    In this module all low-level IO functions are implemented
 *                    by means of eof, eoln, get, readln, write(char), writeln,
 *                    page, open, close, reset, rewrite and extend (open,
 *                    close and extend are VMS/Pascal specific routines).
 *                    An VMS/Pascal extension makes it possible to continue
 *                    even in case of an error in one of the above mentioned
 *                    routines by adding the parameter "ERROR:= CONTINUE".
 *                    The VMS/Pascal specific function status returnes the
 *                    resulting status of the last IO action. A side effect of
 *                    this routine is that the lazy-lookahead of files connected
 *                    to a terminal does not work properly anymore because the
 *                    file-buffer is inspected by the status routine.
 *                    A second drawback associated with this is that programs
 *                    that contain errors in their IO, like writing to a file
 *                    not opened for writing, don't crash, which makes debugging
 *                    harder.
 *                    I have therefor decided to use the status function only
 *                    after opening and closing.
 *  Modified at  26-SEP-1986
 *                    The translate routine and some conversion routines have
 *                    been moved to the module Str.
 *  Modified at  25-FEB-1987
 *                    TFILES_Open incorrectly opened read-only files to be
 *                    written to too, thus changing the revision dates of these
 *                    files and disabling the shared reading of them.
 *                    This is corrected by given the parameter
 *                    HISTORY of the VMS/Pascal open statement  the value
 *                    READONLY. (see the VMS/Pascal manuals)
 *  Modified at   13-APR-1987
 *                    Added the procedure TFILES_OpenLocal to open local files,
 *                    i.e. files that are only known within the scope of the
 *                    running program.
 *
 *EMP:::===================================================================*)


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
EXPORT(tfiles);
pragma C_include('tfiles.pf');
pragma C_include('files.pf');
pragma C_include('tstring.pf');
pragma C_include('string.pf');
pragma C_include('str.pf');



PROGRAM TFiles;

WITH files,tstring,strng,str;

 FUNCTION TFILES_Done : BOOLEAN;
BEGIN {TFILES_Done}
   TFILES_Done:= FILES_done;
END {TFILES_Done};


 PROCEDURE TFILES_Open (VAR f : FILES_Text;
                               CONST name : string;
                               len : FILES_NameRange;
                               mode : FILES_Mode);
BEGIN
FILES_Open(f,name,len,mode)
END {TFILES_Open};


 PROCEDURE TFILES_Close (VAR f : FILES_Text);
BEGIN {TFILES_Close}
FILES_Close(f);
END {TFILES_Close};

 PROCEDURE TFILES_WriteStr (VAR f : FILES_Text;
                                   CONST str : string;
                                   len, width : FILES_IORange;
                                   LeftJustify : FILES_LeftJustify);


BEGIN {TFILES_WriteStr}
FILES_writestr(f,str,len,width,leftjustify)
END {TFILES_WriteStr};



 PROCEDURE TFILES_WriteString (VAR f : FILES_Text;
                                      str : TSTRING_String;
                                      width : FILES_IORange;
                                      LeftJustify : FILES_LeftJustify);

   VAR str1:STRING_string;

BEGIN {TFILES_WriteString}
TSTRING_converttostring(str,str1);
FILES_writestring(f,str1,width,leftjustify);
END {TFILES_WriteString};

 PROCEDURE TFILES_WriteInteger (VAR f : FILES_Text;
                                       i : INTEGER;
                                       width : FILES_IORange;
                                       LeftJustify : FILES_LeftJustify);
BEGIN {TFILES_WriteInteger}
FILES_writeinteger(f,i,width,leftjustify)
END {TFILES_WriteInteger};

 PROCEDURE TFILES_WriteLine (VAR f : FILES_Text;
                                    b : BOOLEAN);
BEGIN {TFILES_WriteLine}
FILES_writeline(f,b)
END {TFILES_WriteLine};

