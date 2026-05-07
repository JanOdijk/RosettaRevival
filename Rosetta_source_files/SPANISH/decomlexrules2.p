EXPORT(decomlexrules2);
pragma C_include('string.pf');
pragma C_include('ldblex.pf');
pragma C_include('strtokey.pf');
pragma C_include('listree.pf');
pragma C_include('decomlexrules2.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('maket.pf');
pragma C_include('copyt.pf');
pragma C_include('lsstree.pf');
PROGRAM decomlexrules2;
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
{:CondicPL2}
FUNCTION decCondicPL2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKari1ais
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeri1ais
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiri1ais
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
            ALOVERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          ALOVERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKari1ais
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeri1ais
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiri1ais
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
decCondicPL2:=result
end;
{:CondicPL2}


{rule:}
{:ImperatPL}
FUNCTION decImperatPL(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.modo = Imperativo) THEN
      BEGIN
      IF VERBrec1.numero = plural THEN
        BEGIN
        IF VERBrec1.persona = 2 THEN
          BEGIN
          IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKad
              end
            END;
          IF (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKed
              end
            END;
          IF (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKid
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
          ALOVERB_rec1^.numero :=  plural
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.modo :=  Imperativo
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.modo = Imperativo) THEN
      BEGIN
      IF VERBrec1.numero = plural THEN
        BEGIN
        IF VERBrec1.persona = 2 THEN
          BEGIN
          IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKad
              end
            END;
          IF (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKed
              end
            END;
          IF (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKid
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
decImperatPL:=result
end;
{:ImperatPL}


{rule:}
{:PresIndPL3}
FUNCTION decPresIndPL3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF VERBrec1.futuro = nofuturo THEN
              BEGIN
              IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKan
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKen
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                ALOVERB_rec1^.futuro :=  nofuturo
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
            ALOVERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          ALOVERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.tiempo :=  Presente
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF VERBrec1.futuro = nofuturo THEN
              BEGIN
              IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKan
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKen
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
decPresIndPL3:=result
end;
{:PresIndPL3}


{rule:}
{:PresSubjPL3}
FUNCTION decPresSubjPL3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKen
                end
              END;
            IF (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKan
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
            ALOVERB_rec1^.numero :=  plural
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
    IF (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKen
                end
              END;
            IF (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFKan
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
decPresSubjPL3:=result
end;
{:PresSubjPL3}


{rule:}
{:ImperfPL3}
FUNCTION decImperfPL3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKaban
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1an
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
            ALOVERB_rec1^.aspecto :=  imperfectivo
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          ALOVERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKaban
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFKi1an
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
decImperfPL3:=result
end;
{:ImperfPL3}


{rule:}
{:PDpl3}
FUNCTION decPDpl3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKaron
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKieron
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                ALOVERB_rec1^.persona :=  3
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
            ALOVERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          ALOVERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKaron
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5, CONJ9] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKieron
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
decPDpl3:=result
end;
{:PDpl3}


{rule:}
{:SubjPasPL3}
FUNCTION decSubjPasPL3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKaran
                end
              END;
            IF (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKieran
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
          ALOVERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKaran
                end
              END;
            IF (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKieran
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
decSubjPasPL3:=result
end;
{:SubjPasPL3}


{rule:}
{:SubjPasaPL3}
FUNCTION decSubjPasaPL3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKasen
                end
              END;
            IF (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKiesen
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
          ALOVERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKasen
                end
              END;
            IF (VERBrec1.CONJclases * [ CONJ2,CONJ3,CONJ4,CONJ5,CONJ9 ] <>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKiesen
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
decSubjPasaPL3:=result
end;
{:SubjPasaPL3}


{rule:}
{:FuturoPL3}
FUNCTION decFuturoPL3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKara1n
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKera1n
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKira1n
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
            ALOVERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          ALOVERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.tiempo :=  Presente
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKara1n
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKera1n
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKira1n
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
decFuturoPL3:=result
end;
{:FuturoPL3}


{rule:}
{:CondicPL3}
FUNCTION decCondicPL3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKari1an
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeri1an
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiri1an
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
            ALOVERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          ALOVERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKari1an
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeri1an
                  end
                END;
              IF (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiri1an
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
decCondicPL3:=result
end;
{:CondicPL3}


{rule:}
{:Infinitivo}
FUNCTION decInfinitivo(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) AND (VERBrec1.modo = Infinitivo) THEN
      BEGIN
      IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
          SFCAT_rec1^.key :=  SFKar
          end
        END;
      IF VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[] THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
          SFCAT_rec1^.key :=  SFKer
          end
        END;
      IF (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[]) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
          SFCAT_rec1^.key :=  SFKir
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.modo :=  Infinitivo
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) AND (VERBrec1.modo = Infinitivo) THEN
      BEGIN
      IF (VERBrec1.CONJclases * [ CONJ1,CONJ6 ] <>[]) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
          SFCAT_rec1^.key :=  SFKar
          end
        END;
      IF VERBrec1.CONJclases * [ CONJ2,CONJ4 ] <>[] THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
          SFCAT_rec1^.key :=  SFKer
          end
        END;
      IF (VERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] <>[]) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
          SFCAT_rec1^.key :=  SFKir
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
decInfinitivo:=result
end;
{:Infinitivo}


{rule:}
{:InfIRR}
FUNCTION decInfIRR(Is:LISTREE_pStree)
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
   VERBrec1:LSDOMAINT_VERBrecord;
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
    IF VERBrec1.modo = Infinitivo THEN
      BEGIN
      IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
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
decInfIRR:=result
end;
{:InfIRR}


{rule:}
{:PtcpasIRR}
FUNCTION decPtcpasIRR(Is:LISTREE_pStree)
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
    IF VERBrec1.modo = PtcPas THEN
      BEGIN
      IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.genero = masc THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              SFCAT_rec1^.key :=  SFKPtcPasMascSg
              end
            END;
          IF VERBrec1.genero = fem THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              SFCAT_rec1^.key :=  SFKPtcPasFemSg
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
            end
          END;
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.genero = masc THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              SFCAT_rec1^.key :=  SFKPtcPasMascPl
              end
            END;
          IF VERBrec1.genero = fem THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              SFCAT_rec1^.key :=  SFKPtcPasFemPl
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
decPtcpasIRR:=result
end;
{:PtcpasIRR}


{rule:}
{:GerundioIRR}
FUNCTION decGerundioIRR(Is:LISTREE_pStree)
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
    IF VERBrec1.modo = Gerundio THEN
      BEGIN
      IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKgerundio
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
decGerundioIRR:=result
end;
{:GerundioIRR}


{rule:}
{:PresIndIRRsg}
FUNCTION decPresIndIRRsg(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Presente THEN
      BEGIN
      IF ((VERBrec1.modo = Indicativo)  and  (VERBrec1.futuro = nofuturo)) THEN
        BEGIN
        IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK1SgIndPres
                end
              END;
            IF VERBrec1.persona = 2 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK2SgIndPres
                end
              END;
            IF VERBrec1.persona = 3 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK3SgIndPres
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
decPresIndIRRsg:=result
end;
{:PresIndIRRsg}


{rule:}
{:PresIndIRRpl}
FUNCTION decPresIndIRRpl(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Presente THEN
      BEGIN
      IF ((VERBrec1.modo = Indicativo)  and  (VERBRec1.futuro = nofuturo)) THEN
        BEGIN
        IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK1PlIndPres
                end
              END;
            IF VERBrec1.persona = 2 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK2PlIndPres
                end
              END;
            IF VERBrec1.persona = 3 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK3PlIndPres
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
decPresIndIRRpl:=result
end;
{:PresIndIRRpl}


{rule:}
{:PresSubjIRRsg}
FUNCTION decPresSubjIRRsg(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Presente THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK1Sg3SubjPres
                end
              END;
            IF VERBrec1.persona = 2 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK2SgSubjPres
                end
              END;
            IF VERBrec1.persona = 3 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK1Sg3SubjPres
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
decPresSubjIRRsg:=result
end;
{:PresSubjIRRsg}


{rule:}
{:PresSubjIRRpl}
FUNCTION decPresSubjIRRpl(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Presente THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK1PlSubjPres
                end
              END;
            IF VERBrec1.persona = 2 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK2PlSubjPres
                end
              END;
            IF VERBrec1.persona = 3 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK3PlSubjPres
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
decPresSubjIRRpl:=result
end;
{:PresSubjIRRpl}


{rule:}
{:ImperfIRRsg}
FUNCTION decImperfIRRsg(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Pasado THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
            BEGIN
            IF VERBrec1.numero = singular THEN
              BEGIN
              IF VERBrec1.persona = 1 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK1Sg3Imperf
                  end
                END;
              IF VERBrec1.persona = 2 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK2SgImperf
                  end
                END;
              IF VERBrec1.persona = 3 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK1Sg3Imperf
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
decImperfIRRsg:=result
end;
{:ImperfIRRsg}


{rule:}
{:ImperfIRRpl}
FUNCTION decImperfIRRpl(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Pasado THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
            BEGIN
            IF VERBrec1.numero = plural THEN
              BEGIN
              IF VERBrec1.persona = 1 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK1PlImperf
                  end
                END;
              IF VERBrec1.persona = 2 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK2PlImperf
                  end
                END;
              IF VERBrec1.persona = 3 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK3PlImperf
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
decImperfIRRpl:=result
end;
{:ImperfIRRpl}


{rule:}
{:PDirrSG}
FUNCTION decPDirrSG(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Pasado THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
            BEGIN
            IF VERBrec1.numero = singular THEN
              BEGIN
              IF VERBrec1.persona = 1 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK1SgPD
                  end
                END;
              IF VERBrec1.persona = 2 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK2SgPD
                  end
                END;
              IF VERBrec1.persona = 3 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK3SgPD
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
decPDirrSG:=result
end;
{:PDirrSG}


{rule:}
{:PDirrPL}
FUNCTION decPDirrPL(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Pasado THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
            BEGIN
            IF VERBrec1.numero = plural THEN
              BEGIN
              IF VERBrec1.persona = 1 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK1PlPD
                  end
                END;
              IF VERBrec1.persona = 2 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK2PlPD
                  end
                END;
              IF VERBrec1.persona = 3 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK3PlPD
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
decPDirrPL:=result
end;
{:PDirrPL}


{rule:}
{:SubjPasIRRsg}
FUNCTION decSubjPasIRRsg(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Pasado THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK1Sg3SubjPas
                end
              END;
            IF VERBrec1.persona = 2 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK2SgSubjPas
                end
              END;
            IF VERBrec1.persona = 3 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK1Sg3SubjPas
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
decSubjPasIRRsg:=result
end;
{:SubjPasIRRsg}


{rule:}
{:SubjPasIRRpl}
FUNCTION decSubjPasIRRpl(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Pasado THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK1PlSubjPas
                end
              END;
            IF VERBrec1.persona = 2 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK2PlSubjPas
                end
              END;
            IF VERBrec1.persona = 3 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK3PlSubjPas
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
decSubjPasIRRpl:=result
end;
{:SubjPasIRRpl}


{rule:}
{:SubjPasaIRRsg}
FUNCTION decSubjPasaIRRsg(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Pasado THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK1Sg3SubjPasa
                end
              END;
            IF VERBrec1.persona = 2 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK2SgSubjPasa
                end
              END;
            IF VERBrec1.persona = 3 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK1Sg3SubjPasa
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
decSubjPasaIRRsg:=result
end;
{:SubjPasaIRRsg}


{rule:}
{:SubjPasaIRRpl}
FUNCTION decSubjPasaIRRpl(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Pasado THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK1PlSubjPasa
                end
              END;
            IF VERBrec1.persona = 2 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK2PlSubjPasa
                end
              END;
            IF VERBrec1.persona = 3 THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                SFCAT_rec1^.key :=  SFK3PlSubjpasa
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
decSubjPasaIRRpl:=result
end;
{:SubjPasaIRRpl}


{rule:}
{:FuturoIRRsg}
FUNCTION decFuturoIRRsg(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Presente THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
            BEGIN
            IF VERBrec1.numero = singular THEN
              BEGIN
              IF VERBrec1.persona = 1 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK1SgFut
                  end
                END;
              IF VERBrec1.persona = 2 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK2SgFut
                  end
                END;
              IF VERBrec1.persona = 3 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK3SgFut
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
decFuturoIRRsg:=result
end;
{:FuturoIRRsg}


{rule:}
{:FuturoIRRpl}
FUNCTION decFuturoIRRpl(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Presente THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
            BEGIN
            IF VERBrec1.numero = plural THEN
              BEGIN
              IF VERBrec1.persona = 1 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK1PlFut
                  end
                END;
              IF VERBrec1.persona = 2 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK2PlFut
                  end
                END;
              IF VERBrec1.persona = 3 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK3PlFut
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
decFuturoIRRpl:=result
end;
{:FuturoIRRpl}


{rule:}
{:CondIRRsg}
FUNCTION decCondIRRsg(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Pasado THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
            BEGIN
            IF VERBrec1.numero = singular THEN
              BEGIN
              IF VERBrec1.persona = 1 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK1Sg3Cond
                  end
                END;
              IF VERBrec1.persona = 2 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK2SgCond
                  end
                END;
              IF VERBrec1.persona = 3 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK1Sg3Cond
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
decCondIRRsg:=result
end;
{:CondIRRsg}


{rule:}
{:CondIRRpl}
FUNCTION decCondIRRpl(Is:LISTREE_pStree)
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
    IF VERBrec1.tiempo = Pasado THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
            BEGIN
            IF VERBrec1.numero = plural THEN
              BEGIN
              IF VERBrec1.persona = 1 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK1PlCond
                  end
                END;
              IF VERBrec1.persona = 2 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK2PlCond
                  end
                END;
              IF VERBrec1.persona = 3 THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  SFCAT_rec1^.key :=  SFK3PlCond
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
decCondIRRpl:=result
end;
{:CondIRRpl}


{rule:}
{:ImperatIRR}
FUNCTION decImperatIRR(Is:LISTREE_pStree)
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
    IF VERBrec1.modo = Imperativo THEN
      BEGIN
      IF VERBrec1.persona = 2 THEN
        BEGIN
        IF (VERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
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
              SFCAT_rec1^.key :=  SFKsgImperat
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
              SFCAT_rec1^.key :=  SFKplImperat
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
decImperatIRR:=result
end;
{:ImperatIRR}


{rule:}
{:ALOSUBnadadiftong}
FUNCTION decALOSUBnadadiftong(Is:LISTREE_pStree)
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
    IF ALOVERBrec1.Aloclases = [nadaCLASE] THEN
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
    IF ALOVERBrec1.Aloclases = [diftongCLASE] THEN
      BEGIN
      IF ALOVERBrec1.tiempo = Presente THEN
        BEGIN
        IF ALOVERBrec1.modo = Indicativo THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF ALOVERBrec1.futuro = nofuturo THEN
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
        IF ALOVERBrec1.modo = Subjuntivo THEN
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
      IF ALOVERBrec1.tiempo = Presente THEN
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
        IF ALOVERBrec1.modo = Subjuntivo THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1);
            skip
            end
          END;
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
            IF ALOVERBrec1.persona = 3 THEN
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
decALOSUBnadadiftong:=result
end;
{:ALOSUBnadadiftong}


{rule:}
{:ALOSUBirrMedek}
FUNCTION decALOSUBirrMedek(Is:LISTREE_pStree)
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
    IF ALOVERBrec1.Aloclases = [irrMedekCLASE] THEN
      BEGIN
      IF ALOVERBrec1.tiempo = Presente THEN
        BEGIN
        IF ALOVERBrec1.modo = Indicativo THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF ALOVERBrec1.futuro = nofuturo THEN
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
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          IF ALOVERBrec1.numero = singular THEN
            BEGIN
            IF ALOVERBrec1.futuro = nofuturo THEN
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
      IF ALOVERBrec1.modo = Imperativo THEN
        BEGIN
        IF ALOVERBrec1.persona = 2 THEN
          BEGIN
          IF ALOVERBrec1.numero = singular THEN
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
        IF ALOVERBrec1.modo = Subjuntivo THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1);
            skip
            end
          END;
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
            IF ALOVERBrec1.persona = 3 THEN
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
decALOSUBirrMedek:=result
end;
{:ALOSUBirrMedek}


{rule:}
{:ALOSUBsterk}
FUNCTION decALOSUBsterk(Is:LISTREE_pStree)
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
    IF ALOVERBrec1.Aloclases = [sterkCLASE] THEN
      BEGIN
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
      IF ALOVERBrec1.modo = Imperativo THEN
        BEGIN
        IF ALOVERBrec1.persona = 2 THEN
          BEGIN
          IF ALOVERBrec1.numero = singular THEN
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
        IF ALOVERBrec1.modo = Subjuntivo THEN
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
        IF ALOVERBrec1.modo = Indicativo THEN
          BEGIN
          IF ALOVERBrec1.futuro = nofuturo THEN
            BEGIN
            IF ALOVERBrec1.numero = singular THEN
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
decALOSUBsterk:=result
end;
{:ALOSUBsterk}


{rule:}
{:ALOSUBeiouHalf}
FUNCTION decALOSUBeiouHalf(Is:LISTREE_pStree)
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
    IF ALOVERBrec1.Aloclases = [eiouHalfCLASE] THEN
      BEGIN
      IF ALOVERBrec1.tiempo = Presente THEN
        BEGIN
        IF ALOVERBrec1.modo = Subjuntivo THEN
          BEGIN
          IF ALOVERBrec1.numero = singular THEN
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
            IF ALOVERBrec1.persona = 3 THEN
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
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF ALOVERBrec1.persona = 3 THEN
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
          IF ALOVERBrec1.numero = singular THEN
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
            IF ALOVERBrec1.numero = singular THEN
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
decALOSUBeiouHalf:=result
end;
{:ALOSUBeiouHalf}


{rule:}
{:ALOSUBeiouHeel}
FUNCTION decALOSUBeiouHeel(Is:LISTREE_pStree)
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
    IF ALOVERBrec1.Aloclases = [eiouHeelCLASE] THEN
      BEGIN
      IF ALOVERBrec1.tiempo = Presente THEN
        BEGIN
        IF ALOVERBrec1.modo = Indicativo THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF ALOVERBrec1.futuro = nofuturo THEN
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
      IF ALOVERBrec1.modo = Imperativo THEN
        BEGIN
        IF ALOVERBrec1.numero = plural THEN
          BEGIN
          IF ALOVERBrec1.persona = 2 THEN
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
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
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
        IF ALOVERBrec1.tiempo = Pasado THEN
          BEGIN
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
decALOSUBeiouHeel:=result
end;
{:ALOSUBeiouHeel}


{rule:}
{:ALOSUByMinPres}
FUNCTION decALOSUByMinPres(Is:LISTREE_pStree)
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
    IF ALOVERBrec1.Aloclases = [yMinPresCLASE] THEN
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
          IF ALOVERBrec1.numero = singular THEN
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
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.tiempo = Presente THEN
          BEGIN
          IF ALOVERBrec1.numero = singular THEN
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
            IF ALOVERBrec1.persona = 3 THEN
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
          IF ALOVERBrec1.numero = plural THEN
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
            IF ALOVERBrec1.persona = 3 THEN
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
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.tiempo = Presente THEN
          BEGIN
          IF ALOVERBrec1.futuro = nofuturo THEN
            BEGIN
            IF ALOVERBrec1.numero = singular THEN
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
        IF ALOVERBrec1.tiempo = Pasado THEN
          BEGIN
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
decALOSUByMinPres:=result
end;
{:ALOSUByMinPres}


{rule:}
{:ALOSUBumlaut}
FUNCTION decALOSUBumlaut(Is:LISTREE_pStree)
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
    IF ALOVERBrec1.Aloclases = [umlautCLASE] THEN
      BEGIN
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
      IF ALOVERBrec1.modo = Imperativo THEN
        BEGIN
        IF ALOVERBrec1.persona = 2 THEN
          BEGIN
          IF ALOVERBrec1.numero = singular THEN
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
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.tiempo = Pasado THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1);
            skip
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.tiempo = Presente THEN
          BEGIN
          IF ALOVERBrec1.futuro = nofuturo THEN
            BEGIN
            IF ALOVERBrec1.numero = singular THEN
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
        IF ALOVERBrec1.tiempo = Pasado THEN
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
            IF ALOVERBrec1.persona = 3 THEN
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
decALOSUBumlaut:=result
end;
{:ALOSUBumlaut}


{rule:}
{:ALOSUBve}
FUNCTION decALOSUBve(Is:LISTREE_pStree)
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
    IF ALOVERBrec1.Aloclases = [veCLASE] THEN
      BEGIN
      IF ALOVERBrec1.tiempo = Presente THEN
        BEGIN
        IF ALOVERBrec1.modo = Indicativo THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF ALOVERBrec1.futuro = nofuturo THEN
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
            if success and (level=6) then
              begin
            level:=5;
              skip
              end
            END;
          IF ALOVERBrec1.numero = singular THEN
            BEGIN
            IF ALOVERBrec1.futuro = nofuturo THEN
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
      IF ALOVERBrec1.modo = Imperativo THEN
        BEGIN
        IF ALOVERBrec1.persona = 2 THEN
          BEGIN
          IF ALOVERBrec1.numero = singular THEN
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
      IF ALOVERBrec1.tiempo = Presente THEN
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
            IF ALOVERBrec1.persona = 3 THEN
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
        IF ALOVERBrec1.modo = Subjuntivo THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1);
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
decALOSUBve:=result
end;
{:ALOSUBve}

