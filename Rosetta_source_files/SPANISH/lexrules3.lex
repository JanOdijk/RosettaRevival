%SPANISH3
&


{ Verbs belonging to more than one "Aloclase" }


{ Verbs belonging to irrMedekCLASE and sterkCLASE }

%ALOSUBirrMedek_sterk

m1: SUBVERB { SUBVERBrec1 }[mu1]
m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]


comp: 

C0:    SUBVERBrec1.Aloclases = [irrMedekCLASE,sterkCLASE] 
  C1:    true
    C2:    true
      C3:    true
        C4:    true
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 2
          C5:    true
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
                 ALOVERBrec1.persona := 3
        A4:    ALOVERBrec1.numero := singular
        C4:    true
        A4:    ALOVERBrec1.numero := plural
      A3:    ALOVERBrec1.futuro := nofuturo
    A2:     ALOVERBrec1.tiempo := Presente
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.aspecto := Imperfectivo
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.futuro := sifuturo
    A2:    ALOVERBrec1.tiempo := Pasado
    C2:    true
      C3:    true
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
             ALOVERBrec1.futuro := sifuturo
    A2:    ALOVERBrec1.tiempo := Presente
  A1:     ALOVERBrec1.modo := Indicativo
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := Imperativo
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := Gerundio
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := Infinitivo
  C1:    true
  A1:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1);
         ALOVERBrec1.modo := PtcPas
A1:    @

decomp: 

C0:    ALOVERBrec1.Aloclases = [irrMedekCLASE,sterkCLASE] 
  C1:    ALOVERBrec1.modo = Indicativo
    C2:    ALOVERBrec1.tiempo = Presente
      C3:    ALOVERBrec1.futuro = nofuturo
        C4:    ALOVERBrec1.numero = singular
          C5:    ALOVERBrec1.persona = 2
          A5:     @
          C5:    ALOVERBrec1.persona = 3
          A5:     @
        A4:     @
        C4:    ALOVERBrec1.numero = plural
        A4:     @
      A3:     @
    A2:     @
    C2:    ALOVERBrec1.tiempo = Pasado
      C3:   ALOVERBrec1.aspecto = Imperfectivo
      A3:     @
      C3:   ALOVERBrec1.futuro = sifuturo
      A3:     @
    A2:     @
    C2:    ALOVERBrec1.tiempo = Presente
      C3:   ALOVERBrec1.futuro = sifuturo
      A3:     @
    A2:     @
  A1:     @
  C1:    ALOVERBrec1.modo = Imperativo
  A1:     @
  C1:    ALOVERBrec1.modo = Gerundio
  A1:     @
  C1:    ALOVERBrec1.modo = Infinitivo
  A1:     @
  C1:    ALOVERBrec1.modo = PtcPas
  A1:     @
A0:     @
&


{ Verbs belonging to diftongCLASE and eiouHalfCLASE }

%ALOSUBdiftong_eiouHalf

m1: SUBVERB { SUBVERBrec1 }[mu1]
m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB {SUBVERBrec1 }[mu1]]


comp: 

C0:   SUBVERBrec1.Aloclases = [diftongCLASE,eiouHalfCLASE]
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
            ALOVERBrec1.numero := plural
    A2:   ALOVERBrec1.persona := 2
  A1:   ALOVERBrec1.modo := Imperativo
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

C0:   ALOVERBrec1.Aloclases = [diftongCLASE,eiouHalfCLASE]
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
      C3:   ALOVERBrec1.numero = plural
      A3:    @
    A2:    @
  A1:    @
  C1:   ALOVERBrec1.tiempo = Presente
    C2:   ALOVERBrec1.modo = Indicativo
      C3:   ALOVERBrec1.futuro = nofuturo
        C4:   ALOVERBrec1.numero = plural
          C5:   ALOVERBrec1.persona = 1
          A5:    @
          C5:   ALOVERBrec1.persona = 2
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



{---------------------------}
{----------------------------}



$NP
{ The following rules apply to forms with stem-change (allomorph/SFK):
                        ALOVERB ---> SUBVERB + SFK                       }


{ PresInd }

{ 2/3sg + 3pl  could be combined }

{ 1st ps.sg. } 

