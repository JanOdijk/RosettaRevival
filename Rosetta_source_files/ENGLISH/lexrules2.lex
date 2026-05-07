%ENGLISH2
%&

\newpage
\section{Nouns and Propernouns}
In Rosetta3, nouns and propernouns have much in common. They 
especially share many attributes. However, they cannot
simply be translated into one another. It is assumed that propernouns do not
have a derivation level, while nouns do. Furthermore, it was decided that 
propernouns may only 
occur in their base form, and have no plural form. This is 
a major change when compared to the system described in document 115. The main
reason for this decision was to simplify the grammar. In a plural form, the 
difference between a propernoun and a noun cannot easily be determined by the
grammar, if it can be determined at all. To be able
to deal with plurals and modification of propernouns, a special propernoun
derivation rule has been added, which turns a BPROPERNOUN into a SUBNOUN,
copying all the attributes.
From then on, the form can do everything an ordinary noun can. Those 
propernouns that are inherently plural, like {\em (the) Hebrides\/}, are 
entered in the dictionary as nouns from the start.

\subsection{Nouns}
As for verbs, the rules for nouns are divided in two classes. First, there 
is the derivation level, which turns a lexical entry BNOUN into a SUBNOUN by
adding the relevant affixes (if any), and then the rules of the inflection 
level change the SUBNOUN into a NOUN. 

\subsubsection{Derivation}
\begin{verbatim}
%LBNoun

m1: BNOUN{BNOUNrec1}

m: SUBNOUN{SUBNOUNrec1}[head/BNOUN{BNOUNrec1}]

comp:

C1: true
A1: SUBNOUNrec1 := copyT_bnountosubnoun(BNOUNrec1)

decomp:

C1: true
A1: @

&
\end{verbatim}
This rule is for nouns to which no derivation applies. English has no 
incorporated diminutive (like Dutch {\em -je\/}), and there does not seem to
be any noun formation suffix that is fully regular over all languages Rosetta 
deals with. Hence, no noun derivation rules have been written.

\newpage
\subsubsection{Singular or Base Form}
\begin{verbatim}
%LNounBaseform

m1: SUBNOUN{SUBNOUNrec1}[mu1]

m:  NOUN{NOUNrec1}[head/SUBNOUN{SUBNOUNrec1}[mu1]]

comp:

C1: true

  C2: not (onlyplur in SUBNOUNrec1.plurforms)
  A2: NOUNrec1 := copyT_subnountonoun(SUBNOUNrec1);
      NOUNrec1.numbers := [singular]

  C3: onlyplur in SUBNOUNrec1.plurforms
  A3: NOUNrec1 := copyT_subnountonoun(SUBNOUNrec1);
      NOUNrec1.numbers := [plural]

  C4: singandplur in SUBNOUNrec1.plurforms
  A4: NOUNrec1 := copyT_subnountonoun(SUBNOUNrec1);
      NOUNrec1.numbers := [plural]

A1: @

decomp:

C1: true

  C2: singular in NOUNrec1.numbers and 
      not (onlyplur in NOUNrec1.plurforms)
  A2: @

  C3: plural in NOUNrec1.numbers and 
      onlyplur in NOUNrec1.plurforms
  A3: @

  C4: plural in NOUNrec1.numbers and 
      singandplur in NOUNrec1.plurforms
  A4: @

A1: @

&
\end{verbatim}
Note that nouns which do not show a change of form when occurring in the 
plural, like {\em sheep\/},  have the value {\em singandplur\/} for the 
attribute {\bf plurforms}.
They pass both subrules 2 and 4. Nouns that are inherently plural, like {\em
police\/}, are dealt with here too. They have the value {\em onlyplur\/}.

\newpage
\subsubsection{Plural form}
\begin{verbatim}
%LNounPlural

m1:  SUBNOUN{SUBNOUNrec1}[mu1]
m2:  SFCAT{SFCATrec1}

m:   NOUN{NOUNrec1}[head/SUBNOUN{SUBNOUNrec1}[mu1]]

