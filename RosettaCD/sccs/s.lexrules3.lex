h18364
s 00000/00000/00683
d D 1.2 92/02/21 15:41:28 rous 2 1
c 
e
s 00683/00000/00000
d D 1.1 91/05/23 13:13:42 leermake 1 0
c date and time created 91/05/23 13:13:42 by leermake
e
u
U
f e 0
t
T
I 1
%DUTCH3
%&

\newpage
\section{Adjectives and adverbs.}
\subsection{Adjectives.}
\subsubsection{Rule for adjectives without derivational affixes.}
\begin{verbatim}
%adjbtosub

m1:   BADJ{BADJrec1}
m:    SUBADJ{SUBADJrec1} [head/ BADJ{BADJrec1}]

comp:    
         C:   true
         A:   SUBADJrec1 := COPYT_badjtosubadj(BADJrec1)

decomp:  
         C:   true
         A:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for the positive form of adjectives.}
\begin{verbatim}
%adjposvorm

m1:   SUBADJ{SUBADJrec1}[mu1]
m:    ADJ{ADJrec1} [head/ SUBADJ{SUBADJrec1}[mu1]]

comp:    
         C:   true
         A:   ADJrec1           := COPYT_subadjtoadj(SUBADJrec1);
              ADJrec1.form      := positive;
              ADJrec1.eORenForm := NoForm

decomp:  
         C:   (ADJrec1.eORenForm = NoForm)
              and (ADJrec1.form  = positive)
         A:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for the "-s"-form of the positive of adjectives.}
\begin{verbatim}
%adjsPositive

