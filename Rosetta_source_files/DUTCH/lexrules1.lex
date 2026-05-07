%DUTCH1
%&

\section{Rules for verbs.}

Note:
\begin{itemize}
 \item Irregular verbs have class 1 and 2 (and not --as they had in ROSETTA2-- 
       class 0).
 \item Class 0 has been used for verbs without conjugation: these verbs have 
       only {\em infinitive}-form (and forms derived of infinitives).
 \item Even class-numbers (without 0 and 14) correspond with verbs {\em without}
       "ge"-prefix in the past participle, odd class-numbers 
       correspond with verbs {\em with} "ge"-prefix.
 \item The function "copy...." copies the values of the --in the rule not 
       explicitely mentioned-- fields of the old record to those of the new one.
 \item Conjugationclass 14 has been used for verbs with extra form for the
       1st person singular.
\end{itemize}

\subsection{Rules for derivation.}
\subsubsection{Rule for particle as prefix.}

The M-grammar should not yield forms of the type PART-V $ + $ SUBJ 
({\em *afvraag ik me?}, etc.). 
In this rule this is not done (because the morphology only handles
single words). Therefore, in generation also the set [0,1] is yielded for the
attribute persons, although person$=$0 can never be combined with particles:
{\em *afvraag jij je?, *wegga jij?,} etc.

The test on `eORenForm' is necessary because the {\em order} of this rule and 
the rule `VerbeORenvorm' should be stated.

(examples: {\em afgevraagd(e(n)), afvragen(d(e(n))), afvraag, afvraagt, ...})

\begin{verbatim}
%ParticleToVerb

m1: PART{PARTrec1}
m2: VERB{VERBrec1} 
        [ head/ SUBVERB{SUBVERBrec1} 
              [ head/ BVERB{BVERBrec1}] 
        ]
m:  VERB{VERBrec2} 
        [ head/ SUBVERB{SUBVERBrec2} 
              [ partrel/ PART{PARTrec1},
                head/ SUBVERB{SUBVERBrec1} [head/ BVERB{BVERBrec1}] 
              ]
        ]

comp:
      C1: (PARTrec1.key = VERBrec1.particle)
          and (VERBrec1.status = bareV)
          and (VERBrec1.eORenForm = NoForm)
          
      A1: SUBVERBrec2     := SUBVERBrec1;
          SUBVERBrec2.lastaffix := partaffix;
          VERBrec2        := VERBrec1;
          VERBrec2.status := partV

decomp: 
      C1: (PARTrec1.key = VERBrec2.particle)
          and (VERBrec2.status = partV)
          and (SUBVERBrec2.lastaffix = partaffix)
          and (VERBrec2.eORenForm = NoForm)
      A1: VERBrec1 := VERBrec2;
          VERBrec1.status := bareV
&
\end{verbatim}
\newpage
\subsubsection{Rule for verbs without derivation.}
\begin{verbatim}
%VerbBtoSub

m1:   BVERB{BVERBrec1}
m:    SUBVERB{SUBVERBrec1} [head/ BVERB{BVERBrec1}]

comp:        
         C:  true
         A:  SUBVERBrec1 := COPYT_bverbtosubverb(BVERBrec1)

decomp:      
         C: true
         A:  @
&
\end{verbatim}
\newpage
\subsection{Inflection: weak and strong verbs}

Note: for irregular verbs see next {\em section}.

\subsubsection{Rule for present tense "0"th and 1st person singular.}

\begin{verbatim}
%VerbOttEnk1

m1:   SUBVERB{SUBVERBrec1}[mu1]
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:        
         C: [3,4,5,6,7,8,9,10,11,12,13,15,16] * SUBVERBrec1.conjclasses <> []
         A: VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
            VERBrec1.tense     := presenttense;
            VERBrec1.modus     := indicative;
            VERBrec1.number    := singular;
            VERBrec1.persons   := [1,0];
            VERBrec1.eORenForm := NoForm

decomp:      
         C: (VERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> [])
            and (VERBrec1.tense     = presenttense)                  
            and (VERBrec1.modus     = indicative)                    
            and (VERBrec1.number    = singular)                      
            and ([1,0] * VERBrec1.persons <> [])
            and (VERBrec1.eORenForm = NoForm) 
         A: @
&
\end{verbatim}
\newpage
\subsubsection{Rule for extra form 0th and 1st person sg. for class 14.}
This rule makes for instance ``snij'' out of the stem ``snijd'', and ``hou'' 
out of ``houd''.

It works for the following verbs: *glij, *rij, *snij, verblij, *hou 
(and maybe for: bevrij, kastij ?)

\begin{verbatim}
%VerbOttEnk1extra

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:        
         C: (SUBVERBrec1.conjclasses * [14] <> [])
            and (SFCATrec1.key = SFKdelD)
         A: VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
            VERBrec1.tense     := presenttense;
            VERBrec1.modus     := indicative;
            VERBrec1.number    := singular;
            VERBrec1.persons   := [0,1];
            VERBrec1.eORenForm := NoForm

decomp:      
          C: (VERBrec1.conjclasses * [14] <> []) 
            and (VERBrec1.tense     = presenttense)
            and (VERBrec1.modus     = indicative)
            and (VERBrec1.number    = singular)
            and ([0,1] * VERBrec1.persons <> [])
            and (VERBrec1.eORenForm = NoForm)
         A: SFCATrec1.key  := SFKdelD
&
\end{verbatim}
\newpage
\subsubsection{Rule for present tense 2nd, 3rd, 4th and 5th person singular.}
\begin{verbatim}
%VerbOttEnk2

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:        
         C: (SUBVERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> [])
            and (SFCATrec1.key = SFKt)
         A: VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
            VERBrec1.tense     := presenttense;
            VERBrec1.modus     := indicative;
            VERBrec1.number    := singular;
            VERBrec1.persons   := [2,3,4,5];
            VERBrec1.eORenForm := NoForm

decomp:      
          C: (VERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) 
            and (VERBrec1.tense     = presenttense)
            and (VERBrec1.modus     = indicative)
            and (VERBrec1.number    = singular)
            and ([2,3,4,5] * VERBrec1.persons <> [])
            and (VERBrec1.eORenForm = NoForm)
         A: SFCATrec1.key  := SFKt