comp:

C1: true

  C2: SFCATrec1.key = SFKregS and 
      regplur in SUBNOUNrec1.plurforms
  A2: @        

  C3: SFCATrec1.key = SFKregEs and 
      regEplur in SUBNOUNrec1.plurforms
  A3: @      

  C4: SFCATrec1.key = SFKirrS and 
      irrSplur in SUBNOUNrec1.plurforms
  A4: @

  C5: SFCATrec1.key = SFKirrplur and 
      irrplur in SUBNOUNrec1.plurforms
  A5: @

  C6: SFCATrec1.key = SFKlatplur and latplur in SUBNOUNrec1.plurforms
  A6: @        

  C7: SFCATrec1.key = SFKvoicingS and voicingplur in SUBNOUNrec1.plurforms
  A7: @

A1: NOUNrec1 := copyT_subnountonoun(SUBNOUNrec1);
    NOUNrec1.numbers := [plural]

decomp: 

C1: plural in NOUNrec1.numbers

  C2: regplur in NOUNrec1.plurforms
  A2: SFCATrec1.key := SFKregS

  C3: regEplur in NOUNrec1.plurforms
  A3: SFCATrec1.key := SFKregEs

  C4: irrSplur in NOUNrec1.plurforms
  A4: SFCATrec1.key := SFKirrS

  C5: irrplur in NOUNrec1.plurforms
  A5: SFCATrec1.key := SFKirrplur

  C6: latplur in NOUNrec1.plurforms
  A6: SFCATrec1.key := SFKlatplur

  C7: voicingplur in NOUNrec1.plurforms
  A7: SFCATrec1.key := SFKvoicingS

A1: @

& 
\end{verbatim}
Nouns that are inherently plural, like {\em police\/}, are not treated here, 
since there is no suffix key connected with them. They are covered by the rule 
for the base form of nouns. 

English does not have an inflectional genitive (like Dutch {\em mijn vaders 
boek\/}), hence no more rules are needed here.

\newpage
\subsection{Propernouns}
Most of the assumptions concerning propernouns have already been stated at the
beginning of this section. There is no derivation level within the category 
PROPERNOUN, and there is no plural formation.

\subsubsection{Singular or Base Form}
\begin{verbatim}
%LPropernounBaseform

m1: BPROPERNOUN{BPROPERNOUNrec1}

m: PROPERNOUN{PROPERNOUNrec1}[head/BPROPERNOUN{BPROPERNOUNrec1}]

comp:

C1: true
A1: PROPERNOUNrec1 := copyT_bproperntopropern(BPROPERNOUNrec1);
    PROPERNOUNrec1.numbers := [singular]

decomp:

C1: singular in PROPERNOUNrec1.numbers
A1: @

&
\end{verbatim}
This rule is different from the rule for nouns in that it is assumed that 
every proper noun can be singular. Remember that propernouns which are 
inherently plural are entered in the dictionary as nouns. The attribute 
{\bf numbers} as a set value is a relic from the time propernouns were allowed 
to form their own plurals.

\newpage
\subsubsection{Propernoun to Noun Derivation}
For all forms of propernouns that are different from the base form, they have to
be transformed to subnouns first. In the M-grammar it is assumed that 
propernouns which are modified in any way (e.g.\ by an article) are SUBNOUNs 
too.

\begin{verbatim}
%LBPropernounToSubnoun

m1: BPROPERNOUN{BPROPERNOUNrec1}

m: SUBNOUN{SUBNOUNrec1}[head/BPROPERNOUN{BPROPERNOUNrec1}]

comp:

C1: true
A1: SUBNOUNrec1 := copyT_bproperntosubnoun(BPROPERNOUNrec1)

decomp:

C1: true
A1: @

&
\end{verbatim}
The attributes that are specific to the subnoun recieve their default value.