m1:   SUBADJ{SUBADJrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    ADJ{ADJrec1} [head/ SUBADJ{SUBADJrec1}[mu1]]

comp:    
         C:   (SFCATrec1.key = SFKadjs) 
              and (SUBADJrec1.sFormation = true)
         A:   ADJrec1           := COPYT_subadjtoadj(SUBADJrec1);
              ADJrec1.form      := sPositive;
              ADJrec1.eORenForm := NoForm

decomp:  
         C:   (ADJrec1.form           = sPositive)
              and (ADJrec1.eORenForm  = NoForm)
              and (ADJrec1.sFormation = true)
         A:   SFCATrec1.key := SFKadjs
&
\end{verbatim}
\newpage
\subsubsection{Rule for the comparative of adjectives.}
\begin{verbatim}
%adjcompvorm

m1:   SUBADJ{SUBADJrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    ADJ{ADJrec1} [head/ SUBADJ{SUBADJrec1}[mu1]]

comp:    
         C1: true
           C2: (SFCATrec1.key = SFKer) 
               and (erComp in SUBADJrec1.comparatives)
           A2: ADJrec1  := COPYT_subadjtoadj(SUBADJrec1)
           C2: (SFCATrec1.key = SFKonreger) 
               and (erIrregComp in SUBADJrec1.comparatives)
           A2: ADJrec1  := COPYT_subadjtoadj(SUBADJrec1)
         A1:  ADJrec1.form      := comparative;
              ADJrec1.eORenForm := NoForm

decomp:  
         C1: (ADJrec1.form          = comparative) 
             and (ADJrec1.eORenForm = NoForm)
           C2:  erComp in ADJrec1.comparatives
           A2:  SFCATrec1.key := SFKer
           C2:  erIrregComp in ADJrec1.comparatives
           A2:  SFCATrec1.key := SFKonreger
         A1:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for "-s"-form of comparatives.}
\begin{verbatim}
%adjsComparative

m1:   SUBADJ{SUBADJrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m3:   SFCAT{SFCATrec2}
m:    ADJ{ADJrec1} [head/ SUBADJ{SUBADJrec1}[mu1]]

comp:    
         C1: SFCATrec2.key = SFKadjs
           C2: (SFCATrec1.key = SFKer) 
               and (erComp in SUBADJrec1.comparatives)
           A2: ADJrec1  := COPYT_subadjtoadj(SUBADJrec1)
           C2: (SFCATrec1.key = SFKonreger)
               and (erIrregComp in SUBADJrec1.comparatives)
           A2: ADJrec1  := COPYT_subadjtoadj(SUBADJrec1)
         A1: ADJrec1.form      := sComparative;
             ADJrec1.eORenForm := NoForm

decomp:  
         C1:  (ADJrec1.form          = sComparative) 
              and (ADJrec1.eORenForm = NoForm)
           C2:  erComp in ADJrec1.comparatives
           A2:  SFCATrec1.key := SFKer
           C2:  erIrregComp in ADJrec1.comparatives
           A2:  SFCATrec1.key := SFKonreger
         A1:  SFCATrec2.key := SFKadjs
&
\end{verbatim}
\newpage
\subsubsection{Rule for the superlative of adjectives.}
\begin{verbatim}
%adjsupvorm

m1:   SUBADJ{SUBADJrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    ADJ{ADJrec1} [head/ SUBADJ{SUBADJrec1}[mu1]]

comp:    
         C1: true
           C2: (SFCATrec1.key = SFKst) 
               and (stSup in SUBADJrec1.superlatives)
           A2: ADJrec1  := COPYT_subadjtoadj(SUBADJrec1)
           C2: (SFCATrec1.key = SFKonregst) 
               and (stIrregSup in SUBADJrec1.superlatives)
           A2: ADJrec1  := COPYT_subadjtoadj(SUBADJrec1)
          A: ADJrec1.form      := superlative;
             ADJrec1.eORenForm := NoForm

decomp:  
        C1: (ADJrec1.form = superlative) 
            and (ADJrec1.eORenForm = NoForm)
          C2:  stSup in ADJrec1.superlatives
          A2:  SFCATrec1.key := SFKst
          C2:  stIrregSup in ADJrec1.superlatives
          A2:  SFCATrec1.key := SFKonregst
        A1:  @
&
\end{verbatim}
\newpage
\subsubsection{Rule for the "aller"-superlative of adjectives.}
\begin{verbatim}
%adjallersupvorm

m1:   PFCAT{PFCATrec1}
m2:   SUBADJ{SUBADJrec1}[mu1]
m3:   SFCAT{SFCATrec1}
m:    ADJ{ADJrec1} [head/ SUBADJ{SUBADJrec1}[mu1]]

comp:    
         C1: PFCATrec1.key   = PFKaller
           C2: (SFCATrec1.key = SFKst) 
               and (allerSup in SUBADJrec1.superlatives)
           A2: ADJrec1  := COPYT_subadjtoadj(SUBADJrec1)
           C2: (SFCATrec1.key = SFKonregst) 
               and (allerIrregSup in SUBADJrec1.superlatives)
           A2: ADJrec1  := COPYT_subadjtoadj(SUBADJrec1)
         A: ADJrec1.form      := allerSuperlative;
            ADJrec1.eORenForm := NoForm

decomp:  
         C1:  (ADJrec1.form          = allerSuperlative) 
              and (ADJrec1.eORenForm = NoForm)
           C2:  allerSup in ADJrec1.superlatives
           A2:  SFCATrec1.key := SFKst
           C2:  allerIrregSup in ADJrec1.superlatives
           A2:  SFCATrec1.key := SFKonregst
         A1:  PFCATrec1.key := PFKaller
&
\end{verbatim}
\newpage
\subsubsection{The "-e"-form of adjectives.}

Note:  the "e"-form can be made out of: positive, 
   comparative, superlative and allersuperlative of adjectives.

Note: attributively used adjectives can get "-e"; nominalised adjectives can get
      "-e" or "-en". The inherent attribute "uses" tells us whether or not 
      adjectives can be used attributively or nominalised.

\begin{verbatim}
%adjEform

m1:   ADJ{ADJrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    ADJ{ADJrec1}[mu1]

comp:    
         C1:  ADJrec1.eORenForm = NoForm
           C2:  (ADJrec1.form     = comparative) 
                 or (ADJrec1.form = superlative) 
                 or (ADJrec1.form = allersuperlative)
             C3: SFCATrec1.key = SFKe
               C4: (attributive in ADJrec1.uses) 
                    or (nominalised in ADJrec1.uses)
               A4:  @
             A3:  @
           A2:  @
           C2:  ADJrec1.form = positive 
             C3:  (SFCATrec1.key = SFKe)
                  and (   ((ADJrec1.eFormation = regeFormation)
                           and (attributive in ADJrec1.uses))
                      or  ((ADJrec1.eNominalised = regeNominalised)
                           and (nominalised in ADJrec1.uses))   )
             A3:  @
             C3:  (SFCATrec1.key = SFKonrege)
                  and (   ((ADJrec1.eFormation = irregeFormation)
                           and (attributive in ADJrec1.uses))
                      or  ((ADJrec1.eNominalised = irregeNominalised)
                           and (nominalised in ADJrec1.uses))   )
             A3:  @
           A2:  @
         A1:  ADJrec1.eORenForm := eForm

decomp:  
         C1: ADJrec1.eORenForm = eForm
           C2:  (ADJrec1.form     = comparative) 
                 or (ADJrec1.form = superlative) 
                 or (ADJrec1.form = allersuperlative)
             C3: (attributive in ADJrec1.uses) 
                  or (nominalised in ADJrec1.uses) 
             A3:  @
           A2:  SFCATrec1.key := SFKe
           C2:  ADJrec1.form = positive 
             C3:  ((attributive in ADJrec1.uses) 
                    and (ADJrec1.eFormation   = irregeFormation))
                  or
                  ((nominalised in ADJrec1.uses) 
                    and (ADJrec1.eNominalised = irregeNominalised))
             A3:  SFCATrec1.key := SFKonrege
             C3:  ((attributive in ADJrec1.uses) 
                   and (ADJrec1.eFormation   = regeFormation))
                  or
                  ((nominalised in ADJrec1.uses)
                   and (ADJrec1.eNominalised = regeNominalised))
             A3: SFCATrec1.key := SFKe 
           A2:  @
         A1:  ADJrec1.eORenForm := NoForm
&
\end{verbatim}
\newpage
\subsubsection{The "-en"-form of adjectives.}
\begin{verbatim}
%adjENform

m1:   ADJ{ADJrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    ADJ{ADJrec1}[mu1]

comp: 
        C1:  ADJrec1.eORenForm = eForm
           C2:  (nominalised in ADJrec1.uses) 
                and (SFCATrec1.key = SFKen) 
             C3:  (ADJrec1.form     = positive) 
                   or (ADJrec1.form = comparative)
                   or (ADJrec1.form = superlative) 
                   or (ADJrec1.form = allersuperlative)
             A3:  @
           A2:  @
         A1:  ADJrec1.eORenForm := enForm

decomp:  
         C1: (nominalised in ADJrec1.uses) 
             and (ADJrec1.eORenForm = enForm) 
           C2: (ADJrec1.eNominalised     = regeNominalised)
                or (ADJrec1.eNominalised = irregeNominalised)
             C3: (ADJrec1.form     = positive) 
                  or (ADJrec1.form = comparative) 
                  or (ADJrec1.form = superlative) 
                  or (ADJrec1.form = allersuperlative)
             A3: @
           A2: @
         A1: SFCATrec1.key     := SFKen;
             ADJrec1.eORenForm := eForm
&
\end{verbatim}
\newpage
\subsection{Adverbs.}
\subsubsection{Rule for adverbs without derivational affixes.}
\begin{verbatim}
%badvtosubadv

m1:   BADV{BADVrec1}
m:    SUBADV{SUBADVrec1} [head/ BADV{BADVrec1}]

comp:    
         C: true
         A: SUBADVrec1 := COPYT_badvtosubadv(BADVrec1)

decomp:  
         C: true
         A: @
&
\end{verbatim}
\newpage
\subsubsection{Rule for the derivation of adverbs from adjectives.}

\begin{verbatim}
%AdvFromAdj

m1: SUBADJ{SUBADJrec1}[mu1]

m:  SUBADV{SUBADVrec1}[complrel/SUBADJ{SUBADJrec1}[mu1], 
                        head/BADVSUFF(adjadvBADVSUFFkey){BADVSUFFrec1}]

comp:

C1: true
   C2: SUBADJrec1.possadv = true
   A2: SUBADVrec1.lastaffix     := advaffix
A1: SUBADVrec1.req          := SUBADJrec1.req;  
    SUBADVrec1.env          := SUBADJrec1.env;  
    SUBADVrec1.comparatives := SUBADJrec1.comparatives;
    SUBADVrec1.superlatives := SUBADJrec1.superlatives;
    SUBADVrec1.subcs       := BADVSUFFrec1.subcs;    
    SUBADVrec1.Qstatus     := BADVSUFFrec1.Qstatus;  
    SUBADVrec1.class        := SUBADJrec1.class;
    SUBADVrec1.deixis       := SUBADJrec1.deixis;
    SUBADVrec1.aspect       := SUBADJrec1.aspect;
    SUBADVrec1.retro        := SUBADJrec1.retro;
    SUBADVrec1.mood        := BADVSUFFrec1.mood;    
    SUBADVrec1.thetaadv    := BADVSUFFrec1.thetaadv;    
    SUBADVrec1.advpatterns := BADVSUFFrec1.advpatterns;    
    SUBADVrec1.prepkey     := BADVSUFFrec1.prepkey;    
    SUBADVrec1.temporal    := BADVSUFFrec1.temporal;
    SUBADVrec1.possnietnp  := BADVSUFFrec1.possnietnp;    
    SUBADVrec1.thanas      := BADVSUFFrec1.thanas;    
    SUBADVrec1.Radvb           := false

decomp:

C1: (SUBADVrec1.req          = SUBADJrec1.req)          and
    (SUBADVrec1.env          = SUBADJrec1.env)          and
    (SUBADVrec1.comparatives = SUBADJrec1.comparatives) and
    (SUBADVrec1.superlatives = SUBADJrec1.superlatives) and
    (SUBADVrec1.subcs        = BADVSUFFrec1.subcs)        and
    (SUBADVrec1.Qstatus      = BADVSUFFrec1.Qstatus)      and
    (SUBADVrec1.class        = SUBADJrec1.class)        and
    (SUBADVrec1.deixis       = SUBADJrec1.deixis)       and
    (SUBADVrec1.aspect       = SUBADJrec1.aspect)       and
    (SUBADVrec1.retro        = SUBADJrec1.retro)        and
    (SUBADVrec1.mood         = BADVSUFFrec1.mood)         and
    (SUBADVrec1.thetaadv     = BADVSUFFrec1.thetaadv)     and
    (SUBADVrec1.advpatterns  = BADVSUFFrec1.advpatterns)  and
    (SUBADVrec1.prepkey      = BADVSUFFrec1.prepkey)      and
    (SUBADVrec1.temporal     = BADVSUFFrec1.temporal)     and
    (SUBADVrec1.possnietnp   = BADVSUFFrec1.possnietnp)   and
    (SUBADVrec1.thanas       = BADVSUFFrec1.thanas)       and
    (SUBADVrec1.Radvb        = false)  
   C2:  (SUBADJrec1.possadv    = true)   and
        (SUBADVrec1.lastaffix  = advaffix)                  
   A2: @
A2: @
&
\end{verbatim}
\newpage
\subsubsection{Rule for positive form of adverbs.}
\begin{verbatim}
%advposvorm

m1:   SUBADV{SUBADVrec1}[mu1]
m:    ADV{ADVrec1} [head/ SUBADV{SUBADVrec1}[mu1]]

comp:     
         C:   true
         A:   ADVrec1       := COPYT_subadvtoadv(SUBADVrec1);
              ADVrec1.eORenForm  := NoForm;
              ADVrec1.form       := positive

decomp:  
         C:   (ADVrec1.eORenForm = NoForm)
              and (ADVrec1.form  = positive)
         A:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for comparative forms of adverbs.}
\begin{verbatim} 
%advcompvorm

m1:   SUBADV{SUBADVrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    ADV{ADVrec1} [head/ SUBADV{SUBADVrec1}[mu1]]

comp:    
         C1:  true
           C2:  (SFCATrec1.key = SFKer) 
                 and (erComp in SUBADVrec1.comparatives)
           A2:  ADVrec1  := COPYT_subadvtoadv(SUBADVrec1)
           C2:  (SFCATrec1.key = SFKonreger) 
                 and (erIrregComp in SUBADVrec1.comparatives) 
           A2:  ADVrec1  := COPYT_subadvtoadv(SUBADVrec1)
         A1:  ADVrec1.eORenForm  := NoForm;
              ADVrec1.form       := comparative

decomp:  
         C1:  (ADVrec1.eORenForm = NoForm) 
               and (ADVrec1.form = comparative)
           C2:  erComp in ADVrec1.comparatives
           A2:  SFCATrec1.key := SFKer
           C2:  erIrregComp in ADVrec1.comparatives
           A2:  SFCATrec1.key := SFKonreger
         A1:   @
&
\end{verbatim}
\newpage
\subsubsection{Rule for superlatives of adverbs.}
\begin{verbatim} 
%advsupvorm

m1:   SUBADV{SUBADVrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    ADV{ADVrec1} [head/ SUBADV{SUBADVrec1}[mu1]]

comp:    
         C1:  true
           C2:  (SFCATrec1.key = SFKst) 
                 and (stSup in SUBADVrec1.superlatives)
           A2:  ADVrec1  := COPYT_subadvtoadv(SUBADVrec1)
           C2:  (SFCATrec1.key = SFKonregst)
                 and (stIrregSup in SUBADVrec1.superlatives)
           A2:  ADVrec1  := COPYT_subadvtoadv(SUBADVrec1)
         A1:  ADVrec1.eORenForm  := NoForm; 
              ADVrec1.form       := superlative

decomp:  
        C1:  (ADVrec1.eORenForm = NoForm)
              and (ADVrec1.form = superlative)
           C2:  stSup in ADVrec1.superlatives
           A2:  SFCATrec1.key := SFKst
           C2:  stIrregSup in ADVrec1.superlatives
           A2:  SFCATrec1.key := SFKonregst
         A:  @
&
\end{verbatim}
\newpage
\subsubsection{Rule for the "aller"-superlative of adverbs.}
\begin{verbatim} 
%advallersupvorm

m1:   PFCAT{PFCATrec1}
m2:   SUBADV{SUBADVrec1}[mu1]
m3:   SFCAT{SFCATrec1}
m:    ADV{ADVrec1} [head/ SUBADV{SUBADVrec1}[mu1]]

comp:    
         C1:  PFCATrec1.key = PFKaller
           C2:  (SFCATrec1.key = SFKst) 
                 and (allerSup in SUBADVrec1.superlatives)
           A2:  ADVrec1  := COPYT_subadvtoadv(SUBADVrec1)
           C2:  (SFCATrec1.key = SFKonregst) 
                 and (allerIrregSup in SUBADVrec1.superlatives)
           A2:  ADVrec1  := COPYT_subadvtoadv(SUBADVrec1)
         A1:  ADVrec1.eORenForm  := NoForm;
              ADVrec1.form       := allersuperlative

decomp:  
         C1:  (ADVrec1.eORenForm = NoForm) 
               and (ADVrec1.form = allersuperlative)
           C2:  allerSup in ADVrec1.superlatives
           A2:  SFCATrec1.key := SFKst
           C2:  allerIrregSup in ADVrec1.superlatives
           A2:  SFCATrec1.key := SFKonregst
         A1:  PFCATrec1.key := PFKaller
&
\end{verbatim}
\newpage
\subsubsection{The "-e"-form of adverbs.}

Note: adverbs have eForm in the (aller)superlative, like "het beste", "het 
      liefste" (from: graag). They never have enForm. I assume that every
      adverb that can have (aller)superlative also can have the eForm of 
      this (aller)superlative, and that this will be made regular (with
      SFKe) because the string ends in -st.

\begin{verbatim} 
%adveform

m1:   ADV{ADVrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    ADV{ADVrec1}[mu1]

comp:    
         C1:  (ADVrec1.eORenForm = NoForm) 
              and (SFCATrec1.key = SFKe)
           C2:  (ADVrec1.form    = superlative) 
                or (ADVrec1.form = allersuperlative)
           A2:  @
         A1:  ADVrec1.eORenForm := eForm

decomp:  
         C1: ADVrec1.eORenForm = eForm
           C2:  (ADVrec1.form    = superlative) 
                or (ADVrec1.form = allersuperlative)
           A2:  @
         A1: SFCATrec1.key     := SFKe; 
             ADVrec1.eORenForm := NoForm
&
\end{verbatim} 

\newpage
\subsubsection{Numbers written with digits}


\begin{verbatim} 
%CARDrule1
m1:  DIGIT{DIGITrec1}
m :  CARD{CARDrec1}[head/DIGIT{DIGITrec1}]


comp:
         C1: DIGITrec1.valeu = 1
         A1: CARDrec1.possnumbers := [singular] 
         C2: DIGITrec1.valeu <> 1
         A2: CARDrec1.possnumbers := [plural]

decomp:
         C1: (DIGITrec1.valeu = 1) and
             (CARDrec1.possnumbers = [singular]) 
         A1: @
         C2: (DIGITrec1.valeu <> 1) and
             (CARDrec1.possnumbers = [plural])
         A2: @

&
\end{verbatim} 

\newpage
\begin{verbatim}
%CARDrule2
m1:  CARD{CARDrec1}[mu1]
m2:  SFCAT{SFCATrec1}
m :  CARD{CARDrec2}
         [ head/CARD{CARDrec1}[mu1],
           argrel/DIGIT(*){DIGITrec1}
         ]

comp:
         C1: SFCATrec1.key = SFK1 
         A1: CARDrec2.possnumbers := [plural];
             DIGITrec1.key := intkey('s_1DIGITkey'); 
             DIGITrec1.valeu := 1 

         C2: SFCATrec1.key = SFK2 
         A2: CARDrec2.possnumbers := [plural];
             DIGITrec1.key := intkey('s_2DIGITkey'); 
             DIGITrec1.valeu := 2 

         C3: SFCATrec1.key = SFK3 
         A3: CARDrec2.possnumbers := [plural];
             DIGITrec1.key := intkey('s_3DIGITkey'); 
             DIGITrec1.valeu := 3 

         C4: SFCATrec1.key = SFK4 
         A4: CARDrec2.possnumbers := [plural];
             DIGITrec1.key := intkey('s_4DIGITkey'); 
             DIGITrec1.valeu := 4 

         C5: SFCATrec1.key = SFK5 
         A5: CARDrec2.possnumbers := [plural];
             DIGITrec1.key := intkey('s_5DIGITkey'); 
             DIGITrec1.valeu := 5 

         C6: SFCATrec1.key = SFK6 
         A6: CARDrec2.possnumbers := [plural];
             DIGITrec1.key := intkey('s_6DIGITkey'); 
             DIGITrec1.valeu := 6 

         C7: SFCATrec1.key = SFK7 
         A7: CARDrec2.possnumbers := [plural];
             DIGITrec1.key := intkey('s_7DIGITkey'); 
             DIGITrec1.valeu := 7 

         C8: SFCATrec1.key = SFK8 
         A8: CARDrec2.possnumbers := [plural];
             DIGITrec1.key := intkey('s_8DIGITkey'); 
             DIGITrec1.valeu := 8 

         C9: SFCATrec1.key = SFK9 
         A9: CARDrec2.possnumbers := [plural];
             DIGITrec1.key := intkey('s_9DIGITkey'); 
             DIGITrec1.valeu := 9 

         C0: SFCATrec1.key = SFK0 
         A0: CARDrec2.possnumbers := [plural];
             DIGITrec1.key := intkey('s_0DIGITkey'); 
             DIGITrec1.valeu := 0 

decomp:

         C1: (DIGITrec1.key = intkey('s_1DIGITkey')) and
             (DIGITrec1.valeu = 1 )        and
             (CARDrec2.possnumbers = [plural])
         A1: SFCATrec1.key := SFK1

         C2: (DIGITrec1.key = intkey('s_2DIGITkey')) and
             (DIGITrec1.valeu = 2)         and
             (CARDrec2.possnumbers = [plural])
         A2: SFCATrec1.key := SFK2

         C3: (DIGITrec1.key = intkey('s_3DIGITkey')) and
             (DIGITrec1.valeu = 3)         and
             (CARDrec2.possnumbers = [plural])
         A3: SFCATrec1.key := SFK3

         C4: (DIGITrec1.key = intkey('s_4DIGITkey')) and
             (DIGITrec1.valeu = 4)         and
             (CARDrec2.possnumbers = [plural])
         A4: SFCATrec1.key := SFK4

         C5: (DIGITrec1.key = intkey('s_5DIGITkey')) and
             (DIGITrec1.valeu = 5)         and
             (CARDrec2.possnumbers = [plural])
         A5: SFCATrec1.key := SFK5

         C6: (DIGITrec1.key = intkey('s_6DIGITkey')) and
             (DIGITrec1.valeu = 6)         and
             (CARDrec2.possnumbers = [plural])
         A6: SFCATrec1.key := SFK6

         C7: (DIGITrec1.key = intkey('s_7DIGITkey')) and
             (DIGITrec1.valeu = 7)         and
             (CARDrec2.possnumbers = [plural])
         A7: SFCATrec1.key := SFK7

         C8: (DIGITrec1.key = intkey('s_8DIGITkey')) and
             (DIGITrec1.valeu = 8)         and
             (CARDrec2.possnumbers = [plural])
         A8: SFCATrec1.key := SFK8

         C9: (DIGITrec1.key = intkey('s_9DIGITkey')) and
             (DIGITrec1.valeu = 9)         and
             (CARDrec2.possnumbers = [plural])
         A9: SFCATrec1.key := SFK9

         C0: (DIGITrec1.key = intkey('s_0DIGITkey')) and
             (DIGITrec1.valeu = 0)         and
             (CARDrec2.possnumbers = [plural])
         A0: SFCATrec1.key := SFK0

&

\end{verbatim}

\newpage
\begin{verbatim}
!!Still to be added:  SUBADJrec1.affix := ordaffix;
%ORDINALrule1
m1:  CARD{CARDrec1}[mu1]
m2:  SFCAT{SFCATrec1}
m :  SUBADJ{SUBADJrec1}
           [complrel/CARD{CARDrec1}[mu1],
            head/BADJSUFF(ordBADJSUFFkey){BADJSUFFrec1}
           ]

comp:
         C1: SFCATrec1.key = SFKe 
         A1: SUBADJrec1 := COPYT_BADJTOSUBADJ(BADJSUFFrec1)

decomp:
         C1: TRUE
         A1: SFCATrec1.key := SFKe
&

\end{verbatim}

E 1
