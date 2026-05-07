%SPANISH1
&

$A1 Lextree-rules.
TYPE LEXTREE;

{ rules for the `regular endings` }

{ The category ALOVERB (with the same attributes as VERB) has been
  introduced in morphology, in order to make it possible to use the
  rules for regular endings for both the verbs without allomorphs and
  for those with allomorphs. These rules change the category VERB
  into ALOVERB (in generation). 
  Later on two types of rules follow, changing ALOVERB into SUBVERB:
   - Rules for forms without stem-change (i.e.not adding a SFK).
     (e.g. despertamos; all infinitives)
   - Those for forms with stem-change, adding a SFK.
     (e.g. despert + `SFKdiftong` + SFKo < despiert+SFKo)                 }
  
{ Another possibility would have been to add an extra attribute to the
  VERB. However, a clear disadvantage of this solution would have been 
  that the VERB bears a "superfluous" attribute through the entire syntax.}

{ Since an accent cannot be used in Pascal declarations, the number 1 is
  put behind a vowel bearing an accent: SFKía --> SFKi1a                  }

{ Verbs ending on -ar      -->>   [CONJ1,CONJ6]
  Verbs ending on -er      -->>   [CONJ2,CONJ4]
  Verbs ending on -ir      -->>   [CONJ3,CONJ5,CONJ9]        
  Verbs ending on -er/-ir  -->>   [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]  }


$NP
$RL 31
 { Ptcpas; sg. } 

%PtcpasSG

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:    ALOVERBrec1.modo = PtcPas
  C1:    true
    C2:    true
      C3:    ((ALOVERBrec1.CONJclases * [CONJ1]<>[]) and 
             (SFCATrec1.key = SFKado))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:    ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) and
             (SFCATrec1.key = SFKido))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:    VERBrec1.genero := masc

    C2:    true
      C3:    ((ALOVERBrec1.CONJclases * [CONJ1]<>[]) and
             (SFCATrec1.key = SFKado)) 
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:    ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) and
             (SFCATrec1.key = SFKido))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:    VERBrec1.genero := neutro

    C2:    true
      C3:    ((ALOVERBrec1.CONJclases * [CONJ1]<>[]) and
             (SFCATrec1.key = SFKada))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:    ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) and
             (SFCATrec1.key = SFKida))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:    VERBrec1.genero := fem
  A1:    VERBrec1.numero := singular
A0:    VERBrec1.modo := PtcPas

C0:    nadaCLASE IN ALOVERBrec1.Aloclases
  C1:    true
    C2:    true
      C3:    ((ALOVERBrec1.CONJclases * [CONJ1]<>[]) and
             (SFCATrec1.key = SFKado)) 
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:    ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) and
             (SFCATrec1.key = SFKido))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:    VERBrec1.genero := masc

    C2:    true
      C3:    ((ALOVERBrec1.CONJclases * [CONJ1]<>[]) and
             (SFCATrec1.key = SFKado)) 
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:    ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) and
             (SFCATrec1.key = SFKido))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:    VERBrec1.genero := neutro

    C2:    true
      C3:    ((ALOVERBrec1.CONJclases * [CONJ1]<>[]) and
             (SFCATrec1.key = SFKada))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:    ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) and
             (SFCATrec1.key = SFKida))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:    VERBrec1.genero := fem
  A1:    VERBrec1.numero := singular
A0:    VERBrec1.modo := PtcPas


decomp: 

