%ENGLISH1
%&

\section{Introduction}
The Lextree rules are morphological rules that come between the segmentation 
rules 
and the M-grammar. In analysis, they build a lexical S-tree on the basis of
the stem plus the affixes found by the segmentation rules. This is the last 
part of morphology; the resulting trees are input for the first syntactic 
component of the M-grammar, the Surface Parser. In generation, the Lextree
rules take the leaves from the syntactic surface tree produced by M-grammar 
and turn these leaves (which in fact are lexical S-trees) into stems and
suffix keys. 

Note that the application of the parts {\em comp\/} and {\em decomp\/} in the 
lextree rules is precisely reversed when compared to the rules in the 
M-grammar. Here, {\em comp\/} indicates the composition of a lexical tree, 
which is done when analysing a source language word, while in M-grammar, 
{\em comp\/} is the 
part which composes a syntactic structure, which is done when generating a
target language structure.

The present document contains all lextree rules written for English, together 
with some comments. It can be seen as an 
updated version of section 10 of document 115 by Agnes Mijnhout. In that 
document, a full description was given of English morphology as it was 
implemented in Rosetta3 at the end of 1986. Since then, there have been very
few major changes. All major changes are expicitly indicated in the present 
document. Minor changes and improvements have not been not mentioned explicitly.

The lextree rules are grouped into three files, called {\bf Lexrules1.lex, 
Lexrules2.lex} and {\bf Lexrules3.lex}. {\bf Lexrules1.lex} contains all lextree 
rules for verbs, {\bf Lexrules2.lex} contains the rules for nouns and propernouns
and for adjectives and adverbs,
and {\bf Lexrules3.lex} contains the rules for the different pronouns and the 
determiners. In the 
present document, all these groups of rules will be treated in separate 
sections.

In many rules, use is made of a copy function. This function copies the 
attribute values of the argument of the function (usu.\ the daughter) to the 
new node (usu. the mother), for all attributes shared by both nodes. Attributes
which are specific to the newly created (mother) node are always assigned a 
default value, which is 
determined by the Domain T. They can also be given a value in the rule itself.
This value will overwrite the default value. The Lextree rules are not fully 
reversible, since there is no analytic counterpart of the copy function in 
morphology.

\newpage
\section{Verbs}
In the Rosetta system, verbs are derived in two steps. First, there is a 
derivation level, changing a dictionary entry BVERB into a SUBVERB. Then, the 
subverb enters the inflection level and gets its inflectional affixes (if any),
which is indicated by a setting of the relevant attributes.
The output of the inflection level is called VERB. 

\subsection{Derivation}
\begin{verbatim}
%LBVerb

m1: BVERB{BVERBrec1}

m: SUBVERB{SUBVERBrec1}[head/BVERB{BVERBrec1}]

comp:

C1: true
A1: SUBVERBrec1 := copyT_bverbtosubverb(BVERBrec1)

decomp: 

C1: true
A1: @

&
\end{verbatim}
This rule is for verbs to which no derivation applies. English does not seem 
to need derivation rules for verbs: there are no incorporated particles.
The attribute {\bf affix} of the SUBVERB is automatically set at its default 
value, {\em noaffix\/}.

