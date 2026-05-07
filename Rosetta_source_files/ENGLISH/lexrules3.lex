%ENGLISH3
%&

\newpage
\section{Pronouns}
Most pronoun rules in English are extremely simple. Hence, little comment has
been provided. Note that English does not have af rule for Indefinite Pronouns, 
although there is such a rule in Dutch. In the M-grammar, a SUBINDEFPRO level
has been defined, which is the same as the INDEFPRO level. Hence, morphology
need not bother with it.

\subsection{Personal Pronouns (PersPro)}
\subsubsection{Nominative}
\begin{verbatim}
%LPersproNom

m1: BPERSPRO{BPERSPROrec1}

m: PERSPRO{PERSPROrec1}[head/BPERSPRO{BPERSPROrec1}]

comp:

C1: true
A1: PERSPROrec1 := copyT_bpersprotoperspro(BPERSPROrec1);
    PERSPROrec1.persprocase := nominative

decomp:

C1: PERSPROrec1.persprocase = nominative
A1: @

&
\end{verbatim}
\newpage
\subsubsection{Accusative}
\begin{verbatim}
%LPersproAcc

m1: BPERSPRO{BPERSPROrec1}
m2: SFCAT{SFCATrec1}

m: PERSPRO{PERSPROrec1}[head/BPERSPRO{BPERSPROrec1}]

comp:

C1: SFCATrec1.key = SFKacc
A1: PERSPROrec1 := copyT_bpersprotoperspro(BPERSPROrec1);
    PERSPROrec1.persprocase := accusative

decomp:

C1: PERSPROrec1.persprocase = accusative
A1: SFCATrec1.key := SFKacc

&
\end{verbatim}
Note that the accusative of the PERSPRO {\em you\/} is dealt with here too,
although there is only an abstract case suffix. Since the attribute
{\bf persprocase} does not have a set as possible value, this is the only 
solution.

In Rosetta, English uses the term {\em accusative\/} for what traditionally is
called {\em oblique case\/}. There is no deeper motivation behind this choice:
it is just easy.

\newpage
\subsection{Adjectival Possessive Pronouns (PossAdj)}
\begin{verbatim}
%LPossadj

m1: BPERSPRO{BPERSPROrec1}
m2: SFCAT{SFCATrec1}

m: POSSADJ{POSSADJrec1}[head/BPERSPRO{BPERSPROrec1}]

comp:

C1: SFCATrec1.key = SFKposs
A1: POSSADJrec1.mood := nowh

decomp:

C1: POSSADJrec1.mood = nowh
A1: SFCATrec1.key := SFKposs

&
\end{verbatim}
In Rosetta2, POSSADJs also had attributes {\bf number}, {\bf person} and 
{\bf gender}. However, they are not needed. In Rosetta3, there is a new
attribute {\bf mood} for POSSADJs instead, which has two values: {\em wh\/}
and {\em nowh\/}. This is
necessary to differentiate {\em my\/} etc.\ from {\em whose\/}, which is now 
no longer a 
Wh-POSSADJ, but a POSSADJ as well, with value {\em wh\/} for the attribute 
{\bf mood}.

\newpage
\subsection{Nominalised Possessive Pronouns (PossPro)}
\begin{verbatim}
%LPosspro

m1: BPERSPRO{BPERSPROrec1}
m2: SFCAT{SFCATrec1}

m: POSSPRO{POSSPROrec1}[head/BPERSPRO{BPERSPROrec1}]

comp:

C1: BPERSPROrec1.predpos = true and
    SFCATrec1.key = SFKpredposs  
A1: @

decomp:

C1: BPERSPROrec1.predpos = true
A1: SFCATrec1.key := SFKpredposs

&
\end{verbatim}
The attribute {\bf predpos} is used to prevent the PERSPRO {\em it\/} from 
going through this rule: there is no form $^{*}${\em its\/} similar to {\em
hers\/}, {\em mine\/} etc.

\newpage
\subsection{Wh-Pronouns (WhPro)}
\subsubsection{Base Form}
\begin{verbatim}
%LWhpro

m1: BWHPRO{BWHPROrec1}

