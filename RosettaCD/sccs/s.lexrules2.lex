h42819
s 00012/00015/01007
d D 1.2 92/02/21 15:41:25 rous 2 1
c 
e
s 01022/00000/00000
d D 1.1 91/05/23 13:13:41 leermake 1 0
c date and time created 91/05/23 13:13:41 by leermake
e
u
U
f e 0
t
T
I 1
%DUTCH2
%&

\newpage
\section{Propernouns and nouns.}
\subsection{Propernouns.}
\subsubsection{Rule for propernoun without genitive out of bpropernoun.}

Propernouns have inflection only in case of genitive formation.

Cases like: "de Antillen", "de Fillipijnen", "de Verenigde Staten", 
            "de Verenigde Arabische Emiraten", etc. are problematic.
The best way to deal with these words is to treat them as normal nouns (with 
only semantic properties of a propernoun), asif they are some kind of fixed
idioms.

Cases like "de beide Duitslanden" and "de Kennedy's" will be treated as 
derivation: out of a propernoun a subnoun is made.
Attributes like for instance {\em gender} are already present 
at the bpropernoun level. Other examples: "het zonnige Itali/"{e}", 
"het romantische Duitsland".  

Propernouns do not have a sub-level.

\begin{verbatim}
%bpropernountopropernoun

m1:   BPROPERNOUN{BPROPERNOUNrec1}
m:    PROPERNOUN{PROPERNOUNrec1} [head/ BPROPERNOUN{BPROPERNOUNrec1}]

comp:    
         C:   true
         A:   PROPERNOUNrec1  := COPYT_bpropernountopropernoun(BPROPERNOUNrec1);
              PROPERNOUNrec1.geni := false  

decomp:  
         C:   PROPERNOUNrec1.geni = false  
         A:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for propernoun with genitive out of bpropernoun.}
\begin{verbatim}
%bpropertopropergenitief

m1:   BPROPERNOUN{BPROPERNOUNrec1}
m2:   SFCAT{SFCATrec1}
m:    PROPERNOUN{PROPERNOUNrec1} [head/ BPROPERNOUN{BPROPERNOUNrec1}]

comp:    
         C:   (SFCATrec1.key = SFKgens)
              and (not(OnlyPlural in BPROPERNOUNrec1.pluralforms))
              and (BPROPERNOUNrec1.possgeni = true)
         A:   PROPERNOUNrec1 := COPYT_bpropernountopropernoun(BPROPERNOUNrec1);
              PROPERNOUNrec1.number  := singular;
              PROPERNOUNrec1.geni    := true

decomp:  
         C:  (PROPERNOUNrec1.number       = singular) 
             and (PROPERNOUNrec1.possgeni = true)
             and (PROPERNOUNrec1.geni     = true)
             and (not(OnlyPlural in PROPERNOUNrec1.pluralforms))
         A:  SFCATrec1.key := SFKgens
&
\end{verbatim}
\newpage
\subsubsection{Derivation rule for propernouns with diminutive.}
Note: 
\begin{itemize}
  \item compare with rule for diminutives of nouns.
  \item there is a separate rule for genitive forms.
\end{itemize}
\begin{verbatim}
%PropernounWithDimForm

m1: BPROPERNOUN{BPROPERNOUNrec1}
m2: SFCAT{SFCATrec1}

m:  PROPERNOUN{PROPERNOUNrec1}[complrel/BPROPERNOUN{BPROPERNOUNrec1}, 
                          head/BNOUNSUFF(dimBNOUNSUFFkey){BNOUNSUFFrec1}]

comp:

C1: true
   C2: (not(noDim in BPROPERNOUNrec1.dimforms))
      C3: (SFCATrec1.key = SFKje) and (jeDim in BPROPERNOUNrec1.dimforms)
      A3: @
      C3: (SFCATrec1.key = SFKetje) and (etjeDim in BPROPERNOUNrec1.dimforms)  
      A3: @
      C3: (SFCATrec1.key = SFKonregdim) and (irregdim in BPROPERNOUNrec1.dimforms)
      A3: @
D 2
      C3: (SFCATrec1.key = SFKdimletterword) and  (dimletterword in                                                   BPROPERNOUNrec1.dimforms)
E 2
I 2
      C3: (SFCATrec1.key = SFKdimletterword) and  (dimletterword in BPROPERNOUNrec1.dimforms)
E 2
      A3: @
   A2:   PROPERNOUNrec1      := COPYT_bpropernountopropernoun(BPROPERNOUNrec1)
A1: PROPERNOUNrec1.geni     := false;
    PROPERNOUNrec1.number   := singular;
    PROPERNOUNrec1.genders := BNOUNSUFFrec1.genders;
    PROPERNOUNrec1.dimforms := BNOUNSUFFrec1.dimforms;
    PROPERNOUNrec1.pluralforms := BNOUNSUFFrec1.pluralforms
    

decomp:

C1: (PROPERNOUNrec1.geni     = false)  and
    (PROPERNOUNrec1.number   = singular) and
    (PROPERNOUNrec1.genders  = BNOUNSUFFrec1.genders) and
    (PROPERNOUNrec1.dimforms  = BNOUNSUFFrec1.dimforms) and
    (PROPERNOUNrec1.pluralforms = BNOUNSUFFrec1.pluralforms)
   C2: (not(noDim in BPROPERNOUNrec1.dimforms))
      C3: jeDim in BPROPERNOUNrec1.dimforms
      A3: SFCATrec1.key := SFKje
      C3: etjeDim in BPROPERNOUNrec1.dimforms
      A3: SFCATrec1.key := SFKetje
      C3: irregdim in BPROPERNOUNrec1.dimforms
      A3: SFCATrec1.key := SFKonregdim
      C3: dimletterword in BPROPERNOUNrec1.dimforms
      A3: SFCATrec1.key := SFKdimletterword
   A2: @
