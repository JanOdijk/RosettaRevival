EXPORT(decomlexrules3);
pragma C_include('string.pf');
pragma C_include('strtokey.pf');
pragma C_include('ldblex.pf');
pragma C_include('listree.pf');
pragma C_include('decomlexrules3.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('maket.pf');
pragma C_include('copyt.pf');
pragma C_include('lsstree.pf');
PROGRAM decomlexrules3;
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
FUNCTION decALOSUBirrMedek_sterk(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.Aloclases = [irrMedekCLASE,sterkCLASE] THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.tiempo = Presente THEN
          BEGIN
          IF ALOVERBrec1.futuro = nofuturo THEN
            BEGIN
            IF ALOVERBrec1.numero = singular THEN
              BEGIN
              IF ALOVERBrec1.persona = 2 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1);
                  skip
                  end
                END;
              IF ALOVERBrec1.persona = 3 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1);
                  skip
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                skip
                end
              END;
            IF ALOVERBrec1.numero = plural THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1);
                skip
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
            end
          END;
        IF ALOVERBrec1.tiempo = Pasado THEN
          BEGIN
          IF ALOVERBrec1.aspecto = Imperfectivo THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1);
              skip
              end
            END;
          IF ALOVERBrec1.futuro = sifuturo THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1);
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
            end
          END;
        IF ALOVERBrec1.tiempo = Presente THEN
          BEGIN
          IF ALOVERBrec1.futuro = sifuturo THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1);
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF ALOVERBrec1.modo = Imperativo THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1);
          skip
          end
        END;
      IF ALOVERBrec1.modo = Gerundio THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1);
          skip
          end
        END;
      IF ALOVERBrec1.modo = Infinitivo THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1);
          skip
          end
        END;
      IF ALOVERBrec1.modo = PtcPas THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1);
          skip
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
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decALOSUBirrMedek_sterk:=result
end;
{:ALOSUBirrMedek_sterk}


{rule:}
{:ALOSUBdiftong_eiouHalf}
FUNCTION decALOSUBdiftong_eiouHalf(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.Aloclases = [diftongCLASE,eiouHalfCLASE] THEN
      BEGIN
      IF ALOVERBrec1.tiempo = Pasado THEN
        BEGIN
        IF ALOVERBrec1.modo = Indicativo THEN
          BEGIN
          IF ALOVERBrec1.aspecto = perfectivo THEN
            BEGIN
            IF ALOVERBrec1.persona = 1 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1);
                skip
                end
              END;
            IF ALOVERBrec1.persona = 2 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1);
                skip
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF ALOVERBrec1.modo = Infinitivo THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1);
          skip
          end
        END;
      IF ALOVERBrec1.modo = PtcPas THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1);
          skip
          end
        END;
      IF ALOVERBrec1.modo = Imperativo THEN
        BEGIN
        IF ALOVERBrec1.persona = 2 THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1);
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF ALOVERBrec1.tiempo = Presente THEN
        BEGIN
        IF ALOVERBrec1.modo = Indicativo THEN
          BEGIN
          IF ALOVERBrec1.futuro = nofuturo THEN
            BEGIN
            IF ALOVERBrec1.numero = plural THEN
              BEGIN
              IF ALOVERBrec1.persona = 1 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1);
                  skip
                  end
                END;
              IF ALOVERBrec1.persona = 2 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1);
                  skip
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                skip
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          IF ALOVERBrec1.futuro = sifuturo THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1);
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF ALOVERBrec1.tiempo = Pasado THEN
        BEGIN
        IF ALOVERBrec1.modo = Indicativo THEN
          BEGIN
          IF ALOVERBrec1.futuro = sifuturo THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1);
              skip
              end
            END;
          IF ALOVERBrec1.aspecto = imperfectivo THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1);
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decALOSUBdiftong_eiouHalf:=result
end;
{:ALOSUBdiftong_eiouHalf}