C0:    (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.modo = PtcPas)
  C1:    VERBrec1.numero = singular

    C2:    VERBrec1.genero = masc
      C3:    (VERBrec1.CONJclases * [CONJ1]<>[])  
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKado                
      C3:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
             SFCATrec1.key := SFKido                     
    A2:     @

    C2:    VERBrec1.genero = neutro
      C3:    (VERBrec1.CONJclases * [CONJ1]<>[])  
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKado                
      C3:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
             SFCATrec1.key := SFKido                     
    A2:     @

    C2:    VERBrec1.genero = fem
      C3:    (VERBrec1.CONJclases * [CONJ1]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKada
      C3:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKida                      
    A2:     @
  A1:     @
A0:    ALOVERBrec1.modo := PtcPas

C0:    (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.modo = PtcPas)
  C1:    VERBrec1.numero = singular

    C2:    VERBrec1.genero = masc
      C3:    (VERBrec1.CONJclases * [CONJ1]<>[])  
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKado                
      C3:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKido                     
    A2:     @

    C2:    VERBrec1.genero = neutro
      C3:    (VERBrec1.CONJclases * [CONJ1]<>[])  
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKado                
      C3:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKido                     
    A2:     @

    C2:    VERBrec1.genero = fem
      C3:    (VERBrec1.CONJclases * [CONJ1]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKada
      C3:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKida                      
    A2:     @
  A1:     @
A0:    ALOVERBrec1.modo := PtcPas
&


$RL 32
 { Ptcpas; pl. } 

%PtcpasPL

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:    ALOVERBrec1.modo = PtcPas
  C1:    true
    C2:    true
      C3:    ((ALOVERBrec1.CONJclases * [CONJ1]<>[]) and
             (SFCATrec1.key = SFKados))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:    ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) and
             (SFCATrec1.key = SFKidos))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:    VERBrec1.genero := masc

    C2:    true
      C3:    ((ALOVERBrec1.CONJclases * [CONJ1]<>[]) and
             (SFCATrec1.key = SFKados))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:    ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) and
             (SFCATrec1.key = SFKidos))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:    VERBrec1.genero := neutro

    C2:    true
      C3:    ((ALOVERBrec1.CONJclases * [CONJ1]<>[]) and
             (SFCATrec1.key = SFKadas))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:    ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) and
             (SFCATrec1.key = SFKidas))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:    VERBrec1.genero := fem
  A1:    VERBrec1.numero := plural
A0:    VERBrec1.modo := PtcPas

C0:    nadaCLASE IN ALOVERBrec1.Aloclases
  C1:    true
    C2:    true
      C3:    ((ALOVERBrec1.CONJclases * [CONJ1]<>[]) and
             (SFCATrec1.key = SFKados))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:    ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) and
             (SFCATrec1.key = SFKidos))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:    VERBrec1.genero := masc

    C2:    true
      C3:    ((ALOVERBrec1.CONJclases * [CONJ1]<>[]) and
             (SFCATrec1.key = SFKados))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:    ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) and
             (SFCATrec1.key = SFKidos))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:    VERBrec1.genero := neutro

    C2:    true
      C3:    ((ALOVERBrec1.CONJclases * [CONJ1]<>[]) and
             (SFCATrec1.key = SFKadas))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:    ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) and
             (SFCATrec1.key = SFKidas))
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:    VERBrec1.genero := fem
  A1:    VERBrec1.numero := plural
A0:    VERBrec1.modo := PtcPas


decomp: 

