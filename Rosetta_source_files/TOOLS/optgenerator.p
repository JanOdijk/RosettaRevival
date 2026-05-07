(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : OPTGENERATOR
 *  Creation date   : 18-0ct-1990
 *  Author          : Rene Leermakers
 *
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)
pragma c_include('filep.pf');
pragma C_Include ('strings.pf');
pragma C_Include ('portio.pf');
pragma C_Include ('status.pf');
pragma C_Include ('string.pf');
pragma C_Include ('files.pf');
pragma C_include ('logname.pf');

PROGRAM OPTGENERATOR(LogNames,DirPath);

WITH FILES,
     STRNG,
     STRINGS,
     PORTIO,
     STATUS,
     Filep_type Transmitted,
     LOGNAME;
CONST maxopt=300;
VAR
   LogNames,DirPath   : Text;
   OutputFile,
   InputFile  : FILES_Text;
   ch         : CHAR;
   filestr,
   fil,
   betweenslashes: STRING_String;
   slashseen  : BOOLEAN;
   objarray   : ARRAY[1..maxopt] OF STRING_string;
   i,currentline,
   lastpragma: INTEGER;
   targetcomp: STRING(STRING_max);
   filep1    :filep;

 PROCEDURE mergeoptfile(filestr:STRING_string);
 VAR optfile:FILES_text;
    objname,strng:STRING_string;
    ch : CHAR;
    len:FILES_iorange;
    done:BOOLEAN;
    path:LOGNAME_ppathtype;
    filestr1:STRING_string;
    found:BOOLEAN;
  PROCEDURE merge(objname:STRING_string);
  VAR found: BOOLEAN;
      i: INTEGER;
  BEGIN
  found:=FALSE;
  i:=1;
  WHILE (i<>maxopt) AND (NOT found) AND 
               (STRING_length(objarray[i])<>0) DO BEGIN
     found:=(STRING_compare(objarray[i],objname)=0);
     i:=i+1;
  END;
  IF i=maxopt THEN writeln('to many modules, overflow in optgenerator')
  ELSE BEGIN
    IF NOT found THEN objarray[i]:=objname;
  END;
  END;
  FUNCTION existfile(filestr:STRING_string):BOOLEAN;
  VAR locstr:STRING(STRING_max);
  BEGIN
  locstr:=filestr;
  filep1:=Fopen(locstr,'r');
  existfile:=NOT(Errno=Error_file_not_found)
  END;
 BEGIN{mergeoptfile}
   path:=LOGNAME_path;
   found:=FALSE;
   WHILE (path<>NIL) AND NOT(found) DO BEGIN
     STRING_concat(filestr1,path^.directory,filestr);
     IF existfile(filestr1) THEN BEGIN
       found:=TRUE;
       FILES_Open(optfile,filestr1,STRING_length(filestr1), 1)
     END;
   {if not found then writeln(filestr1, ' not found');}
   path:=path^.next;
   END;  
   IF found THEN WHILE NOT FILES_EndOfFile(optfile) DO BEGIN
       Files_Readstring(optfile,objname);
       merge(objname);
       FILES_ReadtoEndofLine(optfile,strng,len);
       Files_Readchar(optfile,ch)
   END
   ELSE write('');
   If found THEN FILES_close(optfile);
 END;

 PROCEDURE writeobjnamestooutput;
 VAR i:INTEGER;
     objectfile: STRING(STRING_max);
     nep:boolean;
 BEGIN
   i:=1;
   WHILE (STRING_length(objarray[i])<>0) DO BEGIN
   FILES_WriteString(OutputFile, objarray[i], 0, TRUE);
   FILES_WriteString(OutputFile, ' \', 0, TRUE);
   FILES_WriteLine(OutputFile, TRUE);
   i:=i+1;
   END;
   nep:=LogName_Translate('objectfile',objectfile);
   FILES_WriteString(OutputFile, objectfile, 0, TRUE);
 END;

BEGIN 
   FOR i:=1 TO maxopt DO STRING_constantempty(objarray[i]);
   currentline:=0;
   reset(LogNames);
   reset(DirPath);
   LogName_Init(LogNames);
   LogName_InitPath(DirPath);
   FILES_Open(InputFile,'inputfile',9, 1);
   WHILE NOT FILES_EndOfFile(InputFile) AND (currentline<lastpragma+10) DO BEGIN
      WHILE NOT FILES_EndOfLine(InputFile) DO BEGIN
         FILES_ReadChar(InputFile, ch); 
         IF (ch = 'p') AND NOT FILES_EndOfLine(InputFile) THEN BEGIN
          FILES_ReadChar(InputFile, ch); 
          IF (ch = 'r') AND NOT FILES_EndOfLine(InputFile) THEN BEGIN
           FILES_ReadChar(InputFile, ch); 
           IF (ch = 'a') AND NOT FILES_EndOfLine(InputFile) THEN BEGIN
            FILES_ReadChar(InputFile, ch); 
            IF (ch = 'g') AND NOT FILES_EndOfLine(InputFile) THEN BEGIN
             FILES_ReadChar(InputFile, ch); 
             IF (ch = 'm') AND NOT FILES_EndOfLine(InputFile) THEN BEGIN 
              FILES_ReadChar(InputFile, ch); 
              IF (ch = 'a') AND NOT FILES_EndOfLine(InputFile) THEN BEGIN 
               (* pragma seen *)
               lastpragma:=currentline;
               WHILE NOT FILES_EndOfLine(InputFile) AND (ch<>'''') DO BEGIN
                 FILES_ReadChar(InputFile, ch);
               END;
               (* start reading file name *)
               STRING_ConstantEmpty(filestr); 
               REPEAT
                FILES_ReadChar(InputFile, ch);
                STRING_AppendChar(filestr, filestr, ch);
               UNTIL ch = '.';
               STRING_Append(filestr,'opt');
               mergeoptfile(filestr);
              END
             END
            END
           END
          END
         END
      END;
      FILES_ReadChar(InputFile, ch);
      currentline:=currentline+1;
   END;
   
   FILES_Close(InputFile);
   FILES_Open(OutputFile,'outputfile',10, 3);
   writeobjnamestooutput;
   FILES_Close(OutputFile)

END {GENCOMP}.