&
\end{verbatim}
\newpage
\subsubsection{Rule for present tense plural.}
\begin{verbatim}
%VerbOttMv

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C1: (SUBVERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> [])
           C2: (SFCATrec1.key = SFKen)
           A2: VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
               VERBrec1.persons  := [1,2,3]
           C2: (SFCATrec1.key = SFKt)
           A2: VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
               VERBrec1.persons  := [4,5]
         A1: VERBrec1.tense     := presenttense;
             VERBrec1.modus     := indicative;
             VERBrec1.number    := plural;
             VERBrec1.eORenForm := NoForm

decomp:
         C1: (VERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> [])
             and (VERBrec1.tense     = presenttense) 
             and (VERBrec1.modus     = indicative)
             and (VERBrec1.number    = plural)
             and (VERBrec1.eORenForm = NoForm)
           C2: [1,2,3] * VERBrec1.persons <> []
           A2:  SFCATrec1.key   := SFKen
           C2: [4,5] * VERBrec1.persons <> []
           A2:  SFCATrec1.key   := SFKt
         A1: @
&
\end{verbatim}
\newpage
\subsubsection{Rule for past tense 1st, 2nd, 3rd and 4th person singular.}

Note: this rule also treats the 5th
         person singular for the classes 3, 4, 15, 16.

\begin{verbatim}
%VerbOvtEnk

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C1:  true
           C2:  (SUBVERBrec1.conjclasses * [3,4] <> []) 
                and (SFCATrec1.key = SFKdete)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [1,2,3,4,5]
           C2:  (SUBVERBrec1.conjclasses * [5,6] <> []) 
                and (SFCATrec1.key = SFKovt1)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [1,2,3,4]
           C2:  (SUBVERBrec1.conjclasses * [7,8] <> [])
                and (SFCATrec1.key = SFKovtvd1)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [1,2,3,4]
           C2:  (SUBVERBrec1.conjclasses * [9,10] <> [])
                and (SFCATrec1.key = SFKovtvd2)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [1,2,3,4]
           C2:  (SUBVERBrec1.conjclasses * [11,12] <> []) 
                and (SFCATrec1.key = SFKovt2)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [1,2,3,4]
           C2:  (13 in SUBVERBrec1.conjclasses) 
                and (SFCATrec1.key = SFKovt3)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [1,2,3,4]
           C2:  (SUBVERBrec1.conjclasses * [15,16] <> []) 
                and (SFCATrec1.key = SFKdete)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [1,2,3,4,5]
         A1: VERBrec1.tense     := pasttense;
             VERBrec1.modus     := indicative;
             VERBrec1.number    := singular;
             VERBrec1.eORenForm := NoForm

decomp:
         C1: (VERBrec1.tense         = pasttense) 
             and (VERBrec1.modus     = indicative) 
             and (VERBrec1.number    = singular)
             and (VERBrec1.eORenForm = NoForm)
           C2: ([1,2,3,4,5] * VERBrec1.persons <> [])
                and (VERBrec1.conjclasses * [3,4] <> [])
           A2:  SFCATrec1.key := SFKdete
           C2: ([1,2,3,4] * VERBrec1.persons <> [])
                and (VERBrec1.conjclasses * [5,6] <> [])
           A2:  SFCATrec1.key := SFKovt1
           C2: ([1,2,3,4] * VERBrec1.persons <> [])
                and (VERBrec1.conjclasses * [7,8] <> [])
           A2:  SFCATrec1.key := SFKovtvd1
           C2: ([1,2,3,4] * VERBrec1.persons <> [])
                and (VERBrec1.conjclasses * [9,10] <> [])
           A2:  SFCATrec1.key := SFKovtvd2
           C2: ([1,2,3,4] * VERBrec1.persons <> [])
                and (VERBrec1.conjclasses * [11,12] <> [])
           A2:  SFCATrec1.key := SFKovt2
           C2: ([1,2,3,4] * VERBrec1.persons <> [])
                and (13 in VERBrec1.conjclasses)
           A2:  SFCATrec1.key := SFKovt3
           C2: ([1,2,3,4,5] * VERBrec1.persons <> [])
                and (VERBrec1.conjclasses * [15,16] <> [])
           A2:  SFCATrec1.key := SFKdete
         A1: @
&
\end{verbatim}
\newpage
\subsubsection{Extra rule for past tense singular for the 5th person sg.}

Note: this rule treats the past tense 5th person singular for the 
classes 5, 6, 7, 8, 9, 10, 11, 12, 13.

\begin{verbatim}
%VerbOvtEnkPers5extra

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m3:   SFCAT{SFCATrec2}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C1: SFCATrec2.key = SFKt
           C2:  (SUBVERBrec1.conjclasses * [5,6] <> [])
                and (SFCATrec1.key = SFKovt1)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
           C2:  (SUBVERBrec1.conjclasses * [7,8] <> [])
                and (SFCATrec1.key = SFKovtvd1)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
           C2:  (SUBVERBrec1.conjclasses * [9,10] <> [])
                and (SFCATrec1.key = SFKovtvd2)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
           C2:  (SUBVERBrec1.conjclasses * [11,12] <> []) 
                and (SFCATrec1.key = SFKovt2)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
           C2:  (13 in SUBVERBrec1.conjclasses) 
                and (SFCATrec1.key = SFKovt3)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
         A1: VERBrec1.tense     := pasttense;
             VERBrec1.modus     := indicative;
             VERBrec1.number    := singular;
             VERBrec1.persons   := [5];
             VERBrec1.eORenForm := NoForm

decomp:
         C1: (VERBrec1.tense        = pasttense) 
             and (VERBrec1.modus    = indicative)
             and (VERBrec1.number   = singular)
             and (5 in VERBrec1.persons)
             and (VERBrec1.eORenForm = NoForm)
           C2:  VERBrec1.conjclasses * [5,6]   <> []
           A2:  SFCATrec1.key := SFKovt1
           C2:  VERBrec1.conjclasses * [7,8]   <> []
           A2:  SFCATrec1.key := SFKovtvd1
           C2:  VERBrec1.conjclasses * [9,10]  <> []
           A2:  SFCATrec1.key := SFKovtvd2
           C2:  VERBrec1.conjclasses * [11,12] <> []
           A2:  SFCATrec1.key := SFKovt2
           C2:  13 in VERBrec1.conjclasses
           A2:  SFCATrec1.key := SFKovt3
         A1: SFCATrec2.key := SFKt
&
\end{verbatim}
\newpage
\subsubsection{Rule for past tense plural.}

Note: Rule for past tense 1st, 2nd and 3rd person, as well as the 5th person 
      for the classes  5, 6, 7, 8, 9, 10, 11, 12, 13. 