%PresIndALOsg1

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:    true
  C1:    true
    C2:    true
      C3:    true
        C4:    (diftongCLASE IN SUBVERBrec1.Aloclases) and
               (SFCATrec1.key = SFKdiftong)
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:    (irrMedekCLASE IN SUBVERBrec1.Aloclases) and
               (SFCATrec1.key = SFKirrMedek)
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:    (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
               (SFCATrec1.key = SFKeiouHeel)
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:    (veCLASE IN SUBVERBrec1.Aloclases) and
               (SFCATrec1.key = SFKve)
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:    ALOVERBrec1.numero := singular
    A2:    ALOVERBrec1.persona := 1
  A1:    ALOVERBrec1.modo := Indicativo;
         ALOVERBrec1.futuro := nofuturo
A0:    ALOVERBrec1.tiempo := Presente


decomp: 

C0:    ALOVERBrec1.tiempo = Presente
  C1:    (ALOVERBrec1.modo = Indicativo) and
         (ALOVERBrec1.futuro = nofuturo) 
    C2:    ALOVERBrec1.persona = 1
      C3:    ALOVERBrec1.numero = singular
        C4:    diftongCLASE IN ALOVERBrec1.Aloclases
        A4:    SFCATrec1.key := SFKdiftong

        C4:    irrMedekCLASE IN ALOVERBrec1.Aloclases
        A4:    SFCATrec1.key := SFKirrMedek

        C4:    eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:    SFCATrec1.key := SFKeiouHeel    

        C4:    veCLASE IN ALOVERBrec1.Aloclases
        A4:    SFCATrec1.key := SFKve

      A3:     @
    A2:     @
  A1:     @
A0:     @
&


$RL 27
{ 2nd/3rd ps.sg. }

%PresIndALOsg23

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:    true
  C1:    true
    C2:    true
      C3:    true
        C4:    (diftongCLASE IN SUBVERBrec1.Aloclases) and
               (SFCATrec1.key = SFKdiftong)
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:    (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
               (SFCATrec1.key = SFKeiouHeel)
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:    ALOVERBrec1.persona := 2
      C3:    true
        C4:    (diftongCLASE IN SUBVERBrec1.Aloclases) and
               (SFCATrec1.key = SFKdiftong)
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:    (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
               (SFCATrec1.key = SFKeiouHeel)
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:    ALOVERBrec1.persona := 3
    A2:    ALOVERBrec1.numero := singular
  A1:    ALOVERBrec1.modo := Indicativo;
         ALOVERBrec1.futuro := nofuturo
A0:    ALOVERBrec1.tiempo := Presente


decomp: 

C0:    ALOVERBrec1.tiempo = Presente
  C1:    (ALOVERBrec1.modo = Indicativo)  and
         (ALOVERBrec1.futuro = nofuturo)
    C2:    ALOVERBrec1.numero = singular 
      C3:    ALOVERBrec1.persona = 2
        C4:    diftongCLASE IN ALOVERBrec1.Aloclases
        A4:    SFCATrec1.key := SFKdiftong

        C4:    eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:    SFCATrec1.key := SFKeiouHeel

      A3:     @
      C3:    ALOVERBrec1.persona = 3
        C4:    diftongCLASE IN ALOVERBrec1.Aloclases
        A4:    SFCATrec1.key := SFKdiftong

        C4:    eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:    SFCATrec1.key := SFKeiouHeel

      A3:     @
    A2:     @
  A1:     @
A0:     @
&


$RL 29
{ 3rd ps.pl. }

%PresIndALOpl3

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:    true
  C1:    true
    C2:    true
      C3:    true
        C4:    (diftongCLASE IN SUBVERBrec1.Aloclases) and
               (SFCATrec1.key = SFKdiftong)
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:    (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
               (SFCATrec1.key = SFKeiouHeel)
        A4:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:    ALOVERBrec1.numero := plural
    A2:    ALOVERBrec1.persona := 3
  A1:    ALOVERBrec1.modo := Indicativo;
         ALOVERBrec1.futuro := nofuturo
A0:    ALOVERBrec1.tiempo := Presente


decomp: 

C0:    ALOVERBrec1.tiempo = Presente
  C1:    (ALOVERBrec1.modo = Indicativo) and
         (ALOVERBrec1.futuro = nofuturo)
    C2:    ALOVERBrec1.persona = 3
      C3:    ALOVERBrec1.numero = plural
        C4:    diftongCLASE IN ALOVERBrec1.Aloclases
        A4:    SFCATrec1.key := SFKdiftong

        C4:    eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:    SFCATrec1.key := SFKeiouHeel

      A3:     @
    A2:     @
  A1:     @
A0:     @
&


{-------------------------}

$RL 33
{ PresSubj }

{ 1/2/3sg + 3pl could be combined }

{ 1st/2nd/3rd ps.sg. }

%PresSubjALOsg123

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (diftongCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKdiftong)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (irrMedekCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKirrMedek)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)
 
        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (umlautCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKumlaut)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (veCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKve)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.persona := 1
      C3:     true
        C4:     (diftongCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKdiftong)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (irrMedekCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKirrMedek)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)
 
        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (umlautCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKumlaut)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (veCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKve)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.persona := 2
      C3:     true
        C4:     (diftongCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKdiftong)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (irrMedekCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKirrMedek)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)
 
        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (umlautCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKumlaut)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (veCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKve)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.persona := 3
    A2:     ALOVERBrec1.numero := singular
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Presente


decomp: 

C0:     ALOVERBrec1.tiempo = Presente
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.numero = singular
      C3:     ALOVERBrec1.persona = 1
        C4:     diftongCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKdiftong

        C4:     irrMedekCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKirrMedek

        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    

        C4:     umlautCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKumlaut

        C4:     veCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKve
      A3:     @
      C3:     ALOVERBrec1.persona = 2
        C4:     diftongCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKdiftong

        C4:     irrMedekCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKirrMedek

        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    

        C4:     umlautCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKumlaut

        C4:     veCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKve
      A3:     @
      C3:     ALOVERBrec1.persona = 3
        C4:     diftongCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKdiftong

        C4:     irrMedekCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKirrMedek

        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    

        C4:     umlautCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKumlaut

        C4:     veCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKve
      A3:     @
    A2:      @
  A1:      @
A0:      @
&


$RL 31
{ 1st ps.pl. }

%PresSubjALOpl1

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (irrMedekCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKirrMedek)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (umlautCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKumlaut)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (veCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKve)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := plural
    A2:     ALOVERBrec1.persona := 1
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Presente


decomp: 

C0:     ALOVERBrec1.tiempo = Presente
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 1
      C3:     ALOVERBrec1.numero = plural
        C4:     irrMedekCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKirrMedek

        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf

        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    

        C4:     umlautCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKumlaut

        C4:     veCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKve

      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 31
{ 2nd ps.pl. }

%PresSubjALOpl2

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (irrMedekCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKirrMedek)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (umlautCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKumlaut)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (veCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKve)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := plural
    A2:     ALOVERBrec1.persona := 2
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Presente


decomp: 

C0:     ALOVERBrec1.tiempo = Presente
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 2
      C3:     ALOVERBrec1.numero = plural
        C4:     irrMedekCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKirrMedek

        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf

        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    

        C4:     umlautCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKumlaut

        C4:     veCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKve

      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 33
{ 3rd ps.pl. }

%PresSubjALOpl3

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (diftongCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKdiftong)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (irrMedekCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKirrMedek)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (umlautCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKumlaut)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (veCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKve)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := plural
    A2:     ALOVERBrec1.persona := 3
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Presente


decomp: 

C0:     ALOVERBrec1.tiempo = Presente
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 3
      C3:     ALOVERBrec1.numero = plural
        C4:     diftongCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKdiftong

        C4:     irrMedekCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKirrMedek

        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    

        C4:     umlautCLASE IN ALOVERBrec1.Aloclases 
        A4:     SFCATrec1.key := SFKumlaut

        C4:     veCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKve

      A3:      @
    A2:      @
  A1:      @
A0:      @
&


{----------------------}

$RL 24
{ 2nd.ps.sg.Imperat } 

%ImperatALOsg

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:    true
  C1:    true
    C2:    true
      C3:    (diftongCLASE IN SUBVERBrec1.Aloclases) and
             (SFCATrec1.key = SFKdiftong)
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      C3:    (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
             (SFCATrec1.key = SFKeiouHeel)
      A3:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

     A2:    ALOVERBrec1.persona := 2
  A1:    ALOVERBrec1.numero := singular
A0:    ALOVERBrec1.modo := Imperativo


decomp: 

C0:    ALOVERBrec1.modo = Imperativo
  C1:    ALOVERBrec1.numero = singular
    C2:    ALOVERBrec1.persona = 2
      C3:    diftongCLASE IN ALOVERBrec1.Aloclases
      A3:    SFCATrec1.key := SFKdiftong

      C3:    eiouHeelCLASE IN ALOVERBrec1.Aloclases
      A3:    SFCATrec1.key := SFKeiouHeel

    A2:     @
  A1:     @
A0:     @
&


{--------------------}


 SubjPas }

{ Similar for all tenses and persons }

{ 1st ps.sg. }

%SubjPasALOsg1

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKsterk)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKyMinPres)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := singular
    A2:     ALOVERBrec1.persona := 1
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 1
      C3:     ALOVERBrec1.numero = singular
        C4:     sterkCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKsterk
        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf
        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    
        C4:     yMinPresCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKyMinPres
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 31
{ 2nd ps.sg. }

%SubjPasALOsg2

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKsterk)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKyMinPres)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := singular
    A2:     ALOVERBrec1.persona := 2
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 2
      C3:     ALOVERBrec1.numero = singular
        C4:     sterkCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKsterk
        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf
        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    
        C4:     yMinPresCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKyMinPres
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 31
{ 3rd ps.sg. }

%SubjPasALOsg3

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKsterk)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)   
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKyMinPres)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := singular
    A2:     ALOVERBrec1.persona := 3
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 3
      C3:     ALOVERBrec1.numero = singular
        C4:     sterkCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKsterk
        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf
        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    
        C4:     yMinPresCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKyMinPres
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 31
{ 1st ps.pl. }

%SubjPasALOpl1

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKsterk)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)   
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKyMinPres)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := plural
    A2:     ALOVERBrec1.persona := 1
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 1
      C3:     ALOVERBrec1.numero = plural
        C4:     sterkCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKsterk
        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf
        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    
        C4:     yMinPresCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKyMinPres
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 31
{ 2nd ps.pl. }

%SubjPasALOpl2

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKsterk)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)   
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKyMinPres)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := plural
    A2:     ALOVERBrec1.persona := 2
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 2
      C3:     ALOVERBrec1.numero = plural
        C4:     sterkCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKsterk
        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf
        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    
        C4:     yMinPresCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKyMinPres
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 33
{ 3rd ps.pl. }

%SubjPasALOpl3

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKsterk)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)   
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKyMinPres)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := plural
    A2:     ALOVERBrec1.persona := 3
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 3
      C3:     ALOVERBrec1.numero = plural
        C4:     sterkCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKsterk
        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf
        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    
        C4:     yMinPresCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKyMinPres
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


{-------------------}

$RL 33 
{ SubjPasa; similar to SubjPas, Uitgezet door LA op 240591}

{ 1st ps.sg. }

SubjPasaALOsg1

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKsterk)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)   
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKyMinPres)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := singular
    A2:     ALOVERBrec1.persona := 1
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 1
      C3:     ALOVERBrec1.numero = singular
        C4:     sterkCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKsterk
        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf
        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    
        C4:     yMinPresCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKyMinPres
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 31
{ 2nd ps.sg. }

SubjPasaALOsg2

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKsterk)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)   
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKyMinPres)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := singular
    A2:     ALOVERBrec1.persona := 2
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 2
      C3:     ALOVERBrec1.numero = singular
        C4:     sterkCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKsterk
        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf
        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    
        C4:     yMinPresCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKyMinPres
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 31
{ 3rd ps.sg. }

SubjPasaALOsg3

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKsterk)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)   
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKyMinPres)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := singular
    A2:     ALOVERBrec1.persona := 3
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 3
      C3:     ALOVERBrec1.numero = singular
        C4:     sterkCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKsterk
        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf
        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    
        C4:     yMinPresCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKyMinPres
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 31
{ 1st ps.pl. }

SubjPasaALOpl1

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKsterk)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)   
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKyMinPres)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := plural
    A2:     ALOVERBrec1.persona := 1
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 1
      C3:     ALOVERBrec1.numero = plural
        C4:     sterkCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKsterk
        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf
        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    
        C4:     yMinPresCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKyMinPres
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 31
{ 2nd ps.pl. }

