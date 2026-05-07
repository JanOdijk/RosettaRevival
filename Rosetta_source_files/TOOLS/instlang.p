(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : INSTLANG
 *  Creation date   : 4-APR-1989
 *  Author          : J. Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_Include ('string.pf');
pragma C_Include ('files.pf');
pragma C_include ('logname.pf');

PROGRAM INSTLANG(LogNames);

WITH FILES,
     STRNG,
     LOGNAME;

VAR
   LogNames   : Text;
   OutputFile,
   SubstFile,
   InputFile  : FILES_Text;
   ch         : CHAR;
   subststr,fil   : STRING_String;
   sik      : string(50);




BEGIN
   reset(LogNames);
   LogName_Init(LogNames);
   STRING_ConstantEmpty(subststr); 
   FILES_Open(SubstFile,'substfile',9,1); 
   REPEAT
      FILES_ReadChar(SubstFile, ch);
      IF ch <> ' ' THEN STRING_AppendChar(subststr, subststr, ch);
   UNTIL ch = ' ';
   FILES_Close(SubstFile);
   FILES_Open(InputFile,'inputfile',9, 1);
   FILES_Open(OutputFile,'outputfile',10, 3);
   WHILE NOT FILES_EndOfFile(InputFile) DO BEGIN
      WHILE NOT FILES_EndOfLine(InputFile) DO BEGIN
         FILES_ReadChar(InputFile, ch); 
         IF ch = '&' THEN  
            FILES_WriteString(OutputFile, subststr, 0, TRUE)  
            ELSE  FILES_WriteChar(OutputFile, ch);
      END;
      FILES_ReadChar(InputFile, ch);
      FILES_WriteLine(OutputFile, TRUE);
   END;
   
   FILES_Close(InputFile);
   Files_Close(OutputFile)

END {INSTLANG}.