A1: @
&
\end{verbatim}
\newpage
\subsubsection{Derivation rule for propernouns with diminutive.}
Note: This is a separate rule for genitive forms.
\begin{verbatim}
%PropernounWithGeniDimForm

m1: BPROPERNOUN{BPROPERNOUNrec1}
m2: SFCAT{SFCATrec1}
m3: SFCAT{SFCATrec2}

m:  PROPERNOUN{PROPERNOUNrec1}[complrel/BPROPERNOUN{BPROPERNOUNrec1}, 
                          head/BNOUNSUFF(dimBNOUNSUFFkey){BNOUNSUFFrec1}]

comp:

C1: (BPROPERNOUNrec1.possgeni = true) and (SFCATrec2.key = SFKgens)
   C2: (not(noDim in BPROPERNOUNrec1.dimforms))
      C3: (SFCATrec1.key = SFKje) and (jeDim in BPROPERNOUNrec1.dimforms)
      A3: @
      C3: (SFCATrec1.key = SFKetje) and (etjeDim in BPROPERNOUNrec1.dimforms)  
      A3: @
D 2
      C3: (SFCATrec1.key = SFKonregdim) and (irregdim in BPROPERNOUNrec1.dimforms)
E 2
I 2
      C3: (SFCATrec1.key = SFKonregdim) and (irregdim in  BPROPERNOUNrec1.dimforms)
E 2
      A3: @
D 2
      C3: (SFCATrec1.key = SFKdimletterword) and 
          (dimletterword in BPROPERNOUNrec1.dimforms)
E 2
I 2
      C3: (SFCATrec1.key = SFKdimletterword) and  (dimletterword in BPROPERNOUNrec1.dimforms)
E 2
      A3: @
   A2:   PROPERNOUNrec1      := COPYT_bpropernountopropernoun(BPROPERNOUNrec1)
A1: PROPERNOUNrec1.geni     := true;
    PROPERNOUNrec1.number   := singular

decomp:

C1: (PROPERNOUNrec1.possgeni = true)  and
    (PROPERNOUNrec1.geni     = true)  and
    (PROPERNOUNrec1.number   = singular) 
   C2: (not(noDim in BPROPERNOUNrec1.dimforms))
      C3: jeDim in BPROPERNOUNrec1.dimforms
      A3: SFCATrec1.key := SFKje
      C3: etjeDim in BPROPERNOUNrec1.dimforms
      A3: SFCATrec1.key := SFKetje
      C3: irregdim in BPROPERNOUNrec1.dimforms
      A3: SFCATrec1.key := SFKonregdim
      C3: dimletterword in BPROPERNOUNrec1.dimforms
      A3: SFCATrec1.key := SFKdimletterword
   A2: @
A1: SFCATrec2.key := SFKgens
&
\end{verbatim}
\newpage
\subsection{Nouns}
\subsubsection{Rule for subnouns out of bpropernouns.}
\begin{verbatim}
%bpropernountosubnoun

m1:   BPROPERNOUN{BPROPERNOUNrec1}
m:    SUBNOUN{SUBNOUNrec1} [head/ BPROPERNOUN{BPROPERNOUNrec1}]

comp:    
         C:   true
         A:   SUBNOUNrec1.req          := [pospol, negpol, omegapol];
              SUBNOUNrec1.env          := [pospol, negpol, omegapol];
              SUBNOUNrec1.dimforms     := BPROPERNOUNrec1.dimforms;
              SUBNOUNrec1.pluralforms  := BPROPERNOUNrec1.pluralforms;
              SUBNOUNrec1.genders      := BPROPERNOUNrec1.genders;
              SUBNOUNrec1.class        := BPROPERNOUNrec1.class;
              SUBNOUNrec1.deixis       := BPROPERNOUNrec1.deixis;
              SUBNOUNrec1.aspect       := BPROPERNOUNrec1.aspect;
              SUBNOUNrec1.retro        := BPROPERNOUNrec1.retro;
              SUBNOUNrec1.sexes        := BPROPERNOUNrec1.sexes;
              SUBNOUNrec1.subcs        := [BPROPERNOUNrec1.subc];
              SUBNOUNrec1.temporal     := BPROPERNOUNrec1.temporal;
              SUBNOUNrec1.possgeni     := false;
              SUBNOUNrec1.animate      := BPROPERNOUNrec1.animate;
              SUBNOUNrec1.human        := BPROPERNOUNrec1.human;
              SUBNOUNrec1.posscomas    := [count];
              SUBNOUNrec1.thetanp      := omegathetanp;
              SUBNOUNrec1.nounpatterns := [];
              SUBNOUNrec1.prepkey      := 0;
              SUBNOUNrec1.personal     := true;
              SUBNOUNrec1.lastaffix    := noaffix