C0:    (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.modo = PtcPas)
  C1:    VERBrec1.numero = plural
    C2:    VERBrec1.genero = masc
      C3:    (VERBrec1.CONJclases * [CONJ1]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKados
      C3:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKidos                 
    A2:     @

    C2:    VERBrec1.genero = neutro
      C3:    (VERBrec1.CONJclases * [CONJ1]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKados
      C3:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKidos                 
    A2:     @

    C2:    VERBrec1.genero = fem
      C3:    (VERBrec1.CONJclases * [CONJ1]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKadas
      C3:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKidas                 
    A2:     @
  A1:     @
A0:    ALOVERBrec1.modo := PtcPas

C0:    (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.modo = PtcPas)
  C1:    VERBrec1.numero = plural
    C2:    VERBrec1.genero = masc
      C3:    (VERBrec1.CONJclases * [CONJ1]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKados
      C3:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKidos                 
    A2:     @

    C2:    VERBrec1.genero = neutro
      C3:    (VERBrec1.CONJclases * [CONJ1]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKados
      C3:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKidos                 
    A2:     @

    C2:    VERBrec1.genero = fem
      C3:    (VERBrec1.CONJclases * [CONJ1]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKadas
      C3:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[])
      A3:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
             SFCATrec1.key := SFKidas                 
    A2:     @
  A1:     @
A0:    ALOVERBrec1.modo := PtcPas
&


{---------------------------}

$RL 21
 { gerundio } 

%Gerundio

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.modo = Gerundio
  C1:  ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
       (SFCATrec1.key = SFKando))
  A1:  VERBrec1 := copyT_alotoverb(ALOVERBrec1)
  C1:  ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
       (SFCATrec1.key = SFKiendo))
  A1:  VERBrec1 := copyT_alotoverb(ALOVERBrec1)
A0:  VERBrec1.modo := Gerundio  

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:  ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
       (SFCATrec1.key = SFKando))
  A1:  VERBrec1 := copyT_alotoverb(ALOVERBrec1)
  C1:  ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
       (SFCATrec1.key = SFKiendo))
  A1:  VERBrec1 := copyT_alotoverb(ALOVERBrec1)
A0:  VERBrec1.modo := Gerundio  


decomp: 

C0:  (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.modo = Gerundio)
  C1:    (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
  A1:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
         SFCATrec1.key := SFKando
  C1:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
  A1:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
         SFCATrec1.key := SFKiendo
A0:    ALOVERBrec1.modo := Gerundio

C0:  (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.modo = Gerundio)
  C1:    (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
  A1:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
         SFCATrec1.key := SFKando
  C1:    (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
  A1:    ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
         SFCATrec1.key := SFKiendo
A0:    ALOVERBrec1.modo := Gerundio
&

{---------------------------}


$RL 25
{ `1st ps.sg. all tenses` }

 { PresInd }

%PresIndSG1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente  
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.numero = singular
      C3:   ALOVERBrec1.persona = 1
        C4:   ALOVERBrec1.futuro = nofuturo
     C5: ((ALOVERBrec1.CONJclases * [CONJ1,CONJ2,CONJ3,CONJ4,CONJ5,CONJ6,CONJ9]<>[]) and
              (SFCATrec1.key = SFKo))
          A5:  VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.futuro := nofuturo
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente  

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
       C5:  ((ALOVERBrec1.CONJclases * [CONJ1,CONJ2,CONJ3,CONJ4,CONJ5,CONJ6,CONJ9]<>[]) and
            (SFCATrec1.key = SFKo))
          A5:  VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.futuro := nofuturo
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente  


decomp:

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 1
        C4:   VERBrec1.futuro = nofuturo
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ2,CONJ3,CONJ4,CONJ5,CONJ6,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKo    
        A4:   ALOVERBrec1.futuro := nofuturo
      A3:   ALOVERBrec1.persona := 1
    A2:   ALOVERBrec1.numero := singular
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 1
        C4:   VERBrec1.futuro = nofuturo
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ2,CONJ3,CONJ4,CONJ5,CONJ6,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKo    
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @  
&


$RL 23
 { PresSubj }

%PresSubjSG1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   ALOVERBrec1.numero = singular
      C3:   ALOVERBrec1.persona = 1
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and 
              (SFCATrec1.key = SFKe))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKa))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and 
              (SFCATrec1.key = SFKe))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKa))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 1
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKe
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKa
      A3:   ALOVERBrec1.persona := 1
    A2:   ALOVERBrec1.tiempo := Presente
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 1
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKe
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKa
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 23
 { Imperf }

%ImperfSG1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.aspecto = imperfectivo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKaba))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKi1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1 
      A3:   VERBrec1.numero := singular  
    A2:    VERBrec1.aspecto := imperfectivo
  A1:    VERBrec1.modo := Indicativo
A0:     VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKaba))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKi1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1 
      A3:   VERBrec1.numero := singular  
    A2:    VERBrec1.aspecto := imperfectivo
  A1:    VERBrec1.modo := Indicativo
A0:     VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo  = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKaba
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1a
        A4:    @ 
      A3:    @  
    A2:   ALOVERBrec1.aspecto := imperfectivo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo  = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKaba
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1a
        A4:    @ 
      A3:    @  
    A2:    @
  A1:    @
A0:    @
&


$RL 27
 { PD }

%PDsg1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.aspecto = perfectivo
      C3:   true
        C4:   ALOVERBrec1.persona = 1
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKe1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[]) and
                (SFCATrec1.key = SFKi1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ9]<>[]) and       { "sterk" }
                (SFCATrec1.key = SFKe))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKe1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[]) and
                (SFCATrec1.key = SFKi1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ9] <>[]) and       { "sterk" }
                (SFCATrec1.key = SFKe))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKe1
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1
          C5:   (VERBrec1.CONJclases * [CONJ9]<>[]) 
                                                                    { "sterk" }
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKe
        A4:   ALOVERBrec1.persona := 1
      A3:    @
    A2:   ALOVERBrec1.aspecto := perfectivo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKe1
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1
          C5:   (VERBrec1.CONJclases * [CONJ9]<>[]) 
                                                                    { "sterk" }
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKe
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 24
 { SubjPas }