\newpage
\section{Adjectives and Adverbs}
The rules for adjectives and adverbs are very similar. For both categories, 
there is a derivation level and an inflectional level, the latter for 
realization of comparatives and superlatives.


\subsection{Adjectives}
\subsubsection{Derivation}
\begin{verbatim}
%LBadj

m1: BADJ{BADJrec1}

m: SUBADJ{SUBADJrec1}[head/BADJ{BADJrec1}]

comp:

C1: true
A1: SUBADJrec1 := copyT_badjtosubadj(BADJrec1)

decomp:

C1: true
A1: @

&
\end{verbatim}
\newpage
\subsubsection{Adjective to Adverb Derivation}
This rule has been added to deal with regular derivation of adverbs from 
adjectives by means of the suffix {\em -ly\/}. For Dutch, a corresponding 
rule exists, using an abstract suffix. In november 1989, an extra CA-pair 
was added to deal with `vacuous' derivation for adjectives like {\em fast\/} 
and {\em daily\/} that do not take any overt suffix.

\begin{verbatim}
%LAdjToAdvDeriv

m1: SUBADJ{SUBADJrec1}[mu1]
m2: SFCAT{SFCATrec1}

m : SUBADV{SUBADVrec1}[complrel/SUBADJ{SUBADJrec1}[mu1],
                       head/BADVSUFF(lyBADVSUFFkey){BADVSUFFrec1}
                      ]

comp:

C1: SUBADJrec1.advformation <> noAdv

  C2: irradvComp in SUBADJrec1.compformations
    C21: SFCATrec1.key = SFKregly and 
         SUBADJrec1.advformation = regAdv 
    A21: @
    C22: SFCATrec1.key = SFKirregly and
         SUBADJrec1.advformation = irregAdv
    A22: @
  A2: SUBADVrec1.compformations := [irrComp]

  C3: SUBADJrec1.compformations <> [noComp] and
      not (irradvComp in SUBADJrec1.compformations)
    C31: SFCATrec1.key = SFKregly and 
         SUBADJrec1.advformation = regAdv 
    A31: SUBADVrec1.compformations := [moreComp]
    C32: SFCATrec1.key = SFKirregly and
         SUBADJrec1.advformation = irregAdv
    A32: SUBADVrec1.compformations := [moreComp]
    C33: SFCATrec1.key = SFKnoly and
         SUBADJrec1.advformation = zeroAdv
    A33: SUBADVrec1.compformations := SUBADJrec1.compformations
  A3: @

  C4: SUBADJrec1.compformations = [noComp]
    C41: SFCATrec1.key = SFKregly and 
         SUBADJrec1.advformation = regAdv 
    A41: @
    C42: SFCATrec1.key = SFKirregly and
         SUBADJrec1.advformation = irregAdv
    A42: @
    C43: SFCATrec1.key = SFKnoly and
         SUBADJrec1.advformation = zeroAdv
    A43: @
  A4: SUBADVrec1.compformations := [noComp]

A1: SUBADVrec1.affix      := lyaffix;
    SUBADVrec1.req        := SUBADJrec1.req;
    SUBADVrec1.env        := SUBADJrec1.env;
    SUBADVrec1.subcs      := BADVSUFFrec1.subcs;
    SUBADVrec1.class      := SUBADJrec1.class;
    SUBADVrec1.deixis     := SUBADJrec1.deixis;
    SUBADVrec1.aspect     := SUBADJrec1.aspect;
    SUBADVrec1.retro      := SUBADJrec1.retro;
    SUBADVrec1.mood       :=  BADVSUFFrec1.mood;
    SUBADVrec1.thetaadv   := BADVSUFFrec1.thetaadv;
    SUBADVrec1.advpatterns:= BADVSUFFrec1.advpatterns;
    SUBADVrec1.prepkey    := BADVSUFFrec1.prepkey;
    SUBADVrec1.position   := BADVSUFFrec1.position;
    SUBADVrec1.possnietnp := BADVSUFFrec1.possnietnp;
    SUBADVrec1.thanas     := BADVSUFFrec1.thanas;
    SUBADVrec1.temporal   := BADVSUFFrec1.temporal


decomp:

C1: SUBADVrec1.affix      = lyaffix and
    SUBADVrec1.req        = SUBADJrec1.req and
    SUBADVrec1.env        = SUBADJrec1.env and
    SUBADVrec1.subcs      = BADVSUFFrec1.subcs and
    SUBADVrec1.class      = SUBADJrec1.class and
    SUBADVrec1.deixis     = SUBADJrec1.deixis and
    SUBADVrec1.aspect     = SUBADJrec1.aspect and
    SUBADVrec1.retro      = SUBADJrec1.retro and
    SUBADVrec1.mood       = BADVSUFFrec1.mood and
    SUBADVrec1.thetaadv   = BADVSUFFrec1.thetaadv and
    SUBADVrec1.advpatterns= BADVSUFFrec1.advpatterns and
    SUBADVrec1.prepkey    = BADVSUFFrec1.prepkey and
    SUBADVrec1.position   = BADVSUFFrec1.position and
    SUBADVrec1.possnietnp = BADVSUFFrec1.possnietnp and
    SUBADVrec1.thanas     = BADVSUFFrec1.thanas and
    SUBADVrec1.temporal   = BADVSUFFrec1.temporal and
    SUBADJrec1.advformation <> noAdv

  C2: irradvComp in SUBADJrec1.compformations and
      SUBADVrec1.compformations = [irrComp]
    C21: SUBADJrec1.advformation = regAdv
    A21: SFCATrec1.key := SFKregly
    C22: SUBADJrec1.advformation = irregAdv
    A22: SFCATrec1.key := SFKirregly
  A2: @

  C3: SUBADJrec1.compformations <> [noComp] and
      not (irradvComp in SUBADJrec1.compformations) 
    C31: SUBADJrec1.advformation = regAdv and
         SUBADVrec1.compformations = [moreComp]
    A31: SFCATrec1.key := SFKregly
    C32: SUBADJrec1.advformation = irregAdv and
         SUBADVrec1.compformations = [moreComp]
    A32: SFCATrec1.key := SFKirregly
    C33: SUBADJrec1.advformation = zeroAdv and
         SUBADVrec1.compformations = SUBADJrec1.compformations
    A33: SFCATrec1.key := SFKnoly
  A3: @

  C4: SUBADJrec1.compformations = [noComp] and
      SUBADVrec1.compformations = [noComp]
    C41: SUBADJrec1.advformation = regAdv
    A41: SFCATrec1.key := SFKregly
    C42: SUBADJrec1.advformation = irregAdv
    A42: SFCATrec1.key := SFKirregly
  A4: @

A1: @

&
\end{verbatim}
Note that no conditions on advformation have been related to adjpatterns or 
thetaadj yet. The position attribute of 
the BADVSUFF is set at default value in the lexicon; probably, there should be 
a relation between subcs and position.

The attribute {\bf compformations} of the adjective cannot simply be copied
to the adverb, since adverbs on {\em -ly\/} usually do not take an inflectional
comparative or superlative, while adjectives may do so (e.g.\ {\em loud - 
louder; $^{*}$loudlier\/}. Therefore, the value
of {\bf compformations} of the adverb is set at [moreComp] if the adjective
does allow some kind of comparative, and at [noComp] if the adjective does not.
For adverbs that do not show any change in form, the value of the adjective
may be copied directly. An extra value for the attribute {\em compformations\/} 
exists for the adjectives {\em good\/} and {\em bad\/}: they both have 
[irrcomp, irradvComp] to indicate that their adverbs do NOT get the ordinary 
[moreComp], but again [irrComp]: {\em better\/} and {\em worse\/}, respectively.

If the -y suffix is also used in Rosetta for derivation (from nouns 
to adjs: 
storm - stormy), care has to be taken that the value of the attribute
`advformation' of the resulting adj is set at the correct value; however, I know
no general rules to decide what the correct value is (storm - stormy - 
*stormily; dream - dreamy - dreamily).

