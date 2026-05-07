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
2 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.senttype = mainclause) AND
(b^.ls^.SENTENCEfield^.finiteness = finite) 
);globcond: BEGIN  BEGIN
SYNREL := head;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := head;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
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
PACKAGE VERBPrulepack: [VERBPrulerule];
(* 1=HEAD, 3=IO, 4=DO, 5=COMPL, 6=PO, 7=AUXREL, 8=PROGAUXREL, 9=PASSAUXREL
10=PO, 11=PO, 12=LOCARG, 13=DIRARG, 14=LOCARG, 15=DIRARG, 16= PRED,
17=PRED, 18=BYOBJ, 19=PRED, 20=COMPL 21=PROSENT*)
VAR
ADJPpredfound : BOOLEAN;
adjunctsvar : LSDOMAINT_adjunctSETtype;
adjunctsefsvar : LSDOMAINT_adjunctSETtype;
adjvpefsvar : LSDOMAINT_synpatterneffSETtype;
asifcomplfound : BOOLEAN;
auxfound : BOOLEAN; (* auxrel has been found *)
auxverbfound : BOOLEAN; (* any auxiliary verb has been found *)
byobjfound : BOOLEAN;
caseassignervar : BOOLEAN;
classesvar : LSDOMAINT_classSETtype;
complfound : BOOLEAN;
complinfvar : LSDOMAINT_inftype;
complmodusvar : LSDOMAINT_modustype;
complmoodvar : LSDOMAINT_moodtype;
complprosubjectvar : BOOLEAN;
dirargfound : BOOLEAN;
envvar : LSDOMAINT_polarityeffsettype;
foundauxesvar : LSDOMAINT_auxSETtype;
headfound : BOOLEAN;
headmodusvar : LSDOMAINT_modustype;
indobjfound : BOOLEAN;
locargfound : BOOLEAN;
modusvar : LSDOMAINT_modustype;
NPpredfound : BOOLEAN;
objfound : BOOLEAN;
partfound : BOOLEAN; 
passauxfound : BOOLEAN;
particlevar : LSDOMAINT_keytype;
possvoicesvar : LSDOMAINT_voiceSETtype;
predfound : BOOLEAN;
prepkeyvar1 : LSDOMAINT_keytype;
prepkeyvar2 : LSDOMAINT_keytype;
prepobjfound : BOOLEAN;
prepobj2found : BOOLEAN;
PREPPpredfound : BOOLEAN;
progauxfound : BOOLEAN;
reflexivityvar : LSDOMAINT_reflexivetype;
reqvar : LSDOMAINT_polarityeffsettype;
SENTcomplfound : BOOLEAN;
strandedPPfound : BOOLEAN;
synvpefsvar : LSDOMAINT_synpatterneffsettype;
synvpsvar : LSDOMAINT_synpatternsettype;
tensevar : LSDOMAINT_tensetype;
thetavpvar : LSDOMAINT_thetavptype;
verbnumbersvar : LSDOMAINT_numbersettype;
verbpersonsvar : LSDOMAINT_personSETtype;
VERBPcomplfound : BOOLEAN;
voicevar : LSDOMAINT_voicetype;
PROCEDURE VERBPrulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

FUNCTION headmodusandauxok:BOOLEAN;
BEGIN
headmodusandauxok :=
((headmodusvar = participle) AND
((NOT auxverbfound) OR
passauxfound
)
);
END; {headmodusandauxok}
{checks whether headmodus and auxiliary verbs are compatible for passives. 
called in hfinal}
PROCEDURE reduce(VAR vps: LSDOMAINT_synpatterneffSETtype);
BEGIN
IF complmoodvar = declarative
THEN vps := vps * LSAUXDOM_declcomplvps;
IF complmoodvar IN [whinterrogative, yesnointerrogative]
THEN vps := vps * LSAUXDOM_qcomplvps;
IF complmodusvar = infinitive
THEN vps := vps * LSAUXDOM_infinitecomplvps;
IF (complmoodvar = declarative) AND
(complmodusvar = indicative)
THEN vps := vps * LSAUXDOM_indcomplvps;
IF (complmoodvar = declarative) AND
(complmodusvar = subjunctive)
THEN vps := vps * LSAUXDOM_subjcomplvps;
IF complmodusvar = ingform
THEN vps := vps * LSAUXDOM_ingcomplvps;
IF complinfvar = inf
THEN vps := vps * LSAUXDOM_infcomplvps;
IF complinfvar = toinf
THEN vps := vps * LSAUXDOM_toinfcomplvps;
IF complinfvar = fortoinf
THEN vps := vps * LSAUXDOM_fortocomplvps;
IF complinfvar = accing
THEN vps := vps * (LSAUXDOM_closedcomplvps * LSAUXDOM_ingcomplvps);
IF complinfvar = opening
THEN vps := vps * LSAUXDOM_openingcomplvps;
IF SENTcomplfound AND (complprosubjectvar = TRUE)
THEN vps := vps * LSAUXDOM_opencomplvps;
IF SENTcomplfound AND
(complprosubjectvar = FALSE) AND
(complmodusvar <> indicative ) AND
(complmodusvar <> subjunctive)
(* ([complmodusvar] * [indicative, subjunctive] *)
THEN vps := vps * LSAUXDOM_closedcomplvps;
IF asifcomplfound
THEN vps := vps * LSAUXDOM_asifcomplvps;
IF (vps * LSAUXDOM_closedvppvps <> []) AND
(NOT verbpcomplfound)
THEN vps := vps - LSAUXDOM_closedvppvps;
END; {reduce}
 
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
asifcomplfound := FALSE;
adjunctsvar := [];
adjunctsefsvar := [];
ADJPpredfound := FALSE;
adjvpefsvar := [];
auxfound := FALSE; 
auxverbfound := FALSE; 
byobjfound := FALSE;
caseassignervar := FALSE;
classesvar := [];
complfound := FALSE;
complinfvar := omegainf;
complmodusvar := omegamodus;
complmoodvar := omegamood;
complprosubjectvar := FALSE;
dirargfound := FALSE;
envvar := [pospol, negpol, omegapol];
foundauxesvar := [];
headfound := FALSE;
headmodusvar := omegamodus;
indobjfound := FALSE;
locargfound := FALSE;
modusvar := omegamodus;
NPpredfound := FALSE;
objfound := FALSE;
partfound := FALSE;
particlevar := 0;
passauxfound := FALSE;
predfound := FALSE;
prepkeyvar1 := 0;
prepkeyvar2 := 0;
prepobjfound := FALSE;
prepobj2found := FALSE;
possvoicesvar := [active];
PREPPpredfound := FALSE;
progauxfound := FALSE;
reflexivityvar := notreflexive;
reqvar := [pospol, negpol, omegapol];
SENTcomplfound := FALSE;
synvpefsvar := [synBE, synNP];
synvpsvar := [synBE, synNP];
tensevar := omegatense;
thetavpvar := omegathetavp;
verbpersonsvar := [];
verbnumbersvar := [];
VERBPcomplfound := FALSE;
voicevar := omegavoice;
END;
1: (* head/VERB *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.subc IN [mainverb,haveverb]) OR
((b^.ls^.VERBfield^.subc IN [beverb]) AND
(b^.ls^.VERBfield^.modus <> indicative) AND
(b^.ls^.VERBfield^.modus <> subjunctive)
(*[b^.ls^.VERBfield^.modus] * [indicative, subjunctive] = []*)
)
);globcond: BEGIN  BEGIN
SYNREL := head;
synvpsvar := b^.ls^.VERBfield^.synvps;
adjunctsvar := b^.ls^.VERBfield^.adjuncts;
thetavpvar := b^.ls^.VERBfield^.thetavp;
IF (NOT auxverbfound)
THEN modusvar := b^.ls^.VERBfield^.modus;
headmodusvar := b^.ls^.VERBfield^.modus;
verbpersonsvar := b^.ls^.VERBfield^.persons;
verbnumbersvar := b^.ls^.VERBfield^.numbers;
synvpefsvar := b^.ls^.VERBfield^.synvps;
classesvar := b^.ls^.VERBfield^.classes;
tensevar := b^.ls^.VERBfield^.tense;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
particlevar := b^.ls^.VERBfield^.particle;
prepkeyvar1 := b^.ls^.VERBfield^.prepkey1;
prepkeyvar2 := b^.ls^.VERBfield^.prepkey2;
headfound := TRUE;
caseassignervar := b^.ls^.VERBfield^.caseassigner;
END
END; END;
2: (* partrel/PART *)
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := partrel;
partfound := TRUE;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( accusative IN b^.ls^.NPfield^.cases
);globcond: BEGIN  BEGIN
SYNREL := indobjrel;
indobjfound := TRUE;
IF (reflexivityvar IN [indobjrefl])
THEN
synvpefsvar := synvpefsvar;
IF (benfactNP IN adjunctsvar)
THEN
adjunctsefsvar := adjunctsefsvar + [benfactNP]
ELSE
synvpefsvar := synvpefsvar * LSAUXDOM_indobjvps;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ((NOT (nominative IN b^.ls^.NPfield^.cases)) OR 
(b^.ls^.NPfield^.nphead <> perspronp)
) AND
(b^.ls^.NPfield^.nphead <> openingNP)
);globcond: BEGIN  BEGIN
SYNREL := objrel;
objfound := TRUE;
IF (reflexivityvar IN [dobjrefl])
THEN 
synvpefsvar := synvpefsvar
ELSE
synvpefsvar := synvpefsvar * LSAUXDOM_objvps;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.senttype = subordinateclause) AND
(
(b^.ls^.SENTENCEfield^.finiteness <> finite) OR
((b^.ls^.SENTENCEfield^.mood IN [declarative]) AND
(b^.ls^.SENTENCEfield^.conjkey = 0 ))
) AND
(
(NOT b^.ls^.SENTENCEfield^.adverbial) OR
(b^.ls^.SENTENCEfield^.conjkey = auxkey('asifconjkey')
)
) AND
(b^.ls^.SENTENCEfield^.mood IN
[declarative, yesnointerrogative, WHinterrogative])
AND
(((b^.ls^.SENTENCEfield^.infsort <> inf) OR
(b^.ls^.SENTENCEfield^.finiteness <> infinite)
) OR
(b^.ls^.SENTENCEfield^.prosubject = FALSE)
) AND
(b^.ls^.SENTENCEfield^.infsort <> possing) 
);globcond: BEGIN  BEGIN 
SYNREL := complrel;
complfound := TRUE;
IF b^.ls^.SENTENCEfield^.conjkey = auxkey('asifconjkey')

