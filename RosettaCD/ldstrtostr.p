pragma C_include('strings.pf');
Export(ldstrtostr);
pragma C_include('string.pf');
pragma C_include('ldstrtostr.pf');
PROGRAM LDSTRTOSTR;
WITH STRNG, STRINGS;
PROCEDURE LDSTRTOSTR_typeinfo(
typestr:STRING_string;VAR kind:INTEGER;VAR basetype,min,max:STRING_string);
BEGIN
IF STRING_comparechars(typestr,'INDEXTYPE',STRING_max)=0 THEN BEGIN
kind:=1;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'KEYTYPE',STRING_max)=0 THEN BEGIN
kind:=1;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ADVERBIALTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ANTERELATIVEOKTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'CASEASSIGNERTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'COMPLTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ENFORMTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ENFORMATIONTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'FOUNDTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'GENERALIZEDTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'GENITIVETYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'HOPTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'INDOBJFOUNDTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ITERATIONTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'NFORMTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'OBJFOUNDTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'PERSONALTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'POSSADVTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'POSSNIETNPTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'POSSGENITYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'POSSPREDTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'POSSRFORMTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'PROSUBJECTTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'PREADVOKTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'QSTATUSTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'RADVTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'REDUCEDTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'RETROTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'SFORMATIONTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'SINTRODUCERTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'SOTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'STRANDEDTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'TEMPORALTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'VMATRIXHEADTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'VRCOMPLTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ZELFTYPE',STRING_max)=0 THEN BEGIN
kind:=2;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ADJADVFORMTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ADJSUBCTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ADJUNCTTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ADJUSETYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ADVSUBCTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'AFFIXTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'AKTIONSARTTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ANIMATETYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ANTECEDENTTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ASPECTTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'CASETYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'CLASSTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'COMPARATIVETYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'CONTROLLERTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'COORDKINDTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'COORDPATTERNTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'COORDTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'DEFTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'DEIXISTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'DIMFORMTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'DISTRITYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'EFORMATIONTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ENOMINALISEDTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'EORENFORMTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'FINITENESSTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'GELIEVETYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'GENDERTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'GENERICTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'HUMANTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'INFTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'IPPTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'KINDSTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'MODUSTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'MOODTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'NOUNSUBCTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'NPHEADTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'NUMBERTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'PERFAUXTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'PLURALFORMTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'POLARITYTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'POSSCOMATYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'POSTFORMTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'PREPSUBCTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'PREPTYPETYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'REFLEXIVETYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'SENTTYPETYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'SEXTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'SPECQTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'SUPERLATIVETYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'SYNPATTERNTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'SYNTQUANTTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'TENSETYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'THANASCOMPLTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'THETAADJTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'THETAADVTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'THETANPTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'THETAPPTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'THETAVPTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'TIMEADVCLASSTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'VERBRAISERTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'VERBSUBCTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'VOICETYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'VSTATUSTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'XPMOODTYPE',STRING_max)=0 THEN BEGIN
kind:=3;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'CONJCLASSTYPE',STRING_max)=0 THEN BEGIN
kind:=4;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'PERSONTYPE',STRING_max)=0 THEN BEGIN
kind:=4;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'PRONPERSONTYPE',STRING_max)=0 THEN BEGIN
kind:=4;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'VALUETYPE',STRING_max)=0 THEN BEGIN
kind:=4;
STRING_constantempty(basetype);
END;
IF STRING_comparechars(typestr,'ADJSUBCSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'adjsubctype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'coloradj',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'otheradj',STRING_max);
END;
IF STRING_comparechars(typestr,'ADJSUBCEFFSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'adjsubctype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'coloradj',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'otheradj',STRING_max);
END;
IF STRING_comparechars(typestr,'ADJUNCTSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'adjuncttype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'ResAP',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'ResNP',STRING_max);
END;
IF STRING_comparechars(typestr,'ADJUSESETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'adjusetype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'attributive',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'nominalised',STRING_max);
END;
IF STRING_comparechars(typestr,'ADJUSEEFFSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'adjusetype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'attributive',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'nominalised',STRING_max);
END;
IF STRING_comparechars(typestr,'ADVSUBCSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'advsubctype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'SentAdv',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'OtherAdv',STRING_max);
END;
IF STRING_comparechars(typestr,'ADVSUBCEFFSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'advsubctype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'SentAdv',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'OtherAdv',STRING_max);
END;
IF STRING_comparechars(typestr,'AKTIONSARTEFFSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'aktionsarttype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'stative',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'achievement',STRING_max);
END;
IF STRING_comparechars(typestr,'CASESETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'casetype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'nominative',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'Rcase',STRING_max);
END;
IF STRING_comparechars(typestr,'CLASSSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'classtype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'stativeclass',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'iterativeclass',STRING_max);
END;
IF STRING_comparechars(typestr,'COMPARATIVESETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'comparativetype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'erComp',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'NoComp',STRING_max);
END;
IF STRING_comparechars(typestr,'CONJCLASSSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'conjclasstype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'0',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'16',STRING_max);
END;
IF STRING_comparechars(typestr,'COORDKINDSTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'coordkindtype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'simple',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'correlative2',STRING_max);
END;
IF STRING_comparechars(typestr,'COORDPATTERNSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'coordpatterntype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'npc',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'Slaten',STRING_max);
END;
IF STRING_comparechars(typestr,'DIMFORMSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'dimformtype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'jeDim',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'noDim',STRING_max);
END;
IF STRING_comparechars(typestr,'DISTRISETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'distritype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'initial',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'final',STRING_max);
END;
IF STRING_comparechars(typestr,'GENDERSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'gendertype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'mascgender',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'omegagender',STRING_max);
END;
IF STRING_comparechars(typestr,'KINDSEFFSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'kindstype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'Xk',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'XPQk',STRING_max);
END;
IF STRING_comparechars(typestr,'NOUNSUBCSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'nounsubctype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'vocativenoun',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'othernoun',STRING_max);
END;
IF STRING_comparechars(typestr,'NOUNSUBCEFFSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'nounsubctype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'vocativenoun',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'othernoun',STRING_max);
END;
IF STRING_comparechars(typestr,'NUMBERSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'numbertype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'singular',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'omeganumber',STRING_max);
END;
IF STRING_comparechars(typestr,'PERFAUXSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'perfauxtype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'isaux',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'hebaux',STRING_max);
END;
IF STRING_comparechars(typestr,'PERSONSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'persontype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'0',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'6',STRING_max);
END;
IF STRING_comparechars(typestr,'PLURALFORMSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'pluralformtype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'enPlural',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'enITOePlural',STRING_max);
END;
IF STRING_comparechars(typestr,'POLARITYEFFSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'polaritytype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'pospol',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'omegapol',STRING_max);
END;
IF STRING_comparechars(typestr,'POSSCOMASETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'posscomatype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'count',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'mass',STRING_max);
END;
IF STRING_comparechars(typestr,'PREPSUBCSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'prepsubctype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'loc',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'other',STRING_max);
END;
IF STRING_comparechars(typestr,'PREPSUBCEFFSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'prepsubctype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'loc',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'other',STRING_max);
END;
IF STRING_comparechars(typestr,'SEXSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'sextype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'masculine',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'feminine',STRING_max);
END;
IF STRING_comparechars(typestr,'SUPERLATIVESETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'superlativetype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'stSup',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'noSup',STRING_max);
END;
IF STRING_comparechars(typestr,'SYNPATTERNSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'synpatterntype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'synnoVPargs',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'vpid200',STRING_max);
END;
IF STRING_comparechars(typestr,'SYNPATTERNEFFSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'synpatterntype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'synnoVPargs',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'vpid200',STRING_max);
END;
IF STRING_comparechars(typestr,'VERBSUBCSETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'verbsubctype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'Mainverb',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'wordenaux',STRING_max);
END;
IF STRING_comparechars(typestr,'VOICESETTYPE',STRING_max)=0 THEN BEGIN
kind:=5;
STRING_constantempty(basetype);
STRING_appendchars(basetype,basetype,'voicetype',STRING_max);
STRING_constantempty(min);
STRING_appendchars(min,min,'Active',STRING_max);
STRING_constantempty(max);
STRING_appendchars(max,max,'Omegavoice',STRING_max);
END;
END;
FUNCTION LDSTRTOSTR_CATtoRECTYPE(
    cat:STRING_string):STRING_string;