\begin{verbatim}
%VerbOvtMv 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m3:   SFCAT{SFCATrec2}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C1: true
           C2:  SFCATrec2.key = SFKen
             C3:  (SUBVERBrec1.conjclasses * [3,4] <> []) 
                  and (SFCATrec1.key = SFKdete)
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
             C3:  (SUBVERBrec1.conjclasses * [5,6] <> []) 
                  and (SFCATrec1.key = SFKovt1)
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
             C3:  (SUBVERBrec1.conjclasses * [7,8] <> [])
                  and (SFCATrec1.key = SFKovtvd1)
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
             C3:  (SUBVERBrec1.conjclasses * [9,10] <> []) 
                  and (SFCATrec1.key = SFKovtvd2)
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
             C3:  (SUBVERBrec1.conjclasses * [11,12] <> [])
                  and (SFCATrec1.key = SFKovt2)
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
             C3:  (13 in SUBVERBrec1.conjclasses) 
                  and (SFCATrec1.key = SFKovt3)
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
             C3:  (SUBVERBrec1.conjclasses * [15,16] <> []) 
                  and (SFCATrec1.key = SFKdete)
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
           A2:  VERBrec1.persons  := [1,2,3]
           C2:  SFCATrec2.key = SFKt
             C3:  (SUBVERBrec1.conjclasses * [5,6] <> []) 
                  and (SFCATrec1.key = SFKovt1)
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
             C3:  (SUBVERBrec1.conjclasses * [7,8] <> []) 
                  and (SFCATrec1.key = SFKovtvd1)
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
             C3:  (SUBVERBrec1.conjclasses * [9,10] <> [])
                  and (SFCATrec1.key = SFKovtvd2)
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
             C3:  (SUBVERBrec1.conjclasses * [11,12] <> []) 
                  and (SFCATrec1.key = SFKovt2)
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
             C3:  (13 in SUBVERBrec1.conjclasses) 
                  and (SFCATrec1.key = SFKovt3)
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1)
           A2:  VERBrec1.persons  := [5]
         A1: VERBrec1.tense     := pasttense;
             VERBrec1.modus     := indicative;
             VERBrec1.number    := plural;
             VERBrec1.eORenForm := NoForm

decomp:
         C1: (VERBrec1.tense         = pasttense) 
             and (VERBrec1.modus     = indicative) 
             and (VERBrec1.number    = plural)     
             and (VERBrec1.eORenForm = NoForm)
           C2: [1,2,3] * VERBrec1.persons <> []
             C3:  VERBrec1.conjclasses * [3,4] <> []
             A3:  SFCATrec1.key := SFKdete
             C3:  VERBrec1.conjclasses * [5,6] <> []
             A3:  SFCATrec1.key := SFKovt1
             C3:  VERBrec1.conjclasses * [7,8] <> []
             A3:  SFCATrec1.key := SFKovtvd1
             C3:  VERBrec1.conjclasses * [9,10] <> []
             A3:  SFCATrec1.key := SFKovtvd2
             C3:  VERBrec1.conjclasses * [11,12] <> []
             A3:  SFCATrec1.key := SFKovt2
             C3:  13 in VERBrec1.conjclasses
             A3:  SFCATrec1.key := SFKovt3
             C3:  VERBrec1.conjclasses * [15,16] <> []
             A3:  SFCATrec1.key := SFKdete
           A2: SFCATrec2.key := SFKen
           C2:  5 in VERBrec1.persons 
             C3:  VERBrec1.conjclasses * [5,6] <> []
             A3:  SFCATrec1.key := SFKovt1
             C3:  VERBrec1.conjclasses * [7,8] <> []
             A3:  SFCATrec1.key := SFKovtvd1
             C3:  VERBrec1.conjclasses * [9,10] <> []
             A3:  SFCATrec1.key := SFKovtvd2
             C3:  VERBrec1.conjclasses * [11,12] <> []
             A3:  SFCATrec1.key := SFKovt2
             C3:  13 in VERBrec1.conjclasses
             A3:  SFCATrec1.key := SFKovt3
           A2:  SFCATrec2.key := SFKt
         A1:  @
&
\end{verbatim}
\newpage
\subsubsection{Extra rule for past tense plural.}

Note: This rule treats the past form for 4th person plural, as well as the
5th person for the classes  3, 4, 15, 16. 

\begin{verbatim}
%VerbOvtMvPers4en5extra

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C1:  true
           C2:  (SUBVERBrec1.conjclasses * [3,4] <> [])
                and (SFCATrec1.key = SFKdete)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [4,5]
           C2:  (SUBVERBrec1.conjclasses * [5,6] <> [])
                and (SFCATrec1.key = SFKovt1)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [4]
           C2:  (SUBVERBrec1.conjclasses * [7,8] <> [])
                and (SFCATrec1.key = SFKovtvd1)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [4]
           C2:  (SUBVERBrec1.conjclasses * [9,10] <> [])
                and (SFCATrec1.key = SFKovtvd2)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [4]
           C2:  (SUBVERBrec1.conjclasses * [11,12] <> [])
                and (SFCATrec1.key = SFKovt2)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [4]
           C2:  (13 in SUBVERBrec1.conjclasses) 
                and (SFCATrec1.key = SFKovt3)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [4]
           C2:  (SUBVERBrec1.conjclasses * [15,16] <> []) 
                and (SFCATrec1.key = SFKdete)
           A2:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.persons  := [4,5]
         A1: VERBrec1.tense     := pasttense;
             VERBrec1.modus     := indicative;
             VERBrec1.number    := plural;
             VERBrec1.eORenForm := NoForm

decomp:
         C1: (VERBrec1.tense         = pasttense) 
             and (VERBrec1.modus     = indicative) 
             and (VERBrec1.number    = plural) 
             and (VERBrec1.eORenForm = NoForm)
           C2: ([4,5] * VERBrec1.persons <> [])
                and (VERBrec1.conjclasses * [3,4] <> [])
           A2:  SFCATrec1.key := SFKdete
           C2: (4 in VERBrec1.persons)
                and (VERBrec1.conjclasses * [5,6] <> [])
           A2:  SFCATrec1.key := SFKovt1
           C2: (4 in VERBrec1.persons)
                and (VERBrec1.conjclasses * [7,8] <> [])
           A2:  SFCATrec1.key := SFKovtvd1
           C2: (4 in VERBrec1.persons)
                and (VERBrec1.conjclasses * [9,10] <> [])
           A2:  SFCATrec1.key := SFKovtvd2
           C2: (4 in VERBrec1.persons)
                and (VERBrec1.conjclasses * [11,12] <> [])
           A2:  SFCATrec1.key := SFKovt2
           C2: (4 in VERBrec1.persons)
                and (13 in VERBrec1.conjclasses)
           A2:  SFCATrec1.key := SFKovt3
           C2: ([4,5] * VERBrec1.persons <> [])
                and (VERBrec1.conjclasses * [15,16] <> [])
           A2:  SFCATrec1.key := SFKdete
         A1:  @