THEN asifcomplfound := TRUE;
complmoodvar := b^.ls^.SENTENCEfield^.mood;
complmodusvar := b^.ls^.SENTENCEfield^.modus;
complprosubjectvar := b^.ls^.SENTENCEfield^.prosubject;
complinfvar := b^.ls^.SENTENCEfield^.infsort;
synvpefsvar := synvpefsvar * LSAUXDOM_sentcomplvps;
SENTcomplfound := TRUE;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := prepobjrel;
synvpefsvar := synvpefsvar * LSAUXDOM_prepobjvps;
prepobjfound := TRUE;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.modus IN [infinitive, ingform]) AND
(b^.ls^.VERBfield^.subc = haveverb) AND
(b^.ls^.VERBfield^.thetavp = thetavpaux)
);globcond: BEGIN  BEGIN
SYNREL := auxrel;
auxfound := TRUE;
auxverbfound := TRUE;
modusvar := b^.ls^.VERBfield^.modus;
foundauxesvar := foundauxesvar + [aux];
END
END; END;
8: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.modus IN [infinitive, ingform, participle]) AND
(b^.ls^.VERBfield^.subc = beverb) AND
(b^.ls^.VERBfield^.thetavp = thetavpaux) AND
(synBE IN b^.ls^.VERBfield^.synvps )
);globcond: BEGIN  BEGIN
SYNREL := progauxrel;
progauxfound := TRUE;
auxverbfound := TRUE;
IF (NOT auxfound)
THEN modusvar := b^.ls^.VERBfield^.modus;
foundauxesvar := foundauxesvar + [prog];
END
END; END;
9: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.modus IN [infinitive, ingform, participle]) AND
(b^.ls^.VERBfield^.subc = beverb) AND
(b^.ls^.VERBfield^.thetavp = thetavpaux)
(* <= means implies:*)
);globcond: BEGIN  BEGIN
SYNREL := passauxrel;
passauxfound := TRUE;
auxverbfound := TRUE;
IF ((NOT auxfound) AND
(NOT progauxfound)
)
THEN modusvar := b^.ls^.VERBfield^.modus;
voicevar := passive;
foundauxesvar := foundauxesvar + [pass];
END
END; END;
10: 
CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := prepobjrel;
IF (benfactPP IN adjunctsvar)
THEN
adjunctsefsvar := adjunctsefsvar + [benfactPP]
ELSE
synvpefsvar := synvpefsvar * LSAUXDOM_prepobjvps;
prepobjfound := TRUE;
strandedPPfound := b^.ls^.PREPPfield^.stranded;
END
END; END;
11: 
CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := prepobjrel;
synvpefsvar := synvpefsvar * LSAUXDOM_twoprepobjvps;
prepobj2found := TRUE;
strandedPPfound := b^.ls^.PREPPfield^.stranded;
END
END; END;
12: 
CASE mode OF
loccond:LIPRIMS_assignstatus( loc IN b^.ls^.PREPPfield^.actsubcefs
);globcond: BEGIN  BEGIN
SYNREL := locargrel;
locargfound := true;
IF (locadjunct IN adjunctsvar)
THEN
adjunctsefsvar := adjunctsefsvar + [locadjunct]
ELSE
synvpefsvar := synvpefsvar * LSAUXDOM_locargvps;
END
END; END;
13: 
CASE mode OF
loccond:LIPRIMS_assignstatus( dir IN b^.ls^.PREPPfield^.actsubcefs
);globcond: BEGIN  BEGIN
SYNREL := dirargrel;
dirargfound := true;
IF (diradjunct IN adjunctsvar)
THEN 
adjunctsefsvar := adjunctsefsvar + [diradjunct]
ELSE
synvpefsvar := synvpefsvar * LSAUXDOM_dirargvps;
END
END; END;
14: 
CASE mode OF
loccond:LIPRIMS_assignstatus( locadv IN b^.ls^.ADVPfield^.actsubcefs
);globcond: BEGIN  BEGIN
SYNREL := locargrel;
locargfound := TRUE;
IF (locadjunct IN adjunctsvar)
THEN
adjunctsefsvar := adjunctsefsvar + [locadjunct]
ELSE
synvpefsvar := synvpefsvar * LSAUXDOM_locargvps;
END
END; END;
15: 
CASE mode OF
loccond:LIPRIMS_assignstatus( diradv IN b^.ls^.ADVPfield^.actsubcefs
);globcond: BEGIN  BEGIN
SYNREL := dirargrel;
dirargfound := TRUE;
IF (diradjunct IN adjunctsvar)
THEN 
adjunctsefsvar := adjunctsefsvar + [diradjunct]
ELSE
synvpefsvar := synvpefsvar * LSAUXDOM_dirargvps;
END
END; END;
16: 
CASE mode OF
loccond:LIPRIMS_assignstatus( predicative IN b^.ls^.ADJPfield^.actuseefs
);globcond: BEGIN  BEGIN
SYNREL := predrel;
predfound := TRUE;
ADJPpredfound := TRUE;
IF (resAP IN adjunctsvar)
THEN
adjunctsefsvar := adjunctsefsvar + [resAP]
ELSE
synvpefsvar := synvpefsvar * LSAUXDOM_adjppredvps;
adjvpefsvar := b^.ls^.ADJPfield^.adjpatternefs;
END
END; END;
17: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.cases <> [nominative]) AND
(b^.ls^.NPfield^.posspred = TRUE)
);globcond: BEGIN  BEGIN
SYNREL := predrel;
predfound := TRUE;
NPpredfound := TRUE;
IF (resNP IN adjunctsvar)
THEN
adjunctsefsvar := adjunctsefsvar * [resNP]
ELSE
synvpefsvar := synvpefsvar * LSAUXDOM_NPpredvps;
END
END; END;
18: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PREPPfield^.headkey = auxkey('doorbyprepkey')

);globcond: BEGIN  BEGIN
SYNREL := byobjrel;
IF voicevar IN [omegavoice, passive]
THEN voicevar := passive;
byobjfound := TRUE;
END
END; END;
19: 
CASE mode OF
loccond:LIPRIMS_assignstatus( other IN b^.ls^.PREPPfield^.actsubcefs
);globcond: BEGIN  BEGIN
SYNREL := predrel;
predfound := TRUE;
PREPPpredfound := TRUE;
IF (resPP IN b^.ls^.VERBfield^.adjuncts)
THEN
adjunctsefsvar := adjunctsefsvar + [resPP]
ELSE
synvpefsvar := synvpefsvar * LSAUXDOM_PREPPpredvps;
END
END; END;
20: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBPfield^.voice = passive ) AND
(b^.ls^.VERBPfield^.foundauxes = [] )
);globcond: BEGIN  BEGIN
SYNREL := predrel;
synvpefsvar := synvpefsvar * LSAUXDOM_CLOSEDvppvps;
VERBPcomplfound := TRUE;
END
END; END;
21: (* alleen voor SO, nog niet voor NOT*)
CASE mode OF 
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := complrel;
synvpefsvar := synvpefsvar * LSAUXDOM_SOPROSENTVPS;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( (synvpefsvar <> []) AND
(headfound OR
objfound OR
predfound
) AND
((NOT headfound)
<= (NOT auxverbfound)
)
);IF LIPRIMS_status THEN BEGIN
reduce(synvpefsvar);
IF (synvpefsvar <> [])
THEN
BEGIN
IF (passive IN possvoicesvar) AND
headmodusandauxok AND
(voicevar IN [passive, omegavoice]) AND
(modusvar <> omegamodus) AND
(objfound <= (thetavpvar IN [vp123]))
THEN 
BEGIN
top:=MAKET_stree(VERBP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.VERBPfield^.req := reqvar;
top^.ls^.VERBPfield^.env := envvar;
top^.ls^.VERBPfield^.synvps := synvpsvar;
top^.ls^.VERBPfield^.adjuncts := adjunctsefsvar;
top^.ls^.VERBPfield^.thetavp := thetavpvar;
top^.ls^.VERBPfield^.modus := modusvar;
top^.ls^.VERBPfield^.persons := verbpersonsvar;
top^.ls^.VERBPfield^.numbers := verbnumbersvar;
top^.ls^.VERBPfield^.aspect := omegaaspect;
IF (tensevar = omegatense) 
THEN top^.ls^.VERBPfield^.deixis := omegadeixis
ELSE IF (tensevar = presenttense) 
THEN top^.ls^.VERBPfield^.deixis := presentdeixis
ELSE IF (tensevar = pasttense)
THEN top^.ls^.VERBPfield^.deixis := pastdeixis;
top^.ls^.VERBPfield^.retro := false;
IF (modusvar IN [infinitive, ingform, participle])
THEN top^.ls^.VERBPfield^.finiteness := infinite
ELSE IF (modusvar IN [indicative,
subjunctive])
THEN top^.ls^.VERBPfield^.finiteness := finite; 
top^.ls^.VERBPfield^.voice := passive;
top^.ls^.VERBPfield^.synvpefs := synvpefsvar;
top^.ls^.VERBPfield^.classes := classesvar;
top^.ls^.VERBPfield^.headfound := headfound;
top^.ls^.VERBPfield^.foundauxes := foundauxesvar;
top^.ls^.VERBPfield^.adjvpefs := adjvpefsvar;
top^.ls^.VERBPfield^.Scomplfound := SENTcomplfound;
top^.ls^.VERBPfield^.reflexivity := reflexivityvar;
(* top^.ls^.VERBPfield^.infsort := ; *)
top^.ls^.VERBPfield^.objfound := objfound;
top^.ls^.VERBPfield^.indobjfound := indobjfound;
top^.ls^.VERBPfield^.locargfound := locargfound;
top^.ls^.VERBPfield^.dirargfound := dirargfound;
top^.ls^.VERBPfield^.prepobjfound := prepobjfound;
top^.ls^.VERBPfield^.prepobj2found := prepobj2found;
top^.ls^.VERBPfield^.nppredfound := nppredfound;
top^.ls^.VERBPfield^.adjppredfound := adjppredfound;
top^.ls^.VERBPfield^.prepppredfound := prepppredfound;
top^.ls^.VERBPfield^.strandedfound := strandedPPfound;
top^.ls^.VERBPfield^.vpcomplfound := VERBPcomplfound;
END (* passive *);
(*Active*)
IF (active IN possvoicesvar) AND
(voicevar <> passive)
THEN 
BEGIN
top:=MAKET_stree(VERBP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.VERBPfield^.req := reqvar;
top^.ls^.VERBPfield^.env := envvar;
top^.ls^.VERBPfield^.synvps := synvpsvar;
top^.ls^.VERBPfield^.adjuncts := adjunctsefsvar;
top^.ls^.VERBPfield^.thetavp := thetavpvar;
IF (modusvar IN [infinitive, ingform, participle])
THEN top^.ls^.VERBPfield^.finiteness := infinite
ELSE IF (modusvar IN [indicative,
subjunctive, omegamodus])
THEN top^.ls^.VERBPfield^.finiteness := finite; 
top^.ls^.VERBPfield^.modus := modusvar;
top^.ls^.VERBPfield^.persons := verbpersonsvar;
top^.ls^.VERBPfield^.numbers := verbnumbersvar;
top^.ls^.VERBPfield^.aspect := omegaaspect;
top^.ls^.VERBPfield^.retro := false;
IF (tensevar = omegatense) 
THEN top^.ls^.VERBPfield^.deixis := omegadeixis
ELSE IF (tensevar = presenttense) 
THEN top^.ls^.VERBPfield^.deixis := presentdeixis
ELSE IF (tensevar = pasttense)
THEN top^.ls^.VERBPfield^.deixis := pastdeixis;
top^.ls^.VERBPfield^.voice := active;
top^.ls^.VERBPfield^.synvpefs := synvpefsvar;
top^.ls^.VERBPfield^.classes := classesvar;
top^.ls^.VERBPfield^.headfound := headfound;
top^.ls^.VERBPfield^.foundauxes := foundauxesvar;
top^.ls^.VERBPfield^.Scomplfound := SENTcomplfound;
top^.ls^.VERBPfield^.reflexivity := reflexivityvar;
(* top^.ls^.VERBPfield^.infsort := ; *)
top^.ls^.VERBPfield^.objfound := objfound;
top^.ls^.VERBPfield^.indobjfound := indobjfound;
top^.ls^.VERBPfield^.locargfound := locargfound;
top^.ls^.VERBPfield^.dirargfound := dirargfound;
top^.ls^.VERBPfield^.prepobjfound := prepobjfound;
top^.ls^.VERBPfield^.prepobj2found := prepobj2found;
top^.ls^.VERBPfield^.nppredfound := nppredfound;
top^.ls^.VERBPfield^.adjppredfound := adjppredfound;
top^.ls^.VERBPfield^.prepppredfound := prepppredfound;
top^.ls^.VERBPfield^.strandedfound := strandedPPfound;
top^.ls^.VERBPfield^.vpcomplfound := VERBPcomplfound;
END; (* active *);
END; (*IF synvpefsvar <> []*)
END; (*final action*)
END; END;
END;
END;{package}
PACKAGE VERBNEGrulepack: [VERBNEGrulerule];
VAR
reqvar : LSDOMAINT_polaritysettype;
envvar : LSDOMAINT_polaritysettype;
conjclassesvar : LSDOMAINT_conjclassesettype;
ingformvar : LSDOMAINT_ingformtype;
sformvar : LSDOMAINT_sformtype;
affixvar : LSDOMAINT_affixtype;
modusvar : LSDOMAINT_modustype;
tensevar : LSDOMAINT_tensetype;
personsvar : LSDOMAINT_personsettype;
numbersvar : LSDOMAINT_numbersettype;
particlevar : LSDOMAINT_keytype;
possvoicesvar : LSDOMAINT_voicesettype;
reflexivityvar : LSDOMAINT_reflexivetype;
synvpsvar : LSDOMAINT_synpatternsettype;
thetavpvar : LSDOMAINT_thetavptype;
CaseAssignervar : LSDOMAINT_caseassignertype;
oblcontrolvar : LSDOMAINT_oblcontroltype;
prepkey1var : LSDOMAINT_keytype;
prepkey2var : LSDOMAINT_keytype;
controllervar : LSDOMAINT_controllertype;
classesvar : LSDOMAINT_classSETtype;
thatdelvar : LSDOMAINT_thatdeltype;
 
PROCEDURE VERBNEGrulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
reqvar := [pospol,negpol,omegapol];
envvar := [pospol,negpol,omegapol];
conjclassesvar := [10];
ingformvar := reging;
sformvar := regs;
affixvar := noaffix;
modusvar := omegamodus;
tensevar := omegatense;
personsvar := [];
numbersvar := [];
particlevar := 0;
possvoicesvar := [active,passive];
reflexivityvar := notreflexive;
synvpsvar := [];
thetavpvar := omegathetavp;
CaseAssignervar := true;
oblcontrolvar := omegaoblcontrol;
prepkey1var := 0;
prepkey2var := 0;
controllervar := none;
classesvar := [durativeclass];
thatdelvar := omegadel; 
END;
1: (* head/VERB *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.subc IN [modalverb, beverb, 
doaux, haveverb]) AND
((b^.ls^.VERBfield^.modus = indicative) OR
((b^.ls^.VERBfield^.modus = infinitive) AND
(b^.ls^.VERBfield^.subc = doaux)
)
) AND
( (b^.ls^.VERBfield^.subc <> beverb) OR
(b^.ls^.VERBfield^.persons <> [1]) OR
(b^.ls^.VERBfield^.numbers <> [singular]) )
);globcond: BEGIN  BEGIN
SYNREL := head;
conjclassesvar := b^.ls^.VERBfield^.conjclasses;
ingformvar := b^.ls^.VERBfield^.ingform;
sformvar := b^.ls^.VERBfield^.sform;
affixvar := b^.ls^.VERBfield^.affix;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
personsvar := b^.ls^.VERBfield^.persons;
numbersvar := b^.ls^.VERBfield^.numbers;
particlevar := b^.ls^.VERBfield^.particle;
possvoicesvar := b^.ls^.VERBfield^.possvoices;
reflexivityvar := b^.ls^.VERBfield^.reflexivity;
synvpsvar := b^.ls^.VERBfield^.synvps;
thetavpvar := b^.ls^.VERBfield^.thetavp;
CaseAssignervar:= b^.ls^.VERBfield^.CaseAssigner;
oblcontrolvar := b^.ls^.VERBfield^.oblcontrol;
prepkey1var := b^.ls^.VERBfield^.prepkey1;
prepkey2var := b^.ls^.VERBfield^.prepkey2;
controllervar := b^.ls^.VERBfield^.controller;
classesvar := b^.ls^.VERBfield^.classes;
thatdelvar := b^.ls^.VERBfield^.thatdel;
END
END; END;
2: (* gluerel/GLUE *)
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := gluerel;
END
END; END;
3: (* negrel/NEG *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NEGfield^.key = auxkey('notNEGkey')
) OR
(b^.ls^.NEGfield^.key = auxkey('not2NEGkey')
) (*for cannot*)
);globcond: BEGIN  BEGIN
SYNREL := negrel;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( true
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(VERB);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.VERBfield^.req := reqvar;
top^.ls^.VERBfield^.env := envvar;
top^.ls^.VERBfield^.conjclasses := conjclassesvar;
top^.ls^.VERBfield^.ingform := ingformvar;
top^.ls^.VERBfield^.sform := sformvar;
top^.ls^.VERBfield^.affix := affixvar;
top^.ls^.VERBfield^.modus := modusvar;
top^.ls^.VERBfield^.tense := tensevar;
top^.ls^.VERBfield^.persons := personsvar;
top^.ls^.VERBfield^.numbers := numbersvar;
top^.ls^.VERBfield^.particle := particlevar;
top^.ls^.VERBfield^.possvoices := possvoicesvar;
top^.ls^.VERBfield^.reflexivity := reflexivityvar;
top^.ls^.VERBfield^.synvps := synvpsvar;
top^.ls^.VERBfield^.thetavp := thetavpvar;
top^.ls^.VERBfield^.CaseAssigner := CaseAssignervar;
top^.ls^.VERBfield^.subc := notaux;
top^.ls^.VERBfield^.oblcontrol := oblcontrolvar;
top^.ls^.VERBfield^.prepkey1 := prepkey1var;
top^.ls^.VERBfield^.prepkey2 := prepkey2var;
top^.ls^.VERBfield^.controller := controllervar;
top^.ls^.VERBfield^.classes := classesvar;
top^.ls^.VERBfield^.thatdel := thatdelvar;
END
END; END;
END;
END;{package}
PACKAGE NP1rulepack: [NP1rulerule];
VAR 
classpar : LSDOMAINT_timeadvclasstype;
deixispar : LSDOMAINT_deixistype;
aspectpar : LSDOMAINT_aspecttype;
retropar : LSDOMAINT_retrotype;
definitepar : LSDOMAINT_deftype;
numberspar : LSDOMAINT_numbersettype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
posscomaspar : LSDOMAINT_posscomaSETtype;
actcomaspar : LSDOMAINT_posscomaSETtype;
thetanppar : LSDOMAINT_thetanptype;
nounpatternefspar : LSDOMAINT_synpatternSETtype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
genericpar : LSDOMAINT_generictype;
posspredpar : LSDOMAINT_posspredtype;
possnietnppar : LSDOMAINT_possnietnptype;
syntquantpar : LSDOMAINT_syntquanttype;
specQpar : LSDOMAINT_specQtype;
posspar : LSDOMAINT_posstype;
whdetfound : BOOLEAN;
qpfound : BOOLEAN;
genposs : BOOLEAN;
genreal : BOOLEAN;
possnumberspar : LSDOMAINT_numberSETtype;
detdefpar : LSDOMAINT_deftype;
detrelfound : BOOLEAN;
PROCEDURE NP1rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

(* moved to lssurfquo: FUNCTION QPunderDETP(T1:LSSTREE_pstree):BOOLEAN;
VAR result : BOOLEAN;
sonlist : LSSTREE_prelnode;
BEGIN
result := false;
sonlist := T1^.sons;
WHILE NOT (result) AND (sonlist <> NIL) DO
BEGIN
IF sonlist^.node^.cat = QP
THEN result := TRUE;
sonlist := sonlist^.brother;
END;
QPunderDETP := result;
END;*) {QPunderDETP}
(* moved to lssurfquo: FUNCTION GENunderNP(T1:LSSTREE_pstree):BOOLEAN;
VAR result : BOOLEAN;
sonlist : LSSTREE_prelnode;
BEGIN
result := false;
sonlist := T1^.sons;
WHILE NOT (result) AND (sonlist <> NIL) DO
BEGIN
IF sonlist^.node^.cat = GEN
THEN result := TRUE;
sonlist := sonlist^.brother;
END;
GENunderNP := result;
END;*) {GENunderNP}
(* moved to lssurfquo:
FUNCTION PNunderCN(T1:LSSTREE_pstree):BOOLEAN;
VAR result : BOOLEAN;
son,sonlist : LSSTREE_prelnode;
BEGIN
result := false;
sonlist := T1^.sons;
WHILE NOT (result) AND (sonlist <> NIL) DO
BEGIN
IF sonlist^.node^.cat = NOUN 
THEN BEGIN
result := TRUE;
son := sonlist^.node^.sons
END;
sonlist := sonlist^.brother
END;
IF result THEN result := (son <> NIL);
IF result 
THEN BEGIN
result := (son^.node^.cat = SUBNOUN);
IF result THEN son := son^.node^.sons;
END;
IF result THEN result := (son <> NIL);
IF result 
THEN BEGIN
result := (son^.node^.cat = BPROPERNOUN);
END;
PNunderCN := result;
END;*)

BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
classpar := omegatimeadvclass;
deixispar := omegadeixis;
aspectpar := omegaaspect;
retropar := false;
definitepar := omegadef;
numberspar := [singular,plural];
casespar := [nominative,accusative];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
posscomaspar := [];
actcomaspar := [count];
thetanppar := omegathetanp;
nounpatternefspar := [];
detnpmoodpar := nowh;
genericpar := omegageneric;
posspredpar := false;
possnietnppar := false;
syntquantpar := Omegaquant;
specQpar := yesspec; 
posspar := true;
possnumberspar := [singular,plural];
whdetfound := false;
qpfound := false;
genposs := true;
genreal := false;
detdefpar := omegadef;
detrelfound := false;
END;
1 :CASE mode OF (*possadj*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := detrel;
detrelfound := true;
detnpmoodpar := b^.ls^.POSSADJfield^.mood;
IF b^.ls^.POSSADJfield^.mood = wh 
THEN definitepar := indef
ELSE definitepar := def;
posspredpar := true;
posscomaspar := [count,mass];
END
END; END;
2 :CASE mode OF (*detp*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := detrel;
detrelfound := true;
qpfound := QPunderDETP(b);
possnietnppar := b^.ls^.DETPfield^.possnietnp;
definitepar := b^.ls^.DETPfield^.definite;
detdefpar := b^.ls^.DETPfield^.definite;
detnpmoodpar := b^.ls^.DETPfield^.mood;
IF b^.ls^.DETPfield^.mood = wh 
THEN WhDetFound := true;
posspredpar := b^.ls^.DETPfield^.posspred;
syntquantpar := b^.ls^.DETPfield^.syntquant; (*In NPrule omega *)
possnumberspar:= b^.ls^.DETPfield^.possnumbers;
posscomaspar := b^.ls^.DETPfield^.posscomas;
END
END; END;
3 :CASE mode OF (*np on genitive NP, PROPERNOUN, INDEFPRO*)
loccond:LIPRIMS_assignstatus( GENunderNP(b)
);globcond: BEGIN  BEGIN
SYNREL := detrel;
detrelfound := true;
genposs := false;
definitepar := def;
posspredpar := b^.ls^.NPfield^.posspred;
possnietnppar := b^.ls^.NPfield^.possnietnp;
posscomaspar := [count,mass];
detnpmoodpar := b^.ls^.NPfield^.mood;
syntquantpar := b^.ls^.NPfield^.syntquant; (*In NPrule only
for INDEFPRO*)
END
END; END;
4 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
IF definitepar = omegadef 
THEN definitepar := b^.ls^.CNfield^.definite;
classpar := b^.ls^.CNfield^.class;
deixispar := b^.ls^.CNfield^.deixis;
aspectpar := b^.ls^.CNfield^.aspect;
retropar := b^.ls^.CNfield^.retro;
numberspar := b^.ls^.CNfield^.numbers;
casespar := b^.ls^.CNfield^.cases;
genderspar := b^.ls^.CNfield^.genders;
sexespar := b^.ls^.CNfield^.sexes;
actsubcspar := b^.ls^.CNfield^.actsubcs;
temporalpar := b^.ls^.CNfield^.temporal;
animatepar := b^.ls^.CNfield^.animate;
humanpar := b^.ls^.CNfield^.human;
IF plural IN b^.ls^.CNfield^.numbers 
THEN actcomaspar := [count] 
ELSE IF posscomaspar = [count]
THEN actcomaspar := [count]
ELSE actcomaspar := b^.ls^.CNfield^.posscomas; 
thetanppar := b^.ls^.CNfield^.thetanp;
nounpatternefspar := b^.ls^.CNfield^.nounpatternefs;
posspar := b^.ls^.CNfield^.poss;
IF ((NOT detrelfound) AND
((plural IN b^.ls^.CNfield^.numbers) OR
(mass IN b^.ls^.CNfield^.posscomas)) )
THEN posspredpar := true;
END
END; END;
5 :CASE mode OF (* glue *)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := gluerel;
END
END; END;
6 :CASE mode OF (* gen *)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := modrel;
genreal := true;
END
END; END;
7 :CASE mode OF (* extrap/THANP *)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := extraposrel;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
IF ((singular IN possnumberspar) AND
(singular IN numberspar)) THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := singular;
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
IF (detrelfound OR genreal) 
THEN top^.ls^.NPfield^.definite := definitepar
ELSE top^.ls^.NPfield^.definite := indef;
IF genreal 
THEN top^.ls^.NPfield^.cases := []
ELSE top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
IF (posscomaspar = []) 
THEN top^.ls^.NPfield^.actcomas := actcomaspar 
ELSE IF ((actcomaspar <> [count]) AND 
(mass in posscomaspar))
THEN top^.ls^.NPfield^.actcomas := [mass]
ELSE IF ((actcomaspar <> [count]) AND 
NOT (mass in posscomaspar))
THEN top^.ls^.NPfield^.actcomas := [count];
(*Is this correct MJS*)
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.generic := genericpar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.syntquant:= syntquantpar;
top^.ls^.NPfield^.NPhead := otherNP;
top^.ls^.NPfield^.specQ := specQpar;
IF genposs = true THEN 
top^.ls^.NPfield^.poss := posspar ELSE
top^.ls^.NPfield^.poss := false;
END; (*singular*)
IF ((plural IN possnumberspar) AND
(plural IN numberspar)) THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := plural;
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
IF (detrelfound OR genreal) 
THEN top^.ls^.NPfield^.definite := definitepar
ELSE top^.ls^.NPfield^.definite := indef;
IF genreal 
THEN top^.ls^.NPfield^.cases := []
ELSE top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := actcomaspar;
(*Is this correct MJS*)
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.generic := genericpar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := otherNP;
top^.ls^.NPfield^.specQ := specQpar;
IF genposs = true THEN 
top^.ls^.NPfield^.poss := posspar ELSE
top^.ls^.NPfield^.poss := false;
END; (*plural*)
END (*action*)
END; END;
END;
END;{package}
PACKAGE NP2rulepack: [NP2rulerule];
VAR 
classpar : LSDOMAINT_timeadvclasstype;
aspectpar : LSDOMAINT_aspecttype;
deixispar : LSDOMAINT_deixistype;
retropar : LSDOMAINT_retrotype;
definitepar : LSDOMAINT_deftype;
personpar : LSDOMAINT_persontype;
numberspar : LSDOMAINT_numberSETtype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
actcomaspar : LSDOMAINT_posscomasettype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
genericpar : LSDOMAINT_generictype;
posspredpar : LSDOMAINT_posspredtype;
possnietnppar : LSDOMAINT_possnietnptype;
syntquantpar : LSDOMAINT_syntquanttype;
NPheadpar : LSDOMAINT_NPheadtype;
specQpar : LSDOMAINT_specQtype;
posspar : LSDOMAINT_posstype;
modpossPROfound : BOOLEAN;
genposs : BOOLEAN;
genreal : BOOLEAN;

PROCEDURE NP2rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
classpar := omegatimeadvclass;
aspectpar := omegaaspect;
deixispar := omegadeixis;
retropar := false;
definitepar := omegadef;
personpar := 3;
numberspar := [];
casespar := [nominative,accusative];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
actcomaspar := [count];
detnpmoodpar := nowh;
genericpar := omegageneric;
posspredpar := false;
possnietnppar := false;
syntquantpar := Omegaquant;
NPheadpar := otherNP;
specQpar := omegaspec; 
posspar := false;
modpossPROfound := false;
genposs := true;
genreal := false;
END;
1 :CASE mode OF (*dempro*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
genposs := false;
definitepar := def;
actcomaspar := [];
numberspar := [b^.ls^.DEMPROfield^.number];
specQpar := yesspec;
IF b^.ls^.DEMPROfield^.key = auxkey('thatDEMPROkey')

THEN NPheadpar := thatNP
ELSE IF b^.ls^.DEMPROfield^.key = auxkey('thisDEMPROkey')

THEN NPheadpar := thisNP
ELSE IF b^.ls^.DEMPROfield^.key = auxkey('theseDEMPROkey')

THEN NPheadpar := theseNP
ELSE IF b^.ls^.DEMPROfield^.key = auxkey('thoseDEMPROkey')

THEN NPheadpar := thoseNP;
(* ELSE default *)
END
END; END;
2 :CASE mode OF (*perspro*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
genposs := false;
definitepar := def;
personpar := b^.ls^.PERSPROfield^.person;
numberspar := [b^.ls^.PERSPROfield^.number];
casespar := [b^.ls^.PERSPROfield^.persprocase];
genderspar := [b^.ls^.PERSPROfield^.gender];
animatepar := b^.ls^.PERSPROfield^.animate;
NPheadpar := b^.ls^.PERSPROfield^.NPhead;
specQpar := yesspec;
posspredpar := true;
END
END; END;
3 :CASE mode OF (*indefpro*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
(*genposs remains true*)
modpossPROfound := true;
definitepar := b^.ls^.INDEFPROfield^.definite;
numberspar := [b^.ls^.INDEFPROfield^.number];
posspar := b^.ls^.INDEFPROfield^.poss;
possnietnppar := b^.ls^.INDEFPROfield^.possnietnp;
syntquantpar := b^.ls^.INDEFPROfield^.syntquant;
animatepar := b^.ls^.INDEFPROfield^.animate;
NPheadpar := b^.ls^.INDEFPROfield^.NPhead;
posspredpar := true;
specQpar := yesspec;
IF b^.ls^.INDEFPROfield^.NPhead = ONEnp THEN
casespar := [nominative];
END
END; END;
4 :CASE mode OF (*whpro*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
genposs := false;
modpossPROfound := true;
posspredpar := true;
definitepar := indef;
detnpmoodpar := wh;
numberspar := [b^.ls^.WHPROfield^.number];
sexespar := b^.ls^.WHPROfield^.sexes; 
animatepar := b^.ls^.WHPROfield^.animate;
posspar := b^.ls^.WHPROfield^.poss;
specQpar := yesspec;
IF b^.ls^.WHPROfield^.animate = noanimate
THEN BEGIN
NPheadpar := whatWHPRONP;
humanpar := nohuman;
END
ELSE BEGIN
humanpar := yeshuman;
casespar := b^.ls^.WHPROfield^.cases;
END;
END
END; END;
5 :CASE mode OF (*propernoun*)
loccond:LIPRIMS_assignstatus( singular IN b^.ls^.PROPERNOUNfield^.numbers
);globcond: BEGIN  BEGIN
SYNREL := head;
(*genposs remains true*)
modpossPROfound := true;
numberspar := [singular];
sexespar := b^.ls^.PROPERNOUNfield^.sexes;
actsubcspar := [b^.ls^.PROPERNOUNfield^.subc];
animatepar := b^.ls^.PROPERNOUNfield^.animate;
humanpar := b^.ls^.PROPERNOUNfield^.human;
genderspar := b^.ls^.PROPERNOUNfield^.genders;
posspar := b^.ls^.PROPERNOUNfield^.poss;
temporalpar := b^.ls^.PROPERNOUNfield^.temporal;
posspredpar := true;
definitepar := def;
specQpar := yesspec;
classpar := b^.ls^.PROPERNOUNfield^.class;
aspectpar := b^.ls^.PROPERNOUNfield^.aspect;
deixispar := b^.ls^.PROPERNOUNfield^.deixis;
retropar := b^.ls^.PROPERNOUNfield^.retro;
END
END; END;
6 :CASE mode OF (*recipro*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
(*genposs remains true. Is that correct MJS*)
numberspar := [plural];
definitepar := def;
casespar := [accusative];
specQpar := yesspec; 
NPheadpar := reciproNP;
END
END; END;
7 :CASE mode OF (*posspro*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
genposs := false;
numberspar := [singular,plural];
definitepar := def;
specQpar := yesspec; 
posspredpar := true;
END
END; END;
8 :CASE mode OF (*glue*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := gluerel;
END
END; END;
9 :CASE mode OF (*gen*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := modrel;
genreal := true;
END
END; END;
10 :CASE mode OF (*prepp*)
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.stranded = false) AND
(b^.ls^.PREPPfield^.headkey = auxkey('ofPREPkey')
) 
);globcond: BEGIN  BEGIN
SYNREL := possrel;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
IF singular IN numberspar THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.retro := retropar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := personpar;
top^.ls^.NPfield^.number := singular;
IF genreal 
THEN top^.ls^.NPfield^.cases := []
ELSE top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar; 
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.animate := animatepar; 
top^.ls^.NPfield^.human := humanpar; 
top^.ls^.NPfield^.actcomas := actcomaspar;
top^.ls^.NPfield^.thetanp := omegathetanp;
top^.ls^.NPfield^.nounpatternefs := [];
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.generic := genericpar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := NPheadpar;
top^.ls^.NPfield^.specQ := specQpar;
top^.ls^.NPfield^.poss := posspar; 
END; (*singular*)
IF plural IN numberspar THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.retro := retropar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := personpar;
top^.ls^.NPfield^.number := plural;
IF genreal 
THEN top^.ls^.NPfield^.cases := []
ELSE top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar; 
top^.ls^.NPfield^.actsubcs := [othernoun];
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.animate := animatepar; 
top^.ls^.NPfield^.human := humanpar; 
top^.ls^.NPfield^.actcomas := actcomaspar;
top^.ls^.NPfield^.thetanp := omegathetanp;
top^.ls^.NPfield^.nounpatternefs := [];
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.generic := genericpar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := NPheadpar;
top^.ls^.NPfield^.specQ := specQpar;
top^.ls^.NPfield^.poss := posspar; 
END; (*plural*)
END (*action*)
END; END;
END;
END;{package}
PACKAGE NP3rulepack: [NP3rulerule];
VAR 
classpar : LSDOMAINT_timeadvclasstype;
aspectpar : LSDOMAINT_aspecttype;
deixispar : LSDOMAINT_deixistype;
retropar : LSDOMAINT_retrotype;
definitepar : LSDOMAINT_deftype;
personpar : LSDOMAINT_persontype;
numberpar : LSDOMAINT_numbertype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
actcomaspar : LSDOMAINT_posscomaSETtype;
thetanppar : LSDOMAINT_thetanptype;
nounpatternefspar : LSDOMAINT_synpatternSETtype;
posspredpar : LSDOMAINT_posspredtype;
possnietnppar : LSDOMAINT_possnietnptype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
genericpar : LSDOMAINT_generictype;
syntquantpar : LSDOMAINT_syntquanttype;
NPheadpar : LSDOMAINT_NPheadtype;
specQpar : LSDOMAINT_specQtype;
posspar : LSDOMAINT_posstype;
advfound : BOOLEAN;
PROCEDURE NP3rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

FUNCTION INDEFunderNP(T1:LSSTREE_pstree):BOOLEAN;
VAR result : BOOLEAN;
sonlist : LSSTREE_prelnode;
BEGIN
result := false;
sonlist := T1^.sons;
WHILE NOT (result) AND (sonlist <> NIL) DO
BEGIN
IF sonlist^.node^.cat = INDEFPRO
THEN IF sonlist^.relation = head
THEN result := TRUE;
sonlist := sonlist^.brother;
END;
INDEFunderNP := result;
END; {INDEFunderNP}

BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
classpar := omegatimeadvclass;
aspectpar := omegaaspect;
deixispar := omegadeixis;
retropar := false;
definitepar := omegadef;
personpar := 3;
numberpar := singular;
casespar := [];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
actcomaspar := [count];
thetanppar := omegathetanp;
nounpatternefspar := [];
posspredpar := false;
possnietnppar := false;
detnpmoodpar := nowh;
genericpar := omegageneric;
syntquantpar := Omegaquant;
NPheadpar := otherNP;
specQpar := omegaspec;
posspar := true;
advfound := false;
END;
1 :CASE mode OF
loccond:LIPRIMS_assignstatus( PreXPAdv IN b^.ls^.ADVPfield^.actsubcefs
);globcond: BEGIN  BEGIN
SYNREL := modrel;
advfound := true;
END
END; END;
2 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.mood = nowh) AND
NOT INDEFunderNP(b)
);globcond: BEGIN  BEGIN
SYNREL := head;
classpar := b^.ls^.NPfield^.class;
aspectpar := b^.ls^.NPfield^.aspect;
deixispar := b^.ls^.NPfield^.deixis;
retropar := b^.ls^.NPfield^.retro;
definitepar := b^.ls^.NPfield^.definite;
personpar := b^.ls^.NPfield^.person;
numberpar := b^.ls^.NPfield^.number;
casespar := b^.ls^.NPfield^.cases;
genderspar := b^.ls^.NPfield^.genders;
sexespar := b^.ls^.NPfield^.sexes;
actsubcspar := b^.ls^.NPfield^.actsubcs;
temporalpar := b^.ls^.NPfield^.temporal;
posspar := b^.ls^.NPfield^.poss;
animatepar := b^.ls^.NPfield^.animate;
humanpar := b^.ls^.NPfield^.human;
actcomaspar := b^.ls^.NPfield^.actcomas;
thetanppar := b^.ls^.NPfield^.thetanp;
nounpatternefspar := b^.ls^.NPfield^.nounpatternefs; 
posspredpar := b^.ls^.NPfield^.posspred;
possnietnppar := b^.ls^.NPfield^.possnietnp;
detnpmoodpar := b^.ls^.NPfield^.mood;
genericpar := b^.ls^.NPfield^.generic;
syntquantpar := b^.ls^.NPfield^.syntquant;
NPheadpar := b^.ls^.NPfield^.NPhead;
specQpar := b^.ls^.NPfield^.specQ;
END
END; END;
3 :CASE mode OF
loccond:LIPRIMS_assignstatus( PostXPAdv IN b^.ls^.ADVPfield^.actsubcefs
);globcond: BEGIN  BEGIN
SYNREL := postmodrel;
advfound := true;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( advfound
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.retro := retropar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.person := personpar;
top^.ls^.NPfield^.number := numberpar;
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := actsubcspar;
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.poss := posspar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := actcomaspar;
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp:= possnietnppar;
top^.ls^.NPfield^.mood := detnpmoodpar; 
top^.ls^.NPfield^.generic := genericpar;
top^.ls^.NPfield^.syntquant := syntquantpar;
top^.ls^.NPfield^.NPhead := NPheadpar;
top^.ls^.NPfield^.specQ := specQpar;
END
END; END;
END;
END;{package}
PACKAGE NP4rulepack: [NP4rulerule];
VAR 
classpar : LSDOMAINT_timeadvclasstype;
deixispar : LSDOMAINT_deixistype;
aspectpar : LSDOMAINT_aspecttype;
retropar : LSDOMAINT_retrotype;
definitepar : LSDOMAINT_deftype;
numberspar : LSDOMAINT_numbersettype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
posscomaspar : LSDOMAINT_posscomaSETtype;
actcomaspar : LSDOMAINT_posscomaSETtype;
thetanppar : LSDOMAINT_thetanptype;
nounpatternefspar : LSDOMAINT_synpatternSETtype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
genericpar : LSDOMAINT_generictype;
posspredpar : LSDOMAINT_posspredtype;
possnietnppar : LSDOMAINT_possnietnptype;
syntquantpar : LSDOMAINT_syntquanttype;
specQpar : LSDOMAINT_specQtype;
posspar : LSDOMAINT_posstype;
whdetfound : BOOLEAN;
qpfound : BOOLEAN;
genposs : BOOLEAN;
genreal : BOOLEAN;
possnumberspar : LSDOMAINT_numberSETtype;
detdefpar : LSDOMAINT_deftype;
detrelfound : BOOLEAN;

PROCEDURE NP4rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
classpar := omegatimeadvclass;
deixispar := omegadeixis;
aspectpar := omegaaspect;
retropar := false;
definitepar := omegadef;
numberspar := [singular,plural];
casespar := [nominative,accusative];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
posscomaspar := [];
actcomaspar := [count];
thetanppar := omegathetanp;
nounpatternefspar := [];
detnpmoodpar := nowh;
genericpar := omegageneric;
posspredpar := false;
possnietnppar := false;
syntquantpar := Omegaquant;
specQpar := yesspec; 
posspar := true;
possnumberspar := [singular,plural];
whdetfound := false;
qpfound := false;
genposs := true;
genreal := false;
detdefpar := omegadef;
detrelfound := false;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
IF singular IN possnumberspar THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := singular;
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := [othernoun];
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := [count];
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.generic := genericpar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.syntquant:= syntquantpar;
top^.ls^.NPfield^.NPhead := thereNP;
top^.ls^.NPfield^.specQ := yesspec;
top^.ls^.NPfield^.poss := TRUE;
END; (*singular*)
IF plural IN possnumberspar THEN
BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := plural;
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
top^.ls^.NPfield^.definite := definitepar;
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := [othernoun];
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := [count];
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.generic := genericpar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.syntquant:= syntquantpar;
top^.ls^.NPfield^.NPhead := thereNP;
top^.ls^.NPfield^.specQ := yesspec;
top^.ls^.NPfield^.poss := TRUE;
END; (*plural*)
END (*action*)
END; END;
END;
END;{package}
PACKAGE NP5rulepack: [NP5rulerule];
VAR 
classpar : LSDOMAINT_timeadvclasstype;
deixispar : LSDOMAINT_deixistype;
aspectpar : LSDOMAINT_aspecttype;
retropar : LSDOMAINT_retrotype;
infsortvar : LSDOMAINT_inftype;
definitepar : LSDOMAINT_deftype;
numberspar : LSDOMAINT_numbersettype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
posscomaspar : LSDOMAINT_posscomaSETtype;
actcomaspar : LSDOMAINT_posscomaSETtype;
thetanppar : LSDOMAINT_thetanptype;
nounpatternefspar : LSDOMAINT_synpatternSETtype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
genericpar : LSDOMAINT_generictype;
posspredpar : LSDOMAINT_posspredtype;
possnietnppar : LSDOMAINT_possnietnptype;
syntquantpar : LSDOMAINT_syntquanttype;
specQpar : LSDOMAINT_specQtype;
posspar : LSDOMAINT_posstype;
whdetfound : BOOLEAN;
qpfound : BOOLEAN;
genposs : BOOLEAN;
genreal : BOOLEAN;
possnumberspar : LSDOMAINT_numberSETtype;
detdefpar : LSDOMAINT_deftype;
detrelfound : BOOLEAN;

PROCEDURE NP5rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
classpar := omegatimeadvclass;
deixispar := omegadeixis;
aspectpar := omegaaspect;
retropar := false;
definitepar := omegadef;
numberspar := [singular,plural];
casespar := [nominative,accusative];
infsortvar := omegainf;
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
posscomaspar := [];
actcomaspar := [count];
thetanppar := omegathetanp;
nounpatternefspar := [];
detnpmoodpar := nowh;
genericpar := omegageneric;
posspredpar := false;
possnietnppar := false;
syntquantpar := Omegaquant;
specQpar := yesspec; 
posspar := true;
possnumberspar := [singular,plural];
whdetfound := false;
qpfound := false;
genposs := true;
genreal := false;
detdefpar := omegadef;
detrelfound := false;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.mood = declarative) AND
(b^.ls^.SENTENCEfield^.senttype = subordinateclause) AND
(b^.ls^.SENTENCEfield^.modus = ingform) AND
(b^.ls^.SENTENCEfield^.infsort IN [possing,opening]) AND
(NOT b^.ls^.SENTENCEfield^.adverbial)
);globcond: BEGIN  BEGIN
SYNREL := head;
infsortvar := b^.ls^.SENTENCEfield^.infsort;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.number := singular;
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.class := classpar;
top^.ls^.NPfield^.deixis := deixispar;
top^.ls^.NPfield^.aspect := aspectpar;
top^.ls^.NPfield^.retro := retropar;
top^.ls^.NPfield^.definite := def;
top^.ls^.NPfield^.cases := casespar;
top^.ls^.NPfield^.person := 3; 
top^.ls^.NPfield^.genders := genderspar;
top^.ls^.NPfield^.sexes := sexespar;
top^.ls^.NPfield^.actsubcs := [othernoun];
top^.ls^.NPfield^.temporal := temporalpar;
top^.ls^.NPfield^.animate := animatepar;
top^.ls^.NPfield^.human := humanpar;
top^.ls^.NPfield^.actcomas := [count];
top^.ls^.NPfield^.thetanp := thetanppar;
top^.ls^.NPfield^.nounpatternefs := nounpatternefspar;
top^.ls^.NPfield^.mood := detnpmoodpar;
top^.ls^.NPfield^.generic := genericpar;
top^.ls^.NPfield^.posspred := posspredpar;
top^.ls^.NPfield^.possnietnp := possnietnppar;
top^.ls^.NPfield^.syntquant := syntquantpar;
IF infsortvar = possing THEN
top^.ls^.NPfield^.NPhead := sentNP;
IF infsortvar = opening THEN
top^.ls^.NPfield^.NPhead := openingNP;
top^.ls^.NPfield^.specQ := yesspec;
top^.ls^.NPfield^.poss := TRUE;
END (*action*)
END; END;
END;
END;{package}
PACKAGE CN1rulepack: [CN1rulerule];
VAR 
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
posspar : LSDOMAINT_posstype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
posscomaspar: LSDOMAINT_posscomaSETtype;
thetanppar : LSDOMAINT_thetanptype;
nounpatternefspar : LSDOMAINT_synpatternSETtype;
prepkeypar : LSDOMAINT_keytype;
sORpostmodfound : BOOLEAN;
COMPLexpected : BOOLEAN;
nonhumannounexpected : BOOLEAN;

PROCEDURE CN1rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
classpar := omegaTimeAdvClass; 
deixispar := omegadeixis; 
aspectpar := omegaAspect; 
retropar := false; 
definitepar := omegadef; 
numberspar := [singular]; 
casespar := [nominative, accusative];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
posspar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
posscomaspar:= [count];
thetanppar := omegathetanp;
nounpatternefspar := [];
prepkeypar := 0;
COMPLexpected := false;
sORpostmodfound := false;
nonhumannounexpected := false;
END;
1 (* modrel/ADJP *)
:CASE mode OF
loccond:LIPRIMS_assignstatus( attributive in b^.ls^.ADJPfield^.actuseefs 
(* restrictions on adjsubc *)
);globcond: BEGIN  BEGIN
SYNREL := modrel
END
END; END;
5 (* modrel/DETP *)
:CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.DETPfield^.definite = indef) AND
(b^.ls^.DETPfield^.mood = nowh)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
definitepar := def;
posscomaspar := b^.ls^.DETPfield^.posscomas
END
END; END;
16 (* Modrel/SENTENCE*)
:CASE mode OF 
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.PROsubject = true) AND
(b^.ls^.SENTENCEfield^.mood = anterelative) AND
(b^.ls^.SENTENCEfield^.modus = ingform)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
END
END; END;
2 (* head/NOUN *)
:CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
classpar := b^.ls^.NOUNfield^.class;
deixispar := b^.ls^.NOUNfield^.deixis;
aspectpar := b^.ls^.NOUNfield^.aspect;
retropar := b^.ls^.NOUNfield^.retro; 
genderspar := b^.ls^.NOUNfield^.genders;
numberspar := b^.ls^.NOUNfield^.numbers;
sexespar := b^.ls^.NOUNfield^.sexes;
actsubcspar := b^.ls^.NOUNfield^.subcs;
temporalpar := b^.ls^.NOUNfield^.temporal;
posspar := b^.ls^.NOUNfield^.poss;
animatepar := b^.ls^.NOUNfield^.animate;
humanpar := b^.ls^.NOUNfield^.human;
posscomaspar := b^.ls^.NOUNfield^.posscomas;
thetanppar := b^.ls^.NOUNfield^.thetanp;
nounpatternefspar := b^.ls^.NOUNfield^.nounpatterns;
prepkeypar := b^.ls^.NOUNfield^.prepkey;
IF b^.ls^.NOUNfield^.thetanp <> omegathetanp
THEN COMPLexpected := TRUE;
END
END; END;
3 :CASE mode OF (* postmodrel/PREPP *)
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.stranded = false) AND
((b^.ls^.PREPPfield^.headkey = auxkey('ofPREPkey')
) OR
(b^.ls^.PREPPfield^.actsubcefs * [loc, dir, temp, 
comitative, voorfor] <> [])) AND
(b^.ls^.PREPPfield^.coord <> corrcoord) AND
(b^.ls^.PREPPfield^.mood = nowh) 
);globcond: BEGIN  BEGIN
SYNREL := postmodrel;
sORpostmodfound := true;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.SENTENCEfield^.mood = relative
);globcond: BEGIN  BEGIN
SYNREL := postmodrel;
END
END; END;
14 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.mood = nowh ) AND
(NOT b^.ls^.PREPPfield^.stranded) (*JO*) AND
(b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := prepobjrel; 
sORpostmodfound := true;
END
END; END;
15 :CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := complrel;
END
END; END;
13 :CASE mode OF
loccond:LIPRIMS_assignstatus( (singular IN b^.ls^.PROPERNOUNfield^.numbers ) 
);globcond: BEGIN  BEGIN
SYNREL := modrel;
nonhumannounexpected := true;
END
END; END;
17 :CASE mode OF
loccond:LIPRIMS_assignstatus( (singular IN b^.ls^.PROPERNOUNfield^.numbers )
);globcond: BEGIN  BEGIN
SYNREL := postmodrel;
sORpostmodfound := true;
END
END; END;
18 :CASE mode OF (* modrel/PREPP: bag of potatoes *)
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.stranded = false) AND
(b^.ls^.PREPPfield^.headkey = auxkey('ofPREPkey')
) AND
(b^.ls^.PREPPfield^.coord <> corrcoord) AND
(b^.ls^.PREPPfield^.mood = nowh) 
);globcond: BEGIN  BEGIN
SYNREL := modrel;
END
END; END;
9 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.mood = nowh) AND
(b^.ls^.ADVPfield^.actsubcefs * 
[Locadv, DirAdv, TempAdv,
causadv] <> []) AND
(b^.ls^.ADVPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := postmodrel;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( nonhumannounexpected <= (humanpar <> yeshuman)
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(CN);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
IF sORpostmodfound THEN
actsubcspar := actsubcspar - [unitnoun];
(* to block '*three year/years in Beiroet ago'*)
top^.ls^.CNfield^.class := classpar;
top^.ls^.CNfield^.deixis := deixispar;
top^.ls^.CNfield^.aspect := aspectpar;
top^.ls^.CNfield^.retro := retropar; 
top^.ls^.CNfield^.definite := definitepar;
top^.ls^.CNfield^.numbers := numberspar;
top^.ls^.CNfield^.genders := genderspar; 
top^.ls^.CNfield^.sexes := sexespar;
top^.ls^.CNfield^.actsubcs := actsubcspar;
top^.ls^.CNfield^.temporal := temporalpar;
top^.ls^.CNfield^.poss := posspar;
top^.ls^.CNfield^.animate := animatepar;
top^.ls^.CNfield^.human := humanpar;
top^.ls^.CNfield^.posscomas := posscomaspar;
top^.ls^.CNfield^.thetanp := thetanppar;
top^.ls^.CNfield^.nounpatternefs := nounpatternefspar;
top^.ls^.CNfield^.cases := casespar;
END
END; END;
END;
END;{package}
PACKAGE DETPrulepack: [DETPrulerule];
VAR definitepar : LSDOMAINT_deftype;
posspredpar : LSDOMAINT_posspredtype;
possnumberspar: LSDOMAINT_numberSETtype;
posscomaspar : LSDOMAINT_posscomaSETtype;
detnpmoodpar : LSDOMAINT_xpmoodtype;
possnietnppar : LSDOMAINT_possnietnptype;
syntquantpar : LSDOMAINT_syntquanttype;

PROCEDURE DETPrulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
definitepar := omegadef;
posspredpar := false;
possnumberspar := [singular]; 
posscomaspar := [count];
detnpmoodpar := nowh;
possnietnppar := false;
syntquantpar := Omegaquant; (* hoeft niet veranderd
attribuut vervult geen rol 
meer *)
END;
1 :CASE mode OF (*num*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
definitepar := indef;
possnumberspar := b^.ls^.NUMfield^.numbers;
posspredpar := true;
END
END; END;
2 :CASE mode OF (*det*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
definitepar := b^.ls^.DETfield^.definite; 
posspredpar := b^.ls^.DETfield^.posspred; 
possnumberspar := b^.ls^.DETfield^.possnumbers; 
posscomaspar := b^.ls^.DETfield^.posscomas; 
detnpmoodpar := b^.ls^.DETfield^.mood;
possnietnppar := b^.ls^.DETfield^.possnietnp;
END
END; END;
3 :CASE mode OF (*demadj*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
definitepar := def;
possnumberspar := [b^.ls^.DEMADJfield^.number];
posspredpar := true;
END
END; END;
4 :CASE mode OF (*QP*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
definitepar := b^.ls^.QPfield^.definite;
posspredpar := b^.ls^.QPfield^.posspred;
possnumberspar := b^.ls^.QPfield^.possnumbers;
posscomaspar := b^.ls^.QPfield^.posscomas;
detnpmoodpar := b^.ls^.QPfield^.mood
END
END; END;
5 :CASE mode OF (*art*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
definitepar := b^.ls^.ARTfield^.definite;
possnumberspar := b^.ls^.ARTfield^.possnumbers;
posscomaspar := b^.ls^.ARTfield^.posscomas;
posspredpar := true;
IF b^.ls^.ARTfield^.definite = indef
THEN possnietnppar := true;
END
END; END;
6 :CASE mode OF (* detp *)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := modrel;
definitepar := adef;
possnietnppar := b^.ls^.DETPfield^.possnietnp;
posspredpar := b^.ls^.DETPfield^.posspred;
detnpmoodpar := b^.ls^.DETPfield^.mood;
posscomaspar := b^.ls^.DETPfield^.posscomas;
(* possnumberspar voor none en one *)
END
END; END;
7 :CASE mode OF (* prep *)
loccond:LIPRIMS_assignstatus( b^.ls^.PREPfield^.key = auxkey('ofprepkey')

);globcond: BEGIN  BEGIN
SYNREL := partrel
END
END; END; 
8 :CASE mode OF (* detp *)
loccond:LIPRIMS_assignstatus( (b^.ls^.DETPfield^.definite = def)
);globcond: BEGIN  BEGIN
SYNREL := head;
possnumberspar := b^.ls^.DETPfield^.possnumbers;
END
END; END;
9 :CASE mode OF (* np *)
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.definite = def) AND
GENunderNP(b)
);globcond: BEGIN  BEGIN
SYNREL := head;
possnumberspar := [singular, plural];
END
END; END;
10 :CASE mode OF (* possadj *)
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := head;
possnumberspar := [singular, plural];
END
END; END;
11 :CASE mode OF (* cardinal *)
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := head;
possnumberspar := b^.ls^.CARDfield^.possnumbers;
definitepar := indef;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(DETP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.DETPfield^.definite := definitepar;
top^.ls^.DETPfield^.posspred := posspredpar;
top^.ls^.DETPfield^.possnumbers := possnumberspar;
top^.ls^.DETPfield^.posscomas := posscomaspar;
top^.ls^.DETPfield^.mood := detnpmoodpar;
top^.ls^.DETPfield^.possnietnp := possnietnppar;
top^.ls^.DETPfield^.syntquant := syntquantpar;
top^.ls^.DETPfield^.superdeixis := omegadeixis;
END
END; END;
END;
END;{package}
PACKAGE PREPPrulepack: [PREPPrulerule];
VAR
actsubcefsvar : LSDOMAINT_prepsubceffsettype;
adjpfound : BOOLEAN;
advpfound : BOOLEAN;
aspectvar : LSDOMAINT_aspecttype;
classvar : LSDOMAINT_timeadvclasstype;
complfound : BOOLEAN;
deixisvar : LSDOMAINT_deixistype;
headkeyvar : LSDOMAINT_keytype;
moodvar : LSDOMAINT_xpmoodtype;
npfound : BOOLEAN;
npheadvar : LSDOMAINT_npheadtype;
ppfound : BOOLEAN;
retrovar : LSDOMAINT_retrotype;
sentfound : BOOLEAN;
specQvar : LSDOMAINT_specQtype;
strandedvar : BOOLEAN;
synppefsvar : LSDOMAINT_synpatterneffsettype;
thetappvar : LSDOMAINT_thetapptype; 
 
PROCEDURE PREPPrulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
actsubcefsvar := [];
adjpfound := FALSE;
advpfound := FALSE;
aspectvar := omegaAspect;
classvar := omegaTimeAdvClass;
complfound := FALSE;
deixisvar := omegadeixis;
headkeyvar := 0;
moodvar := nowh;
npfound := FALSE;
npheadvar := otherNP;
ppfound := FALSE;
retrovar := false;
sentfound := FALSE;
specQvar := omegaspec;
strandedvar := FALSE;
synppefsvar := [];
thetappvar := omegathetapp; 
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := head;
actsubcefsvar := b^.ls^.PREPfield^.subcs;
synppefsvar := b^.ls^.PREPfield^.synpps;
headkeyvar := b^.ls^.PREPfield^.key;
classvar := b^.ls^.PREPfield^.class;
deixisvar := b^.ls^.PREPfield^.deixis;
aspectvar := b^.ls^.PREPfield^.aspect;
retrovar := b^.ls^.PREPfield^.retro;
thetappvar := b^.ls^.PREPfield^.thetapp;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.cases * [accusative] <> [])
);globcond: BEGIN  BEGIN
SYNREL := objrel;
moodvar := b^.ls^.NPfield^.mood;
specQvar := b^.ls^.NPfield^.specQ;
npheadvar := b^.ls^.NPfield^.nphead;
complfound := TRUE;
npfound := TRUE;
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (preppadv IN b^.ls^.ADVPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.nphead = otherNP) AND
(unitnoun IN b^.ls^.NPfield^.actsubcs)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
END
END; END;
5: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ((b^.ls^.PREPPfield^.actsubcefs * [loc, temp] <> []) AND
(NOT b^.ls^.PREPPfield^.stranded)
)
);globcond: BEGIN  BEGIN
SYNREL := objrel;
complfound := TRUE;
ppfound := TRUE;
specQvar := yesspec;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs * [locadv, tempadv] <> [])
);globcond: BEGIN  BEGIN
SYNREL := objrel;
complfound := TRUE;
advpfound := TRUE;
specQvar := yesspec;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (predicative IN b^.ls^.ADJPfield^.actuseefs)
);globcond: BEGIN  BEGIN
SYNREL := predrel;
complfound := TRUE;
adjpfound := TRUE;
specQvar := yesspec;
END
END; END;
8: 
CASE mode OF
loccond:LIPRIMS_assignstatus(( b^.ls^.SENTENCEfield^.senttype = subordinateclause ) AND
(( b^.ls^.SENTENCEfield^.mood IN [whinterrogative,yesnointerrogative]) OR
( b^.ls^.SENTENCEfield^.infsort IN [accing]))
);globcond: BEGIN  BEGIN
SYNREL := predrel;
complfound := TRUE;
sentfound := TRUE;
specQvar := yesspec;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( true
);IF LIPRIMS_status THEN BEGIN
IF (NOT complfound) AND
(synppefsvar * [synnovpargs] <> [])
THEN synppefsvar := synppefsvar * [synnovpargs];
IF (NOT complfound) AND
(synppefsvar * [synNP] <> [])
THEN BEGIN
synppefsvar := synppefsvar * [synNP];
strandedvar := TRUE;
END;
IF npfound
THEN BEGIN
IF (npheadvar = openingnp) THEN 
synppefsvar := synppefsvar * [synOPENGERUND]
ELSE synppefsvar := synppefsvar * [synNP];
END;
IF adjpfound 
THEN synppefsvar := synppefsvar * [synOPENADJPPROP, 
synCLOSEDADJPPROP];
IF advpfound
THEN synppefsvar := synppefsvar * [synLOCPREPP];
IF ppfound
THEN synppefsvar := synppefsvar * [synLOCPREPP];
IF sentfound
THEN synppefsvar := synppefsvar * [synNP];
IF synppefsvar <> [] THEN BEGIN
top:=MAKET_stree(PREPP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
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
top^.ls^.PREPPfield^.specQ := specQvar;
top^.ls^.PREPPfield^.stranded := strandedvar;
END
END
END; END;
END (*PREPP*);
END;{package}
PACKAGE ADVPrule1pack: [ADVPrule1rule];
VAR
reqvar : LSDOMAINT_polarityEFFSETtype;
envvar : LSDOMAINT_polarityEFFSETtype;
classvar : LSDOMAINT_timeadvclasstype;
deixisvar : LSDOMAINT_deixistype;
aspectvar : LSDOMAINT_aspecttype;
retrovar : LSDOMAINT_retrotype;
moodvar : LSDOMAINT_xpmoodtype;
thetaadvvar : LSDOMAINT_thetaadvtype;
superdeixisvar : LSDOMAINT_deixistype;
actsubcefsvar : LSDOMAINT_advsubcEFFSETtype;
advpatternefsvar : LSDOMAINT_synpatternEFFSETtype;
positionvar : LSDOMAINT_positionSETtype;
possnietnpvar : LSDOMAINT_possnietnptype;
thanasvar : LSDOMAINT_thanascompltype;
temporalvar : LSDOMAINT_temporaltype;
headfound : BOOLEAN;
precomplfound : BOOLEAN;
postcomplfound : BOOLEAN; 
THANPpossible : BOOLEAN;
ASCOMPLADVfound : BOOLEAN;
DEGREEMODfound : BOOLEAN;
DEGREEADVexpected : BOOLEAN;
DEGREEADVfound : BOOLEAN;
 
PROCEDURE ADVPrule1rule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
reqvar :=[pospol, negpol, omegapol];
envvar :=[pospol, negpol, omegapol];
classvar :=omegaTimeAdvClass;
deixisvar :=omegadeixis;
aspectvar :=omegaAspect;
retrovar :=false;
moodvar :=nowh;
thetaadvvar :=omegathetaadvp;
superdeixisvar :=omegadeixis;
actsubcefsvar :=[];
advpatternefsvar :=[];
positionvar :=[]; 
possnietnpvar :=false; 
thanasvar :=omegacompl; 
headfound :=false; 
precomplfound :=false; 
postcomplfound :=false; 
temporalvar :=false;
THANPpossible := false;
ASCOMPLADVfound := false;
DEGREEMODfound := false;
DEGREEADVexpected := false;
DEGREEADVfound := false;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := head;
headfound := true;
reqvar :=b^.ls^.ADVfield^.req;
envvar :=b^.ls^.ADVfield^.env;
classvar :=b^.ls^.ADVfield^.class;
deixisvar :=b^.ls^.ADVfield^.deixis;
aspectvar :=b^.ls^.ADVfield^.aspect;
retrovar :=b^.ls^.ADVfield^.retro;
moodvar :=b^.ls^.ADVfield^.mood;
thetaadvvar :=b^.ls^.ADVfield^.thetaadv;
actsubcefsvar :=b^.ls^.ADVfield^.subcs;
advpatternefsvar :=b^.ls^.ADVfield^.advpatterns;
positionvar :=b^.ls^.ADVfield^.position; 
possnietnpvar :=b^.ls^.ADVfield^.possnietnp; 
thanasvar :=b^.ls^.ADVfield^.thanas; 
temporalvar :=b^.ls^.ADVfield^.temporal;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.temporal = true) (* dutch: al DRIE UUR*) 
AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := modrel;
postcomplfound := true;
END
END; END;
3: (* overgenomen uit Dutch; engels voorbeeld *)
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
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.temporal = true) (* three hours ago *)
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
If b^.ls^.ADVPfield^.thanas = ascompl
THEN ASCOMPLADVfound := true;
If b^.ls^.ADVPfield^.thanas = ascompl
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
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( headfound AND
((actsubcefsvar * [tempadv] <> []) OR
((NOT precomplfound) AND
(NOT postcomplfound)
))
);IF LIPRIMS_status THEN BEGIN
(*check of aanwezige complementen compatibel zijn met ADV*)
IF postcomplfound
THEN advpatternefsvar := advpatternefsvar * [synNP];
IF precomplfound
THEN advpatternefsvar := 
advpatternefsvar * [synMEASUREPHRASE];
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
top^.ls^.ADVPfield^.mood := moodvar;
top^.ls^.ADVPfield^.thetaadv := thetaadvvar;
top^.ls^.ADVPfield^.superdeixis := superdeixisvar;
top^.ls^.ADVPfield^.actsubcefs := actsubcefsvar;
top^.ls^.ADVPfield^.advpatternefs := advpatternefsvar;
top^.ls^.ADVPfield^.position := positionvar; 
top^.ls^.ADVPfield^.possnietnp := possnietnpvar; 
top^.ls^.ADVPfield^.thanas := thanasvar; 
top^.ls^.ADVPfield^.temporal := temporalvar;
END
END
END; END;
END;
END;{package}
PACKAGE NP6rulepack: [NP6rulerule];
VAR 
personpar : LSDOMAINT_persontype;
numberspar : LSDOMAINT_numberSETtype;
sexespar : LSDOMAINT_sexSETtype;
genderspar : LSDOMAINT_genderSETtype;

