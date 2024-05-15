[INHERIT('LANGUAGE:LSDOMAINT',
         'GENERAL:LIDOMAINT',
         'LEXICON:CATDEF',
         'GENERAL:LDSTRTOTYPE',
         'GENERAL:LDTYPETOSTR')]

MODULE LDCAT;

FUNCTION LDCAT_MinCat: LIDOMAINT_SyntCat;
VAR cat : LIDOMAINT_SyntCat;
BEGIN
   LoopHoles.Retype(cat,LSDOMAINT_SyntCat) := BADJSUFF;
   LDCAT_MinCat := cat;
END {LDCAT_MinCat};

FUNCTION LDCAT_MaxCat: LIDOMAINT_SyntCat;
VAR cat : LIDOMAINT_SyntCat;
BEGIN
    LoopHoles.Retype(cat,LSDOMAINT_SyntCat) := GLUE;
   LDCAT_MaxCat := cat;
END {LDCAT_MaxCat};

FUNCTION LDCAT_ConvertStrToEnum(
                        VAR Cat     : LIDOMAINT_SyntCat;
                            CatArray: CATDEF_CatArrayType;
                            LenCat  : INTEGER): BOOLEAN;
BEGIN
   LDCAT_ConvertStrToEnum := LDSTRTOTYPE_Cat(CatArray,LenCat,Cat);
END {LDCAT_ConvertStrToEnum};

PROCEDURE LDCAT_ConvertEnumToStr(
                        VAR CatArray: CATDEF_CatArrayType;
                        VAR LenCat  : INTEGER;
                            Cat     : LIDOMAINT_SyntCat);
BEGIN
   LDTYPETOSTR_Cat(CatArray,LenCat,Cat);
END {LDCAT_ConvertEnumToStr};

PROCEDURE LDCAT_LbUb(Cat: LIDOMAINT_SyntCat;
                              VAR lb, ub: INTEGER);
BEGIN
   CASE  LoopHoles.Retype(Cat,LSDOMAINT_SyntCat) OF
   BADJSUFF: BEGIN lb:=1; ub:=10 END;
   BADJ: BEGIN lb:=1; ub:=10 END;
   BADVSUFF: BEGIN lb:=1; ub:=10 END;
   BADV: BEGIN lb:=1; ub:=10 END;
   RADV: BEGIN lb:=1; ub:=10 END;
   ART: BEGIN lb:=1; ub:=10 END;
   BBIGPRO: BEGIN lb:=1; ub:=10 END;
   CONJ: BEGIN lb:=1; ub:=10 END;
   COORD: BEGIN lb:=1; ub:=10 END;
   DEMADJ: BEGIN lb:=1; ub:=10 END;
   DEMPRO: BEGIN lb:=1; ub:=10 END;
   BDET: BEGIN lb:=1; ub:=10 END;
   DIGIT: BEGIN lb:=1; ub:=10 END;
   EC: BEGIN lb:=1; ub:=10 END;
   EN: BEGIN lb:=1; ub:=10 END;
   EMPTY: BEGIN lb:=1; ub:=10 END;
   EXCLAM: BEGIN lb:=1; ub:=10 END;
   BINDEFPRO: BEGIN lb:=1; ub:=10 END;
   NEG: BEGIN lb:=1; ub:=10 END;
   NEGVAR: BEGIN lb:=1; ub:=10 END;
   BNOUNSUFF: BEGIN lb:=1; ub:=10 END;
   BNOUN: BEGIN lb:=1; ub:=10 END;
   NUM: BEGIN lb:=1; ub:=10 END;
   ORDINAL: BEGIN lb:=1; ub:=10 END;
   PART: BEGIN lb:=1; ub:=10 END;
   BPERSPRO: BEGIN lb:=1; ub:=10 END;
   POS: BEGIN lb:=1; ub:=10 END;
   POSVAR: BEGIN lb:=1; ub:=10 END;
   SUBPREP: BEGIN lb:=1; ub:=10 END;
   PREP: BEGIN lb:=1; ub:=10 END;
   BPROPERNOUN: BEGIN lb:=1; ub:=10 END;
   PUNC: BEGIN lb:=1; ub:=10 END;
   PROSENT: BEGIN lb:=1; ub:=10 END;
   Q: BEGIN lb:=1; ub:=10 END;
   RECIPRO: BEGIN lb:=1; ub:=10 END;
   REFLPRO: BEGIN lb:=1; ub:=10 END;
   RELANTPRO: BEGIN lb:=1; ub:=10 END;
   RELPRO: BEGIN lb:=1; ub:=10 END;
   TE: BEGIN lb:=1; ub:=10 END;
   THANAS: BEGIN lb:=1; ub:=10 END;
   BVERBSUFF: BEGIN lb:=1; ub:=10 END;
   BVERB: BEGIN lb:=1; ub:=10 END;
   BWHPRO: BEGIN lb:=1; ub:=10 END;
   SFCAT: BEGIN lb:=1; ub:=10 END;
   PFCAT: BEGIN lb:=1; ub:=10 END;
   END
END {LDCAT_LbUb};
END{LDCAT}.