&
\end{verbatim}
\newpage
\subsubsection{Rule for past participle (with "ge") for the classes  3, 5, 9.}

Note: In this rule, the past participle is formed by one prefix and one
suffix; the suffix handles ablaut or inflectional ending.

\begin{verbatim}
%VerbVd1 

m1:   PFCAT{PFCATrec1}
m2:   SUBVERB{SUBVERBrec1}[mu1]
m3:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C1: PFCATrec1.key = PFKge 
           C2: (3 in SUBVERBrec1.conjclasses) 
               and (SFCATrec1.key = SFKdt) 
           A2: VERBrec1  := COPYT_subverbtoverb(SUBVERBrec1)
           C2: (5 in SUBVERBrec1.conjclasses)
               and (SFCATrec1.key = SFKen) 
           A2: VERBrec1  := COPYT_subverbtoverb(SUBVERBrec1)
           C2: (9 in SUBVERBrec1.conjclasses)
               and (SFCATrec1.key = SFKovtvd2) 
           A2: VERBrec1  := COPYT_subverbtoverb(SUBVERBrec1)
         A1: VERBrec1.tense     := omegatense;
             VERBrec1.modus     := pastpart;
             VERBrec1.number    := omeganumber;
             VERBrec1.persons   := [];
             VERBrec1.eORenForm := NoForm

decomp:
         C1: (VERBrec1.tense         = omegatense) 
             and (VERBrec1.modus     = pastpart)
             and (VERBrec1.eORenForm = NoForm) 
             and (VERBrec1.persons   = [])
             and (VERBrec1.number    = omeganumber)
           C2:  3 in VERBrec1.conjclasses
           A2:  SFCATrec1.key := SFKdt
           C2:  5 in VERBrec1.conjclasses
           A2:  SFCATrec1.key := SFKen
           C2:  9 in VERBrec1.conjclasses 
           A2:  SFCATrec1.key := SFKovtvd2
         A1: PFCATrec1.key := PFKge
&
\end{verbatim}
\newpage
\subsubsection{Rule for past participle (with "ge") for the classes 7, 11, 15.}

Note: In this rule, the past participle is formed by one prefix and two
suffixes; one suffixe handles ablaut, the other "-en"-ending.

\begin{verbatim}
%VerbVd2 

m1:   PFCAT{PFCATrec1}
m2:   SUBVERB{SUBVERBrec1}[mu1]
m3:   SFCAT{SFCATrec1}
m4:   SFCAT{SFCATrec2}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C1: (PFCATrec1.key = PFKge) 
             and (SFCATrec2.key = SFKen)
           C2: (7 in SUBVERBrec1.conjclasses)
               and (SFCATrec1.key = SFKovtvd1) 
           A2: VERBrec1  := COPYT_subverbtoverb(SUBVERBrec1)
           C2: (11 in SUBVERBrec1.conjclasses)
               and (SFCATrec1.key = SFKvd1) 
           A2: VERBrec1  := COPYT_subverbtoverb(SUBVERBrec1)
           C2: (15 in SUBVERBrec1.conjclasses) 
               and (SFCATrec1.key = SFKvd2) 
           A2: VERBrec1  := COPYT_subverbtoverb(SUBVERBrec1)
         A1: VERBrec1.tense     := omegatense;
             VERBrec1.modus     := pastpart;
             VERBrec1.number    := omeganumber;
             VERBrec1.persons   := [];
             VERBrec1.eORenForm := NoForm

decomp:
         C1: (VERBrec1.tense         = omegatense) 
             and (VERBrec1.modus     = pastpart)
             and (VERBrec1.eORenForm = NoForm) 
             and (VERBrec1.persons   = [])
             and (VERBrec1.number    = omeganumber)
           C2: 7 in VERBrec1.conjclasses
           A2: SFCATrec1.key := SFKovtvd1 
           C2: 11 in VERBrec1.conjclasses 
           A2: SFCATrec1.key := SFKvd1
           C2: 15 in VERBrec1.conjclasses 
           A2: SFCATrec1.key := SFKvd2 
         A1: PFCATrec1.key   := PFKge;
             SFCATrec2.key   := SFKen
&
\end{verbatim}
\newpage
\subsubsection{Rule for past participle (without "ge") for the classes  4, 6, 10.}

Note: In this rule, the past participle is formed by one suffix only; the 
suffix handles ablaut or inflectional ending.

\begin{verbatim}
%VerbVd3 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C1: true
           C2: (4 in SUBVERBrec1.conjclasses)
               and (SFCATrec1.key = SFKdt) 
           A2: VERBrec1  := COPYT_subverbtoverb(SUBVERBrec1)
           C2: (6 in SUBVERBrec1.conjclasses)
               and (SFCATrec1.key = SFKen) 
           A2: VERBrec1  := COPYT_subverbtoverb(SUBVERBrec1)
           C2: (10 in SUBVERBrec1.conjclasses)
               and (SFCATrec1.key = SFKovtvd2) 
           A2: VERBrec1  := COPYT_subverbtoverb(SUBVERBrec1)
         A1: VERBrec1.tense     := omegatense;
             VERBrec1.modus     := pastpart;
             VERBrec1.number    := omeganumber;
             VERBrec1.persons   := [];
             VERBrec1.eORenForm := NoForm

decomp:
         C1: (VERBrec1.tense         = omegatense) 
             and (VERBrec1.modus     = pastpart)
             and (VERBrec1.number    = omeganumber)
             and (VERBrec1.persons   = []) 
             and (VERBrec1.eORenForm = NoForm) 
           C2:  4 in VERBrec1.conjclasses 
           A2:  SFCATrec1.key := SFKdt
           C2:  6 in VERBrec1.conjclasses
           A2:  SFCATrec1.key := SFKen
           C2:  10 in VERBrec1.conjclasses
           A2:  SFCATrec1.key := SFKovtvd2
         A1: @
