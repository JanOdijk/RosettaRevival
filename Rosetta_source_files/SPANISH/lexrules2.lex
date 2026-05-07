%SPANISH2
&

$RL 25
 { Condic }

%CondicPL2

m1: ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.futuro = sifuturo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
                (SFCATrec1.key = SFKari1ais)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ])<>[]) AND
                (SFCATrec1.key = SFKeri1ais)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ])
                                                   <>[]) AND
                (SFCATrec1.key = SFKiri1ais)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
                (SFCATrec1.key = SFKari1ais)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ])<>[]) AND
                (SFCATrec1.key = SFKeri1ais)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ])
                                                   <>[]) AND
                (SFCATrec1.key = SFKiri1ais)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 2
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKari1ais
          C5:   (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[] ) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKeri1ais
          C5:   (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiri1ais
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.futuro := sifuturo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 2
          C5:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] ) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKari1ais
          C5:   (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKeri1ais
          C5:   (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[] ) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKiri1ais
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 25
 { Imperat }

%ImperatPL

m1: ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.modo = Imperativo 
  C1:   ALOVERBrec1.numero = plural 
    C2:   ALOVERBrec1.persona = 2 
      C3:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
            (SFCATrec1.key = SFKad)
      A3:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ])
                                                   <>[]) AND
            (SFCATrec1.key = SFKed)
      A3:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:   ((ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ])
                                                <>[]) AND
            (SFCATrec1.key = SFKid)
      A3:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:   VERBrec1.persona := 2
  A1:   VERBrec1.numero := plural
A0:   VERBrec1.modo := Imperativo

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
            (SFCATrec1.key = SFKad)
      A3:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ])
                                                   <>[]) AND
            (SFCATrec1.key = SFKed)
      A3:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      C3:   ((ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ])
                                                <>[]) AND
            (SFCATrec1.key = SFKid)
      A3:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
    A2:   VERBrec1.persona := 2
  A1:   VERBrec1.numero := plural
A0:   VERBrec1.modo := Imperativo


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.modo = Imperativo)
  C1:   VERBrec1.numero = plural
    C2:   VERBrec1.persona = 2
      C3:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
      A3:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
            SFCATrec1.key := SFKad
      C3:   (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[] )
      A3:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
            SFCATrec1.key := SFKed
      C3:   (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[] )
      A3:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
            SFCATrec1.key := SFKid
    A2:   ALOVERBrec1.persona := 2
  A1:   ALOVERBrec1.numero := plural
A0:   ALOVERBrec1.modo := Imperativo

C0:   (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.modo = Imperativo)
  C1:   VERBrec1.numero = plural
    C2:   VERBrec1.persona = 2
      C3:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
      A3:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
            SFCATrec1.key := SFKad
      C3:   (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[] )
      A3:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
            SFCATrec1.key := SFKed
      C3:   (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[] )
      A3:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
            SFCATrec1.key := SFKid
    A2:    @
  A1:    @
A0:    @
&


{---------------------}

$RL 25
{ `3rd ps.pl. all tenses` }

 { PresInd }

%PresIndPL3

m1: ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.numero = plural
      C3:   ALOVERBrec1.persona = 3
        C4:   ALOVERBrec1.futuro = nofuturo
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
                (SFCATrec1.key = SFKan)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ])
                                                        <>[]) AND
                (SFCATrec1.key = SFKen)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.futuro := nofuturo
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
                (SFCATrec1.key = SFKan)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ])
                                                        <>[]) AND
                (SFCATrec1.key = SFKen)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.futuro := nofuturo
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 3
        C4:   VERBrec1.futuro = nofuturo
          C5:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKan
          C5:   (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKen
        A4:   ALOVERBrec1.futuro := nofuturo
      A3:   ALOVERBrec1.persona := 3
    A2:   ALOVERBrec1.numero := plural
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 3
        C4:   VERBrec1.futuro = nofuturo
          C5:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKan
          C5:   (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKen
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 23
 { PresSubj }

%PresSubjPL3

m1: ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   ALOVERBrec1.numero = plural
      C3:   ALOVERBrec1.persona = 3
        C4:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
              (SFCATrec1.key = SFKen)
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ])
                                                    <>[]) AND
              (SFCATrec1.key = SFKan)
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
              (SFCATrec1.key = SFKen)
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ])
                                                         <>[]) AND
              (SFCATrec1.key = SFKan)
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 3
        C4:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] ) 
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKen
        C4:   (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[] )
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKan
      A3:   ALOVERBrec1.persona := 3
    A2:   ALOVERBrec1.numero := plural
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 3
        C4:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
        A4:   SFCATrec1.key := SFKen
        C4:   (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[] )
        A4:   SFCATrec1.key := SFKan
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 23
 { Imperf }

%ImperfPL3

m1: ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.aspecto = imperfectivo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
                (SFCATrec1.key = SFKaban)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ])
                                                        <>[]) AND
                (SFCATrec1.key = SFKi1an)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.aspecto := imperfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
                (SFCATrec1.key = SFKaban)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9])
                                                       <>[]) AND
                (SFCATrec1.key = SFKi1an)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.aspecto := imperfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKaban
          C5:   (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKi1an
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.aspecto := imperfectivo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] ) 
          A5:   SFCATrec1.key := SFKaban
          C5:   (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[] )
          A5:   SFCATrec1.key := SFKi1an
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 26
 { PD }

%PDpl3

m1: ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.aspecto = perfectivo
      C3:   true
        C4:   ALOVERBrec1.persona = 3
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
                (SFCATrec1.key = SFKaron)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5, CONJ9])<>[]) AND
                (SFCATrec1.key = SFKieron)    
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
                (SFCATrec1.key = SFKaron)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5, CONJ9])<>[]) AND
                (SFCATrec1.key = SFKieron)      
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKaron
          C5:   (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKieron                 
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              ALOVERBrec1.persona := 3
      A3:    @
    A2:   ALOVERBrec1.aspecto := perfectivo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKaron
          C5:   (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5, CONJ9] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
                SFCATrec1.key := SFKieron                 
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&

$RL 24
 { SubjPas }

%SubjPasPL3

m1: ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
              (SFCATrec1.key = SFKaran)
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ])<>[]) AND
              (SFCATrec1.key = SFKieran)
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
              (SFCATrec1.key = SFKaran)
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ])<>[]) AND
              (SFCATrec1.key = SFKieran)
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 3
        C4:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKaran
        C4:   (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[] )
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKieran
      A3:    @
    A2:    @
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 3
        C4:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKaran
        C4:   (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[] )
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKieran
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 24
 { SubjPasa }

%SubjPasaPL3

m1: ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Subjuntivo
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
              (SFCATrec1.key = SFKasen)
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ])<>[]) AND
              (SFCATrec1.key = SFKiesen)
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
              (SFCATrec1.key = SFKasen)
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        C4:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ])<>[]) AND
              (SFCATrec1.key = SFKiesen)
        A4:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
      A3:   VERBrec1.persona := 3
    A2:   VERBrec1.numero := plural
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 3
        C4:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKasen
        C4:   (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[] )
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKiesen
      A3:    @
    A2:    @
  A1:   ALOVERBrec1.modo := Subjuntivo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Subjuntivo
    C2:   VERBrec1.numero = plural
      C3:   VERBrec1.persona = 3
        C4:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKasen
        C4:   (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[] )
        A4:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1);
              SFCATrec1.key := SFKiesen
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


 { Futuro }

%FuturoPL3

