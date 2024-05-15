EXPORT(surfrules);
pragma C_include('listree.pf');
pragma C_include('lsauxdom.pf');
pragma C_include('lidomaint.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('lssurfquo.pf');
pragma C_include('maket.pf');
pragma C_include('copyt.pf');
pragma C_include('strtokey.pf');
pragma C_include('string.pf');
pragma C_include('surfrules.pf');
pragma C_include('lsstree.pf');
pragma C_include('liprims.pf');
PROGRAM surfrules;
WITH listree,lsauxdom,lidomaint,lsdomaint,lssurfquo,
maket,copyt,strtokey,strng,lsstree,liprims;
VAR top:LSSTREE_pStree;litop:LISTREE_pstree;
    synrel:LSDOMAINT_synrel;
function auxkey(strkey:STRING_string):INTEGER;
VAR int:INTEGER;
begin
STRtoKey_getSkeyHash(strkey,int);
auxkey:=int end;
PACKAGE UTTpack: [UTTrule];

PROCEDURE UTTrule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
END;
1 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.senttype = mainclause)
);globcond: BEGIN  BEGIN
SYNREL := head;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := modrel;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus(b^.ls^.PUNCfield^.key = auxkey('kommaPUNCkey')

);globcond: BEGIN  BEGIN
SYNREL := puncrel;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(UTT);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
END
END; END;
END;
END;{package}
PACKAGE Vcomplexpack: [Vcomplexrule];
(*
teV; 1,2 te komen
partteV 3,4 op te bellen
VV 5,6 wilde opbellen; wilde bellen; willen bellen;
probeerde op te bellen; probeerde te bellen
auxV 7,8 heeft/wordt/is gebeld; hebben/zijn/worden opgebeld
VV (komen wou) 9,10 
auxV (zat te werken) 11,12
auxV (heeft zitten werken) 13,14
auxV [aan het werken] is geweest) 15,16
aan het V 17,18,19
(het bos is) ingereden 20,21,22
(het bos probeerde) in te rijden 20,23
*)
VAR
adjunctsvar : LSDOMAINT_adjunctSETtype;
reqvar : LSDOMAINT_polarityEFFSETtype;
conjclassesvar : LSDOMAINT_conjclasssettype;
particlevar : LSDOMAINT_keytype;
numbervar : LSDOMAINT_numbertype;
personsvar : LSDOMAINT_personsettype;
eORenFormvar : LSDOMAINT_eorenformtype;
modusvar : LSDOMAINT_modustype;
tensevar : LSDOMAINT_tensetype;
possvoicesvar : LSDOMAINT_voicesettype;
reflexivityvar : LSDOMAINT_reflexivetype;
synvpsvar : LSDOMAINT_synpatternsettype;
synvpefsvar2 : LSDOMAINT_synpatternEFFSETtype;
thetavpvar : LSDOMAINT_thetavptype;
CaseAssignervar : LSDOMAINT_caseassignertype;
subcvar : LSDOMAINT_verbsubctype;
foundauxesvar : LSDOMAINT_verbsubcsettype;
perfauxsvar : LSDOMAINT_perfauxsettype;
prepkey1var : LSDOMAINT_keytype;
prepkey2var : LSDOMAINT_keytype;
controllervar : LSDOMAINT_controllertype;
verbraiservar : LSDOMAINT_verbraisertype;
IPPvar : LSDOMAINT_ipptype;
statusvar : LSDOMAINT_vstatustype;
classesvar : LSDOMAINT_classSETtype;
partkeyvar : LSDOMAINT_keytype;
reqvar2 : LSDOMAINT_polarityEFFSETtype;
PROCEDURE Vcomplexrule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
 
(*moved to lssurfquo:FUNCTION perfauxok(pa: LSDOMAINT_perfauxSETtype):BOOLEAN;
BEGIN
perfauxok :=
(
(passive IN possvoicesvar) OR
(
((NOT (hebaux IN pa)) OR (hebbenaux IN foundauxesvar)) AND
((NOT (isaux IN pa)) OR (zijnaux IN foundauxesvar)) 
)
) AND
(
(NOT (passive IN possvoicesvar)) OR
(
((NOT (hebaux IN pa)) OR 
(foundauxesvar * [hebbenaux, zijnaux, wordenaux] <> [])
) AND
((NOT (isaux IN pa)) OR 
(foundauxesvar * [zijnaux, wordenaux] <> [])
)
)
);*)
(*
It checks whether the auxiliary combined with some verb is compatible with it;
If the verb cannot in passive, then the auxiliary must be hebben, if it 
requires hebben as a perfaux; zijn, if it requires zijn as a perfaux
If the verb can occur in passive, then the auxiliary must be
hebben, zijn or worden if it requires hebben as a perfaux; zijn or worden
if it requires zijn as a perfaux.
Due to the extremely primitive programming language used, this condition is 
totally unreadable.
*)
(*END;*) (*perfauxok*)
 
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
adjunctsvar := [];
reqvar := [pospol, negpol ,omegapol];
conjclassesvar := [3];
particlevar := 0;
numbervar := omeganumber;
personsvar := [];
eORenFormvar := NoForm;
modusvar := infinitive;
tensevar := omegatense;
possvoicesvar := [active,passive,DoorActive];
reflexivityvar := notreflexive;
synvpsvar := [];
synvpefsvar2 := [];
thetavpvar := omegathetavp;
CaseAssignervar := true;
subcvar := mainverb;
foundauxesvar := [];
perfauxsvar := [hebaux];
prepkey1var := 0;
prepkey2var := 0;
controllervar := none;
verbraiservar := noVR;
IPPvar := NOIPP;
statusvar := bareV;
classesvar := [];
partkeyvar := 0;
reqvar2 := [pospol, negpol, omegapol];
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := terel
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.status = bareV ) AND
(b^.ls^.VERBfield^.modus = infinitive)
);globcond: BEGIN  BEGIN
SYNREL := head;
reqvar := b^.ls^.VERBfield^.req; 
conjclassesvar := b^.ls^.VERBfield^.conjclasses;
particlevar := b^.ls^.VERBfield^.particle;
numbervar := b^.ls^.VERBfield^.number;
personsvar := b^.ls^.VERBfield^.persons;
eORenFormvar := b^.ls^.VERBfield^.eORenForm;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
synvpsvar := b^.ls^.VERBfield^.synvps;
thetavpvar := b^.ls^.VERBfield^.thetavp;
CaseAssignervar := b^.ls^.VERBfield^.CaseAssigner;
subcvar := b^.ls^.VERBfield^.subc;
foundauxesvar := b^.ls^.VERBfield^.foundauxes;
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
prepkey1var := b^.ls^.VERBfield^.prepkey1;
prepkey2var := b^.ls^.VERBfield^.prepkey2;
controllervar := b^.ls^.VERBfield^.controller;
verbraiservar := b^.ls^.VERBfield^.Verbraiser;
IPPvar := b^.ls^.VERBfield^.IPP;
classesvar := b^.ls^.VERBfield^.classes;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
statusvar := teV;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := partrel;
partkeyvar := b^.ls^.PARTfield^.key
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.status = teV) AND
(b^.ls^.VERBfield^.modus = infinitive)
);globcond: BEGIN  BEGIN
SYNREL := head;
reqvar := b^.ls^.VERBfield^.req; 
conjclassesvar := b^.ls^.VERBfield^.conjclasses;
particlevar := b^.ls^.VERBfield^.particle;
numbervar := b^.ls^.VERBfield^.number;
personsvar := b^.ls^.VERBfield^.persons;
eORenFormvar := b^.ls^.VERBfield^.eORenForm;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
synvpsvar := b^.ls^.VERBfield^.synvps;
thetavpvar := b^.ls^.VERBfield^.thetavp;
CaseAssignervar := b^.ls^.VERBfield^.CaseAssigner;
subcvar := b^.ls^.VERBfield^.subc;
foundauxesvar := b^.ls^.VERBfield^.foundauxes;
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
prepkey1var := b^.ls^.VERBfield^.prepkey1;
prepkey2var := b^.ls^.VERBfield^.prepkey2;
controllervar := b^.ls^.VERBfield^.controller;
verbraiservar := b^.ls^.VERBfield^.Verbraiser;
IPPvar := b^.ls^.VERBfield^.IPP;
classesvar := b^.ls^.VERBfield^.classes;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
statusvar := partteV;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.status IN [bareV, teV]) AND
(b^.ls^.VERBfield^.subc IN [Mainverb, Modalverb, latenverb]) AND
(b^.ls^.VERBfield^.Verbraiser in [optionalVR, obligatoryVR]) AND
((b^.ls^.VERBfield^.modus <> pastpart) OR
(b^.ls^.VERBfield^.IPP <> OBLIGATORYIPP)
) AND
NOT (b^.ls^.VERBfield^.modus IN [prespart, imperative])
);globcond: BEGIN  BEGIN
SYNREL := head;
reqvar := b^.ls^.VERBfield^.req; 
conjclassesvar := b^.ls^.VERBfield^.conjclasses;
numbervar := b^.ls^.VERBfield^.number;
personsvar := b^.ls^.VERBfield^.persons;
eORenFormvar := b^.ls^.VERBfield^.eORenForm;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
synvpsvar := b^.ls^.VERBfield^.synvps;
thetavpvar := b^.ls^.VERBfield^.thetavp;
CaseAssignervar := b^.ls^.VERBfield^.CaseAssigner;
subcvar := b^.ls^.VERBfield^.subc;
foundauxesvar := [];
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
controllervar := b^.ls^.VERBfield^.controller;
verbraiservar := b^.ls^.VERBfield^.Verbraiser;
IPPvar := b^.ls^.VERBfield^.IPP;
classesvar := b^.ls^.VERBfield^.classes;
IF b^.ls^.VERBfield^.status in [teV]
THEN statusvar := teVV
ELSE statusvar := VV;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.VERBfield^.modus = infinitive
);globcond: BEGIN  BEGIN
SYNREL := adjoinrel;
reqvar2 := b^.ls^.VERBfield^.req;
IF (NOT(b^.ls^.VERBfield^.status IN [partV, partteV]))
THEN particlevar := b^.ls^.VERBfield^.particle;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
prepkey1var := b^.ls^.VERBfield^.prepkey1;
prepkey2var := b^.ls^.VERBfield^.prepkey2;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
IF ( b^.ls^.VERBfield^.synvpefs2 <> [])
THEN synvpefsvar2 := b^.ls^.VERBfield^.synvpefs2
ELSE synvpefsvar2 := b^.ls^.VERBfield^.synvps;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.status IN [bareV, teV]) AND
(b^.ls^.VERBfield^.subc IN [hebbenaux, zijnaux, wordenaux] ) AND
(NOT(b^.ls^.VERBfield^.modus IN [imperative, pastpart, prespart]))
);globcond: BEGIN  BEGIN
SYNREL := auxrel;
conjclassesvar := b^.ls^.VERBfield^.conjclasses;
numbervar := b^.ls^.VERBfield^.number;
personsvar := b^.ls^.VERBfield^.persons;
eORenFormvar := b^.ls^.VERBfield^.eORenForm;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
foundauxesvar := b^.ls^.VERBfield^.foundauxes + 
[b^.ls^.VERBfield^.subc];
IF b^.ls^.VERBfield^.status IN [teV] 
THEN statusvar := teAuxV
ELSE statusvar := AuxV;
END
END; END;
8: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.modus = pastpart) AND
(b^.ls^.VERBfield^.eORenform = NoForm) AND
(b^.ls^.VERBfield^.subc <> zijnaux)
);globcond: BEGIN  BEGIN
SYNREL := head;
reqvar := b^.ls^.VERBfield^.req; 
possvoicesvar := b^.ls^.VERBfield^.possvoices;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
synvpsvar := b^.ls^.VERBfield^.synvps;
thetavpvar := b^.ls^.VERBfield^.thetavp;
CaseAssignervar := b^.ls^.VERBfield^.CaseAssigner;
subcvar := b^.ls^.VERBfield^.subc;
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
prepkey1var := b^.ls^.VERBfield^.prepkey1;
prepkey2var := b^.ls^.VERBfield^.prepkey2;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
controllervar := b^.ls^.VERBfield^.controller;
verbraiservar := b^.ls^.VERBfield^.Verbraiser;
IPPvar := b^.ls^.VERBfield^.IPP;
classesvar := b^.ls^.VERBfield^.classes;
IF (NOT(b^.ls^.VERBfield^.status IN [partV]))
THEN particlevar := b^.ls^.VERBfield^.particle;
END
END; END;
9: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.modus = infinitive) AND
(b^.ls^.VERBfield^.status IN [ bareV, partV, prepV]) AND
( (NOT (b^.ls^.VERBfield^.status =bareV)) OR
(b^.ls^.VERBfield^.particle = 0)
)
);globcond: BEGIN  BEGIN
SYNREL := adjoinrel;
reqvar2:= b^.ls^.VERBfield^.req;
IF (NOT(b^.ls^.VERBfield^.status IN [partV ]))
THEN particlevar := b^.ls^.VERBfield^.particle;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
prepkey1var := b^.ls^.VERBfield^.prepkey1;
prepkey2var := b^.ls^.VERBfield^.prepkey2;
synvpefsvar2 := b^.ls^.VERBfield^.synvps;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
END
END; END;
10: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.subc = modalverb) AND 
(b^.ls^.VERBfield^.modus = indicative)
);globcond: BEGIN  BEGIN
SYNREL := head;
reqvar := b^.ls^.VERBfield^.req; 
conjclassesvar := b^.ls^.VERBfield^.conjclasses;
numbervar := b^.ls^.VERBfield^.number;
personsvar := b^.ls^.VERBfield^.persons;
eORenFormvar := b^.ls^.VERBfield^.eORenForm;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
synvpsvar := b^.ls^.VERBfield^.synvps;
thetavpvar := b^.ls^.VERBfield^.thetavp;
CaseAssignervar := b^.ls^.VERBfield^.CaseAssigner;
subcvar := b^.ls^.VERBfield^.subc;
foundauxesvar := [];
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
controllervar := b^.ls^.VERBfield^.controller;
verbraiservar := b^.ls^.VERBfield^.Verbraiser;
IPPvar := b^.ls^.VERBfield^.IPP;
classesvar := b^.ls^.VERBfield^.classes;
statusvar := VV;
END
END; END;
11: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.subc = progaux) AND
(b^.ls^.VERBfield^.status IN [bareV, teV]) AND
(NOT(b^.ls^.VERBfield^.modus IN [imperative, prespart, pastpart]))
);globcond: BEGIN  BEGIN
SYNREL := progauxrel;
reqvar := b^.ls^.VERBfield^.req; 
conjclassesvar := b^.ls^.VERBfield^.conjclasses;
numbervar := b^.ls^.VERBfield^.number;
personsvar := b^.ls^.VERBfield^.persons;
eORenFormvar := b^.ls^.VERBfield^.eORenForm;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
subcvar := b^.ls^.VERBfield^.subc;
foundauxesvar := [progaux];
IF b^.ls^.VERBfield^.status in [teV]
THEN statusvar := teAUXV
ELSE statusvar := auxV;
END
END; END;
12: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.status IN [teV, partteV, prepteV, teVV])
);globcond: BEGIN  BEGIN
SYNREL := adjoinrel;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
synvpsvar := b^.ls^.VERBfield^.synvps;
thetavpvar := b^.ls^.VERBfield^.thetavp;
CaseAssignervar := b^.ls^.VERBfield^.CaseAssigner;
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
prepkey1var := b^.ls^.VERBfield^.prepkey1;
prepkey2var := b^.ls^.VERBfield^.prepkey2;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
controllervar := b^.ls^.VERBfield^.controller;
verbraiservar := b^.ls^.VERBfield^.Verbraiser;
IPPvar := b^.ls^.VERBfield^.IPP;
classesvar := b^.ls^.VERBfield^.classes;
IF ( b^.ls^.VERBfield^.synvpefs2 <> [])
THEN synvpefsvar2 := b^.ls^.VERBfield^.synvpefs2;
reqvar2 := b^.ls^.VERBfield^.req; 
IF (NOT(b^.ls^.VERBfield^.status IN [partteV]))
THEN particlevar := b^.ls^.VERBfield^.particle;
END
END; END;
13: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.subc IN [hebbenaux, zijnaux]) AND
(b^.ls^.VERBfield^.status IN [bareV, teV]) AND
(NOT(b^.ls^.VERBfield^.modus IN [imperative, pastpart, prespart]))
);globcond: BEGIN  BEGIN
SYNREL := auxrel;
conjclassesvar := b^.ls^.VERBfield^.conjclasses;
numbervar := b^.ls^.VERBfield^.number;
personsvar := b^.ls^.VERBfield^.persons;
eORenFormvar := b^.ls^.VERBfield^.eORenForm;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
foundauxesvar := [b^.ls^.VERBfield^.subc];
IF b^.ls^.VERBfield^.status in [teV]
THEN statusvar := teAuxV
ELSE statusvar := AuxV;
END
END; END;
14: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.status in [VV, auxV]) AND
(b^.ls^.VERBfield^.modus = infinitive)
);globcond: BEGIN  BEGIN
SYNREL := head;
reqvar := b^.ls^.VERBfield^.req; 
particlevar := b^.ls^.VERBfield^.particle;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
synvpsvar := b^.ls^.VERBfield^.synvps;
thetavpvar := b^.ls^.VERBfield^.thetavp;
CaseAssignervar := b^.ls^.VERBfield^.CaseAssigner;
subcvar := b^.ls^.VERBfield^.subc;
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
prepkey1var := b^.ls^.VERBfield^.prepkey1;
prepkey2var := b^.ls^.VERBfield^.prepkey2;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
controllervar := b^.ls^.VERBfield^.controller;
verbraiservar := b^.ls^.VERBfield^.Verbraiser;
IPPvar := b^.ls^.VERBfield^.IPP;
classesvar := b^.ls^.VERBfield^.classes;
IF ( b^.ls^.VERBfield^.synvpefs2 <> [])
THEN synvpefsvar2 := b^.ls^.VERBfield^.synvpefs2;
END
END; END;
15: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.subc = zijnaux) AND
(b^.ls^.VERBfield^.status IN [bareV, teV]) AND
(NOT(b^.ls^.VERBfield^.modus IN [imperative, prespart, pastpart]))
);globcond: BEGIN  BEGIN
SYNREL := auxrel;
conjclassesvar := b^.ls^.VERBfield^.conjclasses;
numbervar := b^.ls^.VERBfield^.number;
personsvar := b^.ls^.VERBfield^.persons;
eORenFormvar := b^.ls^.VERBfield^.eORenForm;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
foundauxesvar := [b^.ls^.VERBfield^.subc];
IF b^.ls^.VERBfield^.status in [teV]
THEN statusvar := teAuxV
ELSE statusvar := AuxV;;
END
END; END;
16: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.subc = zijnaux) AND
(b^.ls^.VERBfield^.modus = pastpart) AND
(b^.ls^.VERBfield^.eORenform = NoForm)
);globcond: BEGIN  BEGIN
SYNREL := adjoinrel;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
synvpsvar := b^.ls^.VERBfield^.synvps;
thetavpvar := b^.ls^.VERBfield^.thetavp;
CaseAssignervar := b^.ls^.VERBfield^.CaseAssigner;
subcvar := b^.ls^.VERBfield^.subc;
foundauxesvar := foundauxesvar + [zijnaux]; 
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
prepkey1var := b^.ls^.VERBfield^.prepkey1;
prepkey2var := b^.ls^.VERBfield^.prepkey2;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
controllervar := b^.ls^.VERBfield^.controller;
verbraiservar := b^.ls^.VERBfield^.Verbraiser;
IPPvar := b^.ls^.VERBfield^.IPP;
classesvar := b^.ls^.VERBfield^.classes;
IF (NOT(b^.ls^.VERBfield^.status IN [partV ]))
THEN particlevar := b^.ls^.VERBfield^.particle;
END
END; END;
17: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PREPfield^.key = auxkey('aanioprepkey')

);globcond: BEGIN  BEGIN
SYNREL := modrel
END
END; END;
18: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ARTfield^.key = auxkey('hetARTkey')
)
);globcond: BEGIN  BEGIN
SYNREL := detrel
END
END; END;
19: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.modus = infinitive) AND
(b^.ls^.VERBfield^.status IN [bareV, partV] )
);globcond: BEGIN  BEGIN
SYNREL := head;
reqvar := b^.ls^.VERBfield^.req; 
conjclassesvar := b^.ls^.VERBfield^.conjclasses;
numbervar := b^.ls^.VERBfield^.number;
personsvar := b^.ls^.VERBfield^.persons;
eORenFormvar := b^.ls^.VERBfield^.eORenForm;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
synvpsvar := b^.ls^.VERBfield^.synvps;
thetavpvar := b^.ls^.VERBfield^.thetavp;
CaseAssignervar := b^.ls^.VERBfield^.CaseAssigner;
subcvar := b^.ls^.VERBfield^.subc;
foundauxesvar := b^.ls^.VERBfield^.foundauxes;
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
prepkey1var := b^.ls^.VERBfield^.prepkey1;
prepkey2var := b^.ls^.VERBfield^.prepkey2;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
controllervar := b^.ls^.VERBfield^.controller;
verbraiservar := b^.ls^.VERBfield^.Verbraiser;
IPPvar := b^.ls^.VERBfield^.IPP;
classesvar := b^.ls^.VERBfield^.classes;
statusvar := aanhetV;
particlevar := 0;
END
END; END;
20: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPfield^.preptype = postprep) AND
(dir IN b^.ls^.PREPfield^.subcs) AND
(b^.ls^.PREPfield^.postform IN [both, post])
);globcond: BEGIN  BEGIN
SYNREL := partrel;
END
END; END;
21: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := gluerel;
END
END; END;
22: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.status = bareV) AND
(b^.ls^.VERBfield^.synvps * LSAUXDOM_dirargvps<> [])
);globcond: BEGIN  BEGIN
SYNREL := head;
reqvar := b^.ls^.VERBfield^.req; 
conjclassesvar := b^.ls^.VERBfield^.conjclasses;
numbervar := b^.ls^.VERBfield^.number;
personsvar := b^.ls^.VERBfield^.persons;
eORenFormvar := b^.ls^.VERBfield^.eORenForm;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
synvpsvar := b^.ls^.VERBfield^.synvps;
thetavpvar := b^.ls^.VERBfield^.thetavp;
CaseAssignervar := b^.ls^.VERBfield^.CaseAssigner;
subcvar := b^.ls^.VERBfield^.subc;
foundauxesvar := b^.ls^.VERBfield^.foundauxes;
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
prepkey1var := b^.ls^.VERBfield^.prepkey1;
prepkey2var := b^.ls^.VERBfield^.prepkey2;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
controllervar := b^.ls^.VERBfield^.controller;
verbraiservar := b^.ls^.VERBfield^.Verbraiser;
IPPvar := b^.ls^.VERBfield^.IPP;
classesvar := b^.ls^.VERBfield^.classes;
statusvar := prepV;
particlevar := 0;
END
END; END;
23: 
CASE mode OF
loccond:LIPRIMS_assignstatus((b^.ls^.VERBfield^.status = teV) AND
(b^.ls^.VERBfield^.synvps * LSAUXDOM_dirargvps<> [])
);globcond: BEGIN  BEGIN
SYNREL := head;
reqvar := b^.ls^.VERBfield^.req; 
conjclassesvar := b^.ls^.VERBfield^.conjclasses;
numbervar := b^.ls^.VERBfield^.number;
personsvar := b^.ls^.VERBfield^.persons;
eORenFormvar := b^.ls^.VERBfield^.eORenForm;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
synvpsvar := b^.ls^.VERBfield^.synvps;
thetavpvar := b^.ls^.VERBfield^.thetavp;
CaseAssignervar := b^.ls^.VERBfield^.CaseAssigner;
subcvar := b^.ls^.VERBfield^.subc;
foundauxesvar := b^.ls^.VERBfield^.foundauxes;
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
prepkey1var := b^.ls^.VERBfield^.prepkey1;
prepkey2var := b^.ls^.VERBfield^.prepkey2;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
controllervar := b^.ls^.VERBfield^.controller;
verbraiservar := b^.ls^.VERBfield^.Verbraiser;
IPPvar := b^.ls^.VERBfield^.IPP;
classesvar := b^.ls^.VERBfield^.classes;
statusvar := prepteV;
particlevar := 0;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( true
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(VERB);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
IF (reqvar2 = [pospol, negpol, omegapol]) OR 
(reqvar2 = reqvar)
THEN top^.ls^.VERBfield^.req := reqvar;
IF (reqvar = [pospol, negpol, omegapol]) 
THEN top^.ls^.VERBfield^.req := reqvar2;
top^.ls^.VERBfield^.conjclasses := conjclassesvar;
top^.ls^.VERBfield^.particle := particlevar;
top^.ls^.VERBfield^.number := numbervar;
top^.ls^.VERBfield^.persons := personsvar;
top^.ls^.VERBfield^.eORenForm := eORenFormvar;
top^.ls^.VERBfield^.modus := modusvar;
top^.ls^.VERBfield^.tense := tensevar;
top^.ls^.VERBfield^.possvoices := possvoicesvar;
top^.ls^.VERBfield^.reflexivity := reflexivityvar;
top^.ls^.VERBfield^.synvps := synvpsvar;
top^.ls^.VERBfield^.thetavp := thetavpvar;
top^.ls^.VERBfield^.CaseAssigner := CaseAssignervar;
top^.ls^.VERBfield^.subc := subcvar;
top^.ls^.VERBfield^.foundauxes := foundauxesvar;
top^.ls^.VERBfield^.perfauxs := perfauxsvar;
top^.ls^.VERBfield^.prepkey1 := prepkey1var;
top^.ls^.VERBfield^.prepkey2 := prepkey2var;
top^.ls^.VERBfield^.controller := controllervar;
top^.ls^.VERBfield^.Verbraiser := verbraiservar;
top^.ls^.VERBfield^.IPP := IPPvar;
top^.ls^.VERBfield^.classes := classesvar;
top^.ls^.VERBfield^.status := statusvar;
top^.ls^.VERBfield^.synvpefs2 := synvpefsvar2;
top^.ls^.VERBfield^.adjuncts := adjunctsvar;
END
END; END;
END;
END;{package}
PACKAGE VPpack: [VPrule];
(*indobj(1), aanobj(2), voorobj(3), prepobjrel (21)*)
(*vpadvrel,agvpadvrel,25/26; doorbyrel/27*)
(* prepobj,5 *)
(* dirargrel,6 *)
(* dirargrel,7 *)
(* locargrel,8 *)
(* locargrel,9 *)
(* predrel,10 *)
(* predrel,11 *)
(* predrel,12 *)
(* predrel,13 *)
(*strand,16*) (*head,18*) (*progaux,19*) (* aux,20*)
(* postVporel 22, postVrel,23*)
VAR
aanactivefound : BOOLEAN;
aanobjrelfound : BOOLEAN;
accobjfound : BOOLEAN;
adjppredrelfound : BOOLEAN;
adjpprepkeyvar : LSDOMAINT_keytype;
adjunctsvar : LSDOMAINT_adjunctSETtype;
adjvpefsvar : LSDOMAINT_synpatternEFFSETtype;
advppredrelfound : BOOLEAN;
anterelativeokvar : BOOLEAN;
argrelfound : BOOLEAN;
auxrelfound : BOOLEAN;
classesvar : LSDOMAINT_classSETtype;
countenfoundvar : BOOLEAN;
dirargrelfound : BOOLEAN;
dirargnpfound : BOOLEAN;
doorbyfound : BOOLEAN;
doorbyrelfound : BOOLEAN;
eORenparticiplefound : BOOLEAN;
envvar : LSDOMAINT_polarityEFFSETtype;
expparticle : LSDOMAINT_keytype;
foundauxesvar : LSDOMAINT_verbsubcsettype;
headmodusvar : LSDOMAINT_modustype;
headstatusvar : LSDOMAINT_Vstatustype;
headvarstatusvar : LSDOMAINT_Vstatustype;
ionpfound : BOOLEAN;
locargrelfound : BOOLEAN;
modusvar : LSDOMAINT_modustype;
nodetnpfound : BOOLEAN;
nodetnpfound2 : BOOLEAN;
nodetnpidvps : LSDOMAINT_synpatternEFFSETtype;
nodetnpidvps2 : LSDOMAINT_synpatternEFFSETtype;
nppredrelfound : BOOLEAN;
objfound : BOOLEAN;
particlekey : LSDOMAINT_keytype;
perfauxsvar : LSDOMAINT_perfauxSETtype;
perfauxverb : LSDOMAINT_Verbsubctype;
possvoicesvar : LSDOMAINT_voiceSETtype;
postvporelfound : BOOLEAN;
postvrelfound : BOOLEAN;
preadvok : BOOLEAN;
prepkeyvar1 : LSDOMAINT_keytype;
prepkeyvar2 : LSDOMAINT_keytype;
prepobj1found : BOOLEAN;
prepobj2found : BOOLEAN;
prepobjrelfound : BOOLEAN;
prepppredrelfound : BOOLEAN;
preprepobjrelfound : BOOLEAN;
progauxmodusvar : LSDOMAINT_modustype;
progauxrelfound : BOOLEAN;
progauxstatusvar : LSDOMAINT_Vstatustype;
prosentfound : BOOLEAN;
reflexivityvar : LSDOMAINT_reflexivetype;
reqvar : LSDOMAINT_polarityEFFSETtype;
statusvar : LSDOMAINT_Vstatustype;
strandedPPfound : BOOLEAN;
strandedrelfound : BOOLEAN;
synaanactivefound : BOOLEAN;
synvpefsvar : LSDOMAINT_synpatterneffsettype;
synvpefsvar2 : LSDOMAINT_synpatternEFFSETtype;
tensevar : LSDOMAINT_tensetype;
thetavpvar : LSDOMAINT_thetavptype;
unreducedsynvpsvar : LSDOMAINT_synpatterneffsettype;
unreducedsynvpsvar2: LSDOMAINT_synpatterneffsettype;
verbadjuncts : LSDOMAINT_adjunctSETtype;
verbnumbervar : LSDOMAINT_numbertype;
verbpersonsvar : LSDOMAINT_personSETtype;
verbprepkeyvar1 : LSDOMAINT_keytype;
verbprepkeyvar2 : LSDOMAINT_keytype;
verbraiservar : LSDOMAINT_Verbraisertype; 
voicevar : LSDOMAINT_voicetype;
voorobjrelfound : BOOLEAN;
vpcomplrelfound : BOOLEAN;
vrfound : BOOLEAN;
VRionpfound : BOOLEAN;
VRobjfound : BOOLEAN;
PROCEDURE VPrule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
 
FUNCTION nodetNP(t:LSSTREE_pStree):BOOLEAN;
(* 
pre: t=NP<NPrec1>[mu1] & mu1<>[]
post: nodetNP(t) <=>
(NPrec1.number = singular) AND
(NPrec1.actcomas = [count]) AND
(NPrec1.NPhead = otherNP) AND
(EXIST(mu1, [head/CN<>[mu]]) AND
(NOT EXIST(mu1, [detrel/..])
*)
VAR result, detfound, cnfound : BOOLEAN;
sonlist :LSSTREE_pRelnode;
BEGIN
result := ((t^.ls^.NPfield^.number=singular) AND
(t^.ls^.NPfield^.actcomas=[count]) AND
(t^.ls^.NPfield^.NPhead=otherNP)
);
IF result THEN BEGIN
sonlist:= t^.sons;
detfound := false;
cnfound := false;
WHILE (sonlist<>NIL) AND ((NOT detfound) OR (NOT cnfound)) DO BEGIN
IF (NOT detfound) THEN detfound := (sonlist^.relation=detrel);
IF (NOT cnfound) THEN cnfound := (sonlist^.relation=head) AND
(sonlist^.node^.ls^.cat=CN);
sonlist:=sonlist^.brother
END;
END;
nodetNP := result AND cnfound AND (NOT detfound);
END (*nodetNPok*);
FUNCTION argandVRok:BOOLEAN;
BEGIN
argandVRok :=
( (NOT argrelfound) OR
( (verbraiservar IN [optionalVR,obligatoryVR]) OR
(modusvar = infinitive)
)
);
(*
If an argrel has been found, then we must be dealing with a case of Verb
Raising, hence 
either verbraiservar has the value optionalVR or obligatoryVR
or the matrix verb is in second position, and there is an infinitive
in the VERBP. Hence modusvar = infinitive
(e.g. [Hij kan] dit boek gelezen hebben) 
*)
END (*argandVRok*);
FUNCTION bareVR:BOOLEAN;
BEGIN
bareVR :=
(
(verbraiservar IN [optionalVR, obligatoryVR]) AND
(headstatusvar IN [aanhetV, bareV]) AND
((NOT auxrelfound) OR (statusvar=bareV)) AND
((NOT progauxrelfound) OR (progauxstatusvar = bareV))
);
(*
If a verb allows or requires verb raising, and it is 
not in a verb cluster (and Vmatrixhead is true), 
then the verb is used without a sentential
complement. This allows one to further reduce the synvpefs.
*)
END (*bareVR*);
FUNCTION dirargnpok:BOOLEAN;
BEGIN
dirargnpok := ((NOT dirargnpfound) OR 
NOT (headstatusvar IN [bareV,partV,teV,partTeV])
);
END {dirargnpok};
FUNCTION findaanactive(t:LSSTREE_pStree):BOOLEAN;
VAR result : BOOLEAN;
BEGIN
result := false;
IF (t <> NIL)
THEN BEGIN
IF (aanactive IN t^.ls^.VERBfield^.possvoices)
THEN result := true
ELSE BEGIN
result := (t^.sons <> NIL);
IF result THEN result := (t^.sons^.brother <> NIL);
IF result THEN result := findaanactive(t^.sons^.brother^.node)
END
END;
findaanactive := result;
END (*findaanactive*);
FUNCTION findsynaanactive(t:LSSTREE_pStree):BOOLEAN;
VAR result : BOOLEAN;
BEGIN
result := false;
IF (t <> NIL)
THEN BEGIN
IF (synaanactive IN t^.ls^.VERBfield^.synvps)
THEN result := true
ELSE BEGIN
result := (t^.sons <> NIL);
IF result THEN result := findsynaanactive(t^.sons^.node)
END
END;
findsynaanactive := result;
END (*findsynaanactive*);
FUNCTION GetPk(t1:LSSTREE_pSTREE):LSDOMAINT_keytype;
VAR sonlist:LSSTREE_prelnode;
pk : LSDOMAINT_keytype;
headfound:BOOLEAN;
BEGIN
pk := 0;
headfound := false;
sonlist := t1^.sons;
WHILE (NOT headfound) AND (sonlist <> NIL) DO BEGIN
IF (sonlist^.node^.cat = ADJ) AND
(sonlist^.relation = head )
THEN BEGIN
headfound := true;
pk := sonlist^.node^.ls^.ADJfield^.prepkey;
END;
sonlist := sonlist^.brother;
END; 
GetPk := Pk
END (*GetPk*);
FUNCTION iodoandVRok:BOOLEAN;
BEGIN
iodoandVRok :=
(
( (NOT VRionpfound) OR
( (verbraiservar IN [optionalVR,obligatoryVR]) OR
(modusvar = infinitive)
)
) AND
( (NOT VRobjfound) OR
( (verbraiservar IN [optionalVR,obligatoryVR]) OR
(modusvar = infinitive)
)
)
)
;
(*
If an VRobj, or VRionp has been found, then we must be dealing with a case of
Verb Raising, hence 
either verbraiservar has the value optionalVR or obligatoryVR
or the matrix verb is in second position, and there is an infinitive
in the VERBP. Hence modusvar = infinitive
(e.g. [Hij kan] dit boek gelezen hebben) 
*)
END (*iodoandVRok*);
FUNCTION NOplural45(ps: LSDOMAINT_personSETtype;n: LSDOMAINT_numbertype):BOOLEAN;
BEGIN
Noplural45 :=
( NOT ( ( (ps = [4]) OR
(ps = [5]) OR
(ps = [4,5])
) AND
(n = plural)
)
);
(*
This function is true if the verb form is not only 
fourth or fifth person plural
*)
END (*NOplural45*);
FUNCTION Norealobjoriobjfound:BOOLEAN;
BEGIN
Norealobjoriobjfound :=
(
( (NOT ionpfound) OR
(VRionpfound)
) AND
( (NOT objfound) OR
(VRobjfound)
)
);
END (*Norealobjoriobjfound*);
FUNCTION partinVcluster:BOOLEAN;
BEGIN
partinVcluster :=
(NOT ( (headstatusvar IN [teV, bareV]) AND
(expparticle <> 0) AND
(particlekey <> 0)
)
);
(* If a particle can be combined in a verb cluster, then it must be combined 
inside it 
The condition excludes: VP[PART V[te V]] and allows
VP[ V[ PART V[te V]]]
*)
END (*partinVcluster*);
FUNCTION passauxok:BOOLEAN;
BEGIN
passauxok:=
( (NOT auxrelfound) OR
([wordenaux, zijnaux] * foundauxesvar <> [])
);
(*
In a passive VERBP either there is no auxiliary (in the case of
anterelatives, or if the auxiliary is in second position
(hence there is no auxrel)), but if
there is one, then it must contain worden OR zijn.
*)
END (*passauxok*);
FUNCTION passheadok:BOOLEAN;
BEGIN
passheadok:=
( (
(headmodusvar = pastpart) AND
(headstatusvar IN [bareV,partV, prepV])
) OR
(
(headstatusvar IN [auxV, teAuxV]) AND
([wordenaux, zijnaux] * foundauxesvar <> [])
)
);
(*
In a passive VERBP the head must be a pastparticiple OR
the head contains the participle preceded by the auxiliary verb
worden OR zijn
*)
END (*passheadok*);
FUNCTION perfauxok:BOOLEAN;
BEGIN
perfauxok :=
(
(NOT ( auxrelfound AND 
(statusvar IN [bareV,teV])
)
) OR
(
((perfauxverb = hebbenaux) AND (hebaux IN perfauxsvar)) OR
((perfauxverb = zijnaux ) AND (isaux IN perfauxsvar))
)
)
(*If an simple auxrel is found, then in active, 
the perfauxverb (i.e. the found perfaux ) must be compatible with
perfauxsvar
*)
END (*perfauxok*);
FUNCTION prepkeyok(vpk,pk: LSDOMAINT_keytype):BOOLEAN;
BEGIN
prepkeyok := ((pk = vpk) OR
((vpk = auxkey('totprepkey')
) AND (pk = auxkey('toeprepkey')
)) OR
((vpk = auxkey('metprepkey')
) AND (pk = auxkey('meeprepkey')
))
);
END (*prepkeyok*);
FUNCTION aanvoorprepobjok:BOOLEAN;
BEGIN
aanvoorprepobjok :=
(
( (prepkeyvar1 = auxkey('aanioprepkey')
) AND
(NOT aanobjrelfound) AND
((synvpefsvar * LSAUXDOM_aanobjvps <> []) OR
(synvpefsvar2 * LSAUXDOM_aanobjvps <> []) OR
aanactivefound
) AND
(objfound OR argrelfound)
) OR
( (prepkeyvar1 = auxkey('voorioprepkey')
) AND
(NOT voorobjrelfound) AND
((synvpefsvar * LSAUXDOM_voorobjvps <> []) OR
(synvpefsvar2 * LSAUXDOM_voorobjvps <> []) OR
(benfactPP IN verbadjuncts)
) AND
(objfound OR argrelfound)
) 
)
END (*aanvoorprepobjok*);
FUNCTION adjpostvpook:BOOLEAN;
BEGIN
adjpostvpook :=
(
postvporelfound AND
adjppredrelfound AND
(prepkeyok(adjpprepkeyvar, prepkeyvar1) OR
prepkeyok(adjpprepkeyvar, prepkeyvar2) OR
(((prepkeyvar1 = auxkey('aanioPREPkey')
) OR
(prepkeyvar2 = auxkey('aanioPREPkey')
)
) AND
(adjvpefsvar * LSAUXDOM_aanobjvps <> [])
)
)
)
END (*adjpostvpook*);
FUNCTION prepobjok:BOOLEAN;
BEGIN
prepobjok := false;
IF (NOT prepobj1found)
THEN BEGIN
prepobjok := true;
END (* IF (NOT prepobj1found) THEN*)
ELSE BEGIN
IF (NOT prepobj2found)
THEN BEGIN
IF prepkeyok(verbprepkeyvar1, prepkeyvar1) OR
prepkeyok(verbprepkeyvar2, prepkeyvar1) OR
aanvoorprepobjok 
THEN BEGIN
prepobjok := true;
END (* IF prepkeyok.. THEN
*)
ELSE BEGIN
prepobjok := false;
END (* IF prepkeyok..
*);
END (* IF (NOT prepobj2found) THEN*)
ELSE BEGIN
IF ( (*1*)
( prepkeyok(verbprepkeyvar1, prepkeyvar1) AND 
prepkeyok(verbprepkeyvar2, prepkeyvar2)
) OR
( prepkeyok(verbprepkeyvar2, prepkeyvar1) AND
prepkeyok(verbprepkeyvar1, prepkeyvar2)
)
)
THEN BEGIN
prepobjok := true;
END (* IF 1 THEN*)
ELSE BEGIN
prepobjok := false;
END (* IF 1 ELSE*);
END; (* IF (NOT prepobj2found) ELSE *)
END; (* IF (NOT prepobj1found) ELSE*)
END (*function prepobjok*);
PROCEDURE reducematrixvps(VAR vps: LSDOMAINT_synpatternEFFSETtype);
BEGIN
IF argrelfound 
THEN vps := vps * LSAUXDOM_VRvps;
IF ionpfound AND
([benfactNP] * verbadjuncts = [])
THEN vps := vps * LSAUXDOM_indobjvps;
IF ionpfound AND
(benfactNP IN verbadjuncts)
THEN adjunctsvar := adjunctsvar + [resAP];
IF objfound
THEN vps := vps * (LSAUXDOM_objvps + [synzijn]);
IF accobjfound
THEN vps := vps * LSAUXDOM_accobjvps;
END (*reducematrixvps*);
PROCEDURE reducevps(VAR vps: LSDOMAINT_synpatternEFFSETtype);
BEGIN
IF aanobjrelfound AND (NOT aanactivefound)
THEN vps := vps * LSAUXDOM_aanobjvps;
IF voorobjrelfound AND
([benfactPP] * verbadjuncts = [])
THEN vps := vps * LSAUXDOM_voorobjvps;
IF voorobjrelfound AND
(benfactPP IN verbadjuncts)
THEN adjunctsvar := adjunctsvar + [benfactPP];
IF preprepobjrelfound
THEN vps := vps * LSAUXDOM_preprepobjvps;
IF prepobjrelfound OR 
(postvporelfound AND
(NOT adjpostvpook)
)
THEN BEGIN
IF ((prepkeyvar1 = auxkey('aanioprepkey')
) OR
(prepkeyvar2 = auxkey('aanioprepkey')
)
) AND
(NOT aanobjrelfound AND NOT voorobjrelfound) AND
(NOT aanactivefound)
THEN vps := vps * (LSAUXDOM_prepobjvps + LSAUXDOM_aanobjvps)
ELSE IF ((prepkeyvar1 = auxkey('voorioprepkey')
) OR
(prepkeyvar2 = auxkey('voorioprepkey')
)
) AND
(NOT aanobjrelfound AND NOT voorobjrelfound) 
THEN IF ([benfactPP] * verbadjuncts = [])
THEN vps := vps * (LSAUXDOM_prepobjvps + LSAUXDOM_voorobjvps)
ELSE adjunctsvar := adjunctsvar + [benfactPP]
ELSE vps := vps * LSAUXDOM_prepobjvps
END;
IF locargrelfound AND
([locadjunct] * Verbadjuncts = [])
THEN vps := vps * LSAUXDOM_locargvps;
IF locargrelfound AND
(diradjunct IN verbadjuncts)
THEN adjunctsvar := adjunctsvar + [locadjunct];
IF dirargrelfound AND 
([diradjunct] * Verbadjuncts = [])
THEN vps := vps * LSAUXDOM_dirargvps;
IF dirargrelfound AND
(diradjunct IN verbadjuncts)
THEN adjunctsvar := adjunctsvar + [diradjunct];
IF advppredrelfound 
THEN vps := vps * LSAUXDOM_advppredvps;
IF adjppredrelfound AND
([resAP] * verbadjuncts = [])
THEN vps := vps * LSAUXDOM_adjppredvps;
IF adjppredrelfound AND
(resAP IN verbadjuncts)
THEN adjunctsvar := adjunctsvar + [resAP];
IF nppredrelfound AND
([resNP] * verbadjuncts = [])
THEN vps := vps * LSAUXDOM_nppredvps;
IF nppredrelfound AND
(resNP in verbadjuncts)
THEN adjunctsvar := adjunctsvar + [resNP];
IF prepppredrelfound AND
([resPP] * verbadjuncts = [])
THEN vps := vps * LSAUXDOM_prepppredvps;
IF prepppredrelfound AND
(resPP in verbadjuncts)
THEN adjunctsvar := adjunctsvar + [resPP];
IF vpcomplrelfound 
THEN vps := vps * LSAUXDOM_vpcomplvps;
IF prosentfound
THEN vps := vps * LSAUXDOM_soprosentvps;
IF prepobj2found
THEN vps := vps * LSAUXDOM_twoprepobjvps;
END (*reducevps*);
FUNCTION Sunderadjp(t1:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
IF sonlist <> NIL THEN BEGIN
result := ( sonlist^.node^.cat IN [SENTENCE,NEG,POS]) OR
(sonlist^.relation IN 
[reflrel, erposrel,postadjrel,omtemodrel, resultrel,
sentadvrel, tempadvrel, locadvrel, agvpadvrel
]
);
sonlist:=sonlist^.brother;
END;
WHILE (NOT result) AND (sonlist<>NIL) DO BEGIN
result := ( sonlist^.node^.cat IN [SENTENCE,NEG,POS]) OR
(sonlist^.relation IN 
[reflrel, erposrel,postadjrel,omtemodrel, resultrel,
sentadvrel, tempadvrel, locadvrel, agvpadvrel
]
);
sonlist:=sonlist^.brother
END;
Sunderadjp:=result;
END (*Sunderadjp*);
(*This function checks whether an special elements occur under ADJP*)
FUNCTION synvpsok:BOOLEAN;
BEGIN
synvpsok :=
( (synvpefsvar <> [] ) AND
( (NOT VRfound) OR
(synvpefsvar2 <> [])
)
);
END (*synvpsok*);
 
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
aanactivefound := false;
aanobjrelfound := false;
accobjfound := false;
adjppredrelfound := false;
adjpprepkeyvar := 0;
adjunctsvar := [];
adjvpefsvar := [];
advppredrelfound := false;
anterelativeokvar := true;
argrelfound := false;
auxrelfound := false;
classesvar := [];
countenfoundvar := false;
dirargrelfound := false;
dirargnpfound := false;
doorbyfound := false;
doorbyrelfound := false;
eORenparticiplefound := false;
envvar := [pospol, negpol, omegapol];
expparticle := 0;
foundauxesvar := [];
headmodusvar := omegamodus;
headstatusvar := bareV;
ionpfound := false;
locargrelfound := false;
modusvar := omegamodus;
modusvar := omegamodus;
nodetnpfound := false;
nodetnpfound2 := false;
nodetnpidvps := LSAUXDOM_nodetNPidvps;
nodetnpidvps2 := LSAUXDOM_nodetNPidvps;
nppredrelfound := false;
objfound := false;
particlekey := 0;
perfauxsvar := [];
perfauxverb := hebbenaux;
possvoicesvar := [];
postvporelfound := false;
postvrelfound := false;
preadvok := false;
prepkeyvar1 := 0;
prepkeyvar2 := 0;
prepobj1found := false;
prepobj2found := false;
prepobjrelfound := false;
prepppredrelfound := false;
preprepobjrelfound := false;
progauxmodusvar := omegamodus;
progauxrelfound := false;
progauxstatusvar := bareV;
prosentfound := false;
reflexivityvar := notreflexive;
reqvar := [pospol, negpol, omegapol];
statusvar := bareV;
strandedPPfound := false;
strandedrelfound := false;
synaanactivefound := false;
synvpefsvar := [];
synvpefsvar2 := [];
tensevar := omegatense;
thetavpvar := omegathetavp;
unreducedsynvpsvar := [];
unreducedsynvpsvar2:= [];
verbadjuncts := [];
verbnumbervar := omeganumber;
verbpersonsvar := [];
verbprepkeyvar1 := 0;
verbprepkeyvar2 := 0;
verbraiservar := noVR; 
voicevar := omegavoice;
voorobjrelfound := false;
vpcomplrelfound := false;
vrfound := false;
VRionpfound := false;
VRobjfound := false;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.animate in [ yesanimate, omegaanimate]) AND
(Dative IN b^.ls^.NPfield^.cases) AND 
(NOT(b^.ls^.NPfield^.NPhead IN [reducedpersproNP, jegenNP, 
zegenNP, hetNP])) 
);globcond: BEGIN  BEGIN
SYNREL := indobjrel;
ionpfound := true;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countenfoundvar := true;
IF nodetnp(b) 
THEN BEGIN
nodetnpfound := true;
nodetnpidvps := 
nodetnpidvps * LSAUXDOM_ionodetidvps;
END;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.headkey = auxkey('aanioprepkey')
) AND
(b^.ls^.PREPPfield^.radvkey = 0)
);globcond: BEGIN  BEGIN
SYNREL := aanobjrel;
aanobjrelfound := true;
(* preadvok := true; *)
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.headkey = auxkey('voorioprepkey')
) AND
(b^.ls^.PREPPfield^.radvkey = 0)
);globcond: BEGIN  BEGIN
SYNREL := voorobjrel;
voorobjrelfound := true;
(* preadvok := true; *)
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ([nominative, accusative] * b^.ls^.NPfield^.cases <> []) AND
(b^.ls^.NPfield^.cases <> [Nominative]) AND
(NOT(b^.ls^.NPfield^.NPhead IN [reducedpersproNP, jegenNP, 
zegenNP, hetNP])) 
);globcond: BEGIN  BEGIN
SYNREL := objrel;
IF NOT (nominative IN b^.ls^.NPfield^.cases) 
THEN accobjfound := true;
objfound := true;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countenfoundvar := true;
IF nodetnp(b) 
THEN BEGIN
nodetnpfound := true;
nodetnpidvps := 
nodetnpidvps * LSAUXDOM_donodetidvps;
END;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := prepobjrel;
prepobjrelfound := true;
IF (prepobj1found)
THEN BEGIN
prepkeyvar2 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found then*)
ELSE BEGIN
prepkeyvar1 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found else*);
IF (prepobj1found)
THEN BEGIN
prepobj2found := true
END (*if prepobj1found then*)
ELSE BEGIN
prepobj1found := true
END (*if prepobj1found else*);
IF b^.ls^.PREPPfield^.stranded
THEN strandedPPfound := true;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (dir IN b^.ls^.PREPPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := dirargrel;
dirargrelfound := true;
IF b^.ls^.PREPPfield^.stranded
THEN strandedPPfound := true;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (diradv IN b^.ls^.ADVPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := dirargrel;
dirargrelfound := true;
END
END; END;
8: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (loc IN b^.ls^.PREPPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := locargrel;
locargrelfound := true;
IF b^.ls^.PREPPfield^.stranded
THEN strandedPPfound := true;
END
END; END;
9: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (locadv IN b^.ls^.ADVPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := locargrel;
locargrelfound := true;
END
END; END;
10: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.actsubcefs * [other] <> []) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := predrel;
prepppredrelfound := true;
END
END; END;
11: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs * [Locadv, diradv, otherAdv] <> [])
);globcond: BEGIN  BEGIN
SYNREL := predrel;
advppredrelfound := true;
END
END; END;
12: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.cases <> [Nominative]) AND
(accusative IN b^.ls^.NPfield^.cases) AND
(NOT(b^.ls^.NPfield^.NPhead IN [reducedpersproNP, hetNP, jegenNP,
zegenNP])) AND
(b^.ls^.NPfield^.posspred = true) (*NP can be used predicatively*) 
);globcond: BEGIN  BEGIN
SYNREL := predrel; 
nppredrelfound :=true;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countenfoundvar := true;
END
END; END;
13: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ( predicative IN b^.ls^.ADJPfield^.actuseefs) AND
( b^.ls^.ADJPfield^.eORenForm = NoForm ) AND 
(NOT SunderADJP(b))
);globcond: BEGIN  BEGIN
SYNREL := predrel;
adjppredrelfound := true;
adjvpefsvar := b^.ls^.ADJPfield^.adjpatternefs;
adjpprepkeyvar := GETPk(b);
END
END; END;
14: (* for stranded doorby *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.headkey = auxkey('doorbyprepkey')
) AND
(b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := strandedrel;
doorbyfound := true;
strandedrelfound := true;
END
END; END;
15: (* for stranded preprep heads *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.stranded) 
);globcond: BEGIN  BEGIN
SYNREL := strandedrel;
strandedrelfound := true;
IF (prepobj1found)
THEN BEGIN
prepkeyvar2 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found then*)
ELSE BEGIN
prepkeyvar1 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found else*);
IF (prepobj1found)
THEN BEGIN
prepobj2found := true
END (*if prepobj1found then*)
ELSE BEGIN
prepobj1found := true
END (*if prepobj1found else*);
END
END; END;
16: (* for stranded adverbials *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.actsubcefs * [instrum,comitative] <> []) AND 
(b^.ls^.PREPPfield^.stranded) 
);globcond: BEGIN  BEGIN
SYNREL := strandedrel;
strandedrelfound := true;
END
END; END;
17: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := partrel;
particlekey := b^.ls^.PARTfield^.key;
END
END; END;
18: 
CASE mode OF
loccond:LIPRIMS_assignstatus( Noplural45(b^.ls^.VERBfield^.persons, b^.ls^.VERBfield^.number)
);globcond: BEGIN  BEGIN
SYNREL := head;
thetavpvar := b^.ls^.VERBfield^.thetavp;
synvpefsvar := b^.ls^.VERBfield^.synvps;
synvpefsvar2 := b^.ls^.VERBfield^.synvpefs2;
verbadjuncts := b^.ls^.VERBfield^.adjuncts;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
foundauxesvar := b^.ls^.VERBfield^.foundauxes;
headmodusvar := b^.ls^.VERBfield^.modus;
modusvar := b^.ls^.VERBfield^.modus;
headstatusvar := b^.ls^.VERBfield^.status;
tensevar := b^.ls^.VERBfield^.tense;
statusvar := b^.ls^.VERBfield^.status;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
IF (b^.ls^.VERBfield^.eORenform IN [eForm, enForm])
THEN eORenparticiplefound := true;
verbprepkeyvar1 := b^.ls^.VERBfield^.prepkey1;
verbprepkeyvar2 := b^.ls^.VERBfield^.prepkey2;
verbraiservar := b^.ls^.VERBfield^.verbraiser;
IF (NOT(b^.ls^.VERBfield^.status IN [partV, partteV]))
THEN expparticle := b^.ls^.VERBfield^.particle;
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
classesvar := b^.ls^.VERBfield^.classes;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
verbpersonsvar := b^.ls^.VERBfield^.persons;
verbnumbervar := b^.ls^.VERBfield^.number;
aanactivefound := findaanactive(b);
synaanactivefound := findsynaanactive(b);
END
END; END;
19: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.subc IN [ progaux, zijnaux ]) AND
(b^.ls^.VERBfield^.status IN [bareV, teV]) AND
Noplural45(b^.ls^.VERBfield^.persons, b^.ls^.VERBfield^.number)
);globcond: BEGIN  BEGIN
SYNREL := progauxrel;
foundauxesvar := foundauxesvar + [b^.ls^.VERBfield^.subc];
tensevar := b^.ls^.VERBfield^.tense;
progauxmodusvar := b^.ls^.VERBfield^.modus;
modusvar := b^.ls^.VERBfield^.modus;
progauxrelfound := true;
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
anterelativeokvar := false;
verbpersonsvar := b^.ls^.VERBfield^.persons;
verbnumbervar := b^.ls^.VERBfield^.number;
progauxstatusvar:= b^.ls^.VERBfield^.status;
statusvar := b^.ls^.VERBfield^.status;
END
END; END;
20: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.subc IN [hebbenaux, zijnaux, wordenaux]) AND
(b^.ls^.VERBfield^.status IN [bareV, teV]) AND
Noplural45(b^.ls^.VERBfield^.persons, b^.ls^.VERBfield^.number)
);globcond: BEGIN  BEGIN
SYNREL := auxrel;
IF (b^.ls^.VERBfield^.subc IN [hebbenaux, zijnaux] )
THEN perfauxverb := b^.ls^.VERBfield^.subc;
auxrelfound := true;
modusvar := b^.ls^.VERBfield^.modus;
statusvar := b^.ls^.VERBfield^.status;
tensevar := b^.ls^.VERBfield^.tense;
anterelativeokvar := false;
foundauxesvar := foundauxesvar + [b^.ls^.VERBfield^.subc];
verbpersonsvar := b^.ls^.VERBfield^.persons;
verbnumbervar := b^.ls^.VERBfield^.number;
END
END; END;
21: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.radvkey = 0) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := prepobjrel;
preprepobjrelfound := true;
IF (prepobj1found)
THEN BEGIN
prepkeyvar2 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found then*)
ELSE BEGIN
prepkeyvar1 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found else*);
IF (prepobj1found)
THEN BEGIN
prepobj2found := true
END (*if prepobj1found then*)
ELSE BEGIN
prepobj1found := true
END (*if prepobj1found else*);
END
END; END;
22: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.radvkey = 0)
);globcond: BEGIN  BEGIN
SYNREL := postvporel;
postvporelfound := true;
IF (prepobj1found)
THEN BEGIN
prepkeyvar2 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found then*)
ELSE BEGIN
prepkeyvar1 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found else*);
IF (prepobj1found)
THEN BEGIN
prepobj2found := true
END (*if prepobj1found then*)
ELSE BEGIN
prepobj1found := true
END (*if prepobj1found else*);
anterelativeokvar := false;
END
END; END;
23: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.radvkey = 0) AND
(b^.ls^.PREPPfield^.actsubcefs * [doorby, instrum, 
comitative] <> [])
);globcond: BEGIN  BEGIN
SYNREL := postverbrel;
postvrelfound := true;
anterelativeokvar := false;
END
END; END;
24: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.cases * [dative, accusative] <> []) AND
(NOT(b^.ls^.NPfield^.NPhead IN [reducedpersproNP, jegenNP, 
zegenNP, hetNP])) AND
(NOT nodetnp(b))
);globcond: BEGIN  BEGIN
SYNREL := argrel;
argrelfound := true;
END
END; END;
25: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.actsubcefs * [instrum, comitative] <> []) AND
(b^.ls^.PREPPfield^.radvkey = 0) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := vpadvrel;
preadvok := true;
END
END; END;
26: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs * [vpadv] <> []) AND
(b^.ls^.ADVPfield^.Qstatus = false)
);globcond: BEGIN  BEGIN
SYNREL := vpadvrel;
preadvok := true;
END
END; END;
27: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.headkey = auxkey('doorbyprepkey')
) AND
(b^.ls^.PREPPfield^.radvkey = 0) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := byobjrel;
doorbyrelfound := true;
preadvok := true;
END
END; END;
28: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs * [agvpadv] <> []) AND
(b^.ls^.ADVPfield^.Qstatus = false)
);globcond: BEGIN  BEGIN
SYNREL := agvpadvrel;
preadvok := true;
END
END; END;
29: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.status IN [VV, teVV, AuxV, teAuxV]) AND
Noplural45(b^.ls^.VERBfield^.persons, b^.ls^.VERBfield^.number)
);globcond: BEGIN  BEGIN
SYNREL := progauxrel;
aanactivefound := findaanactive(b);
synaanactivefound := findsynaanactive(b);
foundauxesvar := b^.ls^.VERBfield^.foundauxes;
tensevar := b^.ls^.VERBfield^.tense;
progauxmodusvar := b^.ls^.VERBfield^.modus;
modusvar := b^.ls^.VERBfield^.modus;
progauxrelfound := true;
thetavpvar := b^.ls^.VERBfield^.thetavp;
synvpefsvar2 := synvpefsvar;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
synvpefsvar := b^.ls^.VERBfield^.synvps;
(*IF (b^.ls^.VERBfield^.synvpefs2 <> [synzijn] )
THEN synvpefsvar2 := b^.ls^.VERBfield^.synvpefs2;*)
possvoicesvar := b^.ls^.VERBfield^.possvoices;
statusvar := b^.ls^.VERBfield^.status;
verbprepkeyvar1 := b^.ls^.VERBfield^.prepkey1;
verbprepkeyvar2 := b^.ls^.VERBfield^.prepkey2;
verbraiservar := b^.ls^.VERBfield^.verbraiser;
perfauxsvar := b^.ls^.VERBfield^.perfauxs;
progauxstatusvar:= b^.ls^.VERBfield^.status;
IF b^.ls^.VERBfield^.status IN [VV, teVV]
THEN BEGIN
classesvar := b^.ls^.VERBfield^.classes;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
END;
verbpersonsvar := b^.ls^.VERBfield^.persons;
verbnumbervar := b^.ls^.VERBfield^.number;
END
END; END;
30: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.status IN [VV, teVV, AuxV, teAuxV]) AND
Noplural45(b^.ls^.VERBfield^.persons, b^.ls^.VERBfield^.number)
);globcond: BEGIN  BEGIN
SYNREL := auxrel;
aanactivefound := findaanactive(b);
synaanactivefound := findsynaanactive(b);
auxrelfound := true;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
thetavpvar := b^.ls^.VERBfield^.thetavp;
synvpefsvar2 := synvpefsvar;
verbadjuncts := b^.ls^.VERBfield^.adjuncts;
synvpefsvar := b^.ls^.VERBfield^.synvps;
(*IF (b^.ls^.VERBfield^.synvpefs2 <> [synzijn] )
THEN synvpefsvar2 := b^.ls^.VERBfield^.synvpefs2;*)
possvoicesvar := b^.ls^.VERBfield^.possvoices;
statusvar := b^.ls^.VERBfield^.status;
verbprepkeyvar1 := b^.ls^.VERBfield^.prepkey1;
verbprepkeyvar2 := b^.ls^.VERBfield^.prepkey2;
foundauxesvar := b^.ls^.VERBfield^.foundauxes;
verbraiservar := b^.ls^.VERBfield^.verbraiser;
classesvar := b^.ls^.VERBfield^.classes;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
verbpersonsvar := b^.ls^.VERBfield^.persons;
verbnumbervar := b^.ls^.VERBfield^.number;
END
END; END;
31: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.cases * [dative, accusative] <> []) AND
(NOT(b^.ls^.NPfield^.NPhead IN [reducedpersproNP, jegenNP, 
zegenNP, hetNP]))
);globcond: BEGIN  BEGIN
SYNREL := argrel;
argrelfound := true;
IF nodetnp(b) 
THEN BEGIN
nodetnpfound2:= true;
nodetnpidvps2:= 
nodetnpidvps2 * LSAUXDOM_donodetidvps;
END;
END
END; END;
32: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.animate in [ yesanimate, omegaanimate]) AND
(Dative IN b^.ls^.NPfield^.cases) AND 
(NOT(b^.ls^.NPfield^.NPhead IN [reducedpersproNP, jegenNP, 
zegenNP, hetNP])) 
);globcond: BEGIN  BEGIN
SYNREL := indobjrel;
ionpfound := true;
VRionpfound := true;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countenfoundvar := true;
IF nodetnp(b) 
THEN BEGIN
nodetnpfound := true;
nodetnpidvps := 
nodetnpidvps * LSAUXDOM_ionodetidvps;
END;
END
END; END;
33: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ([nominative, accusative] * b^.ls^.NPfield^.cases <> []) AND
(b^.ls^.NPfield^.cases <> [Nominative]) AND
(NOT(b^.ls^.NPfield^.NPhead IN [reducedpersproNP, jegenNP, 
zegenNP, hetNP])) 
);globcond: BEGIN  BEGIN
SYNREL := objrel;
IF NOT (nominative IN b^.ls^.NPfield^.cases) 
THEN accobjfound := true;
objfound := true;
VRobjfound := true;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countenfoundvar := true;
IF nodetnp(b) 
THEN BEGIN
nodetnpfound := true;
nodetnpidvps := 
nodetnpidvps * LSAUXDOM_donodetidvps;
END;
END
END; END;
34: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ([nominative, accusative] * b^.ls^.NPfield^.cases <> []) AND
(b^.ls^.NPfield^.cases <> [Nominative]) AND
(NOT(b^.ls^.NPfield^.NPhead IN [reducedpersproNP, jegenNP, 
zegenNP, hetNP])) 
);globcond: BEGIN  BEGIN
SYNREL := dirargrel;
dirargrelfound := true;
dirargnpfound := true;
END
END; END;
35: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBPfield^.voice = passive) AND
(b^.ls^.VERBPfield^.Vmatrixhead = true) AND
(b^.ls^.VERBPfield^.modus = pastpart) AND
(b^.ls^.VERBPfield^.foundauxes = []) AND
(b^.ls^.VERBPfield^.synvpefs2 =[]) AND
(b^.ls^.VERBPfield^.objfound = false) AND
(b^.ls^.VERBPfield^.indobjfound = false) AND
(b^.ls^.VERBPfield^.adjvpefs = []) AND
(b^.ls^.VERBPfield^.countenfound = false)AND
(b^.ls^.VERBPfield^.vpcomplfound =false) 
);globcond: BEGIN  BEGIN
SYNREL := complrel;
vpcomplrelfound := true;
END
END; END;
36: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PROSENTfield^.so = true
);globcond: BEGIN  BEGIN
SYNREL := objrel;
prosentfound := true;
END
END; END;
37: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PROSENTfield^.so = true
);globcond: BEGIN  BEGIN
SYNREL := argrel;
argrelfound := true;
prosentfound := true;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( argandVRok AND
(modusvar <> imperative) AND
(particlekey = expparticle) AND
partinVcluster AND
(adjpostvpook OR prepobjok) AND
(verbpersonsvar <> [0]) AND
iodoandVRok AND
dirargnpok
);IF LIPRIMS_status THEN BEGIN
unreducedsynvpsvar := synvpefsvar;
unreducedsynvpsvar2:= synvpefsvar2;
VRfound := (synvpefsvar2 <> []);
synvpefsvar2 := synvpefsvar2 - LSAUXDOM_oblVRvps;
IF ((NOT (VRobjfound OR VRionpfound)) OR 
(Vrfound)
) AND
(NOT(argrelfound AND (NOT VRfound)))
THEN BEGIN
reducematrixvps(synvpefsvar);
IF bareVR
THEN synvpefsvar := synvpefsvar - LSAUXDOM_oblVRvps;
IF (statusvar IN [VV,teVV])
THEN synvpefsvar := synvpefsvar * LSAUXDOM_VRvps;
IF (objfound AND (NOT VRobjfound))
THEN synvpefsvar := synvpefsvar - LSAUXDOM_oblVRvps;
IF (ionpfound AND (NOT VRionpfound))
THEN synvpefsvar := synvpefsvar - LSAUXDOM_oblVRvps;
IF (NOT VRfound)
THEN BEGIN
reducevps(synvpefsvar);
IF nodetnpfound 
THEN synvpefsvar := synvpefsvar * nodetnpidvps;
END (*(verbraiservar = noVr) OR ...*)
ELSE BEGIN
reducevps(synvpefsvar2);
IF nodetnpfound2 
THEN synvpefsvar2:= synvpefsvar2* nodetnpidvps2;
END;
IF synvpsok
THEN BEGIN
(*Passive*)
IF (passive IN possvoicesvar) AND
(headstatusvar <> aanhetV ) AND 
(NOT progauxrelfound) AND
(NOT accobjfound) AND 
passheadok AND
passauxok
THEN BEGIN
top:=MAKET_stree(VERBP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.VERBPfield^.Vmatrixhead:= true;
top^.ls^.VERBPfield^.req := reqvar;
top^.ls^.VERBPfield^.env := envvar;
top^.ls^.VERBPfield^.voice := passive;
top^.ls^.VERBPfield^.synvpefs := synvpefsvar;
top^.ls^.VERBPfield^.thetavp := thetavpvar;
top^.ls^.VERBPfield^.foundauxes := foundauxesvar;
top^.ls^.VERBPfield^.modus := modusvar;
top^.ls^.VERBPfield^.classes := classesvar;
top^.ls^.VERBPfield^.aspect := omegaaspect;
top^.ls^.VERBPfield^.tense := tensevar;
top^.ls^.VERBPfield^.retro := false;
top^.ls^.VERBPfield^.preadvok := preadvok;
top^.ls^.VERBPfield^.objfound := objfound;
top^.ls^.VERBPfield^.indobjfound:= ionpfound;
top^.ls^.VERBPfield^.anterelativeok := anterelativeokvar;
top^.ls^.VERBPfield^.reflexivity := reflexivityvar;
top^.ls^.VERBPfield^.persons := verbpersonsvar;
top^.ls^.VERBPfield^.number := verbnumbervar;
top^.ls^.VERBPfield^.synvpefs2 := synvpefsvar2;
top^.ls^.VERBPfield^.adjuncts := adjunctsvar;
top^.ls^.VERBPfield^.adjvpefs := adjvpefsvar;
top^.ls^.VERBPfield^.countenfound := countenfoundvar;
top^.ls^.VERBPfield^.locargfound := locargrelfound;
top^.ls^.VERBPfield^.dirargfound := dirargrelfound;
top^.ls^.VERBPfield^.aanobjfound := aanobjrelfound;
top^.ls^.VERBPfield^.prepobjfound := prepobjrelfound;
top^.ls^.VERBPfield^.voorobjfound := voorobjrelfound;
top^.ls^.VERBPfield^.nppredfound := nppredrelfound;
top^.ls^.VERBPfield^.adjpppredfound := adjppredrelfound;
top^.ls^.VERBPfield^.prepppredfound := prepppredrelfound;
top^.ls^.VERBPfield^.strandedfound := strandedrelfound;
top^.ls^.VERBPfield^.postvpofound := postvporelfound;
top^.ls^.VERBPfield^.vpcomplfound := vpcomplrelfound;
IF (modusvar IN [indicative, subjunctive]) 
THEN top^.ls^.VERBPfield^.finiteness := finite
ELSE top^.ls^.VERBPfield^.finiteness := infinite;
IF top^.ls^.VERBPfield^.modus = infinitive 
THEN BEGIN
IF statusvar IN [bareV, VV, AuxV]
THEN top^.ls^.VERBPfield^.infsort := inf
ELSE top^.ls^.VERBPfield^.infsort := teinf;
END
ELSE top^.ls^.VERBPfield^.infsort := omegainf;
END (* if passive IN possvoicesvar etc.*);
(*Active*)
IF (active IN possvoicesvar) AND
(NOT (wordenaux IN foundauxesvar)) AND
(
(VRfound 
) OR 
(
(NOT doorbyrelfound) AND
(NOT doorbyfound) 
)
) AND 
perfauxok
THEN BEGIN
top:=MAKET_stree(VERBP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.VERBPfield^.Vmatrixhead:= true;
top^.ls^.VERBPfield^.req := reqvar;
top^.ls^.VERBPfield^.env := envvar;
top^.ls^.VERBPfield^.voice := active;
top^.ls^.VERBPfield^.synvpefs := synvpefsvar;
top^.ls^.VERBPfield^.thetavp := thetavpvar;
top^.ls^.VERBPfield^.foundauxes := foundauxesvar;
top^.ls^.VERBPfield^.modus := modusvar;
top^.ls^.VERBPfield^.tense := tensevar;
top^.ls^.VERBPfield^.classes := classesvar;
top^.ls^.VERBPfield^.aspect := omegaaspect;
top^.ls^.VERBPfield^.retro := false;
top^.ls^.VERBPfield^.preadvok := preadvok;
top^.ls^.VERBPfield^.objfound := objfound;
top^.ls^.VERBPfield^.indobjfound:= ionpfound;
top^.ls^.VERBPfield^.anterelativeok := anterelativeokvar;
top^.ls^.VERBPfield^.reflexivity := reflexivityvar;
top^.ls^.VERBPfield^.persons := verbpersonsvar;
top^.ls^.VERBPfield^.number := verbnumbervar;
top^.ls^.VERBPfield^.synvpefs2 := synvpefsvar2;
top^.ls^.VERBPfield^.adjuncts := adjunctsvar;
top^.ls^.VERBPfield^.adjvpefs := adjvpefsvar;
top^.ls^.VERBPfield^.countenfound := countenfoundvar;
top^.ls^.VERBPfield^.locargfound := locargrelfound;
top^.ls^.VERBPfield^.dirargfound := dirargrelfound;
top^.ls^.VERBPfield^.aanobjfound := aanobjrelfound;
top^.ls^.VERBPfield^.prepobjfound := prepobjrelfound;
top^.ls^.VERBPfield^.voorobjfound := voorobjrelfound;
top^.ls^.VERBPfield^.nppredfound := nppredrelfound;
top^.ls^.VERBPfield^.adjpppredfound := adjppredrelfound;
top^.ls^.VERBPfield^.prepppredfound := prepppredrelfound;
top^.ls^.VERBPfield^.strandedfound := strandedrelfound;
top^.ls^.VERBPfield^.postvpofound := postvporelfound;
top^.ls^.VERBPfield^.vpcomplfound := vpcomplrelfound;
IF (modusvar IN [indicative, subjunctive]) 
THEN top^.ls^.VERBPfield^.finiteness := finite
ELSE top^.ls^.VERBPfield^.finiteness := infinite;
IF top^.ls^.VERBPfield^.modus = infinitive 
THEN BEGIN
IF statusvar IN [bareV, VV, AuxV]
THEN top^.ls^.VERBPfield^.infsort := inf
ELSE top^.ls^.VERBPfield^.infsort := teinf;
END (*finiteness*);
END (*headfound; active*)
END (*synvpefsvar <> []*);
END (*IF ( (modusvar <> infinitive) OR
(statusvar IN [etc.])
) 
*);
(* modusvar = infinitive, which is not the matrix verb
eg. (hij kan) de boeken kopen 
*)
IF (modusvar = infinitive) AND
(NOT(statusvar IN [aanhetV])) AND
(Norealobjoriobjfound)
THEN BEGIN
IF VRfound
THEN synvpefsvar2 := unreducedsynvpsvar2
ELSE synvpefsvar2 := unreducedsynvpsvar;
synvpefsvar2 := synvpefsvar2 - LSAUXDOM_oblVRvps;
reducevps(synvpefsvar2);
IF (synvpefsvar2 <> [])
THEN BEGIN
top:=MAKET_stree(VERBP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.VERBPfield^.Vmatrixhead:= false;
top^.ls^.VERBPfield^.req := reqvar;
top^.ls^.VERBPfield^.env := envvar;
top^.ls^.VERBPfield^.voice := active;
top^.ls^.VERBPfield^.synvpefs := [];
top^.ls^.VERBPfield^.thetavp := thetavpvar;
top^.ls^.VERBPfield^.foundauxes := foundauxesvar;
top^.ls^.VERBPfield^.modus := modusvar;
top^.ls^.VERBPfield^.tense := tensevar;
top^.ls^.VERBPfield^.classes := classesvar;
top^.ls^.VERBPfield^.aspect := omegaaspect;
top^.ls^.VERBPfield^.retro := false;
top^.ls^.VERBPfield^.preadvok := preadvok;
top^.ls^.VERBPfield^.objfound := objfound;
top^.ls^.VERBPfield^.indobjfound:= ionpfound;
top^.ls^.VERBPfield^.finiteness := infinite;
top^.ls^.VERBPfield^.anterelativeok := false;
top^.ls^.VERBPfield^.reflexivity := reflexivityvar;
top^.ls^.VERBPfield^.persons := verbpersonsvar;
top^.ls^.VERBPfield^.number := verbnumbervar;
top^.ls^.VERBPfield^.synvpefs2 := synvpefsvar2;
top^.ls^.VERBPfield^.adjuncts := adjunctsvar;
top^.ls^.VERBPfield^.adjvpefs := adjvpefsvar;
top^.ls^.VERBPfield^.countenfound := countenfoundvar;
top^.ls^.VERBPfield^.locargfound := locargrelfound;
top^.ls^.VERBPfield^.dirargfound := dirargrelfound;
top^.ls^.VERBPfield^.aanobjfound := aanobjrelfound;
top^.ls^.VERBPfield^.prepobjfound := prepobjrelfound;
top^.ls^.VERBPfield^.voorobjfound := voorobjrelfound;
top^.ls^.VERBPfield^.nppredfound := nppredrelfound;
top^.ls^.VERBPfield^.adjpppredfound := adjppredrelfound;
top^.ls^.VERBPfield^.prepppredfound := prepppredrelfound;
top^.ls^.VERBPfield^.strandedfound := strandedrelfound;
top^.ls^.VERBPfield^.postvpofound := postvporelfound;
top^.ls^.VERBPfield^.vpcomplfound := vpcomplrelfound;
IF top^.ls^.VERBPfield^.modus = infinitive 
THEN BEGIN
IF statusvar IN [bareV, partV, VV, AuxV, prepV]
THEN top^.ls^.VERBPfield^.infsort := inf
ELSE top^.ls^.VERBPfield^.infsort := teinf
END (*top^.ls^.VERBPfield^.modus = infinitive*);
END (*IF (synvpefsvar <> []) THEN*)
END; (*modusvar = infinitive*)
END (*final action*)
END; END;
END;
END;{package}
PACKAGE NP1rulepack: [NP1rulerule];
VAR DETPfound : BOOLEAN;
pnunderCNfound : BOOLEAN;
specpnfound : BOOLEAN;
CNfound : BOOLEAN;
CNheadfound : BOOLEAN;
possadjfound : BOOLEAN;
modifiedADJPinCNfound : BOOLEAN;
qpunderdetpfound : BOOLEAN;
(*the next four parameters function together; 
cf. comment in finalaction*)
defarticlefound : BOOLEAN;
nonNUMmodrelfound : BOOLEAN;
NUMmodrelfound : BOOLEAN;
postmodrelfound : BOOLEAN; 
CNoptional : BOOLEAN;
WHDETfound : BOOLEAN;
definitepar : LSDOMAINT_deftype;
personpar : LSDOMAINT_persontype;
numberspar : LSDOMAINT_numberSETtype;
possnumberspar : LSDOMAINT_numberSETtype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
possgenipar : LSDOMAINT_possgenitype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
posscomaspar : LSDOMAINT_posscomaSETtype;
actcomaspar : LSDOMAINT_posscomaSETtype;
thetanppar : LSDOMAINT_thetanptype;
nounpatternefspar : LSDOMAINT_synpatternSETtype;
posspredpar : LSDOMAINT_posspredtype;
possnietnppar : LSDOMAINT_possnietnptype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
syntquantpar : LSDOMAINT_syntquanttype;
specQpar : LSDOMAINT_specQtype;
classpar : LSDOMAINT_timeadvclasstype;
deixispar : LSDOMAINT_deixistype;
aspectpar : LSDOMAINT_aspecttype;
retropar : LSDOMAINT_retrotype;
PROCEDURE NP1rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
 
FUNCTION noartunderdetp(t1:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=TRUE;
sonlist:=t1^.sons;
IF sonlist^.brother=NIL THEN
IF sonlist^.node^.cat IN [ART, DEMADJ] THEN result:=FALSE;
WHILE result AND (sonlist<>NIL) DO
BEGIN
IF sonlist^.node^.cat=DETP THEN 
IF sonlist^.relation=head THEN
result:=noartunderdetp(sonlist^.node);
sonlist:=sonlist^.brother
END;
noartunderdetp:=result;
END; (*noartunderdetp*)
FUNCTION noeenNUMunderdetp(t1:LSSTREE_pstree):BOOLEAN; 
(* This condition is supposed to be 
met if the head of the DETP
is not the numeral `een'; FJ, 19-12-88*)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=TRUE;
sonlist:=t1^.sons;
WHILE result AND (sonlist<>NIL) DO
BEGIN
IF sonlist^.node^.cat=NUM THEN 
IF sonlist^.relation=head THEN
BEGIN
IF sonlist^.node^.ls^.numfield^.key=auxkey('een1NUMkey')
 THEN result:=FALSE;
END;
sonlist:=sonlist^.brother
END;
noeenNUMunderdetp:=result;
END; (*noeenNUMunderdetp*)
FUNCTION defartunderdetp(t1:LSSTREE_pstree):BOOLEAN; 
(* This condition is supposed to be 
met if the head of the DETP
is a definite article; FJ, 19-12-88.
It is relevant to block headless NPs such as
de twee EN, het EN dorp uit, etc. *)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT (result) AND (sonlist<>NIL) DO
BEGIN
IF sonlist^.node^.cat=ART THEN 
IF sonlist^.relation=head THEN
BEGIN
IF sonlist^.node^.ls^.artfield^.definite= def THEN result:= TRUE;
END;
sonlist:=sonlist^.brother
END;
defARTunderdetp:=result;
END; (*defartunderdetp*)
FUNCTION headundercn(t1:LSSTREE_pstree):BOOLEAN; (*FJ; 03-10-89*)
(*this function is used to assign
the value ennp for .NPhead in the proper 
cases*)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT(result) AND (sonlist<>NIL) DO
BEGIN
IF ((sonlist^.node^.cat=NOUN) AND (sonlist^.relation=head)) THEN
result:=TRUE;
sonlist:=sonlist^.brother
END;
headundercn:=result;
END; (*headundercn*)
FUNCTION nonNUMmodundercn(t1:LSSTREE_pstree):BOOLEAN; (*FJ; 03-10-89*)
(*in combination with the function 
defARTunderDETP, nummodundercn, and
postmodundercn, this function is 
relevant to exclude headless NPs such
as 'de twee EN', 'het EN dorp uit'.*)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT(result) AND (sonlist<>NIL) DO
BEGIN
IF ((sonlist^.node^.cat <> DETP) AND (sonlist^.relation=modrel)) THEN
result:=TRUE;
sonlist:=sonlist^.brother
END;
nonNUMmodundercn:=result;
END; (*nonNUMmodundercn*)
FUNCTION NUMmodundercn(t1:LSSTREE_pstree):BOOLEAN; (*FJ; 03-10-89*)
(*in combination with the function 
defARTunderDETP, nonnummodundercn, and
postmodundercn, this function is 
relevant to exclude headless NPs such
as 'de twee EN', 'het EN dorp uit'.*)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT(result) AND (sonlist<>NIL) DO
BEGIN
IF ((sonlist^.node^.cat = DETP) AND (sonlist^.relation=modrel)) THEN
result:=TRUE;
sonlist:=sonlist^.brother
END;
NUMmodundercn:=result;
END; (*NUMmodundercn*)
FUNCTION postmodundercn(t1:LSSTREE_pstree):BOOLEAN; (*FJ; 03-10-89*)
(*in combination with the function 
defARTunderDETP, nummodundercn, and
postmodundercn, this function is 
relevant to exclude headless NPs such
as 'de twee EN', 'het EN dorp uit'.*)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT(result) AND (sonlist<>NIL) DO
BEGIN
IF ((sonlist^.node^.cat IN [SENTENCE, PREPP]) 
AND (sonlist^.relation = postmodrel)) THEN
result:=TRUE;
sonlist:=sonlist^.brother
END;
postmodundercn:=result;
END; (*postmodundercn*)
(* ook in lssurfquo:*)
FUNCTION qpunderdetp(t1:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT(result) AND (sonlist<>NIL) DO
BEGIN
IF sonlist^.node^.cat=QP THEN result:=TRUE;
sonlist:=sonlist^.brother
END;
qpunderdetp:=result;
END; (*qpunderdetp*)
FUNCTION pnundercn(t1:LSSTREE_pstree):BOOLEAN; (*JO*)
VAR result:BOOLEAN;
son, sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT(result) AND (sonlist<>NIL) DO
BEGIN
IF sonlist^.node^.cat=NOUN THEN BEGIN 
result:=TRUE;
son := sonlist^.node^.sons
END;
sonlist:=sonlist^.brother
END;
IF result THEN result := (son <> NIL);
IF result THEN BEGIN
result := (son^.node^.cat = SUBNOUN);
IF result THEN son := son^.node^.sons;
END;
IF result THEN result := (son <> NIL);
IF result THEN BEGIN
result := (son^.node^.cat = BPROPERNOUN);
END;
pnundercn:=result;
END (*pnundercn*);
FUNCTION postmodPNundercn(t1:LSSTREE_pstree):BOOLEAN; (*FJ; 03-10-89*)
(*this function is 
relevant to determine the set the 
value for definiteness to def in case 
of detless count singular NPs *)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT(result) AND (sonlist<>NIL) DO
BEGIN
IF ((sonlist^.node^.cat IN [PROPERNOUN]) AND
(sonlist^.relation = postmodrel)) THEN
result:=TRUE;
sonlist:=sonlist^.brother
END;
postmodPNundercn:=result;
END; (*postmodPNundercn*)
FUNCTION pnundercnok : BOOLEAN;
BEGIN
pnundercnok := ((NOT pnundercnfound) OR 
(possadjfound OR detpfound ) 
);
END (*pnundercnok*);

BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
pnundercnfound := false;
specpnfound := false;
qpunderdetpfound := false;
possadjfound := false;
DETPfound := false;
CNfound := false;
CNheadfound := false;
defarticlefound := false;
nonNUMmodrelfound := false;
NUMmodrelfound := false;
postmodrelfound := false;
CNoptional := true;
WHDETfound := false;
definitepar := omegadef ; 
personpar := 3;
numberspar := []; 
possnumberspar := [singular, plural]; (*JO*)
casespar := [nominative, accusative, dative];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
possgenipar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
posscomaspar := [];
actcomaspar := [];
thetanppar := omegathetanp;
nounpatternefspar := [];
posspredpar := false;
possnietnppar := false;
detnpmoodpar := declxpmood;
syntquantpar := Omegaquant;
specQpar := omegaspec; 
classpar := omegaTimeAdvClass;
deixispar := omegadeixis;
aspectpar := omegaAspect;
retropar := false;
END;
1 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.POSSADJfield^.eORenForm <> enForm) AND
(b^.ls^.POSSADJfield^.geni = false)
);globcond: BEGIN  BEGIN
SYNREL := detrel;
detnpmoodpar := b^.ls^.POSSADJfield^.mood;
IF b^.ls^.POSSADJfield^.mood = wh THEN definitepar := indef
ELSE definitepar := def;
possnumberspar := [singular, plural];
posspredpar := true;
posscomaspar := [count,mass];
DETPfound := true;
possadjfound := true;
END
END; END;
2 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.DETPfield^.eORenForm <> enForm) AND
noeenNUMunderdetp(b)
);globcond: BEGIN  BEGIN
SYNREL := detrel;
qpunderdetpfound:=qpunderdetp(b);
cnoptional:=noartunderdetp(b);
defarticlefound := defARTunderdetp(b);
possnietnppar := b^.ls^.DETPfield^.possnietnp;
definitepar := b^.ls^.DETPfield^.definite;
posspredpar := b^.ls^.DETPfield^.posspred;
syntquantpar := b^.ls^.DETPfield^.syntquant;
posscomaspar := b^.ls^.DETPfield^.posscomas;
possnumberspar := b^.ls^.DETPfield^.possnumbers;
detnpmoodpar := b^.ls^.DETPfield^.mood; (*JO*)
IF b^.ls^.DETPfield^.mood = wh
THEN WHDETfound := true;
DETPfound := true;
END
END; END;
3 :CASE mode OF
loccond:LIPRIMS_assignstatus( (genitive IN b^.ls^.NPfield^.cases) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := detrel;
possnietnppar := b^.ls^.NPfield^.possnietnp;
definitepar := def;
posspredpar := true;
syntquantpar := omegaquant;
detnpmoodpar := b^.ls^.NPfield^.mood; 
posscomaspar := [count,mass];
DETPfound := true
END
END; END;
4 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
modifiedADJPinCNfound := modifiedADJPinCN(b);
IF (definitepar = omegadef)
THEN definitepar := indef;
IF NOT DETPfound 
THEN BEGIN
posspredpar := true;
possnietnppar := true;
END;
numberspar := b^.ls^.CNfield^.numbers;
casespar := b^.ls^.CNfield^.cases;
genderspar := b^.ls^.CNfield^.genders;
sexespar := b^.ls^.CNfield^.sexes;
actsubcspar := b^.ls^.CNfield^.actsubcs;
temporalpar := b^.ls^.CNfield^.temporal;
possgenipar := b^.ls^.CNfield^.possgeni;
animatepar := b^.ls^.CNfield^.animate;
humanpar := b^.ls^.CNfield^.human;
thetanppar := b^.ls^.CNfield^.thetanp;
nounpatternefspar := b^.ls^.CNfield^.nounpatternefs;
classpar := b^.ls^.CNfield^.class;
deixispar := b^.ls^.CNfield^.deixis;
aspectpar := b^.ls^.CNfield^.aspect;
retropar := b^.ls^.CNfield^.retro;
IF plural IN numberspar 
THEN actcomaspar := [count] 
ELSE IF ((DETPfound = true) AND
(posscomaspar = [count]))
THEN actcomaspar := [count] 
ELSE IF ((NOT DETPfound) AND
(mass in posscomaspar))
THEN actcomaspar := [mass]
ELSE actcomaspar := b^.ls^.CNfield^.posscomas; 
thetanppar := b^.ls^.CNfield^.thetanp;
CNfound := true;
nonNUMmodrelfound := nonnummodundercn(b);
NUMmodrelfound := nummodundercn(b);
postmodrelfound := postmodundercn(b); 
CNheadfound := headundercn(b);
pnundercnfound := pnundercn(b);
specpnfound := postmodPNundercn(b);
END
END; END;
5 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := extraposrel;
END
END; END;
6 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.headkey = auxkey('vanprepkey')
) AND
(b^.ls^.PREPPfield^.coord <> corrcoord) 
);globcond: BEGIN  BEGIN
SYNREL := extraposrel;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( (pnundercnok) AND
(DETPfound OR CNfound) AND 
(CNfound OR CNoptional) AND
((NOT possadjfound) OR
CNfound
) (*JO 13-SEP-1988 14:00:22*) 
AND
(possadjfound <= Cnheadfound) (*JO 29-MAY-1990 21:33:00 *)
);IF LIPRIMS_status THEN BEGIN
IF ((CNfound= true ) AND
(CNheadfound = true) AND
(singular IN possnumberspar) AND
(singular IN numberspar)
) (*FJ 26-09-1988*)
THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := singular;
IF detnpmoodpar <> declxpmood THEN 
top^.ls^.NPfield^.mood := detnpmoodpar;
IF ((NOT DETPfound ) AND
(specPNfound) AND
(actsubcspar * [professionnoun, institutename]
<> []) AND
(count IN actcomaspar))
THEN definitepar := def ;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.possgeni := possgenipar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := actcomaspar;
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.generic := omegageneric;
top^.ls^.NPfield^.possRform := false;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := otherNP;
top^.ls^.NPfield^.specQ := yesspec; (*JO; dit is fout, maar voor testen
even zo gedaan*)
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
END;
IF ((CNfound = true) AND 
(CNheadfound = true) AND
(plural IN possnumberspar) AND
(plural IN numberspar)
)
THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := plural;
IF detnpmoodpar <> declxpmood THEN 
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.possgeni := possgenipar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := actcomaspar; 
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.generic := omegageneric;
top^.ls^.NPfield^.possRform := false;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := otherNP;
top^.ls^.NPfield^.specQ := yesspec; (*JO, fout maar voor het testen*)
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
END;
IF ((CNfound = false) AND (*JO 2meest6-OCT-1988 17:29:40*)
(singular IN possnumberspar) AND
(mass IN posscomaspar)
)
THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := singular;
IF detnpmoodpar <> declxpmood THEN 
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.possgeni := possgenipar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := [mass]; 
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.generic := omegageneric;
top^.ls^.NPfield^.possRform := false;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := enokNP;
top^.ls^.NPfield^.specQ := yesspec; (*JO, fout maar voor het testen*)
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
END;
IF ((CNfound = true) AND (*FJ 03-OCT-1989: 
twee oude EN; die twee EN*)
(CNheadfound = false) AND
(plural IN possnumberspar) AND
(count IN posscomaspar) AND
(* next subcondition should exlude: 
'de twee EN', 'de EN trappen op'*) 
(NOT(
(defarticlefound) AND 
(NOT ((nonnummodrelfound) OR
( (nummodrelfound) AND
(postmodrelfound)
)
)
)
)
)
)
THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := plural;
IF detnpmoodpar <> declxpmood THEN 
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.possgeni := possgenipar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := [count]; 
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.generic := omegageneric;
top^.ls^.NPfield^.possRform := false;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := enokNP;
top^.ls^.NPfield^.specQ := yesspec; (*JO, fout maar voor het testen*)
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
END;
IF ((CNfound = true) AND (*FJ 03-OCT-1989: 
een oude EN, die gele EN*)
(CNheadfound = false) AND
(singular IN possnumberspar) AND
(count IN posscomaspar) AND
(* next subcondition should exlude: 
'de twee EN', 'de EN trappen op'*) 
(NOT(
(defarticlefound) AND 
(NOT ((nonnummodrelfound) OR
( (nummodrelfound) AND
(postmodrelfound)
)
)
)
)
)
)
THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := singular;
IF detnpmoodpar <> declxpmood THEN 
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.possgeni := possgenipar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := [count]; 
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.generic := omegageneric;
top^.ls^.NPfield^.possRform := false;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := enokNP;
top^.ls^.NPfield^.specQ := yesspec; (*JO, fout maar voor het testen*)
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
END;
IF ((CNfound = false) AND 
(singular IN possnumberspar) AND
(count IN posscomaspar)
) 
THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := singular;
IF detnpmoodpar <> declxpmood THEN 
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.possgeni := possgenipar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := [count]; 
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.generic := omegageneric;
top^.ls^.NPfield^.possRform := false;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := enNP;
top^.ls^.NPfield^.specQ := yesspec; (*JO, fout maar voor het testen*)
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
END;
IF ((NOT CNfound) AND 
(plural IN possnumberspar))
THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := plural;
IF detnpmoodpar <> declxpmood THEN 
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.possgeni := possgenipar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := [count]; 
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.generic := omegageneric;
top^.ls^.NPfield^.possRform := false;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := enNP;
top^.ls^.NPfield^.specQ := yesspec; (*JO, fout maar voor het testen*)
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
END;
END
END; END;
END;
END;{package}
PACKAGE NP1arulepack: [NP1arulerule];
VAR CNheadfound : BOOLEAN;
definitepar : LSDOMAINT_deftype;
personpar : LSDOMAINT_persontype;
numberspar : LSDOMAINT_numberSETtype;
possnumberspar : LSDOMAINT_numberSETtype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
possgenipar : LSDOMAINT_possgenitype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
posscomaspar : LSDOMAINT_posscomaSETtype;
actcomaspar : LSDOMAINT_posscomaSETtype;
thetanppar : LSDOMAINT_thetanptype;
nounpatternefspar : LSDOMAINT_synpatternSETtype;
posspredpar : LSDOMAINT_posspredtype;
possnietnppar : LSDOMAINT_possnietnptype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
syntquantpar : LSDOMAINT_syntquanttype;
specQpar : LSDOMAINT_specQtype;
classpar : LSDOMAINT_timeadvclasstype;
deixispar : LSDOMAINT_deixistype;
aspectpar : LSDOMAINT_aspecttype;
retropar : LSDOMAINT_retrotype;
(*this rule NP1arule is meant for NPs consisting of 
numeral "een" as DETP, possibly followed by a PP:  een met een strikje *)
PROCEDURE NP1arulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

FUNCTION eenNUMunderdetp(t1:LSSTREE_pstree):BOOLEAN; 
(* This condition is supposed to be 
met if the head of the DETP
is the numeral `een'; FJ, 19-11-89*)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE result AND (sonlist<>NIL) DO
BEGIN
IF sonlist^.node^.cat=NUM THEN 
IF sonlist^.relation=head THEN
BEGIN
IF sonlist^.node^.ls^.numfield^.key=auxkey('een1NUMkey')
 THEN result:=TRUE;
END;
sonlist:=sonlist^.brother
END;
eenNUMunderdetp:=result;
END; (*eenNUMunderdetp*)
FUNCTION headundercn(t1:LSSTREE_pstree):BOOLEAN; (*FJ; 03-10-89*)
(*this function is also used to assign
the value ennp for .NPhead in the proper 
cases*)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT(result) AND (sonlist<>NIL) DO
BEGIN
IF ((sonlist^.node^.cat=NOUN) AND (sonlist^.relation=head)) THEN
result:=TRUE;
sonlist:=sonlist^.brother
END;
headundercn:=result;
END; (*headundercn*)

BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
CNheadfound := false;
definitepar := omegadef ; 
personpar := 3;
numberspar := []; 
possnumberspar := [singular, plural]; (*JO*)
casespar := [nominative, accusative, dative];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
possgenipar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
posscomaspar := [];
actcomaspar := [];
thetanppar := omegathetanp;
nounpatternefspar := [];
posspredpar := false;
possnietnppar := false;
detnpmoodpar := declxpmood;
syntquantpar := Omegaquant;
specQpar := omegaspec; 
classpar := omegaTimeAdvClass;
deixispar := omegadeixis;
aspectpar := omegaAspect;
retropar := false;
END;
2 :CASE mode OF
loccond:LIPRIMS_assignstatus( eenNUMunderdetp(b)
);globcond: BEGIN  BEGIN
SYNREL := detrel;
possnietnppar := b^.ls^.DETPfield^.possnietnp;
definitepar := b^.ls^.DETPfield^.definite;
posspredpar := b^.ls^.DETPfield^.posspred;
syntquantpar := b^.ls^.DETPfield^.syntquant;
posscomaspar := b^.ls^.DETPfield^.posscomas;
possnumberspar := b^.ls^.DETPfield^.possnumbers;
detnpmoodpar := b^.ls^.DETPfield^.mood; (*JO*)
END
END; END;
4 :CASE mode OF
loccond:LIPRIMS_assignstatus( headundercn(b) = false
);globcond: BEGIN  BEGIN
SYNREL := head;
numberspar := b^.ls^.CNfield^.numbers;
casespar := b^.ls^.CNfield^.cases;
genderspar := b^.ls^.CNfield^.genders;
sexespar := b^.ls^.CNfield^.sexes;
actsubcspar := b^.ls^.CNfield^.actsubcs;
temporalpar := b^.ls^.CNfield^.temporal;
possgenipar := b^.ls^.CNfield^.possgeni;
animatepar := b^.ls^.CNfield^.animate;
humanpar := b^.ls^.CNfield^.human;
thetanppar := b^.ls^.CNfield^.thetanp;
nounpatternefspar := b^.ls^.CNfield^.nounpatternefs;
classpar := b^.ls^.CNfield^.class;
deixispar := b^.ls^.CNfield^.deixis;
aspectpar := b^.ls^.CNfield^.aspect;
retropar := b^.ls^.CNfield^.retro;
thetanppar := b^.ls^.CNfield^.thetanp;
CNheadfound := headundercn(b);
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( CNheadfound = false
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := singular;
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.possgeni := possgenipar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := [count];
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.generic := omegageneric;
top^.ls^.NPfield^.possRform := false;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := enNP;
top^.ls^.NPfield^.specQ := yesspec; (*JO; dit is fout, maar voor testen
even zo gedaan*)
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
END;
END; END;
END;
END;{package}
PACKAGE NP2rulepack: [NP2rulerule];
VAR PROfound : BOOLEAN;
definitepar : LSDOMAINT_deftype;
personpar : LSDOMAINT_persontype;
numberpar : LSDOMAINT_numbertype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
possgenipar : LSDOMAINT_possgenitype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
actcomaspar : LSDOMAINT_posscomaSETtype;
posspredpar : LSDOMAINT_posspredtype;
possnietnppar : LSDOMAINT_possnietnptype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
genericpar : LSDOMAINT_generictype;
possRformpar : LSDOMAINT_possRformtype;
syntquantpar : LSDOMAINT_syntquanttype;
NPheadpar : LSDOMAINT_NPheadtype;
specQpar : LSDOMAINT_specQtype;
classpar : LSDOMAINT_timeadvclasstype;
deixispar : LSDOMAINT_deixistype;
aspectpar : LSDOMAINT_aspecttype;
retropar : LSDOMAINT_retrotype;
indefproheadfound : BOOLEAN; (*JO 24-MAR-1989 10: 51: 45 *)
propernounheadfound: BOOLEAN; (*JO 24-MAR-1989 10: 52: 11 *)

PROCEDURE NP2rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
PROfound := false;
definitepar := omegadef;
personpar := 3;
numberpar := singular;
casespar := [nominative, accusative, dative];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
possgenipar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
actcomaspar := [count];
posspredpar := false;
possnietnppar := false;
detnpmoodpar := declxpmood;
genericpar := omegageneric;
possRformpar := false;
syntquantpar := Omegaquant;
NPheadpar := otherNP;
specQpar := omegaspec; 
classpar := omegaTimeAdvClass;
deixispar := omegadeixis;
aspectpar := omegaAspect;
retropar := false;
indefproheadfound := false; (*JO 24-MAR-1989 10:51:45 *)
propernounheadfound := false; (*JO 24-MAR-1989 10:52:11 *)
END;
1 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
definitepar := def;
possRformpar := true;
IF b^.ls^.DEMPROfield^.key = auxkey('datDEMPROkey')
 
THEN BEGIN
NPheadpar := datNP;
actcomaspar := [];
animatepar := noanimate;
humanpar := nohuman;
END
ELSE IF b^.ls^.DEMPROfield^.key = auxkey('ditDEMPROkey')
 
THEN BEGIN
NPheadpar := ditNP;
actcomaspar := [];
animatepar := noanimate;
humanpar := nohuman;
END
ELSE IF b^.ls^.DEMPROfield^.key = auxkey('dieDEMPROkey')
 
THEN NPheadpar := dieNP;
(* ELSE default *)
specqpar := yesspec ; (*JO*)
END
END; END;
2 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
PROfound := true;
definitepar := def;
personpar := b^.ls^.PERSPROfield^.person;
numberpar := b^.ls^.PERSPROfield^.number;
casespar := b^.ls^.PERSPROfield^.persprocases;
genderspar := [b^.ls^.PERSPROfield^.gender];
animatepar := b^.ls^.PERSPROfield^.animate;
specqpar := yesspec; (*JO*)
posspredpar := true; (*JO*)
IF (b^.ls^.PERSPROfield^.NPhead = persproNP) AND
(b^.ls^.PERSPROfield^.reduced = true)
THEN NPheadpar := reducedpersproNP (*JO*)
ELSE NPheadpar := b^.ls^.PERSPROfield^.NPhead;
possRformpar := b^.ls^.PERSPROfield^.possRform; (*JO*)
(* assuming posspred = false (default) *)
END
END; END;
3 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
indefproheadfound := true;
PROfound := true;
definitepar := b^.ls^.INDEFPROfield^.definite;
numberpar := b^.ls^.INDEFPROfield^.number;
possgenipar := b^.ls^.INDEFPROfield^.possgeni;
animatepar := b^.ls^.INDEFPROfield^.animate;
possnietnppar := b^.ls^.INDEFPROfield^.possnietnp;
possRformpar := b^.ls^.INDEFPROfield^.possRform;
syntquantpar := b^.ls^.INDEFPROfield^.syntquant;
NPheadpar := b^.ls^.INDEFPROfield^.NPhead; (*JO*)
specQpar := yesspec; (* FJ; 16-01-89*)
(* IF NPheadpar = menNP THEN specQpar := yesspec
ELSE specqpar := nospec; JO
tussen haken door FJ 16-01-89 *)
posspredpar := true; (*JO*)
IF NPheadpar=menNP 
THEN casespar:=[nominative];(*JO*)
IF b^.ls^.INDEFPROfield^.geni 
THEN casespar := [genitive]; (*JO*)
IF b^.ls^.INDEFPROfield^.animate = yesanimate (*JO*)
THEN humanpar := yeshuman;
IF b^.ls^.INDEFPROfield^.animate = noanimate (*JO*)
THEN humanpar := nohuman;
(* assuming posspred = false (default) *)
END
END; END;
4 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
PROfound := true;
definitepar := indef;
numberpar := b^.ls^.WHPROfield^.number;
sexespar := b^.ls^.WHPROfield^.sexes; 
animatepar := b^.ls^.WHPROfield^.animate;
possRformpar := b^.ls^.WHPROfield^.possRform;
detnpmoodpar := wh;
specqpar := yesspec; (*JO*)
posspredpar := true; (*JO*)
syntquantpar := omegaquant ; (*JO*)
IF b^.ls^.WHPROfield^.animate = noanimate
THEN BEGIN
NPheadpar := watwhproNP;
humanpar := nohuman;
END
ELSE humanpar := yeshuman;
END
END; END;
5 :CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PROPERNOUNfield^.subc <> monthnoun
);globcond: BEGIN  BEGIN
SYNREL := head;
PROfound := true;
propernounheadfound := true;
numberpar := b^.ls^.PROPERNOUNfield^.number;
genderspar := b^.ls^.PROPERNOUNfield^.genders;
sexespar := b^.ls^.PROPERNOUNfield^.sexes;
actsubcspar := [b^.ls^.PROPERNOUNfield^.subc];
temporalpar := b^.ls^.PROPERNOUNfield^.temporal;
possgenipar := b^.ls^.PROPERNOUNfield^.possgeni;
humanpar := b^.ls^.PROPERNOUNfield^.human;
animatepar := b^.ls^.PROPERNOUNfield^.animate;
definitepar := def;
posspredpar := true;
specqpar := yesspec; (*JO*)
classpar := b^.ls^.PROPERNOUNfield^.class;
deixispar := b^.ls^.PROPERNOUNfield^.deixis;
aspectpar := b^.ls^.PROPERNOUNfield^.aspect;
retropar := b^.ls^.PROPERNOUNfield^.retro;
IF b^.ls^.PROPERNOUNfield^.geni THEN casespar := [genitive]; 
(*JO*)
END
END; END;
6 :CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) (*JO*) (*unless there are 
further are restrictions on prepsubcs *) 
AND ( b^.ls^.PREPPfield^.headkey <> auxkey('vanprepkey')
) AND 
(b^.ls^.PREPPfield^.coord <> corrcoord) AND
(b^.ls^.PREPPfield^.actsubcefs * [loc, dir, temp, comitative] <> [])
);globcond: BEGIN  BEGIN
SYNREL := postmodrel
END
END; END;
7 :CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) (*JO*) (*unless there are 
further are restrictions on prepsubcs *) 
AND (b^.ls^.PREPPfield^.headkey = auxkey('vanprepkey')
) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := posrel
END
END; END;
8: (*added by JO 24-MAR-1989 10:58:40 *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.mood = relative) AND
(b^.ls^.SENTENCEfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := postmodrel;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.number := numberpar;
top^.ls^.NPfield^.person := personpar;
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.sexes := sexespar; (* 1,2,3 have default: [] *)
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.possgeni := possgenipar; (* 2,4 have default: false *)
top^.ls^.NPfield^.animate := animatepar; (* 1 has default: omega *)
top^.ls^.NPfield^.human := humanpar; (* 1,2,3,4 have default: omega *)
top^.ls^.NPfield^.actcomas := actcomaspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.generic := genericpar;
top^.ls^.NPfield^.possRform := possRformpar;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := NPheadpar;
top^.ls^.NPfield^.specQ := specQpar;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
top^.ls^.NPfield^.genders := genderspar; (*JO*)
END
END; END;
END;
END;{package}
PACKAGE NP3rulepack: [NP3rulerule];
VAR preADVfound : BOOLEAN;
definitepar : LSDOMAINT_deftype;
personpar : LSDOMAINT_persontype;
numberpar : LSDOMAINT_numbertype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
possgenipar : LSDOMAINT_possgenitype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
actcomaspar : LSDOMAINT_posscomaSETtype;
thetanppar : LSDOMAINT_thetanptype;
nounpatternefspar : LSDOMAINT_synpatternSETtype;
posspredpar : LSDOMAINT_posspredtype;
possnietnppar : LSDOMAINT_possnietnptype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
genericpar : LSDOMAINT_generictype;
possRformpar : LSDOMAINT_possRformtype;
syntquantpar : LSDOMAINT_syntquanttype;
NPheadpar : LSDOMAINT_NPheadtype;
specQpar : LSDOMAINT_specQtype;
classpar : LSDOMAINT_timeadvclasstype;
deixispar : LSDOMAINT_deixistype;
aspectpar : LSDOMAINT_aspecttype;
retropar : LSDOMAINT_retrotype;

PROCEDURE NP3rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
preADVfound := false;
definitepar := omegadef;
personpar := 3;
numberpar := singular;
casespar := [nominative];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
possgenipar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
actcomaspar := [count];
thetanppar := omegathetanp;
nounpatternefspar := [];
posspredpar := false;
possnietnppar := false;
detnpmoodpar := declxpmood;
genericpar := omegageneric;
possRformpar := false;
syntquantpar := Omegaquant;
NPheadpar := otherNP;
specQpar := omegaspec;
classpar := omegaTimeAdvClass;
deixispar := omegadeixis;
aspectpar := omegaAspect;
retropar := false;
END;
1 :CASE mode OF
loccond:LIPRIMS_assignstatus( PreXPAdv IN b^.ls^.ADVPfield^.actsubcefs
);globcond: BEGIN  BEGIN
SYNREL := modrel;
preADVfound := true
END
END; END;
2 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.mood = declxpmood) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := head;
definitepar := b^.ls^.NPfield^.definite;
personpar := b^.ls^.NPfield^.person;
numberpar := b^.ls^.NPfield^.number;
casespar := b^.ls^.NPfield^.cases;
genderspar := b^.ls^.NPfield^.genders;
sexespar := b^.ls^.NPfield^.sexes;
actsubcspar := b^.ls^.NPfield^.actsubcs;
temporalpar := b^.ls^.NPfield^.temporal;
possgenipar := b^.ls^.NPfield^.possgeni;
animatepar := b^.ls^.NPfield^.animate;
humanpar := b^.ls^.NPfield^.human;
actcomaspar := b^.ls^.NPfield^.actcomas;
thetanppar := b^.ls^.NPfield^.thetanp;
nounpatternefspar := b^.ls^.NPfield^.nounpatternefs; 
posspredpar := b^.ls^.NPfield^.posspred;
possnietnppar := b^.ls^.NPfield^.possnietnp;
detnpmoodpar := b^.ls^.NPfield^.mood;
genericpar := b^.ls^.NPfield^.generic;
possRformpar := b^.ls^.NPfield^.possRform;
syntquantpar := b^.ls^.NPfield^.syntquant;
NPheadpar := b^.ls^.NPfield^.NPhead;
specqpar := b^.ls^.NPfield^.specq;
classpar := b^.ls^.NPfield^.class;
deixispar := b^.ls^.NPfield^.deixis;
aspectpar := b^.ls^.NPfield^.aspect;
retropar := b^.ls^.NPfield^.retro;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := personpar;
top^.ls^.NPfield^.number := numberpar;
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.possgeni := possgenipar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := actcomaspar;
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.mood := detnpmoodpar; 
top^.ls^.NPfield^.generic := genericpar;
top^.ls^.NPfield^.possRform := possRformpar;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := NPheadpar;
top^.ls^.NPfield^.specQ := specQpar;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
END
END; END;
END;
END;{package}
PACKAGE NP4rulepack: [NP4rulerule];
VAR definitepar : LSDOMAINT_deftype;

PROCEDURE NP4rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
definitepar := omegadef
END;
1 :CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.RECIPROfield^.geni = false
);globcond: BEGIN  BEGIN
SYNREL := head
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.definite := def; (* *)
top^.ls^.NPfield^.number := plural;
top^.ls^.NPfield^.cases := [dative,accusative];
top^.ls^.NPfield^.actcomas := [count];
top^.ls^.NPfield^.NPhead := elkaarNP;
top^.ls^.NPfield^.generic := omegageneric;
top^.ls^.NPfield^.specQ := yesspec; (* JO*)
top^.ls^.NPfield^.posspred := true;
(* the other attributes have default value *)
END
END; END;
END;
END;{package}
PACKAGE NP5rulepack: [NP5rulerule];
VAR numberpar : LSDOMAINT_numbertype;
personpar : LSDOMAINT_persontype;

PROCEDURE NP5rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
numberpar := singular;
personpar := 3
END;
1 :CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.REFLPROfield^.zelf = true
);globcond: BEGIN  BEGIN
SYNREL := head;
numberpar := b^.ls^.REFLPROfield^.number;
personpar := b^.ls^.REFLPROfield^.person
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.definite := def;
top^.ls^.NPfield^.person := personpar;
top^.ls^.NPfield^.number := numberpar;
top^.ls^.NPfield^.cases := [dative,accusative];
top^.ls^.NPfield^.thetanp := omegathetanp;
top^.ls^.NPfield^.generic := omegageneric;
top^.ls^.NPfield^.NPhead := zichzelfNP;
top^.ls^.NPfield^.specQ := yesspec; (* JO*)
IF personpar <> 3
THEN top^.ls^.NPfield^.animate := yesanimate;
(* the other attributes have default value *)
END
END; END;
END;
END;{package}
PACKAGE NP6rulepack: [NP6rulerule];
VAR 
definitepar : LSDOMAINT_deftype;
personpar : LSDOMAINT_persontype;
numberpar : LSDOMAINT_numbertype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
possgenipar : LSDOMAINT_possgenitype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
actcomaspar : LSDOMAINT_posscomaSETtype;
thetanppar : LSDOMAINT_thetanptype;
nounpatternefspar : LSDOMAINT_synpatternSETtype;
genericpar : LSDOMAINT_generictype;
possRformpar : LSDOMAINT_possRformtype;
NPheadpar : LSDOMAINT_NPheadtype;
posspredpar : LSDOMAINT_posspredtype;
possnietnppar : LSDOMAINT_possnietnptype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
syntquantpar : LSDOMAINT_syntquanttype;
specQpar : LSDOMAINT_specQtype;
classpar : LSDOMAINT_timeadvclasstype;
deixispar : LSDOMAINT_deixistype;
aspectpar : LSDOMAINT_aspecttype;
retropar : LSDOMAINT_retrotype;

PROCEDURE NP6rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
definitepar := omegadef ; 
personpar := 3;
numberpar := omeganumber; 
casespar := [nominative, accusative, dative];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
possgenipar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
actcomaspar := [];
thetanppar := omegathetanp;
nounpatternefspar := [];
genericpar := omegageneric;
possRformpar := false;
NPheadpar := otherNP;
posspredpar := false;
possnietnppar := false;
detnpmoodpar := declxpmood;
syntquantpar := Omegaquant;
specQpar := omegaspec; 
classpar := omegaTimeAdvClass;
deixispar := omegadeixis;
aspectpar := omegaAspect;
retropar := false;
END;
1 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.NPhead IN [persproNP, othernp, allesnp]) AND
( b^.ls^.NPfield^.mood = declxpmood) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := head;
definitepar := b^.ls^.NPfield^.definite; 
personpar := b^.ls^.NPfield^.person;
numberpar := b^.ls^.NPfield^.number;
casespar := b^.ls^.NPfield^.cases;
genderspar := b^.ls^.NPfield^.genders;
sexespar := b^.ls^.NPfield^.sexes;
actsubcspar := b^.ls^.NPfield^.actsubcs;
temporalpar := b^.ls^.NPfield^.temporal;
possgenipar := b^.ls^.NPfield^.possgeni;
animatepar := b^.ls^.NPfield^.animate;
humanpar := b^.ls^.NPfield^.human;
actcomaspar := b^.ls^.NPfield^.actcomas;
thetanppar := b^.ls^.NPfield^.thetanp;
nounpatternefspar := b^.ls^.NPfield^.nounpatternefs;
genericpar := b^.ls^.NPfield^.generic;
possRformpar := b^.ls^.NPfield^.possRform;
NPheadpar := b^.ls^.NPfield^.NPhead;
posspredpar := b^.ls^.NPfield^.posspred;
possnietnppar := b^.ls^.NPfield^.possnietnp;
detnpmoodpar := b^.ls^.NPfield^.mood;
syntquantpar := b^.ls^.NPfield^.syntquant;
specQpar := b^.ls^.NPfield^.specQ;
classpar := b^.ls^.NPfield^.class;
deixispar := b^.ls^.NPfield^.deixis;
aspectpar := b^.ls^.NPfield^.aspect;
retropar := b^.ls^.NPfield^.retro;
END
END; END;
2 :CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PUNCfield^.key = auxkey('kommaPUNCkey')
 
);globcond: BEGIN  BEGIN
SYNREL := puncrel;
END
END; END;
3 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.NPhead IN [persproNP, othernp, allesnp]) AND
(b^.ls^.NPfield^.mood = declxpmood) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := apposrel;
END
END; END;
4 :CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PUNCfield^.key = auxkey('kommaPUNCkey')
 
);globcond: BEGIN  BEGIN
SYNREL := puncrel;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := personpar;
top^.ls^.NPfield^.number := numberpar;
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.possgeni := possgenipar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := actcomaspar;
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.mood := detnpmoodpar; 
top^.ls^.NPfield^.generic := genericpar;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := NPheadpar;
top^.ls^.NPfield^.specQ := specQpar;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
END
END; END;
END;
END;{package}
PACKAGE NP7rulepack: [NP7rulerule];
VAR CNfound : BOOLEAN;
definitepar : LSDOMAINT_deftype;
personpar : LSDOMAINT_persontype;
numberspar : LSDOMAINT_numberSETtype;
possnumberspar : LSDOMAINT_numberSETtype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
possgenipar : LSDOMAINT_possgenitype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
posscomaspar : LSDOMAINT_posscomaSETtype;
actcomaspar : LSDOMAINT_posscomaSETtype;
thetanppar : LSDOMAINT_thetanptype;
nounpatternefspar : LSDOMAINT_synpatternSETtype;
posspredpar : LSDOMAINT_posspredtype;
possnietnppar : LSDOMAINT_possnietnptype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
syntquantpar : LSDOMAINT_syntquanttype;
specQpar : LSDOMAINT_specQtype;
possadjfound : BOOLEAN;
qpunderdetpfound : BOOLEAN;
classpar : LSDOMAINT_timeadvclasstype;
deixispar : LSDOMAINT_deixistype;
aspectpar : LSDOMAINT_aspecttype;
retropar : LSDOMAINT_retrotype;
PROCEDURE NP7rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
 
FUNCTION headundercn(t1:LSSTREE_pstree):BOOLEAN; (*FJ; 03-10-89*)
(*this function is used to assign
the value ennp/enoknp 
for .NPhead in the proper 
cases*)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT(result) AND (sonlist<>NIL) DO
BEGIN
IF ((sonlist^.node^.cat=NOUN) AND (sonlist^.relation=head)) THEN
result:=TRUE;
sonlist:=sonlist^.brother
END;
headundercn:=result;
END; (*headundercn*)
FUNCTION noNUMunderdetp(t1:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=TRUE;
sonlist:=t1^.sons;
IF sonlist^.brother=NIL THEN
IF sonlist^.node^.cat IN [NUM] THEN result:=FALSE;
WHILE result AND (sonlist<>NIL) DO
BEGIN
IF sonlist^.node^.cat=DETP THEN 
IF sonlist^.relation=head THEN
result:=noNUMunderdetp(sonlist^.node);
sonlist:=sonlist^.brother
END;
noNUMunderdetp:=result;
END; (*noNUMunderdetp*)

BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
CNfound := false;
definitepar := omegadef ; 
personpar := 3;
numberspar := []; 
possnumberspar := [plural]; 
casespar := [nominative, accusative, dative];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
possgenipar := false;
animatepar := yesAnimate;
humanpar := yesHuman;
posscomaspar := [count];
actcomaspar := [];
thetanppar := omegathetanp;
nounpatternefspar := [];
posspredpar := false;
possnietnppar := false;
detnpmoodpar := declxpmood;
syntquantpar := Omegaquant;
specQpar := omegaspec; 
classpar := omegaTimeAdvClass;
deixispar := omegadeixis;
aspectpar := omegaAspect;
retropar := false;
END;
2 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.DETPfield^.eORenForm = enForm) AND
(b^.ls^.DETPfield^.possnumbers * [plural] <> []) AND
(b^.ls^.DETPfield^.posscomas * [count] <> []) AND
(noNUMunderdetp(b)) 
(*vele/veel en weinig zijn ook BDET; FJ*)
);globcond: BEGIN  BEGIN
SYNREL := detrel;
definitepar := b^.ls^.DETPfield^.definite;
possnietnppar := b^.ls^.DETPfield^.possnietnp;
syntquantpar := b^.ls^.DETPfield^.syntquant;
detnpmoodpar := b^.ls^.DETPfield^.mood; (*JO*)
END
END; END;
4 :CASE mode OF
loccond:LIPRIMS_assignstatus( NOT headundercn(b)
);globcond: BEGIN  BEGIN
SYNREL := head;
numberspar := b^.ls^.CNfield^.numbers;
casespar := b^.ls^.CNfield^.cases;
genderspar := b^.ls^.CNfield^.genders;
sexespar := b^.ls^.CNfield^.sexes;
actsubcspar := b^.ls^.CNfield^.actsubcs;
temporalpar := b^.ls^.CNfield^.temporal;
possgenipar := b^.ls^.CNfield^.possgeni;
animatepar := b^.ls^.CNfield^.animate;
humanpar := b^.ls^.CNfield^.human;
thetanppar := b^.ls^.CNfield^.thetanp;
nounpatternefspar := b^.ls^.CNfield^.nounpatternefs;
classpar := b^.ls^.CNfield^.class;
deixispar := b^.ls^.CNfield^.deixis;
aspectpar := b^.ls^.CNfield^.aspect;
retropar := b^.ls^.CNfield^.retro;
thetanppar := b^.ls^.CNfield^.thetanp;
CNfound := true;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( true
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := plural;
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.possgeni := possgenipar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := [count]; 
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.generic := omegageneric;
top^.ls^.NPfield^.possRform := false;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := enokNP;
top^.ls^.NPfield^.specQ := yesspec; (*JO, fout maar voor het testen*)
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
END;
END; END;
END;
END;{package}
PACKAGE DETPrulepack: [DETPrulerule];
VAR 
mfMEESTEexpected : BOOLEAN;
neutMEESTEexpected : BOOLEAN;
MEESTEfound : BOOLEAN;
possnietnppar : LSDOMAINT_possnietnptype;
definitepar : LSDOMAINT_deftype;
posspredpar : LSDOMAINT_posspredtype;
possnumberspar : LSDOMAINT_numberSETtype;
posscomaspar : LSDOMAINT_posscomaSETtype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
syntquantpar : LSDOMAINT_syntquanttype;
eorenformpar : LSDOMAINT_eorenformtype;
possgenderspar : LSDOMAINT_genderSETtype;
PROCEDURE DETPrulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

FUNCTION nomeestqunderqp(t1:LSSTREE_pstree):BOOLEAN; 
(* This condition is supposed to be 
met if the head of the DETP
is not `meest' (not meeste ); FJ, 19-11-90*)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=TRUE;
sonlist:=t1^.sons;
WHILE result AND (sonlist<>NIL) DO
BEGIN
IF sonlist^.node^.cat=Q THEN 
IF sonlist^.relation=head THEN
BEGIN
IF sonlist^.node^.ls^.qfield^.key=auxkey('meestQkey')
 THEN result:=FALSE;
END;
sonlist:=sonlist^.brother
END;
nomeestQunderQp:=result;
END; (*nomeestQunderqp*)
FUNCTION defartunderqp(t1:LSSTREE_pstree):BOOLEAN; 
(* This condition is supposed to be 
met if the artrel of the QP
is a definite article; FJ, 19-12-88. *)
(* functie is vervallen; FJ 29-11-90; *)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT (result) AND (sonlist<>NIL) DO
BEGIN
IF sonlist^.node^.cat=ART THEN 
IF sonlist^.relation=artrel THEN
BEGIN
IF sonlist^.node^.ls^.artfield^.definite= def THEN result:= TRUE;
END;
sonlist:=sonlist^.brother
END;
defARTunderqp:=result;
END; (*defartunderqp*) (* functie is vervallen *)

BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
mfMEESTEexpected := false;
neutMEESTEexpected := false;
MEESTEfound := false;
possnietnppar := false;
definitepar := omegadef;
posspredpar := true; (* for DEMADJ *)
possnumberspar := [singular]; (* for DEMADJ *)
posscomaspar := [count];
detnpmoodpar := declxpmood;
syntquantpar := Omegaquant;
eorenformpar := noform;
possgenderspar := [omegagender]
END;
1 :CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := head;
definitepar := indef;
possnumberspar := [b^.ls^.NUMfield^.number];
possnietnppar := true;
END
END; END;
2 :CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.DETfield^.eORenForm <> enForm
);globcond: BEGIN  BEGIN
IF ((b^.ls^.DETfield^.eorenForm = Noform) AND 
(b^.ls^.DETfield^.eformation <> Noformation)) (* elk*)
THEN possgenderspar := [neutgender] 
ELSE IF ((b^.ls^.DETfield^.eorenForm = eform) AND 
(b^.ls^.DETfield^.eformation <> Noformation)) (* elke*)
THEN possgenderspar := [mascgender, femgender] 
ELSE possgenderspar := [omegagender];
SYNREL := head;
possnietnppar := b^.ls^.DETfield^.possnietnp;
definitepar := b^.ls^.DETfield^.definite; 
posspredpar := b^.ls^.DETfield^.posspred; 
possnumberspar := b^.ls^.DETfield^.possnumbers; 
posscomaspar := b^.ls^.DETfield^.posscomas; 
detnpmoodpar := b^.ls^.DETfield^.mood; (* rene
syntquantpar := b^.ls^.DETfield^.syntquant*)
eorenformpar := b^.ls^.DETfield^.eorenform;
END
END; END;
3 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
definitepar := def;
posscomaspar := [count,mass];
IF ((b^.ls^.DEMADJfield^.key = auxkey('dezeDEMADJkey')
) OR
(b^.ls^.DEMADJfield^.key = auxkey('dieDEMADJkey')
)) THEN
BEGIN
possnumberspar := [singular,plural];
eorenformpar := eForm;
possgenderspar := [mascgender, femgender];
END
ELSE possgenderspar := [neutgender];
(* rest default: [singular], Noform *)
END
END; END;
12 :CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.ARTfield^.definite = def
);globcond: BEGIN  BEGIN
SYNREL := artrel;
IF b^.ls^.ARTfield^.key = auxkey('deARTkey')

THEN mfMEESTEexpected := true
ELSE neutMEESTEexpected := true;
END
END; END;
4 :CASE mode OF
loccond:LIPRIMS_assignstatus( nomeestqunderqp(b) 
);globcond: BEGIN  BEGIN
SYNREL := head;
IF meest2qunderqp(b) THEN
BEGIN
MEESTEfound := true;
eorenformpar := eForm;
IF mfMEESTEexpected 
THEN 
possgenderspar := [mascgender, femgender]
ELSE 
possgenderspar := [neutgender];
END;
definitepar := b^.ls^.QPfield^.definite;
posspredpar := b^.ls^.QPfield^.posspred;
possnumberspar := b^.ls^.QPfield^.possnumbers;
posscomaspar := b^.ls^.QPfield^.posscomas;
detnpmoodpar := b^.ls^.QPfield^.mood;
possnietnppar := true;
END
END; END;
5 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
definitepar := b^.ls^.ARTfield^.definite;
posspredpar := true;
possnumberspar := b^.ls^.ARTfield^.possnumbers;
posscomaspar := b^.ls^.ARTfield^.posscomas;
IF b^.ls^.ARTfield^.definite = indef
THEN possnietnppar := true;
(* assuming: mood is declxpmood (default)*)
END
END; END;
6 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.DETPfield^.eORenForm <> enForm) 
);globcond: BEGIN  BEGIN
SYNREL := modrel;
definitepar := adef;
possnietnppar := b^.ls^.DETPfield^.possnietnp;
posspredpar := b^.ls^.DETPfield^.posspred;
detnpmoodpar := b^.ls^.DETPfield^.mood;
posscomaspar := b^.ls^.DETPfield^.posscomas;
END
END; END;
7 :CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PREPfield^.key = auxkey('vanprepkey')

);globcond: BEGIN  BEGIN
SYNREL := partrel
END
END; END;
8 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.DETPfield^.eORenForm <> enForm) AND
(b^.ls^.DETPfield^.definite = def)
);globcond: BEGIN  BEGIN
SYNREL := head;
possnumberspar := b^.ls^.DETPfield^.possnumbers;
END
END; END;
9 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.definite = def) AND
(genitive IN b^.ls^.NPfield^.cases) AND
(b^.ls^.NPfield^.coord <> corrcoord)
(*conditions should be sharpened; probably 
reference to the head of the NP is required*)
);globcond: BEGIN  BEGIN
SYNREL := head;
possnumberspar := [b^.ls^.NPfield^.number];
END
END; END;
10 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.POSSADJfield^.eORenForm <> enForm) AND
(b^.ls^.POSSADJfield^.geni = false)
);globcond: BEGIN  BEGIN
SYNREL := head;
possnumberspar := [singular, plural];
END
END; END;
11: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := head;
possnumberspar := b^.ls^.CARDfield^.possnumbers;
definitepar := indef;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( true
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(DETP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
IF (NOT ((mfMEESTEexpected OR neutMEESTEexpected) 
AND (NOT MEESTEfound)))
THEN 
top^.ls^.DETPfield^.possnietnp := possnietnppar;
top^.ls^.DETPfield^.definite := definitepar;
top^.ls^.DETPfield^.posspred := posspredpar;
top^.ls^.DETPfield^.possnumbers := possnumberspar;
top^.ls^.DETPfield^.posscomas := posscomaspar;
top^.ls^.DETPfield^.mood := detnpmoodpar; 
top^.ls^.DETPfield^.syntquant := syntquantpar;
top^.ls^.DETPfield^.eorenform := eorenformpar;
top^.ls^.DETPfield^.possgenders := possgenderspar;
END
END; END;
END;
END;{package}
PACKAGE DETP2rulepack: [DETP2rulerule];
VAR possnietnppar : LSDOMAINT_possnietnptype;
definitepar : LSDOMAINT_deftype;
posspredpar : LSDOMAINT_posspredtype;
possnumberspar : LSDOMAINT_numberSETtype;
posscomaspar : LSDOMAINT_posscomaSETtype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
syntquantpar : LSDOMAINT_syntquanttype;
eorenformpar : LSDOMAINT_eorenformtype;
possgenderspar : LSDOMAINT_genderSETtype;

PROCEDURE DETP2rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
possnietnppar := false;
definitepar := omegadef;
posspredpar := false; 
possnumberspar := [plural]; 
posscomaspar := [count];
detnpmoodpar := declxpmood;
syntquantpar := Omegaquant;
eorenformpar := enform;
possgenderspar := [omegagender]
END;
2 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.DETfield^.eORenForm = enForm) AND
(count IN b^.ls^.DETfield^.posscomas) AND
(plural IN b^.ls^.DETfield^.possnumbers)
);globcond: BEGIN  BEGIN
SYNREL := head;
possnietnppar := b^.ls^.DETfield^.possnietnp;
definitepar := b^.ls^.DETfield^.definite; 
detnpmoodpar := b^.ls^.DETfield^.mood; 
posscomaspar := b^.ls^.DETfield^.posscomas;
possnumberspar := b^.ls^.DETfield^.possnumbers;
posspredpar := b^.ls^.DETfield^.posspred; 
(* rene
syntquantpar := b^.ls^.DETfield^.syntquant*)
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( true
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(DETP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.DETPfield^.possnietnp := possnietnppar;
top^.ls^.DETPfield^.definite := definitepar;
top^.ls^.DETPfield^.posspred := posspredpar;
top^.ls^.DETPfield^.possnumbers := possnumberspar;
top^.ls^.DETPfield^.posscomas := posscomaspar;
top^.ls^.DETPfield^.mood := detnpmoodpar; 
top^.ls^.DETPfield^.syntquant := syntquantpar;
top^.ls^.DETPfield^.eorenform := eorenformpar;
top^.ls^.DETPfield^.possgenders := possgenderspar;
END
END; END;
END;
END;{package}
PACKAGE CN1rulepack: [CN1rulerule];
(* CNs containing a head/NOUN *)
VAR COMPLexpected : BOOLEAN;
classpar : LSDOMAINT_timeadvclasstype; 
deixispar : LSDOMAINT_deixistype;
aspectpar : LSDOMAINT_aspecttype;
retropar : LSDOMAINT_retrotype; 
definitepar : LSDOMAINT_deftype;
numberspar : LSDOMAINT_numberSETtype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
possgenipar : LSDOMAINT_possgenitype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
posscomaspar : LSDOMAINT_posscomaSETtype;
thetanppar : LSDOMAINT_thetanptype;
nounpatternefspar : LSDOMAINT_synpatternSETtype;
prepkeypar : LSDOMAINT_keytype;
tempadjpfound : BOOLEAN;
adjpfound : BOOLEAN;
sORpostmodfound : BOOLEAN;
PROCEDURE CN1rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
 
FUNCTION nodetpundernp(t1:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=TRUE;
sonlist:=t1^.sons;
WHILE result AND (sonlist<>NIL) DO
BEGIN
IF sonlist^.node^.cat=DETP THEN result:=FALSE;
sonlist:=sonlist^.brother
END;
nodetpundernp:=result;
END;

BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
COMPLexpected := false;
classpar := omegaTimeAdvClass; 
deixispar := omegadeixis; 
aspectpar := omegaAspect; 
retropar := false; 
definitepar := omegadef; 
numberspar := [singular]; 
casespar := [nominative, accusative, dative];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
possgenipar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
posscomaspar := [count];
thetanppar := omegathetanp;
nounpatternefspar := [];
prepkeypar := 0;
tempadjpfound := false;
adjpfound := false;
sORpostmodfound := false;
END;
2 :CASE mode OF
loccond:LIPRIMS_assignstatus( (attributive in b^.ls^.ADJPfield^.actuseefs) (* restrictions on adjsubc *)
AND
(b^.ls^.ADJPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
adjpfound := true;
IF (NOT tempadjpfound) AND 
(b^.ls^.ADJPfield^.temporal = true ) THEN BEGIN
temporalpar := b^.ls^.ADJPfield^.temporal;
deixispar := b^.ls^.ADJPfield^.deixis;
aspectpar := b^.ls^.ADJPfield^.aspect;
retropar := b^.ls^.ADJPfield^.retro;
classpar := b^.ls^.ADJPfield^.class;
END;
IF (NOT tempadjpfound) THEN
tempadjpfound := b^.ls^.ADJPfield^.temporal;
END
END; END;
3 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.DETPfield^.definite = indef) AND
(b^.ls^.DETPfield^.eORenForm <> enForm) AND
(b^.ls^.DETPfield^.mood = declxpmood)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
definitepar := def;
posscomaspar := b^.ls^.DETPfield^.posscomas
END
END; END;
4 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.mood = Anterelative) AND
(b^.ls^.SENTENCEfield^.senttype = subordinateclause) AND
(b^.ls^.SENTENCEfield^.modus IN [prespart,pastpart,omegamodus]) AND
(b^.ls^.SENTENCEfield^.FINITENESS = infinite) AND
(b^.ls^.SENTENCEfield^.coord <> corrcoord)
(* restrictions on infsort/voicetype/PROsubject *)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
sORpostmodfound := true;
END
END; END;
5 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
IF (NOT tempadjpfound) OR
(NOT b^.ls^.NOUNfield^.temporal 
(* als ( b^.ls^.NOUNfield^.temporal AND tempadjfound ),
dan gelden de waardes van het tempadj *)
(* als ( b^.ls^.NOUNfield^.temporal AND NOT tempadjfound ),
dan gelden de NOUN-waardes *)
) THEN BEGIN
classpar := b^.ls^.NOUNfield^.class;
deixispar := b^.ls^.NOUNfield^.deixis;
aspectpar := b^.ls^.NOUNfield^.aspect;
retropar := b^.ls^.NOUNfield^.retro; 
temporalpar := b^.ls^.NOUNfield^.temporal;
END;
numberspar := [b^.ls^.NOUNfield^.number];
genderspar := b^.ls^.NOUNfield^.genders;
sexespar := b^.ls^.NOUNfield^.sexes;
actsubcspar := b^.ls^.NOUNfield^.subcs;
possgenipar := b^.ls^.NOUNfield^.possgeni;
animatepar := b^.ls^.NOUNfield^.animate;
humanpar := b^.ls^.NOUNfield^.human;
posscomaspar := b^.ls^.NOUNfield^.posscomas;
thetanppar := b^.ls^.NOUNfield^.thetanp;
nounpatternefspar := b^.ls^.NOUNfield^.nounpatterns;
prepkeypar := b^.ls^.NOUNfield^.prepkey;
IF b^.ls^.NOUNfield^.geni THEN casespar := [genitive];
IF b^.ls^.NOUNfield^.thetanp <> omegathetanp
THEN COMPLexpected := TRUE;
END
END; END;
12 :CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.QPfield^.hop =true
);globcond: BEGIN  BEGIN
SYNREL := hoprel
END
END; END;
14 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.mood = declxpmood) AND
(NOT b^.ls^.PREPPfield^.stranded) (*JO*) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
possgenipar := false;
SYNREL := prepobjrel; 
sORpostmodfound := true;
END
END; END;
15 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
possgenipar := false;
SYNREL := complrel;
END
END; END;
6 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.definite = indef) AND
((mass IN b^.ls^.NPfield^.actcomas) OR 
(b^.ls^.NPfield^.number = plural)) AND
nodetpundernp(b) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
possgenipar := false;
SYNREL := postmodrel;
sORpostmodfound := true;
END
END; END;
13 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PROPERNOUNfield^.number = singular) AND
(b^.ls^.PROPERNOUNfield^.geni = false)
);globcond: BEGIN  BEGIN
SYNREL := postmodrel;
sORpostmodfound := true;
END
END; END;
8 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.mood = declxpmood) AND
(NOT b^.ls^.PREPPfield^.stranded) (*JO*) AND
(( b^.ls^.PREPPfield^.headkey = auxkey('vanprepkey')
) OR
(b^.ls^.PREPPfield^.actsubcefs * [loc, dir, temp, 
comitative, voor] <> [])) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
possgenipar := false;
SYNREL := postmodrel;
sORpostmodfound := true;
END
END; END;
9 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.mood = declxpmood) AND
(b^.ls^.ADVPfield^.actsubcefs * 
[Locadv, DirAdv, TempAdv,
causadv] <> []) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
possgenipar := false;
SYNREL := postmodrel;
sORpostmodfound := true;
END
END; END;
11 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.mood = Relative) AND
(b^.ls^.SENTENCEfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
possgenipar := false;
SYNREL := postmodrel;
sORpostmodfound := true;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
IF adjpfound THEN
actsubcspar := actsubcspar - [plurunitnoun];
(* to block '*drie leuk uur'*)
IF sORpostmodfound THEN
actsubcspar := actsubcspar - [unitnoun, plurunitnoun];
(* to block '*drie jaar/jaren in Beiroet geleden'*)
IF actsubcspar * [unitnoun] = []
THEN
BEGIN
top:=MAKET_stree(CN);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.CNfield^.class := classpar;
top^.ls^.CNfield^.deixis := deixispar;
top^.ls^.CNfield^.aspect := aspectpar;
top^.ls^.CNfield^.retro := retropar; (* these 4 attributes added 
22-11-88; MJS *)
top^.ls^.CNfield^.definite := definitepar;
top^.ls^.CNfield^.numbers := numberspar;
top^.ls^.CNfield^.genders := genderspar; 
top^.ls^.CNfield^.sexes := sexespar;
top^.ls^.CNfield^.actsubcs := actsubcspar;
top^.ls^.CNfield^.temporal := temporalpar;
top^.ls^.CNfield^.possgeni := possgenipar;
top^.ls^.CNfield^.animate := animatepar;
top^.ls^.CNfield^.human := humanpar;
top^.ls^.CNfield^.posscomas := posscomaspar;
top^.ls^.CNfield^.thetanp := thetanppar;
top^.ls^.CNfield^.nounpatternefs := nounpatternefspar;
top^.ls^.CNfield^.cases := casespar;
END;
IF ((actsubcspar * [unitnoun] <> []) AND 
(numberspar = [singular]) (*example: uur; FJ*)
)
THEN 
BEGIN
top:=MAKET_stree(CN);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.CNfield^.class := classpar;
top^.ls^.CNfield^.deixis := deixispar;
top^.ls^.CNfield^.aspect := aspectpar;
top^.ls^.CNfield^.retro := retropar; (* these 4 attributes added 
22-11-88; MJS *)
top^.ls^.CNfield^.definite := definitepar;
top^.ls^.CNfield^.numbers := [singular];
top^.ls^.CNfield^.genders := genderspar; 
top^.ls^.CNfield^.sexes := sexespar;
top^.ls^.CNfield^.actsubcs := actsubcspar;
top^.ls^.CNfield^.temporal := temporalpar;
top^.ls^.CNfield^.possgeni := possgenipar;
top^.ls^.CNfield^.animate := animatepar;
top^.ls^.CNfield^.human := humanpar;
top^.ls^.CNfield^.posscomas := posscomaspar;
top^.ls^.CNfield^.thetanp := thetanppar;
top^.ls^.CNfield^.nounpatternefs := nounpatternefspar;
top^.ls^.CNfield^.cases := casespar;
END;
IF actsubcspar * [unitnoun] <> [] (*zowel uren als uur;
uur komt dus 2 x door 
S-parser; FJ*)
THEN 
BEGIN
top:=MAKET_stree(CN);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.CNfield^.class := classpar;
top^.ls^.CNfield^.deixis := deixispar;
top^.ls^.CNfield^.aspect := aspectpar;
top^.ls^.CNfield^.retro := retropar; (* these 4 attributes added 
22-11-88; MJS *)
top^.ls^.CNfield^.definite := definitepar;
top^.ls^.CNfield^.numbers := [plural];
top^.ls^.CNfield^.genders := genderspar; 
top^.ls^.CNfield^.sexes := sexespar;
top^.ls^.CNfield^.actsubcs := actsubcspar;
top^.ls^.CNfield^.temporal := temporalpar;
top^.ls^.CNfield^.possgeni := possgenipar;
top^.ls^.CNfield^.animate := animatepar;
top^.ls^.CNfield^.human := humanpar;
top^.ls^.CNfield^.posscomas := posscomaspar;
top^.ls^.CNfield^.thetanp := thetanppar;
top^.ls^.CNfield^.nounpatternefs := nounpatternefspar;
top^.ls^.CNfield^.cases := casespar;
END;
END 
END; END;
END;
END;{package}
PACKAGE CN2rulepack: [CN2rulerule];
(* CNs not containing a head/NOUN.
The following ambiguity occurs: 
- DETP:  always count/plural (assuming 'één' is treated separately) 
- ADJP:  - count/plural (surfcn2.sur (also for NUM))
- count/singular (surfcn3.sur)
- mass/singular (surfcn4.sur) 
In order to avoid this ambiguity at this point it has been decided
to make the attribute 'number' of CN a set:  'numbers' 
NB. Note that one combination, mass/plural, will be blocked later *)
VAR 
definitepar : LSDOMAINT_deftype;
premodfound : BOOLEAN; 
postmodfound : BOOLEAN; 
posscomaspar : LSDOMAINT_posscomaSETtype;

PROCEDURE CN2rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
definitepar := omegadef; 
premodfound := false; 
postmodfound := false; 
posscomaspar := [count];
END;
1 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.DETPfield^.definite = indef) AND
(b^.ls^.DETPfield^.eORenForm <> enForm) AND
(b^.ls^.DETPfield^.mood = declxpmood)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
definitepar := def;
posscomaspar := b^.ls^.DETPfield^.posscomas;
premodfound := true; 
END
END; END;
2 :CASE mode OF
loccond:LIPRIMS_assignstatus( (attributive in b^.ls^.ADJPfield^.actuseefs) AND
(b^.ls^.ADJPfield^.eorenform in [eform, enform])
(* restrictions on adjsubc *) AND
(b^.ls^.ADJPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
premodfound := true; 
END
END; END;
3 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.mood = Anterelative) AND
(b^.ls^.SENTENCEfield^.senttype = subordinateclause) AND
((b^.ls^.SENTENCEfield^.modus = prespart) OR
(b^.ls^.SENTENCEfield^.modus = pastpart)) AND
(b^.ls^.SENTENCEfield^.FINITENESS <> infinite) AND
(b^.ls^.SENTENCEfield^.coord <> corrcoord)
(* restrictions on infsort/voicetype/PROsubject *)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
premodfound := true;
END
END; END;
4 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.mood = declxpmood) AND
(NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.coord <> corrcoord) AND
((b^.ls^.PREPPfield^.headkey = auxkey('vanprepkey')
) AND
(b^.ls^.PREPPfield^.actsubcefs * [loc, dir, temp, comitative] <> [])
) 
);globcond: BEGIN  BEGIN
SYNREL := postmodrel;
postmodfound := true;
END
END; END;
6 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.mood = Relative) AND
(b^.ls^.SENTENCEfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := postmodrel;
postmodfound := true;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( premodfound OR
postmodfound
);IF LIPRIMS_status THEN BEGIN
IF NOT premodfound
THEN definitepar := omegadef; (*of indef FJ 14-11-89*)
top:=MAKET_stree(CN);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.CNfield^.numbers := [singular,plural];
top^.ls^.CNfield^.posscomas := [count,mass];
top^.ls^.CNfield^.definite := definitepar;
top^.ls^.CNfield^.cases := [nominative, accusative, dative]
(* cases is default NO, JO*)
END
END; END;
END;
END;{package}
PACKAGE PREPPpack: [PREPPrule];
VAR
reqvar : LSDOMAINT_polarityEFFSETtype;
envvar : LSDOMAINT_polarityEFFSETtype;
moodvar : LSDOMAINT_xpmoodtype;
actsubcefsvar : LSDOMAINT_prepsubceffsettype;
synppefsvar : LSDOMAINT_synpatterneffsettype;
headkeyvar : LSDOMAINT_keytype;
classvar : LSDOMAINT_timeadvclasstype;
deixisvar : LSDOMAINT_deixistype;
aspectvar : LSDOMAINT_aspecttype;
retrovar : LSDOMAINT_retrotype;
thetappvar : LSDOMAINT_thetapptype; 
radvkeyvar : LSDOMAINT_keytype;
radvpfound : BOOLEAN;
NPfound : BOOLEAN;
ADVPfound : BOOLEAN;
ADJPfound : BOOLEAN;
PPfound : BOOLEAN;
complfound : BOOLEAN;
postformvar : LSDOMAINT_postformtype;
gluefound : BOOLEAN;
headfound : BOOLEAN;
postpkeyvar : LSDOMAINT_indextype;
postpfound : BOOLEAN;
specqvar : LSDOMAINT_specqtype;
strandedvar : BOOLEAN;
tempcompl : BOOLEAN;
secondprepvar : LSDOMAINT_keytype;
secondprepfound: BOOLEAN;
 
PROCEDURE PREPPrule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
reqvar := [pospol, negpol, omegapol];
envvar := [pospol, negpol, omegapol];
moodvar := declxpmood;
actsubcefsvar := [];
synppefsvar := [];
headkeyvar := 0;
classvar := omegaTimeAdvClass;
deixisvar := omegadeixis;
aspectvar := omegaAspect;
retrovar := false;
thetappvar := omegathetapp; 
radvkeyvar := 0;
radvpfound := false;
NPfound := false;
PPfound := false;
ADVPfound := false;
ADJPfound := false;
complfound := false;
postformvar := both;
gluefound := false;
headfound := false;
postpkeyvar := 0;
postpfound := false;
specqvar := nospec;
strandedvar := false;
tempcompl := false;
secondprepvar := 0;
secondprepfound:= false;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPfield^.preptype IN [normalprep, splitprep])
);globcond: BEGIN  BEGIN
SYNREL := head;
headfound := true;
actsubcefsvar := b^.ls^.PREPfield^.subcs;
synppefsvar := b^.ls^.PREPfield^.synpps;
headkeyvar := b^.ls^.PREPfield^.key;
classvar := b^.ls^.PREPfield^.class;
deixisvar := b^.ls^.PREPfield^.deixis;
aspectvar := b^.ls^.PREPfield^.aspect;
retrovar := b^.ls^.PREPfield^.retro;
thetappvar := b^.ls^.PREPfield^.thetapp;
postformvar := b^.ls^.PREPfield^.postform;
postpkeyvar := b^.ls^.PREPfield^.postpkey;
secondprepvar := b^.ls^.PREPfield^.secondprep;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.cases * [accusative] <> []) AND
(b^.ls^.NPfield^.NPhead <> hetNP) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := objrel;
moodvar := b^.ls^.NPfield^.mood;
NPfound := true;
complfound := true;
specqvar := b^.ls^.NPfield^.specq;
tempcompl := b^.ls^.NPfield^.temporal;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := errel;
radvpfound := true;
radvkeyvar := b^.ls^.RADVPfield^.radvkey;
moodvar := b^.ls^.RADVPfield^.mood;
specqvar := yesspec;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := gluerel;
gluefound := true;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.actsubcefs * [loc, temp] <> []) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := objrel;
complfound := true;
ppfound := true;
specqvar := yesspec;
tempcompl := (temp IN b^.ls^.PREPPfield^.actsubcefs)
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADJPfield^.eORenform = Noform) AND
(predicative IN b^.ls^.ADJPfield^.actuseefs) AND
(b^.ls^.ADJPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := predrel;
complfound := true;
adjpfound := true;
specqvar := yesspec;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs * [locadv, tempadv] <> []) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := objrel;
complfound := true;
advpfound := true;
specqvar := yesspec;
tempcompl := (tempadv IN b^.ls^.ADVPfield^.actsubcefs)
END
END; END;
8: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPfield^.preptype = postprep)
);globcond: BEGIN  BEGIN
SYNREL := head;
headfound := true;
actsubcefsvar := b^.ls^.PREPfield^.subcs;
synppefsvar := b^.ls^.PREPfield^.synpps;
headkeyvar := b^.ls^.PREPfield^.key;
classvar := b^.ls^.PREPfield^.class;
deixisvar := b^.ls^.PREPfield^.deixis;
aspectvar := b^.ls^.PREPfield^.aspect;
retrovar := b^.ls^.PREPfield^.retro;
thetappvar := b^.ls^.PREPfield^.thetapp;
postformvar := b^.ls^.PREPfield^.postform;
postpkeyvar := b^.ls^.PREPfield^.postpkey;
END
END; END;
9: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := partrel;
postpfound := true;
END
END; END;
10: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ( preppadv IN b^.ls^.ADVPfield^.actsubcefs) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
END
END; END;
11: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.NPhead = otherNP) AND 
(b^.ls^.NPfield^.coord <> corrcoord) AND
((unitnoun IN b^.ls^.NPfield^.actsubcs) OR 
(plurunitnoun IN b^.ls^.NPfield^.actsubcs)
) (* probably too strong *) 
);globcond: BEGIN  BEGIN
SYNREL := modrel;
END
END; END;
12: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.REFLPROfield^.zelf = false
);globcond: BEGIN  BEGIN
SYNREL := objrel;
complfound := true;
npfound := true;
specqvar := yesspec;
END
END; END;
13: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.headkey <> 0) AND
(b^.ls^.PREPPfield^.coord <> corrcoord) 
);globcond: BEGIN  BEGIN
SYNREL := modrel;
secondprepfound := true;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( headfound AND
((postformvar = post) <= (NOT complfound)) AND
((postformvar = pre ) <= (NOT radvpfound)) AND
((secondprepvar <> 0) <= secondprepfound) AND 
((postpkeyvar = 0 ) OR
postpfound ) AND
( (NOT ( radvpfound AND
((radvkeyvar = auxkey('erRadvkey')
) OR
(radvkeyvar = auxkey('daarradvkey')
) OR
(radvkeyvar = auxkey('hierradvkey')
)
)
) 
) OR
gluefound
) AND
((actsubcefsvar <> [temp]) OR 
(tempcompl OR radvpfound)
) 
);IF LIPRIMS_status THEN BEGIN
IF npfound 
THEN synppefsvar := synppefsvar * [synNP];
IF adjpfound
THEN synppefsvar := synppefsvar * 
[synOPENADJPPROP, synCLOSEDADJPPROP];
IF advpfound 
THEN synppefsvar := synppefsvar * [synLOCPREPP];
IF ppfound
THEN synppefsvar := synppefsvar * [synLOCPREPP];
IF radvpfound 
THEN synppefsvar := synppefsvar * [synNP,synLOCPREPP];
IF (NOT complfound) AND (NOT radvpfound) AND 
(postformvar = pre)
THEN synppefsvar := synppefsvar * [synnovpargs];
IF (NOT complfound) AND (NOT radvpfound) AND 
(postformvar = post)
THEN synppefsvar := synppefsvar * [synNP, synLOCPREPP];
IF ( (NOT complfound) AND
(NOT radvpfound) AND
(synppefsvar * [synNP] <> []) AND
(postformvar <> pre)
)
THEN strandedvar := true;
IF (synppefsvar <> []) AND (strandedvar)
THEN BEGIN
top:=MAKET_stree(PREPP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.PREPPfield^.req := reqvar;
top^.ls^.PREPPfield^.env := envvar;
top^.ls^.PREPPfield^.actsubcefs := actsubcefsvar;
top^.ls^.PREPPfield^.mood := moodvar;
top^.ls^.PREPPfield^.synppefs := synppefsvar;
top^.ls^.PREPPfield^.headkey := headkeyvar;
top^.ls^.PREPPfield^.class := classvar;
top^.ls^.PREPPfield^.deixis := deixisvar;
top^.ls^.PREPPfield^.aspect := aspectvar;
top^.ls^.PREPPfield^.retro := retrovar;
top^.ls^.PREPPfield^.superdeixis := omegadeixis;
top^.ls^.PREPPfield^.thetapp := thetappvar;
top^.ls^.PREPPfield^.radvkey := radvkeyvar;
top^.ls^.PREPPfield^.stranded := strandedvar;
top^.ls^.PREPPfield^.specq := specqvar;
END (**); 
IF (
( (complfound) OR
(radvpfound) OR
(synppefsvar * [synnovpargs] <> [])
) AND
(postformvar <> post)
)
THEN strandedvar := false;
IF (synppefsvar <> []) AND (NOT strandedvar)
THEN BEGIN
top:=MAKET_stree(PREPP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.PREPPfield^.req := reqvar;
top^.ls^.PREPPfield^.env := envvar;
top^.ls^.PREPPfield^.actsubcefs := actsubcefsvar;
top^.ls^.PREPPfield^.mood := moodvar;
top^.ls^.PREPPfield^.synppefs := synppefsvar;
top^.ls^.PREPPfield^.headkey := headkeyvar;
top^.ls^.PREPPfield^.class := classvar;
top^.ls^.PREPPfield^.deixis := deixisvar;
top^.ls^.PREPPfield^.aspect := aspectvar;
top^.ls^.PREPPfield^.retro := retrovar;
top^.ls^.PREPPfield^.superdeixis := omegadeixis;
top^.ls^.PREPPfield^.thetapp := thetappvar;
top^.ls^.PREPPfield^.radvkey := radvkeyvar;
top^.ls^.PREPPfield^.stranded := strandedvar;
top^.ls^.PREPPfield^.specq := specqvar;
END (**); 
END
END; END;
END (*PREPP*);
END;{package}
PACKAGE RADVPpack: [RADVPrule];
VAR
radvkeyvar : LSDOMAINT_keytype;
moodvar : LSDOMAINT_xpmoodtype;
reqvar : LSDOMAINT_polarityEFFSETtype;
envvar : LSDOMAINT_polarityEFFSETtype;
 
PROCEDURE RADVPrule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
reqvar := [ pospol, negpol, omegapol];
envvar := [ pospol, negpol, omegapol];
radvkeyvar := 0;
moodvar := declxpmood;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := head;
radvkeyvar := b^.ls^.RADVfield^.key;
moodvar := b^.ls^.RADVfield^.mood;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( true
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(RADVP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.RADVPfield^.radvkey := radvkeyvar;
top^.ls^.RADVPfield^.mood := moodvar;
top^.ls^.RADVPfield^.req := reqvar;
top^.ls^.RADVPfield^.env := envvar;
IF radvkeyvar = auxkey('erRADVkey')

THEN top^.ls^.RADVPfield^.kindefs := [ Xk, Lk, Qk, Pk, XLk, XQk, 
XPk, LQk, QPk, XLQk, XPQk
]
ELSE top^.ls^.RADVPfield^.kindefs := [ Lk, Pk, XLk, XPk];
END
END; END;
END;
END;{package}
PACKAGE ADVPpack: [ADVPrule];
VAR
reqvar : LSDOMAINT_polarityEFFSETtype;
envvar : LSDOMAINT_polarityEFFSETtype;
classvar : LSDOMAINT_timeadvclasstype;
deixisvar : LSDOMAINT_deixistype;
aspectvar : LSDOMAINT_aspecttype;
retrovar : LSDOMAINT_retrotype;
superdeixisvar : LSDOMAINT_deixistype;
actsubcefsvar : LSDOMAINT_advsubceffsettype;
Qstatusvar : LSDOMAINT_qstatustype;
moodvar : LSDOMAINT_xpmoodtype;
superlativesvar : LSDOMAINT_superlativesettype;
thetaadvvar : LSDOMAINT_thetaadvtype;
advpatternefsvar : LSDOMAINT_synpatterneffsettype;
temporalvar : LSDOMAINT_temporaltype;
possnietnpvar : LSDOMAINT_possnietnptype;
thanasvar : LSDOMAINT_thanascompltype;
headfound : BOOLEAN;
precomplfound : BOOLEAN;
postcomplfound : BOOLEAN; 
THANPpossible : BOOLEAN; 
(* bedoeld om optreden van THANP te beregelen *) 
ALSCOMPLADVfound : BOOLEAN;
(* om bij te houden of 'zo' als degreeadv 
gevonden is; example:  zo spoedig mogelijk
*)
DEGREEADVexpected : BOOLEAN;
DEGREEADVfound : BOOLEAN;
DEGREEMODfound : BOOLEAN;
PROCEDURE ADVPrule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
 
FUNCTION mogelijkkey(b:LSSTREE_pstree):BOOLEAN;
VAR stree:LSSTREE_pstree;
BEGIN
IF (b^.sons^.relation =head) THEN BEGIN
stree:=b^.sons^.node;
IF (stree^.sons^.relation=head) THEN BEGIN 
stree:=stree^.sons^.node;
IF (stree^.sons^.relation=head) THEN BEGIN
stree:=stree^.sons^.node;
IF stree^.ls^.BADJfield^.key=auxkey('s_mogelijkbadj')
 THEN
mogelijkkey:=TRUE ELSE mogelijkkey:=FALSE
END;
END;
END;
END;
 
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
reqvar := [pospol, negpol, omegapol];
envvar := [pospol, negpol, omegapol];
classvar := omegatimeadvclass;
deixisvar := omegadeixis;
aspectvar := omegaaspect;
retrovar := false;
superdeixisvar := omegadeixis;
actsubcefsvar := [];
Qstatusvar := false;
moodvar := declxpmood;
superlativesvar := [];
thetaadvvar := omegathetaadv;
advpatternefsvar := [];
temporalvar := false;
possnietnpvar := false;
thanasvar := omegacompl;
headfound := false;
precomplfound := false;
postcomplfound := false;
THANPpossible := false;
ALSCOMPLADVfound := false;
DEGREEADVfound := false;
DEGREEADVexpected := false;
DEGREEMODfound := false;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := head;
IF degreeadv IN b^.ls^.ADVfield^.subcs
THEN DEGREEADVfound := true;
IF b^.ls^.ADVfield^.form = comparative 
THEN DEGREEMODfound := true;
IF b^.ls^.ADVfield^.form = comparative
THEN THANPpossible := true;
headfound := true;
classvar := b^.ls^.ADVfield^.class;
deixisvar := b^.ls^.ADVfield^.deixis;
aspectvar := b^.ls^.ADVfield^.aspect;
retrovar := b^.ls^.ADVfield^.retro;
actsubcefsvar := b^.ls^.ADVfield^.subcs;
Qstatusvar := b^.ls^.ADVfield^.Qstatus;
moodvar := b^.ls^.ADVfield^.mood;
superlativesvar := b^.ls^.ADVfield^.superlatives;
thetaadvvar := b^.ls^.ADVfield^.thetaadv;
advpatternefsvar := b^.ls^.ADVfield^.advpatterns;
temporalvar := b^.ls^.ADVfield^.temporal;
possnietnpvar := b^.ls^.ADVfield^.possnietnp;
thanasvar := b^.ls^.ADVfield^.thanas;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.temporal = true) (* al DRIE UUR*) 
AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
postcomplfound := true;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.temporal = true) AND
(synMEASUREPHRASE IN b^.ls^.ADVPfield^.advpatternefs) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
postcomplfound := true;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.temporal = true) (* DRIE UUR lang *)
AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
precomplfound := true;
END
END; END;
44: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (unitnoun IN b^.ls^.NPfield^.actsubcs) OR
((b^.ls^.NPfield^.definite = indef) AND
(mass IN b^.ls^.NPfield^.actcomas ) 
) (* amountnp *) AND 
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := premodrel;
degreeadvexpected := true;
DEGREEmodfound := true;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.QPfield^.hop = false
);globcond: BEGIN  BEGIN
SYNREL := degreemodrel;
moodvar := b^.ls^.QPfield^.mood;
IF b^.ls^.QPfield^.thanas <> omegacompl
THEN THANPpossible := true;
DEGREEmodfound := true;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (degreeadv IN b^.ls^.ADVPfield^.actsubcefs) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := degreemodrel;
If b^.ls^.ADVPfield^.thanas = alscompl
THEN ALSCOMPLADVfound := true;
If b^.ls^.ADVPfield^.thanas = alscompl
THEN THANPpossible := true;
moodvar := b^.ls^.ADVPfield^.mood;
DEGREEmodfound := true;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := postmodrel; 
END
END; END;
8: 
CASE mode OF
loccond:LIPRIMS_assignstatus( mogelijkkey(b)
);globcond: BEGIN  BEGIN
SYNREL := zocomplrel;
END
END; END;
9: CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.QPfield^.hop = true
);globcond: BEGIN  BEGIN
SYNREL := hoprel;
DEGREEMODfound := true;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( headfound AND
(actsubcefsvar * [tempadv] <> []) OR
((NOT precomplfound) AND
(NOT postcomplfound)
)
);IF LIPRIMS_status THEN BEGIN
(*check of aanwezige complementen compatibel zijn met ADV*)
IF precomplfound
THEN advpatternefsvar := 
advpatternefsvar * [synMEASUREPHRASE];
IF postcomplfound
THEN advpatternefsvar := advpatternefsvar * [synNP];
(*check of verwachte complementen inderdaad aanwezig zijn*)
IF ((advpatternefsvar <= [synMEASUREPHRASE]) AND 
(NOT precomplfound)
)
THEN advpatternefsvar := [];
IF ((advpatternefsvar <= [synNP]) AND
(NOT postcomplfound)
)
THEN advpatternefsvar := [];
IF ((advpatternefsvar <> []) AND
(degreeadvexpected <= degreeadvfound)
)
THEN BEGIN
top:=MAKET_stree(ADVP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.ADVPfield^.req := reqvar;
top^.ls^.ADVPfield^.env := envvar;
top^.ls^.ADVPfield^.class := classvar;
top^.ls^.ADVPfield^.deixis := deixisvar;
top^.ls^.ADVPfield^.aspect := aspectvar;
top^.ls^.ADVPfield^.retro := retrovar;
top^.ls^.ADVPfield^.superdeixis := superdeixisvar;
top^.ls^.ADVPfield^.actsubcefs := actsubcefsvar;
top^.ls^.ADVPfield^.Qstatus := Qstatusvar;
top^.ls^.ADVPfield^.mood := moodvar;
top^.ls^.ADVPfield^.thetaadv := thetaadvvar;
top^.ls^.ADVPfield^.advpatternefs := advpatternefsvar;
top^.ls^.ADVPfield^.temporal := temporalvar;
top^.ls^.ADVPfield^.Radvb := false;
top^.ls^.ADVPfield^.possnietnp := possnietnpvar;
top^.ls^.ADVPfield^.thanas := thanasvar;
top^.ls^.ADVPfield^.thanascompl := false;
END
END
END; END;
END;
END;{package}
PACKAGE DatumNPpack: [DatumNPrule];
VAR 
reqvar : LSDOMAINT_polarityEFFSETtype;
envvar : LSDOMAINT_polarityEFFSETtype;
superdeixisvar : LSDOMAINT_deixistype;
classvar : LSDOMAINT_timeadvclasstype;
deixisvar : LSDOMAINT_deixistype;
aspectvar : LSDOMAINT_aspecttype;
retrovar : LSDOMAINT_retrotype;
definitevar : LSDOMAINT_deftype;
personvar : LSDOMAINT_persontype;
numbervar : LSDOMAINT_numbertype;
casesvar : LSDOMAINT_caseSETtype;
gendersvar : LSDOMAINT_genderSETtype;
sexesvar : LSDOMAINT_sexSETtype;
actsubcsvar : LSDOMAINT_nounsubcEFFSETtype;
temporalvar : LSDOMAINT_temporaltype;
possgenivar : LSDOMAINT_possgenitype;
animatevar : LSDOMAINT_animatetype;
humanvar : LSDOMAINT_humantype;
actcomasvar : LSDOMAINT_posscomaSETtype;
thetanpvar : LSDOMAINT_thetanptype;
nounpatternefsvar : LSDOMAINT_synpatternEFFSETtype;
posspredvar : LSDOMAINT_posspredtype;
possnietnpvar : LSDOMAINT_possnietnptype;
moodvar : LSDOMAINT_xpmoodtype;
genericvar : LSDOMAINT_generictype;
possRformvar : LSDOMAINT_possRformtype;
syntquantvar : LSDOMAINT_syntquanttype;
NPheadvar : LSDOMAINT_NPheadtype;
specQvar : LSDOMAINT_specQtype;
coordvar : LSDOMAINT_coordtype;
yearnumberfound : BOOLEAN;
daynumberfound : BOOLEAN;
numberheadfound : BOOLEAN;
PROCEDURE DatumNPrule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

FUNCTION CardunderDetP(t1:LSSTREE_pstree):BOOLEAN; 
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT (result) AND (sonlist<>NIL) DO
BEGIN
result := sonlist^.node^.cat=CARD;
sonlist:=sonlist^.brother
END;
CARDunderDETP:=result;
END; (*CARDunderDETP*)
 
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
reqvar := [pospol, omegapol, negpol];
envvar := [pospol, omegapol, negpol];
superdeixisvar := omegadeixis;
classvar := omegatimeadvclass;
deixisvar := omegadeixis;
aspectvar := omegaaspect;
retrovar := false;
definitevar := omegadef;
personvar := 3;
numbervar := omeganumber;
casesvar := [];
gendersvar := [omegagender];
sexesvar := [];
actsubcsvar := [othernoun];
temporalvar := false;
possgenivar := false;
animatevar := omegaanimate;
humanvar := omegahuman;
actcomasvar := [];
thetanpvar := omegathetanp;
nounpatternefsvar := [];
posspredvar := false;
possnietnpvar := false;
moodvar := declxpmood;
genericvar := omegageneric;
possRformvar := false;
syntquantvar := omegaquant;
NPheadvar := otherNP;
specQvar := omegaspec;
coordvar := nocoord;
yearnumberfound := false;
daynumberfound := false;
numberheadfound := false;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( CARDunderDETP(b)
);globcond: BEGIN  BEGIN
SYNREL := detrel;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PROPERNOUNfield^.subc = monthnoun)
);globcond: BEGIN  BEGIN
SYNREL := head;
classvar := b^.ls^.PROPERNOUNfield^.class;
deixisvar := b^.ls^.PROPERNOUNfield^.deixis;
aspectvar := b^.ls^.PROPERNOUNfield^.aspect;
retrovar := b^.ls^.PROPERNOUNfield^.retro;
gendersvar := b^.ls^.PROPERNOUNfield^.genders;
actsubcsvar := [b^.ls^.PROPERNOUNfield^.subc];
temporalvar := b^.ls^.PROPERNOUNfield^.temporal;
possgenivar := b^.ls^.PROPERNOUNfield^.possgeni;
animatevar := b^.ls^.PROPERNOUNfield^.animate;
humanvar := b^.ls^.PROPERNOUNfield^.human;
actcomasvar := [count];
posspredvar := true;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.NPhead = cardNP)
);globcond: BEGIN  BEGIN
SYNREL := postmodrel;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := modrel;
daynumberfound := true;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus((b^.ls^.PUNCfield^.key = auxkey('forwslashPUNCkey')
)
);globcond: BEGIN  BEGIN
SYNREL := puncrel;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus(true
);globcond: BEGIN  BEGIN
SYNREL := head;
numberheadfound := true;
temporalvar := true;
classvar := reference;
aspectvar := perfective
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.NPhead = cardNP)
);globcond: BEGIN  BEGIN
SYNREL := postmodrel;
yearnumberfound := true;
END
END; END;
8: 
CASE mode OF
loccond:LIPRIMS_assignstatus( daynoun IN b^.ls^.NPfield^.actsubcs
);globcond: BEGIN  BEGIN
SYNREL := modrel;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( (numberheadfound <= (daynumberfound OR yearnumberfound))
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.req := reqvar;
top^.ls^.NPfield^.env := envvar;
top^.ls^.NPfield^.superdeixis := superdeixisvar;
top^.ls^.NPfield^.class := classvar;
top^.ls^.NPfield^.deixis := deixisvar;
top^.ls^.NPfield^.aspect := aspectvar;
top^.ls^.NPfield^.retro := retrovar;
top^.ls^.NPfield^.definite := def;
top^.ls^.NPfield^.person := 3;
top^.ls^.NPfield^.number := singular;
top^.ls^.NPfield^.cases := [nominative, accusative, dative];
top^.ls^.NPfield^.genders := gendersvar;
top^.ls^.NPfield^.sexes := sexesvar;
top^.ls^.NPfield^.actsubcs := actsubcsvar;
top^.ls^.NPfield^.temporal := temporalvar;
top^.ls^.NPfield^.possgeni := possgenivar;
top^.ls^.NPfield^.animate := animatevar;
top^.ls^.NPfield^.human := humanvar;
top^.ls^.NPfield^.actcomas := actcomasvar;
top^.ls^.NPfield^.thetanp := thetanpvar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefsvar;
top^.ls^.NPfield^.posspred := posspredvar;
top^.ls^.NPfield^.possnietnp := possnietnpvar;
top^.ls^.NPfield^.mood := moodvar;
top^.ls^.NPfield^.generic := genericvar;
top^.ls^.NPfield^.possRform := possRformvar;
top^.ls^.NPfield^.syntquant := syntquantvar;
top^.ls^.NPfield^.NPhead := otherNP;
top^.ls^.NPfield^.specQ := yesspec;
top^.ls^.NPfield^.coord := nocoord;
END
END; END;
END;
END;{package}
PACKAGE NPcardrulepack: [NPcardrulerule];
VAR 
retropar : LSDOMAINT_retrotype; (*can it be left out, syntactically *)

PROCEDURE NPcardrulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
retropar := false;
END;
1 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.definite := def;
top^.ls^.NPfield^.cases := [nominative, accusative, dative];
top^.ls^.NPfield^.temporal := true;
top^.ls^.NPfield^.animate := noanimate;
top^.ls^.NPfield^.human := nohuman;
top^.ls^.NPfield^.posspred := true;
top^.ls^.NPfield^.generic := omegageneric;
top^.ls^.NPfield^.NPhead := cardNP;
top^.ls^.NPfield^.specQ := yesspec;
top^.ls^.NPfield^.class := reference;
top^.ls^.NPfield^.aspect := perfective;
END;
END; END;
END;
END;{package}
PACKAGE ADJP1srulepack: [ADJP1srulerule];
VAR preADVfound : BOOLEAN;
reqvar : LSDOMAINT_polarityEFFSETtype;
envvar : LSDOMAINT_polarityEFFSETtype;
classvar : LSDOMAINT_timeadvclasstype;
deixisvar : LSDOMAINT_deixistype;
aspectvar : LSDOMAINT_aspecttype;
retrovar : LSDOMAINT_retrotype;
actuseefsvar : LSDOMAINT_adjuseEFFSETtype;
eformationvar : LSDOMAINT_eformationtype;
enominalisedvar : LSDOMAINT_enominalisedtype;
formvar : LSDOMAINT_adjadvformtype;
eORenFormvar : LSDOMAINT_eorenformtype;
temporalvar : LSDOMAINT_temporaltype;
actsubcefsvar : LSDOMAINT_adjsubceffsettype;
thetaadjvar : LSDOMAINT_thetaadjtype;
adjpatternefsvar : LSDOMAINT_synpatterneffsettype;
reflexivityvar : LSDOMAINT_reflexivetype;
moodvar : LSDOMAINT_xpmoodtype;

PROCEDURE ADJP1srulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
preADVfound := false;
reqvar := [omegapol, pospol, negpol];
envvar := [omegapol, pospol, negpol];
classvar := omegaTimeAdvClass;
deixisvar := omegadeixis;
aspectvar := omegaAspect;
retrovar := false;
actuseefsvar := [];
eformationvar := RegEformation;
enominalisedvar := regeNominalised;
formvar := positive;
eORenFormvar := eform;
temporalvar := false;
actsubcefsvar := [otheradj];
thetaadjvar := omegathetaadjp;
adjpatternefsvar := [];
reflexivityvar := notreflexive;
moodvar := declxpmood;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (preXPAdv in b^.ls^.ADVPfield^.actsubcefs) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
preADVfound := true
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADJPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := head;
reqvar := b^.ls^.ADJPfield^.req;
envvar := b^.ls^.ADJPfield^.env;
classvar := b^.ls^.ADJPfield^.class;
deixisvar := b^.ls^.ADJPfield^.deixis;
aspectvar := b^.ls^.ADJPfield^.aspect;
retrovar := b^.ls^.ADJPfield^.retro;
actuseefsvar := b^.ls^.ADJPfield^.actuseefs;
eformationvar := b^.ls^.ADJPfield^.eformation;
enominalisedvar := b^.ls^.ADJPfield^.enominalised;
formvar := b^.ls^.ADJPfield^.form;
eORenFormvar := b^.ls^.ADJPfield^.eORenform;
actsubcefsvar := b^.ls^.ADJPfield^.actsubcefs;
thetaadjvar := b^.ls^.ADJPfield^.thetaadj;
adjpatternefsvar := b^.ls^.ADJPfield^.adjpatternefs;
temporalvar := b^.ls^.ADJPfield^.temporal;
reflexivityvar := b^.ls^.ADJPfield^.reflexivity;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(ADJP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.ADJPfield^.req := reqvar;
top^.ls^.ADJPfield^.class := classvar;
top^.ls^.ADJPfield^.deixis := deixisvar;
top^.ls^.ADJPfield^.aspect := aspectvar;
top^.ls^.ADJPfield^.retro := retrovar;
top^.ls^.ADJPfield^.actuseefs := actuseefsvar;
top^.ls^.ADJPfield^.eformation := eformationvar;
top^.ls^.ADJPfield^.eNominalised := enominalisedvar;
top^.ls^.ADJPfield^.form := formvar;
top^.ls^.ADJPfield^.eORenform := eORenFormvar;
top^.ls^.ADJPfield^.actsubcefs := actsubcefsvar;
top^.ls^.ADJPfield^.thetaadj := thetaadjvar;
top^.ls^.ADJPfield^.adjpatternefs := adjpatternefsvar;
top^.ls^.ADJPfield^.mood := moodvar; 
top^.ls^.ADJPfield^.temporal := temporalvar; 
END
END; END;
END;
END;{package}
PACKAGE ADJP2srulepack: [ADJP2srulerule];
(* MET locargrel is nog geen rekening gehouden *) 
VAR 
teller :  integer;
AANPREPPfound : BOOLEAN;
COMPARATIVEexpected : BOOLEAN; (* om optreden van bijv. 'iets' in
'iets mooier' afhankelijk te maken
van '-er'. *)
COMPARATIVEfound : BOOLEAN; (* idem *) 
COMPARATIVEcomplexpected : BOOLEAN; (* Bedoeld om 
- het optreden van ADVP `zo'
(datcompl) zonder complement
uit te sluiten *)
COMPARATIVEcomplfound : BOOLEAN; (* idem *) 
vancomplpossible : BOOLEAN; (* bedoeld om optreden van compl to 
meest(e) te beregelen *)
THANPpossible : BOOLEAN; (* bedoeld om optreden van THANP
te beregelen *) 
SUPERLATIVEexpected : BOOLEAN; 
(* Bedoeld om optreden van `het' zonder 
`meest' te koppelen aan aanwezigheid 
van superlative ADJ. NB:  In dit geval
is er geen sprake van een QP. *)
SUPERLATIVEfound : BOOLEAN; (* idem *) 
DEGREECOMPLfound : BOOLEAN; (* funtioneert nog niet echt *)
DEGREEMODexpected : BOOLEAN; (* Deze parameter wordt gebruikt om
te zorgen dat voor PREPPs maar 
preadjectival positie is. *)
DEGREEMODfound : BOOLEAN; (* Deze parameter is multi-functioneeel:  
hij wordt niet alleen gebruikt om te 
voorkomen dat er twee of meer degree-
modifiers optreden. in combinatie met
DEGREEmodexpected wordt ook de distri-
butie van PP's ermee beregeld. *)
DONPfound : BOOLEAN;
erPREPPfound : BOOLEAN; (* om not-stranded, not er-(pa)PREPobjs 
uit te sluiten als alleen prepsent-
patterns kunnen
*)
strandedPREPPfound : BOOLEAN; (* idem *) 
HEADexpected : BOOLEAN; (* HEADexpected:  eerstvolgende string is head 
van ADJP, dus ADJ. Bedoeld om de condities
op gestrande preposities te vangen. *)
ALSCOMPLADVfound : BOOLEAN; (* om bij te houden of 'zo' als degreeadv 
gevonden is; example:  zo spoedig mogelijk
*)
IONPfound : BOOLEAN;
NEGORPOSfound : BOOLEAN;
omcomplexpected : BOOLEAN;
PAOBJfound : BOOLEAN; (* Om bij te houden of er een prepobj in 
PostAdjectival position is gevonden *)
erposPAOBJfound : BOOLEAN; (* Om bij te houden of er een PAprepobj in 
erposrel is gevonden *)
PASENTCOMPLfound : BOOLEAN; (* Om bij te houden of er een sententieel
complement in 
PostAdjectival position is gevonden *)
PREPOBJexpected : BOOLEAN;
PREPOBJfound : BOOLEAN;
HOPexpected : BOOLEAN;
HOPfound : BOOLEAN;
PROOBJSENTfound : BOOLEAN;
REFLRELfound : BOOLEAN;
STADVfound : BOOLEAN;
COMPLfound : BOOLEAN;
VOORobjmodfound : BOOLEAN;
reqvar : LSDOMAINT_polarityEFFSETtype;
envvar : LSDOMAINT_polarityEFFSETtype;
classvar : LSDOMAINT_timeadvclasstype;
deixisvar : LSDOMAINT_deixistype;
aspectvar : LSDOMAINT_aspecttype;
retrovar : LSDOMAINT_retrotype;
actuseefsvar : LSDOMAINT_adjuseEFFSETtype;
eformationvar : LSDOMAINT_eformationtype;
enominalisedvar : LSDOMAINT_enominalisedtype;
formvar : LSDOMAINT_adjadvformtype;
eORenFormvar : LSDOMAINT_eorenformtype;
temporalvar : LSDOMAINT_temporaltype;
actsubcefsvar : LSDOMAINT_adjsubceffsettype;
thetaadjvar : LSDOMAINT_thetaadjtype;
adjpatternefsvar : LSDOMAINT_synpatterneffsettype;
prepkeyvar : LSDOMAINT_keytype;
reflexivityvar : LSDOMAINT_reflexivetype;
moodvar : LSDOMAINT_xpmoodtype;
PROCEDURE ADJP2srulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

PROCEDURE reduceadjpatterns(VAR adjps: LSDOMAINT_synpatternEFFSETtype);
BEGIN 
IF DONPfound
THEN adjps := adjps * LSAUXDOM_objadjps;
IF IONPfound
THEN adjps := adjps * LSAUXDOM_indobjadjps;
IF AANPREPPfound
THEN adjps := adjps * LSAUXDOM_aanobjadjps;
IF (PREPOBJfound OR PAOBJfound)
THEN adjps := adjps * (LSAUXDOM_prepobjadjps + LSAUXDOM_aanobjadjps + LSAUXDOM_PAadjps);
IF erposPAOBJfound
THEN adjps := adjps * LSAUXDOM_PAadjps;
IF PASENTCOMPLfound
THEN adjps := adjps * LSAUXDOM_sentcomplvps;
END (*reduceadjpatterns*);
PROCEDURE reduceadjsubcs(VAR actsubcs: LSDOMAINT_adjsubcEFFSETtype);
BEGIN
IF ((PROOBJSENTfound) AND (NOT DEGREEMODfound))
THEN actsubcs := actsubcs * [subjectiveadj]
END (*reduceadjsubcs*);
FUNCTION artunderqp(t1:LSSTREE_pstree):BOOLEAN; 
(* This condition is supposed to be 
met if there is an artrel (definite
article 'het' in the QP.
It is relevant to determine the value 
of actuseefs of the ADJP *)
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
WHILE NOT (result) AND (sonlist<>NIL) DO
BEGIN
IF sonlist^.node^.cat=ART THEN 
IF sonlist^.relation=artrel THEN
BEGIN
IF sonlist^.node^.ls^.artfield^.key = auxkey('hetARTkey')
 THEN result:= TRUE;
END;
sonlist:=sonlist^.brother
END;
artunderqp:=result;
END; (*artunderqp*)
FUNCTION mogelijkkey(b:LSSTREE_pstree):BOOLEAN;
VAR stree:LSSTREE_pstree;
BEGIN
IF (b^.sons^.relation =head) THEN BEGIN
stree:=b^.sons^.node;
IF (stree^.sons^.relation=head) THEN BEGIN 
stree:=stree^.sons^.node;
IF (stree^.sons^.relation=head) THEN BEGIN
stree:=stree^.sons^.node;
IF stree^.ls^.BADJfield^.key=auxkey('s_mogelijkbadj')
 THEN
mogelijkkey:=TRUE ELSE mogelijkkey:=FALSE
END;
END;
END;
END;

BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
teller := 0;
AANPREPPfound := false;
ALSCOMPLADVfound := false; 
erPREPPfound := false; 
strandedPREPPfound := false; 
COMPARATIVEexpected := false;
COMPARATIVEfound := false;
COMPARATIVEcomplexpected := false;
COMPARATIVEcomplfound := false;
THANPpossible := false;
vancomplpossible := false;
SUPERLATIVEexpected := false;
SUPERLATIVEfound := false;
DEGREECOMPLfound := false;
DEGREEMODexpected := false; 
DEGREEMODfound := false; 
DONPfound := false;
HEADexpected := false; 
HOPexpected := false; 
HOPfound := false; 
IONPfound := false;
omcomplexpected := false;
NEGORPOSfound := false;
erposPAOBJfound := false;
PAOBJfound := false;
VOORobjmodfound := false;
PASENTCOMPLfound := false;
COMPLfound := false;
PREPOBJexpected := true;
PREPOBJfound := false;
PREPOBJexpected := true;
REFLRELfound := false;
STADVfound := false;
reqvar := [omegapol, pospol, negpol];
envvar := [omegapol, pospol, negpol];
classvar := omegaTimeAdvClass;
deixisvar := omegadeixis;
aspectvar := omegaAspect;
retrovar := false;
actuseefsvar := [];
eformationvar := RegEformation;
enominalisedvar := regeNominalised;
formvar := positive;
eORenFormvar := eform;
temporalvar := false;
actsubcefsvar := [otheradj];
thetaadjvar := omegathetaadjp;
adjpatternefsvar := [];
prepkeyvar := 0; 
reflexivityvar := notreflexive;
moodvar := declxpmood;
END;
1: (* this part is a partial copy of node 25 in SENTENCEsrule (J.O.) *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.REFLPROfield^.zelf)
);globcond: BEGIN  BEGIN
SYNREL := reflrel;
REFLRELfound := true;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (dative in b^.ls^.NPfield^.cases) AND
(b^.ls^.NPfield^.NPhead <> reducedpersproNP) AND
(b^.ls^.NPfield^.NPhead <> hetNP) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := indobjrel;
IONPfound := true;
COMPLfound := true;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := erposrel;
erposPAOBJfound := true;
COMPLfound := true;
IF b^.ls^.PREPPfield^.radvkey <> 0
THEN erPREPPfound := true;
END
END; END;
22: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.headkey = auxkey('voorioprepkey')
) AND
(NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := erposrel;
VOORobjmodfound := true;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.headkey = auxkey('aanioprepkey')
) AND
(NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := erposrel;
AANPREPPfound := true;
COMPLfound := true;
DEGREEMODexpected := true;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.coord <> corrcoord) AND
(NOT b^.ls^.PREPPfield^.stranded) 
);globcond: BEGIN  BEGIN
SYNREL := erposrel;
PREPOBJfound := true;
COMPLfound := true;
DEGREEMODexpected := true;
IF b^.ls^.PREPPfield^.radvkey <> 0
THEN erPREPPfound := true;
END
END; END;
6: (* eventueel conditie toevoegen die vereist het hoofd van de ADJP een 
measure-adj is *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (accusative in b^.ls^.NPfield^.cases) AND
(b^.ls^.NPfield^.NPhead <> reducedpersproNP) AND
(b^.ls^.NPfield^.NPhead <> hetNP) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := objrel;
DONPfound := true;
COMPLfound := true;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.QPfield^.hop = false AND
NOT artunderqp(b) (* excludes 'het meest' *)
);globcond: BEGIN  BEGIN
SYNREL := degreemodrel;
DEGREEMODfound := true;
moodvar := b^.ls^.QPfield^.mood;
If b^.ls^.QPfield^.thanas = omcompl
THEN omcomplexpected := true;
IF b^.ls^.QPfield^.thanas = omegacompl
THEN COMPARATIVEexpected := true; 
(* to exclude: veel/wat mooie als ADJP *)
IF b^.ls^.QPfield^.thanas IN [alscompl, dancompl]
THEN BEGIN 
THANPpossible := true;
HEADexpected := true
END;
IF b^.ls^.QPfield^.thanas IN [ vancompl] 
THEN BEGIN 
vancomplpossible := true;
HEADexpected := true
END;
IF b^.ls^.QPfield^.thanas IN [ vancompl] 
THEN BEGIN 
actuseefsvar :=
[attributive, nominalised]
(* meest zonder 'het' *)
END;
END
END; END;
77: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.QPfield^.hop = false AND
artunderqp(b) (* het meest *)
);globcond: BEGIN  BEGIN
SYNREL := degreemodrel;
DEGREEMODfound := true;
moodvar := b^.ls^.QPfield^.mood;
IF b^.ls^.QPfield^.thanas IN [ vancompl] (* meest *)
THEN BEGIN 
vancomplpossible := true;
HEADexpected := true
END;
IF b^.ls^.QPfield^.thanas IN [ vancompl] (* meest *)
THEN BEGIN 
actuseefsvar := [predicative]
END;
END
END; END;
8: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs * [degreeadv] <> []) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := degreemodrel;
DEGREEMODfound := true;
If b^.ls^.ADVPfield^.thanas = alscompl
THEN ALSCOMPLADVfound := true;
If b^.ls^.ADVPfield^.thanas = alscompl
THEN THANPpossible := true;
If b^.ls^.ADVPfield^.thanas = datcompl
THEN COMPARATIVEcomplexpected := true;
If b^.ls^.ADVPfield^.thanas = omcompl
THEN omcomplexpected := true;
moodvar := b^.ls^.ADVPfield^.mood;
END
END; END;
88: 
CASE mode OF (* bijna wit genoeg *)
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs * [Numadv] <> []) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := premodrel;
HOPexpected := true;
moodvar := b^.ls^.ADVPfield^.mood;
END
END; END;
9: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (unitnoun IN b^.ls^.NPfield^.actsubcs) OR
((b^.ls^.NPfield^.definite = indef) AND
(mass IN b^.ls^.NPfield^.actcomas ) 
) (* amountnp *) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := degreemodrel;
DEGREEMODfound := true
END
END; END;
25: (* iets ronder *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (unitnoun IN b^.ls^.NPfield^.actsubcs) OR
((b^.ls^.NPfield^.definite = indef) AND
(mass IN b^.ls^.NPfield^.actcomas ) 
) (* amountnp *) AND 
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := premodrel;
comparativeexpected := true;
END
END; END;
10: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.headkey = auxkey('aanioprepkey')
) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := aanobjrel;
AANPREPPfound := true;
COMPLfound := true;
IF b^.ls^.PREPPfield^.stranded
THEN HEADexpected := true;
END
END; END;
11: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := prepobjrel;
PREPOBJfound := true;
COMPLfound := true;
IF b^.ls^.PREPPfield^.stranded
THEN HEADexpected := true;
IF b^.ls^.PREPPfield^.stranded
THEN strandedPREPPfound := true;
IF b^.ls^.PREPPfield^.radvkey <> 0
THEN erPREPPfound := true;
END
END; END;
12:
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.ARTfield^.key = auxkey('hetARTkey')

);globcond: BEGIN  BEGIN
SYNREL := artrel;
SUPERLATIVEexpected := true;
actuseefsvar := [predicative];
END
END; END;
13: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADJfield^.form <> sPositive)
(* To exclude ADJP-status for `veel moois'.
If `moois' sec is to be considered an ADJP, 
the condition should be modified *) 
);globcond: BEGIN  BEGIN
teller := teller + 1;
SYNREL := head;
IF b^.ls^.ADJfield^.prepkey = 0
THEN PREPOBJexpected := false;
IF b^.ls^.ADJfield^.form = comparative
THEN BEGIN
THANPpossible := true;
DEGREEMODfound := true
END;
IF b^.ls^.ADJfield^.form = comparative
THEN BEGIN
comparativefound:= true
END;
IF b^.ls^.ADJfield^.form = superlative
THEN SUPERLATIVEfound := true;
IF b^.ls^.ADJfield^.form = superlative
THEN BEGIN
vancomplpossible := true;
DEGREEMODfound := true
END;
reqvar := b^.ls^.ADJfield^.req;
envvar := b^.ls^.ADJfield^.env;
classvar := b^.ls^.ADJfield^.class;
deixisvar := b^.ls^.ADJfield^.deixis;
aspectvar := b^.ls^.ADJfield^.aspect;
retrovar := b^.ls^.ADJfield^.retro;
IF actuseefsvar = [] 
THEN actuseefsvar := b^.ls^.ADJfield^.uses
ELSE actuseefsvar := 
actuseefsvar * b^.ls^.ADJfield^.uses;
eformationvar := b^.ls^.ADJfield^.eformation;
enominalisedvar := b^.ls^.ADJfield^.enominalised;
formvar := b^.ls^.ADJfield^.form;
eORenFormvar := b^.ls^.ADJfield^.eORenform;
actsubcefsvar := b^.ls^.ADJfield^.subcs;
thetaadjvar := b^.ls^.ADJfield^.thetaadj;
adjpatternefsvar := b^.ls^.ADJfield^.adjpatterns;
prepkeyvar := b^.ls^.ADJfield^.prepkey;
temporalvar := b^.ls^.ADJfield^.temporal;
reflexivityvar := b^.ls^.ADJfield^.reflexivity;
END
END; END;
14: CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.QPfield^.hop = true
);globcond: BEGIN  BEGIN
SYNREL := hoprel;
DEGREEMODfound := true;
HOPfound := true;
END
END; END;
21: CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADJPfield^.coord <> corrcoord) AND mogelijkkey(b)
);globcond: BEGIN  BEGIN
SYNREL := zocomplrel;
DEGREECOMPLfound := true;
END
END; END;
15: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.coord <> corrcoord) 
);globcond: BEGIN  BEGIN
SYNREL := paprepobjrel;
PAOBJfound := true;
COMPLfound := true;
IF b^.ls^.PREPPfield^.stranded
THEN strandedPREPPfound := true;
IF b^.ls^.PREPPfield^.radvkey <> 0
THEN erPREPPfound := true;
END
END; END;
23: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.headkey = auxkey('voorioprepkey')
) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := voorobjrel;
END
END; END;
24: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.coord <> corrcoord) AND
(b^.ls^.PREPPfield^.actsubcefs * [loc, caus, temp] <> [])
);globcond: BEGIN  BEGIN
SYNREL := postadjrel;
END
END; END;
27:
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.coord <> corrcoord) AND
(b^.ls^.PREPPfield^.headkey = auxkey('vanprepkey')
)
);globcond: BEGIN  BEGIN
SYNREL := vancomplrel;
END
END; END;
17: (* (zeer) leuk om te zien ; NB. complementen van degreemodifiers 
beginnen als postadjrel *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.conjkey = auxkey('omconjkey')
) AND
(b^.ls^.SENTENCEfield^.coord <> corrcoord) AND
(b^.ls^.SENTENCEfield^.mood = proobjmod)
);globcond: BEGIN  BEGIN
SYNREL := omtemodrel; 
PROOBJSENTfound := true;
END
END; END;
18: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := postadjrel; 
DEGREECOMPLfound := true
END
END; END;
19: (* This subrule is relevant for testing purposes only. In sentential
contexts complement sentences occur always outside of the ADJP.*)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.senttype = subordinateclause) AND
(b^.ls^.SENTENCEfield^.adverbial = false) AND
(* JO,30-AUG-1988 13:51:46 *)
NOT (b^.ls^.SENTENCEfield^.mood IN [anterelative, relative]) 
(* 14-JUL-1989 FJ *) AND
(b^.ls^.SENTENCEfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := postadjrel; 
PASENTCOMPLfound := true;
COMPLfound := true;
END
END; END;
20: (* for example in: zo mooi dat het vervelend is om te vertrekken zal het 
weer hier wel niet worden *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.conjkey = auxkey('datconjkey')
) AND
(b^.ls^.SENTENCEfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := resultrel;
DEGREECOMPLfound := true;
COMPARATIVEcomplfound := true;
END
END; END;
26: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.conjkey = auxkey('omconjkey')
) AND
(b^.ls^.SENTENCEfield^.coord <> corrcoord) AND
(b^.ls^.SENTENCEfield^.mood IN [declarative, proobjmod])
);globcond: BEGIN  BEGIN
SYNREL := postadjrel; 
DEGREECOMPLfound := true
END
END; END;
(* the next part is a partial copy of nodes 29-35 and 38-41 
in SENTENCEsrule (J.O.) *)
31: (* 29 *)
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := negrel;
negorposfound := true;
END
END; END;
32: (* 30 *)
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := posrel;
negorposfound := true;
END
END; END;
33: (* 31 *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs *[sentadv, causadv] <> []) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := sentadvrel;
stadvfound := true
END
END; END;
34: (* 32 *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.actsubcefs * [according, caus] <> []) AND
(NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := sentadvrel;
stadvfound := true
END
END; END;
35: (* 33 *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (tempadv IN b^.ls^.ADVPfield^.actsubcefs) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := tempadvrel;
stadvfound := true
END
END; END;
36: (* 34 *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (temp IN b^.ls^.PREPPfield^.actsubcefs) AND
(NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := tempadvrel;
stadvfound := true
END
END; END;
37: (* 35 *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.temporal = true) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := tempadvrel;
stadvfound := true
END
END; END;
38: (* 38 *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (locadv IN b^.ls^.ADVPfield^.actsubcefs) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := locadvrel;
END
END; END;
39: (* 39 *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(loc IN b^.ls^.PREPPfield^.actsubcefs) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := locadvrel;
END
END; END;
40: (* 40 *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.RADVPfield^.radvkey <> auxkey('erRADVkey')
 ) AND
(b^.ls^.RADVPfield^.radvkey <> auxkey('daarRADVkey')
) AND 
(b^.ls^.RADVPfield^.radvkey <> auxkey('hierRADVkey')
)
);globcond: BEGIN  BEGIN
SYNREL := locadvrel;
END
END; END;
41: (* 41 *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.Qstatus = true ) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := agvpadvrel;
stadvfound := true;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( ((NOT reflrelfound) OR (reflexivityvar = reflexive))
(*JO, 7-NOV-1988 14:26:22 *) AND
(
COMPLfound <= 
((adjpatternefsvar * [synnoadjpargs] = [])
(* FJ, 29/11/88*) OR
(actsubcefsvar * [subjectiveadj] <> []) 
(* FJ, 27/07/89;
met het oog op voorobjmods *) 
)
) AND
((PREPOBJexpected = false) <= 
NOT (PREPOBJfound OR PAobjfound OR erposPAobjfound)
) (* FJ, 29/06/89 *) AND
(((adjpatternefsvar - LSAUXDOM_prepsentadjps) = []) <=
(erPREPPfound OR strandedPREPPfound) 
) 
);IF LIPRIMS_status THEN BEGIN
reduceadjpatterns(adjpatternefsvar);
IF ((PREPOBJfound OR PAOBJfound OR erposPAOBJfound) AND
(NOT (erPREPPfound OR strandedPREPPfound))
) 
THEN 
adjpatternefsvar := 
(adjpatternefsvar - LSAUXDOM_sentadjps);
reduceadjsubcs(actsubcefsvar);
IF ((adjpatternefsvar <> []) AND
(actsubcefsvar <> [])) AND
(NOT ((COMPARATIVEexpected) 
AND (NOT COMPARATIVEfound))) AND
(NOT ((COMPARATIVEcomplexpected) 
AND (NOT COMPARATIVEcomplfound))) AND
(NOT ((SUPERLATIVEexpected) 
AND (NOT SUPERLATIVEfound))) AND
(NOT ((HOPexpected)
AND (NOT HOPfound)))
THEN 
BEGIN
top:=MAKET_stree(ADJP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.ADJPfield^.req := reqvar;
top^.ls^.ADJPfield^.class := classvar;
top^.ls^.ADJPfield^.deixis := deixisvar;
top^.ls^.ADJPfield^.aspect := aspectvar;
top^.ls^.ADJPfield^.retro := retrovar;
top^.ls^.ADJPfield^.actuseefs := actuseefsvar;
top^.ls^.ADJPfield^.eformation := eformationvar;
top^.ls^.ADJPfield^.eNominalised := enominalisedvar;
top^.ls^.ADJPfield^.form := formvar;
top^.ls^.ADJPfield^.eORenform := eORenFormvar;
top^.ls^.ADJPfield^.actsubcefs := actsubcefsvar;
top^.ls^.ADJPfield^.thetaadj := thetaadjvar;
top^.ls^.ADJPfield^.adjpatternefs := adjpatternefsvar;
top^.ls^.ADJPfield^.mood := moodvar; 
top^.ls^.ADJPfield^.temporal := temporalvar; 
top^.ls^.ADJPfield^.reflexivity := reflexivityvar;
END;
END
END; END;
END;
END;{package}
PACKAGE THANASPsrulepack: [THANASPsrulerule];
VAR
reqvar : LSDOMAINT_polarityEFFSETtype;
envvar : LSDOMAINT_polarityEFFSETtype;
thanasvar : LSDOMAINT_thanascompltype;
 
PROCEDURE THANASPsrulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
reqvar := [omegapol, pospol, negpol];
envvar := [omegapol, pospol, negpol];
thanasvar := omegacompl;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := head;
IF b^.ls^.THANASfield^.key = auxkey('danthanaskey')

THEN thanasvar := dancompl;
IF b^.ls^.THANASfield^.key = auxkey('alsthanaskey')

THEN thanasvar := alscompl;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := complrel
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := complrel
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := complrel
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.DETPfield^.definite = indef
);globcond: BEGIN  BEGIN
SYNREL := complrel
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADJPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := complrel
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( true
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(THANP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.THANPfield^.req := reqvar;
top^.ls^.THANPfield^.env := envvar;
top^.ls^.THANPfield^.thanas := thanasvar;
END 
END; END;
END;
END;{package}
PACKAGE QPsrulepack: [QPsrulerule];
VAR 
MEESTexpected : BOOLEAN;
MEESTfound : BOOLEAN;
COMPLfound : BOOLEAN;
reqvar : LSDOMAINT_polarityEFFSETtype;
envvar : LSDOMAINT_polarityEFFSETtype;
definitevar : LSDOMAINT_deftype;
posspredvar : LSDOMAINT_posspredtype;
possnumbersvar : LSDOMAINT_numberSETtype;
posscomasvar : LSDOMAINT_posscomaSETtype;
moodvar : LSDOMAINT_xpmoodtype;
thanasvar : LSDOMAINT_thanascompltype;
hopvar : LSDOMAINT_hoptype;
 
PROCEDURE QPsrulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
MEESTexpected := false;
MEESTfound := false;
COMPLfound := false;
reqvar := [pospol, negpol, omegapol];
envvar := [pospol, negpol, omegapol];
definitevar := omegadef;
posspredvar := false;
possnumbersvar := [singular];
posscomasvar := [count];
moodvar := declxpmood;
thanasvar := omegacompl;
hopvar := false;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( degreeadv IN b^.ls^.ADVPfield^.actsubcefs (* te (veel) *)
);globcond: BEGIN  BEGIN
SYNREL := premodrel
END
END; END; 
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ((b^.ls^.NPfield^.actsubcs * [unitnoun, plurunitnoun] <> []) OR
(b^.ls^.NPfield^.actcomas * [mass] <> [])) AND
(b^.ls^.NPfield^.definite = indef) (* amountnp *) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := premodrel
END
END; END; 
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.ARTfield^.key = auxkey('hetARTkey')

);globcond: BEGIN  BEGIN
SYNREL := artrel;
MEESTexpected := true
END
END; END; 
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := head;
IF b^.ls^.Qfield^.key = auxkey('meestQkey')

THEN MEESTfound := true;
reqvar := b^.ls^.Qfield^.req;
envvar := b^.ls^.Qfield^.env;
definitevar := b^.ls^.Qfield^.definite;
posspredvar := b^.ls^.Qfield^.posspred;
possnumbersvar := b^.ls^.Qfield^.possnumbers;
posscomasvar := b^.ls^.Qfield^.posscomas;
moodvar := b^.ls^.Qfield^.mood;
thanasvar := b^.ls^.Qfield^.thanas;
hopvar := b^.ls^.Qfield^.hop; 
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true 
);globcond: BEGIN  BEGIN
SYNREL := thanascomplrel;
COMPLfound := true;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( true
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(QP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
IF (NOT ((MEESTexpected) 
AND (NOT MEESTfound)))
THEN 
BEGIN
top^.ls^.QPfield^.req := reqvar;
top^.ls^.QPfield^.env := envvar;
top^.ls^.QPfield^.definite := definitevar;
top^.ls^.QPfield^.posspred := posspredvar;
top^.ls^.QPfield^.possnumbers := possnumbersvar;
top^.ls^.QPfield^.posscomas := posscomasvar;
top^.ls^.QPfield^.mood := moodvar;
top^.ls^.QPfield^.thanas := thanasvar;
top^.ls^.QPfield^.hop := hopvar;
END;
END
END; END;
END;
END;{package}
PACKAGE PPcoordpack: [PPcoordrule];
VAR 
actsubcefsvar : LSDOMAINT_prepsubceffsettype;
aspectvar : LSDOMAINT_aspecttype;
classvar : LSDOMAINT_timeadvclasstype;
coordpar : LSDOMAINT_coordtype;
corr1found : BOOLEAN;
deixisvar : LSDOMAINT_deixistype;
envvar : LSDOMAINT_polarityEFFSETtype;
expkey : LSDOMAINT_keytype;
headkeyvar : LSDOMAINT_keytype;
itcommafound : BOOLEAN;
itcoordfound : BOOLEAN;
iterationfound : BOOLEAN;
iterationok : BOOLEAN;
moodvar : LSDOMAINT_xpmoodtype;
postformvar : LSDOMAINT_postformtype;
postpkeyvar : LSDOMAINT_keytype;
radvkeyvar : LSDOMAINT_keytype;
retrovar : LSDOMAINT_retrotype;
reqvar : LSDOMAINT_polarityEFFSETtype;
synppefsvar : LSDOMAINT_synpatterneffsettype;
specqvar : LSDOMAINT_specqtype;
strandedvar : BOOLEAN;
thetappvar : LSDOMAINT_thetapptype; 
PROCEDURE PPcoordrule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

(* moved to lssurfquo:
PROCEDURE assqmax(s1: LSDOMAINT_specqtype; VAR s2: LSDOMAINT_specqtype);
BEGIN
IF s1 = yesspec THEN s2 := s1;
END;*) (*assqmax*)
 
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
actsubcefsvar := [];
aspectvar := omegaaspect;
classvar := omegatimeadvclass;
coordpar := nocoord;
corr1found := false;
deixisvar := omegadeixis;
envvar := [omegapol, pospol, negpol];
expkey := 0;
headkeyvar := 0;
itcommafound := false;
itcoordfound := false;
iterationfound := false;
iterationok := true;
moodvar := declxpmood;
postformvar := pre;
postpkeyvar := 0;
radvkeyvar := 0;
retrovar := false;
reqvar := [omegapol, pospol, negpol];
synppefsvar := [];
specqvar := omegaspec;
strandedvar := false;
thetappvar := omegathetapp; 
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (correlative1 IN b^.ls^.COORDfield^.kinds) AND
(ppc IN b^.ls^.COORDfield^.patterns)
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
corr1found := true;
expkey := b^.ls^.COORDfield^.correlative2key;
iterationok := b^.ls^.COORDfield^.iteration;
coordpar := corrcoord;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.coord = nocoord) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := argrel;
IF iterationfound THEN BEGIN
actsubcefsvar := 
actsubcefsvar * b^.ls^.PREPPfield^.actsubcefs;
assqmax(b^.ls^.PREPPfield^.specq, specqvar);
IF headkeyvar <> b^.ls^.PREPPfield^.headkey
THEN headkeyvar := 0
END
ELSE BEGIN
actsubcefsvar := b^.ls^.PREPPfield^.actsubcefs;
aspectvar := b^.ls^.PREPPfield^.aspect;
classvar := b^.ls^.PREPPfield^.class;
moodvar := b^.ls^.PREPPfield^.mood;
retrovar := b^.ls^.PREPPfield^.retro;
specqvar := b^.ls^.PREPPfield^.specq;
headkeyvar := b^.ls^.PREPPfield^.headkey
END;
iterationfound := true;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.COORDfield^.iteration 
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
IF (NOT corr1found) THEN expkey := b^.ls^.COORDfield^.key;
itcoordfound := true;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PUNCfield^.key = auxkey('kommaPUNCkey')

);globcond: BEGIN  BEGIN
SYNREL := conjrel;
itcommafound := true;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.coord = nocoord) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := argrel;
IF iterationfound THEN BEGIN
actsubcefsvar := 
actsubcefsvar * b^.ls^.PREPPfield^.actsubcefs;
assqmax(b^.ls^.PREPPfield^.specq, specqvar);
IF headkeyvar <> b^.ls^.PREPPfield^.headkey
THEN headkeyvar := 0
END
ELSE BEGIN
actsubcefsvar := b^.ls^.PREPPfield^.actsubcefs;
aspectvar := b^.ls^.PREPPfield^.aspect;
classvar := b^.ls^.PREPPfield^.class;
moodvar := b^.ls^.PREPPfield^.mood;
retrovar := b^.ls^.PREPPfield^.retro;
specqvar := b^.ls^.PREPPfield^.specq;
headkeyvar := b^.ls^.PREPPfield^.headkey
END;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
iterationok := b^.ls^.COORDfield^.iteration;
IF (simple IN b^.ls^.COORDfield^.kinds) AND
(coordpar = nocoord) THEN
coordpar := simplecoord;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.coord = nocoord) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := argrel;
IF headkeyvar <> b^.ls^.PREPPfield^.headkey
THEN headkeyvar := 0;
actsubcefsvar := 
actsubcefsvar * b^.ls^.PREPPfield^.actsubcefs;
assqmax(b^.ls^.PREPPfield^.specq, specqvar);
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( iterationfound <= iterationok
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(PREPP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.PREPPfield^.req := reqvar;
top^.ls^.PREPPfield^.env := envvar;
top^.ls^.PREPPfield^.actsubcefs := actsubcefsvar;
top^.ls^.PREPPfield^.mood := moodvar;
top^.ls^.PREPPfield^.synppefs := [];
top^.ls^.PREPPfield^.headkey := headkeyvar;
top^.ls^.PREPPfield^.class := classvar;
top^.ls^.PREPPfield^.deixis := deixisvar;
top^.ls^.PREPPfield^.aspect := aspectvar;
top^.ls^.PREPPfield^.retro := retrovar;
top^.ls^.PREPPfield^.superdeixis := omegadeixis;
top^.ls^.PREPPfield^.thetapp := omegathetapp;
top^.ls^.PREPPfield^.radvkey := 0;
top^.ls^.PREPPfield^.stranded := false;
top^.ls^.PREPPfield^.specq := specqvar;
top^.ls^.PREPPfield^.coord := coordpar;
END
END; END;
END;
END;{package}
PACKAGE AdvPcoordpack: [AdvPcoordrule];
VAR 
actsubcefsvar : LSDOMAINT_advsubceffsettype;
advpatternsefsvar : LSDOMAINT_synpatterneffsettype;
aspectvar : LSDOMAINT_aspecttype;
classvar : LSDOMAINT_timeadvclasstype;
coordpar : LSDOMAINT_coordtype;
corr1found : BOOLEAN;
deixisvar : LSDOMAINT_deixistype;
envvar : LSDOMAINT_polarityEFFSETtype;
expkey : LSDOMAINT_keytype;
itcommafound : BOOLEAN;
itcoordfound : BOOLEAN;
iterationfound : BOOLEAN;
iterationok : BOOLEAN;
moodvar : LSDOMAINT_xpmoodtype;
possnietnpvar : LSDOMAINT_possnietnptype;
qstatusvar : LSDOMAINT_qstatustype;
radvbvar : LSDOMAINT_radvtype;
retrovar : LSDOMAINT_retrotype;
reqvar : LSDOMAINT_polarityEFFSETtype;
temporalvar : BOOLEAN;
thanasvar : LSDOMAINT_thanascompltype;
thanascomplvar : LSDOMAINT_compltype;
thetaadvvar : LSDOMAINT_thetaadvtype; 
 
PROCEDURE AdvPcoordrule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
actsubcefsvar := [];
advpatternsefsvar := [];
aspectvar := omegaaspect;
classvar := omegatimeadvclass;
coordpar := nocoord;
corr1found := false;
deixisvar := omegadeixis;
envvar := [omegapol, pospol, negpol];
expkey := 0;
itcommafound := false;
itcoordfound := false;
iterationfound := false;
iterationok := true;
moodvar := declxpmood;
possnietnpvar := false;
qstatusvar := false;
radvbvar := false;
retrovar := false;
reqvar := [omegapol, pospol, negpol];
temporalvar := false;
thanasvar := omegacompl;
thanascomplvar := false;
thetaadvvar := omegathetaadv;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (correlative1 IN b^.ls^.COORDfield^.kinds) AND
(ppc IN b^.ls^.COORDfield^.patterns)
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
corr1found := true;
expkey := b^.ls^.COORDfield^.correlative2key;
iterationok := b^.ls^.COORDfield^.iteration;
coordpar := corrcoord;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.AdvPfield^.coord = nocoord) 
);globcond: BEGIN  BEGIN
SYNREL := argrel;
IF iterationfound THEN BEGIN
actsubcefsvar := 
actsubcefsvar * b^.ls^.ADVPfield^.actsubcefs
END
ELSE BEGIN
actsubcefsvar := b^.ls^.ADVPfield^.actsubcefs;
aspectvar := b^.ls^.ADVPfield^.aspect;
classvar := b^.ls^.ADVPfield^.class;
moodvar := b^.ls^.ADVPfield^.mood;
retrovar := b^.ls^.ADVPfield^.retro;
temporalvar := b^.ls^.ADVPfield^.temporal;
Qstatusvar := b^.ls^.ADVPfield^.Qstatus
END;
iterationfound := true;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.COORDfield^.iteration 
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
IF (NOT corr1found) THEN expkey := b^.ls^.COORDfield^.key;
itcoordfound := true;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PUNCfield^.key = auxkey('kommaPUNCkey')

);globcond: BEGIN  BEGIN
SYNREL := conjrel;
itcommafound := true;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.coord = nocoord) 
);globcond: BEGIN  BEGIN
SYNREL := argrel;
IF iterationfound THEN BEGIN
actsubcefsvar := 
actsubcefsvar * b^.ls^.ADVPfield^.actsubcefs
END
ELSE BEGIN
actsubcefsvar := b^.ls^.ADVPfield^.actsubcefs;
aspectvar := b^.ls^.ADVPfield^.aspect;
classvar := b^.ls^.ADVPfield^.class;
moodvar := b^.ls^.ADVPfield^.mood;
retrovar := b^.ls^.ADVPfield^.retro;
temporalvar := b^.ls^.ADVPfield^.temporal;
qstatusvar := b^.ls^.ADVPfield^.qstatus
END;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
iterationok := b^.ls^.COORDfield^.iteration;
IF (simple IN b^.ls^.COORDfield^.kinds) AND
(coordpar = nocoord) THEN
coordpar := simplecoord;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.coord = nocoord) 
);globcond: BEGIN  BEGIN
SYNREL := argrel;
actsubcefsvar := 
actsubcefsvar * b^.ls^.ADVPfield^.actsubcefs;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( iterationfound <= iterationok
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(ADVP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.ADVPfield^.req := reqvar;
top^.ls^.ADVPfield^.env := envvar;
top^.ls^.ADVPfield^.actsubcefs := actsubcefsvar;
top^.ls^.ADVPfield^.mood := moodvar;
top^.ls^.ADVPfield^.advpatternefs := [];
top^.ls^.ADVPfield^.class := classvar;
top^.ls^.ADVPfield^.deixis := deixisvar;
top^.ls^.ADVPfield^.aspect := aspectvar;
top^.ls^.ADVPfield^.retro := retrovar;
top^.ls^.ADVPfield^.superdeixis := omegadeixis;
top^.ls^.ADVPfield^.thetaadv := omegathetaadv;
top^.ls^.ADVPfield^.Qstatus := Qstatusvar;
top^.ls^.ADVPfield^.temporal := temporalvar;
top^.ls^.ADVPfield^.possnietnp := false;
top^.ls^.ADVPfield^.radvb := false;
top^.ls^.ADVPfield^.thanas := thanasvar;
top^.ls^.ADVPfield^.thanascompl := thanascomplvar;
top^.ls^.ADVPfield^.coord := coordpar;
END
END; END;
END;
END;{package}
PACKAGE ADJPcoordpack: [ADJPcoordrule];
VAR 
reqvar : LSDOMAINT_polarityEFFSETtype;
envvar : LSDOMAINT_polarityEFFSETtype;
classvar : LSDOMAINT_timeadvclasstype;
deixisvar : LSDOMAINT_deixistype;
aspectvar : LSDOMAINT_aspecttype;
retrovar : LSDOMAINT_retrotype;
actuseefsvar : LSDOMAINT_adjuseEFFSETtype;
eformationvar : LSDOMAINT_eFormationtype;
enominalisedvar : LSDOMAINT_enominalisedtype;
formvar : LSDOMAINT_adjadvFormtype;
eORenFormvar : LSDOMAINT_eORenFormtype;
temporalvar : LSDOMAINT_temporaltype;
actsubcefsvar : LSDOMAINT_adjsubcEFFSETtype;
thetaadjvar : LSDOMAINT_thetaadjtype;
adjpatternefsvar : LSDOMAINT_synpatternEFFSETtype;
reflexivityvar : LSDOMAINT_reflexivetype;
moodvar : LSDOMAINT_xpmoodtype;
coordpar : LSDOMAINT_coordtype;
corr1found : BOOLEAN;
expkey : LSDOMAINT_keytype;
itcommafound : BOOLEAN;
itcoordfound : BOOLEAN;
iterationfound : BOOLEAN;
iterationok : BOOLEAN;
 
PROCEDURE ADJPcoordrule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
reqvar := [pospol, negpol, omegapol];
envvar := [pospol, negpol, omegapol];
classvar := omegatimeadvclass;
deixisvar := omegadeixis;
aspectvar := omegaaspect;
retrovar := false;
actuseefsvar := [];
eformationvar := RegEformation;
enominalisedvar := Regenominalised;
formvar := positive;
eORenFormvar := NoForm;
temporalvar := false;
actsubcefsvar := [otheradj];
thetaadjvar := omegathetaadjp;
adjpatternefsvar := [];
reflexivityvar := notreflexive;
moodvar := declxpmood;
coordpar := nocoord;
corr1found := false;
expkey := 0;
itcommafound := false;
itcoordfound := false;
iterationfound := false;
iterationok := true;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (correlative1 IN b^.ls^.COORDfield^.kinds) AND
(apc IN b^.ls^.COORDfield^.patterns)
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
corr1found := true;
expkey := b^.ls^.COORDfield^.correlative2key;
iterationok := b^.ls^.COORDfield^.iteration;
coordpar := corrcoord;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADJPfield^.coord = nocoord) 
);globcond: BEGIN  BEGIN
SYNREL := argrel;
IF iterationfound THEN BEGIN
actuseefsvar := actuseefsvar * b^.ls^.ADJPfield^.actuseefs
END
ELSE BEGIN
actuseefsvar := b^.ls^.ADJPfield^.actuseefs;
moodvar := b^.ls^.ADJPfield^.mood;
formvar := b^.ls^.ADJPfield^.form
END;
iterationfound := true;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.COORDfield^.iteration 
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
IF (NOT corr1found) THEN expkey := b^.ls^.COORDfield^.key;
itcoordfound := true;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PUNCfield^.key = auxkey('kommaPUNCkey')

);globcond: BEGIN  BEGIN
SYNREL := conjrel;
itcommafound := true;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADJPfield^.coord = nocoord) 
);globcond: BEGIN  BEGIN
SYNREL := argrel;
IF iterationfound THEN BEGIN
actuseefsvar := actuseefsvar * b^.ls^.ADJPfield^.actuseefs
END
ELSE BEGIN
actuseefsvar := b^.ls^.ADJPfield^.actuseefs;
moodvar := b^.ls^.ADJPfield^.mood;
formvar := b^.ls^.ADJPfield^.form
END;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
iterationok := b^.ls^.COORDfield^.iteration;
IF (simple IN b^.ls^.COORDfield^.kinds) AND
(coordpar = nocoord) THEN
coordpar := simplecoord;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADJPfield^.coord = nocoord) 
);globcond: BEGIN  BEGIN
SYNREL := argrel;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( iterationfound <= iterationok
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(ADJP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.ADJPfield^.req := reqvar;
top^.ls^.ADJPfield^.env := envvar; 
top^.ls^.ADJPfield^.class := classvar;
top^.ls^.ADJPfield^.deixis := deixisvar;
top^.ls^.ADJPfield^.aspect := aspectvar;
top^.ls^.ADJPfield^.retro := retrovar;
top^.ls^.ADJPfield^.actuseefs := actuseefsvar;
top^.ls^.ADJPfield^.eformation := eformationvar;
top^.ls^.ADJPfield^.enominalised := enominalisedvar;
top^.ls^.ADJPfield^.form := formvar;
top^.ls^.ADJPfield^.eORenform := eORenFormvar;
top^.ls^.ADJPfield^.temporal := temporalvar;
top^.ls^.ADJPfield^.actsubcefs := actsubcefsvar;
top^.ls^.ADJPfield^.thetaadj := thetaadjvar;
top^.ls^.ADJPfield^.adjpatternefs := adjpatternefsvar;
top^.ls^.ADJPfield^.reflexivity := reflexivityvar;
top^.ls^.ADJPfield^.mood := moodvar;
top^.ls^.ADJPfield^.coord := coordpar;
END
END; END;
END;
END;{package}
PACKAGE NPcoordpack: [NPcoordrule];
VAR 
reqvar : LSDOMAINT_polarityEFFSETtype;
envvar : LSDOMAINT_polarityEFFSETtype;
superdeixisvar : LSDOMAINT_deixistype;
classvar : LSDOMAINT_timeadvclasstype;
deixisvar : LSDOMAINT_deixistype;
aspectvar : LSDOMAINT_aspecttype;
retrovar : LSDOMAINT_retrotype;
definitevar : LSDOMAINT_deftype;
personvar : LSDOMAINT_persontype;
numbervar : LSDOMAINT_numbertype;
casesvar : LSDOMAINT_caseSETtype;
gendersvar : LSDOMAINT_genderSETtype;
sexesvar : LSDOMAINT_sexSETtype;
actsubcsvar : LSDOMAINT_nounsubcEFFSETtype;
temporalvar : LSDOMAINT_temporaltype;
possgenivar : LSDOMAINT_possgenitype;
animatevar : LSDOMAINT_animatetype;
humanvar : LSDOMAINT_humantype;
actcomasvar : LSDOMAINT_posscomaSETtype;
thetanpvar : LSDOMAINT_thetanptype;
nounpatternefsvar : LSDOMAINT_synpatternEFFSETtype;
posspredvar : LSDOMAINT_posspredtype;
possnietnpvar : LSDOMAINT_possnietnptype;
moodvar : LSDOMAINT_xpmoodtype;
genericvar : LSDOMAINT_generictype;
possRformvar : LSDOMAINT_possRformtype;
syntquantvar : LSDOMAINT_syntquanttype;
NPheadvar : LSDOMAINT_NPheadtype;
specQvar : LSDOMAINT_specQtype;
coordpar : LSDOMAINT_coordtype;
corr1found : BOOLEAN;
expkey : LSDOMAINT_keytype;
inducednumbersvar : LSDOMAINT_numberSETtype;
itcommafound : BOOLEAN;
itcoordfound : BOOLEAN;
iterationfound : BOOLEAN;
iterationok : BOOLEAN;
PROCEDURE NPcoordrule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

PROCEDURE assqmax(s1: LSDOMAINT_specqtype; VAR s2: LSDOMAINT_specqtype);
BEGIN
IF s1 = yesspec THEN s2 := s1;
END (*assqmax*);
PROCEDURE compactcomas(acs: LSDOMAINT_posscomaSETtype; VAR acsv: LSDOMAINT_posscomaSETtype);
BEGIN
IF (acs * acsv <> []) THEN acsv := acsv * acs
ELSE acsv := [];
END (*compactcomas*);
PROCEDURE companimate(h: LSDOMAINT_animatetype; VAR hv: LSDOMAINT_animatetype);
BEGIN
IF (h = noanimate) OR (hv = noanimate) THEN hv := noanimate
ELSE hv := yesanimate;
END (*companimate*);
PROCEDURE compdef(d: LSDOMAINT_deftype; VAR dv: LSDOMAINT_deftype);
BEGIN
IF (d = def) OR (dv = def) THEN dv := def
ELSE IF (d = adef) OR (dv = adef) THEN dv := adef
ELSE dv := indef;
END (*compdef*);
PROCEDURE comphuman(h: LSDOMAINT_humantype; VAR hv: LSDOMAINT_humantype);
BEGIN
IF (h = nohuman) OR (hv = nohuman) THEN hv := nohuman
ELSE hv := yeshuman;
END (*comphuman*);
PROCEDURE comppers(p: LSDOMAINT_persontype; VAR pv: LSDOMAINT_persontype);
BEGIN
IF (p = 1) OR (pv = 1) THEN pv :=1
ELSE IF (p IN [2,4,5]) OR (pv IN [2,4,5]) THEN pv :=2
ELSE pv :=3;
END (*comppers*);
PROCEDURE comppossgeni(pg: LSDOMAINT_possgenitype; VAR pgv: LSDOMAINT_possgenitype);
BEGIN
IF (pg = false) OR (pgv = false) THEN pgv := false
ELSE pgv := true;
END (*comppossgeni*);
PROCEDURE comppossnietnp(pn: LSDOMAINT_possnietnptype; VAR pnv: LSDOMAINT_possnietnptype);
BEGIN
IF (pn = false) OR (pnv = false) THEN pnv := false
ELSE pnv := true;
END (*comppossnietnp*);
PROCEDURE compposspred(p: LSDOMAINT_posspredtype; VAR pv: LSDOMAINT_posspredtype);
BEGIN
IF (p = false) OR (pv = false) THEN pv := false
ELSE pv := true;
END (*compposspred*);
PROCEDURE compsyntquant(s: LSDOMAINT_syntquanttype; VAR sv: LSDOMAINT_syntquanttype);
BEGIN
IF (s = omegaquant) OR (sv = omegaquant) THEN sv := omegaquant
ELSE IF (s = Aquant) OR (sv = Aquant) THEN sv := Aquant
ELSE sv := Equant;
END (*compsyntquant*);
PROCEDURE comptemp(
VAR temporalvar : LSDOMAINT_temporaltype;
VAR classvar : LSDOMAINT_timeadvclasstype;
VAR deixisvar : LSDOMAINT_deixistype;
VAR retrovar : LSDOMAINT_retrotype;
VAR aspectvar : LSDOMAINT_aspecttype
);
BEGIN
IF (b^.ls^.NPfield^.temporal = temporalvar) AND
(b^.ls^.NPfield^.class = classvar) AND
(b^.ls^.NPfield^.deixis = deixisvar) AND
(b^.ls^.NPfield^.retro = retrovar) AND
(b^.ls^.NPfield^.aspect = aspectvar)
THEN BEGIN 
temporalvar := b^.ls^.NPfield^.temporal;
classvar := b^.ls^.NPfield^.class;
deixisvar := b^.ls^.NPfield^.deixis;
retrovar := b^.ls^.NPfield^.retro;
aspectvar := b^.ls^.NPfield^.aspect;
END
ELSE BEGIN
temporalvar := false;
classvar := omegatimeadvclass;
deixisvar := omegadeixis;
retrovar := false;
aspectvar := omegaAspect;
END;
END (*comptemp*);
 
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
reqvar := [pospol, omegapol, negpol];
envvar := [pospol, omegapol, negpol];
superdeixisvar := omegadeixis;
classvar := omegatimeadvclass;
deixisvar := omegadeixis;
aspectvar := omegaaspect;
retrovar := false;
definitevar := omegadef;
personvar := 3;
numbervar := omeganumber;
casesvar := [];
gendersvar := [];
sexesvar := [];
actsubcsvar := [];
temporalvar := false;
possgenivar := false;
animatevar := omegaanimate;
humanvar := omegahuman;
actcomasvar := [];
thetanpvar := omegathetanp;
nounpatternefsvar := [];
posspredvar := false;
possnietnpvar := false;
moodvar := declxpmood;
genericvar := omegageneric;
possRformvar := false;
syntquantvar := omegaquant;
NPheadvar := otherNP;
specQvar := omegaspec;
coordpar := nocoord;
corr1found := false;
expkey := 0;
inducednumbersvar := [];
itcommafound := false;
itcoordfound := false;
iterationfound := false;
iterationok := true;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (correlative1 IN b^.ls^.COORDfield^.kinds) AND
(npc IN b^.ls^.COORDfield^.patterns)
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
corr1found := true;
expkey := b^.ls^.COORDfield^.correlative2key;
iterationok := b^.ls^.COORDfield^.iteration;
coordpar := corrcoord;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.coord = nocoord) AND
NOT (b^.ls^.NPfield^.NPhead IN [hetNP,jegenNP,zegenNP,
reducedpersproNP])
);globcond: BEGIN  BEGIN
SYNREL := argrel;
IF iterationfound THEN BEGIN
casesvar := casesvar * b^.ls^.NPfield^.cases;
END
ELSE BEGIN
moodvar := b^.ls^.NPfield^.mood;
casesvar := b^.ls^.NPfield^.cases
END;
(* boven item parameters, onder non-item 
paramers, rene 11-4-90 *)
IF iterationfound THEN BEGIN
comppossgeni(b^.ls^.NPfield^.possgeni, possgenivar );
comphuman(b^.ls^.NPfield^.human, humanvar );
compposspred(b^.ls^.NPfield^.posspred, posspredvar );
comppossnietnp(b^.ls^.NPfield^.possnietnp, possnietnpvar );
compsyntquant(b^.ls^.NPfield^.syntquant, syntquantvar );
assqmax(b^.ls^.NPfield^.specq, specqvar );
companimate(b^.ls^.NPfield^.animate, animatevar );
compactcomas(b^.ls^.NPfield^.actcomas, actcomasvar );
compdef(b^.ls^.NPfield^.definite, definitevar );
comppers(b^.ls^.NPfield^.person, personvar );
compnumber( numbervar,
inducednumbersvar,
b
);
comptemp(
temporalvar, classvar , deixisvar ,
retrovar , aspectvar
);
END
ELSE BEGIN
possgenivar := b^.ls^.NPfield^.possgeni;
humanvar := b^.ls^.NPfield^.human;
posspredvar := b^.ls^.NPfield^.posspred;
possnietnpvar := b^.ls^.NPfield^.possnietnp;
syntquantvar := b^.ls^.NPfield^.syntquant;
specqvar := b^.ls^.NPfield^.specq;
animatevar := b^.ls^.NPfield^.animate;
actcomasvar := b^.ls^.NPfield^.actcomas;
numbervar := b^.ls^.NPfield^.number;
temporalvar := b^.ls^.NPfield^.temporal;
deixisvar := b^.ls^.NPfield^.deixis;
aspectvar := b^.ls^.NPfield^.aspect;
classvar := b^.ls^.NPfield^.class;
definitevar := b^.ls^.NPfield^.definite;
personvar := b^.ls^.NPfield^.person;
retrovar := b^.ls^.NPfield^.retro;
END;
iterationfound := true;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.COORDfield^.iteration 
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
IF (NOT corr1found) THEN expkey := b^.ls^.COORDfield^.key;
itcoordfound := true;
inducednumbersvar:=b^.ls^.COORDfield^.inducednumbers;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PUNCfield^.key = auxkey('kommaPUNCkey')

);globcond: BEGIN  BEGIN
SYNREL := conjrel;
itcommafound := true;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.coord = nocoord) AND
NOT (b^.ls^.NPfield^.NPhead IN [hetNP,jegenNP,zegenNP,
reducedpersproNP])
);globcond: BEGIN  BEGIN
SYNREL := argrel;
IF iterationfound THEN BEGIN
casesvar := casesvar * b^.ls^.NPfield^.cases;
END
ELSE BEGIN
moodvar := b^.ls^.NPfield^.mood;
casesvar := b^.ls^.NPfield^.cases
END;
(* boven item parameters, onder non-item 
paramers, rene 11-4-90 *)
IF iterationfound THEN BEGIN
comppossgeni(b^.ls^.NPfield^.possgeni, possgenivar);
comphuman(b^.ls^.NPfield^.human, humanvar);
compposspred(b^.ls^.NPfield^.posspred, posspredvar);
comppossnietnp(b^.ls^.NPfield^.possnietnp, possnietnpvar);
compsyntquant(b^.ls^.NPfield^.syntquant, syntquantvar);
assqmax(b^.ls^.NPfield^.specq, specqvar);
companimate(b^.ls^.NPfield^.animate, animatevar);
compactcomas(b^.ls^.NPfield^.actcomas, actcomasvar);
compdef(b^.ls^.NPfield^.definite, definitevar);
comppers(b^.ls^.NPfield^.person, personvar);
compnumber( numbervar,
inducednumbersvar,
b
);
comptemp(
temporalvar, classvar , deixisvar ,
retrovar , aspectvar
);
END
ELSE BEGIN
possgenivar := b^.ls^.NPfield^.possgeni;
humanvar := b^.ls^.NPfield^.human;
posspredvar := b^.ls^.NPfield^.posspred;
possnietnpvar := b^.ls^.NPfield^.possnietnp;
syntquantvar := b^.ls^.NPfield^.syntquant;
specqvar := b^.ls^.NPfield^.specq;
animatevar := b^.ls^.NPfield^.animate;
actcomasvar := b^.ls^.NPfield^.actcomas;
numbervar := b^.ls^.NPfield^.number;
temporalvar := b^.ls^.NPfield^.temporal;
deixisvar := b^.ls^.NPfield^.deixis;
aspectvar := b^.ls^.NPfield^.aspect;
classvar := b^.ls^.NPfield^.class;
definitevar := b^.ls^.NPfield^.definite;
personvar := b^.ls^.NPfield^.person;
retrovar := b^.ls^.NPfield^.retro;
END;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
iterationok := b^.ls^.COORDfield^.iteration;
IF (simple IN b^.ls^.COORDfield^.kinds) AND
(coordpar = nocoord) THEN
coordpar := simplecoord;
IF (NOT itcoordfound) 
THEN 
inducednumbersvar := b^.ls^.COORDfield^.inducednumbers;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.coord = nocoord) AND
NOT (b^.ls^.NPfield^.NPhead IN [hetNP,jegenNP,zegenNP,
reducedpersproNP])
);globcond: BEGIN  BEGIN
SYNREL := argrel;
casesvar := casesvar * b^.ls^.NPfield^.cases;
comppossgeni(b^.ls^.NPfield^.possgeni, possgenivar);
comphuman(b^.ls^.NPfield^.human, humanvar);
compposspred(b^.ls^.NPfield^.posspred, posspredvar);
comppossnietnp(b^.ls^.NPfield^.possnietnp, possnietnpvar);
compsyntquant(b^.ls^.NPfield^.syntquant, syntquantvar);
assqmax(b^.ls^.NPfield^.specq, specqvar);
companimate(b^.ls^.NPfield^.animate, animatevar);
compactcomas(b^.ls^.NPfield^.actcomas, actcomasvar);
compdef(b^.ls^.NPfield^.definite, definitevar);
comppers(b^.ls^.NPfield^.person, personvar);
compnumber( numbervar,
inducednumbersvar,
b
);
comptemp(
temporalvar, classvar , deixisvar ,
retrovar , aspectvar
);
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( iterationfound <= iterationok
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.req := reqvar;
top^.ls^.NPfield^.env := envvar;
top^.ls^.NPfield^.superdeixis := superdeixisvar;
top^.ls^.NPfield^.class := classvar;
top^.ls^.NPfield^.deixis := deixisvar;
top^.ls^.NPfield^.aspect := aspectvar;
top^.ls^.NPfield^.retro := retrovar;
top^.ls^.NPfield^.definite := definitevar;
top^.ls^.NPfield^.person := personvar;
top^.ls^.NPfield^.number := numbervar;
top^.ls^.NPfield^.cases := casesvar;
top^.ls^.NPfield^.genders := gendersvar;
top^.ls^.NPfield^.sexes := sexesvar;
top^.ls^.NPfield^.actsubcs := actsubcsvar;
top^.ls^.NPfield^.temporal := temporalvar;
top^.ls^.NPfield^.possgeni := possgenivar;
top^.ls^.NPfield^.animate := animatevar;
top^.ls^.NPfield^.human := humanvar;
top^.ls^.NPfield^.actcomas := actcomasvar;
top^.ls^.NPfield^.thetanp := thetanpvar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefsvar;
top^.ls^.NPfield^.posspred := posspredvar;
top^.ls^.NPfield^.possnietnp := possnietnpvar;
top^.ls^.NPfield^.mood := moodvar;
top^.ls^.NPfield^.generic := genericvar;
top^.ls^.NPfield^.possRform := possRformvar;
top^.ls^.NPfield^.syntquant := syntquantvar;
top^.ls^.NPfield^.NPhead := NPheadvar;
top^.ls^.NPfield^.specQ := specQvar;
top^.ls^.NPfield^.coord := coordpar;
END
END; END;
END;
END;{package}
PACKAGE Scoordpack: [Scoordrule];
VAR 
reqvar: LSDOMAINT_polarityEFFSETtype;
envvar: LSDOMAINT_polarityEFFSETtype;
moodvar: LSDOMAINT_moodtype;
senttypevar: LSDOMAINT_senttypetype;
voicevar: LSDOMAINT_voicetype;
PROsubjectvar: LSDOMAINT_PROsubjecttype;
synvpefsvar: LSDOMAINT_synpatternEFFSETtype;
thetavpvar: LSDOMAINT_thetavptype;
modusvar: LSDOMAINT_modustype;
aktionsartsvar: LSDOMAINT_aktionsartEFFSETtype;
aspectvar: LSDOMAINT_aspecttype;
deixisvar: LSDOMAINT_deixistype;
retrovar: LSDOMAINT_retrotype;
finitenessvar: LSDOMAINT_finitenesstype;
infsortvar: LSDOMAINT_inftype;
superdeixisvar: LSDOMAINT_deixistype;
VRcomplvar: LSDOMAINT_VRcompltype;
conjkeyvar: LSDOMAINT_keytype;
adverbialvar: LSDOMAINT_adverbialtype;
temporalvar: LSDOMAINT_temporaltype;
conjclassvar: LSDOMAINT_timeadvclasstype;
conjdeixisvar: LSDOMAINT_deixistype;
conjaspectvar: LSDOMAINT_aspecttype;
conjretrovar: LSDOMAINT_retrotype;
coordpar : LSDOMAINT_coordtype;
corr1found : BOOLEAN;
expkey : LSDOMAINT_keytype;
itcommafound : BOOLEAN;
itcoordfound : BOOLEAN;
iterationfound : BOOLEAN;
iterationok : BOOLEAN;
cpvar : LSDOMAINT_coordpatternsettype;
PROCEDURE Scoordrule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

PROCEDURE reducepatterns(VAR cpvar: LSDOMAINT_coordpatternsettype);
BEGIN
IF senttypevar = mainclause THEN cpvar := cpvar * [Smdc,Smync,Smwhc, Simpc, 
Slaten ];
IF senttypevar = subordinateclause THEN cpvar := cpvar * [Ssdc,Ssync,Sswhc,
Simpc, Srelfinc, Somtec, Sotec, Sctec,Sprpc, Spapc,
Scond];
IF moodvar = declarative THEN cpvar := cpvar * [Smdc,Ssdc,
Somtec, Sotec, Sctec,Sprpc, Spapc ];
IF moodvar = yesnointerrogative THEN cpvar := cpvar * [Smync,Ssync];
IF moodvar = whinterrogative THEN cpvar := cpvar * [Smwhc,Sswhc];
IF moodvar = conditional THEN cpvar := cpvar * [Scond];
IF moodvar = latenmood THEN cpvar := cpvar * [Slaten];
IF moodvar = relative THEN cpvar := cpvar * [Srelfinc];
IF modusvar = prespart THEN cpvar := cpvar * [Sprpc];
IF modusvar = pastpart THEN cpvar := cpvar * [Spapc];
IF infsortvar IN [teinf,omteinf] THEN cpvar := cpvar * [Somtec,Sotec,Sctec];
IF infsortvar IN [omteinf] THEN cpvar := cpvar * [Somtec];
IF prosubjectvar = TRUE THEN cpvar := cpvar * [Somtec,Sotec, Sprpc,Spapc];
IF prosubjectvar = FALSE THEN cpvar := cpvar * [Smdc,Smync,Smwhc, Ssdc,Ssync,Sswhc,
Simpc, Srelfinc, Sctec,Sprpc, Spapc, Scond, Slaten ]
END;
 
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
reqvar := [pospol, negpol, omegapol];
envvar := [pospol, negpol, omegapol];
moodvar := omegamood;
senttypevar := omegaclause;
voicevar := omegavoice;
PROsubjectvar := false;
synvpefsvar := [];
thetavpvar := omegathetavp;
modusvar := omegamodus;
aktionsartsvar := []; 
aspectvar := omegaAspect;
deixisvar := omegadeixis; 
retrovar := false;
finitenessvar := omegafin;
infsortvar := omegainf; 
superdeixisvar := omegadeixis;
VRcomplvar := false;
conjkeyvar := 0;
adverbialvar := false;
temporalvar := false;
conjclassvar := omegaTimeAdvClass;
conjdeixisvar := omegadeixis;
conjaspectvar := omegaAspect;
conjretrovar := false;
coordpar := nocoord;
corr1found := false;
expkey := 0;
itcommafound := false;
itcoordfound := false;
iterationfound := false;
iterationok := true;
cpvar := []
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (correlative1 IN b^.ls^.COORDfield^.kinds) AND
(b^.ls^.COORDfield^.patterns * (LSAUXDOM_coordVfcps+ LSAUXDOM_coordV2cps)<>[])
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
corr1found := true;
expkey := b^.ls^.COORDfield^.correlative2key;
iterationok := b^.ls^.COORDfield^.iteration;
coordpar := corrcoord;
cpvar := b^.ls^.COORDfield^.patterns * 
(LSAUXDOM_coordVfcps+ LSAUXDOM_coordV2cps)
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.coord = nocoord) 
);globcond: BEGIN  BEGIN
SYNREL := argrel;
IF (NOT iterationfound) THEN BEGIN
moodvar := b^.ls^.SENTENCEfield^.mood ;
senttypevar := b^.ls^.SENTENCEfield^.senttype ;
PROsubjectvar := b^.ls^.SENTENCEfield^.PROsubject ;
modusvar := b^.ls^.SENTENCEfield^.modus ;
finitenessvar := b^.ls^.SENTENCEfield^.finiteness ;
infsortvar := b^.ls^.SENTENCEfield^.infsort ;
VRcomplvar := b^.ls^.SENTENCEfield^.VRcompl ;
adverbialvar := b^.ls^.SENTENCEfield^.adverbial ;
temporalvar := b^.ls^.SENTENCEfield^.temporal ;
superdeixisvar := b^.ls^.SENTENCEfield^.superdeixis 
END;
IF (NOT iterationfound) THEN
cpvar := (LSAUXDOM_coordVfcps+ LSAUXDOM_coordV2cps);
reducepatterns(cpvar);
iterationfound := true
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.COORDfield^.iteration 
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
IF (NOT corr1found) THEN BEGIN
expkey := b^.ls^.COORDfield^.key
END;
IF (NOT corr1found) THEN BEGIN
cpvar := (LSAUXDOM_coordVfcps+ LSAUXDOM_coordV2cps)
END;
itcoordfound := true;
reducepatterns(cpvar);
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PUNCfield^.key = auxkey('kommaPUNCkey')

);globcond: BEGIN  BEGIN
SYNREL := conjrel;
itcommafound := true
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.coord = nocoord)
);globcond: BEGIN  BEGIN
SYNREL := argrel;
IF iterationfound THEN BEGIN
END
ELSE BEGIN
moodvar := b^.ls^.SENTENCEfield^.mood ;
senttypevar := b^.ls^.SENTENCEfield^.senttype ;
PROsubjectvar := b^.ls^.SENTENCEfield^.PROsubject ;
modusvar := b^.ls^.SENTENCEfield^.modus ;
finitenessvar := b^.ls^.SENTENCEfield^.finiteness ;
infsortvar := b^.ls^.SENTENCEfield^.infsort ;
VRcomplvar := b^.ls^.SENTENCEfield^.VRcompl ;
adverbialvar := b^.ls^.SENTENCEfield^.adverbial ;
temporalvar := b^.ls^.SENTENCEfield^.temporal ;
superdeixisvar := b^.ls^.SENTENCEfield^.superdeixis 
END;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
iterationok := b^.ls^.COORDfield^.iteration;
IF (simple IN b^.ls^.COORDfield^.kinds) AND
(coordpar = nocoord) THEN
coordpar := simplecoord;
IF (NOT corr1found) THEN BEGIN
cpvar := b^.ls^.COORDfield^.patterns;
reducepatterns(cpvar)
END
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.coord = nocoord) 
);globcond: BEGIN  BEGIN
SYNREL := argrel
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( (iterationfound <= iterationok) AND
(cpvar * (LSAUXDOM_coordVfcps+ LSAUXDOM_coordV2cps)<>[])
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar;
top^.ls^.SENTENCEfield^.senttype := senttypevar ;
top^.ls^.SENTENCEfield^.voice := voicevar ;
top^.ls^.SENTENCEfield^.PROsubject := PROsubjectvar ;
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvar ;
top^.ls^.SENTENCEfield^.aktionsarts := aktionsartsvar ;
top^.ls^.SENTENCEfield^.aspect := aspectvar ;
top^.ls^.SENTENCEfield^.deixis := deixisvar ;
top^.ls^.SENTENCEfield^.retro := retrovar ;
top^.ls^.SENTENCEfield^.finiteness := finitenessvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvar ;
top^.ls^.SENTENCEfield^.superdeixis := superdeixisvar ;
top^.ls^.SENTENCEfield^.VRcompl := VRcomplvar ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar ;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar ;
top^.ls^.SENTENCEfield^.temporal := temporalvar ;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar ;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar ;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar ;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar; 
top^.ls^.SENTENCEfield^.coord := coordpar
END
END; END;
END;
END;{package}
PACKAGE SENTENCEsrulepack: [SENTENCEsrulerule];
(* erposrel,26,27 *) (*locadvrel,def, 28*)
(* effect stadv . [RADVP/26 | PREPP/27] . RADVP/29 .stadv *)
(*'t,22*) (*iocl,23*) (*docl,24*) (*reflrel,25*)
(*'t,22*) (*iocl,23*) (*docl,24*) (*reflrel,25*)
(*sentadv,31 *) (*sentadv,32 *) (*tempadv,33*) 
(*tempadv,34*) (*tempadv,35 *) 
(*postsubj,45*) (*preadv,io,36*) (*preadv,do,37 *)
(*locadv,38 *) (*locadv,39 *) (*locadv, indef,40 *) 
(* attrib q = true,e.g. opzettelijk, 41 *) (*postverb,14*) 
(*relsent,17*) (*extraposrel,16*) 
(* thanp,asp,18,19 *) (* resultrel,21 *)
(* relative clause and complement clause do not exclude each other; *)
(*47 errel *)
VAR
teller :  INTEGER;
aanobjrelfound : BOOLEAN;
accobjfound : BOOLEAN;
adhortfound : BOOLEAN;
adjpinshiftfound : BOOLEAN;
adjppredrelfound : BOOLEAN;
adjunctsvar : LSDOMAINT_adjunctSETtype;
adjvpefsvar : LSDOMAINT_synpatternEFFSETtype;
adverbialvar : BOOLEAN; 
advfound : BOOLEAN;
advldlfound : BOOLEAN;
advpinshiftfound : BOOLEAN;
advppredrelfound : BOOLEAN;
advprepfound : BOOLEAN;
alsofcomplfound : BOOLEAN;
classesvar : LSDOMAINT_classSETtype;
conjaspectvar : LSDOMAINT_aspecttype;
conjclassvar : LSDOMAINT_timeadvclasstype;
conjdeixisvar : LSDOMAINT_deixistype;
conjkeyvar : LSDOMAINT_keytype;
conjpatternsvar : LSDOMAINT_synpatternEFFSETtype;
conjrelfound : BOOLEAN;
conjretrovar : LSDOMAINT_retrotype;
conjsentinm1found : BOOLEAN;
coordfound : BOOLEAN;
countennpfound : BOOLEAN;
defradvrelfound : BOOLEAN;
deixisvar : LSDOMAINT_deixistype;
dirargNPfound : BOOLEAN;
dirargrelfound : BOOLEAN;
dirprepfound : BOOLEAN;
secondclrelfound : BOOLEAN;
envvar : LSDOMAINT_polarityEFFSETtype;
erinerposrelfound : BOOLEAN;
erinshiftfound : BOOLEAN;
erposrelfound : BOOLEAN;
erqrelfound : BOOLEAN;
expparticle : LSDOMAINT_keytype;
extracanbeadjsubjvar : BOOLEAN;
extraposmodus : LSDOMAINT_modustype;
extraposmoodvar : LSDOMAINT_moodtype;
extraposrelfound : BOOLEAN;
finalpuncfound : BOOLEAN;
finitenessvar : LSDOMAINT_finitenesstype;
gelievefound : BOOLEAN;
hetclrelfound : BOOLEAN;
hierdaarinRposfound: BOOLEAN;
indobjrelfound : BOOLEAN;
infsortvar : LSDOMAINT_inftype;
firstclrelfound : BOOLEAN;
leftdislocpuncfound: BOOLEAN;
leftdislocrelfound : BOOLEAN;
locargrelfound : BOOLEAN;
modusvar : LSDOMAINT_modustype;
moodvar : LSDOMAINT_moodtype;
negorposfound : BOOLEAN;
nodetnpfound : BOOLEAN;
nodetnpfound2 : BOOLEAN;
nodetNPidvps : LSDOMAINT_synpatternEFFSETtype;
nodetNPidvps2 : LSDOMAINT_synpatternEFFSETtype;
nppredrelfound : BOOLEAN;
objrelfound : BOOLEAN;
origsynvpefsvar : LSDOMAINT_synpatternEFFSETtype;
particlekey : LSDOMAINT_keytype;
postsubjnodetNPfound: BOOLEAN;
postsubjpersonvar : LSDOMAINT_persontype;
postsubjnumbervar : LSDOMAINT_numbertype;
postsubjrelfound : BOOLEAN;
postvporelfound : BOOLEAN;
postvrelfound : BOOLEAN;
ppinshiftfound : BOOLEAN;
preadvandclfound : BOOLEAN;
preadvok : BOOLEAN;
preadvok2 : BOOLEAN;
preadvrel2found : BOOLEAN;
preadvrelfound : BOOLEAN;
predadjfound : BOOLEAN;
prepkeyvar1 : LSDOMAINT_keytype;
prepkeyvar2 : LSDOMAINT_keytype;
prepobjrelfound : BOOLEAN;
prepobj1found : BOOLEAN;
prepobj2found : BOOLEAN;
preprepobjrelfound : BOOLEAN;
prepppredrelfound : BOOLEAN;
prepsynppsvar : LSDOMAINT_synpatternSETtype;
prosentfound : BOOLEAN;
radvgluefound : BOOLEAN;
reflafterNPfound : BOOLEAN;
reflexivityvar : LSDOMAINT_reflexivetype;
reflrelfound : BOOLEAN;
relprofound : BOOLEAN;
reqvar : LSDOMAINT_polarityEFFSETtype;
resultpuncrelfound : BOOLEAN;
retrovar : LSDOMAINT_retrotype;
Rinshiftfound : BOOLEAN;
senttypevar : LSDOMAINT_senttypetype;
shiftnodetNPfound : BOOLEAN;
shiftNPhead : LSDOMAINT_NPheadtype;
shiftnptemporal : BOOLEAN;
shiftnumbervar : LSDOMAINT_numbertype;
shiftpersonvar : LSDOMAINT_persontype;
shiftrelcases : LSDOMAINT_caseSETtype;
shiftrelfound : BOOLEAN;
shiftxpmoodvar : LSDOMAINT_xpmoodtype;
stadvfound : BOOLEAN;
strandedPPfound : BOOLEAN;
strandedrelfound : BOOLEAN;
subjnodetNPfound : BOOLEAN;
subjNPhead : LSDOMAINT_NPheadtype;
subjnumbervar : LSDOMAINT_numbertype;
subjpersonvar : LSDOMAINT_persontype;
subjrelfound : BOOLEAN;
synvpefsvar : LSDOMAINT_synpatternEFFsettype;
synvpefsvar2 : LSDOMAINT_synpatternEFFsettype;
temporalvar : BOOLEAN;
tensevar : LSDOMAINT_tensetype;
thetavpvar : LSDOMAINT_thetavptype;
unreducedvpsvar : LSDOMAINT_synpatternEFFSETtype;
v2adjuncts : LSDOMAINT_adjunctSETtype;
v2classesvar : LSDOMAINT_classSETtype;
v2found : BOOLEAN;
v2modusvar : LSDOMAINT_modustype;
v2subcvar : LSDOMAINT_verbsubctype;
v2synvpefsvar : LSDOMAINT_synpatternEFFSETtype;
v2thetavpvar : LSDOMAINT_thetavptype;
verbadjuncts : LSDOMAINT_adjunctSETtype;
verbpersonsvar : LSDOMAINT_personSETtype;
verbnumbervar : LSDOMAINT_numbertype;
verbpfound : BOOLEAN;
verbprepkeyvar1 : LSDOMAINT_keytype;
verbprepkeyvar2 : LSDOMAINT_keytype;
voicevar : LSDOMAINT_voicetype;
voorobjrelfound : BOOLEAN;
Vmatrixheadvar : BOOLEAN;
vpadjuncts : LSDOMAINT_adjunctSETtype;
vpclassesvar : LSDOMAINT_classSETtype;
vpcomplrelfound : BOOLEAN;
vpinfsortvar : LSDOMAINT_inftype;
vpmodusvar : LSDOMAINT_modustype;
vpsynvpefsvar : LSDOMAINT_synpatternEFFSETtype;
vpthetavpvar : LSDOMAINT_thetavptype;
vrfound : BOOLEAN;
anterelativeok : BOOLEAN;
PROCEDURE SENTENCEsrulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

FUNCTION IMPLIES(p,q : BOOLEAN):BOOLEAN;
BEGIN
IMPLIES :=
((NOT p) OR q);
END (*IMPLIES*);
FUNCTION onlysubjraisingfound(th: LSDOMAINT_thetavptype; vps: LSDOMAINT_synpatterneffSETtype):BOOLEAN;
BEGIN
onlysubjraisingfound := (th IN [vp010,vp012]) AND (vps <= LSAUXDOM_closedsentvps);
END;
FUNCTION nosubjraisingfound(th: LSDOMAINT_thetavptype; vps: LSDOMAINT_synpatterneffSETtype):BOOLEAN;
BEGIN
nosubjraisingfound := (th IN [vp010,vp012]) <= (vps * LSAUXDOM_closedsentvps=[]);
END;
FUNCTION nodetNP(t:LSSTREE_pStree):BOOLEAN;
(* 
pre: t=NP<NPrec1>[mu1] & mu1<>[]
post: nodetNP(t) <=>
(NPrec1.number = singular) AND
(NPrec1.actcomas = [count]) AND
(NPrec1.NPhead = otherNP) AND
(EXIST(mu1, [head/CN<>[mu]]) AND
(NOT EXIST(mu1, [detrel/..])
*)
VAR result, detfound, cnfound : BOOLEAN;
sonlist :LSSTREE_pRelnode;
BEGIN
result := ((t^.ls^.NPfield^.number=singular) AND
(t^.ls^.NPfield^.actcomas=[count]) AND
(t^.ls^.NPfield^.NPhead=otherNP)
);
IF result THEN BEGIN
sonlist:= t^.sons;
detfound := false;
cnfound := false;
WHILE (sonlist<>NIL) AND ((NOT detfound) OR (NOT cnfound)) DO BEGIN
IF (NOT detfound) THEN detfound := (sonlist^.relation=detrel);
IF (NOT cnfound) THEN cnfound := (sonlist^.relation=head) AND
(sonlist^.node^.ls^.cat=CN);
sonlist:=sonlist^.brother
END;
END;
nodetNP := result AND cnfound AND (NOT detfound);
END (*nodetNPok*);
FUNCTION specialNP(nph: LSDOMAINT_NPheadtype):BOOLEAN;
BEGIN
specialNP :=
(nph IN [hetNP, ditNP, datNP]);
END (*specialNP*);
FUNCTION activeauxok:BOOLEAN;
BEGIN
activeauxok:=
( VERBPfound AND V2found AND
(voicevar =active) AND
(V2subcvar <> wordenaux )
); 
(*
If VERBPfound and V2found, and voicevar = active, then V2subcvar is not allowed
to be the auxiliary worden.
*)
END (*activeauxok*);
FUNCTION advsok:BOOLEAN;
BEGIN
advsok := (preadvok OR 
preadvrelfound OR
erposrelfound OR
defRadvrelfound OR
erqrelfound OR
hetclrelfound OR
firstclrelfound OR
reflrelfound OR
stadvfound OR
advfound OR
negorposfound OR
conjsentinm1found);
END (*advsok*);
PROCEDURE computeaktarts( classes: LSDOMAINT_classSETtype; 
VAR aktarts: LSDOMAINT_aktionsartEFFSETtype
);
(*
The procedure yields a set, aktarts (by means of a VAR variable)
representing the aktionsarts that are compatible with the verbclass
*)
BEGIN
aktarts := [];
IF (stativeclass IN classes)
THEN aktarts := aktarts + [stative];
IF (movementclass IN classes)
THEN aktarts := aktarts + [stative, activity, accomplishment];
IF (durativeclass IN classes)
THEN aktarts := aktarts + [stative, activity, accomplishment];
IF (momentaryclass IN classes)
THEN aktarts := aktarts + [stative, achievement];
IF (iterativeclass IN classes)
THEN aktarts := aktarts + [stative, activity];
END (*computeaktarts*);
FUNCTION allpreadvsok:BOOLEAN;
BEGIN
allpreadvsok :=
( (NOT preadvrelfound) OR preadvok
) AND
( (NOT preadvrel2found) OR preadvok2
) 
END (*allpreadvsok*);
FUNCTION anterelativeconds:BOOLEAN;
BEGIN
anterelativeconds:=
(
(NOT subjrelfound) AND (NOT postsubjrelfound) AND 
( IMPLIES( (modusvar =pastpart) , 
(((voicevar = passive) OR 
(thetavpvar IN [vp010, vp012])
) AND
(NOT objrelfound) AND
(NOT preadvrel2found) AND
(NOT hetclrelfound) AND
(NOT secondclrelfound) AND
(IMPLIES( (preadvrelfound OR firstclrelfound),
(synvpefsvar * LSAUXDOM_indobjvps <> [])
)
)
)
)
)
);
END (*anterelativeconds*);
FUNCTION extracanbeadjsubj:BOOLEAN;
BEGIN
extracanbeadjsubj := (adjppredrelfound AND
IMPLIES(subjrelfound, (subjNphead=hetNP)) AND
IMPLIES((shiftrelfound and (NOT subjrelfound)
),
((shiftNPhead=hetNP) OR (shiftrelcases=[]))
)
)
END (*extracanbeadjsubj*);
(*
the extraposrel can be interpreted as a subject to an adjective if
a predicative adjp has been found, and
the subject if present = het , and
the shiftrel if present if no subject is present = het, or is no NP
-this function is called in checkpredadj
-The function allows absence of any real subject,and also, implicitly,
the presence of er in erposrel, or in shiftrel.
*)
PROCEDURE checkpredadj(VAR aps: LSDOMAINT_synpatternEFFSETTYPE);
BEGIN
IF (NOT extracanbeadjsubjvar) THEN BEGIN
IF extraposrelfound 
THEN aps := aps * LSAUXDOM_extraposvps;
IF (extraposmoodvar = declarative) 
THEN aps := aps * LSAUXDOM_declcomplvps;
IF (extraposmoodvar IN [whinterrogative, yesnointerrogative]) 
THEN aps := aps * LSAUXDOM_qcomplvps;
IF (extraposmodus = infinitive) AND 
(extraposmoodvar = declarative) 
THEN aps := aps * LSAUXDOM_teinfcomplvps;
IF (extraposmodus = indicative) AND
(extraposmoodvar = declarative) 
THEN aps := aps * LSAUXDOM_findeclcomplvps;
END
END (*checkpredadj*);
FUNCTION conjandprepok:BOOLEAN;
BEGIN
conjandprepok :=
(
IMPLIES(advprepfound, ( (conjkeyvar = 0) OR
(conjkeyvar = auxkey('datconjkey')
)
)
)
);
(*
This function checks whether the found prep and the conjunction found, if any
are compatible
*)
END (*conjandprepok*);
FUNCTION countenok:BOOLEAN;
BEGIN
countenok := IMPLIES(countennpfound, (erqrelfound OR erinerposrelfound));
(*
*)
END (*countenok*);
(*POSTVPOOK moved to LSSURFQUO:
FUNCTION postvpook:BOOLEAN;
BEGIN
postvpook := (adjppredrelfound OR 
advppredrelfound OR
nppredrelfound OR
prepppredrelfound OR
(particlekey <> 0) OR 
strandedrelfound OR 
prepobjrelfound OR
locargrelfound OR
dirargrelfound
);
END; postvpook*)
(*POSTVOK moved to LSSURFQUO:
FUNCTION postvok(objrelfound,indobjrelfound:BOOLEAN):BOOLEAN;
BEGIN
postvok := (postvpook OR
objrelfound OR
indobjrelfound 
);
END; postvok*)
(*EXTRAPPOK moved to LSSURFQUO
FUNCTION extrappok:BOOLEAN;
BEGIN
extrappok := (verbpfound OR postvok(objrelfound,indobjrelfound) OR postvporelfound OR postvrelfound );
END; extrappok*)
FUNCTION existconf(vps: LSDOMAINT_synpatternEFFSETtype):BOOLEAN;
BEGIN
existconf := ((rinshiftfound or erposrelfound) AND (synzijn IN vps));
END (*existconf*);
FUNCTION prepandfinok:BOOLEAN;
BEGIN
prepandfinok :=
(NOT advprepfound) OR
(IMPLIES((synTHATSENT IN prepsynppsvar),
(modusvar = indicative)
) 
) AND
(IMPLIES((synOPENTESENT IN prepsynppsvar),
(modusvar = infinitive)
) 
);
(*
This function checks whether the found prep and the modus of the
sentence are compatible
*)
END (*conjandprepok*);
FUNCTION argspresent:BOOLEAN;
VAR
shiftused, preadv1used, fclused, supershiftused, postvpoused, erposused,
prepobjused, defRadvused, hetclused,
shiftallowed, supershiftallowed, hiddenshiftallowed, hiddenshiftused,
subjok, objok, indobjok, dirargok, locargok, nppredok, adjppredok,
advppredok, prepppredok, prepobjok, aanobjok, voorobjok, strandedok,
synzijnok, VRok, extraok, prosentok, vpcomplok,
npinshiftfound, soprosentok,
result
:BOOLEAN;
BEGIN
subjok := true; 
objok := true; 
indobjok := true;
dirargok := true; 
locargok := true; 
nppredok := true; 
adjppredok := true;
advppredok := true; 
prepppredok := true; 
prepobjok := true; 
aanobjok := true; 
voorobjok := true; 
strandedok := true;
synzijnok := true; 
VRok := true;
extraok := true; 
prosentok := true;
vpcomplok := true;
npinshiftfound := true; 
soprosentok := true;
result := true;
shiftused := false;
preadv1used := false;
fclused := false;
hetclused := false;
erposused := false;
defRadvused := false;
prepobjused := false;
postvpoused := false;
strandedok := false;
supershiftused := false;
hiddenshiftused:= false;
npinshiftfound := (shiftrelfound AND (shiftrelcases <> [])) OR
relprofound; 
shiftallowed := (moodvar = whinterrogative) OR
((moodvar = relative) AND
(finitenessvar = finite)
) OR
((moodvar = declarative) AND
(senttypevar = mainclause)
); 
supershiftallowed := (moodvar = declarative) AND
(senttypevar = subordinateclause) AND
(adverbialvar = false) AND
((finitenessvar = finite) OR
(infsortvar = teinf)
);
hiddenshiftallowed := (moodvar = relative) AND
(finitenessvar = infinite);
(*BEGIN indobj*)
IF (synvpefsvar * LSAUXDOM_indobjvps <> []) THEN BEGIN
indobjok := indobjrelfound;
IF (NOT indobjok) THEN BEGIN
IF preadvrel2found AND (NOT preadv1used) THEN BEGIN 
indobjok := true; preadv1used := true; 
END;
END (*NOT indobjok*);
IF (NOT indobjok) THEN BEGIN
IF (secondclrelfound OR hetclrelfound OR extraposrelfound) AND 
(NOT fclused) AND firstclrelfound THEN BEGIN 
indobjok := true; fclused := true; 
END
END;
IF (NOT indobjok) THEN BEGIN
IF (hetclrelfound OR extraposrelfound) AND (NOT preadv1used) AND 
preadvrelfound THEN BEGIN
indobjok := true; preadv1used := true
END
END;
IF (NOT indobjok) THEN BEGIN
IF (NOT preadv1used) AND preadvrelfound THEN BEGIN
indobjok := true; preadv1used := true
END
END;
IF (NOT indobjok) THEN BEGIN
IF (NOT fclused) AND firstclrelfound THEN BEGIN
IF (synvpefsvar - LSAUXDOM_emptyindobjvps = []) THEN BEGIN 
indobjok := true; fclused := true
END
END;
IF (synvpefsvar - LSAUXDOM_emptyindobjvps <> []) THEN BEGIN 
indobjok := true;
END;
END;
IF (NOT indobjok) AND shiftallowed THEN BEGIN
IF (synvpefsvar - LSAUXDOM_emptyindobjvps = []) THEN BEGIN 
IF npinshiftfound AND (NOT shiftused) THEN BEGIN
indobjok := true; shiftused := true;
END (*shiftrelfound*)
END;
IF (synvpefsvar - LSAUXDOM_emptyindobjvps <> []) THEN BEGIN 
indobjok := true;
END;
END;
IF (NOT indobjok) AND supershiftallowed THEN BEGIN
IF (synvpefsvar - LSAUXDOM_emptyindobjvps = []) THEN BEGIN 
IF npinshiftfound AND (NOT shiftused) THEN BEGIN
indobjok := true; shiftused := true;
END (*npinshiftfound*)
END;
IF (synvpefsvar - LSAUXDOM_emptyindobjvps <> []) THEN BEGIN 
indobjok := true;
END;
END (*supershiftallowed*);
IF (NOT indobjok) AND hiddenshiftallowed THEN BEGIN
IF (synvpefsvar - LSAUXDOM_emptyindobjvps = []) THEN BEGIN 
IF (NOT hiddenshiftused) THEN BEGIN
indobjok := true; hiddenshiftused := true;
END;
END;
IF (synvpefsvar - LSAUXDOM_emptyindobjvps <> []) THEN BEGIN 
indobjok := true;
END;
END;
IF (NOT indobjok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_indobjvps;
indobjok := true;
END
END (** LSAUXDOM_indobjvps*)
ELSE indobjok := true;
result := result AND indobjok;
(*BEGIN subj*)
IF result THEN BEGIN
IF (finitenessvar = finite) AND (moodvar <> imperativemood) THEN BEGIN
subjok := subjrelfound OR erposrelfound OR extraposrelfound OR
postsubjrelfound OR 
(leftdislocrelfound AND (NOT advldlfound)) OR
((thetavpvar = vp012) AND (synvpefsvar * LSAUXDOM_indobjvps <> [])) OR 
((voicevar = passive) AND (synvpefsvar * LSAUXDOM_indobjvps <> [])) OR
((voicevar = passive) AND shiftallowed and ppinshiftfound);
IF ((NOT subjok) AND shiftallowed) THEN BEGIN
IF ((npinshiftfound OR ppinshiftfound OR Rinshiftfound) AND 
(NOT shiftused)) THEN BEGIN
subjok := true; shiftused := true;
END;
END;
IF ((NOT subjok) AND supershiftallowed AND (NOT supershiftused)) THEN BEGIN
subjok := true; supershiftused := true;
END (*not subjok and supershiftallowed*);
END (*finitenessvar = finite*)
ELSE subjok := true;
result := result AND subjok;
END (*SUBJ*);
(*BEGIN obj*)
IF result THEN BEGIN
IF ((synvpefsvar * (LSAUXDOM_objvps-[synzijn]) <> []) AND 
(voicevar = active) AND
(thetavpvar IN [vp120,vp123])) THEN BEGIN
objok := objrelfound OR secondclrelfound OR preadvrel2found;
IF (NOT objok) THEN BEGIN
IF (hetclrelfound AND (NOT hetclused)) THEN BEGIN
hetclused := true; objok := true
END;
END;
IF (NOT objok) THEN BEGIN
IF (preadvrelfound AND (NOT preadv1used)) THEN BEGIN
preadv1used := true; objok := true
END;
END;
IF (NOT objok) THEN BEGIN
IF (firstclrelfound AND (NOT fclused)) THEN BEGIN
fclused := true; objok := true
END;
END;
IF ((NOT objok) AND shiftallowed )THEN BEGIN
IF (npinshiftfound AND (NOT shiftused)) THEN BEGIN
shiftused := true; objok := true
END;
END;
IF ((NOT objok) AND supershiftallowed )THEN BEGIN
IF (NOT supershiftused) THEN BEGIN
supershiftused := true; objok := true
END;
END;
IF (NOT objok) AND hiddenshiftallowed THEN BEGIN
IF (NOT hiddenshiftused) THEN BEGIN
objok := true; hiddenshiftused := true;
END; 
END;
IF (NOT objok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_objvps;
objok := true;
END;
END (*objvps*)
ELSE objok := true;
result := result AND objok;
END (*obj*);
(*BEGIN dirarg*)
IF result THEN BEGIN
IF (synvpefsvar * LSAUXDOM_dirargvps <> []) THEN BEGIN
dirargok := dirargrelfound;
IF ((NOT dirargok) AND shiftallowed) THEN BEGIN
IF ((ppinshiftfound OR advpinshiftfound) AND (NOT shiftused)) THEN BEGIN
shiftused := true; dirargok :=true;
END;
END;
IF ((NOT dirargok) AND supershiftallowed) THEN BEGIN
IF (NOT supershiftused) THEN BEGIN
supershiftused := true; dirargok :=true;
END;
END;
IF (NOT dirargok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_dirargvps;
dirargok := true;
END;
END (*dirargvps*)
ELSE dirargok := true;
result := result AND dirargok;
END (*dirarg*);
(*BEGIN locarg*)
IF result THEN BEGIN
IF (synvpefsvar * LSAUXDOM_locargvps <> []) THEN BEGIN
locargok := locargrelfound;
IF (NOT locargok) THEN BEGIN
IF (NOT erposused) AND erposrelfound THEN BEGIN
locargok := true; erposused := true
END
END;
IF (NOT locargok) THEN BEGIN
IF (NOT defRadvused) AND defRadvrelfound THEN BEGIN
locargok := true; defRadvused := true
END
END;
IF ((NOT locargok) AND shiftallowed) THEN BEGIN
IF ((ppinshiftfound OR advpinshiftfound) AND (NOT shiftused)) THEN BEGIN
shiftused := true; locargok :=true;
END;
END;
IF ((NOT locargok) AND supershiftallowed) THEN BEGIN
IF (NOT supershiftused) THEN BEGIN
supershiftused := true; locargok :=true;
END;
END;
IF (NOT locargok) AND hiddenshiftallowed THEN BEGIN
IF (NOT hiddenshiftused) THEN BEGIN
locargok := true; hiddenshiftused := true;
END; 
END;
IF (NOT locargok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_locargvps;
locargok := true;
END;
END (*locargvps*)
ELSE locargok := true;
result := result AND locargok;
END (*locarg*);
(*BEGIN prepobj*)
IF result THEN BEGIN
IF (synvpefsvar * LSAUXDOM_prepobjvps <> []) THEN BEGIN
prepobjok := prepobjrelfound;
IF (NOT prepobjok) THEN BEGIN
IF (postvporelfound AND (NOT postvpoused)) THEN BEGIN
postvpoused := true; prepobjok :=true;
END;
END;
IF ((NOT prepobjok) AND shiftallowed) THEN BEGIN
IF (ppinshiftfound AND (NOT shiftused)) THEN BEGIN
shiftused := true; prepobjok :=true;
END;
END;
IF ((NOT prepobjok) AND supershiftallowed) THEN BEGIN
IF (NOT supershiftused) THEN BEGIN
supershiftused := true; prepobjok :=true;
END;
END;
IF (NOT prepobjok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_prepobjvps;
prepobjok := true;
END;
END (*prepobjvps*)
ELSE prepobjok := true;
result := result AND prepobjok;
END (*prepobj*);
(*BEGIN aanobj*)
IF result THEN BEGIN
IF (synvpefsvar * LSAUXDOM_aanobjvps <> []) THEN BEGIN
aanobjok := aanobjrelfound;
IF (NOT aanobjok) THEN BEGIN
IF (prepobjrelfound AND (NOT prepobjused)) THEN BEGIN
prepobjused := true; aanobjok :=true;
END;
END;
IF (NOT aanobjok) THEN BEGIN
IF (postvporelfound AND (NOT postvpoused)) THEN BEGIN
postvpoused := true; aanobjok :=true;
END;
END;
IF ((NOT aanobjok) AND shiftallowed) THEN BEGIN
IF (ppinshiftfound AND (NOT shiftused)) THEN BEGIN
shiftused := true; aanobjok :=true;
END;
END;
IF ((NOT aanobjok) AND supershiftallowed) THEN BEGIN
IF (NOT supershiftused) THEN BEGIN
supershiftused := true; aanobjok :=true;
END;
END;
IF (NOT aanobjok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_aanobjvps;
aanobjok := true;
END;
END (*aanobjvps*)
ELSE aanobjok := true;
result := result AND aanobjok;
END (*aanobj*);
(*BEGIN voorobj*)
IF result THEN BEGIN
IF (synvpefsvar * LSAUXDOM_voorobjvps <> []) THEN BEGIN
voorobjok := voorobjrelfound;
IF (NOT voorobjok) THEN BEGIN
IF (prepobjrelfound AND (NOT prepobjused)) THEN BEGIN
prepobjused := true; voorobjok :=true;
END;
END;
IF (NOT voorobjok) THEN BEGIN
IF (postvporelfound AND (NOT postvpoused)) THEN BEGIN
postvpoused := true; voorobjok :=true;
END;
END;
IF ((NOT voorobjok) AND shiftallowed) THEN BEGIN
IF (ppinshiftfound AND (NOT shiftused)) THEN BEGIN
shiftused := true; voorobjok :=true;
END;
END;
IF ((NOT voorobjok) AND supershiftallowed) THEN BEGIN
IF (NOT supershiftused) THEN BEGIN
supershiftused := true; voorobjok :=true;
END;
END;
IF (NOT voorobjok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_voorobjvps;
voorobjok := true;
END;
END (*voorobjvps*)
ELSE voorobjok := true;
result := result AND voorobjok;
END (*voorobj*);
(*BEGIN adjppred*)
IF result THEN BEGIN
IF (synvpefsvar * (LSAUXDOM_adjppredvps-[synzijn]) <> []) THEN BEGIN
adjppredok := adjppredrelfound;
IF ((NOT adjppredok) AND shiftallowed) THEN BEGIN
IF (adjpinshiftfound AND (NOT shiftused)) THEN BEGIN
shiftused := true; adjppredok :=true;
END;
END;
IF ((NOT adjppredok) AND supershiftallowed) THEN BEGIN
IF (NOT supershiftused) THEN BEGIN
supershiftused := true; adjppredok :=true;
END;
END;
IF (NOT adjppredok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_adjppredvps;
adjppredok := true;
END;
END (*adjppredvps*)
ELSE adjppredok := true;
result := result AND adjppredok;
END (*adjppred*);
(*BEGIN nppred*)
IF result THEN BEGIN
IF (synvpefsvar * (LSAUXDOM_nppredvps-[synzijn]) <> []) THEN BEGIN
nppredok := nppredrelfound;
IF ((NOT nppredok) AND shiftallowed) THEN BEGIN
IF (npinshiftfound AND (NOT shiftused)) THEN BEGIN
shiftused := true; nppredok :=true;
END;
END;
IF ((NOT nppredok) AND supershiftallowed) THEN BEGIN
IF (NOT supershiftused) THEN BEGIN
supershiftused := true; nppredok :=true;
END;
END;
IF (NOT nppredok) AND hiddenshiftallowed THEN BEGIN
IF (NOT hiddenshiftused) THEN BEGIN
nppredok := true; hiddenshiftused := true;
END; 
END;
IF (NOT nppredok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_nppredvps;
nppredok := true;
END;
END (*nppredvps*)
ELSE nppredok := true;
result := result AND nppredok;
END (*nppred*);
(*BEGIN prepppred*)
IF result THEN BEGIN
IF (synvpefsvar * (LSAUXDOM_prepppredvps-[synzijn]) <> []) THEN BEGIN
prepppredok := prepppredrelfound;
IF ((NOT prepppredok) AND shiftallowed) THEN BEGIN
IF (ppinshiftfound AND (NOT shiftused)) THEN BEGIN
shiftused := true; prepppredok :=true;
END;
END;
IF ((NOT prepppredok) AND supershiftallowed) THEN BEGIN
IF (NOT supershiftused) THEN BEGIN
supershiftused := true; prepppredok :=true;
END;
END;
IF (NOT prepppredok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_prepppredvps;
prepppredok := true;
END;
END (*prepppredvps*)
ELSE prepppredok := true;
result := result AND prepppredok;
END (*prepppred*);
(*BEGIN advppred*)
IF result THEN BEGIN
IF (synvpefsvar * (LSAUXDOM_advppredvps-[synzijn]) <> []) THEN BEGIN
advppredok := advppredrelfound ;
IF ((NOT advppredok) AND shiftallowed) THEN BEGIN
IF (advpinshiftfound AND (NOT shiftused)) THEN BEGIN
shiftused := true; advppredok :=true;
END;
END;
IF ((NOT advppredok) AND supershiftallowed) THEN BEGIN
IF (NOT supershiftused) THEN BEGIN
supershiftused := true; advppredok :=true;
END;
END;
IF (NOT advppredok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_advppredvps;
advppredok := true;
END;
END (*advppredvps*)
ELSE advppredok := true;
result := result AND advppredok;
END (*advppred*);
(*BEGIN vpcomplok*)
IF result THEN BEGIN
IF (synvpefsvar * LSAUXDOM_vpcomplvps <> []) THEN BEGIN
vpcomplok := vpcomplrelfound;
IF (NOT vpcomplok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_vpcomplvps;
vpcomplok := true;
END;
END (*vpcomplvps*)
ELSE vpcomplok := true;
result := result AND vpcomplok;
END (*vpcompl*);
(*BEGIN soprosentok*)
IF result THEN BEGIN
IF (synvpefsvar * LSAUXDOM_soprosentvps <> []) THEN BEGIN
soprosentok := prosentfound OR verbpfound;
IF (NOT soprosentok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_soprosentvps;
soprosentok := true;
END;
END (*soprosentvps*)
ELSE soprosentok := true;
result := result AND soprosentok;
END (*soprosentok*);
(*BEGIN stranded*)
IF result THEN BEGIN
IF strandedPPfound THEN BEGIN
IF (NOT strandedok) THEN BEGIN
IF (NOT erposused) AND (erposrelfound) THEN BEGIN
erposused := true; strandedok := true;
END
END;
IF ((NOT strandedok) AND shiftallowed) THEN BEGIN
IF (shiftrelfound AND (NOT shiftused)) THEN BEGIN
shiftused := true; strandedok :=true;
END;
END;
IF ((NOT strandedok) AND supershiftallowed) THEN BEGIN
IF (NOT supershiftused) THEN BEGIN
supershiftused := true; strandedok :=true;
END;
END;
IF ((NOT strandedok) AND hiddenshiftallowed) THEN BEGIN
IF (NOT hiddenshiftused) THEN BEGIN
hiddenshiftused := true; strandedok :=true;
END;
END;
IF (NOT strandedok) THEN BEGIN
synvpefsvar := synvpefsvar - (LSAUXDOM_locargvps +
LSAUXDOM_dirargvps +
LSAUXDOM_aanobjvps +
LSAUXDOM_voorobjvps +
LSAUXDOM_prepobjvps +
LSAUXDOM_prepppredvps
);
strandedok := true;
END;
END
ELSE strandedok := true;
result := result AND strandedok;
END (*stranded*);
(*BEGIN synzijn*)
IF result THEN BEGIN
IF (synvpefsvar * [synzijn] <> []) THEN BEGIN
synzijnok := adjppredrelfound OR nppredrelfound OR
advppredrelfound OR prepppredrelfound OR
objrelfound ;
IF (NOT synzijnok) THEN BEGIN
IF (NOT fclused) AND firstclrelfound THEN BEGIN
fclused := true; synzijnok := true;
END
END;
IF (NOT synzijnok) THEN BEGIN
IF (NOT hetclused) AND hetclrelfound THEN BEGIN
hetclused := true; synzijnok := true;
END
END;
IF (NOT synzijnok) AND shiftallowed THEN BEGIN
IF (NOT shiftused) AND shiftrelfound THEN BEGIN
shiftused := true; synzijnok := true;
END
END;
IF (NOT synzijnok) AND supershiftallowed THEN BEGIN
IF (NOT supershiftused) THEN BEGIN
supershiftused := true; synzijnok := true;
END
END;
IF (NOT synzijnok) AND hiddenshiftallowed THEN BEGIN
IF (NOT hiddenshiftused) THEN BEGIN
hiddenshiftused := true; synzijnok := true;
END
END;
IF (NOT synzijnok) THEN BEGIN
synvpefsvar := synvpefsvar - [synzijn]; synzijnok := true;
END
END
ELSE synzijnok := true;
result := result AND synzijnok;
END (*synzijn*);
(*BEGIN extrapos*)
IF result THEN BEGIN
IF (synvpefsvar * (LSAUXDOM_extraposvps-LSAUXDOM_VRvps) <> []) THEN BEGIN
extraok := extraposrelfound;
IF (NOT extraok) THEN BEGIN
synvpefsvar := synvpefsvar - (LSAUXDOM_extraposvps-LSAUXDOM_VRvps); 
extraok:= true;
END
END
ELSE extraok := true;
result := result AND extraok;
END (*extrapos*);
(*BEGIN VR*)
IF result THEN BEGIN
IF (synvpefsvar * LSAUXDOM_oblVRvps <> []) THEN BEGIN
VRok := VERBPfound;
IF (NOT VRok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_oblVRvps; VRok:= true;
END
END
ELSE VRok := true;
result := result AND VRok;
END (*VR*);
(*BEGIN PROSENTvps*)
IF result THEN BEGIN
IF synvpefsvar * LSAUXDOM_prosentvps <> [] THEN BEGIN
IF hetclrelfound AND (NOT hetclused) THEN BEGIN
prosentok := true; hetclused := true;
END;
IF (NOT prosentok) THEN BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_prosentvps;
prosentok := true;
END
END
ELSE prosentok := true;
result := result AND prosentok;
END (*synPROSENT*);
argspresent := result AND (synvpefsvar <> []);
END (*argspresent*);
FUNCTION conjandverbok:BOOLEAN;
BEGIN
conjandverbok:=
( 
(NOT 
(conjrelfound AND (NOT V2found)
)
) OR
(
( (conjpatternsvar * [synTHATSENT, synQSENT] <> []) AND
(finitenessvar = finite) 
) OR
( (conjpatternsvar * [synOPENTESENT] <> []) AND
(finitenessvar = infinite) AND
(infsortvar = teinf)
)
) 
);
(*Checks whether the found CONJ, if any, and finiteness
are compatible*) 
END (*conjandverbok*);
PROCEDURE detargstrANDclasses( 
VAR thetavpvar : LSDOMAINT_thetavptype;
VAR vpsynvpefsvar : LSDOMAINT_synpatternEFFSETtype;
VAR classesvar : LSDOMAINT_classSETtype;
VAR verbadjuncts : LSDOMAINT_adjunctSETtype;
VAR adjunctsvar : LSDOMAINT_adjunctSETtype
);
BEGIN
IF V2found
THEN BEGIN
IF verbpfound
THEN BEGIN
IF ((V2subcvar IN [hebbenaux, zijnaux]) AND
(VPmodusvar IN [pastpart, infinitive]) AND
(voicevar = active) 
) 
(* is .. beginnen te werken;aanhetV 
heeft... moeten werken ;*)
OR
( (V2subcvar IN [zijnaux, wordenaux]) AND
(VPmodusvar = pastpart) AND
(voicevar = passive)
) OR
( (V2subcvar = latenverb) AND
(VPmodusvar =infinitive) AND
adhortfound
)
THEN BEGIN 
IF Vmatrixheadvar
THEN BEGIN
thetavpvar := VPthetavpvar;
synvpefsvar := VPsynvpefsvar;
classesvar := VPclassesvar;
verbadjuncts := VPadjuncts;
adjunctsvar := VPadjuncts;
END (*Vmatrixheadvar*)
END (*V2subcvar IN THEN*)
ELSE BEGIN
IF (NOT Vmatrixheadvar)
THEN BEGIN
thetavpvar := V2thetavpvar;
synvpefsvar := V2synvpefsvar;
classesvar := V2classesvar;
verbadjuncts := VPadjuncts;
adjunctsvar := VPadjuncts;
END (*NOT Vmatrixheadvar*)
END (*else V2subcvar ELSE*)
END (* IF verbpfound THEN*)
ELSE BEGIN
thetavpvar := V2thetavpvar;
synvpefsvar := V2synvpefsvar;
classesvar := V2classesvar;
verbadjuncts := V2adjuncts;
END (*IF verbpfound ELSE*)
END (*V2found THEN*)
ELSE BEGIN
IF (verbpfound AND Vmatrixheadvar)
THEN BEGIN
thetavpvar := VPthetavpvar;
synvpefsvar := VPsynvpefsvar;
classesvar := VPclassesvar;
verbadjuncts := VPadjuncts;
adjunctsvar := VPadjuncts;
END (*Vmatrixheadvar*)
ELSE IF ((NOT verbpfound) AND adjppredrelfound) 
THEN BEGIN
thetavpvar := thetavpaux;
synvpefsvar := [synzijn];
classesvar := [stativeclass];
verbadjuncts := [];
adjunctsvar := [];
END
END (*V2found ELSE*); 
END (*detargstrANDclasses*);
FUNCTION yesnoconds:BOOLEAN;
BEGIN
yesnoconds :=
( (NOT leftdislocrelfound) AND
(
subjrelfound OR
postsubjrelfound OR
erposrelfound OR
indobjrelfound
)
);
END (*yesnoconds*);
PROCEDURE determinemood16(VAR moodvar : LSDOMAINT_moodtype; 
VAR senttypevar: LSDOMAINT_senttypetype
);
BEGIN
IF (NOT shiftrelfound) AND (NOT adhortfound)
THEN BEGIN
IF (NOT conjrelfound)
THEN BEGIN
IF ((modusvar = infinitive) AND
( NOT subjrelfound )
)
THEN BEGIN
moodvar := declarative; (*1*)
senttypevar := subordinateclause;
END;
IF (modusvar IN [omegamodus, prespart, pastpart]) AND
(anterelativeok) AND
anterelativeconds 
THEN BEGIN
moodvar := anterelative; (*2*)
senttypevar := subordinateclause;
END
END (*IF (NOT conjrelfound THEN)*)
ELSE BEGIN
IF (NOT V2found)
THEN BEGIN
IF (synTHATSENT IN conjpatternsvar)
THEN BEGIN
moodvar := declarative; (*4*)
senttypevar := subordinateclause; 
END
ELSE BEGIN
IF ( synQsent in conjpatternsvar )
THEN BEGIN
moodvar := yesnointerrogative; (*3*)
senttypevar := subordinateclause;
END 
ELSE BEGIN
IF (conjkeyvar = auxkey('omCONJkey')
 )
THEN BEGIN
moodvar := declarative; (*omteinf*)
senttypevar := subordinateclause; 
infsortvar := omteinf;
END;
IF gelievefound AND
(modusvar = infinitive) AND
(infsortvar = teinf) AND
(NOT subjrelfound) AND
(NOT postsubjrelfound) AND
(NOT leftdislocrelfound) AND
(NOT shiftrelfound)
THEN BEGIN
moodvar := imperativemood; (*gelieve dit te doen*)
senttypevar := mainclause; 
END
END 
END
END (*IF (not v2found)*)
ELSE BEGIN
IF ( 
(modusvar = imperative) AND
(NOT postsubjrelfound) AND
((NOT subjrelfound) OR 
((subjpersonvar IN [2,4]) AND
(subjnumbervar = singular)
)
)
)
THEN BEGIN
moodvar := imperativemood; (*5*)
senttypevar := mainclause;
END;
IF (modusvar = indicative) AND
yesnoconds
THEN BEGIN
moodvar := yesnointerrogative ; (*6*)
senttypevar := mainclause;
END
END (*IF NOT v2found ELSE*)
END (*IF (NOT conjrelfound ELSE)*)
END (*IF (NOT shiftrelfound) THEN*) 
END (*determinemood16*);
PROCEDURE determinemood7(VAR moodvar : LSDOMAINT_moodtype; 
VAR senttypevar: LSDOMAINT_senttypetype
);
BEGIN
IF (NOT shiftrelfound) AND
(conjrelfound)
THEN BEGIN
IF (V2found) AND (subjrelfound) AND adhortfound
THEN IF (V2subcvar = latenverb) AND
( subjpersonvar = 1) AND
(subjnumbervar = plural)
THEN BEGIN
moodvar := latenmood; (*7*)
senttypevar := mainclause
END;
IF V2found AND subjrelfound AND (NOT adhortfound)
THEN IF (modusvar = indicative) AND
(subjpersonvar = 2) AND
(subjnumbervar = plural) 
THEN BEGIN
moodvar := imperativemood; (*Komen jullie binnen *)
senttypevar := mainclause;
END;
END (*IF (NOT shiftrelfound) AND
(conjrelfound) THEN *)
END (*determinemood7*);
PROCEDURE determinemood8(VAR moodvar : LSDOMAINT_moodtype; 
VAR senttypevar: LSDOMAINT_senttypetype
);
BEGIN
IF (shiftrelfound) AND
(NOT conjrelfound) AND
(NOT adhortfound)
THEN BEGIN
IF (
(
(relprofound) OR
(shiftxpmoodvar = wh)
) AND
(modusvar = indicative)
)
THEN BEGIN
moodvar := relative; (*8*) 
senttypevar := subordinateclause;
END
END (*IF (shiftrelfound) AND (NOT conjrelfound) THEN*)
END (*determinemood8*);
PROCEDURE determinemood914(VAR moodvar : LSDOMAINT_moodtype; 
VAR senttypevar: LSDOMAINT_senttypetype
);
BEGIN
IF (NOT adhortfound) THEN BEGIN
IF (shiftrelfound) 
THEN BEGIN
IF (NOT conjrelfound)
THEN BEGIN
IF (shiftxpmoodvar = wh)
THEN BEGIN
IF (modusvar = indicative) 
THEN BEGIN
(* wat hij deed *)
moodvar := whinterrogative; (*9a*)
senttypevar := subordinateclause;
END (* IF (modusvar = indicative) THEN*)
ELSE BEGIN
IF (modusvar = infinitive) AND
(infsortvar = teinf)
THEN BEGIN
(* wat te doen *)
moodvar := whinterrogative; (*9b*)
senttypevar := subordinateclause;
END
END (* IF (modusvar = indicative) ELSE*)
END (*if shiftxpmoodvar = wh THEN*) 
END (*NOT conjrelfound THEN*)
ELSE BEGIN
IF (shiftxpmoodvar = wh)
THEN BEGIN
IF V2found
THEN BEGIN
(* wat deed hij *)
IF (modusvar = indicative) 
THEN BEGIN
moodvar := whinterrogative; (*10*)
senttypevar := mainclause;
END
END
ELSE BEGIN
(* wat of hij deed *)
IF (modusvar = indicative) 
THEN BEGIN
moodvar := whinterrogative; (*11*)
senttypevar := subordinateclause;
END
END
END;
IF (shiftxpmoodvar = declxpmood) AND
(V2found) AND
(NOT RELPROfound)
THEN BEGIN
IF (modusvar = indicative)
THEN BEGIN
moodvar := declarative; (*12*)
senttypevar := mainclause;
END
END
END (*NOT conjrelfound ELSE*)
END (*if shiftrelfound THEN*)
ELSE BEGIN
IF (conjrelfound)
THEN BEGIN
IF leftdislocrelfound AND
(modusvar = indicative)
THEN BEGIN
moodvar := declarative; (*13*)
senttypevar := mainclause;
END;
IF (conjkeyvar = auxkey('omCONJkey')
)
THEN BEGIN
moodvar := relative; (*14*)
senttypevar := subordinateclause;
infsortvar := omteinf;
END
END (*IF conjrelfound THEN*)
END (*if shiftrelfound ELSE*)
END (*IF NOT adhortfound*)
END (*determinemood914*);
PROCEDURE determinemood15ff(VAR moodvar : LSDOMAINT_moodtype; 
VAR senttypevar: LSDOMAINT_senttypetype
);
BEGIN
IF ((NOT shiftrelfound) AND
(NOT adhortfound) 
)
THEN BEGIN
IF (V2found) AND (modusvar = indicative)
THEN BEGIN
moodvar := conditional; (*15*)
senttypevar := subordinateclause;
adverbialvar := true;
END
(* for: Komt hij op tijd, (dan halen we het nog) *)
END
ELSE BEGIN
IF ((shiftxpmoodvar = wh) AND
(modusvar = infinitive) AND 
(infsortvar = teinf)
)
THEN BEGIN
moodvar := whinterrogative; (*16*)
senttypevar := mainclause;
END 
END
END (*determinemood15*);
PROCEDURE determinemoodadv( VAR moodvar : LSDOMAINT_moodtype; 
VAR senttypevar: LSDOMAINT_senttypetype
);
BEGIN
IF (NOT shiftrelfound) AND
conjandprepok AND
prepandfinok AND
(NOT adhortfound)
THEN BEGIN
moodvar := declarative;
senttypevar := subordinateclause;
END;
END (*determinemoodadv*);
FUNCTION dirargnpok:BOOLEAN;
BEGIN
dirargnpok := ( ( NOT dirargnpfound) OR
(dirprepfound OR verbpfound)
);
END (*dirargnpok*);
PROCEDURE EXTreducevps(VAR vps: LSDOMAINT_synpatternEFFSETtype);
BEGIN
IF (reflafterNPfound)
THEN vps := vps * LSAUXDOM_VRvps;
IF extraposrelfound AND 
(adjvpefsvar * LSAUXDOM_extraposvps = []) AND
(NOT extracanbeadjsubjvar)
THEN vps := vps * LSAUXDOM_extraposvps;
IF alsofcomplfound
THEN vps := vps * LSAUXDOM_alsofcomplvps;
IF (NOT alsofcomplfound)
THEN vps := vps - LSAUXDOM_alsofcomplvps;
IF (extraposmoodvar = declarative) AND 
(adjvpefsvar * LSAUXDOM_extraposvps = []) AND
(NOT extracanbeadjsubjvar)
THEN vps := vps * LSAUXDOM_declcomplvps;
IF (extraposmoodvar IN [whinterrogative, yesnointerrogative]) AND 
(adjvpefsvar * LSAUXDOM_extraposvps = []) AND
(NOT extracanbeadjsubjvar)
THEN vps := vps * LSAUXDOM_qcomplvps;
IF (extraposmodus = infinitive) AND 
(extraposmoodvar = declarative) AND 
(adjvpefsvar * LSAUXDOM_extraposvps = []) AND
(NOT extracanbeadjsubjvar)
THEN vps := vps * LSAUXDOM_teinfcomplvps;
IF (extraposmodus = indicative) AND
(extraposmoodvar = declarative) AND 
(adjvpefsvar * LSAUXDOM_extraposvps = []) AND
(NOT extracanbeadjsubjvar)
THEN vps := vps * LSAUXDOM_findeclcomplvps;
IF ((NOT hetclrelfound) AND (shiftNPhead <> hetNP) AND (subjNPhead <> hetNP))
THEN vps := vps - LSAUXDOM_hetcomplvps;
(*
This procedure reduce vps on the basis of information from outside the VERBP,
or from information that would be outside VERBP, if there were one. 
These reductions can apply even if VRfound = true
*)
END (*EXTreducevps*);
PROCEDURE INTreducevps(VAR vps: LSDOMAINT_synpatternEFFSETtype);
BEGIN
IF ((VERBPfound) AND
(Vmatrixheadvar = false)
)
THEN BEGIN
vps := vps * LSAUXDOM_VRvps;
IF (VPinfsortvar = teinf) 
THEN vps := vps * LSAUXDOM_teinfcomplvps;
END;
IF indobjrelfound AND
([benfactNP] * verbadjuncts = [])
THEN vps := vps * LSAUXDOM_indobjvps;
IF indobjrelfound AND
(benfactNP IN verbadjuncts)
THEN adjunctsvar := adjunctsvar + [benfactNP];
IF objrelfound AND (NOT existconf(vps)) 
THEN vps := vps * LSAUXDOM_objvps;
IF objrelfound AND (existconf(vps)) 
THEN vps := vps * (LSAUXDOM_objvps + [synzijn]);
IF accobjfound
THEN vps := vps * LSAUXDOM_accobjvps;
IF prosentfound
THEN vps := vps * LSAUXDOM_soprosentvps;
IF (NOT VRfound)
THEN BEGIN
IF preadvrelfound AND ([benfactNP] * verbadjuncts = [])
THEN vps := vps * (LSAUXDOM_objvps + LSAUXDOM_indobjvps);
IF preadvrelfound AND ([benfactNP] * verbadjuncts <> [])
THEN vps := vps * LSAUXDOM_objvps ;
IF firstclrelfound AND (adjvpefsvar * (LSAUXDOM_objvps + LSAUXDOM_adjindobjvps) <> [])
THEN vps := vps * LSAUXDOM_adjppredvps;
IF firstclrelfound AND 
(adjvpefsvar * (LSAUXDOM_objvps + LSAUXDOM_adjindobjvps) = []) AND
([benfactNP] * verbadjuncts = [])
THEN vps := vps * (LSAUXDOM_objvps + LSAUXDOM_indobjvps + LSAUXDOM_nppredvps);
IF firstclrelfound AND 
(adjvpefsvar * (LSAUXDOM_objvps + LSAUXDOM_adjindobjvps) = []) AND
([benfactNP] * verbadjuncts <> [])
THEN vps := vps * (LSAUXDOM_objvps + LSAUXDOM_nppredvps);
preadvandclfound := (
(preadvrel2found OR secondclrelfound) OR
(preadvrelfound AND firstclrelfound) OR
(firstclrelfound AND objrelfound) OR
(preadvrelfound AND hetclrelfound)
);
IF (preadvandclfound AND (adjvpefsvar = [])) AND
([benfactNP] * verbadjuncts = [])
THEN vps := vps * (LSAUXDOM_indobjvps * LSAUXDOM_objandhetvps);
IF (preadvandclfound AND (adjvpefsvar = [])) AND
([benfactNP] * verbadjuncts <> [])
THEN vps := vps * LSAUXDOM_objandhetvps;
IF (preadvandclfound AND (adjvpefsvar <> [])) THEN BEGIN
IF (adjvpefsvar * (LSAUXDOM_adjindobjvps + LSAUXDOM_objandhetvps) = []) AND
([benfactNP] * verbadjuncts = [])
THEN vps := vps * (LSAUXDOM_indobjvps * LSAUXDOM_objandhetvps * LSAUXDOM_adjppredvps);
IF (adjvpefsvar * (LSAUXDOM_adjindobjvps + LSAUXDOM_objandhetvps) = []) AND
([benfactNP] * verbadjuncts <> [])
THEN vps := vps * (LSAUXDOM_objandhetvps * LSAUXDOM_adjppredvps);
IF (adjvpefsvar * LSAUXDOM_adjindobjvps = []) AND
([benfactNP] * verbadjuncts = [])
THEN vps := vps * (LSAUXDOM_indobjvps * LSAUXDOM_adjppredvps);
IF (adjvpefsvar * LSAUXDOM_adjindobjvps = []) AND
([benfactNP] * verbadjuncts <> [])
THEN vps := vps * LSAUXDOM_adjppredvps;
IF (adjvpefsvar * LSAUXDOM_objandhetvps = [])
THEN vps := vps * (LSAUXDOM_adjppredvps * LSAUXDOM_objandhetvps);
IF (adjvpefsvar * (LSAUXDOM_adjindobjvps * LSAUXDOM_objandhetvps) <> [])
THEN vps := vps * LSAUXDOM_adjppredvps;
END;
IF (firstclrelfound AND hetclrelfound AND (adjvpefsvar = [])) AND
([benfactNP] * verbadjuncts = [])
THEN vps := vps * (LSAUXDOM_indobjvps * LSAUXDOM_objandhetvps);
IF (firstclrelfound AND hetclrelfound AND (adjvpefsvar = [])) AND
([benfactNP] * verbadjuncts <> [])
THEN vps := vps * LSAUXDOM_objandhetvps;
IF (firstclrelfound AND hetclrelfound AND (adjvpefsvar <> [])) THEN BEGIN 
IF (adjvpefsvar * (LSAUXDOM_adjindobjvps + LSAUXDOM_objandhetvps) = []) AND
([benfactNP] * verbadjuncts = [])
THEN vps := vps * (LSAUXDOM_indobjvps * LSAUXDOM_objandhetvps * LSAUXDOM_adjppredvps);
IF (adjvpefsvar * (LSAUXDOM_adjindobjvps + LSAUXDOM_objandhetvps) = []) AND
([benfactNP] * verbadjuncts <> [])
THEN vps := vps * (LSAUXDOM_objandhetvps * LSAUXDOM_adjppredvps);
IF (adjvpefsvar * LSAUXDOM_adjindobjvps = []) AND
([benfactNP] * verbadjuncts = [])
THEN vps := vps * (LSAUXDOM_indobjvps * LSAUXDOM_adjppredvps);
IF (adjvpefsvar * LSAUXDOM_adjindobjvps = []) AND
([benfactNP] * verbadjuncts <> [])
THEN vps := vps * LSAUXDOM_adjppredvps;
IF (adjvpefsvar * LSAUXDOM_objandhetvps = [])
THEN vps := vps * (LSAUXDOM_adjppredvps * LSAUXDOM_objandhetvps);
IF (adjvpefsvar * (LSAUXDOM_adjindobjvps * LSAUXDOM_objandhetvps) <> [])
THEN vps := vps * LSAUXDOM_adjppredvps;
END;
END;
IF (NOT VERBPfound)
THEN BEGIN
IF aanobjrelfound
THEN vps := vps * LSAUXDOM_aanobjvps;
IF voorobjrelfound AND
([benfactPP] * verbadjuncts = [])
THEN vps := vps * LSAUXDOM_voorobjvps;
IF voorobjrelfound AND
(benfactPP IN verbadjuncts)
THEN adjunctsvar := adjunctsvar + [benfactPP];
IF preprepobjrelfound
THEN vps := vps * LSAUXDOM_preprepobjvps;
IF prepobjrelfound OR 
postvporelfound
THEN BEGIN
IF ((prepkeyvar1 = auxkey('aanioprepkey')
) OR
(prepkeyvar2 = auxkey('aanioprepkey')
)
) AND
(NOT aanobjrelfound AND NOT voorobjrelfound)
THEN vps := vps * (LSAUXDOM_prepobjvps + LSAUXDOM_aanobjvps)
ELSE IF ((prepkeyvar1 = auxkey('voorioprepkey')
) OR
(prepkeyvar2 = auxkey('voorioprepkey')
)
) AND
(NOT aanobjrelfound AND NOT voorobjrelfound) 
THEN IF ([benfactPP] * verbadjuncts = [])
THEN vps := vps * (LSAUXDOM_prepobjvps + LSAUXDOM_voorobjvps)
ELSE adjunctsvar := adjunctsvar + [benfactPP]
ELSE vps := vps * LSAUXDOM_prepobjvps
END;
IF locargrelfound AND
([locadjunct] * verbadjuncts = [])
THEN vps := vps * LSAUXDOM_locargvps;
IF locargrelfound AND
(locadjunct IN verbadjuncts)
THEN verbadjuncts := verbadjuncts + [locadjunct];
IF dirargrelfound AND
([diradjunct] * verbadjuncts = [])
THEN vps := vps * LSAUXDOM_dirargvps;
IF dirargrelfound AND
(diradjunct IN verbadjuncts)
THEN adjunctsvar := adjunctsvar + [diradjunct];
IF dirprepfound AND
([diradjunct] * verbadjuncts = [])
THEN vps := vps * LSAUXDOM_dirargvps;
IF dirprepfound AND
(diradjunct IN verbadjuncts)
THEN adjunctsvar := adjunctsvar + [diradjunct];
IF advppredrelfound 
THEN vps := vps * LSAUXDOM_advppredvps;
IF adjppredrelfound AND
([resAP] * verbadjuncts = [])
THEN vps := vps * LSAUXDOM_adjppredvps;
IF adjppredrelfound AND
(resAP IN verbadjuncts)
THEN adjunctsvar := adjunctsvar + [resAP];
IF nppredrelfound AND
([resNP] * verbadjuncts = [])
THEN vps := vps * LSAUXDOM_nppredvps;
IF nppredrelfound AND
(resNP IN verbadjuncts)
THEN adjunctsvar := adjunctsvar + [resNP];
IF prepppredrelfound AND
([resPP] * verbadjuncts = []) 
THEN vps := vps * LSAUXDOM_prepppredvps;
IF prepppredrelfound AND
(resPP IN verbadjuncts)
THEN adjunctsvar := adjunctsvar + [resPP];
IF vpcomplrelfound 
THEN vps := vps * LSAUXDOM_vpcomplvps;
IF prepobj2found
THEN vps := vps * LSAUXDOM_twoprepobjvps;
END (*if not verbpfound then*)
(*
This procedure reduces vps on the basis of information internal to VP and
on the basis of information outside the VP that can be used only if not VRfound
It is partially identical to reducematrixvps from the Vprule
*)
END (*INTreducevps*);
FUNCTION infok:BOOLEAN;
BEGIN
infok := 
(
(NOT (finitenessvar = infinite)) OR
( (NOT subjrelfound) AND
(NOT postsubjrelfound)
)
); 
(*
This function guarantees that no subject or postsubject is present in nonfinite
sentences
*)
END (*infok*);
FUNCTION measureadjundernp(t1:LSSTREE_pstree):BOOLEAN;
VAR result, CNfound,ADJPfound:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result :=false; CNfound := false; ADJPfound := false;
sonlist:=t1^.sons; 
IF sonlist <> NIL THEN BEGIN
CNfound := (sonlist^.node^.cat = CN);
WHILE (NOT CNfound) AND (sonlist^.brother<>NIL) DO BEGIN
sonlist := sonlist^.brother;
CNfound := (sonlist^.node^.cat = CN);
END;
END;
IF CNfound THEN BEGIN
sonlist:=sonlist^.node^.sons; 
IF sonlist <> NIL THEN BEGIN
ADJPfound := (sonlist^.node^.cat = ADJP);
IF ADJPfound 
THEN result := (measureadj IN sonlist^.node^.ls^.ADJPfield^.actsubcefs);
WHILE (NOT result) AND (sonlist^.brother<>NIL) DO BEGIN
sonlist := sonlist^.brother;
ADJPfound := (sonlist^.node^.cat = ADJP);
IF ADJPfound 
THEN result := (measureadj IN sonlist^.node^.ls^.ADJPfield^.actsubcefs);
END;
END;
END;
measureadjundernp := result;
END {measureadjundernp};
(*
yields true if the structures is: NP[...head/CN[...ADJP<measure>[...]...]...]
*)
FUNCTION watunderdetp(t1:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons; {sonlist=../DETP}
IF sonlist <> NIL THEN
IF sonlist^.brother=NIL THEN
IF sonlist^.node^.cat = DETP THEN BEGIN
sonlist := sonlist^.node^.sons; {sonlist=../QP}
IF sonlist <> NIL THEN BEGIN
sonlist := sonlist^.node^.sons; {sonlist=../Q}
IF sonlist <> NIL THEN
IF sonlist^.node^.cat = Q THEN
result := (sonlist^.node^.ls^.Qfield^.key = auxkey('s_hq_wat')
);
END
END;
watunderdetp:=result;
END; (*watunderdetp*)
{This function yields true if the structure is NP
|
DETP
|
QP
|
Q,key=s_hq_wat
}
FUNCTION noofargsok:BOOLEAN;
BEGIN
noofargsok :=
(
(IMPLIES(preadvrelfound, (NOT indobjrelfound) )) AND
(IMPLIES(preadvrel2found,( (NOT indobjrelfound) AND
(NOT objrelfound) AND
(NOT secondclrelfound)
) 
)
) AND
(IMPLIES(firstclrelfound, (NOT indobjrelfound) )) AND 
(IMPLIES(secondclrelfound,( (NOT indobjrelfound) AND
(NOT objrelfound) AND
(NOT preadvrel2found)
)
)
) AND
(IMPLIES((firstclrelfound AND 
preadvrelfound
),
((NOT indobjrelfound) AND
(NOT objrelfound)
)
)
) AND
(IMPLIES(hetclrelfound, (NOT secondclrelfound) )) AND
(IMPLIES(hetclrelfound, (NOT objrelfound ) ))
);
END (*noofargsok*);
FUNCTION NOplural45(ps: LSDOMAINT_personSETtype;n: LSDOMAINT_numbertype):BOOLEAN;
BEGIN
Noplural45 :=
( NOT ( ( (ps = [4]) OR
(ps = [5]) OR
(ps = [4,5])
) AND
(n = plural)
)
);
(*
This function is true if the verb form is not only 
fourth or fifth person plural
*)
END (*NOplural45*);
FUNCTION passiveauxok:BOOLEAN;
BEGIN
passiveauxok :=
( VERBPfound AND V2found AND 
(voicevar=passive) AND
(V2subcvar IN [wordenaux, zijnaux])
); 
(*
If VERBP has been found and V2 has been found and voicevar is passive
THEN V2subcvar must be wordenaux OR zijnaux 
*) 
END (*passiveauxok*);
FUNCTION postsubjok:BOOLEAN;
BEGIN
postsubjok := IMPLIES(postsubjrelfound, (erposrelfound OR 
ppinshiftfound OR 
Rinshiftfound
)
);
(*
A postsubjrel requirs the presence of an RADV in shiftrel or in ereposrel
or a PREPP in shiftrel
*) 
END (*postsubjok*);
FUNCTION prepkeyok(vpk,pk: LSDOMAINT_keytype):BOOLEAN;
BEGIN
prepkeyok := ((pk = vpk) OR
((vpk = auxkey('totprepkey')
) AND (pk = auxkey('toeprepkey')
)) OR
((vpk = auxkey('metprepkey')
) AND (pk = auxkey('meeprepkey')
))
);
END (*prepkeyok*);
FUNCTION aanvoorprepobjok:BOOLEAN;
BEGIN
aanvoorprepobjok :=
(
( (prepkeyvar1 = auxkey('aanioprepkey')
) AND
(NOT aanobjrelfound) AND
((synvpefsvar * LSAUXDOM_aanobjvps <> []) OR
(synvpefsvar2 * LSAUXDOM_aanobjvps <> [])
) AND
(objrelfound )
) OR
( (prepkeyvar1 = auxkey('voorioprepkey')
) AND
(NOT voorobjrelfound) AND
((synvpefsvar * LSAUXDOM_voorobjvps <> []) OR
(synvpefsvar2 * LSAUXDOM_voorobjvps <> []) OR
(benfactPP IN verbadjuncts)
) AND
(objrelfound )
) 
)
END (*aanvoorprepobjok*);
FUNCTION prepobjok:BOOLEAN;
BEGIN
prepobjok := false;
IF (NOT prepobj1found)
THEN BEGIN
prepobjok := true;
END (* IF (NOT prepobj1found) THEN*)
ELSE BEGIN
IF (NOT prepobj2found)
THEN BEGIN 
IF prepkeyok(verbprepkeyvar1, prepkeyvar1) OR
prepkeyok(verbprepkeyvar2, prepkeyvar1) OR
aanvoorprepobjok 
THEN BEGIN
prepobjok := true;
END (* IF prepkeyok.. THEN
*)
ELSE BEGIN
prepobjok := false;
END (* IF prepkeyok ..
*);
END (* IF (NOT prepobj2found) THEN*)
ELSE BEGIN
IF ( (*1*)
( prepkeyok(verbprepkeyvar1, prepkeyvar1) AND 
prepkeyok(verbprepkeyvar2, prepkeyvar2)
) OR
( prepkeyok(verbprepkeyvar2, prepkeyvar1) AND
prepkeyok(verbprepkeyvar1, prepkeyvar2)
)
)
THEN BEGIN
prepobjok := true;
END (* IF 1 THEN*)
ELSE BEGIN
prepobjok := false;
END (* IF 1 ELSE*);
END; (* IF (NOT prepobj2found) ELSE *)
END; (* IF (NOT prepobj1found) ELSE*)
END (*function prepobjok*);
FUNCTION preporconjfound :BOOLEAN;
BEGIN
preporconjfound :=
( advprepfound OR
( conjrelfound AND
(NOT V2found)
)
);
(*
This function is true if either an adverbial prep is found, or
a conjunction has been found, or both have been found
*)
END;
FUNCTION reflexivesok:BOOLEAN;
BEGIN
reflexivesok :=
(
(IMPLIES( (reflexivityvar = reflexive),
reflrelfound
)
) AND
(IMPLIES( (NOT VRfound),
(IMPLIES( reflrelfound,
(reflexivityvar = reflexive)
)
)
)
)
);
END (*reflexivesok*);
FUNCTION Sunderadjp(t1:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
sonlist:LSSTREE_prelnode;
BEGIN
result:=FALSE;
sonlist:=t1^.sons;
IF sonlist <> NIL THEN BEGIN
result := ( sonlist^.node^.cat IN [SENTENCE,NEG,POS]) OR
(sonlist^.relation IN 
[reflrel, erposrel,postadjrel,omtemodrel, resultrel,
sentadvrel, tempadvrel, locadvrel, agvpadvrel
]
);
sonlist:=sonlist^.brother;
END;
WHILE (NOT result) AND (sonlist<>NIL) DO BEGIN
result := ( sonlist^.node^.cat IN [SENTENCE,NEG,POS]) OR
(sonlist^.relation IN 
[reflrel, erposrel,postadjrel,omtemodrel, resultrel,
sentadvrel, tempadvrel, locadvrel, agvpadvrel
]
);
sonlist:=sonlist^.brother
END;
Sunderadjp:=result;
END (*Sunderadjp*);
(*This function checks whether an Special elements occur under ADJP*)
FUNCTION subordcondsok:BOOLEAN;
BEGIN
subordcondsok :=
( (NOT (senttypevar = subordinateclause) OR (NOT finalpuncfound)) AND
((senttypevar = subordinateclause) <= (NOT coordfound)) AND
( (NOT(senttypevar = subordinateclause)) OR
( (NOT (leftdislocrelfound)) AND
( (NOT shiftrelfound) OR
(NOT (shiftxpmoodvar =declxpmood))OR
relprofound 
)
)
)
);
END (*subordcondsok*);
(* ********************************************* *)
FUNCTION SVAOK:BOOLEAN;
VAR inversionfound: BOOLEAN;
FUNCTION SVANomshiftok:BOOLEAN;
BEGIN
SVANomshiftok :=
(IMPLIES( ( 
((shiftrelcases = [Nominative]) AND
(NOT specialNP(shiftNPhead))
) OR
(shiftNPhead = jegenNP)
),
(
(shiftpersonvar IN verbpersonsvar) AND
(shiftnumbervar = verbnumbervar)
)
)
); 
END (*SVANomshiftok*);
FUNCTION SVAspecNomshiftok:BOOLEAN;
BEGIN
SVAspecNomshiftok :=
(IMPLIES( ( 
(shiftrelcases = [Nominative]) AND
(specialNP(shiftNPhead))
),
(
(3 IN verbpersonsvar) 
)
)
); 
END (*SVAspecNomshiftok*);
FUNCTION SVAerok:BOOLEAN;
BEGIN
SVAerok :=
(IMPLIES( (
erinshiftfound
),
(
(3 IN verbpersonsvar)
)
)
); 
END (*SVAerok*);
FUNCTION SVArelprook:BOOLEAN;
BEGIN
SVArelprook :=
(IMPLIES( (relprofound AND (NOT subjrelfound)),
(3 IN verbpersonsvar)
) 
); 
END (*SVArelprook*);
FUNCTION shiftetcetera:BOOLEAN; (*inside SVAOK*)
BEGIN
shiftetcetera :=
(
SVANomshiftok AND
SVAspecNomshiftok AND
SVAerok AND
SVArelprook
);
END (*shiftetcetera*); (* Function inside SVAOK*)
FUNCTION SVAinvok:BOOLEAN;
BEGIN
SVAinvok :=
(IMPLIES( (
subjrelfound AND
inversionfound
), 
(
(0 IN verbpersonsvar ) AND
(verbnumbervar = singular)
)
)
); 
END (*SVAinok*);
FUNCTION SVAnormsubjok:BOOLEAN;
BEGIN
SVAnormsubjok :=
(IMPLIES( (
subjrelfound AND
(NOT inversionfound) AND
(NOT specialNP(subjNPhead))
),
(
(subjpersonvar IN verbpersonsvar) AND
(subjnumbervar = verbnumbervar)
)
)
);
END (*SVAnormsubjok*);
FUNCTION SVAspecsubjok:BOOLEAN;
BEGIN
SVAspecsubjok :=
(IMPLIES( (
subjrelfound AND
(NOT inversionfound) AND
(specialNP(subjNPhead))
),
(
( 3 IN verbpersonsvar) 
)
)
);
END (*SVAspecsubjok*);
FUNCTION SVApostsubjok:BOOLEAN;
BEGIN
SVApostsubjok :=
(IMPLIES( ((NOT subjrelfound) AND
(postsubjrelfound)
),
(
(postsubjpersonvar IN verbpersonsvar)AND
(postsubjnumbervar = verbnumbervar)
)
)
);
END (*SVApostsubjok*);
FUNCTION SVAshiftok:BOOLEAN;
BEGIN
SVAshiftok :=
(IMPLIES( (
(NOT subjrelfound) AND
(NOT postsubjrelfound) AND
(shiftrelfound)
),
(
shiftetcetera
)
)
);
END (*SVAshiftok*);
FUNCTION SVAelseok:BOOLEAN;
BEGIN
SVAelseok :=
(IMPLIES( (
(NOT subjrelfound) AND
(NOT postsubjrelfound) AND
(
(NOT shiftrelfound) OR
(
(NOT erinshiftfound) AND 
(shiftrelcases 
<> [Nominative]) AND 
(NOT relprofound) AND
(shiftnphead <> jegenNP)
)
)
),
(
3 IN verbpersonsvar
)
)
);
END (*SVAelseok*);
BEGIN (*SVAOK*)
(* check on finitenessvar *)
IF (finitenessvar = infinite) THEN SVAOK := true
ELSE IF (V2modusvar = imperative) 
THEN BEGIN
IF ((not subjrelfound) OR 
(subjpersonvar IN [2,4])
) 
THEN SVAOK := true
END
ELSE BEGIN
inversionfound := 
( (subjpersonvar = 2) AND (subjnumbervar = singular) AND 
V2found AND (tensevar=presenttense)
);
SVAOK :=
( SVAinvok AND
SVAnormsubjok AND
SVAspecsubjok AND
SVApostsubjok AND
SVAshiftok AND
SVAelseok
);
END (*ELSE*); 
(*This function checks subject verb agreement*)
END (*SVAok*);
FUNCTION synvpsok:BOOLEAN;
BEGIN
synvpsok :=
( (synvpefsvar <> []) AND
IMPLIES(VRfound, (synvpefsvar2 <> [])) AND
IMPLIES(predadjfound, (adjvpefsvar <> [] ))
);
END (*synvpsok*);
FUNCTION temporalNPok(t:LSSTREE_pStree):BOOLEAN;
(*
pre: t=T & T.cat=NP & T.sons<>nil
post: temporalNP(t) <=>
t<> NP[head/CN[head/NOUN<sg>]] AND
t<> NP[detrel/DETP<def>[head/ART],head/CN[head/NOUN]]
*)
VAR rt,frt:LSSTREE_pRelnode;
wrongtree:BOOLEAN;
BEGIN
wrongtree:=true;
frt:= t^.sons;
wrongtree := frt^.relation IN [head,detrel];
IF wrongtree THEN BEGIN
IF frt^.relation=head THEN BEGIN
wrongtree:= (frt^.node^.cat=CN) AND (frt^.brother=nil);
IF wrongtree THEN BEGIN
rt:=frt^.node^.sons;
wrongtree:= (rt^.node^.cat=NOUN) AND (rt^.brother=NIL);
IF wrongtree THEN wrongtree:=(rt^.node^.ls^.NOUNfield^.number=singular);
END; 
END
ELSE BEGIN
wrongtree:=(frt^.node^.cat=DETP) AND (frt^.brother<>NIL);
IF wrongtree THEN wrongtree:=(frt^.node^.ls^.DETPfield^.definite=def);
IF wrongtree THEN BEGIN
rt:=frt^.node^.sons;
wrongtree:= (rt^.node^.cat=ART) AND (rt^.brother=NIL);
END;
IF wrongtree THEN BEGIN
rt:=frt^.brother;
wrongtree:= (rt^.node^.cat=CN) AND (rt^.brother=NIL)
END; 
IF wrongtree THEN rt:=rt^.node^.sons;
IF wrongtree THEN wrongtree:=(rt^.node^.cat=NOUN) AND (rt^.brother=NIL)
END;
END;
temporalNPok := (NOT wrongtree);
END {temporalNPok};
FUNCTION thetacondsok:BOOLEAN;
BEGIN
thetacondsok := 
(
(IMPLIES( postsubjrelfound,
( (thetavpvar IN [vp100, vp120, vp123]) OR
((thetavpvar IN [vp010, vp012]) AND 
VRfound
)
)
)
) AND
(NOT ( (thetavpvar =vp010) AND
(objrelfound) AND
(NOT subjrelfound) AND
(shiftNPhead <> hetNP) AND
(NOT ( erinerposrelfound OR
erinshiftfound
)
)
)
)
);
(*
A postsubjrel can appear only with real intransitives, transitives, 
ditransitives;
The argument of an 1-place ergative verb as an object requires the 
presence of (expletive) er in erposrel or in shiftrel.
This is wrong: Daar kwam een man aan (So any RADV in shift, erposrel will do)
It also must hold for passives 
or het is in shiftrel (e.g. het regent bakstenen)
*)
END (*thetacondsok*); 
FUNCTION VPandV2ok:BOOLEAN;
BEGIN
VPandV2ok :=
(VERBPfound OR V2found OR (adjppredrelfound AND advsok)) AND
((V2subcvar IN [hebbenaux, zijnaux, wordenaux]) <= (VPinfsortvar <> teinf)) AND
( ( (NOT VERBPfound) AND (voicevar=active) ) OR
passiveauxok OR
activeauxok OR
(VERBPfound AND (NOT V2found)
)
);
(*
Checks whether the found combination of VERBP and V2, if any is correct
*) 
END (*VPandV2ok*);

BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
teller := 0;
aanobjrelfound := false;
accobjfound := false;
adhortfound := false;
adjpinshiftfound := false;
adjppredrelfound := false;
adjunctsvar := [];
adjvpefsvar := [];
adverbialvar := false;
advfound := false;
advldlfound := false;
advpinshiftfound := false;
advppredrelfound := false;
advprepfound := false;
alsofcomplfound := false;
classesvar := [];
conjaspectvar := omegaaspect;
conjclassvar := omegaTimeadvclass;
conjdeixisvar := omegadeixis;
conjkeyvar := 0;
conjpatternsvar :=[];
conjrelfound := false;
conjretrovar := false;
conjsentinm1found := false;
coordfound := false;
countennpfound := false;
defradvrelfound := false;
deixisvar := omegadeixis;
dirargNPfound := false;
dirargrelfound := false;
dirprepfound := false;
secondclrelfound := false;
envvar := [pospol, negpol, omegapol];
erinerposrelfound := false;
erinshiftfound := false;
erposrelfound := false;
erqrelfound := false;
expparticle := 0;
extracanbeadjsubjvar := FALSE;
extraposmodus := omegamodus;
extraposmoodvar := omegamood;
extraposrelfound := false;
finalpuncfound := false;
finitenessvar := omegafin;
gelievefound := false;
hetclrelfound := false;
hierdaarinRposfound:= false;
indobjrelfound := false;
infsortvar := omegainf;
firstclrelfound := false;
leftdislocpuncfound:= false;
leftdislocrelfound := false;
locargrelfound := false;
modusvar := omegamodus;
moodvar := omegamood;
negorposfound := false;
nodetnpfound2 := false;
nodetnpfound := false;
nodetNPidvps := LSAUXDOM_nodetNPidvps;
nodetNPidvps2 := LSAUXDOM_nodetNPidvps;
nppredrelfound := false;
objrelfound := false;
origsynvpefsvar := [];
particlekey := 0;
postsubjnodetNPfound := false;
postsubjnumbervar := omeganumber;
postsubjpersonvar := 3; 
postsubjrelfound := false;
postvporelfound := false;
postvrelfound := false;
ppinshiftfound := false;
preadvandclfound := false;
preadvok := false;
preadvok2 := false;
preadvrel2found := false;
preadvrelfound := false;
predadjfound := false;
prepkeyvar1 := 0;
prepkeyvar2 := 0;
prepobjrelfound := false;
prepobj1found := false;
prepobj2found := false;
prepppredrelfound := false;
preprepobjrelfound := false;
prepsynppsvar := [];
prosentfound := false;
radvgluefound := false;
reflafterNPfound := false;
reflexivityvar := notreflexive;
reflrelfound := false;
relprofound := false;
reqvar := [pospol, negpol, omegapol];
resultpuncrelfound := false;
retrovar := false;
Rinshiftfound := false;
senttypevar := omegaclause;
shiftNPhead := otherNP;
shiftnptemporal := false;
shiftpersonvar := 0;
shiftnodetNPfound := false;
shiftnumbervar := omeganumber;
shiftrelcases := [];
shiftrelfound := false;
shiftxpmoodvar := declxpmood;
stadvfound := false;
strandedppfound := false;
strandedrelfound := false;
subjnodetNPfound := false;
subjNPhead := otherNP;
subjnumbervar := omeganumber;
subjpersonvar := 0;
subjrelfound := false;
synvpefsvar := [];
synvpefsvar2 := [];
temporalvar := false;
tensevar := omegatense;
thetavpvar := omegathetavp;
unreducedvpsvar := [];
v2adjuncts := [];
v2classesvar := []; 
v2found := false;
v2modusvar := omegamodus;
v2subcvar := mainverb; (* *)
v2synvpefsvar := [];
v2thetavpvar := omegathetavp;
verbadjuncts := [];
verbpersonsvar := [];
verbnumbervar := omeganumber;
verbprepkeyvar1 := 0;
verbprepkeyvar2 := 0;
verbpfound := false;
Vmatrixheadvar := false;
voicevar := active;
voorobjrelfound := false;
vpadjuncts := [];
vpclassesvar := []; 
vpcomplrelfound := false;
vpinfsortvar := omegainf;
vpmodusvar := omegamodus;
vpsynvpefsvar := [];
vpthetavpvar := omegathetavp;
vrfound := false;
anterelativeok := true;
END (*hinit*);
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ( b^.ls^.SENTENCEfield^.adverbial = false) AND
( b^.ls^.SENTENCEfield^.senttype = subordinateclause
) AND
(
((b^.ls^.SENTENCEfield^.finiteness = finite) AND
(b^.ls^.SENTENCEfield^.conjkey <> 0)
) OR
( (b^.ls^.SENTENCEfield^.modus = infinitive) AND
(b^.ls^.SENTENCEfield^.infsort = inf)
)
)
);globcond: BEGIN  BEGIN
SYNREL := leftdislocrel;
leftdislocrelfound := true;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PUNCfield^.key = auxkey('kommapunckey')
)
);globcond: BEGIN  BEGIN
SYNREL := puncrel;
leftdislocpuncfound := true;
END
END; END; 
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.NPhead <> watindefproNP) AND
((b^.ls^.NPfield^.NPhead <> reducedpersproNP) OR
(Nominative IN b^.ls^.NPfield^.cases)) AND
((b^.ls^.NPfield^.NPhead <> hetNP) OR
(Nominative IN b^.ls^.NPfield^.cases)) AND
(NOT watunderdetp(b)) 
(* and other NP's that cannot be shifted *)
);globcond: BEGIN  BEGIN
SYNREL := shiftrel;
shiftxpmoodvar:= b^.ls^.NPfield^.mood;
shiftrelfound := true;
shiftrelcases := b^.ls^.NPfield^.cases;
shiftpersonvar:= b^.ls^.NPfield^.person;
shiftnumbervar:= b^.ls^.NPfield^.number;
shiftNPhead := b^.ls^.NPfield^.NPhead;
shiftNPtemporal := b^.ls^.NPfield^.temporal;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countennpfound := true;
IF nodetNP(b) 
THEN shiftnodetNPfound := true
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.actsubcefs <> [restprep])
);globcond: BEGIN  BEGIN
SYNREL := shiftrel;
shiftxpmoodvar := b^.ls^.PREPPfield^.mood;
shiftrelfound := true;
ppinshiftfound := true;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs * 
[sentadv,locadv,tempadv, causadv, 
subjvpadv,otheradv] <> []) OR
(b^.ls^.ADVPfield^.mood = wh) 
);globcond: BEGIN  BEGIN
SYNREL := shiftrel;
shiftxpmoodvar:= b^.ls^.ADVPfield^.mood;
shiftrelfound := true;
advpinshiftfound := true;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADJPfield^.mood = wh) AND
(b^.ls^.ADJPfield^.eORenForm = NoForm) AND
(predicative IN b^.ls^.ADJPfield^.actuseefs)
);globcond: BEGIN  BEGIN
SYNREL := shiftrel;
shiftxpmoodvar:= b^.ls^.ADJPfield^.mood;
shiftrelfound := true;
adjvpefsvar := b^.ls^.ADJPfield^.adjpatternefs;
IF adjvpefsvar <> []
THEN predadjfound := true;
adjpinshiftfound := true;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.RADVPfield^.radvkey = auxkey('erRADVkey')
)
);globcond: BEGIN  BEGIN
SYNREL := shiftrel;
shiftxpmoodvar:= declxpmood;
shiftrelfound := true;
Erinshiftfound := true;
Rinshiftfound := true;
advpinshiftfound := true;
END
END; END;
8: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := conjrel; 
conjkeyvar := b^.ls^.CONJfield^.key;
conjrelfound := true;
conjpatternsvar := b^.ls^.CONJfield^.conjpatterns;
IF (NOT adverbialvar)
THEN adverbialvar := b^.ls^.CONJfield^.adverbial;
IF (NOT temporalvar)
THEN temporalvar := b^.ls^.CONJfield^.temporal;
conjaspectvar := b^.ls^.CONJfield^.aspect;
conjdeixisvar := b^.ls^.CONJfield^.deixis;
conjretrovar := b^.ls^.CONJfield^.retro;
conjclassvar := b^.ls^.CONJfield^.class;
IF (conjkeyvar = auxkey('gelieveCONJkey')
) OR
(conjkeyvar = auxkey('ugelieveCONJkey')
)
THEN gelievefound := true;
END
END; END;
9: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.modus in [ indicative, 
subjunctive, imperative] ) AND
(b^.ls^.VERBfield^.status = bareV) AND
Noplural45(b^.ls^.VERBfield^.persons, b^.ls^.VERBfield^.number)
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
conjrelfound := true;
V2found := true;
finitenessvar := finite;
infsortvar := omegainf;
V2modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
V2thetavpvar := b^.ls^.VERBfield^.thetavp;
V2synvpefsvar := b^.ls^.VERBfield^.synvps;
V2subcvar := b^.ls^.VERBfield^.subc;
V2classesvar := b^.ls^.VERBfield^.classes;
V2adjuncts := b^.ls^.VERBfield^.adjuncts;
verbpersonsvar := b^.ls^.VERBfield^.persons;
verbnumbervar := b^.ls^.VERBfield^.number;
expparticle := b^.ls^.VERBfield^.particle;
verbprepkeyvar1 := b^.ls^.VERBfield^.prepkey1;
verbprepkeyvar2 := b^.ls^.VERBfield^.prepkey2;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
END
END; END;
10: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (Nominative IN b^.ls^.NPfield^.cases)
);globcond: BEGIN  BEGIN
SYNREL := subjrel;
subjrelfound := true;
subjpersonvar := b^.ls^.NPfield^.person;
subjnumbervar := b^.ls^.NPfield^.number;
subjNPhead := b^.ls^.NPfield^.NPhead;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countennpfound := true;
IF nodetNP(b) THEN BEGIN
subjnodetnpfound := true;
END;
END
END; END;
11: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := predrel;
IF (V2subcvar = latenverb) AND 
(b^.ls^.VERBPfield^.Vmatrixhead = true) 
THEN adhortfound := true;
verbpfound := true;
IF (NOT preadvok)
THEN preadvok := b^.ls^.VERBPfield^.preadvok;
IF (NOT preadvok2)
THEN preadvok2 := b^.ls^.VERBPfield^.preadvok;
objrelfound := b^.ls^.VERBPfield^.objfound;
indobjrelfound := b^.ls^.VERBPfield^.indobjfound;
VPinfsortvar := b^.ls^.VERBPfield^.infsort;
VPthetavpvar := b^.ls^.VERBPfield^.thetavp;
VPsynvpefsvar := b^.ls^.VERBPfield^.synvpefs;
vpadjuncts := b^.ls^.VERBPfield^.adjuncts;
synvpefsvar2 := b^.ls^.VERBPfield^.synvpefs2;
VPmodusvar := b^.ls^.VERBPfield^.modus;
voicevar := b^.ls^.VERBPfield^.voice;
IF (NOT V2found)
THEN BEGIN
tensevar := b^.ls^.VERBPfield^.tense;
infsortvar := b^.ls^.VERBPfield^.infsort;
verbpersonsvar := b^.ls^.VERBPfield^.persons;
verbnumbervar := b^.ls^.VERBPfield^.number;
IF b^.ls^.VERBPfield^.modus IN [indicative]
THEN finitenessvar := finite
ELSE finitenessvar := infinite;
END (*not V2found*);
VRfound := (synvpefsvar2 <> []);
Vmatrixheadvar := b^.ls^.VERBPfield^.Vmatrixhead;
VPclassesvar := b^.ls^.VERBPfield^.classes;
reflexivityvar := b^.ls^.VERBPfield^.reflexivity;
adjvpefsvar := b^.ls^.VERBPfield^.adjvpefs;
IF adjvpefsvar <> []
THEN predadjfound := true;
IF b^.ls^.VERBPfield^.countenfound THEN
countennpfound := true;
locargrelfound := b^.ls^.VERBPfield^.locargfound;
dirargrelfound := b^.ls^.VERBPfield^.dirargfound;
prepobjrelfound:= b^.ls^.VERBPfield^.prepobjfound;
aanobjrelfound := b^.ls^.VERBPfield^.aanobjfound;
voorobjrelfound := b^.ls^.VERBPfield^.voorobjfound;
nppredrelfound := b^.ls^.VERBPfield^.nppredfound;
adjppredrelfound := b^.ls^.VERBPfield^.adjpppredfound;
prepppredrelfound := b^.ls^.VERBPfield^.prepppredfound;
postvporelfound := b^.ls^.VERBPfield^.postvpofound;
strandedrelfound := b^.ls^.VERBPfield^.strandedfound;
vpcomplrelfound := b^.ls^.VERBPfield^.vpcomplfound;
END
END; END;
12: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT (b^.ls^.PREPPfield^.actsubcefs = [dir])) AND
(NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.actsubcefs * [loc, temp, according ,
excepting, topic, caus] <> [])
);globcond: BEGIN  BEGIN
SYNREL := spostverbrel;
anterelativeok := false;
END
END; END;
13: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := shiftrel;
shiftrelfound := true;
relprofound := true;
END
END; END;
14: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (subjvpadv IN b^.ls^.ADVPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := subjvpadvrel;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
stadvfound := true;
END
END; END;
15: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PUNCfield^.key = auxkey('kommapunckey')
)
);globcond: BEGIN  BEGIN
SYNREL :=puncrel;
END
END; END;
16: 
CASE mode OF
loccond:LIPRIMS_assignstatus(((NOT b^.ls^.SENTENCEfield^.adverbial) OR
(b^.ls^.SENTENCEfield^.conjkey = auxkey('alsofCONJkey')
)
) AND 
(b^.ls^.SENTENCEfield^.mood IN 
[declarative, yesnointerrogative, 
WHinterrogative]
) AND
(b^.ls^.SENTENCEfield^.senttype = subordinateclause) AND
(
(b^.ls^.SENTENCEfield^.finiteness <> infinite) OR
(b^.ls^.SENTENCEfield^.infsort IN [teinf, omteinf])
)
);globcond: BEGIN  BEGIN
SYNREL := extraposrel;
extraposrelfound := true;
IF b^.ls^.SENTENCEfield^.conjkey = auxkey('alsofCONJkey')

THEN alsofcomplfound := true;
extraposmoodvar := b^.ls^.SENTENCEfield^.mood;
extraposmodus := b^.ls^.SENTENCEfield^.modus;
anterelativeok := false;
END
END; END;
17: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.SENTENCEfield^.adverbial) AND
(b^.ls^.SENTENCEfield^.mood = relative) AND
(b^.ls^.SENTENCEfield^.senttype = subordinateclause)
);globcond: BEGIN  BEGIN
SYNREL := relsentrel;
anterelativeok := false;
END
END; END;
18: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := thanascomplrel;
anterelativeok := false;
END
END; END;
19: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := ascomplrel;
anterelativeok := false;
END
END; END;
20:
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PUNCfield^.key = auxkey('kommaPUNCkey')
)
);globcond: BEGIN  BEGIN
SYNREL := puncrel;
resultpuncrelfound := true
END
END; END;
21: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.SENTENCEfield^.adverbial) AND
(b^.ls^.SENTENCEfield^.mood = declarative) AND
(b^.ls^.SENTENCEfield^.senttype = subordinateclause) AND
(b^.ls^.SENTENCEfield^.conjkey <> 0)
);globcond: BEGIN  BEGIN
SYNREL := resultrel;
anterelativeok := false;
END
END; END;
22: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PERSPROfield^.NPhead = hetNP) AND
(Accusative IN b^.ls^.PERSPROfield^.persprocases)
);globcond: BEGIN  BEGIN
SYNREL := hetclrel;
hetclrelfound := true;
END
END; END;
23: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ([Dative, Accusative] 
* b^.ls^.PERSPROfield^.persprocases <> []) AND
(b^.ls^.PERSPROfield^.NPhead <> hetNP)
);globcond: BEGIN  BEGIN
SYNREL := firstclrel;
firstclrelfound := true;
END
END; END;
24: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ([Dative, Accusative] 
* b^.ls^.PERSPROfield^.persprocases <> []) AND
(b^.ls^.PERSPROfield^.NPhead <> hetNP)
);globcond: BEGIN  BEGIN
SYNREL := secondclrel;
secondclrelfound := true;
END
END; END;
25: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.REFLPROfield^.zelf)
);globcond: BEGIN  BEGIN
SYNREL := reflrel;
reflrelfound := true;
IF (preadvrelfound)
THEN reflafterNPfound := true; 
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
(* has been put into the loop, 
cf. dat er zich hebben voorgedaan vs hij heeft zich er.. *)
END
END; END;
26: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := erposrel;
erposrelfound := true;
IF (b^.ls^.RADVPfield^.radvkey = auxkey('erRADVkey')
)
THEN erinerposrelfound := true;
IF ((b^.ls^.RADVPfield^.radvkey = auxkey('hierRADVkey')
) OR
(b^.ls^.RADVPfield^.radvkey = auxkey('daarRADVkey')
)
)
THEN hierdaarinRposfound := true;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
END
END; END;
27: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ( (b^.ls^.PREPPfield^.radvkey = auxkey('hierRADVkey')
) OR
(b^.ls^.PREPPfield^.radvkey = auxkey('daarRadvkey')
)
)
(* daar,hier in the PREPP *)
);globcond: BEGIN  BEGIN
SYNREL := erposrel;
erposrelfound := true;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
stadvfound := true
END
END; END;
28: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.RADVPfield^.radvkey = auxkey('daarRadvkey')
) OR
(b^.ls^.RADVPfield^.radvkey = auxkey('hierRADVkey')
)
);globcond: BEGIN  BEGIN
SYNREL := defRadvrel;
defRadvrelfound := true;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
stadvfound := true
END
END; END;
29: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := negrel;
negorposfound := true;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
END
END; END;
30: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := posrel;
negorposfound := true;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
END
END; END;
31: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs *[sentadv, causadv] <> [])
);globcond: BEGIN  BEGIN
SYNREL := sentadvrel;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
stadvfound := true
END
END; END;
32: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.actsubcefs * [according, caus] <> []) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := sentadvrel;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
stadvfound := true
END
END; END;
33: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (tempadv IN b^.ls^.ADVPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := tempadvrel;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
stadvfound := true
END
END; END;
34: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (temp IN b^.ls^.PREPPfield^.actsubcefs) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := tempadvrel;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
stadvfound := true
END
END; END;
35: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.temporal = true) AND
(temporalNPok(b)) AND
((b^.ls^.NPfield^.actsubcs 
* [unitnoun,plurunitnoun,daynoun,monthnoun]<>[]) OR
(measureadjundernp(b)) 
)
);globcond: BEGIN  BEGIN
SYNREL := tempadvrel;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
stadvfound := true
END
END; END;
36: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.cases <> [Nominative]) AND
(NOT (b^.ls^.NPfield^.NPhead IN [hetNP, persproNP, jegenNP, 
zegenNP, watindefproNP, reducedpersproNP])) AND
(NOT nodetNP(b))
);globcond: BEGIN  BEGIN
SYNREL := preadvrel;
preadvrelfound := true;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countennpfound := true;
END
END; END;
37: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.cases <> [Nominative]) AND
(NOT (b^.ls^.NPfield^.NPhead IN [hetNP, persproNP, jegenNP, 
zegenNP, watindefproNP, reducedpersproNP])) AND
(NOT nodetNP(b))
);globcond: BEGIN  BEGIN
SYNREL := preadvrel;
preadvrel2found := true;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countennpfound := true;
END
END; END;
38: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (locadv IN b^.ls^.ADVPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := locadvrel;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
advfound := true;
END
END; END;
39: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(loc IN b^.ls^.PREPPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := locadvrel;
advfound := true;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
END
END; END;
40: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.RADVPfield^.radvkey <> auxkey('erRADVkey')
 ) AND
(b^.ls^.RADVPfield^.radvkey <> auxkey('daarRADVkey')
) AND 
(b^.ls^.RADVPfield^.radvkey <> auxkey('hierRADVkey')
)
);globcond: BEGIN  BEGIN
SYNREL := locadvrel;
advfound := true;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
END
END; END;
41: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.Qstatus = true) AND
(agvpadv IN b^.ls^.ADVPfield^.actsubcefs )
);globcond: BEGIN  BEGIN
SYNREL := agvpadvrel;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
stadvfound := true;
END
END; END;
42: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.RADVPfield^.radvkey <> auxkey('erRADVkey')
)
);globcond: BEGIN  BEGIN
SYNREL := shiftrel;
shiftxpmoodvar:= b^.ls^.RADVPfield^.mood;
shiftrelfound := true;
Rinshiftfound := true;
advpinshiftfound := true;
END
END; END;
43: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.SENTENCEfield^.adverbial AND
(NOT(b^.ls^.SENTENCEfield^.mood = conditional)) 
(* can be a intermediate adverbial sent *)
);globcond: BEGIN  BEGIN
IF b^.ls^.SENTENCEfield^.temporal
THEN SYNREL := tempadvrel 
ELSE SYNREL := sentadvrel;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
conjsentinm1found := true;
END
END; END;
44: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.SENTENCEfield^.adverbial AND
(b^.ls^.SENTENCEfield^.finiteness = finite) AND
(NOT(b^.ls^.SENTENCEfield^.mood = conditional)) 
(* can be a final adverbial sent *)
);globcond: BEGIN  BEGIN
IF b^.ls^.SENTENCEfield^.temporal
THEN SYNREL := posttemprel
ELSE SYNREL := postsentadvrel;
anterelativeok := false;
END
END; END;
45: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.definite = indef) 
);globcond: BEGIN  BEGIN
SYNREL := postsubjrel;
postsubjrelfound := true;
postsubjpersonvar := b^.ls^.NPfield^.person;
postsubjnumbervar := b^.ls^.NPfield^.number;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countennpfound := true;
IF nodetNP(b) 
THEN postsubjnodetNPfound:=true;
END
END; END;
46: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.adverbial)
(* can be an initial conjsent *)
);globcond: BEGIN  BEGIN
SYNREL := leftdislocrel; (* cf als.. dan *)
leftdislocrelfound := true;
advldlfound := true;
END
END; END;
47: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.RADVPfield^.radvkey = auxkey('erRADVkey')
)
);globcond: BEGIN  BEGIN
SYNREL := erqrel;
erqrelfound := true;
IF preadvrelfound THEN preadvok := true;
IF preadvrel2found THEN preadvok2 := true;
END
END; END;
48: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := gluerel;
radvgluefound := true;
END
END; END;
49: (* cf. 1 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.animate in [ yesanimate, omegaanimate]) AND
(Dative IN b^.ls^.NPfield^.cases) AND 
(NOT(b^.ls^.NPfield^.NPhead IN [reducedpersproNP, jegenNP, 
zegenNP, hetNP])) 
);globcond: BEGIN  BEGIN
SYNREL := indobjrel;
indobjrelfound := true;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countennpfound := true;
IF nodetNP(b) THEN BEGIN
nodetNPfound := true;
nodetNPidvps := nodetNPidvps 
* LSAUXDOM_ionodetidvps;
END;
END
END; END;
50: (* cf. 2 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.headkey = auxkey('aanioprepkey')
) AND
(b^.ls^.PREPPfield^.radvkey = 0) 
);globcond: BEGIN  BEGIN
SYNREL := aanobjrel;
aanobjrelfound := true;
(* preadvok := true; *)
END
END; END;
51: (* cf. 3 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.headkey = auxkey('voorioprepkey')
) AND
(b^.ls^.PREPPfield^.radvkey = 0) 
);globcond: BEGIN  BEGIN
SYNREL := voorobjrel;
voorobjrelfound := true;
(* preadvok := true; *)
END
END; END;
52: (* cf. 4 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( ([nominative, accusative] * b^.ls^.NPfield^.cases <> []) AND
(b^.ls^.NPfield^.cases <> [Nominative]) AND
(NOT(b^.ls^.NPfield^.NPhead IN [reducedpersproNP, jegenNP, 
zegenNP, hetNP])) 
);globcond: BEGIN  BEGIN
SYNREL := objrel;
IF NOT (nominative IN b^.ls^.NPfield^.cases) 
THEN accobjfound := true;
objrelfound := true;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countennpfound := true;
IF nodetNP(b) THEN BEGIN
nodetNPfound := true;
nodetNPidvps := nodetNPidvps 
* LSAUXDOM_donodetidvps;
END;
END
END; END;
53: (* cf. 5 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := prepobjrel;
prepobjrelfound := true;
IF (prepobj1found)
THEN BEGIN
prepkeyvar2 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found then*)
ELSE BEGIN
prepkeyvar1 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found else*);
IF (prepobj1found)
THEN BEGIN
prepobj2found := true
END (*if prepobj1found then*)
ELSE BEGIN
prepobj1found := true
END (*if prepobj1found else*);
IF b^.ls^.PREPPfield^.stranded
THEN strandedPPfound := true;
END
END; END;
54: (* cf. 6 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (dir IN b^.ls^.PREPPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := dirargrel;
dirargrelfound := true;
IF b^.ls^.PREPPfield^.stranded
THEN strandedPPfound := true;
END
END; END;
55: (* cf. 7 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (diradv IN b^.ls^.ADVPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := dirargrel;
dirargrelfound := true;
END
END; END;
56: (* cf. 8 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (loc IN b^.ls^.PREPPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := locargrel;
locargrelfound := true;
IF b^.ls^.PREPPfield^.stranded
THEN strandedPPfound := true;
END
END; END;
57: (* cf. 9 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (locadv IN b^.ls^.ADVPfield^.actsubcefs) 
);globcond: BEGIN  BEGIN
SYNREL := locargrel;
locargrelfound := true;
END
END; END;
58: (* cf. 10 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.actsubcefs * [ other] <> []) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := predrel;
prepppredrelfound := true;
END
END; END;
59: (* cf. 11 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs * [otherAdv] <> [])
);globcond: BEGIN  BEGIN
SYNREL := predrel;
advppredrelfound := true;
END
END; END;
60: (* cf. 12 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.cases <> [Nominative]) AND
(accusative IN b^.ls^.NPfield^.cases) AND
(NOT(b^.ls^.NPfield^.NPhead IN [reducedpersproNP, hetNP, jegenNP,
zegenNP])) AND
(b^.ls^.NPfield^.posspred = true) (*NP can be used predicatively*) 
);globcond: BEGIN  BEGIN
SYNREL := predrel; 
nppredrelfound :=true;
IF (b^.ls^.NPfield^.NPhead = enNP) AND
(b^.ls^.NPfield^.actcomas = [count])
THEN countennpfound := true;
END
END; END;
61: (* cf. 13 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( ( predicative IN b^.ls^.ADJPfield^.actuseefs) AND
(( b^.ls^.ADJPfield^.eORenForm <> NoForm ) <= (NOT V2found)) AND
(NOT Sunderadjp(b))
);globcond: BEGIN  BEGIN
SYNREL := predrel;
adjppredrelfound := true;
adjvpefsvar := b^.ls^.ADJPfield^.adjpatternefs;
IF adjvpefsvar <> []
THEN predadjfound := true;
IF (NOT V2found) 
THEN finitenessvar := infinite;
END
END; END;
62: (* for temporal PREP introducing an adverbial clause *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (temp IN b^.ls^.PREPfield^.subcs) AND
(b^.ls^.PREPfield^.synpps * 
[synTHATSENT, synOPENTESENT] <> []
)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
prepsynppsvar := b^.ls^.PREPfield^.synpps;
advprepfound := true;
temporalvar := true;
adverbialvar := true; 
END
END; END;
63: (* cf. 15 from VP *) (* for stranded preprep heads *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.stranded) 
);globcond: BEGIN  BEGIN
SYNREL := strandedrel;
strandedrelfound := true;
IF (prepobj1found)
THEN BEGIN
prepkeyvar2 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found then*)
ELSE BEGIN
prepkeyvar1 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found else*);
IF (prepobj1found)
THEN BEGIN
prepobj2found := true
END (*if prepobj1found then*)
ELSE BEGIN
prepobj1found := true
END (*if prepobj1found else*);
END
END; END;
64: (* cf. 16 from VP *) (* for stranded adverbials *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.actsubcefs * [instrum,comitative] <> []) AND 
(b^.ls^.PREPPfield^.stranded) 
);globcond: BEGIN  BEGIN
SYNREL := strandedrel;
strandedrelfound := true;
END
END; END;
65: (* cf. 17 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := partrel;
particlekey := b^.ls^.PARTfield^.key;
END
END; END;
66: (* cf. 21 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.radvkey = 0) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := prepobjrel;
preprepobjrelfound := true;
IF (prepobj1found)
THEN BEGIN
prepkeyvar2 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found then*)
ELSE BEGIN
prepkeyvar1 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found else*);
IF (prepobj1found)
THEN BEGIN
prepobj2found := true
END (*if prepobj1found then*)
ELSE BEGIN
prepobj1found := true
END (*if prepobj1found else*);
END
END; END;
67: (* cf. 22 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.radvkey = 0)
);globcond: BEGIN  BEGIN
SYNREL := postvporel;
postvporelfound := true;
IF (prepobj1found)
THEN BEGIN
prepkeyvar2 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found then*)
ELSE BEGIN
prepkeyvar1 := b^.ls^.PREPPfield^.headkey
END (*if prepobj1found else*);
IF (prepobj1found)
THEN BEGIN
prepobj2found := true
END (*if prepobj1found then*)
ELSE BEGIN
prepobj1found := true
END (*if prepobj1found else*);
END
END; END;
68: (* cf. 23 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.radvkey = 0) AND
(b^.ls^.PREPPfield^.actsubcefs * [doorby, instrum, 
comitative] <> [])
);globcond: BEGIN  BEGIN
SYNREL := postverbrel;
postvrelfound := true;
END
END; END;
69: (* cf. 25 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.actsubcefs * [instrum, comitative (*, voor *)] 
<> []) AND
(b^.ls^.PREPPfield^.radvkey = 0) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := vpadvrel;
preadvok := true;
END
END; END;
70: (* cf. 26 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs * [vpadv] <> []) AND
(b^.ls^.ADVPfield^.Qstatus = false)
);globcond: BEGIN  BEGIN
SYNREL := vpadvrel;
preadvok := true;
END
END; END;
71: (* for nontemporal PREP introducing an adverbial clause *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPfield^.subcs - [temp] <> []) AND
(b^.ls^.PREPfield^.synpps * 
[synTHATSENT, synOPENTESENT] <> []
)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
prepsynppsvar := b^.ls^.PREPfield^.synpps;
advprepfound := true;
adverbialvar := true; 
END
END; END;
72: (* cf. 28 from VP *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs * [agvpadv] <> []) AND
(b^.ls^.ADVPfield^.Qstatus = false)
);globcond: BEGIN  BEGIN
SYNREL := agvpadvrel;
preadvok := true;
END
END; END;
73: (* cf. 34 from the VP rule *) 
CASE mode OF
loccond:LIPRIMS_assignstatus( ([nominative, accusative] * b^.ls^.NPfield^.cases <> []) AND
(b^.ls^.NPfield^.cases <> [Nominative]) AND
(NOT(b^.ls^.NPfield^.NPhead IN [reducedpersproNP, jegenNP, 
zegenNP, hetNP])) 
);globcond: BEGIN  BEGIN
SYNREL := dirargrel;
dirargrelfound := true;
dirargNPfound := true;
IF nodetNP(b) THEN BEGIN
nodetNPfound := true;
nodetNPidvps := nodetNPidvps 
* LSAUXDOM_dirnodetidvps;
END;
END
END; END;
74: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (dir IN b^.ls^.PREPfield^.subcs) AND
(b^.ls^.PREPfield^.preptype = postprep) 
);globcond: BEGIN  BEGIN
SYNREL := partrel;
dirprepfound := true; 
END
END; END;
75: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := puncrel;
finalpuncfound := true;
END
END; END;
76: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.finiteness = infinite) AND
(b^.ls^.SENTENCEfield^.mood = declarative) AND
((b^.ls^.SENTENCEfield^.adverbial) OR
(b^.ls^.SENTENCEfield^.conjkey = auxkey('omCONJkey')
)
)
);globcond: BEGIN  BEGIN
IF b^.ls^.SENTENCEfield^.temporal
THEN SYNREL := posttemprel
ELSE SYNREL := postsentadvrel;
anterelativeok := false;
END
END; END;
77: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBPfield^.voice = passive) AND
(b^.ls^.VERBPfield^.Vmatrixhead = true) AND
(b^.ls^.VERBPfield^.modus = pastpart) AND
(b^.ls^.VERBPfield^.foundauxes = []) AND
(b^.ls^.VERBPfield^.synvpefs2 =[]) AND
(b^.ls^.VERBPfield^.objfound = false) AND
(b^.ls^.VERBPfield^.indobjfound = false) AND
(b^.ls^.VERBPfield^.adjvpefs = []) AND
(b^.ls^.VERBPfield^.countenfound = false)AND
(b^.ls^.VERBPfield^.vpcomplfound =false) 
);globcond: BEGIN  BEGIN
SYNREL := complrel;
vpcomplrelfound := true;
END
END; END;
78: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PROSENTfield^.so = true
);globcond: BEGIN  BEGIN
SYNREL := objrel;
prosentfound := true;
END
END; END;
79: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.COORDfield^.Sintroducer = true
);globcond: BEGIN  BEGIN
SYNREL := argrel;
COORDfound := true;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( postsubjok AND
countenOK AND
((NOT leftdislocpuncfound) OR (shiftrelfound )) AND
VPandV2ok AND
conjandverbok AND
allpreadvsok AND
SVAOK AND
noofargsok AND
reflexivesok AND
( (NOT(shiftrelcases = [Nominative])) OR
((NOT subjrelfound) AND (NOT postsubjrelfound))
) AND
(particlekey = expparticle) AND
infok AND
dirargnpok AND
IMPLIES(conjsentinm1found, 
(postvok(adjppredrelfound,advppredrelfound,
nppredrelfound,prepppredrelfound,strandedrelfound,
prepobjrelfound,locargrelfound,dirargrelfound,
objrelfound,indobjrelfound,particlekey)
OR verbpfound))
);IF LIPRIMS_status THEN BEGIN
(*
Determine values of thetavpvar, synvpefsvar, classesvar 
*)
detargstrANDclasses(
thetavpvar , vpsynvpefsvar , classesvar , 
verbadjuncts , adjunctsvar );
(* modusvar: *)
IF V2found
THEN modusvar := V2modusvar
ELSE modusvar := VPmodusvar;
(* deixisvar: *)
IF (tensevar = presenttense)
THEN deixisvar := presentdeixis
ELSE IF (tensevar = pasttense)
THEN deixisvar := pastdeixis
ELSE IF (modusvar = imperative)
THEN deixisvar := presentdeixis;
IF gelievefound THEN deixisvar := presentdeixis;
(* conditions on thetavp *)
IF (thetacondsok AND
prepobjok
)
THEN BEGIN 
unreducedvpsvar := synvpefsvar;
extracanbeadjsubjvar := extracanbeadjsubj;
IF (NOT VRfound) 
THEN BEGIN
IntReducevps(synvpefsvar);
ExtReducevps(synvpefsvar);
IF (subjnodetNPfound OR shiftnodetNPfound) 
THEN BEGIN
nodetNPidvps := nodetNPidvps * 
(LSAUXDOM_subjnodetidvps + LSAUXDOM_donodetidvps);
nodetNPfound := true; 
END;
IF postsubjnodetNPfound
THEN BEGIN
nodetNPidvps := 
nodetNPidvps * LSAUXDOM_subjnodetidvps;
nodetNPfound := true;
END;
IF (nodetNPfound)
THEN synvpefsvar := synvpefsvar * nodetNPidvps;
END
ELSE BEGIN
Intreducevps(synvpefsvar);
EXTreducevps(synvpefsvar2);
IF (subjnodetNPfound OR shiftnodetNPfound )
THEN IF NOsubjraisingfound(thetavpvar,synvpefsvar)
THEN BEGIN
nodetNPidvps := nodetNPidvps * 
(LSAUXDOM_subjnodetidvps + LSAUXDOM_donodetidvps);
nodetNPfound := true; 
END
ELSE IF (onlysubjraisingfound
(thetavpvar, synvpefsvar))
THEN BEGIN
nodetNPidvps2 := nodetNPidvps2 * 
(LSAUXDOM_subjnodetidvps + LSAUXDOM_donodetidvps);
nodetNPfound2:= true; 
END;
IF postsubjnodetNPfound
THEN IF NOsubjraisingfound(thetavpvar,synvpefsvar)
THEN BEGIN
nodetNPidvps := nodetNPidvps * 
LSAUXDOM_subjnodetidvps ;
nodetNPfound := true; 
END
ELSE IF (onlysubjraisingfound
(thetavpvar, synvpefsvar))
THEN BEGIN
nodetNPidvps2 := nodetNPidvps2 * 
LSAUXDOM_subjnodetidvps ;
nodetNPfound2:= true; 
END;
IF (nodetNPfound)
THEN synvpefsvar := synvpefsvar * nodetNPidvps;
IF (nodetNPfound2)
THEN synvpefsvar2 := synvpefsvar2 * nodetNPidvps2;
END;
IF predadjfound THEN BEGIN
checkpredadj(adjvpefsvar);
END;
IF (synvpsok)
THEN BEGIN
(* determine moodvar: cases 1-6 *)
moodvar := omegamood;
senttypevar := omegaclause;
origsynvpefsvar := synvpefsvar;
IF (NOT adverbialvar)
THEN determinemood16(moodvar, senttypevar);
IF (moodvar <> omegamood) AND
subordcondsok AND
argspresent
THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar ;
top^.ls^.SENTENCEfield^.senttype := senttypevar;
top^.ls^.SENTENCEfield^.voice := voicevar ;
top^.ls^.SENTENCEfield^.PROsubject := (finitenessvar = infinite );
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvar ;
computeaktarts( classesvar,
top^.ls^.SENTENCEfield^.aktionsarts
);
top^.ls^.SENTENCEfield^.aspect := omegaaspect ;
top^.ls^.SENTENCEfield^.deixis := deixisvar ;
top^.ls^.SENTENCEfield^.retro := false ;
top^.ls^.SENTENCEfield^.finiteness := finitenessvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvar;
top^.ls^.SENTENCEfield^.superdeixis := omegadeixis ;
top^.ls^.SENTENCEfield^.VRcompl := false ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar;
top^.ls^.SENTENCEfield^.temporal := temporalvar;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar;
top^.ls^.SENTENCEfield^.adjuncts := adjunctsvar;
END; (*if moodvar <> omegamood then, cases 1-6*)
(* determine moodvar; case 7 *)
moodvar := omegamood;
senttypevar := omegaclause;
synvpefsvar := origsynvpefsvar;
IF (NOT adverbialvar)
THEN determinemood7(moodvar, senttypevar);
IF (moodvar <> omegamood) AND
subordcondsok AND
argspresent
THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar ;
top^.ls^.SENTENCEfield^.senttype := senttypevar;
top^.ls^.SENTENCEfield^.voice := voicevar ;
top^.ls^.SENTENCEfield^.PROsubject := (finitenessvar = infinite );
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvar ;
computeaktarts( classesvar,
top^.ls^.SENTENCEfield^.aktionsarts
);
top^.ls^.SENTENCEfield^.aspect := omegaaspect ;
top^.ls^.SENTENCEfield^.deixis := deixisvar ;
top^.ls^.SENTENCEfield^.retro := false ;
top^.ls^.SENTENCEfield^.finiteness := finitenessvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvar;
top^.ls^.SENTENCEfield^.superdeixis := omegadeixis ;
top^.ls^.SENTENCEfield^.VRcompl := false ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar;
top^.ls^.SENTENCEfield^.temporal := temporalvar;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar;
top^.ls^.SENTENCEfield^.adjuncts := adjunctsvar;
END; (*if moodvar <> omegamood then, case 7*)
(* determine moodvar, case 8 *)
moodvar := omegamood;
senttypevar := omegaclause;
synvpefsvar := origsynvpefsvar;
IF (NOT adverbialvar)
THEN determinemood8(moodvar, senttypevar);
IF (moodvar <> omegamood) AND
subordcondsok AND
argspresent
THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar ;
top^.ls^.SENTENCEfield^.senttype := senttypevar;
top^.ls^.SENTENCEfield^.voice := voicevar ;
top^.ls^.SENTENCEfield^.PROsubject := (finitenessvar = infinite );
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvar ;
computeaktarts( classesvar,
top^.ls^.SENTENCEfield^.aktionsarts
);
top^.ls^.SENTENCEfield^.aspect := omegaaspect ;
top^.ls^.SENTENCEfield^.deixis := deixisvar ;
top^.ls^.SENTENCEfield^.retro := false ;
top^.ls^.SENTENCEfield^.finiteness := finitenessvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvar;
top^.ls^.SENTENCEfield^.superdeixis := omegadeixis ;
top^.ls^.SENTENCEfield^.VRcompl := false ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar;
top^.ls^.SENTENCEfield^.temporal := temporalvar;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar;
top^.ls^.SENTENCEfield^.adjuncts := adjunctsvar;
END; (*if moodvar <> omegamood then, case 8*)
(* determination of moodvar, cases 9-14 *)
moodvar := omegamood;
senttypevar := omegaclause;
synvpefsvar := origsynvpefsvar;
IF (NOT adverbialvar)
THEN determinemood914(moodvar, senttypevar);
IF (moodvar <> omegamood) AND
subordcondsok AND
argspresent
THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar ;
top^.ls^.SENTENCEfield^.senttype := senttypevar;
top^.ls^.SENTENCEfield^.voice := voicevar ;
top^.ls^.SENTENCEfield^.PROsubject := (finitenessvar = infinite );
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvar ;
computeaktarts( classesvar,
top^.ls^.SENTENCEfield^.aktionsarts
);
top^.ls^.SENTENCEfield^.aspect := omegaaspect ;
top^.ls^.SENTENCEfield^.deixis := deixisvar ;
top^.ls^.SENTENCEfield^.retro := false ;
top^.ls^.SENTENCEfield^.finiteness := finitenessvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvar;
top^.ls^.SENTENCEfield^.superdeixis := omegadeixis ;
top^.ls^.SENTENCEfield^.VRcompl := false ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar;
top^.ls^.SENTENCEfield^.temporal := temporalvar;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar;
top^.ls^.SENTENCEfield^.adjuncts := adjunctsvar;
END; (*if moodvar <> omegamood then, case 9-14*)
(* determination of moodvar, case 15ff *)
moodvar := omegamood;
senttypevar := omegaclause;
synvpefsvar := origsynvpefsvar;
IF (NOT adverbialvar)
THEN determinemood15ff(moodvar, senttypevar);
IF (moodvar <> omegamood) AND
subordcondsok AND
argspresent
THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar ;
top^.ls^.SENTENCEfield^.senttype := senttypevar;
top^.ls^.SENTENCEfield^.voice := voicevar ;
top^.ls^.SENTENCEfield^.PROsubject := (finitenessvar = infinite );
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvar ;
computeaktarts( classesvar,
top^.ls^.SENTENCEfield^.aktionsarts
);
top^.ls^.SENTENCEfield^.aspect := omegaaspect ;
top^.ls^.SENTENCEfield^.deixis := deixisvar ;
top^.ls^.SENTENCEfield^.retro := false ;
top^.ls^.SENTENCEfield^.finiteness := finitenessvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvar;
top^.ls^.SENTENCEfield^.superdeixis := omegadeixis ;
top^.ls^.SENTENCEfield^.VRcompl := false ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar;
top^.ls^.SENTENCEfield^.temporal := temporalvar;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar;
top^.ls^.SENTENCEfield^.adjuncts := adjunctsvar;
END; (*if moodvar <> omegamood then, case 15*)
(* determination of moodvar, case 15ff *)
moodvar := omegamood;
senttypevar := omegaclause;
synvpefsvar := origsynvpefsvar;
IF adverbialvar
THEN determinemoodadv(moodvar, senttypevar);
IF (moodvar <> omegamood) AND
preporconjfound AND
subordcondsok AND
argspresent
THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar ;
top^.ls^.SENTENCEfield^.senttype := senttypevar;
top^.ls^.SENTENCEfield^.voice := voicevar ;
top^.ls^.SENTENCEfield^.PROsubject := (finitenessvar = infinite );
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvar ;
computeaktarts( classesvar,
top^.ls^.SENTENCEfield^.aktionsarts
);
top^.ls^.SENTENCEfield^.aspect := omegaaspect ;
top^.ls^.SENTENCEfield^.deixis := deixisvar ;
top^.ls^.SENTENCEfield^.retro := false ;
top^.ls^.SENTENCEfield^.finiteness := finitenessvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvar;
top^.ls^.SENTENCEfield^.superdeixis := omegadeixis ;
top^.ls^.SENTENCEfield^.VRcompl := false ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar;
top^.ls^.SENTENCEfield^.temporal := temporalvar;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar;
top^.ls^.SENTENCEfield^.adjuncts := adjunctsvar;
END; (*if moodvar <> omegamood then, adverbial cases *)
END (*if synvpsok THEN*)
END (*thetaconds*)
END (*finalaction*)
END; END; 
END;
END;{package}
procedure SURFRULES_rule(rnr:INTEGER;a:LIPRIMS_nodeid;
            b:LISTREE_pStree;mode:LIPRIMS_surfrulemode);
VAR lsb:LSSTREE_pStree;
BEGIN
lsb:=loopholes.retype(b,LSSTREE_pStree);
CASE rnr OF
  1:WITH UTTpack DO UTTrule(a,lsb,mode);
  2:WITH Vcomplexpack DO Vcomplexrule(a,lsb,mode);
  3:WITH VPpack DO VPrule(a,lsb,mode);
  4:WITH NP1rulepack DO NP1rulerule(a,lsb,mode);
  5:WITH NP1arulepack DO NP1arulerule(a,lsb,mode);
  6:WITH NP2rulepack DO NP2rulerule(a,lsb,mode);
  7:WITH NP3rulepack DO NP3rulerule(a,lsb,mode);
  8:WITH NP4rulepack DO NP4rulerule(a,lsb,mode);
  9:WITH NP5rulepack DO NP5rulerule(a,lsb,mode);
 10:WITH NP6rulepack DO NP6rulerule(a,lsb,mode);
 11:WITH NP7rulepack DO NP7rulerule(a,lsb,mode);
 12:WITH DETPrulepack DO DETPrulerule(a,lsb,mode);
 13:WITH DETP2rulepack DO DETP2rulerule(a,lsb,mode);
 14:WITH CN1rulepack DO CN1rulerule(a,lsb,mode);
 15:WITH CN2rulepack DO CN2rulerule(a,lsb,mode);
 16:WITH PREPPpack DO PREPPrule(a,lsb,mode);
 17:WITH RADVPpack DO RADVPrule(a,lsb,mode);
 18:WITH ADVPpack DO ADVPrule(a,lsb,mode);
 19:WITH DatumNPpack DO DatumNPrule(a,lsb,mode);
 20:WITH NPcardrulepack DO NPcardrulerule(a,lsb,mode);
 21:WITH ADJP1srulepack DO ADJP1srulerule(a,lsb,mode);
 22:WITH ADJP2srulepack DO ADJP2srulerule(a,lsb,mode);
 23:WITH THANASPsrulepack DO THANASPsrulerule(a,lsb,mode);
 24:WITH QPsrulepack DO QPsrulerule(a,lsb,mode);
 25:WITH PPcoordpack DO PPcoordrule(a,lsb,mode);
 26:WITH AdvPcoordpack DO AdvPcoordrule(a,lsb,mode);
 27:WITH ADJPcoordpack DO ADJPcoordrule(a,lsb,mode);
 28:WITH NPcoordpack DO NPcoordrule(a,lsb,mode);
 29:WITH Scoordpack DO Scoordrule(a,lsb,mode);
 30:WITH SENTENCEsrulepack DO SENTENCEsrulerule(a,lsb,mode);
END
END;
FUNCTION SURFRULES_maxrnr:INTEGER;
BEGIN
SURFRULES_maxrnr:= 30
END;
FUNCTION SURFRULES_synrel:LIDOMAINT_synrel;
BEGIN
SURFRULES_synrel:=loopholes.retype(synrel,LIDOMAINT_synrel)
END;