SubjPasaALOpl2

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKsterk)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)   
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKyMinPres)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := plural
    A2:     ALOVERBrec1.persona := 2
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 2
      C3:     ALOVERBrec1.numero = plural
        C4:     sterkCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKsterk
        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf
        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    
        C4:     yMinPresCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKyMinPres
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 33
{ 3rd ps.pl. }

SubjPasaALOpl3

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKsterk)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHalf)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKeiouHeel)   
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        C4:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                (SFCATrec1.key = SFKyMinPres)
        A4:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

      A3:     ALOVERBrec1.numero := plural
    A2:     ALOVERBrec1.persona := 3
  A1:     ALOVERBrec1.modo := Subjuntivo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:     ALOVERBrec1.modo = Subjuntivo
    C2:     ALOVERBrec1.persona = 3
      C3:     ALOVERBrec1.numero = plural
        C4:     sterkCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKsterk
        C4:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHalf
        C4:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKeiouHeel    
        C4:     yMinPresCLASE IN ALOVERBrec1.Aloclases
        A4:     SFCATrec1.key := SFKyMinPres
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


{---------------------}

$RL 28 
{ PD }

{ 1/2sg + 1/2pl could be combined.  }
{ 3sg + 3pl also.                   }

{ 1st ps.sg. } 

%PDaloSG1

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:    true
  C1:    true
    C2:    true
      C3:    true
        C4:    true
          C5:    (sterkCLASE IN SUBVERBrec1.Aloclases) and
                 (SFCATrec1.key = SFKsterk)
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        A4:    ALOVERBrec1.numero := singular
      A3:    ALOVERBrec1.persona := 1
    A2:    ALOVERBrec1.aspecto := perfectivo
  A1:    ALOVERBrec1.modo := Indicativo;
         ALOVERBrec1.futuro := nofuturo
A0:    ALOVERBrec1.tiempo := Pasado


decomp: 

C0:    ALOVERBrec1.tiempo = Pasado
  C1:    (ALOVERBrec1.modo = Indicativo) and
         (ALOVERBrec1.futuro = nofuturo)
    C2:   ALOVERBrec1.aspecto = perfectivo
      C3:    ALOVERBrec1.persona = 1
        C4:    ALOVERBrec1.numero = singular
          C5:    sterkCLASE IN ALOVERBrec1.Aloclases
          A5:    SFCATrec1.key := SFKsterk
        A4:     @
      A3:     @
    A2:     @
  A1:     @
A0:     @
&


$RL 23
{ 2nd ps.sg. } 

%PDaloSG2

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:    true
  C1:    true
    C2:    true
      C3:    true
        C4:    true
          C5:    (sterkCLASE IN SUBVERBrec1.Aloclases) and
                 (SFCATrec1.key = SFKsterk)
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        A4:    ALOVERBrec1.numero := singular
      A3:    ALOVERBrec1.persona := 2
    A2:    ALOVERBrec1.aspecto := perfectivo
  A1:    ALOVERBrec1.modo := Indicativo;
         ALOVERBrec1.futuro := nofuturo
A0:    ALOVERBrec1.tiempo := Pasado


decomp: 

C0:    ALOVERBrec1.tiempo = Pasado
  C1:    (ALOVERBrec1.modo = Indicativo)  and
         (ALOVERBrec1.futuro = nofuturo)
    C2:   ALOVERBrec1.aspecto = perfectivo
      C3:    ALOVERBrec1.persona = 2
        C4:    ALOVERBrec1.numero = singular
          C5:    sterkCLASE IN ALOVERBrec1.Aloclases
          A5:    SFCATrec1.key := SFKsterk
        A4:     @
      A3:     @
    A2:     @
  A1:     @
A0:     @
&


$RL 29
{ 3rd ps.sg. } 

%PDaloSG3

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     true
          C5:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                  (SFCATrec1.key = SFKsterk)
          A5:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

          C5:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                  (SFCATrec1.key = SFKeiouHalf)
          A5:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

          C5:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                  (SFCATrec1.key = SFKeiouHeel)   
          A5:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

          C5:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                  (SFCATrec1.key = SFKyMinPres)
          A5:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        A4:     ALOVERBrec1.numero := singular
      A3:     ALOVERBrec1.persona := 3
    A2:     ALOVERBrec1.aspecto := perfectivo
  A1:     ALOVERBrec1.modo := Indicativo;
          ALOVERBrec1.futuro := nofuturo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:    (ALOVERBrec1.modo = Indicativo)  and
         (ALOVERBrec1.futuro = nofuturo)
    C2:     ALOVERBrec1.aspecto = perfectivo
      C3:     ALOVERBrec1.persona = 3
        C4:     ALOVERBrec1.numero = singular
          C5:     sterkCLASE IN ALOVERBrec1.Aloclases
          A5:     SFCATrec1.key := SFKsterk
          C5:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
          A5:     SFCATrec1.key := SFKeiouHalf
          C5:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
          A5:     SFCATrec1.key := SFKeiouHeel    
          C5:     yMinPresCLASE IN ALOVERBrec1.Aloclases
          A5:     SFCATrec1.key := SFKyMinPres
        A4:      @
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


$RL 23
{ 1st ps.pl.} 

%PDaloPL1

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:    true
  C1:    true
    C2:    true
      C3:    true
        C4:    true
          C5:    (sterkCLASE IN SUBVERBrec1.Aloclases) and
                 (SFCATrec1.key = SFKsterk)
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        A4:    ALOVERBrec1.numero := plural
      A3:    ALOVERBrec1.persona := 1
    A2:    ALOVERBrec1.aspecto := perfectivo
  A1:    ALOVERBrec1.modo := Indicativo;
         ALOVERBrec1.futuro := nofuturo
A0:    ALOVERBrec1.tiempo := Pasado


decomp: 

C0:    ALOVERBrec1.tiempo = Pasado
  C1:    (ALOVERBrec1.modo = Indicativo)  and
         (ALOVERBrec1.futuro = nofuturo)
    C2:   ALOVERBrec1.aspecto = perfectivo
      C3:    ALOVERBrec1.persona = 1
        C4:    ALOVERBrec1.numero = plural
          C5:    sterkCLASE IN ALOVERBrec1.Aloclases
          A5:    SFCATrec1.key := SFKsterk
        A4:     @
      A3:     @
    A2:     @
  A1:     @
A0:     @
&


$RL 23
{ 2nd ps.pl.} 

%PDaloPL2

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:    true
  C1:    true
    C2:    true
      C3:    true
        C4:    true
          C5:    (sterkCLASE IN SUBVERBrec1.Aloclases) and
                 (SFCATrec1.key = SFKsterk)
          A5:    ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

        A4:    ALOVERBrec1.numero := plural
      A3:    ALOVERBrec1.persona := 2
    A2:    ALOVERBrec1.aspecto := perfectivo
  A1:    ALOVERBrec1.modo := Indicativo;
         ALOVERBrec1.futuro := nofuturo
A0:    ALOVERBrec1.tiempo := Pasado


decomp: 

C0:    ALOVERBrec1.tiempo = Pasado
  C1:    (ALOVERBrec1.modo = Indicativo)  and
         (ALOVERBrec1.futuro = nofuturo)
    C2:   ALOVERBrec1.aspecto = perfectivo
      C3:    ALOVERBrec1.persona = 2
        C4:    ALOVERBrec1.numero = plural
          C5:    sterkCLASE IN ALOVERBrec1.Aloclases
          A5:    SFCATrec1.key := SFKsterk
        A4:     @
      A3:     @
    A2:     @
  A1:     @
A0:     @
&


$RL 31
{ 3rd ps.pl. } 

%PDaloPL3

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     true
    C2:     true
      C3:     true
        C4:     true
          C5:     (sterkCLASE IN SUBVERBrec1.Aloclases) and
                  (SFCATrec1.key = SFKsterk)
          A5:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

          C5:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
                  (SFCATrec1.key = SFKeiouHalf)
          A5:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

          C5:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
                  (SFCATrec1.key = SFKeiouHeel)   
          A5:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

          C5:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
                  (SFCATrec1.key = SFKyMinPres)
          A5:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)
 
        A4:     ALOVERBrec1.numero := plural
      A3:     ALOVERBrec1.persona := 3
    A2:     ALOVERBrec1.aspecto := perfectivo
  A1:     ALOVERBrec1.modo := Indicativo;
          ALOVERBrec1.futuro := nofuturo