m1: ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Presente
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.futuro = sifuturo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
                (SFCATrec1.key = SFKara1n)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)

          C5:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ])
                                                        <>[]) AND
                (SFCATrec1.key = SFKera1n)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)

          C5:   ((ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ])<>[]) AND
                (SFCATrec1.key = SFKira1n)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)

        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
                (SFCATrec1.key = SFKara1n)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)

          C5:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ])
                                                        <>[]) AND
                (SFCATrec1.key = SFKera1n)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)

          C5:   ((ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ])<>[]) AND
                (SFCATrec1.key = SFKira1n)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)

        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] ) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
                SFCATrec1.key := SFKara1n
          C5:   (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
                SFCATrec1.key := SFKera1n
          C5:   (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
                SFCATrec1.key := SFKira1n
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.futuro := sifuturo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Presente

C0:   (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Presente)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] ) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
                SFCATrec1.key := SFKara1n
          C5:   (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
                SFCATrec1.key := SFKera1n
          C5:   (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[] )
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
                SFCATrec1.key := SFKira1n
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 27
 { Condic }

%CondicPL3

m1: ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:   ALOVERBrec1.tiempo = Pasado
  C1:   ALOVERBrec1.modo = Indicativo
    C2:   ALOVERBrec1.futuro = sifuturo
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
                (SFCATrec1.key = SFKari1an)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ])<>[]) AND
                (SFCATrec1.key = SFKeri1an)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ])
                                                       <>[]) AND
                (SFCATrec1.key = SFKiri1an)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
                (SFCATrec1.key = SFKari1an)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ])<>[]) AND
                (SFCATrec1.key = SFKeri1an)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
          C5:   ((ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ])
                                                       <>[]) AND
                (SFCATrec1.key = SFKiri1an)
          A5:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
        A4:   VERBrec1.persona := 3
      A3:   VERBrec1.numero := plural
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] ) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
                SFCATrec1.key := SFKari1an
          C5:   (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[] ) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
                SFCATrec1.key := SFKeri1an
          C5:   (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[] ) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
                SFCATrec1.key := SFKiri1an
        A4:    @
      A3:    @
    A2:   ALOVERBrec1.futuro := sifuturo
  A1:   ALOVERBrec1.modo := Indicativo
A0:   ALOVERBrec1.tiempo := Pasado

C0:   (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Pasado)
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   VERBrec1.numero = plural
        C4:   VERBrec1.persona = 3
          C5:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] ) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
                SFCATrec1.key := SFKari1an
          C5:   (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[] ) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
                SFCATrec1.key := SFKeri1an
          C5:   (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[] ) 
          A5:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
                SFCATrec1.key := SFKiri1an
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


{---------------------}

$RL 25
{ infinitivo }

%Infinitivo

m1: ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:   ALOVERBrec1.modo = Infinitivo
  C1:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
        (SFCATrec1.key = SFKar)
  A1:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
  C1:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ])
                                           <>[]) AND       { proveer not! }
        (SFCATrec1.key = SFKer)
  A1:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
  C1:   ((ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ])<>[]) AND
        (SFCATrec1.key = SFKir)
  A1:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
A0:   VERBrec1.modo := Infinitivo

C0:   nadaCLASE IN ALOVERBrec1.Aloclases
  C1:   ((ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ])<>[]) AND
        (SFCATrec1.key = SFKar)
  A1:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
  C1:   ((ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ])
                                           <>[]) AND       { proveer not! }
        (SFCATrec1.key = SFKer)
  A1:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
  C1:   ((ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ])<>[]) AND
        (SFCATrec1.key = SFKir)
  A1:   VERBrec1 := copyT_alotoverb(ALOVERBrec1)
A0:   VERBrec1.modo := Infinitivo


decomp: 

C0:   (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.modo = Infinitivo)
  C1:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
  A1:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
        SFCATrec1.key := SFKar
  C1:   (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[] )  
                                                         { proveer not! }
  A1:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
        SFCATrec1.key := SFKer
  C1:   (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[] )
  A1:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
        SFCATrec1.key := SFKir
A0:   ALOVERBrec1.modo := Infinitivo

C0:   (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.modo = Infinitivo)
  C1:   (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[] )
  A1:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
        SFCATrec1.key := SFKar
  C1:   (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[] )  
                                                         { proveer not! }
  A1:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
        SFCATrec1.key := SFKer
  C1:   (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[] )
  A1:   ALOVERBrec1 := copyT_verbtoalo(VERBrec1); 
        SFCATrec1.key := SFKir
A0:    @
&


{---------------------}
{---------------------}

$NP 
{  `irregular verbs (CONJ0); all tenses` }


{ Inf. }

%InfIRR