\newpage
\subsection{Inflection}
To spell out the proper form of the verb, use is made of a combination of the
suffix key provided by the segmentation rules (generatively speaking) and 
the verb attribute 
{\bf conjclasses}, indicating the conjugation class the verb belongs to.
Each class has its own peculiarities. Classes 10 and 11 are for regular verbs,
with and without consonant doubling respectively (e.g.\ {\em enter - entered\/}
vs.\ {\em bar - barred\/}). Classes 12, 13 and 14 are for modals: the `regular' 
modals are 
in 12 (e.g.\ {\em can\/}), 13 is for modals without past tense (e.g.\ {\em 
must\/}, and 14 is for modals without present tense (i.e.\ {\em used (to)}).
The other conjugation classes cover various kinds of irregularities in past
tense and/or past participle, with classes 5, 6 and 7 indicating that there 
is a second (or third) form available next to the form indicated by another
conjugation class. Class 0 is for the verb {\em be\/}. 

English has a rather simple inflectional system. There are only a few rules,
covering the whole field. No persons 4 or 5 exist; Dutch {\em U\/} and {\em
gij\/} are mapped onto English {\em you\/}, with the simple inflection of a 
second person. No rules have been written for verb forms going with the 
archaeic {\em thou\/}. Note that a distinction is made between singular and
plural {\em you\/}: although it will not show in the verb itself, it may show 
in a reflexive going with the verb ({\em you must perjure yourself/yourselves
\/}), and a choice was made to disambiguate the verb already in morphology.

The attributes that are new when going from a SUBVERB to a VERB are all filled 
explicitly. They are {\bf modus, tense, persons} and {\bf numbers}.

\subsubsection{Present Tense, Infinitive, Subjunctive}
\begin{verbatim}
%LVerbBaseform

m1: SUBVERB{SUBVERBrec1}[mu1]

m: VERB{VERBrec1}[head/SUBVERB{SUBVERBrec1}[mu1]]

comp:

C1: true

  C2: [1, 2, 3, 4, 8, 9, 10, 11] * SUBVERBrec1.conjclasses <> []

    C3: true
    A3: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
        VERBrec1.modus := indicative;
        VERBrec1.tense := presenttense;
        VERBrec1.persons := [1,2];
        VERBrec1.numbers := [singular]

    C4: true
    A4: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
        VERBrec1.modus := indicative;
        VERBrec1.tense := presenttense;
        VERBrec1.persons := [1,2,3];
        VERBrec1.numbers := [plural]

    C5: true
    A5: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
        VERBrec1.modus := infinitive;
        VERBrec1.tense := omegatense;
        VERBrec1.persons := [];
        VERBrec1.numbers := []

    C6: true
    A6: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
        VERBrec1.modus := subjunctive;
        VERBrec1.tense := presenttense;
        VERBrec1.persons := [1,2,3];
        VERBrec1.numbers := [singular, plural]

  A2: @

  C7: [12, 13] * SUBVERBrec1.conjclasses <> []
  A7: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
      VERBrec1.modus := indicative;
      VERBrec1.tense := presenttense;
      VERBrec1.persons := [1,2,3];
      VERBrec1.numbers := [singular, plural]

  C8: 14 in SUBVERBrec1.conjclasses
  A8: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
      VERBrec1.modus := indicative;
      VERBrec1.tense := pasttense;
      VERBrec1.persons := [1,2,3];
      VERBrec1.numbers := [singular, plural]

  C9: 0 in SUBVERBrec1.conjclasses
  A9: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
      VERBrec1.modus := infinitive;
      VERBrec1.tense := omegatense;
      VERBrec1.persons := [];
      VERBrec1.numbers := []

  C10: 0 in SUBVERBrec1.conjclasses
  A10: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
       VERBrec1.modus := subjunctive;
       VERBrec1.tense := presenttense;
       VERBrec1.persons := [1,2,3];
       VERBrec1.numbers := [singular, plural]

A1: @

decomp:

C1: true

  C2: [1, 2, 3, 4, 8, 9, 10, 11] * VERBrec1.conjclasses <> []

    C3: VERBrec1.modus = indicative and
        VERBrec1.tense = presenttense and
        [1,2] * VERBrec1.persons <> [] and
        singular in VERBrec1.numbers 
    A3: @

    C4: VERBrec1.modus = indicative and
        VERBrec1.tense = presenttense and
        [1,2,3] * VERBrec1.persons <> [] and
        plural in VERBrec1.numbers 
    A4: @

    C5: VERBrec1.modus = infinitive and
        VERBrec1.tense = omegatense and
        VERBrec1.persons = [] and
        VERBrec1.numbers = [] 
    A5: @

    C6: VERBrec1.modus = subjunctive and
        VERBrec1.tense = presenttense and
        [1,2,3] * VERBrec1.persons <> [] and
        [singular, plural] * VERBrec1.numbers <> [] 
    A6: @

  A2: @

  C7: VERBrec1.modus = indicative and
      VERBrec1.tense = presenttense and
      [1,2,3] * VERBrec1.persons <> [] and
      [singular, plural] * VERBrec1.numbers <> [] and
      [12, 13] * VERBrec1.conjclasses <> []
  A7: @  

  C8: VERBrec1.modus = indicative and
      VERBrec1.tense = pasttense and
      [1,2,3] * VERBrec1.persons <> [] and
      [singular, plural] * VERBrec1.numbers <> [] and
      14 in VERBrec1.conjclasses
  A8: @

  C9: VERBrec1.modus = infinitive and
      VERBrec1.tense = omegatense and
      VERBrec1.persons = [] and
      VERBrec1.numbers = [] and
      0 in VERBrec1.conjclasses
  A9: @

  C10: VERBrec1.modus = subjunctive and
       VERBrec1.tense = presenttense and
       [1,2,3] * VERBrec1.persons <> [] and
       [singular, plural] * VERBrec1.numbers <> [] and
       0 in VERBrec1.conjclasses

  A10: @

A1: @

&

\end{verbatim}
English does not have a separate spelling for imperatives: they always assume 
the base form of the verb, like infinitives. Hence, no imperative rules have 
been written. Subjunctives also look like infinitives, but they have been given 
a special attribute value for {\bf modus}.

Note that the present rule also works for infinitive and subjunctive of the 
verb {\em be\/}. For modals, the present rule also produces the third person
singular, since modals do not take an inflectional {\em s\/}.

\newpage
\subsubsection{Present Tense S-Form}
\begin{verbatim}
%LVerbSform

m1: SUBVERB{SUBVERBrec1}[mu1]
m2: SFCAT{SFCATrec1}

m: VERB{VERBrec1}[head/SUBVERB{SUBVERBrec1}[mu1]]

comp:

C1: true

  C2: SFCATrec1.key = SFKregS and SUBVERBrec1.sform = regS
  A2: @ 
       
  C3: SFCATrec1.key = SFKregEs and SUBVERBrec1.sform = regEs 
  A3: @ 
       
  C4: SFCATrec1.key = SFKirrS and SUBVERBrec1.sform = irrS 
  A4: @

A1: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
    VERBrec1.modus := indicative;
    VERBrec1.tense := presenttense;
    VERBrec1.persons := [3];
    VERBrec1.numbers := [singular]

decomp:

C1: VERBrec1.modus = indicative and
    VERBrec1.tense = presenttense and
    3 in VERBrec1.persons and
    singular in VERBrec1.numbers

  C2: VERBrec1.sform = regS
  A2: SFCATrec1.key := SFKregS

  C3: VERBrec1.sform = regEs
  A3: SFCATrec1.key := SFKregEs

  C4: VERBrec1.sform = irrS
  A4: SFCATrec1.key := SFKirrS

A1: @

&
\end{verbatim}
This rule makes the third person singular for all verbs taking an inflectional 
{\em s\/} or some variant thereof. The verb {\em be\/} is not dealt with here.

\newpage
\subsubsection{Past Tense}
\begin{verbatim}
%LVerbPasttense

m1: SUBVERB{SUBVERBrec1}[mu1]
m2: SFCAT{SFCATrec1}

m: VERB{VERBrec1}[head/SUBVERB{SUBVERBrec1}[mu1]]

comp:

C1: true

  C2: SFCATrec1.key = SFKirrpt and 
      [1,8] * SUBVERBrec1.conjclasses <> [] 
  A2: @
 
  C3: SFCATrec1.key = SFKirrpt2 and 
      5 in SUBVERBrec1.conjclasses 
  A3: @

  C4: SFCATrec1.key = SFKirrptpp 
      and 2 in SUBVERBrec1.conjclasses 
  A4: @

  C5: SFCATrec1.key = SFKirrnc and 
      [3,9] * SUBVERBrec1.conjclasses <> [] 
  A5: @

  C6: SFCATrec1.key = SFKregptpp and 
      [4,10] * SUBVERBrec1.conjclasses <> [] 
  A6: @

  C7: SFCATrec1.key = SFKcdptpp and 
      11 in SUBVERBrec1.conjclasses 
  A7: @

  C8: SFCATrec1.key = SFKmodpt and 
      12 in SUBVERBrec1.conjclasses
  A8: @

A1: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
    VERBrec1.modus := indicative;
    VERBrec1.tense := pasttense;
    VERBrec1.persons := [1,2,3];
    VERBrec1.numbers := [singular, plural]

decomp:

C1: VERBrec1.modus = indicative and
    VERBrec1.tense = pasttense and
    [1,2,3] * VERBrec1.persons <> [] and
    [singular, plural] * VERBrec1.numbers <> []

  C2: [1,8] * VERBrec1.conjclasses <> []
  A2: SFCATrec1.key := SFKirrpt

  C3: 5 in VERBrec1.conjclasses
  A3: SFCATrec1.key := SFKirrpt2

  C4: 2 in VERBrec1.conjclasses
  A4: SFCATrec1.key := SFKirrptpp

  C5: [3,9] * VERBrec1.conjclasses <> []
  A5: SFCATrec1.key := SFKirrnc

  C6: [4,10] * VERBrec1.conjclasses <> []
  A6: SFCATrec1.key := SFKregptpp

  C7: 11 in VERBrec1.conjclasses
  A7: SFCATrec1.key := SFKcdptpp

  C8: 12 in VERBrec1.conjclasses
  A8: SFCATrec1.key := SFKmodpt

A1: @

&
\end{verbatim}
This rule makes the past tense of both regular and irregular verbs, including 
the `extra' forms of conjugation class 5. The verb {\em be\/} is not covered 
here, however.