%SubjPasSG1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Subjuntivo
    C1:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKara))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKiera))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C1:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKara))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKiera))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C1:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 1
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKara
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKiera
      A3:    @
    A2:    @
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C1:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 1
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKara
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKiera
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 24
 { SubjPasa }

%SubjPasaSG1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKase))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKiese))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKase))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKiese))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 1
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKase
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKiese
      A3:    @
    A2:    @
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 1
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKase
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKiese
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 25
 { Futuro }

%FuturoSG1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.futuro = sifuturo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKare1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4] <>[]) and
                (SFCATrec1.key = SFKere1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKire1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKare1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKere1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKire1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKare1
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKere1
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKire1
        A4:    @
      A3:    @
    A2:    ALOVERBrec1.futuro := sifuturo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKare1
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKere1
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKire1
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 27
 { Condic }

%CondicSG1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.futuro = sifuturo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKari1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKeri1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKiri1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKari1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKeri1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKiri1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKari1a 
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKeri1a
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiri1a
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.futuro := sifuturo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKari1a 
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKeri1a
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiri1a
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


{-------------------------}

$RL 25
{ `2nd ps.sg. all tenses` }

 { PresInd }

%PresIndSG2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.numero = singular
      C3:   ALOVERBrec1.persona = 2
        C4:   ALOVERBrec1.futuro = nofuturo
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                 (SFCATrec1.key = SFKas))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                 (SFCATrec1.key = SFKes))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.futuro := nofuturo
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                 (SFCATrec1.key = SFKas))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                 (SFCATrec1.key = SFKes))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.futuro := nofuturo
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 2
        C4:   VERBrec1.futuro = nofuturo
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKas
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKes
        A4:   ALOVERBrec1.futuro := nofuturo
      A3:   ALOVERBrec1.persona := 2
    A2:   ALOVERBrec1.numero := singular
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 2
        C4:   VERBrec1.futuro = nofuturo
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKas
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKes
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 23
 { PresSubj }

%PresSubjSG2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   ALOVERBrec1.numero = singular
      C3:   ALOVERBrec1.persona = 2
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKes))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKas))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKes))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])and
              (SFCATrec1.key = SFKas))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 2
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKes
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKas
      A3:   ALOVERBrec1.persona := 2
    A2:   ALOVERBrec1.numero := singular
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 2
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKes
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKas
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 23
 { Imperf }

%ImperfSG2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.aspecto = imperfectivo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKabas))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKi1as))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.aspecto := imperfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKabas))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKi1as))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.aspecto := imperfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKabas
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1as
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.aspecto := imperfectivo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKabas
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1as
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 27
 { PD }

%PDsg2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.aspecto = perfectivo
      C3:   true
        C4:   ALOVERBrec1.persona = 2
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKaste))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[]) and
                (SFCATrec1.key = SFKiste))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ9]<>[]) and
                                                                     { "sterk" }
                (SFCATrec1.key = SFKiste))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKaste))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[]) and
                (SFCATrec1.key = SFKiste))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ9]<>[]) and
                                                                     { "sterk" }
                (SFCATrec1.key = SFKiste))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKaste
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiste
          C5:   (VERBrec1.CONJclases * [CONJ9]<>[]) 
                                                                     { "sterk" }
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiste
        A4:   ALOVERBrec1.persona := 2
      A3:    @
    A2:   ALOVERBrec1.aspecto := perfectivo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKaste
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiste
          C5:   (VERBrec1.CONJclases * [CONJ9]<>[]) 
                                                                     { "sterk" }
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiste
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 24
 { SubjPas }

%SubjPasSG2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKaras))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKieras))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKaras))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKieras))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 2
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKaras
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKieras
      A3:    @
    A2:    @
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 2
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKaras
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKieras
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 24 
 { SubjPasa }