\newpage
\subsubsection{Base Form}
\begin{verbatim}
%LAdjBaseform

m1: SUBADJ{SUBADJrec1}[mu1]

m: ADJ{ADJrec1}[head/SUBADJ{SUBADJrec1}[mu1]]

comp:

C1:  true

A1:  ADJrec1 := copyT_subadjtoadj(SUBADJrec1);
     ADJrec1.compform := basic

decomp:

C1:  ADJrec1.compform = basic

A1:  @

&
\end{verbatim}
\newpage
\subsubsection{Comparative}
The value [irradvComp] that occurs for the adjectives {\em good\/} and {\em 
bad\/} is NOT meant as a value to be realised for these adjectives, but 
merely to indicate that the corresponding adverb does not get the 
value [moreComp] for its compformations, as is usual for derived adverbs, but 
the value [irrComp].

\begin{verbatim}
%LAdjComp

m1: SUBADJ{SUBADJrec1}[mu1]
m2: SFCAT{SFCATrec1}

m: ADJ{ADJrec1}[head/SUBADJ{SUBADJrec1}[mu1]]

comp:

C1: true

  C2: SFCATrec1.key = SFKregcomp and 
      regcomp in SUBADJrec1.compformations
  A2: @        

  C3: SFCATrec1.key = SFKcdcomp and 
      cdcomp in SUBADJrec1.compformations
  A3: @          

  C4: SFCATrec1.key = SFKirrcomp and 
      irrcomp in SUBADJrec1.compformations
  A4: @        

  C5: SFCATrec1.key = SFKirrcomp2 and 
      irrcomp2 in SUBADJrec1.compformations
  A5: @       

