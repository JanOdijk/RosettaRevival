
EXPORT(liilrules);
pragma C_include('liilrules.pf');
pragma C_include('strings.pf');
pragma C_include('windows.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('mem.pf');
pragma C_include('str.pf');
pragma C_include('lirectoscreen.pf');
PROGRAM LIILrules;

WITH windows,ldconvrec,mem,str,lirectoscreen;


PROCEDURE convINTEGER(valeu:INTEGER;VAR str:string;VAR len:INTEGER);
VAR len1:STR_range;
BEGIN
STR_IntegerTostr(valeu,str,len1);
len:=len1;
END;
PROCEDURE convHUMANTYPE(valeu:LIILRULES_HUMANTYPE;
VAR str:string;VAR len:INTEGER);
BEGIN
IF valeu=ILYESHUMAN THEN
BEGIN 
str:='ILYESHUMAN';
len:=10 END;
IF valeu=ILNOHUMAN THEN
BEGIN 
str:='ILNOHUMAN';
len:=9 END;
IF valeu=ILOMEGAHUMAN THEN
BEGIN 
str:='ILOMEGAHUMAN';
len:=12 END;
END;
                                                      PROCEDURE convCATTYPE(valeu:LIILRULES_CATTYPE;
VAR str:string;VAR len:INTEGER);
BEGIN
IF valeu=ILPP THEN
BEGIN 
str:='ILPP';
len:=4 END;
IF valeu=ILNP THEN
BEGIN 
str:='ILNP';
len:=4 END;
IF valeu=ILADVP THEN
BEGIN 
str:='ILADVP';
len:=6 END;
IF valeu=ILOADJPP THEN
BEGIN 
str:='ILOADJPP';
len:=8 END;
IF valeu=ILCADJPP THEN
BEGIN 
str:='ILCADJPP';
len:=8 END;
IF valeu=ILOADVPP THEN
BEGIN 
str:='ILOADVPP';
len:=8 END;
IF valeu=ILCADVPP THEN
BEGIN 
str:='ILCADVPP';
len:=8 END;
IF valeu=ILONPP THEN
BEGIN 
str:='ILONPP';
len:=6 END;
IF valeu=ILCNPP THEN
BEGIN 
str:='ILCNPP';
len:=6 END;
IF valeu=ILOPPP THEN
BEGIN 
str:='ILOPPP';
len:=6 END;
IF valeu=ILCPPP THEN
BEGIN 
str:='ILCPPP';
len:=6 END;
IF valeu=ILSENTENCE THEN
BEGIN 
str:='ILSENTENCE';
len:=10 END;
IF valeu=ILVP THEN
BEGIN 
str:='ILVP';
len:=4 END;
IF valeu=ILADJPP THEN
BEGIN 
str:='ILADJPP';
len:=7 END;
END;
                                                      PROCEDURE convKOMMATYPE(valeu:LIILRULES_KOMMATYPE;
VAR str:string;VAR len:INTEGER);
BEGIN
IF valeu=YES THEN
BEGIN 
str:='YES';
len:=3 END;
IF valeu=NO THEN
BEGIN 
str:='NO';
len:=2 END;
END;
                                                      PROCEDURE convINDEXTYPE(valeu:LIILRULES_INDEXTYPE;
VAR str:string;VAR len:INTEGER);
VAR len1:STR_range;
BEGIN
STR_IntegerTostr(valeu,str,len1);
len:=len1;
len:=len1;
END;
                                                      PROCEDURE convDEIXISTYPE(valeu:LIILRULES_DEIXISTYPE;
VAR str:string;VAR len:INTEGER);
BEGIN
IF valeu=ILPRESENTDEIXIS THEN
BEGIN 
str:='ILPRESENTDEIXIS';
len:=15 END;
IF valeu=ILPASTDEIXIS THEN
BEGIN 
str:='ILPASTDEIXIS';
len:=12 END;
END;
                                                      PROCEDURE convADJUNCTTYPE(valeu:LIILRULES_ADJUNCTTYPE;
VAR str:string;VAR len:INTEGER);
BEGIN
IF valeu=ILRESAP THEN
BEGIN 
str:='ILRESAP';
len:=7 END;
IF valeu=ILRESPP THEN
BEGIN 
str:='ILRESPP';
len:=7 END;
IF valeu=ILCOMIT THEN
BEGIN 
str:='ILCOMIT';
len:=7 END;
IF valeu=ILBENFACTNP THEN
BEGIN 
str:='ILBENFACTNP';
len:=11 END;
IF valeu=ILBENFACTPP THEN
BEGIN 
str:='ILBENFACTPP';
len:=11 END;
IF valeu=ILLOCADJUNCT THEN
BEGIN 
str:='ILLOCADJUNCT';
len:=12 END;
IF valeu=ILDIRADJUNCT THEN
BEGIN 
str:='ILDIRADJUNCT';
len:=12 END;
IF valeu=ILRESNP THEN
BEGIN 
str:='ILRESNP';
len:=7 END;
END;
                                                      PROCEDURE convNUMBERTYPE(valeu:LIILRULES_NUMBERTYPE;
VAR str:string;VAR len:INTEGER);
BEGIN
IF valeu=ILSINGULAR THEN
BEGIN 
str:='ILSINGULAR';
len:=10 END;
IF valeu=ILPLURAL THEN
BEGIN 
str:='ILPLURAL';
len:=8 END;
END;
                                                      PROCEDURE MakeParamlist(VAR p:LIILRULES_paramlist);
BEGIN
MEM_NewDefault(loopholes.sizeof(LIILRULES_aramlist),loopholes.retype(p,MEM_Ptr));
END;
 PROCEDURE LIILRULES_RuleName (R:LIILrules_RuleIndex;
 VAR name: string;
 VAR length: INTEGER);
BEGIN
 CASE R OF
1: BEGIN
 name := 'LADJUNCTVAR1';
 length := 12;
 END;
2: BEGIN
 name := 'LADJUNCTVAR2';
 length := 12;
 END;
3: BEGIN
 name := 'LADJUNCTVAR3';
 length := 12;
 END;
4: BEGIN
 name := 'LADJUNCTVAR4';
 length := 12;
 END;
5: BEGIN
 name := 'LNNCOMPOUNDS';
 length := 12;
 END;
6: BEGIN
 name := 'LVNCOMPOUNDS';
 length := 12;
 END;
7: BEGIN
 name := 'LCOORDINTRO';
 length := 11;
 END;
8: BEGIN
 name := 'LSIMPLECOORD';
 length := 12;
 END;
9: BEGIN
 name := 'LCORRCOORD';
 length := 10;
 END;
10: BEGIN
 name := 'LITCORRCOORD';
 length := 12;
 END;
11: BEGIN
 name := 'LITSIMPLECOORD';
 length := 14;
 END;
12: BEGIN
 name := 'LAANACTIVE';
 length := 10;
 END;
13: BEGIN
 name := 'LACCING';
 length := 7;
 END;
14: BEGIN
 name := 'LACTIVE';
 length := 7;
 END;
15: BEGIN
 name := 'LADHORT';
 length := 7;
 END;
16: BEGIN
 name := 'LAGVPADV';
 length := 8;
 END;
17: BEGIN
 name := 'LCAUSVAR';
 length := 8;
 END;
18: BEGIN
 name := 'LADJDEGREEMOD';
 length := 13;
 END;
19: BEGIN
 name := 'LEMPTYSUBST';
 length := 11;
 END;
20: BEGIN
 name := 'LEMPTYHETSUBST';
 length := 14;
 END;
21: BEGIN
 name := 'LEMPTYPREPSUBST';
 length := 15;
 END;
22: BEGIN
 name := 'LADJHELPEMPTY';
 length := 13;
 END;
23: BEGIN
 name := 'LADJEMPTYSUBJSUBST';
 length := 18;
 END;
24: BEGIN
 name := 'LADJMOD';
 length := 7;
 END;
25: BEGIN
 name := 'LADJOMTEMOD';
 length := 11;
 END;
26: BEGIN
 name := 'LADJTOADVDERIV';
 length := 14;
 END;
27: BEGIN
 name := 'LNOUNDIM';
 length := 8;
 END;
28: BEGIN
 name := 'LPNDIM';
 length := 6;
 END;
29: BEGIN
 name := 'LORDINALDERIV';
 length := 13;
 END;
30: BEGIN
 name := 'LADJVOOROBJ';
 length := 11;
 END;
31: BEGIN
 name := 'LADVSUBST';
 length := 9;
 END;
32: BEGIN
 name := 'LARGSUBST';
 length := 9;
 END;
33: BEGIN
 name := 'LASPECTIMPERFECTIVE';
 length := 19;
 END;
34: BEGIN
 name := 'LASPECTPERFECTIVE';
 length := 17;
 END;
35: BEGIN
 name := 'LASPECTHABITUAL';
 length := 15;
 END;
36: BEGIN
 name := 'LBNOUNPL';
 length := 8;
 END;
37: BEGIN
 name := 'LBNOUNSG';
 length := 8;
 END;
38: BEGIN
 name := 'LBTOPRONOUN';
 length := 11;
 END;
39: BEGIN
 name := 'LBPNTOPN';
 length := 8;
 END;
40: BEGIN
 name := 'LBTOBIGPRO';
 length := 10;
 END;
41: BEGIN
 name := 'LBTOSUB';
 length := 7;
 END;
42: BEGIN
 name := 'LCARD1';
 length := 6;
 END;
43: BEGIN
 name := 'LCARD2';
 length := 6;
 END;
44: BEGIN
 name := 'LCARDTODETP';
 length := 11;
 END;
45: BEGIN
 name := 'LCLANDSENTSUBST';
 length := 15;
 END;
46: BEGIN
 name := 'LCLORFORMULA';
 length := 12;
 END;
47: BEGIN
 name := 'LCLOSEDINF';
 length := 10;
 END;
48: BEGIN
 name := 'LCLOSEDNPP';
 length := 10;
 END;
49: BEGIN
 name := 'LCLOSEDVPPROP';
 length := 13;
 END;
50: BEGIN
 name := 'LCLOSEDXPP';
 length := 10;
 END;
51: BEGIN
 name := 'LCNFORMATION1';
 length := 13;
 END;
52: BEGIN
 name := 'LCNFORMATIONCOUNTSING';
 length := 21;
 END;
53: BEGIN
 name := 'LCNFORMATIONMASSPLUR';
 length := 20;
 END;
54: BEGIN
 name := 'LNOUNARGMOD1';
 length := 12;
 END;
55: BEGIN
 name := 'LNOUNARGMOD2';
 length := 12;
 END;
56: BEGIN
 name := 'LNPARGMODSUBST1';
 length := 15;
 END;
57: BEGIN
 name := 'LNPARGMODSUBST2';
 length := 15;
 END;
58: BEGIN
 name := 'LNPMODPOSS';
 length := 10;
 END;
59: BEGIN
 name := 'LCNMOD';
 length := 6;
 END;
60: BEGIN
 name := 'LCNMODINFREL';
 length := 12;
 END;
61: BEGIN
 name := 'LCNMODBARENP';
 length := 12;
 END;
62: BEGIN
 name := 'LCNMODNUM';
 length := 9;
 END;
63: BEGIN
 name := 'LCNMODPOSS';
 length := 10;
 END;
64: BEGIN
 name := 'LCNSPECPN';
 length := 9;
 END;
65: BEGIN
 name := 'LCONJSENT';
 length := 9;
 END;
66: BEGIN
 name := 'LCONJSENTSUBST';
 length := 14;
 END;
67: BEGIN
 name := 'LCONJSENTSUBSTINITIAL';
 length := 21;
 END;
68: BEGIN
 name := 'LCONJSENTSUBSTMIDDLE';
 length := 20;
 END;
69: BEGIN
 name := 'LCONJSENTSUBSTFINAL';
 length := 19;
 END;
70: BEGIN
 name := 'LCONJSVAR';
 length := 9;
 END;
71: BEGIN
 name := 'LDECLMAIN';
 length := 9;
 END;
72: BEGIN
 name := 'LDECLSUB';
 length := 8;
 END;
73: BEGIN
 name := 'LGELIEVEMOOD';
 length := 12;
 END;
74: BEGIN
 name := 'LDETDERIVATION';
 length := 14;
 END;
75: BEGIN
 name := 'LDETPFORMATION';
 length := 14;
 END;
76: BEGIN
 name := 'LDOORACTIVE';
 length := 11;
 END;
77: BEGIN
 name := 'LDURVARINSERTION';
 length := 16;
 END;
78: BEGIN
 name := 'LEMPTYSUBST';
 length := 11;
 END;
79: BEGIN
 name := 'LFINREL';
 length := 7;
 END;
80: BEGIN
 name := 'LFINWHMOD';
 length := 9;
 END;
81: BEGIN
 name := 'LFORTOINF';
 length := 9;
 END;
82: BEGIN
 name := 'LFORTOINFREL';
 length := 12;
 END;
83: BEGIN
 name := 'LFORTOINFWHMOD';
 length := 14;
 END;
84: BEGIN
 name := 'LIDENTNPANDPERSPRO';
 length := 18;
 END;
85: BEGIN
 name := 'LIDENTWHSG';
 length := 10;
 END;
86: BEGIN
 name := 'LIDENTWHPL';
 length := 10;
 END;
87: BEGIN
 name := 'LIDENT2NPANDSENT';
 length := 16;
 END;
88: BEGIN
 name := 'LIMPDEIXIS';
 length := 10;
 END;
89: BEGIN
 name := 'LIMP';
 length := 4;
 END;
90: BEGIN
 name := 'LIMPS';
 length := 5;
 END;
91: BEGIN
 name := 'LINJUNSUB';
 length := 9;
 END;
92: BEGIN
 name := 'LIRRMODALDEIXIS';
 length := 15;
 END;
93: BEGIN
 name := 'LIRRMODALSUPERDEIXIS';
 length := 20;
 END;
94: BEGIN
 name := 'LLOCADV';
 length := 7;
 END;
95: BEGIN
 name := 'LNEGINTRO';
 length := 9;
 END;
96: BEGIN
 name := 'LNEGVARINTRO';
 length := 12;
 END;
97: BEGIN
 name := 'LNONCNMOD';
 length := 9;
 END;
98: BEGIN
 name := 'LDATUMNP';
 length := 8;
 END;
99: BEGIN
 name := 'LDATUMYEAR';
 length := 10;
 END;
100: BEGIN
 name := 'LDATUMDAY';
 length := 9;
 END;
101: BEGIN
 name := 'LDATUMDAYNAME';
 length := 13;
 END;
102: BEGIN
 name := 'LDATUMDAYNUMBER';
 length := 15;
 END;
103: BEGIN
 name := 'LNPFORMATION1';
 length := 13;
 END;
104: BEGIN
 name := 'LNPFORMATION2';
 length := 13;
 END;
105: BEGIN
 name := 'LNPFORMATION3';
 length := 13;
 END;
106: BEGIN
 name := 'LNPFORMATIONINDEF';
 length := 17;
 END;
107: BEGIN
 name := 'LNPFORMATIONDEF';
 length := 15;
 END;
108: BEGIN
 name := 'LNPFORMATION6';
 length := 13;
 END;
109: BEGIN
 name := 'LCARDNP';
 length := 7;
 END;
110: BEGIN
 name := 'LNPFORMATIONPRONOUN';
 length := 19;
 END;
111: BEGIN
 name := 'LNPFORMATION9';
 length := 13;
 END;
112: BEGIN
 name := 'LNPFORMATION10';
 length := 14;
 END;
113: BEGIN
 name := 'LNPFORMATION11';
 length := 14;
 END;
114: BEGIN
 name := 'LNPFORMATION12';
 length := 14;
 END;
115: BEGIN
 name := 'LNPFORMATION13';
 length := 14;
 END;
116: BEGIN
 name := 'LNPFORMATION14';
 length := 14;
 END;
117: BEGIN
 name := 'LNPFORMATION17';
 length := 14;
 END;
118: BEGIN
 name := 'LNPINPPSUBST';
 length := 12;
 END;
119: BEGIN
 name := 'LNPOPENING';
 length := 10;
 END;
120: BEGIN
 name := 'LNONPINPPSUBST';
 length := 14;
 END;
121: BEGIN
 name := 'LNPAPPOSITION';
 length := 13;
 END;
122: BEGIN
 name := 'LNPMODADV';
 length := 9;
 END;
123: BEGIN
 name := 'LNPPARTITIVEFORMATION';
 length := 21;
 END;
124: BEGIN
 name := 'LOPENDECLINF';
 length := 12;
 END;
125: BEGIN
 name := 'LOPENING';
 length := 8;
 END;
126: BEGIN
 name := 'LOPENNPP';
 length := 8;
 END;
127: BEGIN
 name := 'LOPENXPP';
 length := 8;
 END;
128: BEGIN
 name := 'LOPENSUBST';
 length := 10;
 END;
129: BEGIN
 name := 'LPARTDETPFORM';
 length := 13;
 END;
130: BEGIN
 name := 'LPASSIVE';
 length := 8;
 END;
131: BEGIN
 name := 'LPASTDEIXIS';
 length := 11;
 END;
132: BEGIN
 name := 'LPASTPART';
 length := 9;
 END;
133: BEGIN
 name := 'LPASTPASTSUPERDEIXIS';
 length := 20;
 END;
134: BEGIN
 name := 'LPASTSUPERDEIXIS';
 length := 16;
 END;
135: BEGIN
 name := 'LPOLITE';
 length := 7;
 END;
136: BEGIN
 name := 'LPOSINTRO';
 length := 9;
 END;
137: BEGIN
 name := 'LPOSSING';
 length := 8;
 END;
138: BEGIN
 name := 'LPOSVARINTRO';
 length := 12;
 END;
139: BEGIN
 name := 'LPPADVPMOD';
 length := 10;
 END;
140: BEGIN
 name := 'LPPNPMOD';
 length := 8;
 END;
141: BEGIN
 name := 'LPPPADVPMOD';
 length := 11;
 END;
142: BEGIN
 name := 'LPPPNPMOD';
 length := 9;
 END;
143: BEGIN
 name := 'LPRESPART';
 length := 9;
 END;
144: BEGIN
 name := 'LPRESENTDEIXIS';
 length := 14;
 END;
145: BEGIN
 name := 'LPRESENTSUPERDEIXIS';
 length := 19;
 END;
146: BEGIN
 name := 'LPROPLDLSUBST';
 length := 13;
 END;
147: BEGIN
 name := 'LPROSENTSUBST';
 length := 13;
 END;
148: BEGIN
 name := 'LPUNC0';
 length := 6;
 END;
149: BEGIN
 name := 'LPUNCDOT';
 length := 8;
 END;
150: BEGIN
 name := 'LPUNCEXCLAM';
 length := 11;
 END;
151: BEGIN
 name := 'LPUNCQ';
 length := 6;
 END;
152: BEGIN
 name := 'LADVPDEGREEMOD';
 length := 14;
 END;
153: BEGIN
 name := 'LADVPAMOUNTMOD';
 length := 14;
 END;
154: BEGIN
 name := 'LADVPCOMPARCOMPLMOD';
 length := 19;
 END;
155: BEGIN
 name := 'LQPCOMPARCOMPLMOD';
 length := 17;
 END;
156: BEGIN
 name := 'LQPSUPERLCOMPLMOD';
 length := 17;
 END;
157: BEGIN
 name := 'LQPAMOUNTMOD';
 length := 12;
 END;
158: BEGIN
 name := 'LXPINFCOMPLMOD';
 length := 14;
 END;
159: BEGIN
 name := 'LXPVOOROBJMOD';
 length := 13;
 END;
160: BEGIN
 name := 'LQPSUBST';
 length := 8;
 END;
161: BEGIN
 name := 'LTHANPSUBST';
 length := 11;
 END;
162: BEGIN
 name := 'LXPVOOROBJMODSUBST';
 length := 18;
 END;
163: BEGIN
 name := 'LQTOQP';
 length := 6;
 END;
164: BEGIN
 name := 'LRECIPROSUBSTSG';
 length := 15;
 END;
165: BEGIN
 name := 'LRECIPROSUBSTPL';
 length := 15;
 END;
166: BEGIN
 name := 'LREFVARINSERTION';
 length := 16;
 END;
167: BEGIN
 name := 'LRELMARKING';
 length := 11;
 END;
168: BEGIN
 name := 'LRETRO';
 length := 6;
 END;
169: BEGIN
 name := 'LRETROVARINSERTION';
 length := 18;
 END;
170: BEGIN
 name := 'LSADVVAR';
 length := 8;
 END;
171: BEGIN
 name := 'LSIDSTART2';
 length := 10;
 END;
172: BEGIN
 name := 'LSIDSTART3';
 length := 10;
 END;
173: BEGIN
 name := 'LSTART0';
 length := 7;
 END;
174: BEGIN
 name := 'LSTART1';
 length := 7;
 END;
175: BEGIN
 name := 'LSTART2';
 length := 7;
 END;
176: BEGIN
 name := 'LSTART3';
 length := 7;
 END;
177: BEGIN
 name := 'LSTARTNPPROP';
 length := 12;
 END;
178: BEGIN
 name := 'LSTARTXP1';
 length := 9;
 END;
179: BEGIN
 name := 'LSTARTXP100';
 length := 11;
 END;
180: BEGIN
 name := 'LSTARTXP120';
 length := 11;
 END;
181: BEGIN
 name := 'LSTARTEXIST';
 length := 11;
 END;
182: BEGIN
 name := 'LSUBNOUNTONOUN1';
 length := 15;
 END;
183: BEGIN
 name := 'LSUBNOUNTONOUN2';
 length := 15;
 END;
184: BEGIN
 name := 'LSUBSTCOUNTENNP';
 length := 15;
 END;
185: BEGIN
 name := 'LTEMPSUBST';
 length := 10;
 END;
186: BEGIN
 name := 'LTEMPTOLEFT';
 length := 11;
 END;
187: BEGIN
 name := 'LTOINFREL';
 length := 9;
 END;
188: BEGIN
 name := 'LTOINFWHMOD';
 length := 11;
 END;
189: BEGIN
 name := 'LTOPICMARKING';
 length := 13;
 END;
190: BEGIN
 name := 'LETOPICMARKING';
 length := 14;
 END;
191: BEGIN
 name := 'LUTT1';
 length := 5;
 END;
192: BEGIN
 name := 'LUTTAORPP';
 length := 9;
 END;
193: BEGIN
 name := 'LUTTNPNOM';
 length := 9;
 END;
194: BEGIN
 name := 'LUTTNPACC';
 length := 9;
 END;
195: BEGIN
 name := 'LUTTNPDAT';
 length := 9;
 END;
196: BEGIN
 name := 'LUTTEXCLAM';
 length := 10;
 END;
197: BEGIN
 name := 'LADDEXCLAM';
 length := 10;
 END;
198: BEGIN
 name := 'LVPADV';
 length := 6;
 END;
199: BEGIN
 name := 'LVPPREPPVAR';
 length := 11;
 END;
200: BEGIN
 name := 'LWHMAIN';
 length := 7;
 END;
201: BEGIN
 name := 'LWHSUB';
 length := 6;
 END;
202: BEGIN
 name := 'LWHTOINF';
 length := 8;
 END;
203: BEGIN
 name := 'LYNMAIN';
 length := 7;
 END;
204: BEGIN
 name := 'LYNSUB';
 length := 6;
 END;
 END{CASE};
END;

 PROCEDURE LIILRULES_RuleParameters (R:LIILrules_RuleIndex;
 VAR params: LIILRULES_paramlist);
 VAR paramlist,p:LIILRULES_paramlist;
BEGIN
paramlist:=NIL;
CASE R OF
1: BEGIN
makeparamlist(p);
p^.paramname:='ADJUNCTPAR';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;
 END;
2: BEGIN
makeparamlist(p);
p^.paramname:='ADJUNCTPAR';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;
 END;
3: BEGIN
 END;
4: BEGIN
makeparamlist(p);
p^.paramname:='ORIENTATION';
p^.length:=11;
p^.next:=paramlist;
paramlist:=p;
 END;
5: BEGIN
 END;
6: BEGIN
 END;
7: BEGIN
 END;
8: BEGIN
makeparamlist(p);
p^.paramname:='CATPAR';
p^.length:=6;
p^.next:=paramlist;
paramlist:=p;
 END;
9: BEGIN
makeparamlist(p);
p^.paramname:='CATPAR';
p^.length:=6;
p^.next:=paramlist;
paramlist:=p;
 END;
10: BEGIN
makeparamlist(p);
p^.paramname:='CATPAR';
p^.length:=6;
p^.next:=paramlist;
paramlist:=p;
 END;
11: BEGIN
makeparamlist(p);
p^.paramname:='CATPAR';
p^.length:=6;
p^.next:=paramlist;
paramlist:=p;
makeparamlist(p);
p^.paramname:='KOMMAPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
 END;
12: BEGIN
 END;
13: BEGIN
 END;
14: BEGIN
 END;
15: BEGIN
 END;
16: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
17: BEGIN
 END;
18: BEGIN
 END;
19: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
20: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
21: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
22: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
23: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
24: BEGIN
 END;
25: BEGIN
 END;
26: BEGIN
 END;
27: BEGIN
 END;
28: BEGIN
 END;
29: BEGIN
 END;
30: BEGIN
 END;
31: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
32: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
33: BEGIN
 END;
34: BEGIN
 END;
35: BEGIN
 END;
36: BEGIN
 END;
37: BEGIN
 END;
38: BEGIN
 END;
39: BEGIN
 END;
40: BEGIN
 END;
41: BEGIN
 END;
42: BEGIN
 END;
43: BEGIN
 END;
44: BEGIN
 END;
45: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
46: BEGIN
 END;
47: BEGIN
 END;
48: BEGIN
 END;
49: BEGIN
 END;
50: BEGIN
 END;
51: BEGIN
 END;
52: BEGIN
 END;
53: BEGIN
 END;
54: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
55: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
56: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
57: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
58: BEGIN
 END;
59: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
60: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
61: BEGIN
 END;
62: BEGIN
 END;
63: BEGIN
 END;
64: BEGIN
 END;
65: BEGIN
 END;
66: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
67: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
68: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
69: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
70: BEGIN
 END;
71: BEGIN
 END;
72: BEGIN
 END;
73: BEGIN
 END;
74: BEGIN
 END;
75: BEGIN
 END;
76: BEGIN
 END;
77: BEGIN
 END;
78: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
79: BEGIN
 END;
80: BEGIN
 END;
81: BEGIN
 END;
82: BEGIN
 END;
83: BEGIN
 END;
84: BEGIN
 END;
85: BEGIN
 END;
86: BEGIN
 END;
87: BEGIN
 END;
88: BEGIN
 END;
89: BEGIN
 END;
90: BEGIN
 END;
91: BEGIN
 END;
92: BEGIN
 END;
93: BEGIN
 END;
94: BEGIN
 END;
95: BEGIN
 END;
96: BEGIN
 END;
97: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
98: BEGIN
makeparamlist(p);
p^.paramname:='SUPERPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
 END;
99: BEGIN
 END;
100: BEGIN
 END;
101: BEGIN
 END;
102: BEGIN
 END;
103: BEGIN
 END;
104: BEGIN
 END;
105: BEGIN
 END;
106: BEGIN
 END;
107: BEGIN
 END;
108: BEGIN
 END;
109: BEGIN
 END;
110: BEGIN
 END;
111: BEGIN
 END;
112: BEGIN
 END;
113: BEGIN
 END;
114: BEGIN
 END;
115: BEGIN
 END;
116: BEGIN
 END;
117: BEGIN
makeparamlist(p);
p^.paramname:='CONTROLLERPAR';
p^.length:=13;
p^.next:=paramlist;
paramlist:=p;
 END;
118: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
119: BEGIN
 END;
120: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
121: BEGIN
 END;
122: BEGIN
 END;
123: BEGIN
 END;
124: BEGIN
 END;
125: BEGIN
 END;
126: BEGIN
 END;
127: BEGIN
 END;
128: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
129: BEGIN
 END;
130: BEGIN
 END;
131: BEGIN
 END;
132: BEGIN
 END;
133: BEGIN
 END;
134: BEGIN
 END;
135: BEGIN
 END;
136: BEGIN
 END;
137: BEGIN
 END;
138: BEGIN
 END;
139: BEGIN
 END;
140: BEGIN
 END;
141: BEGIN
 END;
142: BEGIN
 END;
143: BEGIN
 END;
144: BEGIN
 END;
145: BEGIN
 END;
146: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
147: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
148: BEGIN
 END;
149: BEGIN
 END;
150: BEGIN
 END;
151: BEGIN
 END;
152: BEGIN
 END;
153: BEGIN
 END;
154: BEGIN
 END;
155: BEGIN
 END;
156: BEGIN
 END;
157: BEGIN
 END;
158: BEGIN
 END;
159: BEGIN
 END;
160: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
161: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
162: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
163: BEGIN
 END;
164: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
makeparamlist(p);
p^.paramname:='ANTECEDENT';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;
 END;
165: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
makeparamlist(p);
p^.paramname:='ANTECEDENT';
p^.length:=10;
p^.next:=paramlist;
paramlist:=p;
 END;
166: BEGIN
 END;
167: BEGIN
makeparamlist(p);
p^.paramname:='INDEXPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
 END;
168: BEGIN
 END;
169: BEGIN
 END;
170: BEGIN
 END;
171: BEGIN
 END;
172: BEGIN
 END;
173: BEGIN
 END;
174: BEGIN
 END;
175: BEGIN
 END;
176: BEGIN
 END;
177: BEGIN
 END;
178: BEGIN
 END;
179: BEGIN
 END;
180: BEGIN
 END;
181: BEGIN
 END;
182: BEGIN
 END;
183: BEGIN
makeparamlist(p);
p^.paramname:='NUMBERPAR';
p^.length:=9;
p^.next:=paramlist;
paramlist:=p;
 END;
184: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
185: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
186: BEGIN
 END;
187: BEGIN
 END;
188: BEGIN
 END;
189: BEGIN
makeparamlist(p);
p^.paramname:='INDEXPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
 END;
190: BEGIN
makeparamlist(p);
p^.paramname:='INDEXPAR';
p^.length:=8;
p^.next:=paramlist;
paramlist:=p;
 END;
191: BEGIN
 END;
192: BEGIN
 END;
193: BEGIN
 END;
194: BEGIN
 END;
195: BEGIN
 END;
196: BEGIN
 END;
197: BEGIN
 END;
198: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
199: BEGIN
makeparamlist(p);
p^.paramname:='LEVEL';
p^.length:=5;
p^.next:=paramlist;
paramlist:=p;
 END;
200: BEGIN
 END;
201: BEGIN
 END;
202: BEGIN
 END;
203: BEGIN
 END;
204: BEGIN
 END;
 END{CASE};
params:=paramlist;
END;

 PROCEDURE LIILRULES_RuleNumber (VAR R:LIILrules_RuleIndex;
 CONST name: string;
 length: INTEGER);
BEGIN
R := -1;
IF STR_compare(name,length,'LADJUNCTVAR1',
12)=0 THEN
 R := 1;
IF STR_compare(name,length,'LADJUNCTVAR2',
12)=0 THEN
 R := 2;
IF STR_compare(name,length,'LADJUNCTVAR3',
12)=0 THEN
 R := 3;
IF STR_compare(name,length,'LADJUNCTVAR4',
12)=0 THEN
 R := 4;
IF STR_compare(name,length,'LNNCOMPOUNDS',
12)=0 THEN
 R := 5;
IF STR_compare(name,length,'LVNCOMPOUNDS',
12)=0 THEN
 R := 6;
IF STR_compare(name,length,'LCOORDINTRO',
11)=0 THEN
 R := 7;
IF STR_compare(name,length,'LSIMPLECOORD',
12)=0 THEN
 R := 8;
IF STR_compare(name,length,'LCORRCOORD',
10)=0 THEN
 R := 9;
IF STR_compare(name,length,'LITCORRCOORD',
12)=0 THEN
 R := 10;
IF STR_compare(name,length,'LITSIMPLECOORD',
14)=0 THEN
 R := 11;
IF STR_compare(name,length,'LAANACTIVE',
10)=0 THEN
 R := 12;
IF STR_compare(name,length,'LACCING',
7)=0 THEN
 R := 13;
IF STR_compare(name,length,'LACTIVE',
7)=0 THEN
 R := 14;
IF STR_compare(name,length,'LADHORT',
7)=0 THEN
 R := 15;
IF STR_compare(name,length,'LAGVPADV',
8)=0 THEN
 R := 16;
IF STR_compare(name,length,'LCAUSVAR',
8)=0 THEN
 R := 17;
IF STR_compare(name,length,'LADJDEGREEMOD',
13)=0 THEN
 R := 18;
IF STR_compare(name,length,'LEMPTYSUBST',
11)=0 THEN
 R := 19;
IF STR_compare(name,length,'LEMPTYHETSUBST',
14)=0 THEN
 R := 20;
IF STR_compare(name,length,'LEMPTYPREPSUBST',
15)=0 THEN
 R := 21;
IF STR_compare(name,length,'LADJHELPEMPTY',
13)=0 THEN
 R := 22;
IF STR_compare(name,length,'LADJEMPTYSUBJSUBST',
18)=0 THEN
 R := 23;
IF STR_compare(name,length,'LADJMOD',
7)=0 THEN
 R := 24;
IF STR_compare(name,length,'LADJOMTEMOD',
11)=0 THEN
 R := 25;
IF STR_compare(name,length,'LADJTOADVDERIV',
14)=0 THEN
 R := 26;
IF STR_compare(name,length,'LNOUNDIM',
8)=0 THEN
 R := 27;
IF STR_compare(name,length,'LPNDIM',
6)=0 THEN
 R := 28;
IF STR_compare(name,length,'LORDINALDERIV',
13)=0 THEN
 R := 29;
IF STR_compare(name,length,'LADJVOOROBJ',
11)=0 THEN
 R := 30;
IF STR_compare(name,length,'LADVSUBST',
9)=0 THEN
 R := 31;
IF STR_compare(name,length,'LARGSUBST',
9)=0 THEN
 R := 32;
IF STR_compare(name,length,'LASPECTIMPERFECTIVE',
19)=0 THEN
 R := 33;
IF STR_compare(name,length,'LASPECTPERFECTIVE',
17)=0 THEN
 R := 34;
IF STR_compare(name,length,'LASPECTHABITUAL',
15)=0 THEN
 R := 35;
IF STR_compare(name,length,'LBNOUNPL',
8)=0 THEN
 R := 36;
IF STR_compare(name,length,'LBNOUNSG',
8)=0 THEN
 R := 37;
IF STR_compare(name,length,'LBTOPRONOUN',
11)=0 THEN
 R := 38;
IF STR_compare(name,length,'LBPNTOPN',
8)=0 THEN
 R := 39;
IF STR_compare(name,length,'LBTOBIGPRO',
10)=0 THEN
 R := 40;
IF STR_compare(name,length,'LBTOSUB',
7)=0 THEN
 R := 41;
IF STR_compare(name,length,'LCARD1',
6)=0 THEN
 R := 42;
IF STR_compare(name,length,'LCARD2',
6)=0 THEN
 R := 43;
IF STR_compare(name,length,'LCARDTODETP',
11)=0 THEN
 R := 44;
IF STR_compare(name,length,'LCLANDSENTSUBST',
15)=0 THEN
 R := 45;
IF STR_compare(name,length,'LCLORFORMULA',
12)=0 THEN
 R := 46;
IF STR_compare(name,length,'LCLOSEDINF',
10)=0 THEN
 R := 47;
IF STR_compare(name,length,'LCLOSEDNPP',
10)=0 THEN
 R := 48;
IF STR_compare(name,length,'LCLOSEDVPPROP',
13)=0 THEN
 R := 49;
IF STR_compare(name,length,'LCLOSEDXPP',
10)=0 THEN
 R := 50;
IF STR_compare(name,length,'LCNFORMATION1',
13)=0 THEN
 R := 51;
IF STR_compare(name,length,'LCNFORMATIONCOUNTSING',
21)=0 THEN
 R := 52;
IF STR_compare(name,length,'LCNFORMATIONMASSPLUR',
20)=0 THEN
 R := 53;
IF STR_compare(name,length,'LNOUNARGMOD1',
12)=0 THEN
 R := 54;
IF STR_compare(name,length,'LNOUNARGMOD2',
12)=0 THEN
 R := 55;
IF STR_compare(name,length,'LNPARGMODSUBST1',
15)=0 THEN
 R := 56;
IF STR_compare(name,length,'LNPARGMODSUBST2',
15)=0 THEN
 R := 57;
IF STR_compare(name,length,'LNPMODPOSS',
10)=0 THEN
 R := 58;
IF STR_compare(name,length,'LCNMOD',
6)=0 THEN
 R := 59;
IF STR_compare(name,length,'LCNMODINFREL',
12)=0 THEN
 R := 60;
IF STR_compare(name,length,'LCNMODBARENP',
12)=0 THEN
 R := 61;
IF STR_compare(name,length,'LCNMODNUM',
9)=0 THEN
 R := 62;
IF STR_compare(name,length,'LCNMODPOSS',
10)=0 THEN
 R := 63;
IF STR_compare(name,length,'LCNSPECPN',
9)=0 THEN
 R := 64;
IF STR_compare(name,length,'LCONJSENT',
9)=0 THEN
 R := 65;
IF STR_compare(name,length,'LCONJSENTSUBST',
14)=0 THEN
 R := 66;
IF STR_compare(name,length,'LCONJSENTSUBSTINITIAL',
21)=0 THEN
 R := 67;
IF STR_compare(name,length,'LCONJSENTSUBSTMIDDLE',
20)=0 THEN
 R := 68;
IF STR_compare(name,length,'LCONJSENTSUBSTFINAL',
19)=0 THEN
 R := 69;
IF STR_compare(name,length,'LCONJSVAR',
9)=0 THEN
 R := 70;
IF STR_compare(name,length,'LDECLMAIN',
9)=0 THEN
 R := 71;
IF STR_compare(name,length,'LDECLSUB',
8)=0 THEN
 R := 72;
IF STR_compare(name,length,'LGELIEVEMOOD',
12)=0 THEN
 R := 73;
IF STR_compare(name,length,'LDETDERIVATION',
14)=0 THEN
 R := 74;
IF STR_compare(name,length,'LDETPFORMATION',
14)=0 THEN
 R := 75;
IF STR_compare(name,length,'LDOORACTIVE',
11)=0 THEN
 R := 76;
IF STR_compare(name,length,'LDURVARINSERTION',
16)=0 THEN
 R := 77;
IF STR_compare(name,length,'LEMPTYSUBST',
11)=0 THEN
 R := 78;
IF STR_compare(name,length,'LFINREL',
7)=0 THEN
 R := 79;
IF STR_compare(name,length,'LFINWHMOD',
9)=0 THEN
 R := 80;
IF STR_compare(name,length,'LFORTOINF',
9)=0 THEN
 R := 81;
IF STR_compare(name,length,'LFORTOINFREL',
12)=0 THEN
 R := 82;
IF STR_compare(name,length,'LFORTOINFWHMOD',
14)=0 THEN
 R := 83;
IF STR_compare(name,length,'LIDENTNPANDPERSPRO',
18)=0 THEN
 R := 84;
IF STR_compare(name,length,'LIDENTWHSG',
10)=0 THEN
 R := 85;
IF STR_compare(name,length,'LIDENTWHPL',
10)=0 THEN
 R := 86;
IF STR_compare(name,length,'LIDENT2NPANDSENT',
16)=0 THEN
 R := 87;
IF STR_compare(name,length,'LIMPDEIXIS',
10)=0 THEN
 R := 88;
IF STR_compare(name,length,'LIMP',
4)=0 THEN
 R := 89;
IF STR_compare(name,length,'LIMPS',
5)=0 THEN
 R := 90;
IF STR_compare(name,length,'LINJUNSUB',
9)=0 THEN
 R := 91;
IF STR_compare(name,length,'LIRRMODALDEIXIS',
15)=0 THEN
 R := 92;
IF STR_compare(name,length,'LIRRMODALSUPERDEIXIS',
20)=0 THEN
 R := 93;
IF STR_compare(name,length,'LLOCADV',
7)=0 THEN
 R := 94;
IF STR_compare(name,length,'LNEGINTRO',
9)=0 THEN
 R := 95;
IF STR_compare(name,length,'LNEGVARINTRO',
12)=0 THEN
 R := 96;
IF STR_compare(name,length,'LNONCNMOD',
9)=0 THEN
 R := 97;
IF STR_compare(name,length,'LDATUMNP',
8)=0 THEN
 R := 98;
IF STR_compare(name,length,'LDATUMYEAR',
10)=0 THEN
 R := 99;
IF STR_compare(name,length,'LDATUMDAY',
9)=0 THEN
 R := 100;
IF STR_compare(name,length,'LDATUMDAYNAME',
13)=0 THEN
 R := 101;
IF STR_compare(name,length,'LDATUMDAYNUMBER',
15)=0 THEN
 R := 102;
IF STR_compare(name,length,'LNPFORMATION1',
13)=0 THEN
 R := 103;
IF STR_compare(name,length,'LNPFORMATION2',
13)=0 THEN
 R := 104;
IF STR_compare(name,length,'LNPFORMATION3',
13)=0 THEN
 R := 105;
IF STR_compare(name,length,'LNPFORMATIONINDEF',
17)=0 THEN
 R := 106;
IF STR_compare(name,length,'LNPFORMATIONDEF',
15)=0 THEN
 R := 107;
IF STR_compare(name,length,'LNPFORMATION6',
13)=0 THEN
 R := 108;
IF STR_compare(name,length,'LCARDNP',
7)=0 THEN
 R := 109;
IF STR_compare(name,length,'LNPFORMATIONPRONOUN',
19)=0 THEN
 R := 110;
IF STR_compare(name,length,'LNPFORMATION9',
13)=0 THEN
 R := 111;
IF STR_compare(name,length,'LNPFORMATION10',
14)=0 THEN
 R := 112;
IF STR_compare(name,length,'LNPFORMATION11',
14)=0 THEN
 R := 113;
IF STR_compare(name,length,'LNPFORMATION12',
14)=0 THEN
 R := 114;
IF STR_compare(name,length,'LNPFORMATION13',
14)=0 THEN
 R := 115;
IF STR_compare(name,length,'LNPFORMATION14',
14)=0 THEN
 R := 116;
IF STR_compare(name,length,'LNPFORMATION17',
14)=0 THEN
 R := 117;
IF STR_compare(name,length,'LNPINPPSUBST',
12)=0 THEN
 R := 118;
IF STR_compare(name,length,'LNPOPENING',
10)=0 THEN
 R := 119;
IF STR_compare(name,length,'LNONPINPPSUBST',
14)=0 THEN
 R := 120;
IF STR_compare(name,length,'LNPAPPOSITION',
13)=0 THEN
 R := 121;
IF STR_compare(name,length,'LNPMODADV',
9)=0 THEN
 R := 122;
IF STR_compare(name,length,'LNPPARTITIVEFORMATION',
21)=0 THEN
 R := 123;
IF STR_compare(name,length,'LOPENDECLINF',
12)=0 THEN
 R := 124;
IF STR_compare(name,length,'LOPENING',
8)=0 THEN
 R := 125;
IF STR_compare(name,length,'LOPENNPP',
8)=0 THEN
 R := 126;
IF STR_compare(name,length,'LOPENXPP',
8)=0 THEN
 R := 127;
IF STR_compare(name,length,'LOPENSUBST',
10)=0 THEN
 R := 128;
IF STR_compare(name,length,'LPARTDETPFORM',
13)=0 THEN
 R := 129;
IF STR_compare(name,length,'LPASSIVE',
8)=0 THEN
 R := 130;
IF STR_compare(name,length,'LPASTDEIXIS',
11)=0 THEN
 R := 131;
IF STR_compare(name,length,'LPASTPART',
9)=0 THEN
 R := 132;
IF STR_compare(name,length,'LPASTPASTSUPERDEIXIS',
20)=0 THEN
 R := 133;
IF STR_compare(name,length,'LPASTSUPERDEIXIS',
16)=0 THEN
 R := 134;
IF STR_compare(name,length,'LPOLITE',
7)=0 THEN
 R := 135;
IF STR_compare(name,length,'LPOSINTRO',
9)=0 THEN
 R := 136;
IF STR_compare(name,length,'LPOSSING',
8)=0 THEN
 R := 137;
IF STR_compare(name,length,'LPOSVARINTRO',
12)=0 THEN
 R := 138;
IF STR_compare(name,length,'LPPADVPMOD',
10)=0 THEN
 R := 139;
IF STR_compare(name,length,'LPPNPMOD',
8)=0 THEN
 R := 140;
IF STR_compare(name,length,'LPPPADVPMOD',
11)=0 THEN
 R := 141;
IF STR_compare(name,length,'LPPPNPMOD',
9)=0 THEN
 R := 142;
IF STR_compare(name,length,'LPRESPART',
9)=0 THEN
 R := 143;
IF STR_compare(name,length,'LPRESENTDEIXIS',
14)=0 THEN
 R := 144;
IF STR_compare(name,length,'LPRESENTSUPERDEIXIS',
19)=0 THEN
 R := 145;
IF STR_compare(name,length,'LPROPLDLSUBST',
13)=0 THEN
 R := 146;
IF STR_compare(name,length,'LPROSENTSUBST',
13)=0 THEN
 R := 147;
IF STR_compare(name,length,'LPUNC0',
6)=0 THEN
 R := 148;
IF STR_compare(name,length,'LPUNCDOT',
8)=0 THEN
 R := 149;
IF STR_compare(name,length,'LPUNCEXCLAM',
11)=0 THEN
 R := 150;
IF STR_compare(name,length,'LPUNCQ',
6)=0 THEN
 R := 151;
IF STR_compare(name,length,'LADVPDEGREEMOD',
14)=0 THEN
 R := 152;
IF STR_compare(name,length,'LADVPAMOUNTMOD',
14)=0 THEN
 R := 153;
IF STR_compare(name,length,'LADVPCOMPARCOMPLMOD',
19)=0 THEN
 R := 154;
IF STR_compare(name,length,'LQPCOMPARCOMPLMOD',
17)=0 THEN
 R := 155;
IF STR_compare(name,length,'LQPSUPERLCOMPLMOD',
17)=0 THEN
 R := 156;
IF STR_compare(name,length,'LQPAMOUNTMOD',
12)=0 THEN
 R := 157;
IF STR_compare(name,length,'LXPINFCOMPLMOD',
14)=0 THEN
 R := 158;
IF STR_compare(name,length,'LXPVOOROBJMOD',
13)=0 THEN
 R := 159;
IF STR_compare(name,length,'LQPSUBST',
8)=0 THEN
 R := 160;
IF STR_compare(name,length,'LTHANPSUBST',
11)=0 THEN
 R := 161;
IF STR_compare(name,length,'LXPVOOROBJMODSUBST',
18)=0 THEN
 R := 162;
IF STR_compare(name,length,'LQTOQP',
6)=0 THEN
 R := 163;
IF STR_compare(name,length,'LRECIPROSUBSTSG',
15)=0 THEN
 R := 164;
IF STR_compare(name,length,'LRECIPROSUBSTPL',
15)=0 THEN
 R := 165;
IF STR_compare(name,length,'LREFVARINSERTION',
16)=0 THEN
 R := 166;
IF STR_compare(name,length,'LRELMARKING',
11)=0 THEN
 R := 167;
IF STR_compare(name,length,'LRETRO',
6)=0 THEN
 R := 168;
IF STR_compare(name,length,'LRETROVARINSERTION',
18)=0 THEN
 R := 169;
IF STR_compare(name,length,'LSADVVAR',
8)=0 THEN
 R := 170;
IF STR_compare(name,length,'LSIDSTART2',
10)=0 THEN
 R := 171;
IF STR_compare(name,length,'LSIDSTART3',
10)=0 THEN
 R := 172;
IF STR_compare(name,length,'LSTART0',
7)=0 THEN
 R := 173;
IF STR_compare(name,length,'LSTART1',
7)=0 THEN
 R := 174;
IF STR_compare(name,length,'LSTART2',
7)=0 THEN
 R := 175;
IF STR_compare(name,length,'LSTART3',
7)=0 THEN
 R := 176;
IF STR_compare(name,length,'LSTARTNPPROP',
12)=0 THEN
 R := 177;
IF STR_compare(name,length,'LSTARTXP1',
9)=0 THEN
 R := 178;
IF STR_compare(name,length,'LSTARTXP100',
11)=0 THEN
 R := 179;
IF STR_compare(name,length,'LSTARTXP120',
11)=0 THEN
 R := 180;
IF STR_compare(name,length,'LSTARTEXIST',
11)=0 THEN
 R := 181;
IF STR_compare(name,length,'LSUBNOUNTONOUN1',
15)=0 THEN
 R := 182;
IF STR_compare(name,length,'LSUBNOUNTONOUN2',
15)=0 THEN
 R := 183;
IF STR_compare(name,length,'LSUBSTCOUNTENNP',
15)=0 THEN
 R := 184;
IF STR_compare(name,length,'LTEMPSUBST',
10)=0 THEN
 R := 185;
IF STR_compare(name,length,'LTEMPTOLEFT',
11)=0 THEN
 R := 186;
IF STR_compare(name,length,'LTOINFREL',
9)=0 THEN
 R := 187;
IF STR_compare(name,length,'LTOINFWHMOD',
11)=0 THEN
 R := 188;
IF STR_compare(name,length,'LTOPICMARKING',
13)=0 THEN
 R := 189;
IF STR_compare(name,length,'LETOPICMARKING',
14)=0 THEN
 R := 190;
IF STR_compare(name,length,'LUTT1',
5)=0 THEN
 R := 191;
IF STR_compare(name,length,'LUTTAORPP',
9)=0 THEN
 R := 192;
IF STR_compare(name,length,'LUTTNPNOM',
9)=0 THEN
 R := 193;
IF STR_compare(name,length,'LUTTNPACC',
9)=0 THEN
 R := 194;
IF STR_compare(name,length,'LUTTNPDAT',
9)=0 THEN
 R := 195;
IF STR_compare(name,length,'LUTTEXCLAM',
10)=0 THEN
 R := 196;
IF STR_compare(name,length,'LADDEXCLAM',
10)=0 THEN
 R := 197;
IF STR_compare(name,length,'LVPADV',
6)=0 THEN
 R := 198;
IF STR_compare(name,length,'LVPPREPPVAR',
11)=0 THEN
 R := 199;
IF STR_compare(name,length,'LWHMAIN',
7)=0 THEN
 R := 200;
IF STR_compare(name,length,'LWHSUB',
6)=0 THEN
 R := 201;
IF STR_compare(name,length,'LWHTOINF',
8)=0 THEN
 R := 202;
IF STR_compare(name,length,'LYNMAIN',
7)=0 THEN
 R := 203;
IF STR_compare(name,length,'LYNSUB',
6)=0 THEN
 R := 204;
END;
 PROCEDURE LIILRULES_PrintParameters (w:WINDOWS_device;
 parameters: LIILRULES_LIparameters);
 VAR p,attrstruct:LDCONVREC_pattrstruct;
 len1:INTEGER;
 q:LDCONVREC_psetvaluetype;
BEGIN
attrstruct:=NIL;
CASE parameters.params.rulenr OF
1: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(1,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ADJUNCTPAR';
p^.fieldname.len:=10;
convADJUNCTTYPE(parameters.params.X1ADJUNCTPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
2: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(2,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ADJUNCTPAR';
p^.fieldname.len:=10;
convADJUNCTTYPE(parameters.params.X2ADJUNCTPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
3: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(3,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
4: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(4,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ORIENTATION';
p^.fieldname.len:=11;
convINDEXTYPE(parameters.params.X4ORIENTATION,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
5: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(5,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
6: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(6,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
7: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(7,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
8: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(8,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='CATPAR';
p^.fieldname.len:=6;
convCATTYPE(parameters.params.X8CATPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
9: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(9,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='CATPAR';
p^.fieldname.len:=6;
convCATTYPE(parameters.params.X9CATPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
10: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(10,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='CATPAR';
p^.fieldname.len:=6;
convCATTYPE(parameters.params.X10CATPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
11: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(11,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='CATPAR';
p^.fieldname.len:=6;
convCATTYPE(parameters.params.X11CATPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='KOMMAPAR';
p^.fieldname.len:=8;
convKOMMATYPE(parameters.params.X11KOMMAPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
12: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(12,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
13: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(13,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
14: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(14,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
15: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(15,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
16: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(16,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
17: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(17,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
18: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(18,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
19: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(19,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
20: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(20,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
21: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(21,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
22: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(22,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
23: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(23,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
24: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(24,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
25: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(25,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
26: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(26,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
27: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(27,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
28: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(28,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
29: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(29,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
30: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(30,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
31: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(31,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
32: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(32,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
33: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(33,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
34: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(34,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
35: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(35,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
36: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(36,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
37: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(37,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
38: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(38,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
39: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(39,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
40: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(40,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
41: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(41,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
42: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(42,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
43: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(43,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
44: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(44,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
45: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(45,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
46: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(46,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
47: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(47,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
48: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(48,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
49: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(49,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
50: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(50,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
51: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(51,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
52: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(52,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
53: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(53,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
54: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(54,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
55: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(55,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
56: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(56,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
57: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(57,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
58: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(58,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
59: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(59,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
60: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(60,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
61: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(61,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
62: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(62,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
63: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(63,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
64: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(64,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
65: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(65,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
66: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(66,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
67: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(67,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
68: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(68,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
69: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(69,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
70: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(70,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
71: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(71,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
72: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(72,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
73: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(73,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
74: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(74,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
75: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(75,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
76: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(76,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
77: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(77,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
78: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(78,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
79: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(79,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
80: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(80,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
81: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(81,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
82: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(82,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
83: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(83,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
84: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(84,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
85: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(85,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
86: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(86,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
87: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(87,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
88: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(88,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
89: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(89,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
90: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(90,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
91: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(91,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
92: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(92,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
93: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(93,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
94: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(94,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
95: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(95,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
96: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(96,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
97: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(97,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
98: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(98,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='SUPERPAR';
p^.fieldname.len:=8;
convDEIXISTYPE(parameters.params.X98SUPERPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
99: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(99,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
100: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(100,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
101: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(101,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
102: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(102,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
103: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(103,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
104: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(104,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
105: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(105,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
106: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(106,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
107: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(107,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
108: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(108,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
109: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(109,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
110: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(110,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
111: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(111,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
112: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(112,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
113: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(113,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
114: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(114,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
115: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(115,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
116: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(116,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
117: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(117,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='CONTROLLERPAR';
p^.fieldname.len:=13;
convINDEXTYPE(parameters.params.X117CONTROLLERPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
118: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(118,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
119: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(119,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
120: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(120,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
121: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(121,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
122: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(122,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
123: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(123,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
124: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(124,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
125: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(125,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
126: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(126,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
127: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(127,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
128: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(128,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
129: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(129,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
130: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(130,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
131: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(131,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
132: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(132,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
133: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(133,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
134: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(134,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
135: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(135,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
136: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(136,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
137: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(137,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
138: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(138,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
139: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(139,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
140: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(140,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
141: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(141,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
142: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(142,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
143: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(143,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
144: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(144,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
145: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(145,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
146: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(146,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
147: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(147,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
148: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(148,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
149: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(149,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
150: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(150,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
151: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(151,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
152: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(152,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
153: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(153,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
154: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(154,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
155: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(155,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
156: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(156,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
157: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(157,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
158: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(158,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
159: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(159,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
160: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(160,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
161: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(161,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
162: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(162,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
163: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(163,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
164: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(164,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ANTECEDENT';
p^.fieldname.len:=10;
convINDEXTYPE(parameters.params.X164ANTECEDENT,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
165: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(165,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ANTECEDENT';
p^.fieldname.len:=10;
convINDEXTYPE(parameters.params.X165ANTECEDENT,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
166: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(166,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
167: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(167,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='INDEXPAR';
p^.fieldname.len:=8;
convINDEXTYPE(parameters.params.X167INDEXPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
168: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(168,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
169: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(169,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
170: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(170,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
171: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(171,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
172: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(172,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
173: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(173,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
174: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(174,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
175: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(175,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
176: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(176,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
177: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(177,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
178: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(178,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
179: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(179,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
180: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(180,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
181: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(181,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
182: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(182,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
183: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(183,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='NUMBERPAR';
p^.fieldname.len:=9;
convNUMBERTYPE(parameters.params.X183NUMBERPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
184: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(184,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
185: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(185,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
186: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(186,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
187: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(187,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
188: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(188,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
189: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(189,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='INDEXPAR';
p^.fieldname.len:=8;
convINDEXTYPE(parameters.params.X189INDEXPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
190: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(190,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='INDEXPAR';
p^.fieldname.len:=8;
convINDEXTYPE(parameters.params.X190INDEXPAR,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
191: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(191,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
192: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(192,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
193: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(193,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
194: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(194,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
195: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(195,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
196: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(196,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
197: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(197,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
198: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(198,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
199: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(199,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='LEVEL';
p^.fieldname.len:=5;
convINTEGER(parameters.index,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
200: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(200,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
201: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(201,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
202: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(202,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
203: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(203,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
204: BEGIN
MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_Ptr));
p^.nextattr:=attrstruct;
attrstruct:=p;
p^.setvalue:=NIL;
p^.typeindicator:=enumeration;
p^.fieldname.str:='ILRULE';
p^.fieldname.len:=6;
LIILRULES_rulename(204,p^.fieldvalue.str,len1);
p^.fieldvalue.len:=len1;
 END;
 END{CASE};
LIRECTOSCREEN_write(w,attrstruct);
END;