decomp:  
         C:   (SUBNOUNrec1.dimforms     = BPROPERNOUNrec1.dimforms)    and
              (SUBNOUNrec1.pluralforms  = BPROPERNOUNrec1.pluralforms) and
              (SUBNOUNrec1.genders      = BPROPERNOUNrec1.genders)     and
              (SUBNOUNrec1.class        = BPROPERNOUNrec1.class)       and
              (SUBNOUNrec1.deixis       = BPROPERNOUNrec1.deixis)      and
              (SUBNOUNrec1.aspect       = BPROPERNOUNrec1.aspect)      and
              (SUBNOUNrec1.retro        = BPROPERNOUNrec1.retro)       and
              (SUBNOUNrec1.sexes        = BPROPERNOUNrec1.sexes)       and
              (SUBNOUNrec1.temporal     = BPROPERNOUNrec1.temporal)    and
              (SUBNOUNrec1.possgeni     = false)                       and
              (SUBNOUNrec1.animate      = BPROPERNOUNrec1.animate)     and
              (SUBNOUNrec1.human        = BPROPERNOUNrec1.human)       and
              (SUBNOUNrec1.lastaffix    = noaffix)                     and
              (BPROPERNOUNrec1.subc IN SUBNOUNrec1.subcs)
         A:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for subnouns out of bnouns without derivation.}
\begin{verbatim}
%bnountosub

m1:   BNOUN{BNOUNrec1}
m:    SUBNOUN{SUBNOUNrec1} [head/ BNOUN{BNOUNrec1}]

comp:    
         C:   true
         A:   SUBNOUNrec1       := COPYT_bnountosubnoun(BNOUNrec1)

decomp:  
         C:   true
         A:   @