A0:     ALOVERBrec1.tiempo := Pasado


decomp: 

C0:     ALOVERBrec1.tiempo = Pasado
  C1:    (ALOVERBrec1.modo = Indicativo)  and
         (ALOVERBrec1.futuro = nofuturo)
    C2:     ALOVERBrec1.aspecto = perfectivo
      C3:     ALOVERBrec1.persona = 3
        C4:     ALOVERBrec1.numero = plural
          C5:     sterkCLASE IN ALOVERBrec1.Aloclases
          A5:     SFCATrec1.key := SFKsterk
          C5:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
          A5:     SFCATrec1.key := SFKeiouHalf
          C5:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
          A5:     SFCATrec1.key := SFKeiouHeel    
          C5:     yMinPresCLASE IN ALOVERBrec1.Aloclases
          A5:     SFCATrec1.key := SFKyMinPres
        A4:      @
      A3:      @
    A2:      @
  A1:      @
A0:      @
&


{------------------------}

$RL 29
{ gerundio }

%GerundioALO

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:     true
  C1:     (eiouHalfCLASE IN SUBVERBrec1.Aloclases) and
          (SFCATrec1.key = SFKeiouHalf)
  A1:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

  C1:     (eiouHeelCLASE IN SUBVERBrec1.Aloclases) and
          (SFCATrec1.key = SFKeiouHeel)
  A1:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

  C1:     (yMinPresCLASE IN SUBVERBrec1.Aloclases) and
          (SFCATrec1.key = SFKyMinPres)
  A1:     ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)

A0:     ALOVERBrec1.modo := Gerundio


decomp: 

C0:     ALOVERBrec1.modo = Gerundio
  C1:     eiouHalfCLASE IN ALOVERBrec1.Aloclases
  A1:     SFCATrec1.key := SFKeiouHalf
  C1:     eiouHeelCLASE IN ALOVERBrec1.Aloclases
  A1:     SFCATrec1.key := SFKeiouHeel
  C1:     yMinPresCLASE IN ALOVERBrec1.Aloclases
  A1:     SFCATrec1.key := SFKyMinPres   
A0:      @
&


{-------------------------}

$RL 22
{ Imperfecto }

{ Only `veCLASE`, for all tenses and persons sg. & pl. }

%ImperfALO

m1: SUBVERB { SUBVERBrec1 }[mu1]
m2: SFCAT { SFCATrec1 }

m:  ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]   


comp: 

C0:   true
  C1:   true
    C2:   true
      C3:   (veCLASE IN SUBVERBrec1.Aloclases) and
            (SFCATrec1.key = SFKve)
      A3:   ALOVERBrec1 := copyT_subtoaloverb(SUBVERBrec1)
    A2:   ALOVERBrec1.aspecto := imperfectivo
  A1:   ALOVERBrec1.modo := Indicativo;
        ALOVERBrec1.futuro := nofuturo
A0:   ALOVERBrec1.tiempo := Pasado


decomp: 

C0:  ALOVERBrec1.tiempo = Pasado
  C1:    (ALOVERBrec1.modo = Indicativo)  and
         (ALOVERBrec1.futuro = nofuturo)
    C2:   ALOVERBrec1.aspecto = imperfectivo
      C3:  veCLASE IN ALOVERBrec1.Aloclases
      A3:  SFCATrec1.key := SFKve
    A2:   @
  A1:   @
A0:   @
&


{--------------------------}
{--------------------------}

$NP
{ "Irregular" rules, referring to `suffixkeys`. }

{ rule for irregular PtcPas: SFKirrPtcPas }

{ NB. Compare:%IRRPtcPas -->  rule for strong Ptc. for verbs belonging to
                                different Conjugation classes.
                                Segmentation rule in `suffix-table`.
             %PtcpasIRR -->  rule for Ptc. of verbs belonging to CONJ0,
                                i.e. the "true" irregular verbs.            
                                Segmentation rule in `freefix-table`.         }

%IRRPtcpas

m1: ALOVERB { ALOVERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]
m2: SFCAT { SFCATrec1 }

m:  VERB { VERBrec1 }[ head/SUBVERB { SUBVERBrec1 }[mu1]]  


comp: 

C0:    true
  C1:    (ALOVERBrec1.CONJclases * [ CONJ4,CONJ5,CONJ6 ])
                                                            <>[]
    C2:    true
      C3:    SFCATrec1.key = SFKirrPtcPasMascSg
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1);
             VERBrec1.numero := singular
      C3:    SFCATrec1.key = SFKirrPtcPasMascPl
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1);
             VERBrec1.numero := plural
    A2:    VERBrec1.genero := masc
    C2:    true
      C3:    SFCATrec1.key = SFKirrPtcPasFemSg
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1);
             VERBrec1.numero := singular
      C3:    SFCATrec1.key = SFKirrPtcPasFemPl
      A3:    VERBrec1 := copyT_alotoverb(ALOVERBrec1);
             VERBrec1.numero := plural
    A2:    VERBrec1.genero := fem
  A1:     @
A0:    VERBrec1.modo := PtcPas


decomp: 

C0:    VERBrec1.modo = PtcPas
  C1:    (VERBrec1.CONJclases * [ CONJ4,CONJ5,CONJ6 ] <>[] )
    C2:    VERBrec1.genero = masc
      C3:    VERBrec1.numero = singular
      A3:    SFCATrec1.key := SFKirrPtcPasMascSg
      C3:    VERBrec1.numero = plural
      A3:    SFCATrec1.key := SFKirrPtcPasMascPl
    A2:     @
    C2:    VERBrec1.genero = fem
      C3:    VERBrec1.numero = singular
      A3:    SFCATrec1.key := SFKirrPtcPasFemSg
      C3:    VERBrec1.numero = plural
      A3:    SFCATrec1.key := SFKirrPtcPasFemPl
    A2:     @
  A1:     @
A0:     @
&      


{---------------------}


$NP
{ one rule to go from SUBVERB to BVERB in generation }

%SUBBASICverb 

m1:  BVERB { BVERBrec1 }
m:   SUBVERB { SUBVERBrec1 }[ head/BVERB { BVERBrec1 }]  


comp: 

C0:    true
A0:    SUBVERBrec1 := copyT_btosubverb(BVERBrec1) 


decomp: 

C0:    true
A0:     @ 
&


{------------------------------}
{--------------------------------------------- end VERBs }

$NP

{ lextreerules for `NOUNS` }

{ rules to go from NOUN to SUBNOUN in generation }

{ singular }

%NOUNsg

m1:  SUBNOUN { SUBNOUNrec1 }[mu1]
m:   NOUN { NOUNrec1 }[ head/SUBNOUN { SUBNOUNrec1 }[mu1]]


comp: 

C0:   true
  C1:   SUBNOUNrec1.PLURALforma <> nosingular 
  A1:   NOUNrec1 := COPYT_subnountonoun(SUBNOUNrec1)
A0:   NOUNrec1.numero := singular


decomp: 

C0:   NOUNrec1.numero = singular
  C1:   NOUNrec1.PLURALforma <> nosingular 
  A1:    @
A0:    @
&



$RL 17 
{ plural without morphological change }

%sincambioNOUNpl

m1:   SUBNOUN { SUBNOUNrec1 }[mu1]
m:    NOUN { NOUNrec1 }[ head/SUBNOUN { SUBNOUNrec1 }[mu1]]


comp: 

C0:    true
  C1:    SUBNOUNrec1.PLURALforma = sincambio
  A1:    NOUNrec1 := COPYT_subnountonoun(SUBNOUNrec1)
  C1:    SUBNOUNrec1.PLURALforma = nosingular
  A1:    NOUNrec1 := COPYT_subnountonoun(SUBNOUNrec1)
A0:    NOUNrec1.numero := plural


decomp: 

C0:    NOUNrec1.numero = plural
  C1:    NOUNrec1.PLURALforma = sincambio
  A1:     @
  C1:    NOUNrec1.PLURALforma = nosingular
  A1:     @
A0:     @
&



$RL 23 
{ plural with morphological change (-s or -es), i.e. with SFK }

%cambioNOUNpl

m1:   SUBNOUN { SUBNOUNrec1 }[mu1]
m2:   SFCAT { SFCATrec1 }

m:    NOUN { NOUNrec1 }[ head/SUBNOUN { SUBNOUNrec1 }[mu1]]


comp: 