M1: SUBVERB { SUBVERBrec1 }[mu1]

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:     true
  C1:     (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
  A1:      @
A0:     VERBrec1.modo := Infinitivo


decomp: 

C0:     VERBrec1.modo = Infinitivo
  C1:     (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
  A1:      @
A0:      @
&


{ PtcPas. }

%PtcpasIRR

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:     true
  C1:     (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
    C2:     true
      C3:     SFCATrec1.key = SFKPtcPasMascSg
      A3:     VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.genero := masc
      C3:     SFCATrec1.key = SFKPtcPasFemSg
      A3:     VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.genero := fem
    A2:     VERBrec1.numero := singular
    C2:     true
      C3:     SFCATrec1.key = SFKPtcPasFemPl
      A3:     VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.genero := fem
      C3:     SFCATrec1.key = SFKPtcPasMascPl 
      A3:     VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.genero := masc
    A2:     VERBrec1.numero := plural
  A1:      @
A0:     VERBrec1.modo := PtcPas


decomp: 

C0:     VERBrec1.modo = PtcPas
  C1:     (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
    C2:     VERBrec1.numero = singular
      C3:     VERBrec1.genero = masc
      A3:     SFCATrec1.key := SFKPtcPasMascSg
      C3:     VERBrec1.genero = fem
      A3:     SFCATrec1.key := SFKPtcPasFemSg
    A2:      @
    C2:     VERBrec1.numero = plural
      C3:     VERBrec1.genero = masc
      A3:     SFCATrec1.key := SFKPtcPasMascPl
      C3:     VERBrec1.genero = fem
      A3:     SFCATrec1.key := SFKPtcPasFemPl 
    A2:      @
  A1:      @
A0:      @
&


$RL 17
{ Gerundio }

%GerundioIRR

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:  true
  C1:  ((SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]) AND
       (SFCATrec1.key = SFKgerundio)
  A1:  VERBrec1 := copyT_subtoverb(SUBVERBrec1)
A0:  VERBrec1.modo := Gerundio


decomp: 

C0:  VERBrec1.modo = Gerundio
  C1:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
  A1:   SFCATrec1.key := SFKgerundio
A0:  @
&


$RL 25
{ PresInd; sg. }

%PresIndIRRsg

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:   true
  C1:   true
    C2:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
      C3:   true
        C4:   SFCATrec1.key = SFK1SgIndPres
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 1

        C4:   SFCATrec1.key = SFK2SgIndPres
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 2

        C4:   SFCATrec1.key = SFK3SgIndPres
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 3

      A3:   VERBrec1.numero := singular
    A2:   @
  A1:  VERBrec1.modo := Indicativo;
       VERBrec1.futuro := nofuturo
A0:  VERBrec1.tiempo := Presente


decomp: 

C0:  VERBrec1.tiempo = Presente
  C1: ((VERBrec1.modo = Indicativo) and (VERBrec1.futuro = nofuturo))
    C2:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
      C3:  VERBrec1.numero = singular
        C4:   VERBrec1.persona = 1
        A4:   SFCATrec1.key := SFK1SgIndPres
        C4:   VERBrec1.persona = 2
        A4:   SFCATrec1.key := SFK2SgIndPres
        C4:   VERBrec1.persona = 3
        A4:   SFCATrec1.key := SFK3SgIndPres
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 23
{ PresInd; pl. }

%PresIndIRRpl

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp:

C0:   true
  C1:   true
    C2:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
      C3:   true
        C4:   SFCATrec1.key = SFK1PlIndPres
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 1

        C4:   SFCATrec1.key = SFK2PlIndPres
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 2

        C4:   SFCATrec1.key = SFK3PlIndPres
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 3

      A3:   VERBrec1.numero := plural
    A2:    @
  A1:   VERBrec1.modo := Indicativo;
        VERBrec1.futuro := nofuturo
A0:   VERBrec1.tiempo := Presente


decomp:

C0:  VERBrec1.tiempo = Presente
  C1:  ((VERBrec1.modo = Indicativo) and (VERBRec1.futuro = nofuturo))
    C2:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
      C3:  VERBrec1.numero = plural
        C4:   VERBrec1.persona = 1
        A4:   SFCATrec1.key := SFK1PlIndPres
        C4:   VERBrec1.persona = 2
        A4:   SFCATrec1.key := SFK2PlIndPres
        C4:   VERBrec1.persona = 3
        A4:   SFCATrec1.key := SFK3PlIndPres
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 25
{ PresSubj; sg. }

%PresSubjIRRsg

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:   true
  C1:   true
    C2:   (SUBVERBrec1.CONJclases * [ CONJ0 ] <>[] )
      C3:   true
        C4:   SFCATrec1.key = SFK1Sg3SubjPres
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 1

        C4:   SFCATrec1.key = SFK2SgSubjPres
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 2

        C4:   SFCATrec1.key = SFK1Sg3SubjPres
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 3

      A3:   VERBrec1.numero := singular
    A2:    @
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:  VERBrec1.tiempo = Presente
  C1:  VERBrec1.modo = Subjuntivo
    C2:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
      C3:  VERBrec1.numero = singular
        C4:   VERBrec1.persona = 1
        A4:   SFCATrec1.key := SFK1Sg3SubjPres
        C4:   VERBrec1.persona = 2
        A4:   SFCATrec1.key := SFK2SgSubjPres
        C4:   VERBrec1.persona = 3
        A4:   SFCATrec1.key := SFK1Sg3SubjPres
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 23
{ PresSubj; pl. }

%PresSubjIRRpl

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp:

C0:   true
  C1:   true
    C2:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
      C3:   true
        C4:   SFCATrec1.key = SFK1PlSubjPres
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 1

        C4:   SFCATrec1.key = SFK2PlSubjPres
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 2

        C4:   SFCATrec1.key = SFK3PlSubjPres
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 3

      A3:   VERBrec1.numero := plural
    A2:    @
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Presente


decomp:

C0:  VERBrec1.tiempo = Presente
  C1:  VERBrec1.modo = Subjuntivo
    C2:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
      C3:  VERBrec1.numero = plural
        C4:   VERBrec1.persona = 1
        A4:   SFCATrec1.key := SFK1PlSubjPres
        C4:   VERBrec1.persona = 2
        A4:   SFCATrec1.key := SFK2PlSubjPres
        C4:   VERBrec1.persona = 3
        A4:   SFCATrec1.key := SFK3PlSubjPres
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 25
{ Imperf; sg. }

%ImperfIRRsg 

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:   true
  C1:   true
    C2:   true
      C3:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
        C4:   true
          C5:   SFCATrec1.key = SFK1Sg3Imperf
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 1

          C5:   SFCATrec1.key = SFK2SgImperf
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 2

          C5:   SFCATrec1.key = SFK1Sg3Imperf
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 3

        A4:    VERBrec1.numero := singular
      A3:    @
    A2:   VERBrec1.aspecto := imperfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:  VERBrec1.tiempo = Pasado
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
        C4:  VERBrec1.numero = singular
          C5:   VERBrec1.persona = 1
          A5:   SFCATrec1.key := SFK1Sg3Imperf
          C5:   VERBrec1.persona = 2
          A5:   SFCATrec1.key := SFK2SgImperf
          C5:   VERBrec1.persona = 3
          A5:   SFCATrec1.key := SFK1Sg3Imperf
        A4:   @
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 23
{ Imperf; pl. }

%ImperfIRRpl

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp:

C0:   true
  C1:   true
    C2:   true
      C3:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
        C4:   true

          C5:   SFCATrec1.key = SFK1PlImperf
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 1

          C5:   SFCATrec1.key = SFK2PlImperf
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 2

          C5:   SFCATrec1.key = SFK3PlImperf
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 3

        A4:   VERBrec1.numero := plural
      A3:    @
    A2:   VERBrec1.aspecto := imperfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp:

C0:  VERBrec1.tiempo = Pasado
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = imperfectivo
      C3:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
        C4:  VERBrec1.numero = plural
          C5:   VERBrec1.persona = 1
          A5:   SFCATrec1.key := SFK1PlImperf
          C5:   VERBrec1.persona = 2
          A5:   SFCATrec1.key := SFK2PlImperf
          C5:   VERBrec1.persona = 3
          A5:   SFCATrec1.key := SFK3PlImperf
        A4:   @
      A3:   @
    A2:   @
  A1:   @
A0:   @
&


$RL 25
{ PD; sg. }

%PDirrSG

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:   true
  C1:   true
    C2:   true
      C3:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
        C4:   true
          C5:   SFCATrec1.key = SFK1SgPD
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 1

          C5:   SFCATrec1.key = SFK2SgPD
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 2

          C5:   SFCATrec1.key = SFK3SgPD
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 3

        A4:   VERBrec1.numero := singular
      A3:    @
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:  VERBrec1.tiempo = Pasado
  C1:  VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
        C4:  VERBrec1.numero = singular
          C5:   VERBrec1.persona = 1
          A5:   SFCATrec1.key := SFK1SgPD
          C5:   VERBrec1.persona = 2
          A5:   SFCATrec1.key := SFK2SgPD
          C5:   VERBrec1.persona = 3
          A5:   SFCATrec1.key := SFK3SgPD
        A4:  @
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 23
{ PD; pl. }

%PDirrPL

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp:

C0:   true
  C1:   true
    C2:   true
      C3:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
        C4:   true
          C5:   SFCATrec1.key = SFK1PlPD
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 1

          C5:   SFCATrec1.key = SFK2PlPD
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 2

          C5:   SFCATrec1.key = SFK3PlPD
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 3

        A4:   VERBrec1.numero := plural
      A3:    @
    A2:   VERBrec1.aspecto := perfectivo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp:

C0:  VERBrec1.tiempo = Pasado
  C1:  VERBrec1.modo = Indicativo
    C2:   VERBrec1.aspecto = perfectivo
      C3:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
        C4:  VERBrec1.numero = plural
          C5:   VERBrec1.persona = 1
          A5:   SFCATrec1.key := SFK1PlPD
          C5:   VERBrec1.persona = 2
          A5:   SFCATrec1.key := SFK2PlPD
          C5:   VERBrec1.persona = 3
          A5:   SFCATrec1.key := SFK3PlPD
        A4:  @
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 25
{ SubjPas; sg. }

%SubjPasIRRsg

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:   true
  C1:   true
    C2:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
      C3:   true
        C4:   SFCATrec1.key = SFK1Sg3SubjPas
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 1

        C4:   SFCATrec1.key = SFK2SgSubjPas
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 2

        C4:   SFCATrec1.key = SFK1Sg3SubjPas
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 3

      A3:   VERBrec1.numero := singular
    A2:    @
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:  VERBrec1.tiempo = Pasado
  C1:   VERBrec1.modo = Subjuntivo
    C2:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
      C3:  VERBrec1.numero = singular
        C4:   VERBrec1.persona = 1
        A4:   SFCATrec1.key := SFK1Sg3SubjPas
        C4:   VERBrec1.persona = 2
        A4:   SFCATrec1.key := SFK2SgSubjPas
        C4:   VERBrec1.persona = 3
        A4:   SFCATrec1.key := SFK1Sg3SubjPas
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 23
{ SubjPas; pl. }

%SubjPasIRRpl

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp:

C0:   true
  C1:   true
    C2:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
      C3:   true
        C4:   SFCATrec1.key = SFK1PlSubjPas
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 1

        C4:   SFCATrec1.key = SFK2PlSubjPas
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 2

        C4:   SFCATrec1.key = SFK3PlSubjPas
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 3

      A3:   VERBrec1.numero := plural
    A2:    @
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp:

C0:  VERBrec1.tiempo = Pasado
  C1:   VERBrec1.modo = Subjuntivo
    C2:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
      C3:  VERBrec1.numero = plural
        C4:   VERBrec1.persona = 1
        A4:   SFCATrec1.key := SFK1PlSubjPas
        C4:   VERBrec1.persona = 2
        A4:   SFCATrec1.key := SFK2PlSubjPas
        C4:   VERBrec1.persona = 3
        A4:   SFCATrec1.key := SFK3PlSubjPas
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 25
{ SubjPasa; sg. }

%SubjPasaIRRsg

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:   true
  C1:   true
    C2:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
      C3:   true
        C4:   SFCATrec1.key = SFK1Sg3SubjPasa
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 1

        C4:   SFCATrec1.key = SFK2SgSubjPasa
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 2

        C4:   SFCATrec1.key = SFK1Sg3SubjPasa
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 3

      A3:   VERBrec1.numero := singular
    A2:    @
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:  VERBrec1.tiempo = Pasado
  C1:   VERBrec1.modo = Subjuntivo
    C2:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
      C3:  VERBrec1.numero = singular
        C4:   VERBrec1.persona = 1
        A4:   SFCATrec1.key := SFK1Sg3SubjPasa
        C4:   VERBrec1.persona = 2
        A4:   SFCATrec1.key := SFK2SgSubjPasa
        C4:   VERBrec1.persona = 3
        A4:   SFCATrec1.key := SFK1Sg3SubjPasa
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 23
{ SubjPasa; pl. }

%SubjPasaIRRpl

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp:

C0:   true
  C1:   true
    C2:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
      C3:   true
        C4:   SFCATrec1.key = SFK1PlSubjPasa
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 1

        C4:   SFCATrec1.key = SFK2PlSubjPasa
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 2

        C4:   SFCATrec1.key = SFK3PlSubjpasa
        A4:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
              VERBrec1.persona := 3

      A3:   VERBrec1.numero := plural
    A2:    @
  A1:   VERBrec1.modo := Subjuntivo
A0:   VERBrec1.tiempo := Pasado


decomp:

C0:  VERBrec1.tiempo = Pasado
  C1:   VERBrec1.modo = Subjuntivo
    C2:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
      C3:  VERBrec1.numero = plural
        C4:   VERBrec1.persona = 1
        A4:   SFCATrec1.key := SFK1PlSubjPasa
        C4:   VERBrec1.persona = 2
        A4:   SFCATrec1.key := SFK2PlSubjPasa
        C4:   VERBrec1.persona = 3
        A4:   SFCATrec1.key := SFK3PlSubjpasa
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 25
{ Futuro; sg. }

%FuturoIRRsg

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:   true
  C1:   true
    C2:   true
      C3:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
        C4:   true
          C5:   SFCATrec1.key = SFK1SgFut
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 1

          C5:   SFCATrec1.key = SFK2SgFut
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 2

          C5:   SFCATrec1.key = SFK3SgFut
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 3

        A4:   VERBrec1.numero := singular
      A3:    @
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp: 

C0:  VERBrec1.tiempo = Presente
  C1:   VERBrec1.modo = Indicativo
    C2:  VERBrec1.futuro = sifuturo
      C3:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
        C4:  VERBrec1.numero = singular
          C5:   VERBrec1.persona = 1
          A5:   SFCATrec1.key := SFK1SgFut
          C5:   VERBrec1.persona = 2
          A5:   SFCATrec1.key := SFK2SgFut
          C5:   VERBrec1.persona = 3
          A5:   SFCATrec1.key := SFK3SgFut
        A4:  @
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 23
{ Futuro; pl. }

%FuturoIRRpl

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp:

C0:   true
  C1:   true
    C2:   true
      C3:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
        C4:   true
          C5:   SFCATrec1.key = SFK1PlFut
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 1

          C5:   SFCATrec1.key = SFK2PlFut
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 2

          C5:   SFCATrec1.key = SFK3PlFut
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 3

        A4:   VERBrec1.numero := plural
      A3:    @
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Presente


decomp:

C0:  VERBrec1.tiempo = Presente
  C1:   VERBrec1.modo = Indicativo
    C2:  VERBrec1.futuro = sifuturo
      C3:  (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
        C4:  VERBrec1.numero = plural
          C5:   VERBrec1.persona = 1
          A5:   SFCATrec1.key := SFK1PlFut
          C5:   VERBrec1.persona = 2
          A5:   SFCATrec1.key := SFK2PlFut
          C5:   VERBrec1.persona = 3
          A5:   SFCATrec1.key := SFK3PlFut
        A4:  @
      A3:  @
    A2:  @
  A1:  @
A0:  @
&


$RL 25
{ Condic; sg. }

%CondIRRsg

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:   true
  C1:   true
    C2:   true
      C3:   (SUBVERBrec1.CONJclases * [ CONJ0 ])<>[]
        C4:   true
          C5:   SFCATrec1.key = SFK1Sg3Cond
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 1

          C5:   SFCATrec1.key = SFK2SgCond
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 2

          C5:   SFCATrec1.key = SFK1Sg3Cond
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 3

        A4:   VERBrec1.numero := singular
      A3:    @
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp: 

C0:   VERBrec1.tiempo = Pasado
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
        C4:   VERBrec1.numero = singular
          C5:   VERBrec1.persona = 1
          A5:   SFCATrec1.key := SFK1Sg3Cond
          C5:   VERBrec1.persona = 2
          A5:   SFCATrec1.key := SFK2SgCond
          C5:   VERBrec1.persona = 3
          A5:   SFCATrec1.key := SFK1Sg3Cond
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 23
{ Condic; pl. }

%CondIRRpl

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp:

C0:   true
  C1:   true
    C2:   true
      C3:  (SUBVERBrec1.CONJclases * [ CONJ0 ] <>[] )
        C4:   true
          C5:   SFCATrec1.key = SFK1PlCond
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 1

          C5:   SFCATrec1.key = SFK2PlCond
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 2

          C5:   SFCATrec1.key = SFK3PlCond
          A5:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
                VERBrec1.persona := 3

        A4:   VERBrec1.numero := plural
      A3:  @
    A2:   VERBrec1.futuro := sifuturo
  A1:   VERBrec1.modo := Indicativo
A0:   VERBrec1.tiempo := Pasado


decomp:

C0:   VERBrec1.tiempo = Pasado
  C1:   VERBrec1.modo = Indicativo
    C2:   VERBrec1.futuro = sifuturo
      C3:   (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
        C4:   VERBrec1.numero = plural
          C5:   VERBrec1.persona = 1
          A5:   SFCATrec1.key := SFK1PlCond
          C5:   VERBrec1.persona = 2
          A5:   SFCATrec1.key := SFK2PlCond
          C5:   VERBrec1.persona = 3
          A5:   SFCATrec1.key := SFK3PlCond
        A4:    @
      A3:    @
    A2:    @
  A1:    @
A0:    @
&


$RL 23
{ Imperat }

%ImperatIRR

M1: SUBVERB { SUBVERBrec1 }[mu1]
M2: SFCAT { SFCATrec1 }

M:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:   true
  C1:   true
    C2:   (SUBVERBrec1.CONJclases * [ CONJ0 ] <>[] )
      C3:   SFCATrec1.key = SFKsgImperat
      A3:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
            VERBrec1.numero := singular

      C3:   SFCATrec1.key = SFKplImperat
      A3:   VERBrec1 := copyT_subtoverb(SUBVERBrec1);
            VERBrec1.numero := plural

    A2:    @
  A1:    VERBrec1.persona := 2
A0:   VERBrec1.modo := Imperativo


decomp: 

C0:   VERBrec1.modo = Imperativo
  C1:   VERBrec1.persona = 2
    C2:   (VERBrec1.CONJclases * [ CONJ0 ] <>[] )
      C3:   VERBrec1.numero = singular
      A3:   SFCATrec1.key := SFKsgImperat
      C3:   VERBrec1.numero = plural
      A3:   SFCATrec1.key := SFKplImperat
    A2:    @
  A1:    @
A0:    @
&


{------------------------------------------------------}


$NP
{ The following rules are needed to make every form without stem-change change
  category:  ALOVERB ---> SUBVERB.                                             }

{ nada/diftong }

%ALOSUBnadadiftong

m1: SUBVERB { SUBVERBrec1 }[mu1]
m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp:

C0:    SUBVERBrec1.Aloclases = [nadaCLASE]
A0:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)
C0:    SUBVERBrec1.Aloclases = [diftongCLASE]
  C1:    true
    C2:    true
      C3:    true
        C4:    true
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 1 
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 2
        A4:    ALOVERBrec1.futuro := nofuturo
      A3:    ALOVERBrec1.numero := plural
    A2:    ALOVERBrec1.modo := Indicativo
  A1:    ALOVERBrec1.tiempo := Presente
  C1:    true
    C2:    true
      C3:    true
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 1
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 2
      A3:    ALOVERBrec1.numero := plural
    A2:    ALOVERBrec1.modo := Subjuntivo
  A1:    ALOVERBrec1.tiempo := Presente
  C1:    true
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.numero := plural
    A2:    ALOVERBrec1.persona := 2  
  A1:    ALOVERBrec1.modo := Imperativo
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := Gerundio
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := PtcPas
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := Infinitivo
  C1:    true
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.futuro := sifuturo
    A2:    ALOVERBrec1.modo := Indicativo
  A1:    ALOVERBrec1.tiempo := Presente
  C1:    true
    C2:    true
    A2:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
           ALOVERBrec1.modo := Subjuntivo
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.futuro := sifuturo
      C3:    true
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 1
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 2
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 3
      A3:    ALOVERBrec1.aspecto := perfectivo
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.aspecto := imperfectivo
    A2:    ALOVERBrec1.modo := Indicativo
  A1:    ALOVERBrec1.tiempo := Pasado
A0:     @


decomp: 

C0:    ALOVERBrec1.Aloclases = [nadaCLASE]
A0:     @
C0:    ALOVERBrec1.Aloclases = [diftongCLASE] 
  C1:    ALOVERBrec1.tiempo = Presente
    C2:    ALOVERBrec1.modo = Indicativo
      C3:    ALOVERBrec1.numero = plural
        C4:    ALOVERBrec1.futuro = nofuturo
          C5:    ALOVERBrec1.persona = 1 
          A5:     @
          C5:    ALOVERBrec1.persona = 2
          A5:     @
        A4:     @
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.tiempo = Presente
    C2:    ALOVERBrec1.modo = Subjuntivo
      C3:    ALOVERBrec1.numero = plural
        C4:    ALOVERBrec1.persona = 1
        A4:     @
        C4:    ALOVERBrec1.persona = 2
        A4:     @
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.modo = Imperativo
    C2:    ALOVERBrec1.persona = 2  
      C3:    ALOVERBrec1.numero = plural
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.modo = Gerundio
  A1:     @
  C1:    ALOVERBrec1.modo = PtcPas
  A1:     @
  C1:    ALOVERBrec1.modo = Infinitivo
  A1:     @
  C1:    ALOVERBrec1.tiempo = Presente
    C2:   ALOVERBrec1.modo = Indicativo
      C3:    ALOVERBrec1.futuro = sifuturo
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.tiempo = Pasado
    C2:    ALOVERBrec1.modo = Subjuntivo
    A2:     @
    C2:    ALOVERBrec1.modo = Indicativo
      C3:    ALOVERBrec1.futuro = sifuturo
      A3:     @
      C3:    ALOVERBrec1.aspecto = perfectivo
        C4:    ALOVERBrec1.persona = 1
        A4:     @
        C4:    ALOVERBrec1.persona = 2
        A4:     @
        C4:    ALOVERBrec1.persona = 3
        A4:     @
      A3:     @
      C3:    ALOVERBrec1.aspecto = imperfectivo
      A3:     @
    A2:     @
  A1:     @
A0:     @
&


$RL 31
{ irrMedek }

%ALOSUBirrMedek

m1: SUBVERB { SUBVERBrec1 }[mu1]
m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:   SUBVERBrec1.Aloclases = [irrMedekCLASE]
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 1
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 2
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 3
        A4:   ALOVERBrec1.futuro := nofuturo
      A3:   ALOVERBrec1.numero := plural
      C3:   true
        C4:   true
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 2
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 3
        A4:   ALOVERBrec1.futuro := nofuturo
      A3:   ALOVERBrec1.numero := singular
    A2:   ALOVERBrec1.modo := Indicativo
  A1:   ALOVERBrec1.tiempo := Presente
  C1:   true
  A1:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
        ALOVERBrec1.modo := Infinitivo
  C1:   true
  A1:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
        ALOVERBrec1.modo := PtcPas
  C1:   true
  A1:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
        ALOVERBrec1.modo := Gerundio
  C1:   true
    C2:   true
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.numero := singular
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.numero := plural
    A2:   ALOVERBrec1.persona := 2  
  A1:   ALOVERBrec1.modo := Imperativo
  C1:   true
    C2:   true
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.futuro := sifuturo
    A2:   ALOVERBrec1.modo := Indicativo
  A1:   ALOVERBrec1.tiempo := Presente
  C1:   true
    C2:   true
    A2:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
          ALOVERBrec1.modo := Subjuntivo
    C2:   true
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.futuro := sifuturo
      C3:   true
        C4:   true
        A4:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
              ALOVERBrec1.persona := 1
        C4:   true
        A4:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
              ALOVERBrec1.persona := 2
        C4:   true
        A4:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
              ALOVERBrec1.persona := 3
      A3:   ALOVERBrec1.aspecto := perfectivo
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.aspecto := imperfectivo
    A2:   ALOVERBrec1.modo := Indicativo
  A1:   ALOVERBrec1.tiempo := Pasado
A0:    @


decomp: 

C0:   ALOVERBrec1.Aloclases = [irrMedekCLASE]
  C1:   ALOVERBrec1.tiempo = Presente
    C2:   ALOVERBrec1.modo = Indicativo
      C3:   ALOVERBrec1.numero = plural
        C4:   ALOVERBrec1.futuro = nofuturo
          C5:   ALOVERBrec1.persona = 1
          A5:    @
          C5:   ALOVERBrec1.persona = 2
          A5:    @
          C5:   ALOVERBrec1.persona = 3
          A5:    @
        A4:    @
      A3:    @
      C3:   ALOVERBrec1.numero = singular
        C4:   ALOVERBrec1.futuro = nofuturo
          C5:   ALOVERBrec1.persona = 2
          A5:    @
          C5:   ALOVERBrec1.persona = 3
          A5:    @
        A4:    @
      A3:    @
    A2:    @
  A1:    @
  C1:   ALOVERBrec1.modo = Infinitivo
  A1:    @
  C1:   ALOVERBrec1.modo = PtcPas
  A1:    @
  C1:   ALOVERBrec1.modo = Gerundio
  A1:    @
  C1:   ALOVERBrec1.modo = Imperativo
    C2:   ALOVERBrec1.persona = 2
      C3:   ALOVERBrec1.numero = singular
      A3:    @
      C3:   ALOVERBrec1.numero = plural
      A3:    @
    A2:    @
  A1:    @
  C1:   ALOVERBrec1.tiempo = Presente
    C2:   ALOVERBrec1.modo = Indicativo
      C3:   ALOVERBrec1.futuro = sifuturo
      A3:    @
    A2:    @
  A1:    @
  C1:   ALOVERBrec1.tiempo = Pasado
    C2:   ALOVERBrec1.modo = Subjuntivo
    A2:    @
    C2:   ALOVERBrec1.modo = Indicativo
      C3:   ALOVERBrec1.futuro = sifuturo
      A3:    @
      C3:   ALOVERBrec1.aspecto = perfectivo
        C4:   ALOVERBrec1.persona = 1
        A4:    @
        C4:   ALOVERBrec1.persona = 2
        A4:    @
        C4:   ALOVERBrec1.persona = 3
        A4:    @
      A3:    @
      C3:   ALOVERBrec1.aspecto = imperfectivo
      A3:    @
    A2:    @
  A1:    @
A0:    @
&



$RL 22
{ sterk }

%ALOSUBsterk

m1: SUBVERB { SUBVERBrec1 }[mu1]
m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp:

C0:   SUBVERBrec1.Aloclases = [sterkCLASE]
  C1:   true
  A1:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
        ALOVERBrec1.modo := Infinitivo
  C1:   true
  A1:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
        ALOVERBrec1.modo := PtcPas
  C1:   true
  A1:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
        ALOVERBrec1.modo := Gerundio
  C1:   true
    C2:   true
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.numero := singular
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.numero := plural
    A2:   ALOVERBrec1.persona := 2
  A1:   ALOVERBrec1.modo := Imperativo
  C1:   true
    C2:   true
      C3:   true
        C4:   true
        A4:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
              ALOVERBrec1.persona := 1
        C4:   true
        A4:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
              ALOVERBrec1.persona := 2
      A3:   ALOVERBrec1.numero := plural
    A2:   ALOVERBrec1.modo := Subjuntivo
    C2:   true
      C3:   true
        C4:   true
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 1
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 2
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 3
        A4:   ALOVERBrec1.numero := singular
        C4:   true
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 1
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 2
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 3
        A4:   ALOVERBrec1.numero := plural
      A3:   ALOVERBrec1.futuro := nofuturo
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.futuro := sifuturo
    A2:   ALOVERBrec1.modo := Indicativo
  A1:    ALOVERBrec1.tiempo := Presente
  C1:   true
    C2:   true
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.aspecto  := imperfectivo
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.futuro := sifuturo
    A2:   ALOVERBrec1.modo := Indicativo
  A1:   ALOVERBrec1.tiempo := Pasado
A0:    @


decomp:

C0:   ALOVERBrec1.Aloclases = [sterkCLASE]
  C1:   ALOVERBrec1.modo = Infinitivo
  A1:    @
  C1:   ALOVERBrec1.modo = PtcPas
  A1:    @
  C1:   ALOVERBrec1.modo = Gerundio
  A1:    @
  C1:   ALOVERBrec1.modo = Imperativo
    C2:   ALOVERBrec1.persona = 2
      C3:   ALOVERBrec1.numero = singular
      A3:    @
      C3:   ALOVERBrec1.numero = plural
      A3:    @
    A2:    @
  A1:    @
  C1:   ALOVERBrec1.tiempo = Presente
    C2:   ALOVERBrec1.modo = Subjuntivo
      C3:   ALOVERBrec1.numero = plural
        C4:   ALOVERBrec1.persona = 1
        A4:    @
        C4:   ALOVERBrec1.persona = 2
        A4:    @        
      A3:    @
    A2:    @
    C2:   ALOVERBrec1.modo = Indicativo
      C3:   ALOVERBrec1.futuro = nofuturo
        C4:   ALOVERBrec1.numero = singular
          C5:   ALOVERBrec1.persona = 1
          A5:    @
          C5:   ALOVERBrec1.persona = 2
          A5:    @
          C5:   ALOVERBrec1.persona = 3
          A5:    @
        A4:    @ 
        C4:   ALOVERBrec1.numero = plural
          C5:   ALOVERBrec1.persona = 1
          A5:    @
          C5:   ALOVERBrec1.persona = 2
          A5:    @
          C5:   ALOVERBrec1.persona = 3
          A5:    @
        A4:    @ 
      A3:    @
      C3:   ALOVERBrec1.futuro = sifuturo
      A3:    @
    A2:    @
  A1:    @
  C1:   ALOVERBrec1.tiempo = Pasado
    C2:   ALOVERBrec1.modo = Indicativo
      C3:   ALOVERBrec1.aspecto  = imperfectivo
      A3:    @
      C3:   ALOVERBrec1.futuro = sifuturo
      A3:    @
    A2:    @
  A1:    @
A0:    @
&



$RL 31
{ eiouHalf }

%ALOSUBeiouHalf

m1: SUBVERB { SUBVERBrec1 }[mu1]
m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB {SUBVERBrec1 }[mu1]]


comp: 

C0:   SUBVERBrec1.Aloclases = [eiouHalfCLASE]
  C1:   true
    C2:   true
      C3:   true
        C4:   true
        A4:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
              ALOVERBrec1.persona := 1
        C4:   true
        A4:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
              ALOVERBrec1.persona := 2
        C4:   true
        A4:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
              ALOVERBrec1.persona := 3
      A3:   ALOVERBrec1.numero := singular
      C3:   true
        C4:   true
        A4:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
              ALOVERBrec1.persona := 3
      A3:   ALOVERBrec1.numero := plural
    A2:   ALOVERBrec1.modo := Subjuntivo
  A1:   ALOVERBrec1.tiempo := Presente
  C1:   true
    C2:   true
      C3:   true
        C4:   true
        A4:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
              ALOVERBrec1.persona := 1
        C4:   true
        A4:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
              ALOVERBrec1.persona := 2
      A3:   ALOVERBrec1.aspecto := perfectivo
    A2:   ALOVERBrec1.modo := Indicativo
  A1:   ALOVERBrec1.tiempo := Pasado
  C1:   true
  A1:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
        ALOVERBrec1.modo := Infinitivo
  C1:   true
  A1:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
        ALOVERBrec1.modo := PtcPas
  C1:   true
    C2:   true
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);   
            ALOVERBrec1.numero := singular
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);   
            ALOVERBrec1.numero := plural
    A2:   ALOVERBrec1.persona := 2  
  A1:  ALOVERBrec1.modo := Imperativo
  C1:   true
    C2:   true
      C3:   true
        C4:   true
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 1   
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 2
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 3
        A4:   ALOVERBrec1.numero := singular
        C4:   true
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 1   
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 2
          C5:   true
          A5:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                ALOVERBrec1.persona := 3
        A4:   ALOVERBrec1.numero := plural
      A3:   ALOVERBrec1.futuro := nofuturo
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.futuro := sifuturo
    A2:   ALOVERBrec1.modo := Indicativo
  A1:   ALOVERBrec1.tiempo := Presente
  C1:   true
    C2:   true
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.futuro := sifuturo
      C3:   true
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
            ALOVERBrec1.aspecto := imperfectivo
    A2:   ALOVERBrec1.modo := Indicativo
  A1:   ALOVERBrec1.tiempo := Pasado
A0:    @


decomp: 

C0:   ALOVERBrec1.Aloclases = [eiouHalfCLASE]
  C1:   ALOVERBrec1.tiempo = Presente
    C2:   ALOVERBrec1.modo = Subjuntivo
      C3:   ALOVERBrec1.numero = singular
        C4:   ALOVERBrec1.persona = 1
        A4:    @
        C4:   ALOVERBrec1.persona = 2
        A4:    @
        C4:   ALOVERBrec1.persona = 3
        A4:    @
      A3:    @
      C3:   ALOVERBrec1.numero = plural
        C4:   ALOVERBrec1.persona = 3
        A4:    @
      A3:    @
    A2:    @
  A1:    @
  C1:   ALOVERBrec1.tiempo = Pasado
    C2:   ALOVERBrec1.modo = Indicativo
      C3:   ALOVERBrec1.aspecto = perfectivo
        C4:   ALOVERBrec1.persona = 1
        A4:    @
        C4:   ALOVERBrec1.persona = 2
        A4:    @
      A3:    @
    A2:    @
  A1:    @
  C1:   ALOVERBrec1.modo = Infinitivo
  A1:    @
  C1:   ALOVERBrec1.modo = PtcPas
  A1:    @
  C1:   ALOVERBrec1.modo = Imperativo
    C2:   ALOVERBrec1.persona = 2
      C3:   ALOVERBrec1.numero = singular
      A3:    @
      C3:   ALOVERBrec1.numero = plural
      A3:    @
    A2:    @
  A1:    @
  C1:   ALOVERBrec1.tiempo = Presente
    C2:   ALOVERBrec1.modo = Indicativo
      C3:   ALOVERBrec1.futuro = nofuturo
        C4:   ALOVERBrec1.numero = singular
          C5:   ALOVERBrec1.persona = 1
          A5:    @
          C5:   ALOVERBrec1.persona = 2
          A5:    @
          C5:   ALOVERBrec1.persona = 3
          A5:    @
        A4:    @
        C4:   ALOVERBrec1.numero = plural
          C5:   ALOVERBrec1.persona = 1
          A5:    @
          C5:   ALOVERBrec1.persona = 2
          A5:    @
          C5:   ALOVERBrec1.persona = 3
          A5:    @
        A4:    @
      A3:    @
      C3:   ALOVERBrec1.futuro = sifuturo
      A3:    @
    A2:    @
  A1:    @
  C1:   ALOVERBrec1.tiempo = Pasado
    C2:   ALOVERBrec1.modo = Indicativo
      C3:   ALOVERBrec1.futuro = sifuturo
      A3:    @
      C3:   ALOVERBrec1.aspecto = imperfectivo
      A3:    @  
    A2:    @
  A1:    @
A0:    @
&



$RL 34
{ eiouHeel }

%ALOSUBeiouHeel

m1: SUBVERB { SUBVERBrec1 }[mu1]
m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB {SUBVERBrec1 }[mu1]]


comp:

C0:    SUBVERBrec1.Aloclases = [eiouHeelCLASE]
  C1:    true
    C2:    true
      C3:    true
        C4:    true
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 1
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 2
       A4:     ALOVERBrec1.futuro := nofuturo
      A3:    ALOVERBrec1.numero := plural
    A2:    ALOVERBrec1.modo := Indicativo
  A1:    ALOVERBrec1.tiempo := Presente
  C1:    true
    C2:    true
      C3:    true
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 1
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 2
      A3:    ALOVERBrec1.aspecto := perfectivo
    A2:    ALOVERBrec1.modo := Indicativo
  A1:    ALOVERBrec1.tiempo := Pasado
  C1:    true
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.persona := 2
    A2:    ALOVERBrec1.numero := plural
  A1:    ALOVERBrec1.modo := Imperativo
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := Infinitivo
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := PtcPas
  C1:    true
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.futuro := sifuturo 
    A2:    ALOVERBrec1.tiempo := Presente
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.aspecto := imperfectivo
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.futuro := sifuturo
    A2:    ALOVERBrec1.tiempo := Pasado
  A1:    ALOVERBrec1.modo := Indicativo
A0:     @


decomp:

C0:    ALOVERBrec1.Aloclases = [eiouHeelCLASE]
  C1:    ALOVERBrec1.tiempo = Presente
    C2:    ALOVERBrec1.modo = Indicativo
      C3:    ALOVERBrec1.numero = plural
        C4:    ALOVERBrec1.futuro = nofuturo
          C5:    ALOVERBrec1.persona = 1
          A5:     @
          C5:    ALOVERBrec1.persona = 2
          A5:     @
        A4:     @
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.tiempo = Pasado
    C2:    ALOVERBrec1.modo = Indicativo
      C3:    ALOVERBrec1.aspecto = perfectivo
        C4:    ALOVERBrec1.persona = 1
        A4:     @
        C4:    ALOVERBrec1.persona = 2
        A4:     @
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.modo = Imperativo
    C2:    ALOVERBrec1.numero = plural
      C3:    ALOVERBrec1.persona = 2
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.modo = Infinitivo
  A1:     @
  C1:    ALOVERBrec1.modo = PtcPas
  A1:     @
  C1:    ALOVERBrec1.modo = Indicativo
    C2:    ALOVERBrec1.tiempo = Presente
      C3:    ALOVERBrec1.futuro = sifuturo 
      A3:     @
    A2:     @
    C2:    ALOVERBrec1.tiempo = Pasado
      C3:    ALOVERBrec1.aspecto = imperfectivo
      A3:     @
      C3:    ALOVERBrec1.futuro = sifuturo
      A3:     @
    A2:     @
  A1:     @
A0:     @      
&



$RL 25
{ yMinPres }

%ALOSUByMinPres

m1: SUBVERB { SUBVERBrec1 }[mu1]
m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB {SUBVERBrec1 }[mu1]]


