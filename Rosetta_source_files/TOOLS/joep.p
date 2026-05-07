pragma C_Include('unix/source/cisam.pf');


PROGRAM JOEP;
WITH
   CISAM, LOOPHOLES;


TYPE
   StrToMKey_RecordDef = RECORD
                               StrKey : INTEGER;
                         END;


VAR
   MkeyDict : CISAM_FileType;
   MkeyRec  : StrToMkey_RecordDef;
   adres    : INTEGER;
   grootte  : INTEGER;


BEGIN    
   MkeyDict := CISAM_initfile('bmkeydef', 8, 
               Adr(Mkeyrec), SizeOf(Mkeyrec), CISAM_indexed);
   adres := Adr(Mkeyrec.strkey)-Adr(Mkeyrec);
   grootte := SizeOf(Mkeyrec.strkey);

   CISAM_DefineKey(MkeyDict, adres, grootte
               ,CISAM_Value, CISAM_NoDuplicate, CISAM_Up);



   writeln('open ',ord(CISAM_OwnStatus), ' ',ord(CISAM_IntegerStatus),
           ' adres ', adres,' grootte ', grootte);

   CISAM_Open(MkeyDict, CISAM_out, CISAM_New);

   writeln('open ',ord(CISAM_OwnStatus), ' ',ord(CISAM_IntegerStatus),
           ' adres ', adres,' grootte ', grootte);

END {joep}.