&
\end{verbatim}
\newpage
\subsubsection{Rule for past participle (without "ge") for the classes  8, 12, 16.}

Note: In this rule, the past participle is formed by two suffixes; one suffix
handles ablaut, the other the "-en"-ending.

\begin{verbatim}
%VerbVd4 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m3:   SFCAT{SFCATrec2}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C1: SFCATrec2.key = SFKen
           C2: (8 in SUBVERBrec1.conjclasses)
               and (SFCATrec1.key = SFKovtvd1) 
           A2: VERBrec1  := COPYT_subverbtoverb(SUBVERBrec1)
           C2: (12 in SUBVERBrec1.conjclasses) 
               and (SFCATrec1.key = SFKvd1) 
           A2: VERBrec1  := COPYT_subverbtoverb(SUBVERBrec1)
           C2: (16 in SUBVERBrec1.conjclasses) 
               and (SFCATrec1.key = SFKvd2) 
           A2: VERBrec1  := COPYT_subverbtoverb(SUBVERBrec1)
         A1: VERBrec1.tense     := omegatense;
             VERBrec1.modus     := pastpart;
             VERBrec1.number    := omeganumber;
             VERBrec1.persons   := [];
             VERBrec1.eORenForm := NoForm

decomp:
         C1: (VERBrec1.tense         = omegatense) 
             and (VERBrec1.modus     = pastpart)
             and (VERBrec1.number    = omeganumber)
             and (VERBrec1.persons   = []) 
             and (VERBrec1.eORenForm = NoForm)
           C2: 8 in VERBrec1.conjclasses 
           A2: SFCATrec1.key := SFKovtvd1 
           C2: 12 in VERBrec1.conjclasses 
           A2: SFCATrec1.key := SFKvd1
           C2: 16 in VERBrec1.conjclasses 
           A2: SFCATrec1.key := SFKvd2 
         A1: SFCATrec2.key := SFKen
&
\end{verbatim}
\newpage
\subsubsection{Rule for the infinitive.}

Note: verbs of class 0 do have an infinitive-form.

\begin{verbatim}
%VerbInf 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C: (SUBVERBrec1.conjclasses * [0,3,4,5,6,7,8,9,10,11,12,13,15,16]<>[])                          	     
             and (SFCATrec1.key = SFKen)
         A:  VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
             VERBrec1.tense     := omegatense;
             VERBrec1.modus     := infinitive;
             VERBrec1.number    := omeganumber;
             VERBrec1.persons   := [];
             VERBrec1.eORenForm := NoForm

decomp:
         C:  (VERBrec1.conjclasses * [0,3,4,5,6,7,8,9,10,11,12,13,15,16] <> [])
             and (VERBrec1.tense     = omegatense) 
             and (VERBrec1.modus     = infinitive)
             and (VERBrec1.number    = omeganumber)
             and (VERBrec1.persons   = []) 
             and (VERBrec1.eORenForm = NoForm) 
         A:  SFCATrec1.key     := SFKen
&
\end{verbatim}
\newpage
\subsubsection{Rule for present participle.}

Note: verbs of class 0 do have a present participle.

\begin{verbatim}
%VerbTd 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m3:   SFCAT{SFCATrec2}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C:  (SUBVERBrec1.conjclasses * [0,3,4,5,6,7,8,9,10,11,12,13,15,16]<>[]) 
             and (SFCATrec1.key = SFKen) 
             and (SFCATrec2.key = SFKdt)
         A:  VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
             VERBrec1.tense     := omegatense;
             VERBrec1.modus     := prespart;
             VERBrec1.number    := omeganumber;
             VERBrec1.persons   := [];
             VERBrec1.eORenForm := NoForm

decomp:
         C:  (VERBrec1.conjclasses * [0,3,4,5,6,7,8,9,10,11,12,13,15,16] <> [])
             and (VERBrec1.tense     = omegatense) 
             and (VERBrec1.modus     = prespart)
             and (VERBrec1.number    = omeganumber)
             and (VERBrec1.persons   = []) 
             and (VERBrec1.eORenForm = NoForm)
         A:  SFCATrec1.key     := SFKen;
             SFCATrec2.key     := SFKdt
&
\end{verbatim}
\newpage
\subsubsection{Rule for imperative singular.}
\begin{verbatim}
%VerbGbEnk 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C:  SUBVERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []
         A:  VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
             VERBrec1.tense     := omegatense;
             VERBrec1.modus     := imperative;
             VERBrec1.number    := singular;
             VERBrec1.persons   := [];
             VERBrec1.eORenForm := NoForm

decomp:
         C:  (VERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> [])
             and (VERBrec1.tense     = omegatense) 
             and (VERBrec1.modus     = imperative)
             and (VERBrec1.number    = singular) 
             and (VERBrec1.persons   = [])
             and (VERBrec1.eORenForm = NoForm)
         A:  @
&
\end{verbatim}
\newpage
\subsubsection{Rule for extra form imperative singular for class 14.}
This rule makes for instance ``snij'' out of the stem ``snijd'', and ``hou'' 
out of ``houd''.

It works for the following verbs: *glij, *rij, *snij, verblij, *hou 
(and maybe for: bevrij, kastij ?)

\begin{verbatim}
%VerbGbEnkExtra

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:        
         C: (SUBVERBrec1.conjclasses * [14] <> [])
            and (SFCATrec1.key = SFKdelD)
         A: VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
            VERBrec1.tense     := omegatense;
            VERBrec1.modus     := imperative;
            VERBrec1.number    := singular;
            VERBrec1.persons   := [];
            VERBrec1.eORenForm := NoForm

decomp:      
         C: (VERBrec1.conjclasses * [14] <> []) 
            and (VERBrec1.tense     = omegatense) 
            and (VERBrec1.modus     = imperative)
            and (VERBrec1.number    = singular) 
            and (VERBrec1.persons   = [])
            and (VERBrec1.eORenForm = NoForm)
         A: SFCATrec1.key  := SFKdelD
&
\end{verbatim}
\newpage
\subsubsection{Rule for imperative plural.}
\begin{verbatim}
%VerbGbMv 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C: (SUBVERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> [])
            and (SFCATrec1.key = SFKt)
         A: VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
            VERBrec1.tense     := omegatense;
            VERBrec1.modus     := imperative;
            VERBrec1.number    := plural;
            VERBrec1.persons   := [];
            VERBrec1.eORenForm := NoForm