C0:    true
  C1:    (SUBNOUNrec1.PLURALforma = regular) and
         (SFCATrec1.key = SFKregPL)
  A1:    NOUNrec1 := COPYT_subnountonoun(SUBNOUNrec1)
  C1:    (SUBNOUNrec1.PLURALforma = irregular) and
         (SFCATrec1.key = SFKirrPL)
  A1:    NOUNrec1 := COPYT_subnountonoun(SUBNOUNrec1)
  C1:    (SUBNOUNrec1.PLURALforma = extran) and
         (SFCATrec1.key = SFKextranPL)
  A1:    NOUNrec1 := COPYT_subnountonoun(SUBNOUNrec1)
A0:    NOUNrec1.numero := plural


decomp: 

C0:    NOUNrec1.numero = plural
  C1:    NOUNrec1.PLURALforma = regular
  A1:    SFCATrec1.key := SFKregPL
  C1:    NOUNrec1.PLURALforma = irregular
  A1:    SFCATrec1.key := SFKirrPL
  C1:    NOUNrec1.PLURALforma = extran
  A1:    SFCATrec1.key := SFKextranPL
A0:     @ 
&


{----------------------}

$RL 17
{ one rule to go from SUBNOUN to BNOUN in generation }
{ this step involves `derivation`.                   }


%SUBBASICnoun

m1:   BNOUN { BNOUNrec1 }
m:    SUBNOUN { SUBNOUNrec1 }[ head/BNOUN { BNOUNrec1 }]


comp: 

C0:    true
A0:    SUBNOUNrec1 := COPYT_btosubnoun(BNOUNrec1)


decomp: 

C0:    true
A0:    @
&


{---------------------------- end NOUNs }

$NP
{ lextreerules for `ADJs` }


{ rules to go from ADJ to SUBADJ }

{ singular }

{ without apócope }
{ feliz, joven, comunista, etc. }
{ these ADJs never change in singular } 

%ADJsgNOCAMBIO

m1:   SUBADJ { SUBADJrec1 }[mu1]
m:    ADJ { ADJrec1 }[ head/SUBADJ { SUBADJrec1 }[mu1]]


comp: 

C0:   true
  C1:   true
    C2:   true
      C3:  true
      A3:  ADJrec1 := COPYT_subadjtoadj(SUBADJrec1);
           ADJrec1.genero := masc 
      C3:  true
      A3:  ADJrec1 := COPYT_subadjtoadj(SUBADJrec1);
           ADJrec1.genero := fem
    A2:   ADJrec1.FEMforma := nocambio
  A1:   ADJrec1.apocope := false
A0:   ADJrec1.numero := singular                      


decomp: 

C0:   ADJrec1.numero = singular
  C1:   ADJrec1.apocope = false
    C2:  ADJrec1.FEMforma = nocambio
      C3:  ADJrec1.genero = masc 
      A3:   @
      C3:  ADJrec1.genero = fem
      A3:   @
    A2:   @
  A1:   @
A0:   @                         
&



$RL 20 
{ ADJs with morph.change for fem.: guapo-guapa / holgazán-holgazana } 
{ no change of category }

%ADJsgCAMBIOfem

m1:   SUBADJ { SUBADJrec1 }[mu1]
m2:   SFCAT { SFCATrec1 }

m:    ADJ { ADJrec1 }[ head/SUBADJ { SUBADJrec1 }[mu1]]


comp: 

C0:   true
  C1:   true
    C2:   true
      C3:  (SUBADJrec1.FEMforma = normal) and
           (SFCATrec1.key = SFKregFEM)
      A3:  ADJrec1 := COPYT_subadjtoadj(SUBADJrec1)
    A2:   ADJrec1.genero := fem
  A1:   ADJrec1.apocope := false
A0:   ADJrec1.numero := singular                         


decomp: 

C0:   ADJrec1.numero = singular
  C1:   ADJrec1.apocope = false
    C2:   ADJrec1.genero = fem
      C3:  ADJrec1.FEMforma = normal
      A3:  SFCATrec1.key := SFKregFEM
    A2:    @
  A1:    @
A0:    @                         
&



{ Added November 3, 1988  EvM.
  default form in lexicon!      }

%ADJsgCAMBIOmasc

m1:   SUBADJ { SUBADJrec1 }[mu1]

m:    ADJ { ADJrec1 }[ head/SUBADJ { SUBADJrec1 }[mu1]]


comp: 

C0:   true
  C1:   true
    C2:   true
      C3:   SUBADJrec1.FEMforma <> nocambio
      A3:     @
    A2:   ADJrec1 := COPYT_subadjtoadj(SUBADJrec1);
          ADJrec1.genero := masc
  A1:   ADJrec1.apocope := false
A0:   ADJrec1.numero := singular                         


decomp: 

C0:   ADJrec1.numero = singular
  C1:   ADJrec1.apocope = false
    C2:   ADJrec1.genero = masc
      C3:  ADJrec1.FEMforma <> nocambio
      A3:    @
    A2:    @
  A1:    @
A0:    @                         
&


$RL 16 
{ ADJs with "apócope"-forms }
{ In syntax it has to be decided in which cases an ADJ is shortened }

%ApocopeADJ

m1:   SUBADJ { SUBADJrec1 }[mu1]
m2:   SFCAT { SFCATrec1 }

m:    ADJ { ADJrec1 }[ head/SUBADJ { SUBADJrec1 }[mu1]]


comp: 

C0:   SUBADJrec1.possApocope = si
  C1:   SFCATrec1.key = SFKapocope
  A1:   ADJrec1 := COPYT_subadjtoadj(SUBADJrec1);
        ADJrec1.apocope := true
A0:    @


decomp: 

C0:   ADJrec1.possApocope = si
  C1:   ADJrec1.apocope = true
  A1:   SFCATrec1.key := SFKapocope
A0:    @
&


{---------------------------}


$RL 31 
{ pluralformation; these rules change category: ADJ --> SUBADJ in generation }

{ for apócope forms see%ApocopeADJ; for plural only ciento --> cien }

{ forms without apócope }

%ADJpl

m1:   ADJ { ADJrec1 }[mu1]
m2:   SFCAT { SFCATrec1 }

m:    ADJ { ADJrec2 }[mu1]


comp: 

C0:    ADJrec1.numero = singular
  C1:    true
    C2:    (ADJrec1.PLURALforma = reg) and
           (SFCATrec1.key = SFKregPL)
    A2:    ADJrec2 := ADJrec1
    C2:    (ADJrec1.PLURALforma = irreg) and
           (SFCATrec1.key = SFKirrPL)  
    A2:    ADJrec2 := ADJrec1
  A1:    ADJrec2.apocope := false
A0:    ADJrec2.numero := plural


decomp: 

C0:    ADJrec2.numero = plural
  C1:    ADJrec2.apocope = false
    C2:    ADJrec2.PLURALforma = reg
    A2:    SFCATrec1.key := SFKregPL
    C2:    ADJrec2.PLURALforma = irreg
    A2:    SFCATrec1.key := SFKirrPL
  A1:     @
A0:     ADJrec1 := ADJrec2;
        ADJrec1.numero := singular
&


{ It is not clear to me yet if there are cases of irregular plural with ADJs }


{----------------------------}


$RL 13
{ irregular comparative; SFKirrCompar }

m1:  SUBADJ { SUBADJrec1 }
m2:  SFCAT { SFCATrec1 }

m:   ADJ { ADJrec1 }[ head/SUBADJ { SUBADJrec1 }] 


comp:

C0:    (SUBADJrec1.irrComp = si) and
       (SFCATrec1.key = SFKirrCompar)
A0:    ADJrec1 := COPYT_subadjtoadj(SUBADJrec1)



decomp:

C0:    ADJrec1.irrComp = si
A0:    SFCATrec1.key := SFKirrCompar
&

{---------------------}

$RL 18
{ one rule is needed to go from SUBADJ to BADJ in generation, in case
  no derivation rules apply.                                          }


%SUBBASICadj

m1: BADJ { BADJrec1 }
m:  SUBADJ { SUBADJrec1 }[ head/BADJ { BADJrec1 }]


comp:

C0:  true
A0:  SUBADJrec1 := COPYT_btosubadj(BADJrec1)


decomp:

C0:  true
A0:   @
&


{---------------------------- end ADJs }


$NP
{ lextreerules for `ADVs` }

{ The ADVs on -`mente`, derived from ADJs, are `derivation` in Rosetta, so 
  the rules are not included in this document for inflection.                }