A1: ADJrec1 := copyT_subadjtoadj(SUBADJrec1);
    ADJrec1.compform := compar

decomp:

C1: ADJrec1.compform = compar

  C2: regcomp in ADJrec1.compformations
  A2: SFCATrec1.key := SFKregcomp

  C3: cdcomp in ADJREC1.compformations
  A3: SFCATrec1.key := SFKcdcomp

  C4: irrcomp in ADJrec1.compformations
  A4: SFCATrec1.key := SFKirrcomp

  C5: irrcomp2 in ADJrec1.compformations
  A6: SFCATrec1.key := SFKirrcomp2

A1: @

&
\end{verbatim}
\newpage
\subsubsection{Superlative}
\begin{verbatim}
%LAdjSuper

m1: SUBADJ{SUBADJrec1}[mu1]
m2: SFCAT{SFCATrec1}

m: ADJ{ADJrec1}[head/SUBADJ{SUBADJrec1}[mu1]]

comp:

C1: true

  C2: SFCATrec1.key = SFKregsuper and 
      regcomp in SUBADJrec1.compformations
  A2: @       

  C3: SFCATrec1.key = SFKcdsuper and 
      cdcomp in SUBADJrec1.compformations
  A3: @         

  C4: SFCATrec1.key = SFKirrsuper and 
      irrcomp in SUBADJrec1.compformations
  A4: @         

  C5: SFCATrec1.key = SFKirrsuper2 and 
      irrcomp2 in SUBADJrec1.compformations
  A5: @

A1: ADJrec1 := copyT_subadjtoadj(SUBADJrec1);
    ADJrec1.compform := super

decomp:

C1: ADJrec1.compform = super

  C2: regcomp in ADJrec1.compformations
  A2: SFCATrec1.key := SFKregsuper

  C3: cdcomp in ADJrec1.compformations
  A3: SFCATrec1.key := SFKcdsuper

  C4: irrcomp in ADJrec1.compformations
  A4: SFCATrec1.key := SFKirrsuper

  C5: irrcomp2 in ADJrec1.compformations
  A5: SFCATrec1.key := SFKirrsuper2

A1: @

&
\end{verbatim}
English does not have a counterpart for the Dutch {\em aller-}superlative. It 
is translated into an ordinary superlative.