\newpage
\subsubsection{Past Participle}
\begin{verbatim}
%LVerbPastparticiple

m1: SUBVERB{SUBVERBrec1}[mu1]
m2: SFCAT{SFCATrec1}

m: VERB{VERBrec1}[head/SUBVERB{SUBVERBrec1}[mu1]]

comp:

C1: true

  C2: SFCATrec1.key = SFKirrpp and 
      [0,1,4,9] * SUBVERBrec1.conjclasses <> []
  A2: @

  C3: SFCATrec1.key = SFKirrptpp and 
      2 in SUBVERBrec1.conjclasses 
  A3: @

  C4: SFCATrec1.key = SFKirrpp2 and 
      6 in SUBVERBrec1.conjclasses 
  A4: @

  C5: SFCATrec1.key = SFKirrpp3 and 
      7 in SUBVERBrec1.conjclasses 
  A5: @

  C6: SFCATrec1.key = SFKirrnc and 
      [3,8] * SUBVERBrec1.conjclasses <> []
  A6: @

  C7: SFCATrec1.key = SFKregptpp and 
      10 in SUBVERBrec1.conjclasses 
  A7: @

  C8: SFCATrec1.key = SFKcdptpp and 
      11 in SUBVERBrec1.conjclasses 
  A8: @

A1: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
    VERBrec1.modus := participle;
    VERBrec1.tense := omegatense;
    VERBrec1.persons := [];
    VERBrec1.numbers := []