{ In Spanish the following three possibilities arise:

  1) e.g. - Los niños duermen `tranquilos`.

     In this case "tranquilos" behaves as a true ADJ, agreeing in 
     number and gender with the subject. I assume this type of
     adverbial (?) function of the ADJ will be handled in the syntax.
 
  2) ADVs derived from an ADJ by adding the suffix -`mente` to the 
     feminine form of the ADJ.
     
        e.g. - Habló clar`amente`.

     If we consider this type of ADV `derivation` in Rosetta,
     with -mente being a BSUFFIX, an ordering problem can arise:
     in generation this derivation rule will have to preceede inflection,
     namely the feminine forming of the ADJ. However, the normal order is
     (1) inflection - (2) derivation in generation.
     
     The following solutions are possible, in principle:
   (i) The -`mente` form is considered an `inflected` form of the ADJ, not
       changing the category. The ADJ has the attribute "ADVmente" with
       values (true,false). e.g.:
                claramente:  ADJ with "ADVmente = true".

      Furthermore ADJs have an attribute "menteFORMA" (posible,imposible)
      to indicate if the ADJ can take the suffix -mente or not.            

  (ii) Another solution is to consider the -`mente` form `derivation`, but 
       make one rule for the feminine-forming and the addition of -mente.
       This implies that the rule change the category from ADJ to ADV.
       This has as consequence a `doubling` of the rules for feminine-forming.
       We chose for this solution in Rosetta.
       ( see the lextree-rules for `derivation`. )                           }

{-----------------------------}

{ "true" ADVs, i.e. ADVs not derived from an ADJ by adding -mente but included
  as such in the lexicon, never change form. Two rules are needed, one to go 
  from ADV to SUBADV, and one to go from SUBADV to BADV.

  NB. Unless we decide to skip the SUBADV-level since derivation never
      applies to ADVs.                                                       }


$RL 8
%ADVSUBadv

m1:  SUBADV { SUBADVrec1 }[mu1]
m:   ADV { ADVrec1 } [ head/SUBADV { SUBADVrec1 }[mu1]]


comp:

C0:   true
A0:   ADVrec1 := COPYT_subadvtoadv(SUBADVrec1)


decomp:

C0:   true
A0:    @
&



$RL 11
%SUBBASICadv

m1:  BADV { BADVrec1 }
m:   SUBADV { SUBADVrec1 } [ head/BADV { BADVrec1 }]


comp:

C0:   true
A0:   SUBADVrec1 := COPYT_btosubadv(BADVrec1)


decomp:

C0:   true
A0:    @
&



%AdjToAdvDerivMENTE

m1: ADJ { ADJrec1 } [ head/SUBADJ { SUBADJrec1 } [mu1]]
m2: SFCAT { SFCATrec1 }

m : SUBADV { SUBADVrec1 } [ complrel/SUBADJ{SUBADJrec1}[mu1],
                            head/BADVSUFF(menteBADVSUFFkey){ BADVSUFFrec1 }
                          ]


comp:

C1: (SUBADJrec1.possadv = true)                and
    (ADJrec1.genero = fem)                     and
    (ADJrec1.numero = singular)

  C2: SFCATrec1.key = SFKmente

  A2: SUBADVrec1.subcs       :=  BADVSUFFrec1.subcs;
      SUBADVrec1.Qstatus     :=  BADVSUFFrec1.Qstatus;
      SUBADVrec1.class       :=  SUBADJrec1.class;
      SUBADVrec1.tiempo      :=  SUBADJrec1.tiempo;
      SUBADVrec1.aspecto     :=  SUBADJrec1.aspecto;
      SUBADVrec1.retro       :=  SUBADJrec1.retro;
      SUBADVrec1.mood        :=  BADVSUFFrec1.mood;
      SUBADVrec1.thetaadv    :=  BADVSUFFrec1.thetaadv;
      SUBADVrec1.advpatterns :=  BADVSUFFrec1.advpatterns;
      SUBADVrec1.prepkey     :=  BADVSUFFrec1.prepkey;
      SUBADVrec1.temporal    :=  BADVSUFFrec1.temporal;
      SUBADVrec1.thanas      :=  BADVSUFFrec1.thanas

A1:  @ 


decomp:

C1:  SUBADJrec1.possadv = true

  C2: SUBADVrec1.subcs       =  BADVSUFFrec1.subcs        and
      SUBADVrec1.Qstatus     =  BADVSUFFrec1.Qstatus      and
      SUBADVrec1.class       =  SUBADJrec1.class          and
      SUBADVrec1.tiempo      =  SUBADJrec1.tiempo         and
      SUBADVrec1.aspecto     =  SUBADJrec1.aspecto        and
      SUBADVrec1.retro       =  SUBADJrec1.retro          and
      SUBADVrec1.mood        =  BADVSUFFrec1.mood         and
      SUBADVrec1.thetaadv    =  BADVSUFFrec1.thetaadv     and
      SUBADVrec1.advpatterns =  BADVSUFFrec1.advpatterns  and
      SUBADVrec1.prepkey     =  BADVSUFFrec1.prepkey      and
      SUBADVrec1.temporal    =  BADVSUFFrec1.temporal     and
      SUBADVrec1.thanas      =  BADVSUFFrec1.thanas

  A2: SFCATrec1.key := SFKmente
A1:  ADJrec1 := copyT_subadjtoadj(SUBADJrec1);
     ADJrec1.genero := fem;
     ADJrec1.numero := singular
&


{---------------------------- end ADV }


$NP
{ lextreerules for personal pronouns }

{ direct object clitics }

%DOclitics

m1:   BPERSPRO { BPERSPROrec1 }
m2:   SFCAT { SFCATrec1 }

m:    PERSPRO { PERSPROrec1 }[ head/BPERSPRO { BPERSPROrec1 }]


comp: 

C0:    true
  C1:    SFCATrec1.key = SFKcliticOD
  A1:    PERSPROrec1 := copyT_btoperspro(BPERSPROrec1);
         PERSPROrec1.cortesia := no
  C1:    true
    C2:    SFCATrec1.key = SFKcliticODm
    A2:    PERSPROrec1 := copyT_btoperspro(BPERSPROrec1);
           PERSPROrec1.genero := masc
    C2:    SFCATrec1.key = SFKcliticODf
    A2:    PERSPROrec1 := copyT_btoperspro(BPERSPROrec1);
           PERSPROrec1.genero := fem
  A1:    PERSPROrec1.cortesia := si
A0:    PERSPROrec1.forma := acusCL
C0:    SFCATrec1.key = SFKcliticOD1
A0:    PERSPROrec1 := copyT_btoperspro(BPERSPROrec1);
       PERSPROrec1.forma := acusLEcl


decomp: 

C0:    PERSPROrec1.forma = acusCL
  C1:    PERSPROrec1.cortesia = no
  A1:    SFCATrec1.key := SFKcliticOD
  C1:    PERSPROrec1.cortesia = si
    C2:    PERSPROrec1.genero = masc
    A2:    SFCATrec1.key := SFKcliticODm
    C2:    PERSPROrec1.genero = fem
    A2:    SFCATrec1.key := SFKcliticODf
  A1:     @ 
A0:     @
C0:    PERSPROrec1.forma = acusLEcl
A0:    SFCATrec1.key := SFKcliticOD1
&


$RL 15
{ indirect object clitics }

%IOclitics

m1:   BPERSPRO { BPERSPROrec1 }
m2:   SFCAT { SFCATrec1 }

m:    PERSPRO { PERSPROrec1 }[ head/BPERSPRO { BPERSPROrec1 }]


comp: 

C0:    SFCATrec1.key = SFKcliticOI
A0:    PERSPROrec1 := copyT_btoperspro(BPERSPROrec1);
       PERSPROrec1.forma := datCL


decomp: 

C0:    PERSPROrec1.forma = datCL
A0:    SFCATrec1.key := SFKcliticOI
&


$RL 15
{ strong pronouns after a preposition }

%PrepPronFuerte

m1:   BPERSPRO { BPERSPROrec1 }
m2:   SFCAT { SFCATrec1 }

m:    PERSPRO { PERSPROrec1 }[ head/BPERSPRO { BPERSPROrec1 }]


comp: 

C0:    SFCATrec1.key = SFKpronFuerte
A0:    PERSPROrec1 := copyT_btoperspro(BPERSPROrec1);
       PERSPROrec1.forma := PrepFuerte


decomp: 