comp: 

C0:    SUBVERBrec1.Aloclases = [yMinPresCLASE]
  C1:    true
    C2:    true
      C3:    true
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 1
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 2
      A3:    ALOVERBrec1.aspecto := perfectivo
    A2:    ALOVERBrec1.modo := Indicativo
  A1:    ALOVERBrec1.tiempo := Pasado
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := Infinitivo
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := PtcPas
  C1:    true
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.numero := singular
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.numero := plural
    A2:    ALOVERBrec1.persona := 2
  A1:    ALOVERBrec1.modo := Imperativo
  C1:    true
    C2:    true
      C3:    true
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 1
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 2
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 3
      A3:    ALOVERBrec1.numero := singular
      C3:    true
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 1
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 2
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 3
      A3:    ALOVERBrec1.numero := plural
    A2:    ALOVERBrec1.tiempo := Presente
  A1:    ALOVERBrec1.modo := Subjuntivo
  C1:    true
    C2:    true
      C3:    true
        C4:    true
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 1
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 2
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 3
        A4:    ALOVERBrec1.numero := singular
        C4:    true
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 1
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 2
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 3
        A4:    ALOVERBrec1.numero := plural
      A3:    ALOVERBrec1.futuro := nofuturo
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.futuro := sifuturo
    A2:    ALOVERBrec1.tiempo := Presente
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.aspecto := imperfectivo
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.futuro := sifuturo
    A2:    ALOVERBrec1.tiempo := Pasado
  A1:    ALOVERBrec1.modo := Indicativo