decomp:
         C: (VERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) 
            and (VERBrec1.tense     = omegatense) 
            and (VERBrec1.modus     = imperative)
            and (VERBrec1.number    = plural) 
            and (VERBrec1.persons   = [])
            and (VERBrec1.eORenForm = NoForm) 
         A: SFCATrec1.key     := SFKt
&
\end{verbatim}
\newpage
\subsubsection{Rule for conjunctive.}

Note: all weak and strong verbs have present conjunctive forms only.

\begin{verbatim}
%VerbConjunctiefOtt

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C: (SUBVERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> [])
            and (SFCATrec1.key = SFKe)
         A: VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
            VERBrec1.tense     := presenttense;
            VERBrec1.modus     := subjunctive;
            VERBrec1.number    := omeganumber;
            VERBrec1.persons   := [];
            VERBrec1.eORenForm := NoForm

decomp:
         C: (VERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> [])
            and (VERBrec1.tense     = presenttense) 
            and (VERBrec1.modus     = subjunctive)
            and (VERBrec1.number    = omeganumber)
            and (VERBrec1.persons   = [])
            and (VERBrec1.eORenForm = NoForm)
         A: SFCATrec1.key   := SFKe
&
\end{verbatim}
\newpage
\subsection{Irregular verbs.}
\subsubsection{Extra rule for the "0"th and 1st person singular present tense.}
\begin{verbatim}
%VerbZorOttExtra 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C:  SUBVERBrec1.conjclasses * [1,2] <> []
         A:  VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
             VERBrec1.tense     := presenttense;
             VERBrec1.modus     := indicative;
             VERBrec1.number    := singular;
             VERBrec1.persons   := [1,0];
             VERBrec1.eORenForm := NoForm

decomp:
         C:  (VERBrec1.conjclasses * [1,2] <> [])
             and (VERBrec1.tense     = presenttense)
             and (VERBrec1.modus     = indicative)
             and (VERBrec1.number    = singular)
             and ([0,1] * VERBrec1.persons <> [])
             and (VERBrec1.eORenForm = NoForm)
         A:  @
&
\end{verbatim}
\newpage
\subsubsection{Rule for present tense.}

SFKIrrottenk0 is needed for the (extra) forms "zul je" and "kun je".

\begin{verbatim}
%VerbZorOtt 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C1:  SUBVERBrec1.conjclasses * [1,2] <> []
           C2:  true
             C3:  SFCATrec1.key = SFKIrrottenk0
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [0]
             C3:  SFCATrec1.key = SFKIrrottenk2
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [2]
             C3:  SFCATrec1.key = SFKIrrottenk3
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [3]
             C3:  SFCATrec1.key = SFKIrrott4              
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [4]
             C3:  SFCATrec1.key = SFKIrrott5
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [5]
           A2:  VERBrec1.number := singular
           C2:  true
             C3:  SFCATrec1.key = SFKIrrott4
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [4]
             C3:  SFCATrec1.key = SFKIrrott5
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [5]
             C3:  SFCATrec1.key = SFKIrrottmv
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [1,2,3]
           A2:  VERBrec1.number   := plural
         A1: VERBrec1.tense     := presenttense;
             VERBrec1.modus     := indicative;
             VERBrec1.eORenForm := NoForm

decomp:
         C1:  (VERBrec1.conjclasses * [1,2] <> []) 
              and (VERBrec1.tense     = presenttense)
              and (VERBrec1.modus     = indicative) 
              and (VERBrec1.eORenForm = NoForm)
           C2:  VERBrec1.number = singular
             C3:  0 in VERBrec1.persons 
             A3:  SFCATrec1.key := SFKIrrottenk0
             C3:  2 in VERBrec1.persons 
             A3:  SFCATrec1.key := SFKIrrottenk2
             C3:  3 in VERBrec1.persons 
             A3:  SFCATrec1.key := SFKIrrottenk3
             C3:  4 in VERBrec1.persons 
             A3:  SFCATrec1.key := SFKIrrott4
             C3:  5 in VERBrec1.persons 
             A3:  SFCATrec1.key := SFKIrrott5
           A2:  @
           C2:  VERBrec1.number = plural
             C3: [1,2,3] * VERBrec1.persons <> []
             A3:  SFCATrec1.key := SFKIrrottmv
             C3:  4 in VERBrec1.persons 
             A3:  SFCATrec1.key := SFKIrrott4
             C3:  5 in VERBrec1.persons 
             A3:  SFCATrec1.key := SFKIrrott5
           A2:  @
         A1:  @
&
\end{verbatim}
\newpage
\subsubsection{Rule for past tense.}
\begin{verbatim}
%VerbZorOvt

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C1:  SUBVERBrec1.conjclasses * [1,2] <> []
           C2:  true
             C3:  SFCATrec1.key = SFKIrrovtenk
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [1,2,3,4]
             C3:  SFCATrec1.key = SFKIrrovt5
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [5]
           A2:  VERBrec1.number   := singular
           C2:  true
             C3:  SFCATrec1.key = SFKIrrovtmv
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [1,2,3]
             C3:  SFCATrec1.key = SFKIrrovtenk
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [4]
             C3:  SFCATrec1.key = SFKIrrovt5
             A3:  VERBrec1          := COPYT_subverbtoverb(SUBVERBrec1);
                  VERBrec1.persons  := [5]
           A2:  VERBrec1.number   := plural
         A1: VERBrec1.tense     := pasttense;
             VERBrec1.modus     := indicative;
             VERBrec1.eORenForm := NoForm

decomp:
         C1:  (VERBrec1.conjclasses * [1,2] <> [])
              and (VERBrec1.tense     = pasttense) 
              and (VERBrec1.modus     = indicative)
              and (VERBrec1.eORenForm = NoForm)
           C2:  VERBrec1.number = singular
             C3:  [1,2,3,4] * VERBrec1.persons <> []
             A3:  SFCATrec1.key  := SFKIrrovtenk
             C3:  5 in VERBrec1.persons 
             A3:  SFCATrec1.key  := SFKIrrovt5
           A2:  @
           C2:  VERBrec1.number = plural
             C3:  [1,2,3] * VERBrec1.persons <> []
             A3:  SFCATrec1.key  := SFKIrrovtmv
             C3:  4 in VERBrec1.persons 
             A3:  SFCATrec1.key  := SFKIrrovtenk
             C3:  5 in VERBrec1.persons 
             A3:  SFCATrec1.key  := SFKIrrovt5
           A2:  @
         A1:  @