%SubjPasaSG2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKases))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKieses))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKases))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKieses))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 2
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKases
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKieses
      A3:    @
    A2:    @
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 2
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKases
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKieses
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 25
 { Futuro }

%FuturoSG2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.futuro = sifuturo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKara1s))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKera1s))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKira1s))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKara1s))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKera1s))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKira1s))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKara1s
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKera1s
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKira1s
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.futuro := sifuturo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKara1s
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKera1s
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKira1s
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 25
 { Condic }

%CondicSG2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.futuro = sifuturo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKari1as))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKeri1as))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKiri1as))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKari1as))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKeri1as))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKiri1as))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKari1as
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKeri1as
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiri1as
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.futuro := sifuturo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKari1as
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKeri1as
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiri1as
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 26
 { Imperat }

%ImperatSG

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.modo = Imperativo
  C1:   ALOVERBrec1.numero = singular
    C2:   ALOVERBrec1.persona = 2
      C3:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
            (SFCATrec1.key = SFKa)) 
      A3:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
            (SFCATrec1.key = SFKe))
      A3:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:   VERBrec1.persona := 2
  A1:   VERBrec1.numero := singular
A0:   VERBrec1.modo := Imperativo

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
            (SFCATrec1.key = SFKa)) 
      A3:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
            (SFCATrec1.key = SFKe))
      A3:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:   VERBrec1.persona := 2
  A1:   VERBrec1.numero := singular
A0:   VERBrec1.modo := Imperativo


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.modo = Imperativo)
  C1:   VERBrec1.numero = singular
    C2:   VERBrec1.persona = 2
      C3:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
      A3:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
            SFCATrec1.key := SFKa
      C3:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
      A3:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
            SFCATrec1.key := SFKe
    A2:   ALOVERBrec1.persona := 2
  A1:   ALOVERBrec1.numero := singular
A0:   ALOVERBrec1.modo := Imperativo

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.modo = Imperativo)
  C1:   VERBrec1.numero = singular
    C2:   VERBrec1.persona = 2
      C3:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
      A3:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
            SFCATrec1.key := SFKa
      C3:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
      A3:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
            SFCATrec1.key := SFKe
    A2:    @
  A1:    @
A0:    @
&


{------------------------}

$RL 25
{ `3rd ps.sg. all tenses` }

 { PresInd }

%PresIndSG3

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.numero = singular
      C3:   ALOVERBrec1.persona = 3
        C4:   ALOVERBrec1.futuro = nofuturo
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKa))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKe))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.futuro := nofuturo
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKa))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKe))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.futuro := nofuturo
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 3
        C4:   VERBrec1.futuro = nofuturo
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKa
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKe
        A4:   ALOVERBrec1.futuro := nofuturo
      A3:   ALOVERBrec1.persona := 3
    A2:   ALOVERBrec1.numero := singular
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 3
        C4:   VERBrec1.futuro = nofuturo
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKa
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKe
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 23
 { PresSubj }

%PresSubjSG3

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   ALOVERBrec1.numero = singular
      C3:   ALOVERBrec1.persona = 3
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKe))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKa))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKe))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKa))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 3
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKe
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKa
      A3:   ALOVERBrec1.persona := 3
    A2:   ALOVERBrec1.numero := singular
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 3
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKe
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKa
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 23
 { Imperf }

%ImperfSG3

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.aspecto = imperfectivo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKaba))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKi1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.aspecto := imperfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKaba))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKi1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.aspecto := imperfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKaba
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1a
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.aspecto := imperfectivo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKaba
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1a
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 27
 { PD }

%PDsg3

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.aspecto = perfectivo
      C3:   true
        C4:   ALOVERBrec1.persona = 3
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKo1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[]) and
                (SFCATrec1.key = SFKio1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ9]<>[]) and
                                                                    { "sterk" }
                (SFCATrec1.key = SFKo))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKo1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[]) and
                (SFCATrec1.key = SFKio1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ9]<>[]) and
                                                                    { "sterk" }
                (SFCATrec1.key = SFKo))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKo1
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKio1
          C5:   (VERBrec1.CONJclases * [CONJ9]<>[]) 
                                                                    { "sterk" }
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKo
        A4:   ALOVERBrec1.persona := 3
      A3:    @
    A2:   ALOVERBrec1.aspecto := perfectivo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKo1
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKio1
          C5:   (VERBrec1.CONJclases * [CONJ9]<>[]) 
                                                                    { "sterk" }
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKo
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 24
 { SubjPas }