VAR result:STRING_string;
BEGIN
STRING_constantempty(result);
IF (STRING_comparechars(cat,'BADJSUFF',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BADJrecord',STRING_max);
IF (STRING_comparechars(cat,'BADJ',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BADJrecord',STRING_max);
IF (STRING_comparechars(cat,'SUBADJ',STRING_max)=0) THEN
     STRING_appendchars(result,result,'SUBADJrecord',STRING_max);
IF (STRING_comparechars(cat,'ADJ',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADJrecord',STRING_max);
IF (STRING_comparechars(cat,'ALLOADJ',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADJrecord',STRING_max);
IF (STRING_comparechars(cat,'ADJP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADJPrecord',STRING_max);
IF (STRING_comparechars(cat,'ADJPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADJPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'ADJPFORMULA',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADJPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'OPENADJPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADJPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'CLOSEDADJPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADJPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'BADVSUFF',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BADVrecord',STRING_max);
IF (STRING_comparechars(cat,'BADV',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BADVrecord',STRING_max);
IF (STRING_comparechars(cat,'SUBADV',STRING_max)=0) THEN
     STRING_appendchars(result,result,'SUBADVrecord',STRING_max);
IF (STRING_comparechars(cat,'ADV',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADVrecord',STRING_max);
IF (STRING_comparechars(cat,'ALLOADV',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADVrecord',STRING_max);
IF (STRING_comparechars(cat,'ADVP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADVPrecord',STRING_max);
IF (STRING_comparechars(cat,'ADVPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADVPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'ADVPFORMULA',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADVPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'OPENADVPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADVPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'CLOSEDADVPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADVPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'RADV',STRING_max)=0) THEN
     STRING_appendchars(result,result,'RADVrecord',STRING_max);
IF (STRING_comparechars(cat,'RADVP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'RADVPrecord',STRING_max);
IF (STRING_comparechars(cat,'ADVPVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADVPVARrecord',STRING_max);
IF (STRING_comparechars(cat,'ART',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ARTrecord',STRING_max);
IF (STRING_comparechars(cat,'ASP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ASPrecord',STRING_max);
IF (STRING_comparechars(cat,'BIGPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BIGPROrecord',STRING_max);
IF (STRING_comparechars(cat,'BBIGPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BPERSPROrecord',STRING_max);
IF (STRING_comparechars(cat,'CARD',STRING_max)=0) THEN
     STRING_appendchars(result,result,'CARDrecord',STRING_max);
IF (STRING_comparechars(cat,'CLAUSE',STRING_max)=0) THEN
     STRING_appendchars(result,result,'CLAUSErecord',STRING_max);
IF (STRING_comparechars(cat,'CONJ',STRING_max)=0) THEN
     STRING_appendchars(result,result,'CONJrecord',STRING_max);
IF (STRING_comparechars(cat,'COORD',STRING_max)=0) THEN
     STRING_appendchars(result,result,'COORDrecord',STRING_max);
IF (STRING_comparechars(cat,'DEMADJ',STRING_max)=0) THEN
     STRING_appendchars(result,result,'DEMADJrecord',STRING_max);
IF (STRING_comparechars(cat,'DEMPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'DEMPROrecord',STRING_max);
IF (STRING_comparechars(cat,'BDET',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BDETrecord',STRING_max);
IF (STRING_comparechars(cat,'DET',STRING_max)=0) THEN
     STRING_appendchars(result,result,'DETrecord',STRING_max);
IF (STRING_comparechars(cat,'ALLODET',STRING_max)=0) THEN
     STRING_appendchars(result,result,'DETrecord',STRING_max);
IF (STRING_comparechars(cat,'DETP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'DETPrecord',STRING_max);
IF (STRING_comparechars(cat,'DIGIT',STRING_max)=0) THEN
     STRING_appendchars(result,result,'DIGITrecord',STRING_max);
IF (STRING_comparechars(cat,'EC',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ECrecord',STRING_max);
IF (STRING_comparechars(cat,'EN',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ENrecord',STRING_max);
IF (STRING_comparechars(cat,'EMPTY',STRING_max)=0) THEN
     STRING_appendchars(result,result,'EMPTYrecord',STRING_max);
IF (STRING_comparechars(cat,'EXCLAM',STRING_max)=0) THEN
     STRING_appendchars(result,result,'EXCLAMrecord',STRING_max);
IF (STRING_comparechars(cat,'BINDEFPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BINDEFPROrecord',STRING_max);
IF (STRING_comparechars(cat,'INDEFPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'INDEFPROrecord',STRING_max);
IF (STRING_comparechars(cat,'NEG',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NEGrecord',STRING_max);
IF (STRING_comparechars(cat,'NEGVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NEGrecord',STRING_max);
IF (STRING_comparechars(cat,'BNOUNSUFF',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BNOUNrecord',STRING_max);
IF (STRING_comparechars(cat,'BNOUN',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BNOUNrecord',STRING_max);
IF (STRING_comparechars(cat,'SUBNOUN',STRING_max)=0) THEN
     STRING_appendchars(result,result,'SUBNOUNrecord',STRING_max);
IF (STRING_comparechars(cat,'NOUN',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NOUNrecord',STRING_max);
IF (STRING_comparechars(cat,'ALLONOUN',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NOUNrecord',STRING_max);
IF (STRING_comparechars(cat,'CN',STRING_max)=0) THEN
     STRING_appendchars(result,result,'CNrecord',STRING_max);
IF (STRING_comparechars(cat,'NP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NPrecord',STRING_max);
IF (STRING_comparechars(cat,'NPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'NPFORMULA',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'OPENNPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'CLOSEDNPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'NUM',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NUMrecord',STRING_max);
IF (STRING_comparechars(cat,'ORDINAL',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ORDINALrecord',STRING_max);
IF (STRING_comparechars(cat,'PART',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PARTICLErecord',STRING_max);
IF (STRING_comparechars(cat,'BPERSPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BPERSPROrecord',STRING_max);
IF (STRING_comparechars(cat,'PERSPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PERSPROrecord',STRING_max);
IF (STRING_comparechars(cat,'POS',STRING_max)=0) THEN
     STRING_appendchars(result,result,'POSrecord',STRING_max);
IF (STRING_comparechars(cat,'POSVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'POSrecord',STRING_max);
IF (STRING_comparechars(cat,'POSSADJ',STRING_max)=0) THEN
     STRING_appendchars(result,result,'POSSADJrecord',STRING_max);
IF (STRING_comparechars(cat,'POSSPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'POSSPROrecord',STRING_max);
IF (STRING_comparechars(cat,'SUBPREP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PREPrecord',STRING_max);
IF (STRING_comparechars(cat,'PREP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PREPrecord',STRING_max);
IF (STRING_comparechars(cat,'PREPP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PREPPrecord',STRING_max);
IF (STRING_comparechars(cat,'PREPPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PREPPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'PREPPFORMULA',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PREPPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'OPENPREPPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PREPPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'CLOSEDPREPPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PREPPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'VARPREPP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PREPPrecord',STRING_max);
IF (STRING_comparechars(cat,'PREPPVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PREPPVARrecord',STRING_max);
IF (STRING_comparechars(cat,'BPROPERNOUN',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BPROPERNOUNrecord',STRING_max);
IF (STRING_comparechars(cat,'PROPERNOUN',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PROPERNOUNrecord',STRING_max);
IF (STRING_comparechars(cat,'PUNC',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PUNCrecord',STRING_max);
IF (STRING_comparechars(cat,'PROSENT',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PROSENTrecord',STRING_max);
IF (STRING_comparechars(cat,'PROSENTVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PROSENTVARrecord',STRING_max);
IF (STRING_comparechars(cat,'Q',STRING_max)=0) THEN
     STRING_appendchars(result,result,'Qrecord',STRING_max);
IF (STRING_comparechars(cat,'QP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'QPrecord',STRING_max);
IF (STRING_comparechars(cat,'RECIPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'RECIPROrecord',STRING_max);
IF (STRING_comparechars(cat,'REFLPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'REFLPROrecord',STRING_max);
IF (STRING_comparechars(cat,'RELANTPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'RELANTPROrecord',STRING_max);
IF (STRING_comparechars(cat,'RELPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'RELPROrecord',STRING_max);
IF (STRING_comparechars(cat,'SENTENCE',STRING_max)=0) THEN
     STRING_appendchars(result,result,'SENTENCErecord',STRING_max);
IF (STRING_comparechars(cat,'TE',STRING_max)=0) THEN
     STRING_appendchars(result,result,'TErecord',STRING_max);
IF (STRING_comparechars(cat,'THANAS',STRING_max)=0) THEN
     STRING_appendchars(result,result,'THANASrecord',STRING_max);
IF (STRING_comparechars(cat,'THANP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'THANPrecord',STRING_max);
IF (STRING_comparechars(cat,'UTT',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NOrecord',STRING_max);
IF (STRING_comparechars(cat,'ADJPPROPVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADJPPROPVARrecord',STRING_max);
IF (STRING_comparechars(cat,'ADVPPROPVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'ADVPPROPVARrecord',STRING_max);
IF (STRING_comparechars(cat,'CLAUSEVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'CLAUSEVARrecord',STRING_max);
IF (STRING_comparechars(cat,'CNVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'CNVARrecord',STRING_max);
IF (STRING_comparechars(cat,'NPPROPVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NPPROPVARrecord',STRING_max);
IF (STRING_comparechars(cat,'PREPPPROPVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'PREPPPROPVARrecord',STRING_max);
IF (STRING_comparechars(cat,'NPVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'NPVARrecord',STRING_max);
IF (STRING_comparechars(cat,'SENTENCEVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'SENTENCEVARrecord',STRING_max);
IF (STRING_comparechars(cat,'EMPTYVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'EMPTYVARrecord',STRING_max);
IF (STRING_comparechars(cat,'VERBPPROPVAR',STRING_max)=0) THEN
     STRING_appendchars(result,result,'VERBPPROPVARrecord',STRING_max);
IF (STRING_comparechars(cat,'BVERBSUFF',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BVERBrecord',STRING_max);
IF (STRING_comparechars(cat,'BVERB',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BVERBrecord',STRING_max);
IF (STRING_comparechars(cat,'SUBVERB',STRING_max)=0) THEN
     STRING_appendchars(result,result,'SUBVERBrecord',STRING_max);
IF (STRING_comparechars(cat,'VERB',STRING_max)=0) THEN
     STRING_appendchars(result,result,'VERBrecord',STRING_max);
IF (STRING_comparechars(cat,'ALLOVERB',STRING_max)=0) THEN
     STRING_appendchars(result,result,'VERBrecord',STRING_max);
IF (STRING_comparechars(cat,'VERBP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'VERBPrecord',STRING_max);
IF (STRING_comparechars(cat,'VERBPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'VERBPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'VERBPFORMULA',STRING_max)=0) THEN
     STRING_appendchars(result,result,'VERBPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'OPENVERBPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'VERBPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'CLOSEDVERBPPROP',STRING_max)=0) THEN
     STRING_appendchars(result,result,'VERBPPROPrecord',STRING_max);
IF (STRING_comparechars(cat,'BWHPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'BWHPROrecord',STRING_max);
IF (STRING_comparechars(cat,'WHPRO',STRING_max)=0) THEN
     STRING_appendchars(result,result,'WHPROrecord',STRING_max);
IF (STRING_comparechars(cat,'SFCAT',STRING_max)=0) THEN
     STRING_appendchars(result,result,'xxkeyrecord',STRING_max);
IF (STRING_comparechars(cat,'PFCAT',STRING_max)=0) THEN
     STRING_appendchars(result,result,'xxkeyrecord',STRING_max);
IF (STRING_comparechars(cat,'GLUE',STRING_max)=0) THEN
     STRING_appendchars(result,result,'xxemptyrecord',STRING_max);
LDSTRTOSTR_CATtoRECTYPE:=result
END;