A0:     @


decomp: 

C0:    ALOVERBrec1.Aloclases = [yMinPresCLASE]
  C1:    ALOVERBrec1.tiempo = Pasado
    C2:    ALOVERBrec1.modo = Indicativo
      C3:    ALOVERBrec1.aspecto = perfectivo
        C4:    ALOVERBrec1.persona = 1
        A4:     @
        C4:    ALOVERBrec1.persona = 2
        A4:     @
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.modo = Infinitivo
  A1:     @
  C1:    ALOVERBrec1.modo = PtcPas
  A1:     @
  C1:    ALOVERBrec1.modo = Imperativo
    C2:    ALOVERBrec1.persona = 2
      C3:    ALOVERBrec1.numero = singular
      A3:     @
      C3:    ALOVERBrec1.numero = plural
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.modo = Subjuntivo
    C2:    ALOVERBrec1.tiempo = Presente
      C3:    ALOVERBrec1.numero = singular
        C4:    ALOVERBrec1.persona = 1
        A4:     @
        C4:    ALOVERBrec1.persona = 2
        A4:     @
        C4:    ALOVERBrec1.persona = 3
        A4:     @
      A3:     @
      C3:    ALOVERBrec1.numero = plural
        C4:    ALOVERBrec1.persona = 1
        A4:     @
        C4:    ALOVERBrec1.persona = 2
        A4:     @
        C4:    ALOVERBrec1.persona = 3
        A4:     @
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.modo = Indicativo
    C2:    ALOVERBrec1.tiempo = Presente
      C3:    ALOVERBrec1.futuro = nofuturo
        C4:    ALOVERBrec1.numero = singular
          C5:    ALOVERBrec1.persona = 1
          A5:     @
          C5:    ALOVERBrec1.persona = 2
          A5:     @
          C5:    ALOVERBrec1.persona = 3
          A5:     @
        A4:     @
        C4:    ALOVERBrec1.numero = plural
          C5:    ALOVERBrec1.persona = 1
          A5:     @
          C5:    ALOVERBrec1.persona = 2
          A5:     @
          C5:    ALOVERBrec1.persona = 3
          A5:     @
        A4:     @
      A3:     @
      C3:    ALOVERBrec1.futuro = sifuturo
      A3:     @
    A2:     @
    C2:    ALOVERBrec1.tiempo = Pasado
      C3:    ALOVERBrec1.aspecto = imperfectivo
      A3:     @
      C3:    ALOVERBrec1.futuro = sifuturo
      A3:     @
    A2:     @
  A1:     @