{rule:}
{:PresIndALOsg1}
FUNCTION decPresIndALOsg1(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF (ALOVERBrec1.modo = Indicativo) then
          if (ALOVERBrec1.futuro = nofuturo) THEN
        BEGIN
        IF ALOVERBrec1.persona = 1 THEN
          BEGIN
          IF ALOVERBrec1.numero = singular THEN
            BEGIN
            IF diftongCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKdiftong
                end
              END;
            IF irrMedekCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKirrMedek
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF veCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKve
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPresIndALOsg1:=result
end;
{:PresIndALOsg1}


{rule:}
{:PresIndALOsg23}
FUNCTION decPresIndALOsg23(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF (ALOVERBrec1.modo = Indicativo) then
          if (ALOVERBrec1.futuro = nofuturo) THEN
        BEGIN
        IF ALOVERBrec1.numero = singular THEN
          BEGIN
          IF ALOVERBrec1.persona = 2 THEN
            BEGIN
            IF diftongCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKdiftong
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          IF ALOVERBrec1.persona = 3 THEN
            BEGIN
            IF diftongCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKdiftong
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPresIndALOsg23:=result
end;
{:PresIndALOsg23}


{rule:}
{:PresIndALOpl3}
FUNCTION decPresIndALOpl3(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF (ALOVERBrec1.modo = Indicativo) then
          if (ALOVERBrec1.futuro = nofuturo) THEN
        BEGIN
        IF ALOVERBrec1.persona = 3 THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF diftongCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKdiftong
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPresIndALOpl3:=result
end;
{:PresIndALOpl3}


{rule:}
{:PresSubjALOsg123}
FUNCTION decPresSubjALOsg123(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.numero = singular THEN
          BEGIN
          IF ALOVERBrec1.persona = 1 THEN
            BEGIN
            IF diftongCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKdiftong
                end
              END;
            IF irrMedekCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKirrMedek
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF umlautCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKumlaut
                end
              END;
            IF veCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKve
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          IF ALOVERBrec1.persona = 2 THEN
            BEGIN
            IF diftongCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKdiftong
                end
              END;
            IF irrMedekCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKirrMedek
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF umlautCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKumlaut
                end
              END;
            IF veCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKve
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          IF ALOVERBrec1.persona = 3 THEN
            BEGIN
            IF diftongCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKdiftong
                end
              END;
            IF irrMedekCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKirrMedek
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF umlautCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKumlaut
                end
              END;
            IF veCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKve
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPresSubjALOsg123:=result
end;
{:PresSubjALOsg123}


{rule:}
{:PresSubjALOpl1}
FUNCTION decPresSubjALOpl1(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.persona = 1 THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF irrMedekCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKirrMedek
                end
              END;
            IF eiouHalfCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHalf
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF umlautCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKumlaut
                end
              END;
            IF veCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKve
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPresSubjALOpl1:=result
end;
{:PresSubjALOpl1}


{rule:}
{:PresSubjALOpl2}
FUNCTION decPresSubjALOpl2(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.persona = 2 THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF irrMedekCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKirrMedek
                end
              END;
            IF eiouHalfCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHalf
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF umlautCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKumlaut
                end
              END;
            IF veCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKve
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPresSubjALOpl2:=result
end;
{:PresSubjALOpl2}


{rule:}
{:PresSubjALOpl3}
FUNCTION decPresSubjALOpl3(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.persona = 3 THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF diftongCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKdiftong
                end
              END;
            IF irrMedekCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKirrMedek
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF umlautCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKumlaut
                end
              END;
            IF veCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKve
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPresSubjALOpl3:=result
end;
{:PresSubjALOpl3}


{rule:}
{:ImperatALOsg}
FUNCTION decImperatALOsg(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.modo = Imperativo THEN
      BEGIN
      IF ALOVERBrec1.numero = singular THEN
        BEGIN
        IF ALOVERBrec1.persona = 2 THEN
          BEGIN
          IF diftongCLASE IN ALOVERBrec1.Aloclases THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              SFCAT_rec1^.key :=  SFKdiftong
              end
            END;
          IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              SFCAT_rec1^.key :=  SFKeiouHeel
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decImperatALOsg:=result
end;
{:ImperatALOsg}


{rule:}
{:SubjPasALOsg1}
FUNCTION decSubjPasALOsg1(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.persona = 1 THEN
          BEGIN
          IF ALOVERBrec1.numero = singular THEN
            BEGIN
            IF sterkCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKsterk
                end
              END;
            IF eiouHalfCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHalf
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF yMinPresCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKyMinPres
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decSubjPasALOsg1:=result
end;
{:SubjPasALOsg1}


{rule:}
{:SubjPasALOsg2}
FUNCTION decSubjPasALOsg2(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.persona = 2 THEN
          BEGIN
          IF ALOVERBrec1.numero = singular THEN
            BEGIN
            IF sterkCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKsterk
                end
              END;
            IF eiouHalfCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHalf
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF yMinPresCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKyMinPres
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decSubjPasALOsg2:=result
end;
{:SubjPasALOsg2}


{rule:}
{:SubjPasALOsg3}
FUNCTION decSubjPasALOsg3(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.persona = 3 THEN
          BEGIN
          IF ALOVERBrec1.numero = singular THEN
            BEGIN
            IF sterkCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKsterk
                end
              END;
            IF eiouHalfCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHalf
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF yMinPresCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKyMinPres
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decSubjPasALOsg3:=result
end;
{:SubjPasALOsg3}


{rule:}
{:SubjPasALOpl1}
FUNCTION decSubjPasALOpl1(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.persona = 1 THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF sterkCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKsterk
                end
              END;
            IF eiouHalfCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHalf
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF yMinPresCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKyMinPres
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decSubjPasALOpl1:=result
end;
{:SubjPasALOpl1}


{rule:}
{:SubjPasALOpl2}
FUNCTION decSubjPasALOpl2(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.persona = 2 THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF sterkCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKsterk
                end
              END;
            IF eiouHalfCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHalf
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF yMinPresCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKyMinPres
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decSubjPasALOpl2:=result
end;
{:SubjPasALOpl2}


{rule:}
{:SubjPasALOpl3}
FUNCTION decSubjPasALOpl3(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.persona = 3 THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF sterkCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKsterk
                end
              END;
            IF eiouHalfCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHalf
                end
              END;
            IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKeiouHeel
                end
              END;
            IF yMinPresCLASE IN ALOVERBrec1.Aloclases THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKyMinPres
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decSubjPasALOpl3:=result
end;
{:SubjPasALOpl3}


{rule:}
{:PDaloSG1}
FUNCTION decPDaloSG1(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF (ALOVERBrec1.modo = Indicativo) then
          if (ALOVERBrec1.futuro = nofuturo) THEN
        BEGIN
        IF ALOVERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF ALOVERBrec1.persona = 1 THEN
            BEGIN
            IF ALOVERBrec1.numero = singular THEN
              BEGIN
              IF sterkCLASE IN ALOVERBrec1.Aloclases THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKsterk
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                skip
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPDaloSG1:=result
end;
{:PDaloSG1}


{rule:}
{:PDaloSG2}
FUNCTION decPDaloSG2(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF (ALOVERBrec1.modo = Indicativo) then
          if (ALOVERBrec1.futuro = nofuturo) THEN
        BEGIN
        IF ALOVERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF ALOVERBrec1.persona = 2 THEN
            BEGIN
            IF ALOVERBrec1.numero = singular THEN
              BEGIN
              IF sterkCLASE IN ALOVERBrec1.Aloclases THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKsterk
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                skip
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPDaloSG2:=result
end;
{:PDaloSG2}


{rule:}
{:PDaloSG3}
FUNCTION decPDaloSG3(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF (ALOVERBrec1.modo = Indicativo) then
          if (ALOVERBrec1.futuro = nofuturo) THEN
        BEGIN
        IF ALOVERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF ALOVERBrec1.persona = 3 THEN
            BEGIN
            IF ALOVERBrec1.numero = singular THEN
              BEGIN
              IF sterkCLASE IN ALOVERBrec1.Aloclases THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKsterk
                  end
                END;
              IF eiouHalfCLASE IN ALOVERBrec1.Aloclases THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKeiouHalf
                  end
                END;
              IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKeiouHeel
                  end
                END;
              IF yMinPresCLASE IN ALOVERBrec1.Aloclases THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKyMinPres
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                skip
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPDaloSG3:=result
end;
{:PDaloSG3}


{rule:}
{:PDaloPL1}
FUNCTION decPDaloPL1(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF (ALOVERBrec1.modo = Indicativo) then
          if (ALOVERBrec1.futuro = nofuturo) THEN
        BEGIN
        IF ALOVERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF ALOVERBrec1.persona = 1 THEN
            BEGIN
            IF ALOVERBrec1.numero = plural THEN
              BEGIN
              IF sterkCLASE IN ALOVERBrec1.Aloclases THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKsterk
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                skip
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPDaloPL1:=result
end;
{:PDaloPL1}


{rule:}
{:PDaloPL2}
FUNCTION decPDaloPL2(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF (ALOVERBrec1.modo = Indicativo) then
          if (ALOVERBrec1.futuro = nofuturo) THEN
        BEGIN
        IF ALOVERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF ALOVERBrec1.persona = 2 THEN
            BEGIN
            IF ALOVERBrec1.numero = plural THEN
              BEGIN
              IF sterkCLASE IN ALOVERBrec1.Aloclases THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKsterk
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                skip
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPDaloPL2:=result
end;
{:PDaloPL2}


{rule:}
{:PDaloPL3}
FUNCTION decPDaloPL3(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF (ALOVERBrec1.modo = Indicativo) then
          if (ALOVERBrec1.futuro = nofuturo) THEN
        BEGIN
        IF ALOVERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF ALOVERBrec1.persona = 3 THEN
            BEGIN
            IF ALOVERBrec1.numero = plural THEN
              BEGIN
              IF sterkCLASE IN ALOVERBrec1.Aloclases THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKsterk
                  end
                END;
              IF eiouHalfCLASE IN ALOVERBrec1.Aloclases THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKeiouHalf
                  end
                END;
              IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKeiouHeel
                  end
                END;
              IF yMinPresCLASE IN ALOVERBrec1.Aloclases THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKyMinPres
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                skip
                end
              END;
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPDaloPL3:=result
end;
{:PDaloPL3}


{rule:}
{:GerundioALO}
FUNCTION decGerundioALO(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.modo = Gerundio THEN
      BEGIN
      IF eiouHalfCLASE IN ALOVERBrec1.Aloclases THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKeiouHalf
          end
        END;
      IF eiouHeelCLASE IN ALOVERBrec1.Aloclases THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKeiouHeel
          end
        END;
      IF yMinPresCLASE IN ALOVERBrec1.Aloclases THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKyMinPres
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
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decGerundioALO:=result
end;
{:GerundioALO}


{rule:}
{:ImperfALO}
FUNCTION decImperfALO(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ALOVERBrec1:LSDOMAINT_ALOVERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF (ALOVERBrec1.modo = Indicativo) then
          if (ALOVERBrec1.futuro = nofuturo) THEN
        BEGIN
        IF ALOVERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF veCLASE IN ALOVERBrec1.Aloclases THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              SFCAT_rec1^.key :=  SFKve
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decImperfALO:=result
end;
{:ImperfALO}


{rule:}
{:IRRPtcpas}
FUNCTION decIRRPtcpas(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   VERBrec1:LSDOMAINT_VERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    ALOVERB_rec1:LSDOMAINT_pALOVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=VERB then
VERBrec1:=s^.ls^.VERBfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createinputmodel0(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel0}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createinputmodel0(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createinputmodel1}
s:=MAKET_Stree(ALOVERB);
  ALOVERB_rec1:=s^.ls^.ALOVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=           1
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF VERBrec1.modo = PtcPas THEN
      BEGIN
      IF (VERBrec1.CONJclases * [ CONJ4,CONJ5,CONJ6 ] <>[]) THEN
        BEGIN
        IF VERBrec1.genero = masc THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              SFCAT_rec1^.key :=  SFKirrPtcPasMascSg
              end
            END;
          IF VERBrec1.numero = plural THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              SFCAT_rec1^.key :=  SFKirrPtcPasMascPl
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
            end
          END;
        IF VERBrec1.genero = fem THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              SFCAT_rec1^.key :=  SFKirrPtcPasFemSg
              end
            END;
          IF VERBrec1.numero = plural THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              SFCAT_rec1^.key :=  SFKirrPtcPasFemPl
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decIRRPtcpas:=result
end;
{:IRRPtcpas}


{rule:}
{:SUBBASICverb}
FUNCTION decSUBBASICverb(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BVERBrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   BVERBrec1:LSDOMAINT_BVERBrecord;
    BVERB_rec1:LSDOMAINT_pBVERBrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BVERBrec1tree:=s;
if s^.ls^.cat=BVERB then
BVERBrec1:=s^.ls^.BVERBfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BVERBrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
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
        createinputmodels(s1);
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decSUBBASICverb:=result
end;
{:SUBBASICverb}


{rule:}
{:NOUNsg}
FUNCTION decNOUNsg(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   NOUNrec1:LSDOMAINT_NOUNrecord;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=NOUN then
NOUNrec1:=s^.ls^.NOUNfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBNOUN);
s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF NOUNrec1.numero = singular THEN
      BEGIN
      IF NOUNrec1.PLURALforma <> nosingular THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1);
          skip
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
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decNOUNsg:=result
end;
{:NOUNsg}


{rule:}
{:sincambioNOUNpl}
FUNCTION decsincambioNOUNpl(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   NOUNrec1:LSDOMAINT_NOUNrecord;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=NOUN then
NOUNrec1:=s^.ls^.NOUNfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBNOUN);
s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF NOUNrec1.numero = plural THEN
      BEGIN
      IF NOUNrec1.PLURALforma = sincambio THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1);
          skip
          end
        END;
      IF NOUNrec1.PLURALforma = nosingular THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1);
          skip
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
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decsincambioNOUNpl:=result
end;
{:sincambioNOUNpl}


{rule:}
{:cambioNOUNpl}
FUNCTION deccambioNOUNpl(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   NOUNrec1:LSDOMAINT_NOUNrecord;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=NOUN then
NOUNrec1:=s^.ls^.NOUNfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBNOUN);
s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF NOUNrec1.numero = plural THEN
      BEGIN
      IF NOUNrec1.PLURALforma = regular THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKregPL
          end
        END;
      IF NOUNrec1.PLURALforma = irregular THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKirrPL
          end
        END;
      IF NOUNrec1.PLURALforma = extran THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKextranPL
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
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
deccambioNOUNpl:=result
end;
{:cambioNOUNpl}


{rule:}
{:SUBBASICnoun}
FUNCTION decSUBBASICnoun(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BNOUNrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
   BNOUNrec1:LSDOMAINT_BNOUNrecord;
    BNOUN_rec1:LSDOMAINT_pBNOUNrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BNOUNrec1tree:=s;
if s^.ls^.cat=BNOUN then
BNOUNrec1:=s^.ls^.BNOUNfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BNOUNrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
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
        createinputmodels(s1);
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decSUBBASICnoun:=result
end;
{:SUBBASICnoun}


{rule:}
{:ADJsgNOCAMBIO}
FUNCTION decADJsgNOCAMBIO(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   ADJrec1:LSDOMAINT_ADJrecord;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBADJ);
s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ADJrec1.numero = singular THEN
      BEGIN
      IF ADJrec1.apocope = false THEN
        BEGIN
        IF ADJrec1.FEMforma = nocambio THEN
          BEGIN
          IF ADJrec1.genero = masc THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1);
              skip
              end
            END;
          IF ADJrec1.genero = fem THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1);
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decADJsgNOCAMBIO:=result
end;
{:ADJsgNOCAMBIO}


{rule:}
{:ADJsgCAMBIOfem}
FUNCTION decADJsgCAMBIOfem(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ADJrec1:LSDOMAINT_ADJrecord;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBADJ);
s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ADJrec1.numero = singular THEN
      BEGIN
      IF ADJrec1.apocope = false THEN
        BEGIN
        IF ADJrec1.genero = fem THEN
          BEGIN
          IF ADJrec1.FEMforma = normal THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              SFCAT_rec1^.key :=  SFKregFEM
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decADJsgCAMBIOfem:=result
end;
{:ADJsgCAMBIOfem}


{rule:}
{:ADJsgCAMBIOmasc}
FUNCTION decADJsgCAMBIOmasc(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   ADJrec1:LSDOMAINT_ADJrecord;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBADJ);
s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ADJrec1.numero = singular THEN
      BEGIN
      IF ADJrec1.apocope = false THEN
        BEGIN
        IF ADJrec1.genero = masc THEN
          BEGIN
          IF ADJrec1.FEMforma <> nocambio THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1);
              skip
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decADJsgCAMBIOmasc:=result
end;
{:ADJsgCAMBIOmasc}


{rule:}
{:ApocopeADJ}
FUNCTION decApocopeADJ(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ADJrec1:LSDOMAINT_ADJrecord;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBADJ);
s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ADJrec1.possApocope = si THEN
      BEGIN
      IF ADJrec1.apocope = true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKapocope
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
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decApocopeADJ:=result
end;
{:ApocopeADJ}


{rule:}
{:ADJpl}
FUNCTION decADJpl(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   ADJrec2:LSDOMAINT_ADJrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=ADJ then
ADJrec2:=s^.ls^.ADJfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(ADJ);
  ADJ_rec1:=s^.ls^.ADJfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF ADJrec2.numero = plural THEN
      BEGIN
      IF ADJrec2.apocope = false THEN
        BEGIN
        IF ADJrec2.PLURALforma = reg THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKregPL
            end
          END;
        IF ADJrec2.PLURALforma = irreg THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKirrPL
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
        ADJ_rec1^ :=  ADJrec2;
        ADJ_rec1^.numero :=  singular
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decADJpl:=result
end;
{:ADJpl}


{rule:}
{:SUBBASICadj}
FUNCTION decSUBBASICadj(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BADJrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
   BADJrec1:LSDOMAINT_BADJrecord;
    BADJ_rec1:LSDOMAINT_pBADJrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BADJrec1tree:=s;
if s^.ls^.cat=BADJ then
BADJrec1:=s^.ls^.BADJfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BADJrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
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
        createinputmodels(s1);
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decSUBBASICadj:=result
end;
{:SUBBASICadj}


{rule:}
{:ADVSUBadv}
FUNCTION decADVSUBadv(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   ADVrec1:LSDOMAINT_ADVrecord;
   SUBADVrec1:LSDOMAINT_SUBADVrecord;
    SUBADV_rec1:LSDOMAINT_pSUBADVrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBADV then
SUBADVrec1:=s^.ls^.SUBADVfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=ADV then
ADVrec1:=s^.ls^.ADVfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(SUBADV);
s^.ls^.SUBADVfield^:=SUBADVrec1;
  SUBADV_rec1:=s^.ls^.SUBADVfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
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
        createinputmodels(s1);
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decADVSUBadv:=result
end;
{:ADVSUBadv}


{rule:}
{:SUBBASICadv}
FUNCTION decSUBBASICadv(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BADVrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   SUBADVrec1:LSDOMAINT_SUBADVrecord;
   BADVrec1:LSDOMAINT_BADVrecord;
    BADV_rec1:LSDOMAINT_pBADVrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BADVrec1tree:=s;
if s^.ls^.cat=BADV then
BADVrec1:=s^.ls^.BADVfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=SUBADV then
SUBADVrec1:=s^.ls^.SUBADVfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BADVrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
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
        createinputmodels(s1);
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decSUBBASICadv:=result
end;
{:SUBBASICadv}


{rule:}
{:AdjToAdvDerivMENTE}
FUNCTION decAdjToAdvDerivMENTE(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BADVSUFFrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   SUBADVrec1:LSDOMAINT_SUBADVrecord;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
   BADVSUFFrec1:LSDOMAINT_BADVrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    BADVSUFF_rec1:LSDOMAINT_pBADVrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>complrel then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;

procedure reltreeproc2(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
STRTOKEY_getSkey('MENTEBADVSUFFKEY',hulpint);
match:=(s^.ls^.BADVSUFFfield^.key
 = hulpint);
BADVSUFFrec1tree:=s;
if s^.ls^.cat=BADVSUFF then
BADVSUFFrec1:=s^.ls^.BADVSUFFfield^
else match:=false;
skip
end;
begin{reltreeproc2}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=SUBADV then
SUBADVrec1:=s^.ls^.SUBADVfield^
else match:=false;
rs:=s^.sons;
if rs=nil then match:=false;
if match then
  begin
  reltreeproc1(rs,match);
  rs:=rs^.brother
  end;
if rs=nil then match:=false;
if match then
  begin
  reltreeproc2(rs,match);
  rs:=rs^.brother
  end;
if rs<>nil then match:=false
end;

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createinputmodel0(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel0}
s:=MAKET_Stree(SUBADJ);
s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=head;
createinputmodel0(s);
rs1^.node:=s
end;
begin{createreltreelist}
createreltree1(rs1);
rs:=rs1 
end;
begin{createinputmodel1}
s:=MAKET_Stree(ADJ);
  ADJ_rec1:=s^.ls^.ADJfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=           1
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF SUBADJrec1.possadv = true THEN
      BEGIN
      IF SUBADVrec1.subcs = BADVSUFFrec1.subcs then
          if SUBADVrec1.Qstatus = BADVSUFFrec1.Qstatus then
            if SUBADVrec1.class = SUBADJrec1.class then
              if SUBADVrec1.tiempo = SUBADJrec1.tiempo then
                if SUBADVrec1.aspecto = SUBADJrec1.aspecto then
                  if SUBADVrec1.retro = SUBADJrec1.retro then
                    if SUBADVrec1.mood = BADVSUFFrec1.mood then
                      if SUBADVrec1.thetaadv = BADVSUFFrec1.thetaadv then
                        if SUBADVrec1.advpatterns = BADVSUFFrec1.advpatterns then
                          if SUBADVrec1.prepkey = BADVSUFFrec1.prepkey then
                            if SUBADVrec1.temporal = BADVSUFFrec1.temporal then
                              if SUBADVrec1.thanas = BADVSUFFrec1.thanas THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKmente
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ADJ_rec1^ :=  copyT_subadjtoadj(SUBADJrec1);
        ADJ_rec1^.genero :=  fem;
        ADJ_rec1^.numero :=  singular
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decAdjToAdvDerivMENTE:=result
end;
{:AdjToAdvDerivMENTE}


{rule:}
{:DOclitics}
FUNCTION decDOclitics(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   PERSPROrec1:LSDOMAINT_PERSPROrecord;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=PERSPRO then
PERSPROrec1:=s^.ls^.PERSPROfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BPERSPROrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF PERSPROrec1.forma = acusCL THEN
      BEGIN
      IF PERSPROrec1.cortesia = no THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKcliticOD
          end
        END;
      IF PERSPROrec1.cortesia = si THEN
        BEGIN
        IF PERSPROrec1.genero = masc THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKcliticODm
            end
          END;
        IF PERSPROrec1.genero = fem THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKcliticODf
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
        skip
        end
      END;
    IF PERSPROrec1.forma = acusLEcl THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKcliticOD1
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decDOclitics:=result
end;
{:DOclitics}


{rule:}
{:IOclitics}
FUNCTION decIOclitics(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   PERSPROrec1:LSDOMAINT_PERSPROrecord;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=PERSPRO then
PERSPROrec1:=s^.ls^.PERSPROfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BPERSPROrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF PERSPROrec1.forma = datCL THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKcliticOI
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decIOclitics:=result
end;
{:IOclitics}


{rule:}
{:PrepPronFuerte}
FUNCTION decPrepPronFuerte(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   PERSPROrec1:LSDOMAINT_PERSPROrecord;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=PERSPRO then
PERSPROrec1:=s^.ls^.PERSPROfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BPERSPROrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF PERSPROrec1.forma = PrepFuerte THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKpronFuerte
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPrepPronFuerte:=result
end;
{:PrepPronFuerte}


{rule:}
{:PronNomfuerte}
FUNCTION decPronNomfuerte(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   PERSPROrec1:LSDOMAINT_PERSPROrecord;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=PERSPRO then
PERSPROrec1:=s^.ls^.PERSPROfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BPERSPROrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF PERSPROrec1.forma = Nomfuerte THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1);
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPronNomfuerte:=result
end;
{:PronNomfuerte}


{rule:}
{:PronPrepfuerte}
FUNCTION decPronPrepfuerte(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   PERSPROrec1:LSDOMAINT_PERSPROrecord;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=PERSPRO then
PERSPROrec1:=s^.ls^.PERSPROfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BPERSPROrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
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
        createinputmodels(s1);
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decPronPrepfuerte:=result
end;
{:PronPrepfuerte}


{rule:}
{:posADJsg}
FUNCTION decposADJsg(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   POSSADJrec1:LSDOMAINT_POSSADJrecord;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=POSSADJ then
POSSADJrec1:=s^.ls^.POSSADJfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BPERSPROrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF POSSADJrec1.concordnumero = sing THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKposAdjSing
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decposADJsg:=result
end;
{:posADJsg}


{rule:}
{:posADJpl}
FUNCTION decposADJpl(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   POSSADJrec1:LSDOMAINT_POSSADJrecord;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=POSSADJ then
POSSADJrec1:=s^.ls^.POSSADJfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BPERSPROrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF POSSADJrec1.concordnumero = plur THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKposAdjPlur
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decposADJpl:=result
end;
{:posADJpl}


{rule:}
{:posPROsg}
FUNCTION decposPROsg(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   POSSPROrec1:LSDOMAINT_POSSPROrecord;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=POSSPRO then
POSSPROrec1:=s^.ls^.POSSPROfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BPERSPROrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF POSSPROrec1.concordgenero = mascul THEN
      BEGIN
      IF POSSPROrec1.concordnumero = sing THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKposAdjFuerte
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
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decposPROsg:=result
end;
{:posPROsg}


{rule:}
{:posPROsgFEM}
FUNCTION decposPROsgFEM(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   POSSPROrec1:LSDOMAINT_POSSPROrecord;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=POSSPRO then
POSSPROrec1:=s^.ls^.POSSPROfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BPERSPROrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF POSSPROrec1.concordgenero = femin THEN
      BEGIN
      IF POSSPROrec1.concordnumero = sing THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKregFem
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
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decposPROsgFEM:=result
end;
{:posPROsgFEM}


{rule:}
{:posPROplur}
FUNCTION decposPROplur(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   POSSPROrec2:LSDOMAINT_POSSPROrecord;
   POSSPROrec1:LSDOMAINT_POSSPROrecord;
    POSSPRO_rec1:LSDOMAINT_pPOSSPROrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=POSSPRO then
POSSPROrec1:=s^.ls^.POSSPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=POSSPRO then
POSSPROrec2:=s^.ls^.POSSPROfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=MAKET_Stree(POSSPRO);
s^.ls^.POSSPROfield^:=POSSPROrec1;
  POSSPRO_rec1:=s^.ls^.POSSPROfield;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF POSSPROrec2.concordnumero = plur THEN
      BEGIN
      IF true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          POSSPRO_rec1^ :=  POSSPROrec2;
          SFCAT_rec1^.key :=  SFKregPL
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        POSSPRO_rec1^.concordnumero :=  sing
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decposPROplur:=result
end;
{:posPROplur}


{rule:}
{:DemAdj}
FUNCTION decDemAdj(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BDEMADJrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   DEMADJrec1:LSDOMAINT_DEMADJrecord;
   BDEMADJrec1:LSDOMAINT_BDEMADJrecord;
    BDEMADJ_rec1:LSDOMAINT_pBDEMADJrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BDEMADJrec1tree:=s;
if s^.ls^.cat=BDEMADJ then
BDEMADJrec1:=s^.ls^.BDEMADJfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=DEMADJ then
DEMADJrec1:=s^.ls^.DEMADJfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BDEMADJrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF DEMADJrec1.genero = masc THEN
      BEGIN
      IF DEMADJrec1.numero = plural THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKmascDEMADJpl
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        skip
        end
      END;
    IF DEMADJrec1.genero = fem THEN
      BEGIN
      IF DEMADJrec1.numero = singular THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKfemDEMADJsg
          end
        END;
      IF DEMADJrec1.numero = plural THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKfemDEMADJpl
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
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decDemAdj:=result
end;
{:DemAdj}


{rule:}
{:DemAdjMascSing}
FUNCTION decDemAdjMascSing(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BDEMADJrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   DEMADJrec1:LSDOMAINT_DEMADJrecord;
   BDEMADJrec1:LSDOMAINT_BDEMADJrecord;
    BDEMADJ_rec1:LSDOMAINT_pBDEMADJrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BDEMADJrec1tree:=s;
if s^.ls^.cat=BDEMADJ then
BDEMADJrec1:=s^.ls^.BDEMADJfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=DEMADJ then
DEMADJrec1:=s^.ls^.DEMADJfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BDEMADJrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF DEMADJrec1.genero = masc THEN
      BEGIN
      IF DEMADJrec1.numero = singular THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1);
          skip
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
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decDemAdjMascSing:=result
end;
{:DemAdjMascSing}


{rule:}
{:WhADJ}
FUNCTION decWhADJ(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BWHADJrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   WHADJrec1:LSDOMAINT_WHADJrecord;
   BWHADJrec1:LSDOMAINT_BWHADJrecord;
    BWHADJ_rec1:LSDOMAINT_pBWHADJrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BWHADJrec1tree:=s;
if s^.ls^.cat=BWHADJ then
BWHADJrec1:=s^.ls^.BWHADJfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=WHADJ then
WHADJrec1:=s^.ls^.WHADJfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BWHADJrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF WHADJrec1.numero = singular THEN
      BEGIN
      IF WHADJrec1.genero = masc THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          skip
          end
        END;
      IF WHADJrec1.genero = fem THEN
        BEGIN
        IF WHADJrec1.feminforma = no THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            skip
            end
          END;
        IF WHADJrec1.feminforma = si THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKregFEM
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decWhADJ:=result
end;
{:WhADJ}


{rule:}
{:ProperTObpropernoun}
FUNCTION decProperTObpropernoun(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BPROPERNOUNrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   PROPERNOUNrec1:LSDOMAINT_PROPERNOUNrecord;
   BPROPERNOUNrec1:LSDOMAINT_BPROPERNOUNrecord;
    BPROPERNOUN_rec1:LSDOMAINT_pBPROPERNOUNrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BPROPERNOUNrec1tree:=s;
if s^.ls^.cat=BPROPERNOUN then
BPROPERNOUNrec1:=s^.ls^.BPROPERNOUNfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=PROPERNOUN then
PROPERNOUNrec1:=s^.ls^.PROPERNOUNfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BPROPERNOUNrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
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
        createinputmodels(s1);
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decProperTObpropernoun:=result
end;
{:ProperTObpropernoun}


{rule:}
{:WHPROtoBWHPRO}
FUNCTION decWHPROtoBWHPRO(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BWHPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   WHPROrec1:LSDOMAINT_WHPROrecord;
   BWHPROrec1:LSDOMAINT_BWHPROrecord;
    BWHPRO_rec1:LSDOMAINT_pBWHPROrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BWHPROrec1tree:=s;
if s^.ls^.cat=BWHPRO then
BWHPROrec1:=s^.ls^.BWHPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=WHPRO then
WHPROrec1:=s^.ls^.WHPROfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BWHPROrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
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
        createinputmodels(s1);
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decWHPROtoBWHPRO:=result
end;
{:WHPROtoBWHPRO}


{rule:}
{:DETflection}
FUNCTION decDETflection(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BDETrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   DETrec1:LSDOMAINT_DETrecord;
   BDETrec1:LSDOMAINT_BDETrecord;
    BDET_rec1:LSDOMAINT_pBDETrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BDETrec1tree:=s;
if s^.ls^.cat=BDET then
BDETrec1:=s^.ls^.BDETfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=DET then
DETrec1:=s^.ls^.DETfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BDETrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF BDETrec1.flection = true THEN
      BEGIN
      IF DETrec1.numero = singular THEN
        BEGIN
        IF DETrec1.genero = masc THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKmascDETsg
            end
          END;
        IF DETrec1.genero = fem THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKfemDETsg
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF DETrec1.numero = plural THEN
        BEGIN
        IF DETrec1.genero = masc THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKmascDETpl
            end
          END;
        IF DETrec1.genero = fem THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKfemDETpl
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
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decDETflection:=result
end;
{:DETflection}


{rule:}
{:DETnoflection}
FUNCTION decDETnoflection(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BDETrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   DETrec1:LSDOMAINT_DETrecord;
   BDETrec1:LSDOMAINT_BDETrecord;
    BDET_rec1:LSDOMAINT_pBDETrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
BDETrec1tree:=s;
if s^.ls^.cat=BDET then
BDETrec1:=s^.ls^.BDETfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=DET then
DETrec1:=s^.ls^.DETfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BDETrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
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
        createinputmodels(s1);
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decDETnoflection:=result
end;
{:DETnoflection}


{rule:}
{:CARDrule1}
FUNCTION decCARDrule1(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
DIGITrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   s1:LSSTREE_pStree;
   CARDrec1:LSDOMAINT_CARDrecord;
   DIGITrec1:LSDOMAINT_DIGITrecord;
    DIGIT_rec1:LSDOMAINT_pDIGITrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
DIGITrec1tree:=s;
if s^.ls^.cat=DIGIT then
DIGITrec1:=s^.ls^.DIGITfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=CARD then
CARDrec1:=s^.ls^.CARDfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=DIGITrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1)
end;

begin{main body}
s1:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF (DIGITrec1.valeu = 1) then
        if (CARDrec1.numero = singular) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1);
        skip
        end
      END;
    IF (DIGITrec1.valeu <> 1) then
        if (CARDrec1.numero = plural) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1);
        skip
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decCARDrule1:=result
end;
{:CARDrule1}


{rule:}
{:CARDrule2}
FUNCTION decCARDrule2(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
DIGITrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   CARDrec2:LSDOMAINT_CARDrecord;
   CARDrec1:LSDOMAINT_CARDrecord;
   DIGITrec1:LSDOMAINT_DIGITrecord;
    CARD_rec1:LSDOMAINT_pCARDrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    DIGIT_rec1:LSDOMAINT_pDIGITrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=CARD then
CARDrec1:=s^.ls^.CARDfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;

procedure reltreeproc2(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>complrel then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
DIGITrec1tree:=s;
if s^.ls^.cat=DIGIT then
DIGITrec1:=s^.ls^.DIGITfield^
else match:=false;
skip
end;
begin{reltreeproc2}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=CARD then
CARDrec2:=s^.ls^.CARDfield^
else match:=false;
rs:=s^.sons;
if rs=nil then match:=false;
if match then
  begin
  reltreeproc1(rs,match);
  rs:=rs^.brother
  end;
if rs=nil then match:=false;
if match then
  begin
  reltreeproc2(rs,match);
  rs:=rs^.brother
  end;
if rs<>nil then match:=false
end;

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(CARD);
s^.ls^.CARDfield^:=CARDrec1;
  CARD_rec1:=s^.ls^.CARDfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF (DIGITrec1.key = intkey ( 's_1_DIGITkey' )) then
        if (DIGITrec1.valeu = 1) then
          if (CARDrec2.numero = plural) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFK1
        end
      END;
    IF (DIGITrec1.key = intkey ( 's_2_DIGITkey' )) then
        if (DIGITrec1.valeu = 2) then
          if (CARDrec2.numero = plural) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFK2
        end
      END;
    IF (DIGITrec1.key = intkey ( 's_3_DIGITkey' )) then
        if (DIGITrec1.valeu = 3) then
          if (CARDrec2.numero = plural) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFK3
        end
      END;
    IF (DIGITrec1.key = intkey ( 's_4_DIGITkey' )) then
        if (DIGITrec1.valeu = 4) then
          if (CARDrec2.numero = plural) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFK4
        end
      END;
    IF (DIGITrec1.key = intkey ( 's_5_DIGITkey' )) then
        if (DIGITrec1.valeu = 5) then
          if (CARDrec2.numero = plural) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFK5
        end
      END;
    IF (DIGITrec1.key = intkey ( 's_6_DIGITkey' )) then
        if (DIGITrec1.valeu = 6) then
          if (CARDrec2.numero = plural) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFK6
        end
      END;
    IF (DIGITrec1.key = intkey ( 's_7_DIGITkey' )) then
        if (DIGITrec1.valeu = 7) then
          if (CARDrec2.numero = plural) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFK7
        end
      END;
    IF (DIGITrec1.key = intkey ( 's_8_DIGITkey' )) then
        if (DIGITrec1.valeu = 8) then
          if (CARDrec2.numero = plural) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFK8
        end
      END;
    IF (DIGITrec1.key = intkey ( 's_9_DIGITkey' )) then
        if (DIGITrec1.valeu = 9) then
          if (CARDrec2.numero = plural) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFK9
        end
      END;
    IF (DIGITrec1.key = intkey('s_0_DIGITkey')) then
        if (DIGITrec1.valeu = 0) then
          if (CARDrec2.numero = plural) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFK0
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decCARDrule2:=result
end;
{:CARDrule2}


{rule:}
{:CardTOord}
FUNCTION decCardTOord(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BADJSUFFrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   match,success,againsuccess:BOOLEAN;
   result:LISTREE_SetOfTupleOfStrees;
   tuple:LISTREE_TupleOfStrees;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   s:LSSTREE_pStree;
   downcount,level,numberofsuccesses:INTEGER;
   Is1:LISTREE_pStree;
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
   CARDrec1:LSDOMAINT_CARDrecord;
   BADJSUFFrec1:LSDOMAINT_BADJrecord;
    CARD_rec1:LSDOMAINT_pCARDrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    BADJSUFF_rec1:LSDOMAINT_pBADJrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>complrel then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=CARD then
CARDrec1:=s^.ls^.CARDfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;

procedure reltreeproc2(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>head then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
STRTOKEY_getSkey('ORDBADJSUFFKEY',hulpint);
match:=(s^.ls^.BADJSUFFfield^.key
 = hulpint);
BADJSUFFrec1tree:=s;
if s^.ls^.cat=BADJSUFF then
BADJSUFFrec1:=s^.ls^.BADJSUFFfield^
else match:=false;
skip
end;
begin{reltreeproc2}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
else match:=false;
rs:=s^.sons;
if rs=nil then match:=false;
if match then
  begin
  reltreeproc1(rs,match);
  rs:=rs^.brother
  end;
if rs=nil then match:=false;
if match then
  begin
  reltreeproc2(rs,match);
  rs:=rs^.brother
  end;
if rs<>nil then match:=false
end;

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(CARD);
s^.ls^.CARDfield^:=CARDrec1;
  CARD_rec1:=s^.ls^.CARDfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel2}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2)
end;

begin{main body}
s1:=nil;
s2:=nil;
s:=loopholes.retype(Is,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initSetOfTupleofStrees(result);
modelproc(s,match);
WHILE againsuccess DO
  BEGIN
  againsuccess:=false;
  numberofsuccesses:=numberofsuccesses+1;
  level:=0;
  success:=false;
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
        createinputmodels(s1,s2);
        SFCAT_rec1^.KEY :=  SFKo
        end
      END;
    skip
    end;
  if success then
    begin
    LISTREE_emptytuple(tuple);
    Is1:=loopholes.retype(s1,LISTREE_pStree);
    LISTREE_addtotuple(Is1,tuple);
    Is2:=loopholes.retype(s2,LISTREE_pStree);
    LISTREE_addtotuple(Is2,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decCardTOord:=result
end;
{:CardTOord}