decomp:

C1: VERBrec1.modus = participle and
    VERBrec1.tense = omegatense and
    VERBrec1.persons = [] and
    VERBrec1.numbers = []

  C2: [0,1,4,9] * VERBrec1.conjclasses <> []
  A2: SFCATrec1.key := SFKirrpp

  C3: 2 in VERBrec1.conjclasses
  A3: SFCATrec1.key := SFKirrptpp

  C4: 6 in VERBrec1.conjclasses
  A4: SFCATrec1.key := SFKirrpp2

  C5: 7 in VERBrec1.conjclasses
  A5: SFCATrec1.key := SFKirrpp3

  C6: [3,8] * VERBrec1.conjclasses <> []
  A6: SFCATrec1.key := SFKirrnc

  C7: 10 in VERBrec1.conjclasses
  A7: SFCATrec1.key := SFKregptpp

  C8: 11 in VERBrec1.conjclasses
  A8: SFCATrec1.key := SFKcdptpp

A1: @

&
\end{verbatim}
This rule makes the past participle form for all verbs that have one, i.e.\
only the modals are excluded. The verb {\em be\/} is dealt with here, too.
The extra forms produced by classes 7 and 8 are also covered by this rule.

\newpage
\subsubsection{Ing-Form}
\begin{verbatim}
%LVerbIngform

m1: SUBVERB{SUBVERBrec1}[mu1]
m2: SFCAT{SFCATrec1}

m: VERB{VERBrec1}[head/SUBVERB{SUBVERBrec1}[mu1]]

comp:

C1: true

  C2: SFCATrec1.key = SFKreging and 
      SUBVERBrec1.ingform = reging 
  A2: @

  C3: SFCATrec1.key = SFKreging and
      SUBVERBrec1.ingform = cdreging 
  A3: @

  C4: SFCATrec1.key = SFKcding and 
      SUBVERBrec1.ingform = cding 
  A4: @

  C5: SFCATrec1.key = SFKcding and 
      SUBVERBrec1.ingform = cdreging 
  A5: @

  C6: SFCATrec1.key = SFKirring and 
      SUBVERBrec1.ingform = irring 
  A6: @

A1:  VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
     VERBrec1.modus := ingform;
     VERBrec1.tense := omegatense;
     VERBrec1.persons := [];
     VERBrec1.numbers := []

decomp:

C1: VERBrec1.modus = ingform and
    VERBrec1.tense = omegatense and
    VERBrec1.persons = [] and
    VERBrec1.numbers = []

  C2: VERBrec1.ingform = reging
  A2: SFCATrec1.key := SFKreging

  C3: VERBrec1.ingform = cdreging
  A3: SFCATrec1.key := SFKreging

  C4: VERBrec1.ingform = cding
  A4: SFCATrec1.key := SFKcding

  C5: VERBrec1.ingform = cdreging
  A5: SFCATrec1.key := SFKcding

  C6: VERBrec1.ingform = irring
  A6: SFCATrec1.key := SFKirring

A1: @

