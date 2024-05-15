Export(LDCATSETS);
pragma C_include('lidomaint.pf');
pragma C_include('ldcatsets.pf');
PROGRAM LDCATSETS;
WITH LIDOMAINT;
FUNCTION LDCATSETS_UTTERANCE(cat:LIDOMAINT_syntcat):BOOLEAN;
VAR catset:SET OF LIDOMAINT_syntcat;
BEGIN
catset:=[
LICAT91
  ];
IF cat in catset THEN LDCATSETS_UTTERANCE:=TRUE
ELSE LDCATSETS_UTTERANCE:=FALSE
END;
FUNCTION LDCATSETS_TOPCAT(cat:LIDOMAINT_syntcat):BOOLEAN;
VAR catset:SET OF LIDOMAINT_syntcat;
BEGIN
catset:=[
LICAT6
,LICAT16
,LICAT25
,LICAT37
,LICAT52
,LICAT53
,LICAT69
,LICAT82
,LICAT87
,LICAT90
,LICAT91
,LICAT105
,LICAT107
  ];
IF cat in catset THEN LDCATSETS_TOPCAT:=TRUE
ELSE LDCATSETS_TOPCAT:=FALSE
END;
FUNCTION LDCATSETS_LEXCAT(cat:LIDOMAINT_syntcat):BOOLEAN;
VAR catset:SET OF LIDOMAINT_syntcat;
BEGIN
catset:=[
LICAT4
,LICAT14
,LICAT21
,LICAT24
,LICAT30
,LICAT31
,LICAT32
,LICAT33
,LICAT35
,LICAT42
,LICAT116
,LICAT44
,LICAT45
,LICAT50
,LICAT58
,LICAT59
,LICAT60
,LICAT62
,LICAT63
,LICAT65
,LICAT66
,LICAT68
,LICAT77
,LICAT78
,LICAT81
,LICAT83
,LICAT84
,LICAT85
,LICAT86
,LICAT88
,LICAT89
,LICAT105
,LICAT113
,LICAT28
,LICAT79
  ];
IF cat in catset THEN LDCATSETS_LEXCAT:=TRUE
ELSE LDCATSETS_LEXCAT:=FALSE
END;
FUNCTION LDCATSETS_BLEXCAT(cat:LIDOMAINT_syntcat):BOOLEAN;
VAR catset:SET OF LIDOMAINT_syntcat;
BEGIN
catset:=[
LICAT1
,LICAT2
,LICAT11
,LICAT12
,LICAT21
,LICAT27
,LICAT30
,LICAT31
,LICAT32
,LICAT33
,LICAT34
,LICAT41
,LICAT39
,LICAT40
,LICAT42
,LICAT43
,LICAT45
,LICAT47
,LICAT48
,LICAT58
,LICAT59
,LICAT61
,LICAT63
,LICAT68
,LICAT76
,LICAT79
,LICAT78
,LICAT81
,LICAT85
,LICAT102
,LICAT103
,LICAT112
,LICAT60
,LICAT38
,LICAT24
,LICAT83
,LICAT84
,LICAT86
,LICAT88
,LICAT89
  ];
IF cat in catset THEN LDCATSETS_BLEXCAT:=TRUE
ELSE LDCATSETS_BLEXCAT:=FALSE
END;
FUNCTION LDCATSETS_VARCATSET(cat:LIDOMAINT_syntcat):BOOLEAN;
VAR catset:SET OF LIDOMAINT_syntcat;
BEGIN
catset:=[
LICAT92
,LICAT93
,LICAT94
,LICAT96
,LICAT97
,LICAT95
,LICAT98
,LICAT80
,LICAT75
,LICAT23
,LICAT99
,LICAT100
,LICAT101
  ];
IF cat in catset THEN LDCATSETS_VARCATSET:=TRUE
ELSE LDCATSETS_VARCATSET:=FALSE
END;
FUNCTION LDCATSETS_SUFFIXCAT(cat:LIDOMAINT_syntcat):BOOLEAN;
VAR catset:SET OF LIDOMAINT_syntcat;
BEGIN
catset:=[
LICAT1
,LICAT11
,LICAT47
,LICAT102
  ];
IF cat in catset THEN LDCATSETS_SUFFIXCAT:=TRUE
ELSE LDCATSETS_SUFFIXCAT:=FALSE
END;
FUNCTION LDCATSETS_PREFIXCAT(cat:LIDOMAINT_syntcat):BOOLEAN;
VAR catset:SET OF LIDOMAINT_syntcat;
BEGIN
catset:=[
LICAT60
  ];
IF cat in catset THEN LDCATSETS_PREFIXCAT:=TRUE
ELSE LDCATSETS_PREFIXCAT:=FALSE
END;