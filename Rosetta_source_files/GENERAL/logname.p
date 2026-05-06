(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LOGNAME
 *  Creation date   : 10-OCT-1990
 *  Author          : J. Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include('strings.pf');
Export(logname);
pragma C_include('logname.pf');
pragma C_include('cisam.pf');
pragma C_include('str.pf');

PROGRAM LogName;

WITH  STRINGS, STR, CISAM;

CONST
   LogName_MaxLogTable = 200;
   MaxEquiName         = 3;
TYPE
   LogName_TableRec = RECORD
                         logname : STRING(100); 
                         equiname: ARRAY[1..MaxEquiName] OF STRING(100);
                         nrequis : INTEGER;
                      END;
VAR
   LogTable : ARRAY[1..LogName_MaxLogTable] OF LogName_TableRec;
   NrNames  : INTEGER;
   Path     : LOGNAME_ppathtype;

PROCEDURE LogName_Init(VAR f: Text);
VAR
   i,j      : INTEGER;
   ch       : CHAR;
   dum      : Str_Range;
   lastchar : CHAR;
BEGIN
   i := 0;
   lastchar := ' ';
   WHILE NOT EOF(f) DO BEGIN
      WHILE NOT EOLN(f) DO BEGIN
         ch := ' ';
         WHILE (ch = ' ') AND NOT EOLN(f) DO BEGIN
            read(f, ch);
         END;
         IF lastchar <> '+' THEN BEGIN
            i := i+1;
            LogTable[i].logname     := '';
            LogTable[i].equiname[1] := '';
            LogTable[i].nrequis     := 1;
            WHILE (ch <> ' ') AND NOT EOLN(f) DO BEGIN
               LogTable[i].logname := LogTable[i].logname || ch;
               read(f, ch);
            END; 
            STR_UpperCase(LogTable[i].logname,dum,LogTable[i].logname,Str_Max);

            WHILE (ch = ' ') AND NOT EOLN(f) DO BEGIN
               read(f, ch);
            END;
            WHILE (ch <>  ' ') AND NOT EOLN(f) DO BEGIN
               LogTable[i].equiname[1] := LogTable[i].equiname[1] || ch;
               read(f, ch); 
               IF ch <> ' ' THEN BEGIN lastchar := ch; END;
            END;
            IF (ch <> ' ') AND EOLN(f) THEN BEGIN
               LogTable[i].equiname[1] := LogTable[i].equiname[1] || ch;
               IF ch <> ' ' THEN BEGIN lastchar := ch; END;
            END; 
            WHILE NOT EOLN(f) DO BEGIN
               read(f, ch);
               IF ch <> ' ' THEN BEGIN lastchar := ch; END;
            END;
            END
          ELSE BEGIN
            LogTable[i].nrequis     := LogTable[i].nrequis+1;
            j := LogTable[i].nrequis;
            WHILE (ch <>  ' ') AND NOT EOLN(f) DO BEGIN
               LogTable[i].equiname[j] := LogTable[i].equiname[j] || ch;
               read(f, ch); 
               IF ch <> ' ' THEN lastchar := ch;
            END;
            IF (ch <> ' ') AND EOLN(f) THEN BEGIN
               LogTable[i].equiname[j] := LogTable[i].equiname[j] || ch;
               IF ch <> ' ' THEN lastchar := ch;
            END; 
            WHILE NOT EOLN(f) DO BEGIN
               read(f, ch);
               IF ch <> ' ' THEN lastchar := ch;
            END;
          END
      END;
      readln(f);
   END;
   NrNames := i;
END {LogName_Init};

PROCEDURE LogName_InitPath(VAR f: Text);
VAR p: LOGNAME_ppathtype;
   ch : CHAR;
BEGIN
   path:=NIL;
   WHILE NOT EOF(f) DO BEGIN
      new(p);
      p^.directory:='';
      p^.next:=path;
      path:=p;
      WHILE NOT EOLN(f) DO BEGIN
         ch := ' ';
         WHILE (ch = ' ') AND NOT EOLN(f) DO BEGIN
            read(f, ch);
         END;
         WHILE (ch <> ' ') AND NOT EOLN(f) DO BEGIN
            p^.directory := p^.directory || ch;
            read(f, ch);
         END; 
      END;
      readln(f);
   END;
END {LogName_Init};

FUNCTION LogName_Path: LOGNAME_ppathtype;
BEGIN
LogName_Path:=path
END;

FUNCTION LogName_Translate(CONST s1: String; VAR s2: String): BOOLEAN;
VAR
   i : INTEGER;
   found : BOOLEAN;
   sloc: STRING(Str_Max);
   dum: Str_Range;
BEGIN
   i := 0; found := FALSE; s2 := '';
   STR_UpperCase(sloc,dum,s1,Str_Max);

   WHILE (i < NrNames) AND NOT found DO BEGIN
      i := i+1;
      IF sloc = LogTable[i].logname THEN BEGIN
         found := TRUE;
         s2 := LogTable[i].equiname[1];
      END;
   END;
{
   writeln(sloc,' ',s2);
}
   LogName_Translate := found;
END {LogName_Translate};

FUNCTION LogName_Tr(CONST s1: String): String(Logname_MaxLen);
VAR
   i : INTEGER;
   found : BOOLEAN;
   s2 : String(Logname_MaxLen);
   sloc: STRING(Str_Max);
   dum: Str_Range;
BEGIN
   i := 0; found := FALSE; s2 := '';
   STR_UpperCase(sloc,dum,s1,Str_Max);

   WHILE (i < NrNames) AND NOT found DO BEGIN
      i := i+1;
      IF sloc = LogTable[i].logname THEN BEGIN
         found := TRUE;
         s2 := LogTable[i].equiname[1];
      END;
   END;
{
   writeln(sloc,' ',s2);
}
   LogName_Tr := s2;
END {LogName_Tr};

FUNCTION LogName_TranslateEquiNr(CONST s1: String; VAR s2: String;
                                 VAR equi: INTEGER): BOOLEAN;
VAR
   i : INTEGER;
   found : BOOLEAN;
   sloc: STRING(Str_Max);
   dum: Str_Range;
BEGIN
   i := 0; found := FALSE; s2 := '';
   STR_UpperCase(sloc,dum,s1,Str_Max);

   WHILE (i < NrNames) AND NOT found DO BEGIN
      i := i+1;
      IF sloc = LogTable[i].logname THEN BEGIN
         found := TRUE;
         IF equi <= LogTable[i].nrequis THEN BEGIN
            s2 := LogTable[i].equiname[equi];
            IF equi < LogTable[i].nrequis THEN equi := equi+1 ELSE equi := -1
            END
         ELSE BEGIN
            equi := -1;
         END;
      END;
   END;
{
   writeln(sloc,' ',s2);
}
   LogName_TranslateEquiNr := found;
END {LogName_TranslateEquiNr};

FUNCTION LogName_TrEquiNr(CONST s1: String; 
                          VAR equi: INTEGER): String(Logname_MaxLen);
VAR
   i : INTEGER;
   found : BOOLEAN;
   s2 : String(Logname_MaxLen);
   sloc: STRING(Str_Max);
   dum: Str_Range;
BEGIN
   i := 0; found := FALSE; s2 := '';
   STR_UpperCase(sloc,dum,s1,Str_Max);

   WHILE (i < NrNames) AND NOT found DO BEGIN
      i := i+1;
      IF sloc = LogTable[i].logname THEN BEGIN
         found := TRUE;
         IF equi <= LogTable[i].nrequis THEN BEGIN
            s2 := LogTable[i].equiname[equi];
            IF equi < LogTable[i].nrequis THEN equi := equi+1 ELSE equi := -1
            END
         ELSE BEGIN
            equi := -1;
         END;
      END;
   END;
{
   writeln(sloc,' ',s2);
}
   LogName_TrEquiNr := s2;
END {LogName_TrEquiNr};


FUNCTION LogName_FindFile(CONST s1: STRING): String(Logname_Maxlen);
VAR str_name,
    s,
    fout,
    part1,
    part2    : STRING(100);
    found    : BOOLEAN;
    i        : INTEGER;
    dummy : CISAM_Time; 
BEGIN    
   str_name := s1;
   found := FALSE; i:= 0; part1 := ''; part2 := '';
   WHILE  i < length(str_name) DO BEGIN
      i := i+1;
      IF found THEN part2 := part2||str_name[i];
      IF str_name[i] = '/' THEN BEGIN
         found := TRUE;
      END;
      IF NOT found THEN part1 := part1||str_name[i]
   END;
   i := 1; found := FALSE; fout := str_name;
   WHILE NOT found AND (i <> -1) DO BEGIN
      IF LogName_TranslateEquiNr(part1,s,i) THEN BEGIN
         s := s||part2; 
         cisam_revisiondate(s,0,found,dummy);
         IF found THEN fout := s;
         END
      ELSE i := -1;
   END;
   Logname_FindFile := fout

END {LogName_FindFile};