m: WHPRO{WHPROrec1}[head/BWHPRO{BWHPROrec1}]

comp:

C1: true

  C2: BWHPROrec1.whcase = true
  A2: WHPROrec1 := copyT_bwhprotowhpro(BWHPROrec1);
      WHPROrec1.cases := [nominative, accusative]

  C3: BWHPROrec1.whcase = false
  A3: WHPROrec1 := copyT_bwhprotowhpro(BWHPROrec1)

A1: @

decomp:

C1: true

  C2: BWHPROrec1.whcase = true and 
      WHPROrec1.cases <> [accusative]
  A2: @

  C3: BWHPROrec1.whcase = false and 
      WHPROrec1.cases = []
  A3: @

A1: @

&
\end{verbatim}
This rule assigns nominative and accusative case to {\em who\/}. It does not
change the default case setting (which is []) of {\em what\/}. Note that 
accusative case for {\em who\/} is also assigned by the next rule. If the 
M-grammar assigns an unambiguous [accusative] to {\em who\/}, it will be 
realized as {\em whom\/} by the next rule. If the setting is [nominative,
accusative], the form will be realized as {\em who\/} by the current rule, 
and as {\em whom\/} by the next.

\newpage
\subsubsection{Accusative}
\begin{verbatim}
%LWhproAcc

m1: BWHPRO{BWHPROrec1}
m2: SFCAT{SFCATrec1}

m: WHPRO{WHPROrec1}[head/BWHPRO{BWHPROrec1}]

comp:

C1: SFCATrec1.key = SFKacc and 
    BWHPROrec1.whcase = true
A1: WHPROrec1 := copyT_bwhprotowhpro(BWHPROrec1);
    WHPROrec1.cases := [accusative]

decomp:

C1: accusative in WHPROrec1.cases and 
    BWHPROrec1.whcase = true
A1: SFCATrec1.key := SFKacc

&
\end{verbatim}
See the comment in the previous rule.

\newpage
\subsection{Adjectival Wh Possessive Pronoun (Wh-PossAdj)}
\begin{verbatim}
%LWhpossadj

m1: BWHPRO{BWHPROrec1}
m2: SFCAT{SFCATrec1}

m: POSSADJ{POSSADJrec1}[head/BWHPRO{BWHPROrec1}]

comp:

C1: SFCATrec1.key = SFKposs and 
    BWHPROrec1.poss = true
A1: POSSADJrec1. mood := wh

decomp:

C1: POSSADJrec1.mood = wh and 
    BWHPROrec1.poss = true
A1: SFCATrec1.key := SFKposs

&
\end{verbatim}
The only example is {\em whose\/}.

\newpage
\section{Determiners}
This is a whole new class, compared to the system described in document 115.
The reason why it was added is isomorphism with Dutch, where there is inflection
for determiners ({\em veel - vele - velen}). In this case, it was decided to 
change morphology rather than define a fictitious SUBDET level in the English
M-grammar, the way it was done for INDEFPROs. The BDET and DET  records are
fully identical.

\begin{verbatim}
%LDet

m1: BDET{BDETrec1}

m: DET{DETrec1}[head/BDET{BDETrec1}]

comp:

C1: true
A1: DETrec1 := COPYT_bdetTOdet(BDETrec1)

decomp:

C1: true
A1: @

&

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
           postmodrel/DIGIT(*){DIGITrec1}
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
%ORDINALrule1
m1:  CARD{CARDrec1}[mu1]
m2:  SFCAT{SFCATrec1}
m :  SUBADJ{SUBADJrec1}
           [modrel/CARD{CARDrec1}[mu1],
            head/BADJSUFF(ordBADJSUFFkey){BADJSUFFrec1}
           ]

comp:
         C1: SFCATrec1.key = SFKregord 
         A1: SUBADJrec1 := COPYT_BADJTOSUBADJ(BADJSUFFrec1);
             SUBADJrec1.affix := ordaffix

decomp:
         C1: SUBADJrec1.affix = ordaffix
         A1: SFCATrec1.key := SFKregord
&

\end{verbatim}
