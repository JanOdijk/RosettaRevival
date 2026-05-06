(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : PRINTERF
 *  Creation date   : 22-MAR-1987
 *  Author          : J. Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(PRINTERF);
pragma C_include('interfaces.pf');
pragma C_include('printerf1.pf');
pragma C_include('printerf2.pf');
pragma C_include('printerf3.pf');
pragma C_include('printerf4.pf');
pragma C_include('printerf5.pf');
pragma C_include('printerf6.pf');
pragma C_include('printerf7.pf');
pragma C_include('wnd.pf');
pragma C_include('level.pf');
pragma C_include('globdef.pf');
pragma C_include('printerf.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM PRINTERF;
WITH INTERFACES, PRINTERF1, PRINTERF2, PRINTERF3, PRINTERF4, PRINTERF5,
     PRINTERF6, PRINTERF7, WND, LEVEL, GLOBDEF;

VAR
   PRINTERFInfo : ARRAY[INTERFACES_leveltype] OF BOOLEAN;


PROCEDURE PRINTERF_Init;
VAR
   i: INTERFACES_LevelType;
BEGIN
   FOR i:=-1 TO 8 DO PRINTERFInfo[i] := FALSE;
END;


PROCEDURE PRINTERF_Set(level: INTERFACES_LevelType;
                                valeu: BOOLEAN);
BEGIN
   PRINTERFInfo[level] := valeu
END;


PROCEDURE PRINTERF_Write(level  : INTERFACES_leveltype;
                                  interf : INTERFACES_IfDescr);

BEGIN
   IF (level > 0) And (Not GlobDef_GetBatchMode) THEN BEGIN
      WND_GetBoolean(LEVEL_printerf_to_Xid (level), PRINTERFInfo[level]);
      IF PRINTERFInfo[level] THEN BEGIN
         CASE level OF
            1 : PRINTERF1_body(interf);
            2 : PRINTERF2_body(interf);
            3 : PRINTERF3_body(interf);
            4 : PRINTERF4_body(interf);
            5 : PRINTERF5_body(interf);
            6 : PRINTERF6_body(interf);
            7 : PRINTERF7_body(interf);
            8 :;
         END;
      END;
   END;
END;