C0:    PERSPROrec1.forma = PrepFuerte
A0:    SFCATrec1.key := SFKpronFuerte
&


$RL 15
{ strong pronouns; (default) "forma" NomFuerte in lexicon }

%PronNomfuerte

m1:   BPERSPRO { BPERSPROrec1 }

m:    PERSPRO { PERSPROrec1 }[ head/BPERSPRO { BPERSPROrec1 }]


comp: 

C0:    true
A0:    PERSPROrec1 := copyT_btoperspro(BPERSPROrec1);
       PERSPROrec1.forma := Nomfuerte


decomp: 

C0:    PERSPROrec1.forma = Nomfuerte
A0:     @
&


{ strong pronouns; "forma" PrepFuerte in lexicon }

%PronPrepfuerte

m1:   BPERSPRO { BPERSPROrec1 }

m:    PERSPRO { PERSPROrec1 }[ head/BPERSPRO { BPERSPROrec1 }]


comp: 

C0:    BPERSPROrec1.forma = Prepfuerte
A0:    PERSPROrec1 := copyT_btoperspro(BPERSPROrec1)


decomp: 

C0:    BPERSPROrec1.forma = Prepfuerte
A0:     @
&


$RL 4
{ reflexive clitics and pronouns are introduced syncategorematically in  }
{ the M-grammar, so they are all included in the lexicon.                }   

{---------------------------}

$RL 17
{ poss.adjectives. Two rules: sing/plur. }

%posADJsg

m1:   BPERSPRO { BPERSPROrec1 }
m2:   SFCAT { SFCATrec1 }

m:    POSSADJ { POSSADJrec1 }[ head/BPERSPRO { BPERSPROrec1 }] 


comp: 

C0:   SFCATrec1.key = SFKposAdjSing
A0:   POSSADJrec1 := copyT_bpersprotopossadj(BPERSPROrec1);
      POSSADJrec1.concordnumero := sing


decomp: 

C0:   POSSADJrec1.concordnumero = sing
A0:   SFCATrec1.key := SFKposAdjSing
&


%posADJpl

m1:   BPERSPRO { BPERSPROrec1 }
m2:   SFCAT { SFCATrec1 }

m:    POSSADJ { POSSADJrec1 }[ head/BPERSPRO { BPERSPROrec1 }] 


comp: 

C0:   SFCATrec1.key = SFKposAdjPlur
A0:   POSSADJrec1 := copyT_bpersprotopossadj(BPERSPROrec1);
      POSSADJrec1.concordnumero := plur


decomp: 

C0:   POSSADJrec1.concordnumero = plur
A0:   SFCATrec1.key := SFKposAdjPlur
&

{-------------------------}


$RL 16
{ strong poss.pronouns. Three rules: sing/singFEM/plur. }

%posPROsg

m1:   BPERSPRO { BPERSPROrec1 }
m2:   SFCAT { SFCATrec1 }

m:    POSSPRO { POSSPROrec1 }[ head/BPERSPRO { BPERSPROrec1 }] 


comp: 

C0:    true
  C1:    SFCATrec1.key = SFKposAdjFuerte
  A1:    POSSPROrec1.concordnumero := sing
A0:   POSSPROrec1 := copyT_bperstoposspro(BPERSPROrec1); 
      POSSPROrec1.concordgenero := mascul


decomp: 

C0:    POSSPROrec1.concordgenero = mascul
  C1:    POSSPROrec1.concordnumero = sing
  A1:    SFCATrec1.key := SFKposAdjFuerte
A0:     @
&


$RL 15
%posPROsgFEM

m1:   BPERSPRO { BPERSPROrec1 }
m2:   SFCAT { SFCATrec1 }

m:    POSSPRO { POSSPROrec1 }[ head/BPERSPRO { BPERSPROrec1 }] 


comp:

C0:    true
  C1:    SFCATrec1.key = SFKregFem
  A1:    POSSPROrec1.concordnumero := sing
A0:    POSSPROrec1 := copyT_bperstoposspro(BPERSPROrec1);
       POSSPROrec1.concordgenero := femin


decomp: 

C0:    POSSPROrec1.concordgenero = femin
  C1:    POSSPROrec1.concordnumero = sing
  A1:    SFCATrec1.key := SFKregFem
A0:     @
&


$RL 15
%posPROplur

m1:   POSSPRO { POSSPROrec1 }
m2:   SFCAT { SFCATrec1 }

m:    POSSPRO { POSSPROrec2 }[ head/POSSPRO { POSSPROrec1 }] 


comp: 

C0:   POSSPROrec1.concordnumero = sing
  C1:   SFCATrec1.key = SFKregPL
  A1:   POSSPROrec2 := POSSPROrec1;
        POSSPROrec1.concordnumero := plur
A0:   @

decomp: 

C0:    POSSPROrec2.concordnumero = plur
  C1:   true
  A1:   POSSPROrec1 := POSSPROrec2;
        SFCATrec1.key := SFKregPL
A0:    POSSPROrec1.concordnumero := sing 
&

{---------------------------}

$RL 27
{ demonstrative adjectives }

%DemAdj

m1:   BDEMADJ { BDEMADJrec1 }
m2:   SFCAT { SFCATrec1 }

m:    DEMADJ { DEMADJrec1 }[ head/BDEMADJ { BDEMADJrec1 }] 


comp: 

C0:    true
  C1:    SFCATrec1.key = SFKmascDEMADJpl
  A1:    DEMADJrec1 := COPYT_btodemadj(BDEMADJrec1);
         DEMADJrec1.numero := plural
A0:    DEMADJrec1.genero := masc
C0:    true
  C1:    SFCATrec1.key = SFKfemDEMADJsg
  A1:    DEMADJrec1 := COPYT_btodemadj(BDEMADJrec1);
         DEMADJrec1.numero := singular
  C1:    SFCATrec1.key = SFKfemDEMADJpl
  A1:    DEMADJrec1 := COPYT_btodemadj(BDEMADJrec1);
         DEMADJrec1.numero := plural
A0:    DEMADJrec1.genero := fem


decomp: 

C0:    DEMADJrec1.genero = masc
  C1:    DEMADJrec1.numero = plural
  A1:    SFCATrec1.key := SFKmascDEMADJpl
A0:     @
C0:    DEMADJrec1.genero = fem
  C1:    DEMADJrec1.numero = singular
  A1:    SFCATrec1.key := SFKfemDEMADJsg
  C1:    DEMADJrec1.numero = plural
  A1:    SFCATrec1.key := SFKfemDEMADJpl
A0:     @
&


{------------------------------}

{ default form; 17/1/89 EvM }

%DemAdjMascSing   

m1:   BDEMADJ { BDEMADJrec1 }

m:    DEMADJ { DEMADJrec1 }[ head/BDEMADJ { BDEMADJrec1 }] 


comp: 

C0:    true
  C1:    true
  A1:    DEMADJrec1 := COPYT_btodemadj(BDEMADJrec1);
         DEMADJrec1.numero := singular
A0:    DEMADJrec1.genero := masc


decomp: 

C0:    DEMADJrec1.genero = masc
  C1:    DEMADJrec1.numero = singular
  A1:     @
A0:     @
&


{------------------------------}


$RL 25
{ Interrogative adjectives } 

%WhADJ

m1:   BWHADJ { BWHADJrec1 }
m2:   SFCAT { SFCATrec1 }

m:    WHADJ { WHADJrec1 }[ head/BWHADJ { BWHADJrec1 }] 


comp: 

C0:   true
  C1:   true
  A1:   WHADJrec1 := copyT_btowhadj(BWHADJrec1);
        WHADJrec1.genero := masc
  C1:   true
    C2:   BWHADJrec1.feminforma = no
    A2:   WHADJrec1 := copyT_btowhadj(BWHADJrec1)
    C2:   (BWHADJrec1.feminforma = si) and
          (SFCATrec1.key = SFKregFEM)
    A2:   WHADJrec1 := copyT_btowhadj(BWHADJrec1)
  A1:   WHADJrec1.genero := fem
A0:   WHADJrec1.numero := singular


decomp: 

C0:   WHADJrec1.numero = singular
  C1:   WHADJrec1.genero = masc
  A1:    @
  C1:   WHADJrec1.genero = fem
    C2:   WHADJrec1.feminforma = no
    A2:    @
    C2:   WHADJrec1.feminforma = si
    A2:   SFCATrec1.key := SFKregFEM
  A1:    @
A0:     @
&


{-----------------------}

{ Relative pronouns are all included in the lexicon }