&
\end{verbatim}
\newpage
\subsubsection{Rule for past participles with "ge"-prefix.}
\begin{verbatim}
%VerbZorVd1 

m1:   PFCAT{PFCATrec1}
m2:   SUBVERB{SUBVERBrec1}[mu1]
m3:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C:  (SUBVERBrec1.conjclasses * [1] <> [])
             and (PFCATrec1.key = PFKge) 
             and (SFCATrec1.key = SFKIrrvd)
         A:  VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
             VERBrec1.tense     := omegatense;
             VERBrec1.modus     := pastpart;
             VERBrec1.number    := omeganumber;
             VERBrec1.persons   := [];
             VERBrec1.eORenForm := NoForm

decomp:
         C:  (VERBrec1.conjclasses * [1] <> [])
             and (VERBrec1.tense     = omegatense) 
             and (VERBrec1.modus     = pastpart)
             and (VERBrec1.number    = omeganumber)
             and (VERBrec1.persons   = [])
             and (VERBrec1.eORenForm = NoForm)
         A:  PFCATrec1.key     := PFKge;
             SFCATrec1.key     := SFKIrrvd
&
\end{verbatim}
\newpage
\subsubsection{Rule for past participles without "ge"-prefix.}
\begin{verbatim}
%VerbZorVd2 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C:  (SUBVERBrec1.conjclasses * [2] <> [])
             and (SFCATrec1.key = SFKIrrvd)
         A:  VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
             VERBrec1.tense     := omegatense;
             VERBrec1.modus     := pastpart;
             VERBrec1.number    := omeganumber;
             VERBrec1.persons   := [];
             VERBrec1.eORenForm := NoForm

decomp:
         C:  (VERBrec1.conjclasses * [2] <> [])
             and (VERBrec1.tense     = omegatense) 
             and (VERBrec1.modus     = pastpart)
             and (VERBrec1.number    = omeganumber)
             and (VERBrec1.persons   = [])
             and (VERBrec1.eORenForm = NoForm)
         A:  SFCATrec1.key     := SFKIrrvd
&
\end{verbatim}
\newpage
\subsubsection{Rule for infinitive.}
\begin{verbatim}
%VerbZorInf 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C:  (SUBVERBrec1.conjclasses * [1,2] <> [])
             and (SFCATrec1.key = SFKIrrottmv)
         A:  VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
             VERBrec1.tense     := omegatense;
             VERBrec1.modus     := infinitive;
             VERBrec1.number    := omeganumber;
             VERBrec1.persons   := [];
             VERBrec1.eORenForm := NoForm

decomp:
         C:  (VERBrec1.conjclasses * [1,2] <> [])
             and (VERBrec1.tense     = omegatense) 
             and (VERBrec1.modus     = infinitive)
             and (VERBrec1.number    = omeganumber)
             and (VERBrec1.persons   = [])
             and (VERBrec1.eORenForm = NoForm)
         A:  SFCATrec1.key     := SFKIrrottmv
&
\end{verbatim}
\newpage
\subsubsection{Rule for present participle.}
\begin{verbatim}
%VerbZorTd

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m3:   SFCAT{SFCATrec2}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C:   (SUBVERBrec1.conjclasses * [1,2] <> []) 
              and (SFCATrec1.key = SFKIrrottmv)
              and (SFCATrec2.key = SFKdt)
         A:   VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
              VERBrec1.tense     := omegatense;
              VERBrec1.modus     := prespart;
              VERBrec1.number    := omeganumber;
              VERBrec1.persons   := [];
              VERBrec1.eORenForm := NoForm

decomp:
         C:   (VERBrec1.conjclasses * [1,2] <> [])
              and (VERBrec1.tense     = omegatense) 
              and (VERBrec1.modus     = prespart)
              and (VERBrec1.number    = omeganumber)
              and (VERBrec1.persons   = [])
              and (VERBrec1.eORenForm = NoForm)
         A:   SFCATrec1.key := SFKIrrottmv;
              SFCATrec2.key := SFKdt
&
\end{verbatim}
\newpage
\subsubsection{Rule for imperative singular.}
\begin{verbatim}
%VerbZorGbEnk 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C:  (SUBVERBrec1.conjclasses * [1,2] <> [])
             and (SFCATrec1.key = SFKIrrgb)
         A:  VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
             VERBrec1.tense     := omegatense;
             VERBrec1.modus     := imperative;
             VERBrec1.number    := singular;
             VERBrec1.persons   := [];
             VERBrec1.eORenForm := NoForm

decomp:
         C:  (VERBrec1.conjclasses * [1,2] <> []) 
             and (VERBrec1.tense     = omegatense) 
             and (VERBrec1.modus     = imperative) 
             and (VERBrec1.number    = singular) 
             and (VERBrec1.persons   = [])
             and (VERBrec1.eORenForm = NoForm)
         A:  SFCATrec1.key    := SFKIrrgb
&
\end{verbatim}
\newpage
\subsubsection{Rule for imperative plural.}
\begin{verbatim}
%VerbZorGbMv 

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m3:   SFCAT{SFCATrec2}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C:  (SUBVERBrec1.conjclasses * [1,2] <> [])
             and (SFCATrec1.key = SFKIrrgb)
             and (SFCATrec2.key = SFKt)
         A:  VERBrec1           := COPYT_subverbtoverb(SUBVERBrec1);
             VERBrec1.tense     := omegatense;
             VERBrec1.modus     := imperative;
             VERBrec1.number    := plural;
             VERBrec1.persons   := [];
             VERBrec1.eORenForm := NoForm

decomp:
         C:  (VERBrec1.conjclasses * [1,2] <> [])
             and (VERBrec1.tense     = omegatense) 
             and (VERBrec1.modus     = imperative)
             and (VERBrec1.number    = plural)
             and (VERBrec1.persons   = [])
             and (VERBrec1.eORenForm = NoForm)
         A:  SFCATrec1.key     := SFKIrrgb;
             SFCATrec2.key     := SFKt
&
\end{verbatim}
\newpage
\subsubsection{Rule for conjunctive.}

Note: only the verb "zijn" has a past conjunctive form: "ware". 

\begin{verbatim}
%VerbZorConjunctief

m1:   SUBVERB{SUBVERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1} [head/ SUBVERB{SUBVERBrec1}[mu1]]