PROCEDURE NP6rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
personpar := 3;
numberspar := [];
sexespar := [];
genderspar := [omegagender];
END;
1 :CASE mode OF (*reflpro*)
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := head;
personpar := b^.ls^.REFLPROfield^.person;
numberspar := [b^.ls^.REFLPROfield^.number];
genderspar := [b^.ls^.REFLPROfield^.gender];
IF b^.ls^.REFLPROfield^.gender = masculinegender
THEN sexespar := [masculine] 
ELSE IF b^.ls^.REFLPROfield^.gender = femininegender
THEN sexespar := [feminine]
ELSE sexespar := []; 
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( TRUE
);IF LIPRIMS_status THEN BEGIN
top:=MAKET_stree(NP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.NPfield^.superdeixis := omegadeixis;
top^.ls^.NPfield^.definite := def;
top^.ls^.NPfield^.person := personpar;
IF (singular IN numberspar) 
THEN
top^.ls^.NPfield^.number := singular
ELSE
top^.ls^.NPfield^.number := plural;
IF (personpar <> 3) 
THEN
BEGIN
top^.ls^.NPfield^.animate := yesanimate;
top^.ls^.NPfield^.human := yeshuman;
END
ELSE
IF (personpar = 3) AND
(genderspar <> [omegagender])
THEN 
BEGIN
top^.ls^.NPfield^.animate := yesanimate;
top^.ls^.NPfield^.human := yeshuman;
END;
top^.ls^.NPfield^.cases := [accusative];
top^.ls^.NPfield^.NPhead := reflNP;
top^.ls^.NPfield^.specQ := yesspec;
top^.ls^.NPfield^.poss := false;
top^.ls^.NPfield^.sexes := sexespar;
END; (*make_t*)
END; END;
END;
END;{package}
PACKAGE NP7rulepack: [NP7rulerule];
VAR 
definitepar : LSDOMAINT_deftype;
personpar : LSDOMAINT_persontype;
numberpar : LSDOMAINT_numbertype;
casespar : LSDOMAINT_caseSETtype;
genderspar : LSDOMAINT_genderSETtype;
sexespar : LSDOMAINT_sexSETtype;
actsubcspar : LSDOMAINT_nounsubcSETtype;
temporalpar : LSDOMAINT_temporaltype;
posspar : LSDOMAINT_posstype;
animatepar : LSDOMAINT_animatetype;
humanpar : LSDOMAINT_humantype;
actcomaspar : LSDOMAINT_posscomaSETtype;
thetanppar : LSDOMAINT_thetanptype;
nounpatternefspar : LSDOMAINT_synpatternSETtype;
genericpar : LSDOMAINT_generictype;
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

PROCEDURE NP7rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT:BEGIN
definitepar := omegadef ; 
personpar := 3;
numberpar := omeganumber; 
casespar := [nominative, accusative];
genderspar := [omegagender];
sexespar := [];
actsubcspar := [othernoun];
temporalpar := false;
posspar := false;
animatepar := omegaAnimate;
humanpar := omegaHuman;
actcomaspar := [];
thetanppar := omegathetanp;
nounpatternefspar := [];
genericpar := omegageneric;
NPheadpar := otherNP;
posspredpar := false;
possnietnppar := false;
detnpmoodpar := nowh;
syntquantpar := Omegaquant;
specQpar := omegaspec; 
classpar := omegaTimeAdvClass;
deixispar := omegadeixis;
aspectpar := omegaAspect;
retropar := false;
END;
1 :CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.NPhead IN [persproNP, othernp]) AND
( b^.ls^.NPfield^.mood = nowh) AND
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
posspar := b^.ls^.NPfield^.poss;
animatepar := b^.ls^.NPfield^.animate;
humanpar := b^.ls^.NPfield^.human;
actcomaspar := b^.ls^.NPfield^.actcomas;
thetanppar := b^.ls^.NPfield^.thetanp;
nounpatternefspar := b^.ls^.NPfield^.nounpatternefs;
genericpar := b^.ls^.NPfield^.generic;
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
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.NPhead IN [persproNP, othernp]) AND
(b^.ls^.NPfield^.mood = nowh) AND
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
top^.ls^.NPfield^.poss := posspar;
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
PACKAGE ADJP1srulepack: [ADJP1srulerule];
VAR preADVfound : BOOLEAN;
reqvar : LSDOMAINT_polarityEFFSETtype;
envvar : LSDOMAINT_polarityEFFSETtype;
classvar : LSDOMAINT_timeadvclasstype;
deixisvar : LSDOMAINT_deixistype;
aspectvar : LSDOMAINT_aspecttype;
retrovar : LSDOMAINT_retrotype;
actuseefsvar : LSDOMAINT_adjuseEFFSETtype;
temporalvar : LSDOMAINT_temporaltype;
actsubcefsvar : LSDOMAINT_adjsubceffsettype;
thetaadjvar : LSDOMAINT_thetaadjtype;
adjpatternefsvar : LSDOMAINT_synpatterneffsettype;
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
temporalvar := false;
actsubcefsvar := [otheradj];
thetaadjvar := omegathetaadjp;
adjpatternefsvar := [];
moodvar := nowh;
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
actsubcefsvar := b^.ls^.ADJPfield^.actsubcefs;
thetaadjvar := b^.ls^.ADJPfield^.thetaadj;
adjpatternefsvar := b^.ls^.ADJPfield^.adjpatternefs;
temporalvar := b^.ls^.ADJPfield^.temporal;
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
top^.ls^.ADJPfield^.actsubcefs := actsubcefsvar;
top^.ls^.ADJPfield^.thetaadj := thetaadjvar;
top^.ls^.ADJPfield^.adjpatternefs := adjpatternefsvar;
top^.ls^.ADJPfield^.mood := moodvar; 
top^.ls^.ADJPfield^.temporal := temporalvar; 
END
END; END;
END;
END;{package}
PACKAGE ADJP2rulepack: [ADJP2rulerule];
VAR
COMPARATIVEexpected : BOOLEAN; (* to account for the relation of e.g. 
'a bit' and -er in 'a bit smaller' *)
COMPARATIVEfound : BOOLEAN; (* idem *) 
COMPARATIVEcomplexpected : BOOLEAN; (* to exclude ADVP `so'
(thatcompl) without complement *)
COMPARATIVEcomplfound : BOOLEAN; (* idem *) 
ofcomplpossible : BOOLEAN; (* to account for the compl to 'most' *)
THANPpossible : BOOLEAN; (* to account for teh occurrence of THANP
*) 
SUPERLATIVEexpected : BOOLEAN; (* To retrict the occurrece of 'the'
without QP 'most' to contexts with a
superlative ADJ. *) 
SUPERLATIVEfound : BOOLEAN; (* idem *) 
DEGREEMODfound : BOOLEAN; (* To exclude the occurrence of more than one
degree-modifier *)
tocomplexpected : BOOLEAN;
HOPexpected : BOOLEAN;
HOPfound : BOOLEAN;
DONPfound : BOOLEAN;
PREPOBJfound : BOOLEAN;
COMPLfound : BOOLEAN;
DEGREECOMPLfound : BOOLEAN; 
classvar : LSDOMAINT_timeadvclasstype;
deixisvar : LSDOMAINT_deixistype;
aspectvar : LSDOMAINT_aspecttype;
retrovar : LSDOMAINT_retrotype;
actuseefsvar : LSDOMAINT_adjuseeffsettype;
actsubcefsvar : LSDOMAINT_adjsubceffsettype;
thetaadjvar : LSDOMAINT_thetaadjtype;
adjpatternefsvar : LSDOMAINT_synpatterneffsettype;
moodvar : LSDOMAINT_xpmoodtype; 
temporalvar : LSDOMAINT_temporaltype;
PROCEDURE ADJP2rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

(* MET locargrel is nog geen rekening gehouden *) 
(* sentential complements are supposed to be extraposed *) 
PROCEDURE reduceadjpatterns(VAR adjps: LSDOMAINT_synpatternEFFSETtype);
BEGIN 
IF (DONPfound )
THEN adjps := adjps * [synMEASUREPHRASE];
IF (PREPOBJfound )
THEN adjps := adjps * (LSAUXDOM_prepobjvps );
END (*reduceadjpatterns*);
(*reduceadjsubcs*)
 
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
COMPARATIVEexpected := false;
COMPARATIVEfound := false;
COMPARATIVEcomplexpected := false;
COMPARATIVEcomplfound := false;
THANPpossible := false;
ofcomplpossible := false;
SUPERLATIVEexpected := false;
SUPERLATIVEfound := false;
DEGREEMODfound := false; 
HOPexpected := false; 
HOPfound := false; 
tocomplexpected := false;
PREPOBJfound := false;
DONPfound := false;
COMPLfound := false;
DEGREECOMPLfound := false;
classvar := omegaTimeAdvClass;
deixisvar := omegadeixis;
aspectvar := omegaAspect;
retrovar := false;
actuseefsvar := [];
actsubcefsvar := [otheradj];
thetaadjvar := omegathetaadjp;
adjpatternefsvar := [];
moodvar := nowh;
temporalvar := false;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := head;
IF b^.ls^.ADJfield^.compform = compar
THEN BEGIN
THANPpossible := true;
DEGREEMODfound := true;
comparativefound := true
END;
IF b^.ls^.ADJfield^.compform = super
THEN BEGIN
ofcomplpossible := true;
DEGREEMODfound := true;
SUPERLATIVEfound := true
END;
classvar := b^.ls^.ADJfield^.class;
deixisvar := b^.ls^.ADJfield^.deixis;
aspectvar := b^.ls^.ADJfield^.aspect;
retrovar := b^.ls^.ADJfield^.retro;
actuseefsvar := b^.ls^.ADJfield^.uses;
actsubcefsvar := b^.ls^.ADJfield^.subcs;
thetaadjvar := b^.ls^.ADJfield^.thetaadj;
adjpatternefsvar := b^.ls^.ADJfield^.adjpatterns;
temporalvar := b^.ls^.ADJfield^.temporal;
END
END; END;
6: (* eventueel conditie toevoegen die vereist het hoofd van de ADJP een 
measure-adj is *)
CASE mode OF
loccond:LIPRIMS_assignstatus( (accusative in b^.ls^.NPfield^.cases) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := objrel;
DONPfound := true;
COMPLfound := true;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.QPfield^.hop = false 
);globcond: BEGIN  BEGIN
SYNREL := degreemodrel;
DEGREEMODfound := true;
moodvar := b^.ls^.QPfield^.mood;
If b^.ls^.QPfield^.thanas = tocompl
THEN tocomplexpected := true;
IF b^.ls^.QPfield^.thanas = omegacompl
THEN COMPARATIVEexpected := true; 
(* to exclude: much/some beautiful als ADJP *)
IF b^.ls^.QPfield^.thanas IN [ascompl, thancompl]
THEN THANPpossible := true;
IF b^.ls^.QPfield^.thanas IN [ ofcompl] 
THEN BEGIN 
ofcomplpossible := true
END;
IF b^.ls^.QPfield^.thanas IN [ ofcompl] 
THEN BEGIN 
actuseefsvar :=
[attributive, nominalised]
(* 'most' zonder 'the' *)
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
If b^.ls^.ADVPfield^.thanas = ascompl
THEN THANPpossible := true;
If b^.ls^.ADVPfield^.thanas = thatcompl
THEN COMPARATIVEcomplexpected := true;
If b^.ls^.ADVPfield^.thanas = tocompl
THEN tocomplexpected := true;
moodvar := b^.ls^.ADVPfield^.mood;
END
END; END;
88: (* almost ... enough *)
CASE mode OF
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
25: 
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
14: CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.QPfield^.hop = true
);globcond: BEGIN  BEGIN
SYNREL := hoprel;
DEGREEMODfound := true;
HOPfound := true;
END
END; END;
27:
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.coord <> corrcoord) AND
(b^.ls^.PREPPfield^.headkey = auxkey('ofprepkey')
)
);globcond: BEGIN  BEGIN
SYNREL := ofcomplrel;
END
END; END;
11: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := prepobjrel;
PREPOBJfound := true;
COMPLfound := true;
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
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( COMPLfound <= 
((adjpatternefsvar * [synnoadjpargs] = [])
(* FJ, 29/11/88*) OR
(actsubcefsvar 
* [forsubjectiveadj, tosubjectiveadj] <> []) 
(* FJ, 27/07/89;
met het oog op voorobjmods *) 
)
);IF LIPRIMS_status THEN reduceadjpatterns(adjpatternefsvar);
IF (adjpatternefsvar <> []) AND
(actsubcefsvar <> []) AND 
(NOT ((COMPARATIVEexpected) 
AND (NOT COMPARATIVEfound))) AND
(NOT ((COMPARATIVEcomplexpected) 
AND (NOT COMPARATIVEcomplfound))) AND
(NOT ((SUPERLATIVEexpected) 
AND (NOT SUPERLATIVEfound))) AND
(NOT ((HOPexpected)
AND (NOT HOPfound)))
THEN BEGIN
top:=MAKET_stree(ADJP);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.ADJPfield^.req := [pospol,negpol,omegapol];
top^.ls^.ADJPfield^.env := [pospol,negpol,omegapol];
top^.ls^.ADJPfield^.class := classvar;
top^.ls^.ADJPfield^.deixis := deixisvar;
top^.ls^.ADJPfield^.aspect := aspectvar;
top^.ls^.ADJPfield^.retro := retrovar;
top^.ls^.ADJPfield^.actuseefs := actuseefsvar;
top^.ls^.ADJPfield^.actsubcefs := actsubcefsvar;
top^.ls^.ADJPfield^.thetaadj := thetaadjvar;
top^.ls^.ADJPfield^.adjpatternefs := adjpatternefsvar;
top^.ls^.ADJPfield^.mood := moodvar; 
top^.ls^.ADJPfield^.temporal := temporalvar; 
END
END; END;
END;
END;{package}
PACKAGE QP1rulepack: [QP1rulerule];
VAR 
MOSTexpected : BOOLEAN;
MOSTfound : BOOLEAN;
COMPLfound : BOOLEAN;
definitevar : LSDOMAINT_deftype;
posspredvar : LSDOMAINT_posspredtype;
possnumbersvar : LSDOMAINT_numberSETtype;
posscomasvar : LSDOMAINT_posscomaSETtype;
moodvar : LSDOMAINT_xpmoodtype;
thanasvar : LSDOMAINT_thanascompltype;
thanascomplvar : LSDOMAINT_compltype;
hopvar : LSDOMAINT_hoptype;
 
PROCEDURE QP1rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
MOSTexpected := false;
MOSTfound := false;
COMPLfound := false;
definitevar := omegadef;
posspredvar := false;
possnumbersvar := [singular];
posscomasvar := [count];
moodvar := nowh;
thanasvar := omegacompl;
thanascomplvar := false;
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
loccond:LIPRIMS_assignstatus( ((b^.ls^.NPfield^.actsubcs * [unitnoun ] <> []) OR
(b^.ls^.NPfield^.actcomas * [mass] <> [])) AND
(b^.ls^.NPfield^.definite = indef) (* amountnp *) AND
(b^.ls^.NPfield^.coord <> corrcoord)
);globcond: BEGIN  BEGIN
SYNREL := premodrel
END
END; END; 
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.ARTfield^.key = auxkey('theARTkey')

);globcond: BEGIN  BEGIN
SYNREL := artrel;
MOSTexpected := true
END
END; END; 
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
IF b^.ls^.Qfield^.key = auxkey('mostQkey')

THEN MOSTfound := true;
SYNREL := head;
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
IF (NOT ((MOSTexpected) 
AND (NOT MOSTfound))) 
THEN 
BEGIN
top^.ls^.QPfield^.definite := definitevar;
top^.ls^.QPfield^.posspred := posspredvar;
top^.ls^.QPfield^.possnumbers := possnumbersvar;
top^.ls^.QPfield^.posscomas := posscomasvar;
top^.ls^.QPfield^.mood := moodvar;
top^.ls^.QPfield^.thanas := thanasvar;
top^.ls^.QPfield^.thanascompl := thanascomplvar;
top^.ls^.QPfield^.hop := hopvar;
END
END
END; END;
END;
END;{package}
PACKAGE THANPrulepack: [THANPrulerule];
VAR
thanasvar : LSDOMAINT_thanascompltype;
 
PROCEDURE THANPrulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);
BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
thanasvar := omegacompl;
END;
1: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := head;
IF b^.ls^.THANASfield^.key = auxkey('thanthanaskey')

THEN thanasvar := thancompl;
IF b^.ls^.THANASfield^.key = auxkey('asthanaskey')

THEN thanasvar := ascompl;
END
END; END;
2: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := complrel
END
END; END;
3: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := complrel
END
END; END;
4: 
CASE mode OF
loccond:LIPRIMS_assignstatus( true
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
loccond:LIPRIMS_assignstatus( true
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
top^.ls^.THANPfield^.req := [pospol,negpol,omegapol];
top^.ls^.THANPfield^.env := [pospol,negpol,omegapol];
top^.ls^.THANPfield^.thanas := thanasvar;
END 
END; END;
END;
END;{package}
PACKAGE SENTENCE1rulepack: [SENTENCE1rulerule];
(* 1=CONJ 2=SUBJ 3=AUX 4=PRED 5=PUNC(.) 6=NEG 7=PUNC(,) 8=CONJ
9,10,11,12,13=SHIFT 14,15=LEFTDISLOC 16,17=LOCADV 18,19=TEMPADV
20,21 = SENTADV 22=TEMPADV 23=POSTSENTADV 24=EXTRAPOS
25=ADV2 26=ADV3 (provisionally) 27,28,29,30=LEFTDISLOC 31=TO 32=SUBJ
33=GLUE 34=CONJ
*)
VAR
accsubjfound : BOOLEAN;
adjunctsvar : LSDOMAINT_adjunctSETtype;
adjpinshiftfound : BOOLEAN;
adjppredrelfound : BOOLEAN;
adverbialvar : BOOLEAN;
advfound : BOOLEAN;
advpinshiftfound : BOOLEAN;
asifcomplfound : BOOLEAN;
auxfound : BOOLEAN;
classesvar : LSDOMAINT_classSETtype;
conjaspectvar : LSDOMAINT_aspecttype;
conjclassvar : LSDOMAINT_timeadvclasstype;
CONJconjfound : BOOLEAN;
conjdeixisvar : LSDOMAINT_deixistype;
conjfound : BOOLEAN;
conjkeyvar : LSDOMAINT_keytype;
conjpatternsvar : LSDOMAINT_synpatternEFFSETtype;
conjretrovar : LSDOMAINT_retrotype;
deixisvar : LSDOMAINT_deixistype;
deixisvarvar : LSDOMAINT_deixistype;
dirargrelfound : BOOLEAN;
envvar : LSDOMAINT_polarityEFFSETtype;
extraposfound : BOOLEAN;
extraposinfsortvar : LSDOMAINT_inftype;
extraposmoodvar : LSDOMAINT_moodtype;
extraposmodusvar : LSDOMAINT_modustype;
extraposok : BOOLEAN;
extraposprosubjectvar : LSDOMAINT_prosubjecttype;
finalpuncfound : BOOLEAN;
finitenessvar : LSDOMAINT_finitenesstype;
finitenessvarvar : LSDOMAINT_finitenesstype;
gensubjfound : BOOLEAN;
indobjrelfound : BOOLEAN;
infdoinconjfound : BOOLEAN;
infsortreset : BOOLEAN;
infsortvar : LSDOMAINT_inftype;
infsortvarvar : LSDOMAINT_inftype;
inversfound : BOOLEAN;
leftdislocfound : BOOLEAN;
letinconjfound : BOOLEAN;
letusgluefound : BOOLEAN;
locargrelfound : BOOLEAN;
modusvar : LSDOMAINT_modustype;
modusvarvar : LSDOMAINT_modustype;
moodvar : LSDOMAINT_moodtype;
negfound : BOOLEAN;
nomsubjfound : BOOLEAN;
notinauxfound : BOOLEAN;
npinshiftfound : BOOLEAN;
nppredrelfound : BOOLEAN;
objrelfound : BOOLEAN;
onlyaccsubjfound : BOOLEAN; 
onlynomsubjfound : BOOLEAN; 
particlekey : LSDOMAINT_keytype;
prepkeyvar1 : LSDOMAINT_keytype;
prepkeyvar2 : LSDOMAINT_keytype;
prepobjrelfound : BOOLEAN;
prepobj2relfound : BOOLEAN;
preppinshiftfound : BOOLEAN;
prepppredrelfound : BOOLEAN;
prosubjectvar : BOOLEAN;
RELPROfound : BOOLEAN;
reqvar : LSDOMAINT_polarityEFFSETtype;
scomplrelfound : BOOLEAN;
senttypevar : LSDOMAINT_senttypetype;
shiftcases : LSDOMAINT_casesettype;
shiftfound : BOOLEAN;
shiftnumbervar : LSDOMAINT_numbertype;
shiftpersonvar : LSDOMAINT_persontype;
shiftsexes : LSDOMAINT_sexSETtype;
shiftxpmoodvar : LSDOMAINT_xpmoodtype;
Sinldlfound : BOOLEAN;
strandedrelfound : BOOLEAN;
subjNPhead : LSDOMAINT_NPheadtype;
subjnumbervar : LSDOMAINT_numbertype;
subjpersonvar : LSDOMAINT_persontype;
subjfound : BOOLEAN;
synvpefsvar : LSDOMAINT_synpatternEFFsettype;
temporalvar : BOOLEAN;
tensevar : LSDOMAINT_tensetype;
therenpfound : BOOLEAN;
thetavpvar : LSDOMAINT_thetavptype;
tofound : BOOLEAN;
VERBconjfound : BOOLEAN;
verbpersonsvar : LSDOMAINT_personSETtype;
verbnumbersvar : LSDOMAINT_numberSETtype;
verbpfound : BOOLEAN;
verbprepkeyvar1 : LSDOMAINT_keytype;
verbprepkeyvar2 : LSDOMAINT_keytype;
verbsubcvar : LSDOMAINT_verbsubctype;
verbsynvpsvar : LSDOMAINT_synpatternSETtype;
verbthetavpvar : LSDOMAINT_thetavptype;
voicevar : LSDOMAINT_voicetype;
XPinldlfound : BOOLEAN; (* true iff leftdislocfound but
no adverbial S in ldl found *)
PROCEDURE SENTENCE1rulerule(a:LIPRIMS_nodeid;b:LSSTREE_pStree;mode:LIPRIMS_surfrulemode);

(* moved to lssurfquo:
FUNCTION vpfirstsubc(T:LSSTREE_pstree): LSDOMAINT_verbsubctype; FORWARD; *)
(* moved to lssurfquo:
FUNCTION auxandverbpok(m: LSDOMAINT_modustype;af: LSDOMAINT_auxSETtype):BOOLEAN;
BEGIN
auxandverbpok := FALSE;
IF verbsubcvar = modalverb THEN auxandverbpok := (m=infinitive) 
ELSE IF (verbsubcvar = haveverb) AND (verbthetavpvar = thetavpaux) 
THEN auxandverbpok := ((m=participle) AND (af * [aux] = []))
ELSE IF (verbsubcvar = haveverb) AND (verbthetavpvar = vp120)
THEN auxandverbpok := (NOT b^.ls^.VERBPfield^.headfound)
ELSE IF (verbsubcvar = beverb) AND
(af = []) AND
(verbthetavpvar = thetavpaux)
THEN auxandverbpok :=((m IN [participle,ingform]) OR (NOT b^.ls^.VERBPfield^.headfound))
ELSE IF (verbsubcvar = beverb) AND
(af = []) AND
(verbthetavpvar <> thetavpaux) AND
([synCLOSEDGERUND] * verbsynvpsvar = [])
THEN auxandverbpok :=(NOT b^.ls^.VERBPfield^.headfound)
ELSE IF (verbsubcvar = beverb) AND
(af = [pass]) AND
(verbthetavpvar = vp010) AND
(synCLOSEDGERUND IN verbsynvpsvar)
THEN auxandverbpok :=(m IN [ingform])
ELSE IF (verbsubcvar = doaux) 
THEN IF (NOT infdoinconjfound)
THEN auxandverbpok := ((m = infinitive) AND
(vpfirstsubc(b) <> beverb)
)
ELSE auxandverbpok := (m = infinitive)
ELSE IF letinconjfound
THEN auxandverbpok := (m = infinitive);
END; *)
PROCEDURE computeaktarts( classes: LSDOMAINT_classSETtype; 
VAR aktarts: LSDOMAINT_aktionsartEFFSETtype
);
{
The procedure yields a set, aktarts (by means of a VAR variable)
representing the aktionsarts that are compatible with the verbclass
}
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
IF (dynstativeclass IN classes)
THEN aktarts := aktarts + [stative, dynstative];
END {computeaktarts};
FUNCTION conjandfinok:BOOLEAN;
BEGIN
conjandfinok := 
(CONJconjfound <= 
(((conjpatternsvar * [synTHATSENT, synQSENT] <> []) AND
(finitenessvar = finite) AND
(modusvar = indicative)
) OR
((conjpatternsvar * LSAUXDOM_subjcomplvps <> []) AND
(finitenessvar = finite) AND
(modusvar = subjunctive)
) OR
((conjpatternsvar * [synOPENTOSENT, 
synCLOSEDTOSENT] <> []) AND
(finitenessvar = infinite) AND
tofound
)
)
)
END; {conjandfinok}
PROCEDURE detmood1(VAR m: LSDOMAINT_moodtype; VAR s: LSDOMAINT_senttypetype; VAR p: LSDOMAINT_prosubjecttype);
BEGIN
m := omegamood;
IF (NOT shiftfound) THEN BEGIN
IF (NOT conjfound) THEN BEGIN
IF (modusvar = infinitive) AND
(infsortvar = toinf) AND
(NOT subjfound)
THEN BEGIN {3a1}
m := declarative;
s := subordinateclause;
p := TRUE;
END;
IF (modusvar = infinitive) AND
(infsortvar = inf) AND
(NOT subjfound)
THEN BEGIN {3b1}
m := declarative;
s := subordinateclause;
p := TRUE;
END;
IF (modusvar = ingform) AND
(NOT tofound) AND
(infsortvar = opening)
THEN BEGIN {5a}
m := declarative;
s := subordinateclause;
p := TRUE;
END;
IF (modusvar = ingform) AND
(NOT tofound) AND
(subjfound <= accsubjfound) AND
(infsortvar = accing)
THEN BEGIN {5b}
m := declarative;
s := subordinateclause;
p := FALSE;
END;
IF (modusvar = ingform) AND
(NOT tofound) AND
gensubjfound AND
(infsortvar = possing)
THEN BEGIN {5c}
m := declarative;
s := subordinateclause;
p := FALSE;
END;
END
ELSE BEGIN {NOT shiftfound and conjfound}
IF (modusvar = infinitive) AND
accsubjfound AND
(infsortvar = fortoinf) AND
(conjkeyvar = auxkey('fortoconjkey')
)
THEN BEGIN {3c}
m := declarative;
s := subordinateclause;
p := FALSE;
END;
IF (modusvar = indicative) AND
nomsubjfound AND
verbconjfound AND
(NOT xpinldlfound) AND
(NOT letinconjfound)
THEN BEGIN {9}
m := yesnointerrogative;
s := mainclause;
p := FALSE;
END;
IF (modusvar = indicative) AND
nomsubjfound AND
((conjkeyvar = auxkey('whetherconjkey')
) OR
(conjkeyvar = auxkey('ifconjkey')
))
THEN BEGIN {10}
m := yesnointerrogative;
s := subordinateclause;
p := FALSE;
END;
END; {NOT shiftfound AND conjfound}
IF (modusvar = subjunctive) AND
(subjfound <= nomsubjfound) AND
(conjfound <= (conjkeyvar = auxkey('thatconjkey')
)) 
THEN BEGIN {4}
m := declarative;
s := subordinateclause;
p := FALSE;
END;
END {NOT shiftfound}
ELSE BEGIN {shiftfound}
IF (modusvar = indicative) AND
(subjfound <= nomsubjfound) AND
(verbconjfound = subjfound) AND
(shiftxpmoodvar = wh) AND
(NOT letinconjfound)
THEN BEGIN {6}
m := whinterrogative;
s := mainclause;
p := FALSE;
END;
IF (modusvar = infinitive) AND
(NOT subjfound) AND
(NOT conjfound) AND
(shiftxpmoodvar = wh) AND
tofound
THEN BEGIN {8}
m := whinterrogative;
s := subordinateclause;
p := TRUE;
END;
END; {IF NOT shiftfound ELSE}
IF (shiftfound <= (shiftxpmoodvar = nowh)) AND
(subjfound <= nomsubjfound) AND
(shiftfound OR 
subjfound OR 
(Sinldlfound AND 
(NOT subjfound) AND 
(XPinldlfound)
)
) AND
((Sinldlfound AND XPinldlfound)
<= (NOT subjfound)) AND
(NOT conjfound) AND
(NOT relprofound) AND
(modusvar = indicative)
THEN BEGIN {1}
m := declarative;
s := mainclause;
p := FALSE;
END;
END; {detmood1}
PROCEDURE detmood2(VAR m: LSDOMAINT_moodtype; VAR s: LSDOMAINT_senttypetype; VAR p: LSDOMAINT_prosubjecttype);
BEGIN
m := omegamood;
IF (NOT shiftfound) 
THEN BEGIN
IF (NOT conjfound)
THEN BEGIN
IF (modusvar = infinitive) AND
(NOT subjfound) AND
(NOT tofound) AND
(NOT leftdislocfound)
THEN BEGIN {11}
m := imperativemood;
s := mainclause;
p := FALSE;
modusvarvar := imperative;
deixisvarvar := presentdeixis;
infsortvarvar := omegainf;
finitenessvarvar := finite;
END;
END
ELSE BEGIN { NOT shiftfound AND conjfound }
IF (modusvar = infinitive) AND
letinconjfound AND
verbconjfound AND
accsubjfound AND
(NOT tofound) AND
(subjpersonvar = 1) AND
(subjnumbervar = plural)
THEN BEGIN {12}
m := letsmood;
s := mainclause;
p := FALSE;
finitenessvarvar := finite;
infsortvarvar := omegainf;
deixisvarvar := presentdeixis;
END;
IF (modusvar = infinitive) AND
(infdoinconjfound) AND
(subjfound <= nomsubjfound) AND
(subjfound <= notinauxfound) AND
(NOT tofound) AND
(NOT leftdislocfound)
THEN BEGIN {11a}
m := imperativemood;
s := mainclause;
p := FALSE;
modusvarvar := imperative;
deixisvarvar := presentdeixis;
infsortvarvar := omegainf;
finitenessvarvar := finite;
END;
END;
IF (modusvar = indicative) AND
(conjfound <= (conjkeyvar = auxkey('thatconjkey')
)) AND
(subjfound <= nomsubjfound)
THEN BEGIN {2}
m := declarative;
s := subordinateclause;
p := FALSE;
END;
END {IF NOT shiftfound THEN}
ELSE BEGIN {shiftfound}
IF (modusvar = indicative) AND
(NOT conjfound) AND
(subjfound <= nomsubjfound) AND
(shiftxpmoodvar = wh)
THEN BEGIN {7}
m := whinterrogative;
s := subordinateclause;
p := FALSE;
END;
END; {IF NOT shiftfound ELSE}
END; {detmood2}
PROCEDURE detmood3(VAR m: LSDOMAINT_moodtype; VAR s: LSDOMAINT_senttypetype; VAR p: LSDOMAINT_prosubjecttype);
BEGIN
m := omegamood;
IF (NOT shiftfound)
THEN BEGIN
IF (NOT conjfound)
THEN BEGIN {not shift not conj}
IF (modusvar = infinitive) AND
(NOT subjfound) AND
tofound AND
(infsortvar = toinf)
THEN BEGIN {14b}
m := relative;
s := subordinateclause;
p := FALSE;
END;
IF (modusvar = ingform) AND
(NOT subjfound) AND
(infsortvar = opening)
THEN BEGIN {15}
m := anterelative;
s := subordinateclause;
p := TRUE;
END;
IF (modusvar = participle) AND
(NOT subjfound)
THEN BEGIN {16}
m := anterelative;
s := subordinateclause;
p := TRUE;
END;
END {not shift not conj}
ELSE BEGIN {not shift conj}
IF (modusvar = infinitive) AND
accsubjfound AND
(conjkeyvar = auxkey('fortoconjkey')
) AND
tofound AND
(infsortvar = fortoinf)
THEN BEGIN {14a}
m := relative;
s := subordinateclause;
p := FALSE;
END;
END {not shift conj}
END; {NOT shiftfound}
IF (modusvar = indicative) AND
(subjfound <= nomsubjfound) AND
(NOT conjfound) AND
( relprofound OR
((NOT shiftfound) <= subjfound) AND
( npinshiftfound <= 
((shiftnumbervar = singular) AND
(shiftsexes = [masculine]))
)
)
(* only the masculine singular who is used as a relpro in M-parser *)
THEN BEGIN {13}
m := relative;
s := subordinateclause;
p := FALSE;
END;
END; {detmood3}
PROCEDURE detmood4(VAR m: LSDOMAINT_moodtype; VAR s: LSDOMAINT_senttypetype; VAR p: LSDOMAINT_prosubjecttype);
BEGIN
m := omegamood;
IF (NOT shiftfound) AND
(NOT conjfound)
THEN BEGIN
IF (modusvar = infinitive) AND
(infsortvar = toinf) AND
(subjfound <= accsubjfound)
THEN BEGIN {3a2}
m := declarative;
s := subordinateclause;
p := FALSE;
END;
IF (modusvar = infinitive) AND
(infsortvar = inf) AND
(subjfound <= accsubjfound)
THEN BEGIN {3b2}
m := declarative;
s := subordinateclause;
p := FALSE;
END;
END {not shift not conj}
END; {detmood4}
PROCEDURE detmoodadv(VAR m: LSDOMAINT_moodtype; VAR s: LSDOMAINT_senttypetype; VAR p: LSDOMAINT_prosubjecttype);
BEGIN
m := omegamood;
IF (NOT shiftfound) AND 
(finitenessvar = finite) AND
subjfound
THEN BEGIN
m := declarative;
s := subordinateclause;
p := FALSE;
END;
IF (NOT shiftfound) AND 
(finitenessvar = infinite) AND
(NOT subjfound) AND
tofound
THEN BEGIN
m := declarative;
s := subordinateclause;
p := TRUE;
END;
{note: ingadverbials not accounted for yet}
END; {detmoodadv}
FUNCTION GENunderNP(T1:LSSTREE_pstree):BOOLEAN;
VAR result : BOOLEAN;
sonlist : LSSTREE_prelnode;
{
The function checks for an NP whether there is a GEN under it
}
BEGIN
result := false;
sonlist := T1^.sons;
WHILE NOT (result) AND (sonlist <> NIL) DO
BEGIN
IF sonlist^.node^.cat = GEN
THEN result := TRUE;
sonlist := sonlist^.brother;
END;
GENunderNP := result;
END; {GENunderNP}
(* moved to lssurfquo:
FUNCTION getsubc(T1:LSSTREE_pstree): LSDOMAINT_verbsubctype;
VAR result : LSDOMAINT_verbsubctype;
sonlist : LSSTREE_prelnode;
BEGIN
result := notaux;
sonlist := T1^.sons;
IF sonlist^.node^.CAT = verb THEN
result := sonlist^.node^.ls^.verbfield^.subc;
getsubc := result;
END; *)
(* moved to lssurfquo:
FUNCTION letinconj(T1:LSSTREE_pstree):BOOLEAN;
VAR result : BOOLEAN;
sonlist : LSSTREE_prelnode;
BEGIN
result := false;
sonlist := T1^.sons;
IF sonlist <> NIL THEN BEGIN
sonlist := sonlist^.node^.sons;
IF sonlist^.node^.CAT = bverb THEN
result := (sonlist^.node^.ls^.bverbfield^.key = auxkey('letsBVERBkey')
);
END;
letinconj := result;
END;*)
PROCEDURE reduce(VAR vps: LSDOMAINT_synpatterneffsettype);
BEGIN
IF ( vps * LSAUXDOM_sentcomplvps <> [] ) THEN
BEGIN
IF extraposmoodvar = declarative
THEN vps := vps * LSAUXDOM_declcomplvps;
IF extraposmoodvar IN [whinterrogative, yesnointerrogative]
THEN vps := vps * LSAUXDOM_qcomplvps;
IF extraposmodusvar = infinitive
THEN vps := vps * LSAUXDOM_infinitecomplvps;
IF (extraposmoodvar = declarative) AND
(extraposmodusvar = indicative)
THEN vps := vps * LSAUXDOM_indcomplvps;
IF (extraposmoodvar = declarative) AND
(extraposmodusvar = subjunctive)
THEN vps := vps * LSAUXDOM_subjcomplvps;
IF extraposmodusvar = ingform
THEN vps := vps * LSAUXDOM_ingcomplvps;
IF extraposinfsortvar = inf
THEN vps := vps * LSAUXDOM_infcomplvps;
IF extraposinfsortvar = toinf
THEN vps := vps * LSAUXDOM_toinfcomplvps;
IF extraposinfsortvar = fortoinf
THEN vps := vps * LSAUXDOM_fortocomplvps;
IF extraposinfsortvar = accing
THEN vps := vps * (LSAUXDOM_closedcomplvps * LSAUXDOM_ingcomplvps);
IF extraposinfsortvar = opening
THEN vps := vps * LSAUXDOM_openingcomplvps;
IF (extraposfound AND (extraposprosubjectvar = TRUE))
THEN vps := vps * LSAUXDOM_opencomplvps;
IF extraposfound AND
(extraposprosubjectvar = FALSE) AND
(extraposmodusvar <> indicative) AND
(extraposmodusvar <> subjunctive)
(*[extraposmodusvar] * [indicative, subjunctive] = []*)
THEN vps := vps * LSAUXDOM_closedcomplvps;
IF asifcomplfound
THEN vps := vps * LSAUXDOM_asifcomplvps;
IF (vps * LSAUXDOM_sentcomplvps <> []) AND
(NOT extraposfound) AND
(NOT extraposok) AND
(NOT scomplrelfound)
THEN vps := vps - LSAUXDOM_sentcomplvps;
END; {sentcompl}
END; {reduce}
(* moved to lssurfquo:
FUNCTION subjandvpandauxok: BOOLEAN;
BEGIN
subjandvpandauxok :=
((auxfound OR VERBconjfound) <=
(b^.ls^.VERBPfield^.deixis = omegadeixis) 
)
AND
(((NOT auxfound) AND
(NOT VERBconjfound)
) <=
(((subjfound AND
(b^.ls^.VERBPfield^.modus IN [subjunctive, indicative]) AND
(NOT therenpfound)
) <=
((subjpersonvar IN b^.ls^.VERBPfield^.persons) AND
(subjnumbervar IN b^.ls^.VERBPfield^.numbers)
)
) AND
((subjfound AND
(b^.ls^.VERBPfield^.modus IN [subjunctive, indicative]) AND
(therenpfound)
) <=
(3 IN b^.ls^.VERBPfield^.persons)
) AND
(((NOT subjfound) AND
(b^.ls^.VERBPfield^.modus IN [subjunctive, indicative])
) <=
(3 IN b^.ls^.VERBPfield^.persons
)
)
) AND
(((NOT subjfound) AND shiftfound) <=
(shiftnumbervar IN b^.ls^.VERBPfield^.numbers
)
) 
)
END; subjandvpandauxok*)
FUNCTION subordcondsok:BOOLEAN;
BEGIN
subordcondsok :=
(senttypevar = subordinateclause) <= 
((NOT finalpuncfound) AND
(NOT leftdislocfound) AND
(shiftfound <= (RELPROfound OR
(shiftxpmoodvar <> nowh)
)
)
)
END;
(* moved to lssurfquo:
FUNCTION svaok:BOOLEAN;
BEGIN
svaok :=
((subjfound AND
(NOT therenpfound)
)
<=
((subjpersonvar IN b^.ls^.VERBfield^.persons) AND
(subjnumbervar IN b^.ls^.VERBfield^.numbers) 
)
) AND
((NOT subjfound) OR therenpfound) 
<= (3 IN b^.ls^.VERBfield^.persons) AND
(((NOT subjfound) AND
shiftfound
) <=
(shiftnumbervar IN b^.ls^.VERBfield^.numbers
)
) AND
(((NOT subjfound) AND (NOT shiftfound)) <= 
(singular IN b^.ls^.VERBfield^.numbers)
);
END; svaok *)
(* moved to lssurfquo:
FUNCTION thereNP_(T1:LSSTREE_pstree):BOOLEAN;
VAR result : BOOLEAN;
sonlist : LSSTREE_prelnode;
The function checks for an NP whether there is THERE under it
BEGIN
result := false;
sonlist := T1^.sons;
WHILE NOT (result) AND (sonlist <> NIL) DO
BEGIN
IF sonlist^.node^.cat = THERE
THEN result := TRUE;
sonlist := sonlist^.brother;
END;
thereNP_ := result;
END; *)
(* moved to lssurfquo:
FUNCTION vpfirstsubc;
VAR result : LSDOMAINT_verbsubctype;
sonlist : LSSTREE_prelnode;
vfound : BOOLEAN;
The function yields the subc of the first verb under VP
BEGIN
vfound := FALSE;
result := mainverb;
sonlist := T^.sons;
WHILE NOT (vfound) AND (sonlist <> NIL) DO
BEGIN
IF sonlist^.node^.cat = VERB
THEN BEGIN vfound := TRUE;
result := sonlist^.node^.ls^.verbfield^.subc;
END;
sonlist := sonlist^.brother;
END;
vpfirstsubc := result;
END; vpfirstsubc*)
FUNCTION argspresent:BOOLEAN;
VAR adjppredok, dirargok, indobjok, locargok, nppredok, objok, prepobjok, 
prepobj2ok, prepppredok, result, subjok, shiftallowed, 
shiftused, supershiftused, hiddenshiftused, hiddenshiftallowed, 
subjshiftallowed, supershiftallowed, Scomplok,
asifcomplok, fortocomplok,strandedok, synbeok :BOOLEAN;
BEGIN (*FUNCTION argspresent*)
result := TRUE;
asifcomplok := FALSE;
fortocomplok := FALSE;
objok := FALSE;
indobjok := FALSE;
subjok := FALSE;
prepobjok := FALSE;
prepobj2ok := FALSE;
adjppredok := FALSE;
nppredok := FALSE;
prepppredok := FALSE;
dirargok := FALSE;
locargok := FALSE;
Scomplok := FALSE;
strandedok := FALSE;
synbeok := FALSE;
shiftused := FALSE;
supershiftused := FALSE;
hiddenshiftused := FALSE;
supershiftallowed:= (moodvar = declarative) AND
(senttypevar = subordinateclause) AND
((finitenessvar = finite) OR
(infsortvar IN [toinf, inf])
);
shiftallowed := (moodvar = whinterrogative) OR
((moodvar = declarative) AND
(senttypevar = mainclause)) OR
((moodvar = relative) AND
(finitenessvar = finite));
hiddenshiftallowed := (moodvar = relative);
subjshiftallowed := ((moodvar = whinterrogative) AND
(senttypevar = mainclause)) OR
((moodvar = whinterrogative) AND
(senttypevar = subordinateclause) AND
(conjfound = FALSE)) OR
((moodvar = relative) AND 
(relprofound OR npinshiftfound) AND
(finitenessvar = finite));
(*objok*) 
IF ((synvpefsvar * (LSAUXDOM_objvps) <> []) AND
(voicevar = active) AND
(thetavpvar IN [vp120,vp123]))
THEN
BEGIN
objok := objrelfound;
IF ((NOT objok) AND shiftallowed) THEN
BEGIN
IF (npinshiftfound AND (NOT shiftused)) THEN
BEGIN
shiftused := TRUE;
objok := TRUE
END;
END;
IF ((NOT objok) AND supershiftallowed ) THEN
BEGIN
IF (NOT supershiftused) THEN
BEGIN
supershiftused := TRUE;
objok := TRUE
END;
END;
IF ((NOT objok) AND hiddenshiftallowed) THEN
BEGIN
IF (NOT hiddenshiftused) THEN
BEGIN
hiddenshiftused := TRUE;
objok := TRUE
END;
END;
IF (NOT objok) THEN
BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_objvps; 
objok := TRUE;
END;
END
ELSE 
objok := TRUE;
result := result AND objok;
(*subjok*)
IF result AND (synvpefsvar <> [])
THEN
BEGIN
IF ((finitenessvar = finite) AND (moodvar <> imperativemood)) THEN
BEGIN
subjok := subjfound OR extraposfound;
IF ((NOT subjok) AND subjshiftallowed) THEN
BEGIN
IF ((npinshiftfound OR relprofound) AND (NOT shiftused)) THEN
BEGIN
shiftused := TRUE;
subjok := TRUE
END;
END;
IF ((NOT subjok) AND subjshiftallowed ) THEN
BEGIN
IF (NOT supershiftused) THEN
BEGIN
supershiftused := TRUE;
subjok := TRUE
END;
END;
END
ELSE
subjok := TRUE;
result := result AND subjok
END; 
(*indobjok*)
IF result AND (synvpefsvar <> []) 
THEN
BEGIN
IF (synvpefsvar * LSAUXDOM_indobjvps <> []) THEN
BEGIN
indobjok := indobjrelfound; 
IF ((NOT indobjok) AND shiftallowed) THEN
BEGIN
IF (npinshiftfound AND (NOT shiftused)) THEN
BEGIN
shiftused := TRUE;
indobjok := TRUE
END;
END;
IF ((NOT indobjok) AND supershiftallowed ) THEN
BEGIN
IF (NOT supershiftused) THEN
BEGIN
supershiftused := TRUE;
indobjok := TRUE
END;
END;
IF ((NOT indobjok) AND hiddenshiftallowed) THEN
BEGIN
IF (NOT hiddenshiftused) THEN
BEGIN
hiddenshiftused := TRUE;
indobjok := TRUE
END;
END;
IF (NOT indobjok) THEN
BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_indobjvps; 
indobjok := TRUE;
END;
END
ELSE 
indobjok := TRUE;
result := result AND indobjok;
END; 
(*prepobjok*)
IF result AND (synvpefsvar <> [])
THEN
BEGIN
IF (synvpefsvar * LSAUXDOM_prepobjvps <> [])
THEN
BEGIN
prepobjok := prepobjrelfound; 
IF ((NOT prepobjok) AND shiftallowed) THEN
BEGIN
IF (preppinshiftfound AND (NOT shiftused)) THEN
BEGIN
shiftused := TRUE;
prepobjok := TRUE
END;
END;
IF ((NOT prepobjok) AND supershiftallowed ) THEN
BEGIN
IF (NOT supershiftused) THEN
BEGIN
supershiftused := TRUE;
prepobjok := TRUE
END;
END;
IF ((NOT prepobjok) AND hiddenshiftallowed AND strandedrelfound) 
THEN
BEGIN
IF (NOT hiddenshiftused) THEN
BEGIN
hiddenshiftused := TRUE;
prepobjok := TRUE
END;
END;
IF (NOT prepobjok) THEN
BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_prepobjvps; 
prepobjok := TRUE;
END;
END
ELSE 
prepobjok := TRUE;
result := result AND prepobjok;
END; 
(*prepobj2ok*)
IF result AND (synvpefsvar <> [])
THEN
BEGIN
IF (synvpefsvar * LSAUXDOM_twoprepobjvps <> [])
THEN
BEGIN
prepobj2ok := prepobj2relfound; 
IF ((NOT prepobj2ok) AND shiftallowed) THEN
BEGIN
IF (preppinshiftfound AND (NOT shiftused)) THEN
BEGIN
shiftused := TRUE;
prepobj2ok := TRUE
END;
END;
IF ((NOT prepobj2ok) AND supershiftallowed ) THEN
BEGIN
IF (NOT supershiftused) THEN
BEGIN
supershiftused := TRUE;
prepobj2ok := TRUE
END;
END;
IF (NOT prepobj2ok) THEN
BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_twoprepobjvps; 
prepobj2ok := TRUE;
END;
END
ELSE 
prepobj2ok := TRUE;
result := result AND prepobj2ok;
END; 
(*dirargok*)
IF result AND (synvpefsvar <> [])
THEN
BEGIN
IF (synvpefsvar * LSAUXDOM_dirargvps <> [])
THEN
BEGIN
dirargok := dirargrelfound; 
IF ((NOT dirargok) AND shiftallowed) THEN
BEGIN
IF ((preppinshiftfound OR advpinshiftfound) AND 
(NOT shiftused)) THEN
BEGIN
shiftused := TRUE;
dirargok := TRUE
END;
END;
IF ((NOT dirargok) AND supershiftallowed ) THEN
BEGIN
IF (NOT supershiftused) THEN
BEGIN
supershiftused := TRUE;
dirargok := TRUE
END;
END;
IF (NOT dirargok) THEN
BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_dirargvps; 
dirargok := TRUE;
END;
END
ELSE 
dirargok := TRUE;
result := result AND dirargok;
END; 
(*locargok*)
IF result AND (synvpefsvar <> [])
THEN
BEGIN
IF (synvpefsvar * LSAUXDOM_locargvps <> [])
THEN
BEGIN
locargok := locargrelfound; 
IF ((NOT locargok) AND shiftallowed) THEN
BEGIN
IF ((preppinshiftfound OR advpinshiftfound) AND 
(NOT shiftused)) THEN
BEGIN
shiftused := TRUE;
locargok := TRUE
END;
END;
IF ((NOT locargok) AND supershiftallowed ) THEN
BEGIN
IF (NOT supershiftused) THEN
BEGIN
supershiftused := TRUE;
locargok := TRUE
END;
END;
IF (NOT locargok) THEN
BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_locargvps; 
locargok := TRUE;
END;
END
ELSE 
locargok := TRUE;
result := result AND locargok;
END; 
(*nppredok*)
IF result AND (synvpefsvar <> [])
THEN
BEGIN
IF (synvpefsvar * (LSAUXDOM_nppredvps-[synBE])<> [])
THEN
BEGIN
nppredok := nppredrelfound; 
IF ((NOT nppredok) AND shiftallowed) THEN
BEGIN
IF (npinshiftfound AND (NOT shiftused)) THEN
BEGIN
shiftused := TRUE;
nppredok := TRUE
END;
END;
IF ((NOT nppredok) AND supershiftallowed ) THEN
BEGIN
IF (NOT supershiftused) THEN
BEGIN
supershiftused := TRUE;
nppredok := TRUE
END;
END;
IF (NOT nppredok) THEN
BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_nppredvps; 
nppredok := TRUE;
END;
END
ELSE 
nppredok := TRUE;
result := result AND nppredok;
END; 
(*adjppredok*)
IF result AND (synvpefsvar <> [])
THEN
BEGIN
IF (synvpefsvar *(LSAUXDOM_adjppredvps-[synBE])<> [])
THEN
BEGIN
adjppredok := adjppredrelfound; 
IF ((NOT adjppredok) AND shiftallowed) THEN
BEGIN
IF (adjpinshiftfound AND (NOT shiftused)) THEN
BEGIN
shiftused := TRUE;
adjppredok := TRUE
END;
END;
IF ((NOT adjppredok) AND supershiftallowed ) THEN
BEGIN
IF (NOT supershiftused) THEN
BEGIN
supershiftused := TRUE;
adjppredok := TRUE
END;
END;
IF (NOT adjppredok) THEN
BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_adjppredvps; 
adjppredok := TRUE;
END;
END
ELSE 
adjppredok := TRUE;
result := result AND adjppredok;
END; 
(*prepppredok*)
IF result AND (synvpefsvar <> [])
THEN
BEGIN
IF (synvpefsvar * (LSAUXDOM_prepppredvps-[synBE])<> [])
THEN
BEGIN
prepppredok := prepppredrelfound; 
IF ((NOT prepppredok) AND shiftallowed) THEN
BEGIN
IF (preppinshiftfound AND (NOT shiftused)) THEN
BEGIN
shiftused := TRUE;
prepppredok := TRUE
END;
END;
IF ((NOT prepppredok) AND supershiftallowed ) THEN
BEGIN
IF (NOT supershiftused) THEN
BEGIN
supershiftused := TRUE;
prepppredok := TRUE
END;
END;
IF (NOT prepppredok) THEN
BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_prepppredvps; 
prepppredok := TRUE;
END;
END
ELSE 
prepppredok := TRUE;
result := result AND prepppredok;
END; 
(*synbe*)
IF result AND (synvpefsvar <> [])
THEN
BEGIN
IF (synvpefsvar * [synBE] <> [])
THEN
BEGIN
synbeok := nppredrelfound OR adjppredrelfound OR prepppredrelfound
OR objrelfound; 
IF ((NOT synbeok) OR (synbeok AND therenpfound 
AND nppredrelfound)) THEN
BEGIN
synvpefsvar := synvpefsvar - [synBE]; 
synbeok := TRUE;
END;
END
ELSE 
synbeok:= TRUE;
result := result AND synbeok;
END; 
(*scomplok*)
IF result AND (synvpefsvar <> [])
THEN
BEGIN
IF (synvpefsvar * LSAUXDOM_sentcomplvps<> [])
THEN
BEGIN
scomplok := scomplrelfound OR extraposfound; 
IF (NOT scomplok) THEN
BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_sentcomplvps; 
scomplok := TRUE;
END;
END
ELSE 
scomplok := TRUE;
result := result AND scomplok;
END; 
(*asifcomplok*)
IF result AND (synvpefsvar <> [])
THEN
BEGIN
IF (synvpefsvar * LSAUXDOM_asifcomplvps<> [])
THEN
BEGIN
asifcomplok := asifcomplfound OR scomplrelfound; 
IF (NOT asifcomplok) THEN
BEGIN
synvpefsvar := synvpefsvar - LSAUXDOM_asifcomplvps; 
asifcomplok := TRUE;
END;
END
ELSE 
asifcomplok := TRUE;
result := result AND asifcomplok;
END; 
argspresent := result AND (synvpefsvar <> []);
END; (*FUNCTION argspresent*)

BEGIN CASE a OF
LIPRIMS_HINIT: BEGIN
accsubjfound := FALSE;
adjunctsvar := [];
adjpinshiftfound := FALSE;
auxfound := false;
adverbialvar := false;
advfound := false;
advpinshiftfound := FALSE;
asifcomplfound := FALSE;
classesvar := [];
conjaspectvar := omegaaspect;
conjclassvar := omegaTimeadvclass;
CONJconjfound := FALSE;
conjdeixisvar := omegadeixis;
conjfound := FALSE;
conjkeyvar := 0;
conjpatternsvar := [];
conjretrovar := false;
deixisvar := omegadeixis;
deixisvarvar := omegadeixis;
envvar := [pospol, negpol, omegapol];
extraposfound := FALSE;
extraposinfsortvar := omegainf;
extraposmoodvar := omegamood;
extraposmodusvar := omegamodus;
extraposok := FALSE;
extraposprosubjectvar := FALSE;
finalpuncfound := FALSE;
finitenessvar := omegafin;
finitenessvarvar := omegafin;
gensubjfound := FALSE;
infdoinconjfound := FALSE;
infsortreset := FALSE;
infsortvar := omegainf;
infsortvarvar := omegainf;
inversfound := false;
leftdislocfound := FALSE;
letinconjfound := FALSE;
letusgluefound := FALSE;
modusvar := omegamodus;
modusvarvar := omegamodus;
moodvar := omegamood;
negfound := FALSE;
nomsubjfound := FALSE;
notinauxfound := FALSE;
npinshiftfound := FALSE;
objrelfound := FALSE;
onlyaccsubjfound := FALSE;
onlynomsubjfound := FALSE;
particlekey := 0;
prepkeyvar1 := 0;
prepkeyvar2 := 0;
preppinshiftfound := FALSE;
prosubjectvar := FALSE;
RELPROfound := FALSE;
reqvar := [pospol, negpol, omegapol];
scomplrelfound := FALSE;
senttypevar := omegaclause;
Sinldlfound := FALSE;
shiftcases := [];
shiftfound := FALSE;
shiftnumbervar := omeganumber;
shiftpersonvar := 3;
shiftsexes := [];
shiftxpmoodvar := nowh;
strandedrelfound := FALSE;
subjNPhead := otherNP;
subjnumbervar := omeganumber;
subjpersonvar := 3;
subjfound := false;
synvpefsvar := [];
temporalvar := false;
tensevar := omegatense;
therenpfound := FALSE;
thetavpvar := omegathetavp;
tofound := FALSE;
VERBconjfound := FALSE;
verbpersonsvar := [];
verbnumbersvar := [];
verbpfound := false;
verbprepkeyvar1 := 0;
verbprepkeyvar2 := 0;
verbsubcvar := mainverb;
verbsynvpsvar := [];
verbthetavpvar := omegathetavp;
voicevar := active;
XPinldlfound := FALSE;
END (*hinit*);
1: (*conjrel/VERB*)
CASE mode OF
loccond:LIPRIMS_assignstatus( ((b^.ls^.VERBfield^.subc <> mainverb) AND
(b^.ls^.VERBfield^.modus IN [indicative])
) OR
(letinconj(b) AND
(b^.ls^.VERBfield^.modus IN [infinitive])
) OR
(((b^.ls^.VERBfield^.subc = doaux) OR
((b^.ls^.VERBfield^.subc = notaux) AND
(getsubc(b) = doaux)
)
) AND
(b^.ls^.VERBfield^.modus IN [infinitive])
)
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
conjfound := true;
VERBconjfound := true;
letinconjfound := letinconj(b);
infdoinconjfound := 
(((b^.ls^.VERBfield^.subc = doaux) OR
((b^.ls^.VERBfield^.subc = notaux) AND
(getsubc(b) = doaux)
)
) AND
(b^.ls^.VERBfield^.modus IN [infinitive])
);
IF (letinconjfound OR infdoinconjfound)
THEN finitenessvar := infinite
ELSE finitenessvar := finite;
modusvar := b^.ls^.VERBfield^.modus;
verbpersonsvar := b^.ls^.VERBfield^.persons;
verbnumbersvar := b^.ls^.VERBfield^.numbers;
tensevar := b^.ls^.VERBfield^.tense;
IF b^.ls^.VERBfield^.subc = notaux THEN BEGIN
notinauxfound := true;
verbsubcvar := getsubc(b);
END
ELSE verbsubcvar := b^.ls^.VERBfield^.subc;
verbthetavpvar := b^.ls^.VERBfield^.thetavp;
verbsynvpsvar := b^.ls^.VERBfield^.synvps; 
classesvar := b^.ls^.VERBfield^.classes;
END
END; END;
2: (*subjNP*)
CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := subjrel;
subjfound := TRUE;
IF VERBconjfound 
THEN inversfound := true;
subjpersonvar := b^.ls^.NPfield^.person;
subjnumbervar := b^.ls^.NPfield^.number;
subjNPhead := b^.ls^.NPfield^.NPhead;
gensubjfound := genundernp(b);
IF (NOT gensubjfound) AND
(nominative IN b^.ls^.NPfield^.cases)
THEN nomsubjfound := TRUE;
IF (NOT gensubjfound) AND
(accusative IN b^.ls^.NPfield^.cases)
THEN accsubjfound := TRUE;
onlyaccsubjfound := accsubjfound AND
(NOT nomsubjfound);
onlynomsubjfound := nomsubjfound AND
(NOT accsubjfound);
therenpfound := therenp_(b);
END
END; END;
3: (*auxrel/VERB*)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.VERBfield^.subc <> mainverb) AND
(b^.ls^.VERBfield^.modus IN [indicative, subjunctive]) AND
((b^.ls^.VERBfield^.subc = haveverb) <= 
((b^.ls^.VERBfield^.thetavp = thetavpaux) OR
(synNP IN b^.ls^.VERBfield^.synvps)
)
)
);globcond: BEGIN  BEGIN
SYNREL := auxrel;
auxfound := true;
finitenessvar := finite;
modusvar := b^.ls^.VERBfield^.modus;
tensevar := b^.ls^.VERBfield^.tense;
IF b^.ls^.VERBfield^.subc = notaux THEN BEGIN
notinauxfound := true;
verbsubcvar := getsubc(b);
END
ELSE verbsubcvar := b^.ls^.VERBfield^.subc;
verbthetavpvar:= b^.ls^.VERBfield^.thetavp;
verbsynvpsvar := b^.ls^.VERBfield^.synvps; 
classesvar := b^.ls^.VERBfield^.classes;
END
END; END;
4: (*predrel/VERBP*)
CASE mode OF
loccond:LIPRIMS_assignstatus( true
);globcond: BEGIN  BEGIN
SYNREL := predrel;
verbpfound := true;
IF b^.ls^.VERBPfield^.headfound THEN BEGIN
synvpefsvar := b^.ls^.VERBPfield^.synvpefs
END 
ELSE BEGIN
synvpefsvar := verbsynvpsvar * b^.ls^.VERBPfield^.synvpefs
END;
(* synvpefsvar is item parameter, thetavpvar not*)
IF b^.ls^.VERBPfield^.headfound THEN BEGIN
thetavpvar := b^.ls^.VERBPfield^.thetavp
END 
ELSE BEGIN
thetavpvar := verbthetavpvar
END;
voicevar := b^.ls^.VERBPfield^.voice;
IF (NOT auxfound) AND (NOT VERBconjfound)
THEN BEGIN
finitenessvar := b^.ls^.VERBPfield^.finiteness;
modusvar := b^.ls^.VERBPfield^.modus;
deixisvar := b^.ls^.VERBPfield^.deixis;
END;
IF ((verbsubcvar <> modalverb) AND
(b^.ls^.VERBPfield^.headfound)
)
THEN classesvar := b^.ls^.VERBPfield^.classes;
adjunctsvar := b^.ls^.VERBPfield^.adjuncts;
extraposok := NOT (b^.ls^.VERBPfield^.scomplfound);
scomplrelfound := b^.ls^.VERBPfield^.scomplfound;
objrelfound := b^.ls^.VERBPfield^.objfound;
indobjrelfound := b^.ls^.VERBPfield^.indobjfound;
locargrelfound := b^.ls^.VERBPfield^.locargfound;
dirargrelfound := b^.ls^.VERBPfield^.dirargfound;
prepobjrelfound := b^.ls^.VERBPfield^.prepobjfound;
prepobj2relfound := b^.ls^.VERBPfield^.prepobj2found;
nppredrelfound := b^.ls^.VERBPfield^.nppredfound;
adjppredrelfound := b^.ls^.VERBPfield^.adjppredfound;
prepppredrelfound := b^.ls^.VERBPfield^.prepppredfound;
strandedrelfound := b^.ls^.VERBPfield^.strandedfound;
END
END; END;
5: (*punc*)
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PUNCfield^.key = auxkey('periodpunckey')
) OR
(b^.ls^.PUNCfield^.key = auxkey('qupunckey')
) OR
(b^.ls^.PUNCfield^.key = auxkey('exclampunckey')
) OR
(b^.ls^.PUNCfield^.key = auxkey('semicolonpunckey')
)
);globcond: BEGIN  BEGIN
SYNREL := puncrel;
finalpuncfound := true;
END
END; END;
6: 
CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := negrel;
negfound := TRUE;
END
END; END;
7: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.PUNCfield^.key = auxkey('commaPUNCkey')

);globcond: BEGIN  BEGIN
SYNREL := puncrel;
END
END; END;
8: 
CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
conjfound := TRUE;
CONJconjfound := TRUE;
conjkeyvar := b^.ls^.CONJfield^.key;
conjpatternsvar := b^.ls^.CONJfield^.conjpatterns;
adverbialvar := b^.ls^.CONJfield^.adverbial;
temporalvar := b^.ls^.CONJfield^.temporal;
conjaspectvar := b^.ls^.CONJfield^.aspect;
conjdeixisvar := b^.ls^.CONJfield^.deixis;
conjretrovar := b^.ls^.CONJfield^.retro;
conjclassvar := b^.ls^.CONJfield^.class;
END
END; END;
9: 
CASE mode OF
loccond:LIPRIMS_assignstatus( b^.ls^.NPfield^.mood = wh
);globcond: BEGIN  BEGIN
SYNREL := shiftrel;
shiftxpmoodvar := b^.ls^.NPfield^.mood;
npinshiftfound := TRUE;
shiftfound := TRUE;
shiftcases := b^.ls^.NPfield^.cases;
shiftsexes := b^.ls^.NPfield^.sexes;
(* used in detmood3 to pick out the correct occurences of 'who' doubling as a
relative *)
shiftpersonvar := b^.ls^.NPfield^.person;
shiftnumbervar := b^.ls^.NPfield^.number;
END
END; END;
10: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(b^.ls^.PREPPfield^.mood = wh)
);globcond: BEGIN  BEGIN
SYNREL := shiftrel;
preppinshiftfound := TRUE;
shiftfound := TRUE;
shiftxpmoodvar := b^.ls^.PREPPfield^.mood;
END
END; END;
11: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.mood = wh)
);globcond: BEGIN  BEGIN
SYNREL := shiftrel;
advpinshiftfound := TRUE;
shiftfound := TRUE;
shiftxpmoodvar := b^.ls^.ADVPfield^.mood;
END
END; END;
12: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADJPfield^.mood = wh) AND
(predicative IN b^.ls^.ADJPfield^.actuseefs)
);globcond: BEGIN  BEGIN
SYNREL := shiftrel;
shiftfound := TRUE;
adjpinshiftfound := TRUE;
shiftxpmoodvar := b^.ls^.ADJPfield^.mood;
END
END; END;
13: 
CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := shiftrel;
shiftfound := TRUE;
RELPROfound := TRUE;
END
END; END;
14: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.adverbial = FALSE) AND
(b^.ls^.SENTENCEfield^.senttype = subordinateclause) AND
(b^.ls^.SENTENCEfield^.mood IN [declarative, yesnointerrogative,
whinterrogative]) AND
(((b^.ls^.SENTENCEfield^.modus = infinitive) AND
(b^.ls^.SENTENCEfield^.infsort <> fortoinf)
) <= (b^.ls^.SENTENCEfield^.prosubject)
) AND
(((b^.ls^.SENTENCEfield^.finiteness = finite) AND
(b^.ls^.SENTENCEfield^.conjkey <> 0)
) OR
((b^.ls^.SENTENCEfield^.modus = infinitive) AND
(b^.ls^.SENTENCEfield^.infsort IN [toinf, fortoinf])
)
)
);globcond: BEGIN  BEGIN
SYNREL := leftdislocrel;
leftdislocfound := TRUE;
XPinldlfound := TRUE;
Sinldlfound := TRUE;
END
END; END;
15: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.adverbial)
);globcond: BEGIN  BEGIN
SYNREL := leftdislocrel;
leftdislocfound := TRUE;
Sinldlfound := TRUE;
END
END; END;
16: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (locadv IN b^.ls^.ADVPfield^.actsubcefs)
(* position of adverbial *)
);globcond: BEGIN  BEGIN
SYNREL := locadvrel;
extraposok := TRUE;
advfound := TRUE;
END
END; END;
17: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (NOT b^.ls^.PREPPfield^.stranded) AND
(loc IN b^.ls^.PREPPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := locadvrel;
extraposok := TRUE;
advfound := TRUE;
END
END; END;
18: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (tempadv IN b^.ls^.ADVPfield^.actsubcefs)
);globcond: BEGIN  BEGIN
SYNREL := tempadvrel;
extraposok := TRUE;
advfound := TRUE;
END
END; END;
19: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (temp IN b^.ls^.PREPPfield^.actsubcefs) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := tempadvrel;
extraposok := TRUE;
advfound := TRUE;
END
END; END;
20: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.actsubcefs * [sentadv, causadv] <> [])
);globcond: BEGIN  BEGIN
SYNREL := sentadvrel;
extraposok := TRUE;
advfound := TRUE;
END
END; END;
21: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.actsubcefs * [according, caus] <> []) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := sentadvrel;
extraposok := TRUE;
advfound := TRUE;
END
END; END;
22: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.temporal = TRUE)
);globcond: BEGIN  BEGIN
SYNREL := tempadvrel;
extraposok := TRUE;
advfound := TRUE;
END
END; END;
23: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.SENTENCEfield^.adverbial)
);globcond: BEGIN  BEGIN
SYNREL := postsentadvrel;
END
END; END;
24: 
CASE mode OF
loccond:LIPRIMS_assignstatus( ((NOT b^.ls^.SENTENCEfield^.adverbial) OR
(b^.ls^.SENTENCEfield^.conjkey = auxkey('asifCONJkey')
)
) AND
(b^.ls^.SENTENCEfield^.mood IN [declarative, yesnointerrogative,
WHinterrogative]
) AND
(b^.ls^.SENTENCEfield^.senttype = subordinateclause
) AND
(((b^.ls^.SENTENCEfield^.finiteness = finite) AND
((b^.ls^.SENTENCEfield^.mood = declarative) <=
(b^.ls^.SENTENCEfield^.conjkey <> 0))
) OR
((b^.ls^.SENTENCEfield^.finiteness = infinite) AND
((b^.ls^.SENTENCEfield^.prosubject = TRUE) OR
(b^.ls^.SENTENCEfield^.infsort = fortoinf)
)
) 
) AND
(b^.ls^.SENTENCEfield^.modus <> ingform) AND
(b^.ls^.SENTENCEfield^.modus <> participle)
(*[b^.ls^.SENTENCEfield^.modus] * [ingform, participle] = []
*) AND
([b^.ls^.SENTENCEfield^.infsort] * [inf] = [] )
);globcond: BEGIN  BEGIN
SYNREL := extraposrel;
extraposfound := TRUE;
IF b^.ls^.SENTENCEfield^.conjkey = auxkey('asifCONJkey')

THEN asifcomplfound := TRUE;
extraposmoodvar := b^.ls^.SENTENCEfield^.mood;
extraposmodusvar := b^.ls^.SENTENCEfield^.modus;
extraposinfsortvar := b^.ls^.SENTENCEfield^.infsort;
extraposprosubjectvar := b^.ls^.SENTENCEfield^.prosubject;
END
END; END;
25: 
CASE mode OF
loccond:LIPRIMS_assignstatus( 2 IN b^.ls^.ADVPfield^.position
);globcond: BEGIN  BEGIN
SYNREL := modrel
END
END; END;
26: 
CASE mode OF
loccond:LIPRIMS_assignstatus( 3 IN b^.ls^.ADVPfield^.position
);globcond: BEGIN  BEGIN
SYNREL := modrel
END
END; END;
27: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.NPfield^.mood = nowh) AND
(b^.ls^.NPfield^.cases <> [Nominative]) AND
(b^.ls^.NPfield^.nphead <> itnp)
);globcond: BEGIN  BEGIN
SYNREL := leftdislocrel;
leftdislocfound := TRUE;
XPinldlfound := TRUE;
END
END; END;
28: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.PREPPfield^.mood = nowh) AND
(NOT b^.ls^.PREPPfield^.stranded)
);globcond: BEGIN  BEGIN
SYNREL := leftdislocrel;
leftdislocfound := TRUE;
XPinldlfound := TRUE;
END
END; END;
29: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADVPfield^.mood = nowh) 
);globcond: BEGIN  BEGIN
SYNREL := leftdislocrel;
leftdislocfound := TRUE;
XPinldlfound := TRUE;
END
END; END;
30: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (b^.ls^.ADJPfield^.mood = nowh) AND
(predicative IN b^.ls^.ADJPfield^.actuseefs) 
);globcond: BEGIN  BEGIN
SYNREL := leftdislocrel;
leftdislocfound := TRUE;
XPinldlfound := TRUE;
END
END; END;
31: 
CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := torel;
tofound := TRUE;
END
END; END;
32: 
CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := subjrel;
subjfound := TRUE;
gensubjfound := TRUE;
END
END; END;
33: 
CASE mode OF
loccond:LIPRIMS_assignstatus( TRUE
);globcond: BEGIN  BEGIN
SYNREL := gluerel;
letusgluefound := TRUE;
END
END; END;
34: 
CASE mode OF
loccond:LIPRIMS_assignstatus( (synTHATSENT IN b^.ls^.PREPfield^.synpps)
);globcond: BEGIN  BEGIN
SYNREL := conjrel;
conjfound := TRUE;
CONJconjfound := TRUE;
conjpatternsvar := b^.ls^.PREPfield^.synpps;
adverbialvar := TRUE;
temporalvar := (temp IN b^.ls^.PREPfield^.subcs);
conjaspectvar := b^.ls^.PREPfield^.aspect;
conjdeixisvar := b^.ls^.PREPfield^.deixis;
conjretrovar := b^.ls^.PREPfield^.retro;
conjclassvar := b^.ls^.PREPfield^.class;
END
END; END;
LIPRIMS_HFINAL: BEGIN LIPRIMS_assignstatus( (auxfound OR VERBconjfound OR verbpfound) AND 
conjandfinok AND
((conjkeyvar = auxkey('fortoconjkey')
) 
<= (accsubjfound AND
tofound
)
) AND
((negfound AND (finitenessvar = finite)
)
<= (auxfound OR
verbconjfound)
) AND
(
(negfound AND (finitenessvar = infinite) AND
(NOT (accsubjfound)))
<= tofound
)
);IF LIPRIMS_status THEN BEGIN
IF (deixisvar = omegadeixis) THEN 
IF (tensevar = presenttense)
THEN deixisvar := presentdeixis
ELSE IF (tensevar = pasttense)
THEN deixisvar := pastdeixis;
IF (modusvar = infinitive)
THEN IF tofound
THEN IF conjkeyvar = auxkey('fortoCONJkey')
 
THEN infsortvar := fortoinf
ELSE infsortvar := toinf
ELSE infsortvar := inf
ELSE IF (modusvar = ingform)
THEN
IF accsubjfound THEN infsortvar := accing
ELSE IF gensubjfound THEN infsortvar := possing
ELSE infsortvar := omegainf
ELSE ;
reduce(synvpefsvar);
IF (synvpefsvar <> []) THEN BEGIN
moodvar := omegamood;
IF (modusvar = ingform) AND
(infsortvar = omegainf)
THEN BEGIN
infsortreset := TRUE;
infsortvar := opening;
END;
deixisvarvar := deixisvar;
infsortvarvar := infsortvar;
finitenessvarvar := finitenessvar;
modusvarvar := modusvar;
IF (NOT adverbialvar) THEN
detmood1(moodvar, senttypevar, prosubjectvar);
IF (moodvar <> omegamood)
THEN BEGIN (*detmood1, moodvar <> omegamood*)
IF subordcondsok AND
argspresent
THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar;
top^.ls^.SENTENCEfield^.senttype := senttypevar; 
top^.ls^.SENTENCEfield^.voice := voicevar;
top^.ls^.SENTENCEfield^.PROsubject := prosubjectvar;
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.adjuncts := adjunctsvar;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvarvar ;
computeaktarts( classesvar, top^.ls^.SENTENCEfield^.aktionsarts );
top^.ls^.SENTENCEfield^.aspect := omegaaspect ;
top^.ls^.SENTENCEfield^.deixis := deixisvarvar ;
top^.ls^.SENTENCEfield^.retro := false;
top^.ls^.SENTENCEfield^.finiteness := finitenessvarvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvarvar; 
top^.ls^.SENTENCEfield^.superdeixis := omegadeixis ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar;
top^.ls^.SENTENCEfield^.temporal := temporalvar;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar;
END; (*subordcondsok*)
END; (*detmood1, moodvar <> omegamood*)
moodvar := omegamood;
IF (modusvar = ingform) AND
NOT (infsortreset)
THEN BEGIN 
infsortvar := accing;
deixisvarvar := deixisvar;
infsortvarvar := infsortvar;
finitenessvarvar := finitenessvar;
modusvarvar := modusvar;
IF (NOT adverbialvar) THEN
detmood1(moodvar, senttypevar, prosubjectvar);
IF (moodvar <> omegamood)
THEN BEGIN (*detmood1, moodvar <> omegamood*)
IF subordcondsok AND
argspresent
THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar;
top^.ls^.SENTENCEfield^.senttype := senttypevar; 
top^.ls^.SENTENCEfield^.voice := voicevar;
top^.ls^.SENTENCEfield^.PROsubject := prosubjectvar;
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.adjuncts := adjunctsvar;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvarvar ;
computeaktarts( classesvar, top^.ls^.SENTENCEfield^.aktionsarts );
top^.ls^.SENTENCEfield^.aspect := omegaaspect ;
top^.ls^.SENTENCEfield^.deixis := deixisvarvar ;
top^.ls^.SENTENCEfield^.retro := false;
top^.ls^.SENTENCEfield^.finiteness := finitenessvarvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvarvar; 
top^.ls^.SENTENCEfield^.superdeixis := omegadeixis ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar;
top^.ls^.SENTENCEfield^.temporal := temporalvar;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar;
END; (*subordcondsok*)
END; (*detmood1, moodvar <> omegamood*)
END; (*ingform, omegainf*)
moodvar := omegamood;
deixisvarvar := deixisvar;
infsortvarvar := infsortvar;
finitenessvarvar := finitenessvar;
modusvarvar := modusvar;
IF (NOT adverbialvar) THEN
detmood2(moodvar, senttypevar, prosubjectvar);
IF (moodvar <> omegamood)
THEN BEGIN (*detmood2, moodvar <> omegamood*)
IF subordcondsok AND
argspresent
THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar;
top^.ls^.SENTENCEfield^.senttype := senttypevar; 
top^.ls^.SENTENCEfield^.voice := voicevar;
top^.ls^.SENTENCEfield^.PROsubject := prosubjectvar;
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.adjuncts := adjunctsvar;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvarvar ;
computeaktarts( classesvar, top^.ls^.SENTENCEfield^.aktionsarts );
top^.ls^.SENTENCEfield^.aspect := omegaaspect ;
top^.ls^.SENTENCEfield^.deixis := deixisvarvar ;
top^.ls^.SENTENCEfield^.retro := false;
top^.ls^.SENTENCEfield^.finiteness := finitenessvarvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvarvar; 
top^.ls^.SENTENCEfield^.superdeixis := omegadeixis ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar;
top^.ls^.SENTENCEfield^.temporal := temporalvar;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar;
END; (*subordcondsok*)
END; (*detmood2, moodvar <> omegamood*)
moodvar := omegamood;
deixisvarvar := deixisvar;
infsortvarvar := infsortvar;
finitenessvarvar := finitenessvar;
modusvarvar := modusvar;
IF (NOT adverbialvar) THEN
detmood3(moodvar, senttypevar, prosubjectvar);
IF (moodvar <> omegamood)
THEN BEGIN (*detmood3, moodvar <> omegamood*)
IF subordcondsok AND
argspresent
THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar;
top^.ls^.SENTENCEfield^.senttype := senttypevar; 
top^.ls^.SENTENCEfield^.voice := voicevar;
top^.ls^.SENTENCEfield^.PROsubject := prosubjectvar;
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.adjuncts := adjunctsvar;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvarvar ;
computeaktarts( classesvar, top^.ls^.SENTENCEfield^.aktionsarts );
top^.ls^.SENTENCEfield^.aspect := omegaaspect ;
top^.ls^.SENTENCEfield^.deixis := deixisvarvar ;
top^.ls^.SENTENCEfield^.retro := false;
top^.ls^.SENTENCEfield^.finiteness := finitenessvarvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvarvar; 
top^.ls^.SENTENCEfield^.superdeixis := omegadeixis ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar;
top^.ls^.SENTENCEfield^.temporal := temporalvar;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar;
END; (*subordcondsok*)
END; (*detmood3, moodvar <> omegamood*)
moodvar := omegamood;
deixisvarvar := deixisvar;
infsortvarvar := infsortvar;
finitenessvarvar := finitenessvar;
modusvarvar := modusvar;
IF (NOT adverbialvar) THEN
detmood4(moodvar, senttypevar, prosubjectvar);
IF (moodvar <> omegamood)
THEN BEGIN (*detmood4, moodvar <> omegamood*)
IF subordcondsok AND
argspresent
THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar;
top^.ls^.SENTENCEfield^.senttype := senttypevar; 
top^.ls^.SENTENCEfield^.voice := voicevar;
top^.ls^.SENTENCEfield^.PROsubject := prosubjectvar;
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.adjuncts := adjunctsvar;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvarvar ;
computeaktarts( classesvar, top^.ls^.SENTENCEfield^.aktionsarts );
top^.ls^.SENTENCEfield^.aspect := omegaaspect ;
top^.ls^.SENTENCEfield^.deixis := deixisvarvar ;
top^.ls^.SENTENCEfield^.retro := false;
top^.ls^.SENTENCEfield^.finiteness := finitenessvarvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvarvar; 
top^.ls^.SENTENCEfield^.superdeixis := omegadeixis ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar;
top^.ls^.SENTENCEfield^.temporal := temporalvar;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar;
END; (*subordcondsok*)
END; (*detmood4, moodvar <> omegamood*)
moodvar := omegamood;
deixisvarvar := deixisvar;
infsortvarvar := infsortvar;
finitenessvarvar := finitenessvar;
modusvarvar := modusvar;
IF (adverbialvar) THEN
detmoodadv(moodvar, senttypevar, prosubjectvar);
IF (moodvar <> omegamood)
THEN BEGIN (*detmoodadv, moodvar <> omegamood*)
IF subordcondsok AND
argspresent
THEN BEGIN
top:=MAKET_stree(SENTENCE);
litop:=loopholes.retype(top,LISTREE_pstree);
LIPRIMS_addnewtop(litop)
;
top^.ls^.SENTENCEfield^.req := reqvar ;
top^.ls^.SENTENCEfield^.env := envvar ;
top^.ls^.SENTENCEfield^.mood := moodvar;
top^.ls^.SENTENCEfield^.senttype := senttypevar; 
top^.ls^.SENTENCEfield^.voice := voicevar;
top^.ls^.SENTENCEfield^.PROsubject := prosubjectvar;
top^.ls^.SENTENCEfield^.synvpefs := synvpefsvar ;
top^.ls^.SENTENCEfield^.adjuncts := adjunctsvar;
top^.ls^.SENTENCEfield^.thetavp := thetavpvar ;
top^.ls^.SENTENCEfield^.modus := modusvarvar ;
computeaktarts( classesvar, top^.ls^.SENTENCEfield^.aktionsarts );
top^.ls^.SENTENCEfield^.aspect := omegaaspect ;
top^.ls^.SENTENCEfield^.deixis := deixisvarvar ;
top^.ls^.SENTENCEfield^.retro := false;
top^.ls^.SENTENCEfield^.finiteness := finitenessvarvar ;
top^.ls^.SENTENCEfield^.infsort := infsortvarvar; 
top^.ls^.SENTENCEfield^.superdeixis := omegadeixis ;
top^.ls^.SENTENCEfield^.conjkey := conjkeyvar;
top^.ls^.SENTENCEfield^.adverbial := adverbialvar;
top^.ls^.SENTENCEfield^.temporal := temporalvar;
top^.ls^.SENTENCEfield^.conjaspect := conjaspectvar;
top^.ls^.SENTENCEfield^.conjclass := conjclassvar;
top^.ls^.SENTENCEfield^.conjdeixis := conjdeixisvar;
top^.ls^.SENTENCEfield^.conjretro := conjretrovar;
END; (*subordcondsok*)
END; (*detmoodadv, moodvar <> omegamood*)
END; (*if synvpefsvar <> [] then*)
END; (*final action*)
END; END;
END; (* Sentence *) 
END;{package}
procedure SURFRULES_rule(rnr:INTEGER;a:LIPRIMS_nodeid;
            b:LISTREE_pStree;mode:LIPRIMS_surfrulemode);
VAR lsb:LSSTREE_pStree;
BEGIN
lsb:=loopholes.retype(b,LSSTREE_pStree);
CASE rnr OF
  1:WITH UTTpack DO UTTrule(a,lsb,mode);
  2:WITH VERBPrulepack DO VERBPrulerule(a,lsb,mode);
  3:WITH VERBNEGrulepack DO VERBNEGrulerule(a,lsb,mode);
  4:WITH NP1rulepack DO NP1rulerule(a,lsb,mode);
  5:WITH NP2rulepack DO NP2rulerule(a,lsb,mode);
  6:WITH NP3rulepack DO NP3rulerule(a,lsb,mode);
  7:WITH NP4rulepack DO NP4rulerule(a,lsb,mode);
  8:WITH NP5rulepack DO NP5rulerule(a,lsb,mode);
  9:WITH CN1rulepack DO CN1rulerule(a,lsb,mode);
 10:WITH DETPrulepack DO DETPrulerule(a,lsb,mode);
 11:WITH PREPPrulepack DO PREPPrulerule(a,lsb,mode);
 12:WITH ADVPrule1pack DO ADVPrule1rule(a,lsb,mode);
 13:WITH NP6rulepack DO NP6rulerule(a,lsb,mode);
 14:WITH NP7rulepack DO NP7rulerule(a,lsb,mode);
 15:WITH ADJP1srulepack DO ADJP1srulerule(a,lsb,mode);
 16:WITH ADJP2rulepack DO ADJP2rulerule(a,lsb,mode);
 17:WITH QP1rulepack DO QP1rulerule(a,lsb,mode);
 18:WITH THANPrulepack DO THANPrulerule(a,lsb,mode);
 19:WITH SENTENCE1rulepack DO SENTENCE1rulerule(a,lsb,mode);
END
END;
FUNCTION SURFRULES_maxrnr:INTEGER;
BEGIN
SURFRULES_maxrnr:= 19
END;
FUNCTION SURFRULES_synrel:LIDOMAINT_synrel;
BEGIN
SURFRULES_synrel:=loopholes.retype(synrel,LIDOMAINT_synrel)
END;