{-------------------------------------------}


%ProperTObpropernoun

m1:   BPROPERNOUN { BPROPERNOUNrec1 }

m:    PROPERNOUN { PROPERNOUNrec1 }[ head/BPROPERNOUN { BPROPERNOUNrec1 }]


comp: 

C0:    true
A0:    PROPERNOUNrec1 := copyT_bpropernountopropernoun(BPROPERNOUNrec1)


decomp: 

C0:    true
A0:     @
&


%WHPROtoBWHPRO

m1:   BWHPRO { BWHPROrec1 }

m:    WHPRO { WHPROrec1 }[ head/BWHPRO { BWHPROrec1 }]


comp: 

C0:    true
A0:    WHPROrec1 := copyT_BtoWHPRO(BWHPROrec1)


decomp: 

C0:    true
A0:     @
&



%DETflection

m1:   BDET { BDETrec1 }
m2:   SFCAT { SFCATrec1 }

m:    DET { DETrec1 }[ head/BDET { BDETrec1 }] 


comp: 

C0: BDETrec1.flection = true
  C1: true
    C2: SFCATrec1.key = SFKmascDETsg
    A2: DETrec1 := COPYT_bdettodet(BDETrec1);
        DETrec1.genero := masc
    C2: SFCATrec1.key = SFKfemDETsg   
    A2: DETrec1 := COPYT_bdettodet(BDETrec1);
        DETrec1.genero := fem
  A1:  DETrec1.numero := singular
  C1: true
    C2: SFCATrec1.key = SFKmascDETpl
    A2: DETrec1 := COPYT_bdettodet(BDETrec1);
        DETrec1.genero := masc
    C2: SFCATrec1.key = SFKfemDETpl
    A2: DETrec1 := COPYT_bdettodet(BDETrec1);
        DETrec1.genero := fem
  A1:  DETrec1.numero := plural
A0:  @


decomp: 

C0: BDETrec1.flection = true
  C1: DETrec1.numero = singular
    C2: DETrec1.genero = masc
    A2: SFCATrec1.key := SFKmascDETsg
    C2: DETrec1.genero = fem
    A2: SFCATrec1.key := SFKfemDETsg   
  A1:  @
  C1: DETrec1.numero = plural
    C2: DETrec1.genero = masc
    A2: SFCATrec1.key := SFKmascDETpl
    C2: DETrec1.genero = fem
    A2: SFCATrec1.key := SFKfemDETpl
  A1:  @
A0:  @
&


%DETnoflection

m1:   BDET { BDETrec1 }
m:    DET { DETrec1 }[ head/BDET { BDETrec1 }] 


comp: 

C0: BDETrec1.flection = false
A0:  @


decomp: 

C0: BDETrec1.flection = false
A0:  @
&



%CARDrule1
m1:  DIGIT{DIGITrec1}
m :  CARD{CARDrec1}[head/DIGIT{DIGITrec1}]


comp:
         C1: DIGITrec1.valeu = 1
         A1: CARDrec1.numero := singular 
         C2: DIGITrec1.valeu <> 1
         A2: CARDrec1.numero := plural

decomp:
         C1: (DIGITrec1.valeu = 1) and
             (CARDrec1.numero = singular) 
         A1: @
         C2: (DIGITrec1.valeu <> 1) and
             (CARDrec1.numero = plural)
         A2: @

&


%CARDrule2
m1:  CARD{CARDrec1}[mu1]
m2:  SFCAT{SFCATrec1}
m :  CARD{CARDrec2}
         [ head/CARD{CARDrec1}[mu1],
           complrel/DIGIT(*){DIGITrec1}
         ]

comp:
         C1: SFCATrec1.key = SFK1 
         A1: CARDrec2.numero := plural;
             DIGITrec1.key := intkey('s_1_DIGITkey'); 
             DIGITrec1.valeu := 1 

         C2: SFCATrec1.key = SFK2 
         A2: CARDrec2.numero := plural;
             DIGITrec1.key := intkey('s_2_DIGITkey'); 
             DIGITrec1.valeu := 2 

         C3: SFCATrec1.key = SFK3 
         A3: CARDrec2.numero := plural;
             DIGITrec1.key := intkey('s_3_DIGITkey'); 
             DIGITrec1.valeu := 3 

         C4: SFCATrec1.key = SFK4 
         A4: CARDrec2.numero := plural;
             DIGITrec1.key := intkey('s_4_DIGITkey'); 
             DIGITrec1.valeu := 4 

         C5: SFCATrec1.key = SFK5 
         A5: CARDrec2.numero := plural;
             DIGITrec1.key := intkey('s_5_DIGITkey'); 
             DIGITrec1.valeu := 5 

         C6: SFCATrec1.key = SFK6 
         A6: CARDrec2.numero := plural;
             DIGITrec1.key := intkey('s_6_DIGITkey'); 
             DIGITrec1.valeu := 6 

         C7: SFCATrec1.key = SFK7 
         A7: CARDrec2.numero := plural;
             DIGITrec1.key := intkey('s_7_DIGITkey'); 
             DIGITrec1.valeu := 7 

         C8: SFCATrec1.key = SFK8 
         A8: CARDrec2.numero := plural;
             DIGITrec1.key := intkey('s_8_DIGITkey'); 
             DIGITrec1.valeu := 8 

         C9: SFCATrec1.key = SFK9 
         A9: CARDrec2.numero := plural;
             DIGITrec1.key := intkey('s_9_DIGITkey'); 
             DIGITrec1.valeu := 9 

         C0: SFCATrec1.key = SFK0 
         A0: CARDrec2.numero := plural;
             DIGITrec1.key := intkey('s_0_DIGITkey'); 
             DIGITrec1.valeu := 0 

decomp:

         C1: (DIGITrec1.key = intkey('s_1_DIGITkey')) and
             (DIGITrec1.valeu = 1 )        and
             (CARDrec2.numero = plural)
         A1: SFCATrec1.key := SFK1

         C2: (DIGITrec1.key = intkey('s_2_DIGITkey')) and
             (DIGITrec1.valeu = 2)         and
             (CARDrec2.numero = plural)
         A2: SFCATrec1.key := SFK2

         C3: (DIGITrec1.key = intkey('s_3_DIGITkey')) and
             (DIGITrec1.valeu = 3)         and
             (CARDrec2.numero = plural)
         A3: SFCATrec1.key := SFK3

         C4: (DIGITrec1.key = intkey('s_4_DIGITkey')) and
             (DIGITrec1.valeu = 4)         and
             (CARDrec2.numero = plural)
         A4: SFCATrec1.key := SFK4

         C5: (DIGITrec1.key = intkey('s_5_DIGITkey')) and
             (DIGITrec1.valeu = 5)         and
             (CARDrec2.numero = plural)
         A5: SFCATrec1.key := SFK5

         C6: (DIGITrec1.key = intkey('s_6_DIGITkey')) and
             (DIGITrec1.valeu = 6)         and
             (CARDrec2.numero = plural)
         A6: SFCATrec1.key := SFK6

         C7: (DIGITrec1.key = intkey('s_7_DIGITkey')) and
             (DIGITrec1.valeu = 7)         and
             (CARDrec2.numero = plural)
         A7: SFCATrec1.key := SFK7

         C8: (DIGITrec1.key = intkey('s_8_DIGITkey')) and
             (DIGITrec1.valeu = 8)         and
             (CARDrec2.numero = plural)
         A8: SFCATrec1.key := SFK8

         C9: (DIGITrec1.key = intkey('s_9_DIGITkey')) and
             (DIGITrec1.valeu = 9)         and
             (CARDrec2.numero = plural)
         A9: SFCATrec1.key := SFK9

         C0: (DIGITrec1.key = intkey('s_0_DIGITkey')) and
             (DIGITrec1.valeu = 0)         and
             (CARDrec2.numero = plural)
         A0: SFCATrec1.key := SFK0


&

%CardTOord                                
m1: CARD{CARDrec1}[mu1]
m2: SFCAT{SFCATrec1}

m : SUBADJ{SUBADJrec1}[ complrel/CARD{CARDrec1}[mu1],
                            head/BADJSUFF(ordBADJSUFFkey){ BADJSUFFrec1 }
                      ]

comp:
       C1: SFCATrec1.KEY = SFKo    
       A1: SUBADJrec1 := COPYT_BtoSUBADJ (BADJSUFFrec1) 

decomp:
        C1:true 
A1:SFCATrec1.KEY := SFKo

&