A0:     @
&



$RL 24
{ umlaut; rule for all tenses, except PresSubj }

%ALOSUBumlaut

m1: SUBVERB { SUBVERBrec1 }[mu1]
m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB {SUBVERBrec1 }[mu1]]


comp: 

C0:    SUBVERBrec1.Aloclases = [umlautCLASE]
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := Infinitivo
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := PtcPas
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := Gerundio
  C1:    true
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.numero := singular
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.numero := plural
    A2:    ALOVERBrec1.persona := 2
  A1:    ALOVERBrec1.modo := Imperativo
  C1:    true
    C2:    true
    A2:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
           ALOVERBrec1.tiempo := Pasado
  A1:    ALOVERBrec1.modo := Subjuntivo
  C1:    true
    C2:    true
      C3:    true
        C4:    true
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 1
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 2
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 3
        A4:    ALOVERBrec1.numero := singular
        C4:    true
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 1
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 2
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 3
        A4:    ALOVERBrec1.numero := plural
      A3:    ALOVERBrec1.futuro := nofuturo
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.futuro := sifuturo
    A2:    ALOVERBrec1.tiempo := Presente
    C2:    true
      C3:    true
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 1
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 2
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 3
      A3:    ALOVERBrec1.aspecto := perfectivo
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.aspecto := imperfectivo
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.futuro := sifuturo
    A2:    ALOVERBrec1.tiempo := Pasado
  A1:    ALOVERBrec1.modo := Indicativo