&
\end{verbatim}
This rule works for all verbs that allow an ing-form, including {\em be\/}.
The modals are not explicitly excluded on the basis of their conjugation class;
they simply do not have the correct value for the attribute {\bf ingform}.

\newpage
\subsection{Inflection of the verb `Be'}
\begin{verbatim}
%LVerbBe

m1: SUBVERB{SUBVERBrec1}[mu1]
m2: SFCAT{SFCATrec1}

m: VERB{VERBrec1}[head/SUBVERB{SUBVERBrec1}[mu1]]

comp:

C1: 0 in SUBVERBrec1.conjclasses

  C2: SFCATrec1.key = SFKam
  A2: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
      VERBrec1.modus := indicative;
      VERBrec1.tense := presenttense;
      VERBrec1.persons := [1];
      VERBrec1.numbers := [singular]

  C3: SFCATrec1.key = SFKis
  A3: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
      VERBrec1.modus := indicative;
      VERBrec1.tense := presenttense;
      VERBrec1.persons := [3];
      VERBrec1.numbers := [singular]
    
  C4: SFCATrec1.key = SFKare

    C5: true
    A5: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
        VERBrec1.modus := indicative;
        VERBrec1.tense := presenttense;
        VERBrec1.persons := [2];
        VERBrec1.numbers := [singular]

    C6: true
    A6: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
        VERBrec1.modus := indicative;
        VERBrec1.tense := presenttense;
        VERBrec1.persons := [1,2,3];
        VERBrec1.numbers := [plural]

  A4: @

  C7: SFCATrec1.key = SFKwas
  A7: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
      VERBrec1.modus := indicative;
      VERBrec1.tense := pasttense;
      VERBrec1.persons := [1,3];
      VERBrec1.numbers := [singular]

  C8: SFCATrec1.key = SFKwere

    C9: true
    A9: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
        VERBrec1.modus := indicative;
        VERBrec1.tense := pasttense;
        VERBrec1.persons := [2];
        VERBrec1.numbers := [singular]

    C10: true
    A10: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
         VERBrec1.modus := indicative;
         VERBrec1.tense := pasttense;
         VERBrec1.persons := [1,2,3];
         VERBrec1.numbers := [plural]

    C11: true
    A11: VERBrec1 := copyT_subverbtoverb(SUBVERBrec1);
         VERBrec1.modus := subjunctive;
         VERBrec1.tense := pasttense;
         VERBrec1.persons := [1,2,3];
         VERBrec1.numbers := [singular, plural]

  A8: @

A1: @

decomp:

C1: 0 in VERBrec1.conjclasses

  C2: VERBrec1.modus = indicative and
      VERBrec1.tense = presenttense and
      1 in VERBrec1.persons and
      singular in VERBrec1.numbers
  A2: SFCATrec1.key := SFKam

  C3: VERBrec1.modus = indicative and
      VERBrec1.tense = presenttense and
      3 in VERBrec1.persons and
      singular in VERBrec1.numbers
  A3: SFCATrec1.key := SFKis

  C4: true
 
    C5: VERBrec1.modus = indicative and
        VERBrec1.tense = presenttense and
        2 in VERBrec1.persons and
        singular in VERBrec1.numbers
    A5: @

    C6: VERBrec1.modus = indicative and
        VERBrec1.tense = presenttense and
        [1,2,3] * VERBrec1.persons <> [] and
        plural in VERBrec1.numbers
    A6: @

  A4: SFCATrec1.key := SFKare

  C7: VERBrec1.modus = indicative and
      VERBrec1.tense = pasttense and
      [1,3] * VERBrec1.persons <> [] and
      singular in VERBrec1.numbers
  A7: SFCATrec1.key := SFKwas

  C8: true

    C9: VERBrec1.modus = indicative and
        VERBrec1.tense = pasttense and
        2 in VERBrec1.persons and
        singular in VERBrec1.numbers
    A9: @

    C10: VERBrec1.modus = indicative and
         VERBrec1.tense = pasttense and
         [1,2,3] * VERBrec1.persons <> [] and
         plural in VERBrec1.numbers
    A10: @

    C11: VERBrec1.modus = subjunctive and
         VERBrec1.tense = pasttense and
         [1,2,3] * VERBrec1.persons <> [] and
         [singular, plural] * VERBrec1.numbers <> []
    A11: @

  A8: SFCATrec1.key := SFKwere

A1: @

&
\end{verbatim}
The current rule spells out the different verb forms of the verb {\em be\/} 
for those cases that have not been covered by previous rules. Note that {\em
be\/} is the only verb which has a past subjunctive.