comp:
         C1:  SUBVERBrec1.conjclasses * [1,2] <> []
           C2:  SFCATrec1.key = SFKIrrconjott
           A2:  VERBrec1         := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.tense   := presenttense
           C2:  SFCATrec1.key = SFKIrrconjovt
           A2:  VERBrec1         := COPYT_subverbtoverb(SUBVERBrec1);
                VERBrec1.tense   := pasttense
         A1:  VERBrec1.modus     := subjunctive;
              VERBrec1.number    := omeganumber;
              VERBrec1.persons   := [];
              VERBrec1.eORenForm := NoForm

decomp:
         C1:  (VERBrec1.conjclasses * [1,2] <> [])
              and (VERBrec1.modus     = subjunctive)
              and (VERBrec1.number    = omeganumber)
              and (VERBrec1.persons   = [])
              and (VERBrec1.eORenForm = NoForm) 
           C2:  VERBrec1.tense = presenttense 
           A2:  SFCATrec1.key := SFKIrrconjott
           C2:  VERBrec1.tense = pasttense
           A2:  SFCATrec1.key := SFKIrrconjovt
         A1:  @
&
\end{verbatim}
\newpage
\subsection{Rule for the "e(n)"-form of past and present participle.}

Note: this is the only rule that makes a VERB out of another VERB; the only
attribute that changes is "eORenForm".
Because this rule is of the type ``CAT''-to-``CAT''-type and because it should 
never be applied more than once, some measures have
been taken to prevent looping or unnecessarily trying to apply the rule again:
in the ``comp''-part, there is an explicit test on the input: 
``SFCATrec1.eORenForm = NoForm'' (see: C1); in the ``decomp''-part, there is an 
explicit assignment when the rule succeeds: ``VERBrec1.eORenForm := NoForm''
(see: A1).

\begin{verbatim}
%VerbeORenvorm

m1:   VERB{VERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m:    VERB{VERBrec1}[mu1]

comp:
         C1:  ((VERBrec1.modus = pastpart) or (VERBrec1.modus = prespart)) 
              and (VERBrec1.eORenForm = NoForm)
           C2:  SFCATrec1.key = SFKe
           A2:  VERBrec1.eORenForm  := eForm
           C2:  SFCATrec1.key = SFKen
           A2:  VERBrec1.eORenForm  := enForm
         A1:  @

decomp:
         C1:  (VERBrec1.modus = pastpart) or (VERBrec1.modus = prespart)
           C2:  VERBrec1.eORenForm = eForm
           A2:  SFCATrec1.key := SFKe
           C2:  VERBrec1.eORenForm = enForm
           A2:  SFCATrec1.key := SFKen
         A1:  VERBrec1.eORenForm := NoForm
&
\end{verbatim}

\newpage
\section{Compounding.}

\subsection{Rules for compounding that result in SUBNOUN.}
Note: The rules for compounding are added for robustness; there are
      not sophisticated and limited in generation capacity (in analyses,
      the rules accept quite a few forms). Example: words like:
      {\em kasteletocht, kasteelstocht, kasteel-tocht and kasteeltocht}
      all will be accepted, whereas only {\em kasteel-tocht} will be generated.
      This is done because the forms with "-" are never wrong (although they
      will often be a bit unnatural) and it gives the user an impression of
      how the system interpreted the compound.
      
\subsubsection{Rule for compounds of the type NOUN - NOUN.}

\begin{verbatim}
%NOUNcomp1

m1:   NOUN{NOUNrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m3:   SUBNOUN{SUBNOUNrec1}[mu2]
m:    SUBNOUN{SUBNOUNrec2}
             [modrel/NOUN{NOUNrec1}[mu1],
              head/SUBNOUN{SUBNOUNrec1}[mu2]
             ]


comp:
         C1:  (SUBNOUNrec1.lastaffix = noaffix) and (NOUNrec1.geni=false)
           C2:  SFCATrec1.key = SFKleegCompound
           A2:  SUBNOUNrec2 := SUBNOUNrec1
           C2:  SFCATrec1.key = SFKstreepCompound
           A2:  SUBNOUNrec2 := SUBNOUNrec1
           C2:  SFCATrec1.key = SFKsCompound
           A2:  SUBNOUNrec2 := SUBNOUNrec1
           C2:  SFCATrec1.key = SFKeCompound
           A2:  SUBNOUNrec2 := SUBNOUNrec1
        A1:  @

decomp:
         C1: (SUBNOUNrec1.lastaffix = noaffix) and (NOUNrec1.geni=false) 
         A1:  SFCATrec1.key := SFKstreepCompound   {! see note above}
&
\end{verbatim}
\newpage
\subsubsection{Rule for compounds of the type VERB - NOUN.}

Note: In the combination verb-noun the verb has to be of the form
      first person singular present tense: {\em gloeilamp, glijbaan,
      rijweg} (not the stem: {\em glijdbaan} is not correct!); an
      exception like {\em staanplaatsen} has to be in the dictionary.
      It is not possible to bind the verb and noun with a "s" or "e"
      (exceptions like: {\em zegsman, scheidsrechter, verjaarspartij}
       have to be in the dictionary!).

\begin{verbatim}
%VerbNOUNcomp

m1:   VERB{VERBrec1}[mu1]
m2:   SFCAT{SFCATrec1}
m3:   SUBNOUN{SUBNOUNrec1}[mu2]
m:    SUBNOUN{SUBNOUNrec2}
             [modrel/VERB{VERBrec1}[mu1],
              head/SUBNOUN{SUBNOUNrec1}[mu2]
             ]

comp:
         C1:  (SUBNOUNrec1.lastaffix = noaffix)
              and (VERBrec1.tense = presenttense)
              and (VERBrec1.modus = indicative)
              and (VERBrec1.number = singular)
              and ([0,1] * VERBrec1.persons <> [])
              and (VERBrec1.eORenForm = NoForm)
           C2: (SFCATrec1.key = SFKleegCompound) 
           A2:  SUBNOUNrec2 := SUBNOUNrec1
           C2: (SFCATrec1.key = SFKstreepCompound) 
           A2:  SUBNOUNrec2 := SUBNOUNrec1
         A1:  @

decomp:
         C1:  (SUBNOUNrec1.lastaffix = noaffix)
              and (VERBrec1.tense = presenttense)
              and (VERBrec1.modus = indicative)
              and (VERBrec1.number = singular)
              and ([0,1] * VERBrec1.persons <> [])
              and (VERBrec1.eORenForm = NoForm)

         A1:  SFCATrec1.key := SFKstreepCompound
&
\end{verbatim}