A0:     @


decomp: 

C0:    ALOVERBrec1.Aloclases = [umlautCLASE]
  C1:    ALOVERBrec1.modo = Infinitivo
  A1:     @
  C1:    ALOVERBrec1.modo = PtcPas
  A1:     @
  C1:    ALOVERBrec1.modo = Gerundio
  A1:     @
  C1:    ALOVERBrec1.modo = Imperativo
    C2:    ALOVERBrec1.persona = 2
      C3:    ALOVERBrec1.numero = singular
      A3:     @
      C3:    ALOVERBrec1.numero = plural
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.modo = Subjuntivo
    C2:    ALOVERBrec1.tiempo = Pasado
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.modo = Indicativo
    C2:    ALOVERBrec1.tiempo = Presente
      C3:    ALOVERBrec1.futuro = nofuturo
        C4:    ALOVERBrec1.numero = singular
          C5:    ALOVERBrec1.persona = 1
          A5:     @
          C5:    ALOVERBrec1.persona = 2
          A5:     @
          C5:    ALOVERBrec1.persona = 3
          A5:     @
        A4:     @
        C4:    ALOVERBrec1.numero = plural
          C5:    ALOVERBrec1.persona = 1
          A5:     @
          C5:    ALOVERBrec1.persona = 2
          A5:     @
          C5:    ALOVERBrec1.persona = 3
          A5:     @
        A4:     @
      A3:     @
      C3:    ALOVERBrec1.futuro = sifuturo
      A3:     @
    A2:     @  
    C2:    ALOVERBrec1.tiempo = Pasado
      C3:    ALOVERBrec1.aspecto = perfectivo
        C4:    ALOVERBrec1.persona = 1
        A4:     @
        C4:    ALOVERBrec1.persona = 2
        A4:     @
        C4:    ALOVERBrec1.persona = 3
        A4:     @
      A3:     @
      C3:    ALOVERBrec1.aspecto = imperfectivo
      A3:     @
      C3:    ALOVERBrec1.futuro = sifuturo
      A3:     @
    A2:     @
  A1:     @