&
\end{verbatim}
\newpage
\subsubsection{Derivation rule for diminutives.}
Note: 
\begin{itemize}
  \item "possgeni" (and many other attributes) come from the BNOUN;
  \item "onlyPlural"-words, like "hersenen", "notulen" and "onkosten" do NOT
         have a dim-form or have IRREGULAR dimforms like "hersentje" (or is
         "hersentjes" the only possible form??), which is of importance for the
         filling of the attribute "dimforms";
  \item for "dimletterword" see suffix-rules with "SFKdimletterword";
  \item the condition in C2 of `comp' is in this rule necessary, because
         dimforms of dimforms do not exist: *bootjetje! 
         This does NOT mean that two dimforms can never occur in one word:
         "stapJESgewijsheidJES" or "jongetJESachtigheidJES"; it only means that 
         two dimunitive-suffixes cannot be adjacent.
\end{itemize}
\begin{verbatim}
%DimForm

m1: SUBNOUN{SUBNOUNrec1}[mu1]
m2: SFCAT{SFCATrec1}

m:  SUBNOUN{SUBNOUNrec2}[complrel/SUBNOUN{SUBNOUNrec1}[mu1], 
                          head/BNOUNSUFF(dimBNOUNSUFFkey){BNOUNSUFFrec1}]

comp:

C1: true
D 2
   C2: (not(SUBNOUNrec1.lastaffix = dimaffix)) and 
       (not(noDim in SUBNOUNrec1.dimforms))
E 2
I 2
   C2: (not(SUBNOUNrec1.lastaffix = dimaffix)) and (not(noDim in  SUBNOUNrec1.dimforms))
E 2
      C3: (SFCATrec1.key = SFKje) and (jeDim in SUBNOUNrec1.dimforms)
      A3: @
      C3: (SFCATrec1.key = SFKetje) and (etjeDim in SUBNOUNrec1.dimforms)  
      A3: @
      C3: (SFCATrec1.key = SFKonregdim) and (irregdim in SUBNOUNrec1.dimforms)
      A3: @
D 2
      C3: (SFCATrec1.key = SFKdimletterword) and  
             (dimletterword in SUBNOUNrec1.dimforms)
E 2
I 2
      C3: (SFCATrec1.key = SFKdimletterword) and  (dimletterword in SUBNOUNrec1.dimforms)
E 2
      A3: @
   A2: SUBNOUNrec2               := SUBNOUNrec1;
       SUBNOUNrec2.lastaffix     := dimaffix
A1: SUBNOUNrec2.dimforms    := BNOUNSUFFrec1.dimforms;
    SUBNOUNrec2.pluralforms := BNOUNSUFFrec1.pluralforms;
    SUBNOUNrec2.genders     := BNOUNSUFFrec1.genders

decomp:

C1: (SUBNOUNrec2.pluralforms = BNOUNSUFFrec1.pluralforms) and
    (SUBNOUNrec2.genders     = BNOUNSUFFrec1.genders)      and
    (SUBNOUNrec2.dimforms    = BNOUNSUFFrec1.dimforms)
   C2: (SUBNOUNrec2.lastaffix = dimaffix)    and 
       (not(noDim in SUBNOUNrec1.dimforms))  and 
       (not(SUBNOUNrec1.lastaffix = dimaffix))  
      C3:jeDim in SUBNOUNrec1.dimforms
      A3: SFCATrec1.key := SFKje
      C3: etjeDim in SUBNOUNrec1.dimforms
      A3: SFCATrec1.key := SFKetje
      C3: irregdim in SUBNOUNrec1.dimforms
      A3: SFCATrec1.key := SFKonregdim
      C3: dimletterword in SUBNOUNrec1.dimforms
      A3: SFCATrec1.key := SFKdimletterword
   A2: @
A1: @
&
\end{verbatim}
\newpage
\subsubsection{ Rule for the singular form of nouns. }

Note: in case that the noun has pluralform only ("hersenen"), this rule 
      assigns the value "plural"!

\begin{verbatim}
%nounenkelvoud

m1:   SUBNOUN{SUBNOUNrec1}[mu1]
m:    NOUN{NOUNrec1} [head/ SUBNOUN{SUBNOUNrec1}[mu1]]

comp:    
         C1:  true
           C2:  not(OnlyPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1        := COPYT_subnountonoun(SUBNOUNrec1);
                NOUNrec1.number := singular
           C2:  OnlyPlural in SUBNOUNrec1.pluralforms
           A2:  NOUNrec1        := COPYT_subnountonoun(SUBNOUNrec1);
                NOUNrec1.number := plural
         A1:  NOUNrec1.geni  := false

decomp:  
         C1:  NOUNrec1.geni = false
           C2:  (NOUNrec1.number = singular) 
                and (not(OnlyPlural in NOUNrec1.pluralforms))
           A2:  @
           C2:  (NOUNrec1.number = plural) 
                and (OnlyPlural in NOUNrec1.pluralforms)
           A2:  @
         A1:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for the plural form of nouns.}
\begin{verbatim}
%nounmeervoud

m1:   SUBNOUN{SUBNOUNrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    NOUN{NOUNrec1} [head/ SUBNOUN{SUBNOUNrec1}[mu1]]

comp:    
         C1:  (not(OnlyPlural in SUBNOUNrec1.pluralforms)) 
              and (not(NoPlural in SUBNOUNrec1.pluralforms)) 
           C2:  (SFCATrec1.key = SFKen) 
                 and (enPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKmvs) 
                 and (sPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKaTOaa) 
                 and (aTOaaPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKaTOee) 
                 and (aTOeePlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKeTOee)
                 and (eTOeePlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKeiTOee) 
                 and (eiTOeePlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKiTOee) 
                 and (iTOeePlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKoTOoo) 
                 and (oTOooPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKeren) 
                 and (erenPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKien) 
                 and (ienPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKden) 
                 and (denPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKnen) 
                 and (nenPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKieAccent) 
                 and (ieAccentPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKlui) 
                 and (luiPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKlieden) 
                 and (liedenPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKLat) 
                 and (LatPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKenIrreg) 
                 and (enIrregPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKsIrreg) 
                 and (sIrregPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKLatIrreg) 
                 and (LatIrregPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
         A1:  NOUNrec1.number     := plural;
              NOUNrec1.geni       := false

decomp:  
         C1:   (NOUNrec1.number   = plural) 
               and (NOUNrec1.geni = false) 
               and (not(OnlyPlural in NOUNrec1.pluralforms))
           C2:  enPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKen
           C2:  sPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKmvs
           C2:  aTOaaPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKaTOaa
           C2:  aTOeePlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKaTOee
           C2:  eTOeePlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKeTOee
           C2:  eiTOeePlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKeiTOee
           C2:  iTOeePlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKiTOee
           C2:  oTOooPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKoTOoo
           C2:  erenPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKeren
           C2:  ienPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKien
           C2:  denPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKden
           C2:  nenPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKnen
           C2:  ieAccentPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKieAccent
           C2:  luiPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKlui
           C2:  liedenPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKlieden
           C2:  LatPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKLat
           C2:  enIrregPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKenIrreg
           C2:  sIrregPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKsIrreg
           C2:  LatIrregPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKLatIrreg
         A1:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for genitive of singular nouns.}

Note: ANS says that (besides rigid constructions like "heer des huizes") 
      genitive forms can only be made out of proper names and a certain kind of
      nouns, namely the ones that can be used accost somebody, like: "vader",
      "moeder", "dominee", "buurman", "ouder"(?). In the grammatical Compendium
      of Van Dale, the main criterium to decide whether or not a noun can get 
      a genitive-s is family-relation.
      Also diminutives can get genitive-s: "mijn zoontjes fiets", etc.
\begin{verbatim}      
%noungenitiefenkelvoud

m1:   SUBNOUN{SUBNOUNrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    NOUN{NOUNrec1} [head/ SUBNOUN{SUBNOUNrec1}[mu1]]


comp:    
         C:   (SFCATrec1.key = SFKgens) 
              and (SUBNOUNrec1.possgeni = true)
              and (not(OnlyPlural in SUBNOUNrec1.pluralforms))
         A:   NOUNrec1            := COPYT_subnountonoun(SUBNOUNrec1);
              NOUNrec1.number     := singular;
              NOUNrec1.geni       := true

decomp:  
         C:  (NOUNrec1.number       = singular)
             and (NOUNrec1.possgeni = true)
             and (NOUNrec1.geni     = true) 
             and (not(OnlyPlural in NOUNrec1.pluralforms))
         A:  SFCATrec1.key := SFKgens
&
\end{verbatim}
\newpage
\subsubsection{Rule for genitive of plural nouns.}

Note: because only a (very) limited number of nouns can get genitive-s, not
      every plural-ending will be possible; in fact, the only plural-ending
      here seems to be "-s": "grootouders' huis", "mijn zoontjes' fietsen",
      etc. Therefore, this rule accepts "sPlural" and "sIrregPlural" ("mijn
      eegaas' namen verschilden") only.
\begin{verbatim}
%noungenitiefmeervoud

m1:   SUBNOUN{SUBNOUNrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m3:   SFCAT{SFCATrec2}
m:    NOUN{NOUNrec1} [head/ SUBNOUN{SUBNOUNrec1}[mu1]]

comp:    
         C1:  (SFCATrec2.key = SFKgens) 
              and (SUBNOUNrec1.possgeni = true)
           C2:  (SFCATrec1.key = SFKmvs) 
                 and (sPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
           C2:  (SFCATrec1.key = SFKsIrreg) 
                 and (sIrregPlural in SUBNOUNrec1.pluralforms)
           A2:  NOUNrec1  := COPYT_subnountonoun(SUBNOUNrec1)
         A1:  NOUNrec1.number     := plural;
              NOUNrec1.geni       := true

decomp:  
         C1:  (NOUNrec1.number       = plural) 
              and (NOUNrec1.geni     = true) 
              and (NOUNrec1.possgeni = true)
           C2:  sIrregPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKsIrreg
           C2:  sPlural in NOUNrec1.pluralforms
           A2:  SFCATrec1.key := SFKmvs
         A1:  SFCATrec2.key := SFKgens
&
\end{verbatim}
\newpage
\section{Pronouns.}
\subsection{Perspro's}
\subsubsection{Rule for nominative forms of PERSPRO's.}

Note: this rule makes the "dictionary"-forms, like "ik", "jij", etc., which are
      always nominative and never reduced.
      This rule does NOT work for generalized bperspro's.
\begin{verbatim} 
%Perspro1

m1:   BPERSPRO{BPERSPROrec1}
m:    PERSPRO{PERSPROrec1} [head/ BPERSPRO{BPERSPROrec1}]

comp:    
         C:   BPERSPROrec1.generalized = false
         A:   PERSPROrec1              := COPYT_bpersprotoperspro(BPERSPROrec1);
              PERSPROrec1.persprocases := [nominative];
              PERSPROrec1.reduced      := false

decomp:  
         C:   (nominative in PERSPROrec1.persprocases) 
              and (PERSPROrec1.generalized = false)
              and (PERSPROrec1.reduced     = false)
         A:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for nominative, dative and accusative forms of PERSPRO's.}

Note: this rule makes derived forms like "mij", "jou", "hem", etc.; forms can
      be nominative, or dative, or accusative. For all cases, reduced forms, 
      like "me" are made too. This rule does NOT work for generalized forms.
\begin{verbatim}
%Perspro2

m1:   BPERSPRO{BPERSPROrec1}
m2:   SFCAT{SFCATrec1}
m:    PERSPRO{PERSPROrec1} [head/ BPERSPRO{BPERSPROrec1}]

comp:    
         C1:  BPERSPROrec1.generalized = false
           C2:   BPERSPROrec1.number = singular
             C3:   SFCATrec1.key = SFKsgnom
             A3:   PERSPROrec1         := COPYT_bpersprotoperspro(BPERSPROrec1);
                   PERSPROrec1.persprocases := [nominative];
                   PERSPROrec1.reduced      := false
             C3:   SFCATrec1.key = SFKsgnomred
             A3:   PERSPROrec1         := COPYT_bpersprotoperspro(BPERSPROrec1);
                   PERSPROrec1.persprocases := [nominative];
                   PERSPROrec1.reduced      := true
             C3:   SFCATrec1.key = SFKsgaccdat
             A3:   PERSPROrec1         := COPYT_bpersprotoperspro(BPERSPROrec1);
                   PERSPROrec1.persprocases := [accusative, dative];
                   PERSPROrec1.reduced      := false
             C3:   SFCATrec1.key = SFKsgaccdatred
             A3:   PERSPROrec1         := COPYT_bpersprotoperspro(BPERSPROrec1);
                   PERSPROrec1.persprocases := [accusative, dative];
                   PERSPROrec1.reduced      := true
           A2:   @
           C2:   BPERSPROrec1.number = plural
             C3:   SFCATrec1.key = SFKplnom
             A3:   PERSPROrec1         := COPYT_bpersprotoperspro(BPERSPROrec1);
                   PERSPROrec1.persprocases := [nominative];
                   PERSPROrec1.reduced      := false
             C3:   SFCATrec1.key = SFKplnomred
             A3:   PERSPROrec1         := COPYT_bpersprotoperspro(BPERSPROrec1);
                   PERSPROrec1.persprocases := [nominative];
                   PERSPROrec1.reduced      := true
             C3:   SFCATrec1.key = SFKplaccdat
             A3:   PERSPROrec1         := COPYT_bpersprotoperspro(BPERSPROrec1);
                   PERSPROrec1.persprocases := [accusative, dative];
                   PERSPROrec1.reduced      := false
             C3:   SFCATrec1.key = SFKplaccdatred
             A3:   PERSPROrec1         := COPYT_bpersprotoperspro(BPERSPROrec1);
                   PERSPROrec1.persprocases := [accusative, dative];
                   PERSPROrec1.reduced      := true
             C3:   SFCATrec1.key = SFKplacc
             A3:   PERSPROrec1         := COPYT_bpersprotoperspro(BPERSPROrec1);
                   PERSPROrec1.persprocases := [accusative];
                   PERSPROrec1.reduced      := false
             C3:   SFCATrec1.key = SFKpldat
             A3:   PERSPROrec1         := COPYT_bpersprotoperspro(BPERSPROrec1);
                   PERSPROrec1.persprocases := [dative];
                   PERSPROrec1.reduced      := false
           A2:   @
         A1:  @


decomp:  
         C1:   PERSPROrec1.generalized = false
           C2:   PERSPROrec1.number = singular
             C3:   (nominative in PERSPROrec1.persprocases) 
                   and (PERSPROrec1.reduced = false)
             A3:   SFCATrec1.key := SFKsgnom
             C3:   (nominative in PERSPROrec1.persprocases) 
                   and (PERSPROrec1.reduced = true)
             A3:   SFCATrec1.key := SFKsgnomred
             C3:   ([accusative, dative] * PERSPROrec1.persprocases <> []) 
                   and (PERSPROrec1.reduced = false)
             A3:   SFCATrec1.key := SFKsgaccdat
             C3:   ([accusative, dative] * PERSPROrec1.persprocases <> []) 
                   and (PERSPROrec1.reduced = true)
             A3:   SFCATrec1.key := SFKsgaccdatred
           A2:  @
           C2:  PERSPROrec1.number = plural
             C3:   (nominative in PERSPROrec1.persprocases) 
                   and (PERSPROrec1.reduced = false)
             A3:   SFCATrec1.key := SFKplnom
             C3:   (nominative in PERSPROrec1.persprocases) 
                   and (PERSPROrec1.reduced = true)
             A3:   SFCATrec1.key := SFKplnomred
             C3:   ([accusative, dative] * PERSPROrec1.persprocases <> []) 
                   and (PERSPROrec1.reduced = false)
             A3:   SFCATrec1.key := SFKplaccdat
             C3:   ([accusative, dative] * PERSPROrec1.persprocases <> []) 
                   and (PERSPROrec1.reduced = true)
             A3:   SFCATrec1.key := SFKplaccdatred
             C3:   (accusative in PERSPROrec1.persprocases) 
                   and (PERSPROrec1.reduced = false)
             A3:   SFCATrec1.key := SFKplacc
             C3:   (dative in PERSPROrec1.persprocases) 
                   and (PERSPROrec1.reduced = false)
             A3:   SFCATrec1.key := SFKpldat
           A2:  @
         A1:  @
&
\end{verbatim}
\newpage
\subsubsection{Rule for generalized PERSPRO's.}

Note: this rule works for generalized PERSPRO's; forms can
      be nominative, or dative, or accusative. 

      The value of `generalized' is false
      for the normal dictionary forms, like "ik", "jij", "hij", etc., but it is
      true for the BPERSPRO with `generalized' meaning, like "je", "ze" (as in
      for instance: "ZE laten JE hier ook maar aanploeteren"). 

\begin{verbatim} 
%Perspro3

m1:   BPERSPRO{BPERSPROrec1}
m:    PERSPRO{PERSPROrec1} [head/ BPERSPRO{BPERSPROrec1}]

comp:    
D 2
         C:  BPERSPROrec1.generalized = true
         A:  PERSPROrec1              := COPYT_bpersprotoperspro(BPERSPROrec1);
             PERSPROrec1.persprocases := [nominative, accusative, dative];
             PERSPROrec1.reduced      := true
E 2
I 2
         C:   BPERSPROrec1.generalized = true
         A:   PERSPROrec1              := COPYT_bpersprotoperspro(BPERSPROrec1);
              PERSPROrec1.persprocases := [nominative, accusative, dative];
              PERSPROrec1.reduced      := true
E 2

decomp:  
D 2
         C:  ([nominative, accusative, dative] * PERSPROrec1.persprocases <> [])
             and (PERSPROrec1.generalized = true)
             and (PERSPROrec1.reduced     = true)
E 2
I 2
         C:   ([nominative, accusative, dative] * PERSPROrec1.persprocases <> []) 
              and (PERSPROrec1.generalized = true)
              and (PERSPROrec1.reduced     = true)
E 2
         A:   @
&
\end{verbatim}
\newpage
\subsection{Whpro's, Possadj's and Posspro's}
\subsubsection{Rule for POSSADJ's.}

Note: this rule makes -generatively speaking- POSSADJ's (like "mijn", "jouw", 
      "uw", etc.) out of BPERSPRO's. Reduced forms (like "m'n") are made too.
      The attribute 'eORenForm' has a special value for "onze".
      The attribute 'geni' is 'true' for genitive forms like: "mijner", 
      "jouwer", etc.
\begin{verbatim}
%PersproToPossadj

m1:   BPERSPRO{BPERSPROrec1}
m2:   SFCAT{SFCATrec1}
m:    POSSADJ{POSSADJrec1} [head/ BPERSPRO{BPERSPROrec1}]

comp:    
         C1:   true
           C2:   BPERSPROrec1.number = singular
             C3:   SFCATrec1.key = SFKsgpossadj
             A3:   POSSADJrec1.eORenForm  := NoForm;
                   POSSADJrec1.reduced    := false;
                   POSSADJrec1.geni       := false
             C3:   SFCATrec1.key = SFKsgpossadjred
             A3:   POSSADJrec1.eORenForm  := NoForm;
                   POSSADJrec1.reduced    := true;
                   POSSADJrec1.geni       := false
             C3:   SFCATrec1.key = SFKsgpossadjgen
             A3:   POSSADJrec1.eORenForm  := NoForm;
                   POSSADJrec1.reduced    := false;
                   POSSADJrec1.geni       := true
           A2:   @
           C2:   BPERSPROrec1.number = plural
             C3:   SFCATrec1.key = SFKplpossadj
             A3:   POSSADJrec1.eORenForm  := NoForm;
                   POSSADJrec1.reduced    := false;
                   POSSADJrec1.geni       := false
             C3:   SFCATrec1.key = SFKplpossadjonze
             A3:   POSSADJrec1.eORenForm  := eForm;
                   POSSADJrec1.reduced    := false;
                   POSSADJrec1.geni       := false
             C3:   SFCATrec1.key = SFKplpossadjons
             A3:   POSSADJrec1.eORenForm  := NoForm;
                   POSSADJrec1.reduced    := false;
                   POSSADJrec1.geni       := false
             C3:   SFCATrec1.key = SFKplpossadjgen
             A3:   POSSADJrec1.eORenForm  := NoForm;
                   POSSADJrec1.reduced    := false;
                   POSSADJrec1.geni       := true
           A2:   @
         A1:  POSSADJrec1.mood := declxpmood

decomp:  
         C1:   POSSADJrec1.mood = declxpmood
           C2:   BPERSPROrec1.number = singular
             C3:   (POSSADJrec1.eORenForm   = NoForm) 
                   and (POSSADJrec1.reduced = false) 
                   and (POSSADJrec1.geni    = false) 
             A3:   SFCATrec1.key := SFKsgpossadj
             C3:   (POSSADJrec1.eORenForm   = NoForm) 
                   and (POSSADJrec1.reduced = true ) 
                   and (POSSADJrec1.geni    = false) 
             A3:   SFCATrec1.key := SFKsgpossadjred
             C3:   (POSSADJrec1.eORenForm   = NoForm) 
                   and (POSSADJrec1.reduced = false) 
                   and (POSSADJrec1.geni    = true) 
             A3:   SFCATrec1.key := SFKsgpossadjgen
           A2:   @
           C2:   BPERSPROrec1.number = plural
             C3:   (POSSADJrec1.eORenForm   = NoForm) 
                   and (POSSADJrec1.reduced = false) 
                   and (POSSADJrec1.geni    = false) 
             A3:   SFCATrec1.key := SFKplpossadj
             C3:   (POSSADJrec1.eORenForm   = eForm) 
                   and (POSSADJrec1.reduced = false) 
                   and (POSSADJrec1.geni    = false) 
             A3:   SFCATrec1.key := SFKplpossadjonze
             C3:   (POSSADJrec1.eORenForm   = NoForm) 
                   and (POSSADJrec1.reduced = false) 
                   and (POSSADJrec1.geni    = false) 
             A3:   SFCATrec1.key := SFKplpossadjons
             C3:   (POSSADJrec1.eORenForm   = NoForm) 
                   and (POSSADJrec1.reduced = false) 
                   and (POSSADJrec1.geni    = true ) 
             A3:   SFCATrec1.key := SFKplpossadjgen
           A2:   @
         A1:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for POSSPRO's.}

Note: this rule makes POSSPRO's, like: "mijne", "jouwe", etc. out of BPERSPRO's.
      There is no POSSPRO form corresponding to "jullie"!
\begin{verbatim}
%PersproToPosspro

m1:   BPERSPRO{BPERSPROrec1}
m2:   SFCAT{SFCATrec1}
m:    POSSPRO{POSSPROrec1} [head/ BPERSPRO{BPERSPROrec1}]

comp:    
         C1:   true
           C2:   BPERSPROrec1.number = singular
             C3:   SFCATrec1.key = SFKsgposs
             A3:   POSSPROrec1.nForm   := false
             C3:   SFCATrec1.key = SFKsgpossnvorm
             A3:   POSSPROrec1.nForm   := true
           A2:   @
           C2:   BPERSPROrec1.number = plural
             C3:   SFCATrec1.key = SFKplposs
             A3:   POSSPROrec1.nForm   := false
             C3:   SFCATrec1.key = SFKplpossnvorm
             A3:   POSSPROrec1.nForm   := true
           A2:   @
         A1:  @

decomp:  
         C1:   BPERSPROrec1.number = singular
           C2:   POSSPROrec1.nForm = false
           A2:   SFCATrec1.key   := SFKsgposs
           C2:   POSSPROrec1.nForm = true
           A2:   SFCATrec1.key   := SFKsgpossnvorm
         A1:   @
         C1:   BPERSPROrec1.number = plural
           C2:   POSSPROrec1.nForm = false
           A2:   SFCATrec1.key   := SFKplposs
           C2:   POSSPROrec1.nForm = true
           A2:   SFCATrec1.key   := SFKplpossnvorm
         A1:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for WHPRO's out of BWHPRO's.}

\begin{verbatim} 
%BwhProToWhPro

m1:   BWHPRO{BWHPROrec1}
m:    WHPRO{WHPROrec1} [head/ BWHPRO{BWHPROrec1}]

comp:    
         C:   true
         A:   WHPROrec1   := COPYT_bwhprotowhpro(BWHPROrec1)

decomp:  
         C:   true
         A:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for POSSADJ's out of BWHPRO.}

Note: this rule makes "wiens" and "wier" out of "wie".
\begin{verbatim}
%WhproToPossadj

m1:   BWHPRO{BWHPROrec1}
m2:   SFCAT{SFCATrec1}
m:    POSSADJ{POSSADJrec1} [head/ BWHPRO{BWHPROrec1}]

comp:    
         C1:  true
           C2:  BWHPROrec1.number = singular
             C3:  (SFCATrec1.key = SFKpossadjwiens) 
                  and (BWHPROrec1.sexes = [masculine])
             A3:  @
             C3:  (SFCATrec1.key = SFKpossadjwier) 
                  and (BWHPROrec1.sexes = [feminine])
             A3:  @
           A2:  @
           C2:  BWHPROrec1.number = plural
             C3:  (SFCATrec1.key = SFKpossadjwier) 
                  and (BWHPROrec1.sexes = [masculine,feminine])
             A3:  @
           A2:  @
         A1:  POSSADJrec1.mood      := wh;
              POSSADJrec1.reduced   := false;
              POSSADJrec1.eORenForm := NoForm;
              POSSADJrec1.geni      := false


decomp:  
         C1:  (POSSADJrec1.mood          = wh) 
              and (POSSADJrec1.reduced   = false) 
              and (POSSADJrec1.eORenForm = NoForm) 
              and (POSSADJrec1.geni      = false)
           C2:   BWHPROrec1.number = singular
             C3:   BWHPROrec1.sexes = [masculine]
             A3:   SFCATrec1.key   := SFKpossadjwiens
             C3:   BWHPROrec1.sexes = [feminine]
             A3:   SFCATrec1.key   := SFKpossadjwier
           A2:   @
           C2:   BWHPROrec1.number = plural
             C3:   BWHPROrec1.sexes = [masculine,feminine]
             A3:   SFCATrec1.key   := SFKpossadjwier
           A2:   @
         A1:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for POSSADJ out of DEMPRO.}

Note: this rule makes "diens" out of "die".
\begin{verbatim}
%DemproToPossadj

m1:   DEMPRO{DEMPROrec1}
m2:   SFCAT{SFCATrec1}
m:    POSSADJ{POSSADJrec1} [head/ DEMPRO{DEMPROrec1}]

comp:    
         C:  (SFCATrec1.key = SFKpossadjdiens) 
             and (DEMPROrec1.sexes = [masculine])
         A:  POSSADJrec1.mood      := declxpmood;
             POSSADJrec1.reduced   := false;
             POSSADJrec1.eORenForm := NoForm;
             POSSADJrec1.geni      := false
             

decomp:  
         C:  (POSSADJrec1.mood          = declxpmood) 
             and (POSSADJrec1.reduced   = false) 
             and (POSSADJrec1.eORenForm = NoForm) 
             and (POSSADJrec1.geni      = false) 
             and (DEMPROrec1.sexes      = [masculine])
         A:  SFCATrec1.key := SFKpossadjdiens
&
\end{verbatim}
\newpage

\section{Det's and Indefpro's.}
\subsection{Rules for Det's.}
\subsubsection{Rule for DET out of BDET.}
\begin{verbatim}
%BDetToDet1

m1:   BDET{BDETrec1}
m:    DET{DETrec1} [head/ BDET{BDETrec1}]

comp:    
         C:   true

         A:   DETrec1 := COPYT_bdettodet(BDETrec1);
              DETrec1.eORenForm := NoForm

decomp:  
         C:   DETrec1.eORenForm = NoForm

         A:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for DET out of BDET with inflection.}

Note: this rule makes (for instance) "vele" and "velen" out of "veel".
Note: because all forms of the words of the category (B)DET are listed in the
      suffix-rules (in combination with the suffix-keys SFKedet and SFKendet),
      only two values for eFormation suffice: NoFormation (for BDET that don't
      have an e-form) and regeFormation (for those that do have one). The value 
      irregeFormation is not needed!
\begin{verbatim}
%BDetToDet2

m1:   BDET{BDETrec1}
m2:   SFCAT{SFCATrec1}
m:    DET{DETrec1} [head/ BDET{BDETrec1}]

comp:    
         C1:  true
            C2:  (SFCATrec1.key = SFKeDet) 
                  and (BDETrec1.eFormation = regeFormation)
            A2:  DETrec1 := COPYT_bdettodet(BDETrec1);
                 DETrec1.eORenForm := eForm
            C2:  (SFCATrec1.key = SFKenDet) 
                  and (BDETrec1.enFormation = true)
            A2:  DETrec1 := COPYT_bdettodet(BDETrec1);
                 DETrec1.eORenForm := enForm
         A1:  @


decomp:  

         C1:   true
           C2:   (DETrec1.eORenForm = eForm) 
                  and (DETrec1.eFormation = regeFormation)
           A2:   SFCATrec1.key := SFKeDet 
           C2:   (DETrec1.eORenForm = enForm) 
                  and (DETrec1.enFormation = true)
           A2:   SFCATrec1.key := SFKenDet 
         A1:   @
&
\end{verbatim}
\newpage
\subsection{Rules for Indefpro's.}
\subsubsection{Rule for INDEFPRO out of BINDEFPRO.}
\begin{verbatim}
%Bindefprotoindefpro1

m1:   BINDEFPRO{BINDEFPROrec1}
m:    INDEFPRO{INDEFPROrec1} [head/ BINDEFPRO{BINDEFPROrec1}]

comp:    
         C:   true

         A:   INDEFPROrec1 := COPYT_bindefprotoindefpro(BINDEFPROrec1);
              INDEFPROrec1.geni := false 

decomp:  
         C:   INDEFPROrec1.geni = false 

         A:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for INDEFPRO out of BINDEFPRO with genitive.}

Note: this rule makes (for instance) "iemands" out of "iemand".
\begin{verbatim}
%Bindefprotoindefpro2

m1:   BINDEFPRO{BINDEFPROrec1}
m2:   SFCAT{SFCATrec1}
m:    INDEFPRO{INDEFPROrec1} [head/ BINDEFPRO{BINDEFPROrec1}]

comp:    
         C:  (SFCATrec1.key = SFKgens) 
              and (BINDEFPROrec1.possgeni = true)
         A:  INDEFPROrec1 := COPYT_bindefprotoindefpro(BINDEFPROrec1);
             INDEFPROrec1.geni := true


decomp:  

         C:  (INDEFPROrec1.geni = true) 
              and (INDEFPROrec1.possgeni = true)
         A:  SFCATrec1.key := SFKgens
&
\end{verbatim}
E 1