%SubjPasSG3

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKara))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKiera))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKara))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKiera))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 3
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKara
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKiera
      A3:    @
    A2:    @
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 3
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKara
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKiera
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 24
 { SubjPasa }

%SubjPasaSG3

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKase))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKiese))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKase))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKiese))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := singular
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 3
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKase
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKiese
      A3:    @
    A2:    @
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = singular
      C3:   VERBrec1.persona = 3
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKase
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKiese
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 25
 { Futuro }

%FuturoSG3

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.futuro = sifuturo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKara1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKera1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKira1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKara1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKera1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKira1))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKara1
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKera1  
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKira1
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.futuro := sifuturo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKara1
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKera1  
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKira1
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 27
 { Condic }

%CondicSG3

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.futuro = sifuturo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKari1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKeri1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKiri1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKari1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKeri1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKiri1a))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := singular
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKari1a
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKeri1a
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiri1a
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.futuro := sifuturo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = singular
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKari1a
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKeri1a
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiri1a
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


{----------------------}

$RL 27
{ `1st ps.pl. all tenses` }

 { PresInd }

%PresIndPL1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.numero = plural
      C3:   ALOVERBrec1.persona = 1
        C4:   ALOVERBrec1.futuro = nofuturo
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKamos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKemos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKimos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.futuro := nofuturo
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKamos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKemos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKimos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.futuro := nofuturo
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 1
        C4:   VERBrec1.futuro = nofuturo
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKamos
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKemos
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKimos
        A4:   ALOVERBrec1.futuro := nofuturo
      A3:   ALOVERBrec1.persona := 1
    A2:   ALOVERBrec1.numero := plural
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 1
        C4:   VERBrec1.futuro = nofuturo
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKamos
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKemos
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKimos
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 23
 { PresSubj }

%PresSubjPL1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   ALOVERBrec1.numero = plural
      C3:   ALOVERBrec1.persona = 1
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKemos))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKamos))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKemos))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKamos))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 1
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKemos
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKamos
      A3:   ALOVERBrec1.persona := 1
    A2:    ALOVERBrec1.numero := plural
  A1:    ALOVERBrec1.modo := Subjuntivo
A0:    ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 1
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKemos
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKamos
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 23
 { Imperf }

%ImperfPL1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.aspecto = imperfectivo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKa1bamos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKi1amos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.aspecto := imperfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKa1bamos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKi1amos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.aspecto := imperfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKa1bamos
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1amos
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.aspecto := imperfectivo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKa1bamos
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1amos
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 26
 { PD }

%PDpl1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.aspecto = perfectivo
      C3:   true
        C4:   ALOVERBrec1.persona = 1
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKamos))
         A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)

          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKimos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKamos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKimos))           
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKamos
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKimos                  { bevat ook "sterk"}
        A4:   ALOVERBrec1.persona := 1
      A3:    @
    A2:   ALOVERBrec1.aspecto := perfectivo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKamos
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKimos                  { bevat ook "sterk"}
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 24
 { SubjPas }

%SubjPasPL1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   ALOVERBrec1.persona = 1
      C3:   ALOVERBrec1.numero = plural
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKa1ramos))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKie1ramos))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKa1ramos))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKie1ramos))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 1
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKa1ramos
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKie1ramos
      A3:    @
    A2:    @
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 1
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKa1ramos
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKie1ramos
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 24
 { SubjPasa }

%SubjPasaPL1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   ALOVERBrec1.persona = 1
      C3:   ALOVERBrec1.numero = plural
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKa1semos))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKie1semos))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKa1semos))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKie1semos))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 1
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 1
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKa1semos
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKie1semos
      A3:    @
    A2:    @
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 1
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKa1semos
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKie1semos
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 25
 { Futuro }