A0:     @
&



$RL 33
{ ve }

%ALOSUBve

m1: SUBVERB { SUBVERBrec1 }[mu1]
m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB {SUBVERBrec1 }[mu1]]


comp: 

C0:    SUBVERBrec1.Aloclases = [veCLASE]
  C1:    true
    C2:    true
      C3:    true
        C4:    true
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 1
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 2
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 3
        A4:    ALOVERBrec1.futuro := nofuturo
      A3:    ALOVERBrec1.numero := plural      
      C3:    true
        C4:    true
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 2
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 3
        A4:    ALOVERBrec1.futuro := nofuturo
      A3:    ALOVERBrec1.numero := singular
    A2:    ALOVERBrec1.modo := Indicativo
  A1:    ALOVERBrec1.tiempo := Presente
  C1:    true
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.numero := singular
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.numero := plural
    A2:    ALOVERBrec1.persona := 2
  A1:    ALOVERBrec1.modo := Imperativo
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := Infinitivo
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := PtcPas
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := Gerundio
  C1:    true
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.futuro := sifuturo
    A2:    ALOVERBrec1.modo := Indicativo
  A1:    ALOVERBrec1.tiempo := Presente
  C1:    true
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.futuro := sifuturo
      C3:    true
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 1
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 2
        C4:    true
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
               ALOVERBrec1.persona := 3
      A3:    ALOVERBrec1.aspecto := perfectivo
    A2:    ALOVERBrec1.modo := Indicativo
    C2:    true
    A2:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
           ALOVERBrec1.modo := Subjuntivo
  A1:    ALOVERBrec1.tiempo := Pasado
A0:     @


decomp: 

C0:    ALOVERBrec1.Aloclases = [veCLASE]
  C1:    ALOVERBrec1.tiempo = Presente
    C2:    ALOVERBrec1.modo = Indicativo
      C3:    ALOVERBrec1.numero = plural
        C4:    ALOVERBrec1.futuro = nofuturo
          C5:    ALOVERBrec1.persona = 1
          A5:     @
          C5:    ALOVERBrec1.persona = 2
          A5:     @
          C5:    ALOVERBrec1.persona = 3
          A5:     @
        A4:     @
      A3:     @
      C3:    ALOVERBrec1.numero = singular
        C4:    ALOVERBrec1.futuro = nofuturo
          C5:    ALOVERBrec1.persona = 2
          A5:     @
          C5:    ALOVERBrec1.persona = 3
          A5:     @
        A4:     @
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.modo = Imperativo
    C2:    ALOVERBrec1.persona = 2
      C3:    ALOVERBrec1.numero = singular
      A3:     @
      C3:    ALOVERBrec1.numero = plural
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.modo = Infinitivo
  A1:     @
  C1:    ALOVERBrec1.modo = PtcPas
  A1:     @
  C1:    ALOVERBrec1.modo = Gerundio
  A1:     @
  C1:    ALOVERBrec1.tiempo = Presente
    C2:    ALOVERBrec1.modo = Indicativo
      C3:    ALOVERBrec1.futuro = sifuturo
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.tiempo = Pasado
    C2:    ALOVERBrec1.modo = Indicativo
      C3:    ALOVERBrec1.futuro = sifuturo
      A3:     @
      C3:    ALOVERBrec1.aspecto = perfectivo
        C4:    ALOVERBrec1.persona = 1
        A4:     @
        C4:    ALOVERBrec1.persona = 2
        A4:     @
        C4:    ALOVERBrec1.persona = 3
        A4:     @
      A3:     @
    A2:     @
    C2:    ALOVERBrec1.modo = Subjuntivo
    A2:     @
  A1:     @
A0:     @
&
