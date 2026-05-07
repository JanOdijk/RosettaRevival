EXPORT(comlexrules3);
pragma C_include('string.pf');
pragma C_include('strtokey.pf');
pragma C_include('ldblex.pf');
pragma C_include('listree.pf');
pragma C_include('comlexrules3.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('maket.pf');
pragma C_include('copyt.pf');
pragma C_include('lsstree.pf');
PROGRAM comlexrules3;
WITH STRNG,LDBLEX,STRTOKEY,LISTREE,LSDOMAINT,MAKET,COPYT,LSSTREE;

PROCEDURE skip;
begin
end;
FUNCTION numberofelements(L:LSSTREE_pRelNode):INTEGER;
VAR result:INTEGER;
BEGIN
result:=0;
WHILE L<>NIL DO
 BEGIN
 result:=result+1;
 L:=L^.brother
 END;
numberofelements:=result
END;
FUNCTION intkey(str:STRING_string):INTEGER;
VAR result:INTEGER;
BEGIN
STRTOKEY_getskey(str,result);
intkey:=result
END;

{rule:}
{:ALOSUBirrMedek_sterk}
FUNCTION comALOSUBirrMedek_sterk(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF SUBVERBrec1.Aloclases = [irrMedekCLASE,sterkCLASE] THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF true THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
                  ALOVERB_rec1^.persona :=  2
                  end
                END;
              IF true THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
                  ALOVERB_rec1^.persona :=  3
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                ALOVERB_rec1^.numero :=  singular
                end
              END;
            IF true THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^.numero :=  plural
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.futuro :=  nofuturo
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.tiempo :=  Presente
            end
          END;
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
              ALOVERB_rec1^.aspecto :=  Imperfectivo
              end
            END;
          IF true THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
              ALOVERB_rec1^.futuro :=  sifuturo
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.tiempo :=  Pasado
            end
          END;
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
              ALOVERB_rec1^.futuro :=  sifuturo
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.tiempo :=  Presente
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo
          end
        END;
      IF true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
          ALOVERB_rec1^.modo :=  Imperativo
          end
        END;
      IF true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
          ALOVERB_rec1^.modo :=  Gerundio
          end
        END;
      IF true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
          ALOVERB_rec1^.modo :=  Infinitivo
          end
        END;
      IF true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
          ALOVERB_rec1^.modo :=  PtcPas
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        skip
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comALOSUBirrMedek_sterk:=result
end;
{:ALOSUBirrMedek_sterk}


{rule:}
{:ALOSUBdiftong_eiouHalf}
FUNCTION comALOSUBdiftong_eiouHalf(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF SUBVERBrec1.Aloclases = [diftongCLASE,eiouHalfCLASE] THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
                ALOVERB_rec1^.persona :=  1
                end
              END;
            IF true THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
                ALOVERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.aspecto :=  perfectivo
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.modo :=  Indicativo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.tiempo :=  Pasado
          end
        END;
      IF true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
          ALOVERB_rec1^.modo :=  Infinitivo
          end
        END;
      IF true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
          ALOVERB_rec1^.modo :=  PtcPas
          end
        END;
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
              ALOVERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  2
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Imperativo
          end
        END;
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF true THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
                  ALOVERB_rec1^.persona :=  1
                  end
                END;
              IF true THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
                  ALOVERB_rec1^.persona :=  2
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                ALOVERB_rec1^.numero :=  plural
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.futuro :=  nofuturo
              end
            END;
          IF true THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
              ALOVERB_rec1^.futuro :=  sifuturo
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.modo :=  Indicativo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.tiempo :=  Presente
          end
        END;
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
              ALOVERB_rec1^.futuro :=  sifuturo
              end
            END;
          IF true THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
              ALOVERB_rec1^.aspecto :=  imperfectivo
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.modo :=  Indicativo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.tiempo :=  Pasado
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        skip
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comALOSUBdiftong_eiouHalf:=result
end;
{:ALOSUBdiftong_eiouHalf}


{rule:}
{:PresIndALOsg1}
FUNCTION comPresIndALOsg1(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (diftongCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKdiftong) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (irrMedekCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKirrMedek) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (veCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKve) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  1
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo;
          ALOVERB_rec1^.futuro :=  nofuturo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresIndALOsg1:=result
end;
{:PresIndALOsg1}


{rule:}
{:PresIndALOsg23}
FUNCTION comPresIndALOsg23(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (diftongCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKdiftong) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.persona :=  2
              end
            END;
          IF true THEN
            BEGIN
            IF (diftongCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKdiftong) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.persona :=  3
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo;
          ALOVERB_rec1^.futuro :=  nofuturo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresIndALOsg23:=result
end;
{:PresIndALOsg23}


{rule:}
{:PresIndALOpl3}
FUNCTION comPresIndALOpl3(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (diftongCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKdiftong) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  3
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo;
          ALOVERB_rec1^.futuro :=  nofuturo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresIndALOpl3:=result
end;
{:PresIndALOpl3}


{rule:}
{:PresSubjALOsg123}
FUNCTION comPresSubjALOsg123(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (diftongCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKdiftong) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (irrMedekCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKirrMedek) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (umlautCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKumlaut) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (veCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKve) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.persona :=  1
              end
            END;
          IF true THEN
            BEGIN
            IF (diftongCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKdiftong) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (irrMedekCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKirrMedek) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (umlautCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKumlaut) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (veCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKve) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.persona :=  2
              end
            END;
          IF true THEN
            BEGIN
            IF (diftongCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKdiftong) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (irrMedekCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKirrMedek) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (umlautCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKumlaut) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (veCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKve) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.persona :=  3
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresSubjALOsg123:=result
end;
{:PresSubjALOsg123}


{rule:}
{:PresSubjALOpl1}
FUNCTION comPresSubjALOpl1(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (irrMedekCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKirrMedek) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHalfCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHalf) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (umlautCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKumlaut) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (veCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKve) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  1
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresSubjALOpl1:=result
end;
{:PresSubjALOpl1}


{rule:}
{:PresSubjALOpl2}
FUNCTION comPresSubjALOpl2(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (irrMedekCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKirrMedek) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHalfCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHalf) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (umlautCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKumlaut) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (veCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKve) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  2
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresSubjALOpl2:=result
end;
{:PresSubjALOpl2}


{rule:}
{:PresSubjALOpl3}
FUNCTION comPresSubjALOpl3(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (diftongCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKdiftong) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (irrMedekCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKirrMedek) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (umlautCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKumlaut) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (veCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKve) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  3
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresSubjALOpl3:=result
end;
{:PresSubjALOpl3}


{rule:}
{:ImperatALOsg}
FUNCTION comImperatALOsg(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF (diftongCLASE IN SUBVERBrec1.Aloclases) then
              if (SFCATrec1.key = SFKdiftong) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
              end
            END;
          IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
              if (SFCATrec1.key = SFKeiouHeel) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  2
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.numero :=  singular
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.modo :=  Imperativo
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comImperatALOsg:=result
end;
{:ImperatALOsg}


{rule:}
{:SubjPasALOsg1}
FUNCTION comSubjPasALOsg1(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (sterkCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKsterk) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHalfCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHalf) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (yMinPresCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKyMinPres) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  1
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasALOsg1:=result
end;
{:SubjPasALOsg1}


{rule:}
{:SubjPasALOsg2}
FUNCTION comSubjPasALOsg2(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (sterkCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKsterk) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHalfCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHalf) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (yMinPresCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKyMinPres) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  2
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasALOsg2:=result
end;
{:SubjPasALOsg2}


{rule:}
{:SubjPasALOsg3}
FUNCTION comSubjPasALOsg3(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (sterkCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKsterk) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHalfCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHalf) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (yMinPresCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKyMinPres) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  3
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasALOsg3:=result
end;
{:SubjPasALOsg3}


{rule:}
{:SubjPasALOpl1}
FUNCTION comSubjPasALOpl1(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (sterkCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKsterk) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHalfCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHalf) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (yMinPresCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKyMinPres) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  1
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasALOpl1:=result
end;
{:SubjPasALOpl1}


{rule:}
{:SubjPasALOpl2}
FUNCTION comSubjPasALOpl2(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (sterkCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKsterk) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHalfCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHalf) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (yMinPresCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKyMinPres) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  2
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasALOpl2:=result
end;
{:SubjPasALOpl2}


{rule:}
{:SubjPasALOpl3}
FUNCTION comSubjPasALOpl3(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF (sterkCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKsterk) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHalfCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHalf) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKeiouHeel) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            IF (yMinPresCLASE IN SUBVERBrec1.Aloclases) then
                if (SFCATrec1.key = SFKyMinPres) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.persona :=  3
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasALOpl3:=result
end;
{:SubjPasALOpl3}


{rule:}
{:PDaloSG1}
FUNCTION comPDaloSG1(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF (sterkCLASE IN SUBVERBrec1.Aloclases) then
                  if (SFCATrec1.key = SFKsterk) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                ALOVERB_rec1^.numero :=  singular
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo;
          ALOVERB_rec1^.futuro :=  nofuturo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPDaloSG1:=result
end;
{:PDaloSG1}


{rule:}
{:PDaloSG2}
FUNCTION comPDaloSG2(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF (sterkCLASE IN SUBVERBrec1.Aloclases) then
                  if (SFCATrec1.key = SFKsterk) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                ALOVERB_rec1^.numero :=  singular
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo;
          ALOVERB_rec1^.futuro :=  nofuturo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPDaloSG2:=result
end;
{:PDaloSG2}


{rule:}
{:PDaloSG3}
FUNCTION comPDaloSG3(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF (sterkCLASE IN SUBVERBrec1.Aloclases) then
                  if (SFCATrec1.key = SFKsterk) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                  end
                END;
              IF (eiouHalfCLASE IN SUBVERBrec1.Aloclases) then
                  if (SFCATrec1.key = SFKeiouHalf) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                  end
                END;
              IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                  if (SFCATrec1.key = SFKeiouHeel) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                  end
                END;
              IF (yMinPresCLASE IN SUBVERBrec1.Aloclases) then
                  if (SFCATrec1.key = SFKyMinPres) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                ALOVERB_rec1^.numero :=  singular
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.persona :=  3
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo;
          ALOVERB_rec1^.futuro :=  nofuturo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPDaloSG3:=result
end;
{:PDaloSG3}


{rule:}
{:PDaloPL1}
FUNCTION comPDaloPL1(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF (sterkCLASE IN SUBVERBrec1.Aloclases) then
                  if (SFCATrec1.key = SFKsterk) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                ALOVERB_rec1^.numero :=  plural
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo;
          ALOVERB_rec1^.futuro :=  nofuturo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPDaloPL1:=result
end;
{:PDaloPL1}


{rule:}
{:PDaloPL2}
FUNCTION comPDaloPL2(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF (sterkCLASE IN SUBVERBrec1.Aloclases) then
                  if (SFCATrec1.key = SFKsterk) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                ALOVERB_rec1^.numero :=  plural
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo;
          ALOVERB_rec1^.futuro :=  nofuturo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPDaloPL2:=result
end;
{:PDaloPL2}


{rule:}
{:PDaloPL3}
FUNCTION comPDaloPL3(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF (sterkCLASE IN SUBVERBrec1.Aloclases) then
                  if (SFCATrec1.key = SFKsterk) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                  end
                END;
              IF (eiouHalfCLASE IN SUBVERBrec1.Aloclases) then
                  if (SFCATrec1.key = SFKeiouHalf) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                  end
                END;
              IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
                  if (SFCATrec1.key = SFKeiouHeel) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                  end
                END;
              IF (yMinPresCLASE IN SUBVERBrec1.Aloclases) then
                  if (SFCATrec1.key = SFKyMinPres) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                ALOVERB_rec1^.numero :=  plural
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.persona :=  3
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo;
          ALOVERB_rec1^.futuro :=  nofuturo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPDaloPL3:=result
end;
{:PDaloPL3}


{rule:}
{:GerundioALO}
FUNCTION comGerundioALO(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF (eiouHalfCLASE IN SUBVERBrec1.Aloclases) then
          if (SFCATrec1.key = SFKeiouHalf) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
          end
        END;
      IF (eiouHeelCLASE IN SUBVERBrec1.Aloclases) then
          if (SFCATrec1.key = SFKeiouHeel) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
          end
        END;
      IF (yMinPresCLASE IN SUBVERBrec1.Aloclases) then
          if (SFCATrec1.key = SFKyMinPres) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.modo :=  Gerundio
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comGerundioALO:=result
end;
{:GerundioALO}


{rule:}
{:ImperfALO}
FUNCTION comImperfALO(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF (veCLASE IN SUBVERBrec1.Aloclases) then
              if (SFCATrec1.key = SFKve) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1)
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.aspecto :=  imperfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo;
          ALOVERB_rec1^.futuro :=  nofuturo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comImperfALO:=result
end;
{:ImperfALO}


{rule:}
{:IRRPtcpas}
FUNCTION comIRRPtcpas(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    VERB_rec1:LSDOMAINT_pVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc0(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc0}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc0(rs^.node,match)
end;
begin {modelproc1}
if s^.ls^.cat=ALOVERB then
ALOVERBrec1:=s^.ls^.ALOVERBfield^
else match:=false;
rs:=s^.sons;
if rs=nil then match:=false;
if match then
  begin
  reltreeproc1(rs,match);
  rs:=rs^.brother
  end;
if rs<>nil then match:=false
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(VERB);
  VERB_rec1:=s^.ls^.VERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF ALOVERBrec1.CONJclases * [ CONJ4,CONJ5,CONJ6 ] THEN
        BEGIN
        IF true THEN
          BEGIN
          IF SFCATrec1.key = SFKirrPtcPasMascSg THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1);
              VERB_rec1^.numero :=  singular
              end
            END;
          IF SFCATrec1.key = SFKirrPtcPasMascPl THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1);
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.genero :=  masc
            end
          END;
        IF true THEN
          BEGIN
          IF SFCATrec1.key = SFKirrPtcPasFemSg THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1);
              VERB_rec1^.numero :=  singular
              end
            END;
          IF SFCATrec1.key = SFKirrPtcPasFemPl THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1);
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.genero :=  fem
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          skip
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.modo :=  PtcPas
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comIRRPtcpas:=result
end;
{:IRRPtcpas}


{rule:}
{:SUBBASICverb}
FUNCTION comSUBBASICverb(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BVERBrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BVERBrec1:LSDOMAINT_BVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    BVERB_rec1:LSDOMAINT_pBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BVERBrec1tree:=s;
if s^.ls^.cat=BVERB then
BVERBrec1:=s^.ls^.BVERBfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BVERBrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBVERB);
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        SUBVERB_rec1^ :=  copyT_btosubverb ( BVERBrec1 )
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSUBBASICverb:=result
end;
{:SUBBASICverb}


{rule:}
{:NOUNsg}
FUNCTION comNOUNsg(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
    NOUN_rec1:LSDOMAINT_pNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBNOUN);
  s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(NOUN);
  NOUN_rec1:=s^.ls^.NOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF SUBNOUNrec1.PLURALforma <> nosingular THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        NOUN_rec1^.numero :=  singular
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comNOUNsg:=result
end;
{:NOUNsg}


{rule:}
{:sincambioNOUNpl}
FUNCTION comsincambioNOUNpl(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
    NOUN_rec1:LSDOMAINT_pNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBNOUN);
  s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(NOUN);
  NOUN_rec1:=s^.ls^.NOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF SUBNOUNrec1.PLURALforma = sincambio THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF SUBNOUNrec1.PLURALforma = nosingular THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        NOUN_rec1^.numero :=  plural
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comsincambioNOUNpl:=result
end;
{:sincambioNOUNpl}


{rule:}
{:cambioNOUNpl}
FUNCTION comcambioNOUNpl(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    NOUN_rec1:LSDOMAINT_pNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBNOUN);
  s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(NOUN);
  NOUN_rec1:=s^.ls^.NOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF (SUBNOUNrec1.PLURALforma = regular) then
          if (SFCATrec1.key = SFKregPL) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SUBNOUNrec1.PLURALforma = irregular) then
          if (SFCATrec1.key = SFKirrPL) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SUBNOUNrec1.PLURALforma = extran) then
          if (SFCATrec1.key = SFKextranPL) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        NOUN_rec1^.numero :=  plural
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comcambioNOUNpl:=result
end;
{:cambioNOUNpl}


{rule:}
{:SUBBASICnoun}
FUNCTION comSUBBASICnoun(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BNOUNrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BNOUNrec1:LSDOMAINT_BNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
    BNOUN_rec1:LSDOMAINT_pBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BNOUNrec1tree:=s;
if s^.ls^.cat=BNOUN then
BNOUNrec1:=s^.ls^.BNOUNfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BNOUNrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBNOUN);
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        SUBNOUN_rec1^ :=  COPYT_btosubnoun ( BNOUNrec1 )
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSUBBASICnoun:=result
end;
{:SUBBASICnoun}


{rule:}
{:ADJsgNOCAMBIO}
FUNCTION comADJsgNOCAMBIO(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBADJ);
  s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ADJ);
  ADJ_rec1:=s^.ls^.ADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1);
              ADJ_rec1^.genero :=  masc
              end
            END;
          IF true THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1);
              ADJ_rec1^.genero :=  fem
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ADJ_rec1^.FEMforma :=  nocambio
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ADJ_rec1^.apocope :=  false
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ADJ_rec1^.numero :=  singular
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comADJsgNOCAMBIO:=result
end;
{:ADJsgNOCAMBIO}


{rule:}
{:ADJsgCAMBIOfem}
FUNCTION comADJsgCAMBIOfem(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBADJ);
  s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ADJ);
  ADJ_rec1:=s^.ls^.ADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF (SUBADJrec1.FEMforma = normal) then
              if (SFCATrec1.key = SFKregFEM) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1)
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ADJ_rec1^.genero :=  fem
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ADJ_rec1^.apocope :=  false
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ADJ_rec1^.numero :=  singular
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comADJsgCAMBIOfem:=result
end;
{:ADJsgCAMBIOfem}


{rule:}
{:ADJsgCAMBIOmasc}
FUNCTION comADJsgCAMBIOmasc(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBADJ);
  s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ADJ);
  ADJ_rec1:=s^.ls^.ADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF SUBADJrec1.FEMforma <> nocambio THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              skip
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1);
            ADJ_rec1^.genero :=  masc
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ADJ_rec1^.apocope :=  false
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ADJ_rec1^.numero :=  singular
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comADJsgCAMBIOmasc:=result
end;
{:ADJsgCAMBIOmasc}


{rule:}
{:ApocopeADJ}
FUNCTION comApocopeADJ(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBADJ);
  s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ADJ);
  ADJ_rec1:=s^.ls^.ADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF SUBADJrec1.possApocope = si THEN
      BEGIN
      IF SFCATrec1.key = SFKapocope THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1);
          ADJ_rec1^.apocope :=  true
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        skip
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comApocopeADJ:=result
end;
{:ApocopeADJ}


{rule:}
{:ADJpl}
FUNCTION comADJpl(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   ADJrec1:LSDOMAINT_ADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADJ_rec2:LSDOMAINT_pADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=ADJ then
ADJrec1:=s^.ls^.ADJfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(ADJ);
  ADJ_rec2:=s^.ls^.ADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ADJrec1.numero = singular THEN
      BEGIN
      IF true THEN
        BEGIN
        IF (ADJrec1.PLURALforma = reg) then
            if (SFCATrec1.key = SFKregPL) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            ADJ_rec2^ :=  ADJrec1
            end
          END;
        IF (ADJrec1.PLURALforma = irreg) then
            if (SFCATrec1.key = SFKirrPL) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            ADJ_rec2^ :=  ADJrec1
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ADJ_rec2^.apocope :=  false
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ADJ_rec2^.numero :=  plural
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comADJpl:=result
end;
{:ADJpl}


{rule:}
{:SUBBASICadj}
FUNCTION comSUBBASICadj(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BADJrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BADJrec1:LSDOMAINT_BADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
    BADJ_rec1:LSDOMAINT_pBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BADJrec1tree:=s;
if s^.ls^.cat=BADJ then
BADJrec1:=s^.ls^.BADJfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BADJrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBADJ);
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        SUBADJ_rec1^ :=  COPYT_btosubadj ( BADJrec1 )
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSUBBASICadj:=result
end;
{:SUBBASICadj}


{rule:}
{:ADVSUBadv}
FUNCTION comADVSUBadv(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBADVrec1:LSDOMAINT_SUBADVrecord;
    ADV_rec1:LSDOMAINT_pADVrecord;
    SUBADV_rec1:LSDOMAINT_pSUBADVrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADV then
SUBADVrec1:=s^.ls^.SUBADVfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBADV);
  s^.ls^.SUBADVfield^:=SUBADVrec1;
  SUBADV_rec1:=s^.ls^.SUBADVfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(ADV);
  ADV_rec1:=s^.ls^.ADVfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        ADV_rec1^ :=  COPYT_subadvtoadv ( SUBADVrec1 )
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comADVSUBadv:=result
end;
{:ADVSUBadv}


{rule:}
{:SUBBASICadv}
FUNCTION comSUBBASICadv(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BADVrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BADVrec1:LSDOMAINT_BADVrecord;
    SUBADV_rec1:LSDOMAINT_pSUBADVrecord;
    BADV_rec1:LSDOMAINT_pBADVrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BADVrec1tree:=s;
if s^.ls^.cat=BADV then
BADVrec1:=s^.ls^.BADVfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BADVrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBADV);
  SUBADV_rec1:=s^.ls^.SUBADVfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        SUBADV_rec1^ :=  COPYT_btosubadv ( BADVrec1 )
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSUBBASICadv:=result
end;
{:SUBBASICadv}


{rule:}
{:AdjToAdvDerivMENTE}
FUNCTION comAdjToAdvDerivMENTE(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BADVSUFFrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   ADJrec1:LSDOMAINT_ADJrecord;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   BADVSUFFrec1:LSDOMAINT_BADVrecord;
    SUBADV_rec1:LSDOMAINT_pSUBADVrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
    BADVSUFF_rec1:LSDOMAINT_pBADVrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc0(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc0}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc0(rs^.node,match)
end;
begin {modelproc1}
if s^.ls^.cat=ADJ then
ADJrec1:=s^.ls^.ADJfield^
else match:=false;
rs:=s^.sons;
if rs=nil then match:=false;
if match then
  begin
  reltreeproc1(rs,match);
  rs:=rs^.brother
  end;
if rs<>nil then match:=false
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBADJ);
  s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=complrel;
createoutputtree(s);
rs1^.node:=s
end;
procedure createreltree2(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
StrToKey_GetSkey('MENTEBADVSUFFKEY',hulpint);
hulpstree:=LDBLEX_read(hulpint);
s:=Loopholes.retype(hulpstree,LSSTREE_pstree);
BADVSUFFrec1:=s^.ls^.BADVSUFFfield^;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree2}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 ;
rs2:=rs1;
createreltree2(rs1);
rs2^.brother:=rs1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBADV);
  SUBADV_rec1:=s^.ls^.SUBADVfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           2
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF (SUBADJrec1.possadv = true) then
        if (ADJrec1.genero = fem) then
          if (ADJrec1.numero = singular) THEN
      BEGIN
      IF SFCATrec1.key = SFKmente THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          SUBADV_rec1^.subcs :=  BADVSUFFrec1.subcs;
          SUBADV_rec1^.Qstatus :=  BADVSUFFrec1.Qstatus;
          SUBADV_rec1^.class :=  SUBADJrec1.class;
          SUBADV_rec1^.tiempo :=  SUBADJrec1.tiempo;
          SUBADV_rec1^.aspecto :=  SUBADJrec1.aspecto;
          SUBADV_rec1^.retro :=  SUBADJrec1.retro;
          SUBADV_rec1^.mood :=  BADVSUFFrec1.mood;
          SUBADV_rec1^.thetaadv :=  BADVSUFFrec1.thetaadv;
          SUBADV_rec1^.advpatterns :=  BADVSUFFrec1.advpatterns;
          SUBADV_rec1^.prepkey :=  BADVSUFFrec1.prepkey;
          SUBADV_rec1^.temporal :=  BADVSUFFrec1.temporal;
          SUBADV_rec1^.thanas :=  BADVSUFFrec1.thanas
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        skip
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comAdjToAdvDerivMENTE:=result
end;
{:AdjToAdvDerivMENTE}


{rule:}
{:DOclitics}
FUNCTION comDOclitics(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    PERSPRO_rec1:LSDOMAINT_pPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BPERSPROrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(PERSPRO);
  PERSPRO_rec1:=s^.ls^.PERSPROfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF SFCATrec1.key = SFKcliticOD THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          PERSPRO_rec1^ :=  copyT_btoperspro(BPERSPROrec1);
          PERSPRO_rec1^.cortesia :=  no
          end
        END;
      IF true THEN
        BEGIN
        IF SFCATrec1.key = SFKcliticODm THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            PERSPRO_rec1^ :=  copyT_btoperspro(BPERSPROrec1);
            PERSPRO_rec1^.genero :=  masc
            end
          END;
        IF SFCATrec1.key = SFKcliticODf THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            PERSPRO_rec1^ :=  copyT_btoperspro(BPERSPROrec1);
            PERSPRO_rec1^.genero :=  fem
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          PERSPRO_rec1^.cortesia :=  si
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        PERSPRO_rec1^.forma :=  acusCL
        end
      END;
    IF SFCATrec1.key = SFKcliticOD1 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        PERSPRO_rec1^ :=  copyT_btoperspro(BPERSPROrec1);
        PERSPRO_rec1^.forma :=  acusLEcl
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comDOclitics:=result
end;
{:DOclitics}


{rule:}
{:IOclitics}
FUNCTION comIOclitics(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    PERSPRO_rec1:LSDOMAINT_pPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BPERSPROrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(PERSPRO);
  PERSPRO_rec1:=s^.ls^.PERSPROfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF SFCATrec1.key = SFKcliticOI THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        PERSPRO_rec1^ :=  copyT_btoperspro ( BPERSPROrec1 );
        PERSPRO_rec1^.forma :=  datCL
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comIOclitics:=result
end;
{:IOclitics}


{rule:}
{:PrepPronFuerte}
FUNCTION comPrepPronFuerte(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    PERSPRO_rec1:LSDOMAINT_pPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BPERSPROrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(PERSPRO);
  PERSPRO_rec1:=s^.ls^.PERSPROfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF SFCATrec1.key = SFKpronFuerte THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        PERSPRO_rec1^ :=  copyT_btoperspro ( BPERSPROrec1 );
        PERSPRO_rec1^.forma :=  PrepFuerte
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPrepPronFuerte:=result
end;
{:PrepPronFuerte}


{rule:}
{:PronNomfuerte}
FUNCTION comPronNomfuerte(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    PERSPRO_rec1:LSDOMAINT_pPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BPERSPROrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(PERSPRO);
  PERSPRO_rec1:=s^.ls^.PERSPROfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        PERSPRO_rec1^ :=  copyT_btoperspro ( BPERSPROrec1 );
        PERSPRO_rec1^.forma :=  Nomfuerte
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPronNomfuerte:=result
end;
{:PronNomfuerte}


{rule:}
{:PronPrepfuerte}
FUNCTION comPronPrepfuerte(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    PERSPRO_rec1:LSDOMAINT_pPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BPERSPROrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(PERSPRO);
  PERSPRO_rec1:=s^.ls^.PERSPROfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF BPERSPROrec1.forma = Prepfuerte THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        PERSPRO_rec1^ :=  copyT_btoperspro ( BPERSPROrec1 )
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPronPrepfuerte:=result
end;
{:PronPrepfuerte}


{rule:}
{:posADJsg}
FUNCTION composADJsg(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    POSSADJ_rec1:LSDOMAINT_pPOSSADJrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BPERSPROrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(POSSADJ);
  POSSADJ_rec1:=s^.ls^.POSSADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF SFCATrec1.key = SFKposAdjSing THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        POSSADJ_rec1^ :=  copyT_bpersprotopossadj ( BPERSPROrec1 );
        POSSADJ_rec1^.concordnumero :=  sing
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
composADJsg:=result
end;
{:posADJsg}


{rule:}
{:posADJpl}
FUNCTION composADJpl(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    POSSADJ_rec1:LSDOMAINT_pPOSSADJrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BPERSPROrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(POSSADJ);
  POSSADJ_rec1:=s^.ls^.POSSADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF SFCATrec1.key = SFKposAdjPlur THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        POSSADJ_rec1^ :=  copyT_bpersprotopossadj ( BPERSPROrec1 );
        POSSADJ_rec1^.concordnumero :=  plur
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
composADJpl:=result
end;
{:posADJpl}


{rule:}
{:posPROsg}
FUNCTION composPROsg(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    POSSPRO_rec1:LSDOMAINT_pPOSSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BPERSPROrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(POSSPRO);
  POSSPRO_rec1:=s^.ls^.POSSPROfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF SFCATrec1.key = SFKposAdjFuerte THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          POSSPRO_rec1^.concordnumero :=  sing
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        POSSPRO_rec1^ :=  copyT_bperstoposspro(BPERSPROrec1);
        POSSPRO_rec1^.concordgenero :=  mascul
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
composPROsg:=result
end;
{:posPROsg}


{rule:}
{:posPROsgFEM}
FUNCTION composPROsgFEM(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    POSSPRO_rec1:LSDOMAINT_pPOSSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BPERSPROrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(POSSPRO);
  POSSPRO_rec1:=s^.ls^.POSSPROfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF SFCATrec1.key = SFKregFem THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          POSSPRO_rec1^.concordnumero :=  sing
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        POSSPRO_rec1^ :=  copyT_bperstoposspro(BPERSPROrec1);
        POSSPRO_rec1^.concordgenero :=  femin
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
composPROsgFEM:=result
end;
{:posPROsgFEM}


{rule:}
{:posPROplur}
FUNCTION composPROplur(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   POSSPROrec1:LSDOMAINT_POSSPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    POSSPRO_rec2:LSDOMAINT_pPOSSPROrecord;
    POSSPRO_rec1:LSDOMAINT_pPOSSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=POSSPRO then
POSSPROrec1:=s^.ls^.POSSPROfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
  s:=MAKET_Stree(POSSPRO);
  s^.ls^.POSSPROfield^:=POSSPROrec1;
  POSSPRO_rec1:=s^.ls^.POSSPROfield;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(POSSPRO);
  POSSPRO_rec2:=s^.ls^.POSSPROfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF POSSPROrec1.concordnumero = sing THEN
      BEGIN
      IF SFCATrec1.key = SFKregPL THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          POSSPRO_rec2^ :=  POSSPROrec1;
          POSSPRO_rec1^.concordnumero :=  plur
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        skip
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
composPROplur:=result
end;
{:posPROplur}


{rule:}
{:DemAdj}
FUNCTION comDemAdj(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BDEMADJrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BDEMADJrec1:LSDOMAINT_BDEMADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    DEMADJ_rec1:LSDOMAINT_pDEMADJrecord;
    BDEMADJ_rec1:LSDOMAINT_pBDEMADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BDEMADJrec1tree:=s;
if s^.ls^.cat=BDEMADJ then
BDEMADJrec1:=s^.ls^.BDEMADJfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BDEMADJrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(DEMADJ);
  DEMADJ_rec1:=s^.ls^.DEMADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF SFCATrec1.key = SFKmascDEMADJpl THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          DEMADJ_rec1^ :=  COPYT_btodemadj(BDEMADJrec1);
          DEMADJ_rec1^.numero :=  plural
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        DEMADJ_rec1^.genero :=  masc
        end
      END;
    IF true THEN
      BEGIN
      IF SFCATrec1.key = SFKfemDEMADJsg THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          DEMADJ_rec1^ :=  COPYT_btodemadj(BDEMADJrec1);
          DEMADJ_rec1^.numero :=  singular
          end
        END;
      IF SFCATrec1.key = SFKfemDEMADJpl THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          DEMADJ_rec1^ :=  COPYT_btodemadj(BDEMADJrec1);
          DEMADJ_rec1^.numero :=  plural
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        DEMADJ_rec1^.genero :=  fem
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comDemAdj:=result
end;
{:DemAdj}


{rule:}
{:DemAdjMascSing}
FUNCTION comDemAdjMascSing(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BDEMADJrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BDEMADJrec1:LSDOMAINT_BDEMADJrecord;
    DEMADJ_rec1:LSDOMAINT_pDEMADJrecord;
    BDEMADJ_rec1:LSDOMAINT_pBDEMADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BDEMADJrec1tree:=s;
if s^.ls^.cat=BDEMADJ then
BDEMADJrec1:=s^.ls^.BDEMADJfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BDEMADJrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(DEMADJ);
  DEMADJ_rec1:=s^.ls^.DEMADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          DEMADJ_rec1^ :=  COPYT_btodemadj(BDEMADJrec1);
          DEMADJ_rec1^.numero :=  singular
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        DEMADJ_rec1^.genero :=  masc
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comDemAdjMascSing:=result
end;
{:DemAdjMascSing}


{rule:}
{:WhADJ}
FUNCTION comWhADJ(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BWHADJrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BWHADJrec1:LSDOMAINT_BWHADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    WHADJ_rec1:LSDOMAINT_pWHADJrecord;
    BWHADJ_rec1:LSDOMAINT_pBWHADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BWHADJrec1tree:=s;
if s^.ls^.cat=BWHADJ then
BWHADJrec1:=s^.ls^.BWHADJfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BWHADJrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(WHADJ);
  WHADJ_rec1:=s^.ls^.WHADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      IF true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          WHADJ_rec1^ :=  copyT_btowhadj(BWHADJrec1);
          WHADJ_rec1^.genero :=  masc
          end
        END;
      IF true THEN
        BEGIN
        IF BWHADJrec1.feminforma = no THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            WHADJ_rec1^ :=  copyT_btowhadj(BWHADJrec1)
            end
          END;
        IF (BWHADJrec1.feminforma = si) then
            if (SFCATrec1.key = SFKregFEM) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            WHADJ_rec1^ :=  copyT_btowhadj(BWHADJrec1)
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          WHADJ_rec1^.genero :=  fem
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        WHADJ_rec1^.numero :=  singular
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comWhADJ:=result
end;
{:WhADJ}


{rule:}
{:ProperTObpropernoun}
FUNCTION comProperTObpropernoun(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPROPERNOUNrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPROPERNOUNrec1:LSDOMAINT_BPROPERNOUNrecord;
    PROPERNOUN_rec1:LSDOMAINT_pPROPERNOUNrecord;
    BPROPERNOUN_rec1:LSDOMAINT_pBPROPERNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPROPERNOUNrec1tree:=s;
if s^.ls^.cat=BPROPERNOUN then
BPROPERNOUNrec1:=s^.ls^.BPROPERNOUNfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BPROPERNOUNrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(PROPERNOUN);
  PROPERNOUN_rec1:=s^.ls^.PROPERNOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        PROPERNOUN_rec1^ :=  copyT_bpropernountopropernoun ( BPROPERNOUNrec1 )
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comProperTObpropernoun:=result
end;
{:ProperTObpropernoun}


{rule:}
{:WHPROtoBWHPRO}
FUNCTION comWHPROtoBWHPRO(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BWHPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BWHPROrec1:LSDOMAINT_BWHPROrecord;
    WHPRO_rec1:LSDOMAINT_pWHPROrecord;
    BWHPRO_rec1:LSDOMAINT_pBWHPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BWHPROrec1tree:=s;
if s^.ls^.cat=BWHPRO then
BWHPROrec1:=s^.ls^.BWHPROfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BWHPROrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(WHPRO);
  WHPRO_rec1:=s^.ls^.WHPROfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF true THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        WHPRO_rec1^ :=  copyT_BtoWHPRO ( BWHPROrec1 )
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comWHPROtoBWHPRO:=result
end;
{:WHPROtoBWHPRO}


{rule:}
{:DETflection}
FUNCTION comDETflection(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BDETrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BDETrec1:LSDOMAINT_BDETrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    DET_rec1:LSDOMAINT_pDETrecord;
    BDET_rec1:LSDOMAINT_pBDETrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BDETrec1tree:=s;
if s^.ls^.cat=BDET then
BDETrec1:=s^.ls^.BDETfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BDETrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(DET);
  DET_rec1:=s^.ls^.DETfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF BDETrec1.flection = true THEN
      BEGIN
      IF true THEN
        BEGIN
        IF SFCATrec1.key = SFKmascDETsg THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            DET_rec1^ :=  COPYT_bdettodet(BDETrec1);
            DET_rec1^.genero :=  masc
            end
          END;
        IF SFCATrec1.key = SFKfemDETsg THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            DET_rec1^ :=  COPYT_bdettodet(BDETrec1);
            DET_rec1^.genero :=  fem
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          DET_rec1^.numero :=  singular
          end
        END;
      IF true THEN
        BEGIN
        IF SFCATrec1.key = SFKmascDETpl THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            DET_rec1^ :=  COPYT_bdettodet(BDETrec1);
            DET_rec1^.genero :=  masc
            end
          END;
        IF SFCATrec1.key = SFKfemDETpl THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            DET_rec1^ :=  COPYT_bdettodet(BDETrec1);
            DET_rec1^.genero :=  fem
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          DET_rec1^.numero :=  plural
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        skip
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comDETflection:=result
end;
{:DETflection}


{rule:}
{:DETnoflection}
FUNCTION comDETnoflection(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BDETrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BDETrec1:LSDOMAINT_BDETrecord;
    DET_rec1:LSDOMAINT_pDETrecord;
    BDET_rec1:LSDOMAINT_pBDETrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BDETrec1tree:=s;
if s^.ls^.cat=BDET then
BDETrec1:=s^.ls^.BDETfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=BDETrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(DET);
  DET_rec1:=s^.ls^.DETfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF BDETrec1.flection = false THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        skip
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comDETnoflection:=result
end;
{:DETnoflection}


{rule:}
{:CARDrule1}
FUNCTION comCARDrule1(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
DIGITrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   DIGITrec1:LSDOMAINT_DIGITrecord;
    CARD_rec1:LSDOMAINT_pCARDrecord;
    DIGIT_rec1:LSDOMAINT_pDIGITrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
DIGITrec1tree:=s;
if s^.ls^.cat=DIGIT then
DIGITrec1:=s^.ls^.DIGITfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=DIGITrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createoutputtree}
  s:=MAKET_Stree(CARD);
  CARD_rec1:=s^.ls^.CARDfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF DIGITrec1.valeu = 1 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec1^.numero :=  singular
        end
      END;
    IF DIGITrec1.valeu <> 1 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec1^.numero :=  plural
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comCARDrule1:=result
end;
{:CARDrule1}


{rule:}
{:CARDrule2}
FUNCTION comCARDrule2(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
DIGITrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   CARDrec1:LSDOMAINT_CARDrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   DIGITrec1:LSDOMAINT_DIGITrecord;
    CARD_rec2:LSDOMAINT_pCARDrecord;
    CARD_rec1:LSDOMAINT_pCARDrecord;
    DIGIT_rec1:LSDOMAINT_pDIGITrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=CARD then
CARDrec1:=s^.ls^.CARDfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(CARD);
  s^.ls^.CARDfield^:=CARDrec1;
  CARD_rec1:=s^.ls^.CARDfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
procedure createreltree2(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=MAKET_stree(DIGIT);
DIGIT_rec1:=s^.ls^.DIGITfield;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree2}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=complrel;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 ;
rs2:=rs1;
createreltree2(rs1);
rs2^.brother:=rs1
end;
begin{createoutputtree}
  s:=MAKET_Stree(CARD);
  CARD_rec2:=s^.ls^.CARDfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           2
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF SFCATrec1.key = SFK1 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.numero :=  plural;
        DIGIT_rec1^.key :=  intkey('s_1_DIGITkey');
        DIGIT_rec1^.valeu :=  1
        end
      END;
    IF SFCATrec1.key = SFK2 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.numero :=  plural;
        DIGIT_rec1^.key :=  intkey('s_2_DIGITkey');
        DIGIT_rec1^.valeu :=  2
        end
      END;
    IF SFCATrec1.key = SFK3 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.numero :=  plural;
        DIGIT_rec1^.key :=  intkey('s_3_DIGITkey');
        DIGIT_rec1^.valeu :=  3
        end
      END;
    IF SFCATrec1.key = SFK4 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.numero :=  plural;
        DIGIT_rec1^.key :=  intkey('s_4_DIGITkey');
        DIGIT_rec1^.valeu :=  4
        end
      END;
    IF SFCATrec1.key = SFK5 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.numero :=  plural;
        DIGIT_rec1^.key :=  intkey('s_5_DIGITkey');
        DIGIT_rec1^.valeu :=  5
        end
      END;
    IF SFCATrec1.key = SFK6 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.numero :=  plural;
        DIGIT_rec1^.key :=  intkey('s_6_DIGITkey');
        DIGIT_rec1^.valeu :=  6
        end
      END;
    IF SFCATrec1.key = SFK7 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.numero :=  plural;
        DIGIT_rec1^.key :=  intkey('s_7_DIGITkey');
        DIGIT_rec1^.valeu :=  7
        end
      END;
    IF SFCATrec1.key = SFK8 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.numero :=  plural;
        DIGIT_rec1^.key :=  intkey('s_8_DIGITkey');
        DIGIT_rec1^.valeu :=  8
        end
      END;
    IF SFCATrec1.key = SFK9 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.numero :=  plural;
        DIGIT_rec1^.key :=  intkey('s_9_DIGITkey');
        DIGIT_rec1^.valeu :=  9
        end
      END;
    IF SFCATrec1.key = SFK0 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.numero :=  plural;
        DIGIT_rec1^.key :=  intkey('s_0_DIGITkey');
        DIGIT_rec1^.valeu :=  0
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comCARDrule2:=result
end;
{:CARDrule2}


{rule:}
{:CardTOord}
FUNCTION comCardTOord(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BADJSUFFrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   CARDrec1:LSDOMAINT_CARDrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   BADJSUFFrec1:LSDOMAINT_BADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
    CARD_rec1:LSDOMAINT_pCARDrecord;
    BADJSUFF_rec1:LSDOMAINT_pBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=CARD then
CARDrec1:=s^.ls^.CARDfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;

procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createoutputtree}
  s:=MAKET_Stree(CARD);
  s^.ls^.CARDfield^:=CARDrec1;
  CARD_rec1:=s^.ls^.CARDfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=complrel;
createoutputtree(s);
rs1^.node:=s
end;
procedure createreltree2(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
StrToKey_GetSkey('ORDBADJSUFFKEY',hulpint);
hulpstree:=LDBLEX_read(hulpint);
s:=Loopholes.retype(hulpstree,LSSTREE_pstree);
BADJSUFFrec1:=s^.ls^.BADJSUFFfield^;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree2}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createoutputtree(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 ;
rs2:=rs1;
createreltree2(rs1);
rs2^.brother:=rs1
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBADJ);
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           2
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF SFCATrec1.KEY = SFKo THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        SUBADJ_rec1^ :=  COPYT_BtoSUBADJ (BADJSUFFrec1)
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comCardTOord:=result
end;
{:CardTOord}