\newpage
\subsection{Adverbs}
\subsubsection{Derivation}
\begin{verbatim}
%LBadV

m1: BADV{BADVrec1}

m: SUBADV{SUBADVrec1}[head/BADV{BADVrec1}]

comp:

C1: true
A1: SUBADVrec1 := copyT_badvtosubadv(BADVrec1)

decomp:

C1: true
A1: @

&
\end{verbatim}
\newpage
\subsubsection{Base Form}
\begin{verbatim}
%LAdvBaseform

m1: SUBADV{SUBADVrec1}[mu1]

m: ADV{ADVrec1}[head/SUBADV{SUBADVrec1}[mu1]]

comp:

C1: true

A1: ADVrec1 := copyT_subadvtoadv(SUBADVrec1);
    ADVrec1.compform := basic

decomp:

C1: ADVrec1.compform = basic

A1: @

&
\end{verbatim}
\newpage
\subsubsection{Comparative}
\begin{verbatim}
%LAdvComp

m1: SUBADV{SUBADVrec1}[mu1]
m2: SFCAT{SFCATrec1}

m: ADV{ADVrec1}[head/SUBADV{SUBADVrec1}[mu1]]

comp:

C1: true

  C2: SFCATrec1.key = SFKregcomp and 
      regcomp in SUBADVrec1.compformations
  A2: @        

  C3: SFCATrec1.key = SFKcdcomp and 
      cdcomp in SUBADVrec1.compformations
  A3: @        

  C4: SFCATrec1.key = SFKirrcomp and 
      irrcomp in SUBADVrec1.compformations
  A4: @       

  C5: SFCATrec1.key = SFKirrcomp2 and 
      irrcomp2 in SUBADVrec1.compformations
  A5: @

A1: ADVrec1 := copyT_subadvtoadv(SUBADVrec1);
    ADVrec1.compform := compar

decomp:

C1: ADVrec1.compform =compar

  C2: regcomp in ADVrec1.compformations
  A2: SFCATrec1.key := SFKregcomp

  C3: cdcomp in ADVREC1.compformations
  A3: SFCATrec1.key := SFKcdcomp

  C4: irrcomp in ADVrec1.compformations
  A4: SFCATrec1.key := SFKirrcomp

  C5: irrcomp2 in ADVrec1.compformations
  A5: SFCATrec1.key := SFKirrcomp2

A1: @

&
\end{verbatim}
\newpage
\subsubsection{Superlative}
\begin{verbatim}
%LAdvSuper

m1: SUBADV{SUBADVrec1}[mu1]
m2: SFCAT{SFCATrec1}

m: ADV{ADVrec1}[head/SUBADV{SUBADVrec1}[mu1]]

comp:

C1: true

  C2: SFCATrec1.key = SFKregsuper and 
      regcomp in SUBADVrec1.compformations
  A2: @         

  C3: SFCATrec1.key = SFKcdsuper and 
      cdcomp in SUBADVrec1.compformations
  A3: @         

  C4: SFCATrec1.key = SFKirrsuper and 
      irrcomp in SUBADVrec1.compformations
  A4: @         

  C5: SFCATrec1.key = SFKirrsuper2 and 
      irrcomp2 in SUBADVrec1.compformations
  A5: @
         
A1: ADVrec1 := copyT_subadvtoadv(SUBADVrec1);
    ADVrec1.compform := super

decomp:

C1: ADVrec1.compform = super

  C2: regcomp in ADVrec1.compformations
  A2: SFCATrec1.key := SFKregsuper

  C3: cdcomp in ADVrec1.compformations
  A3: SFCATrec1.key := SFKcdsuper

  C4: irrcomp in ADVrec1.compformations
  A4: SFCATrec1.key := SFKirrsuper

  C5: irrcomp2 in ADVrec1.compformations
  A5: SFCATrec1.key := SFKirrsuper2

A1: @

&
\end{verbatim}