%FuturoPL1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.futuro = sifuturo
      C3:   ALOVERBrec1.persona = 1
        C4:   ALOVERBrec1.numero = plural
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKaremos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKeremos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKiremos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKaremos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKeremos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKiremos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])   
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKaremos
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKeremos
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiremos
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.futuro := sifuturo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])   
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKaremos
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKeremos
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiremos
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 27
 { Condic }

%CondicPL1

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.futuro = sifuturo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKari1amos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKeri1amos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKiri1amos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKari1amos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKeri1amos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKiri1amos))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 1
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKari1amos
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKeri1amos
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiri1amos
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.futuro := sifuturo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 1
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKari1amos
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKeri1amos
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiri1amos
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


{---------------------}

$RL 27
{ `2nd ps.pl. all tenses` }

 { PresInd }

%PresIndPL2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.numero = plural
      C3:   ALOVERBrec1.persona = 2
        C4:   ALOVERBrec1.futuro = nofuturo  
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKa1is))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKe1is))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKi1s))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.futuro := nofuturo
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKa1is))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKe1is))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKi1s))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.futuro := nofuturo
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 2
        C4:  VERBrec1.futuro = nofuturo
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKa1is
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKe1is
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1s
        A4:   ALOVERBrec1.futuro := nofuturo
      A3:   ALOVERBrec1.persona := 2 
    A2:   ALOVERBrec1.numero := plural 
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Presente 

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 2
        C4:  VERBrec1.futuro = nofuturo
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKa1is
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKe1is
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1s
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 23
 { PresSubj }

%PresSubjPL2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente 
  C1:   ALOVERBrec1.modo = Subjuntivo 
    C2:   ALOVERBrec1.numero = plural 
      C3:   ALOVERBrec1.persona = 2
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKe1is))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKa1is))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKe1is))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKa1is))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 2
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKe1is
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKa1is
      A3:   ALOVERBrec1.persona := 2 
    A2:   ALOVERBrec1.numero := plural 
  A1:   ALOVERBrec1.modo := Subjuntivo 
A0:   ALOVERBrec1.tiempo := Presente 

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 2
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKe1is
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKa1is
      A3:    @
    A2:    @
  A1:    @
A0:    @
&



$RL 23
 { Imperf }

%ImperfPL2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.aspecto = imperfectivo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKabais))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKi1ais))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.aspecto := imperfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKabais))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKi1ais))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.aspecto := imperfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKabais
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1ais
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.aspecto := imperfectivo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKabais
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1ais
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 26
 { PD }

%PDpl2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.aspecto = perfectivo
      C3:   true
        C4:   ALOVERBrec1.persona = 2
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKasteis))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKisteis))          
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKasteis))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKisteis))         
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKasteis
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKisteis                { bevat ook "sterk"}
        A4:   ALOVERBrec1.persona := 2
      A3:    @
    A2:   ALOVERBrec1.aspecto := perfectivo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKasteis
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKisteis                { bevat ook "sterk"}
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 24
 { SubjPas }

%SubjPasPL2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKarais))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKierais))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKarais))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKierais))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 2
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKarais
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKierais
      A3:    @
    A2:    @
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 2
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKarais
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKierais
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 24
 { SubjPasa }

%SubjPasaPL2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKaseis))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKieseis))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
              (SFCATrec1.key = SFKaseis))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) and
              (SFCATrec1.key = SFKieseis))
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 2
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 2
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKaseis
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKieseis
      A3:    @
    A2:    @
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 2
        C4:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKaseis
        C4:   (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKieseis
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 25
 { Futuro }

%FuturoPL2

m1: ALOVERB { ALOVERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.futuro = sifuturo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKare1is))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKere1is))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKire1is))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) and
                (SFCATrec1.key = SFKare1is))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) and
                (SFCATrec1.key = SFKere1is))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) and
                (SFCATrec1.key = SFKire1is))
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKare1is
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKere1is
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKire1is
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.futuro := sifuturo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) and (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKare1is
          C5:   (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKere1is
          C5:   (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[])
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKire1is
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


