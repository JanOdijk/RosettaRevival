EXPORT(decomlexrules1);
pragma C_include('string.pf');
pragma C_include('ldblex.pf');
pragma C_include('strtokey.pf');
pragma C_include('listree.pf');
pragma C_include('decomlexrules1.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('maket.pf');
pragma C_include('copyt.pf');
pragma C_include('lsstree.pf');
PROGRAM decomlexrules1;
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
{:PtcpasSG}
FUNCTION decPtcpasSG(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.modo = PtcPas) THEN
      BEGIN
      IF VERBrec1.numero = singular THEN
        BEGIN
        IF VERBrec1.genero = masc THEN
          BEGIN
          IF (VERBrec1.CONJclases * [CONJ1]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKado
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKido
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
            end
          END;
        IF VERBrec1.genero = neutro THEN
          BEGIN
          IF (VERBrec1.CONJclases * [CONJ1]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKado
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKido
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
          IF (VERBrec1.CONJclases * [CONJ1]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKada
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKida
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
        ALOVERB_rec1^.modo :=  PtcPas
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.modo = PtcPas) THEN
      BEGIN
      IF VERBrec1.numero = singular THEN
        BEGIN
        IF VERBrec1.genero = masc THEN
          BEGIN
          IF (VERBrec1.CONJclases * [CONJ1]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKado
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKido
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
            end
          END;
        IF VERBrec1.genero = neutro THEN
          BEGIN
          IF (VERBrec1.CONJclases * [CONJ1]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKado
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKido
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
          IF (VERBrec1.CONJclases * [CONJ1]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKada
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKida
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
        ALOVERB_rec1^.modo :=  PtcPas
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
decPtcpasSG:=result
end;
{:PtcpasSG}


{rule:}
{:PtcpasPL}
FUNCTION decPtcpasPL(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.modo = PtcPas) THEN
      BEGIN
      IF VERBrec1.numero = plural THEN
        BEGIN
        IF VERBrec1.genero = masc THEN
          BEGIN
          IF (VERBrec1.CONJclases * [CONJ1]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKados
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKidos
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
            end
          END;
        IF VERBrec1.genero = neutro THEN
          BEGIN
          IF (VERBrec1.CONJclases * [CONJ1]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKados
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKidos
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
          IF (VERBrec1.CONJclases * [CONJ1]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKadas
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKidas
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
        ALOVERB_rec1^.modo :=  PtcPas
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.modo = PtcPas) THEN
      BEGIN
      IF VERBrec1.numero = plural THEN
        BEGIN
        IF VERBrec1.genero = masc THEN
          BEGIN
          IF (VERBrec1.CONJclases * [CONJ1]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKados
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKidos
              end
            END;
          if success and (level=5) then
            begin
          level:=4;
            skip
            end
          END;
        IF VERBrec1.genero = neutro THEN
          BEGIN
          IF (VERBrec1.CONJclases * [CONJ1]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKados
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKidos
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
          IF (VERBrec1.CONJclases * [CONJ1]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKadas
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKidas
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
        ALOVERB_rec1^.modo :=  PtcPas
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
decPtcpasPL:=result
end;
{:PtcpasPL}


{rule:}
{:Gerundio}
FUNCTION decGerundio(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.modo = Gerundio) THEN
      BEGIN
      IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
          SFCAT_rec1^.key :=  SFKando
          end
        END;
      IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
          SFCAT_rec1^.key :=  SFKiendo
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.modo :=  Gerundio
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.modo = Gerundio) THEN
      BEGIN
      IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
          SFCAT_rec1^.key :=  SFKando
          end
        END;
      IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
          SFCAT_rec1^.key :=  SFKiendo
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
decGerundio:=result
end;
{:Gerundio}


{rule:}
{:PresIndSG1}
FUNCTION decPresIndSG1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF VERBrec1.futuro = nofuturo THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ2,CONJ3,CONJ4,CONJ5,CONJ6,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKo
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
              ALOVERB_rec1^.persona :=  1
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
          ALOVERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.tiempo :=  Presente
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF VERBrec1.futuro = nofuturo THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ2,CONJ3,CONJ4,CONJ5,CONJ6,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKo
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
decPresIndSG1:=result
end;
{:PresIndSG1}


{rule:}
{:PresSubjSG1}
FUNCTION decPresSubjSG1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKe
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKa
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
            ALOVERB_rec1^.tiempo :=  Presente
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKe
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKa
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
decPresSubjSG1:=result
end;
{:PresSubjSG1}


{rule:}
{:ImperfSG1}
FUNCTION decImperfSG1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKaba
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1a
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKaba
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1a
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
decImperfSG1:=result
end;
{:ImperfSG1}


{rule:}
{:PDsg1}
FUNCTION decPDsg1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKe1
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1
                  end
                END;
              IF VERBrec1.CONJclases * [CONJ9]<>[] THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKe
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                ALOVERB_rec1^.persona :=  1
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKe1
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1
                  end
                END;
              IF VERBrec1.CONJclases * [CONJ9]<>[] THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKe
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
decPDsg1:=result
end;
{:PDsg1}


{rule:}
{:SubjPasSG1}
FUNCTION decSubjPasSG1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKara
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKiera
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKara
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKiera
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
decSubjPasSG1:=result
end;
{:SubjPasSG1}


{rule:}
{:SubjPasaSG1}
FUNCTION decSubjPasaSG1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKase
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKiese
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKase
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKiese
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
decSubjPasaSG1:=result
end;
{:SubjPasaSG1}


{rule:}
{:FuturoSG1}
FUNCTION decFuturoSG1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKare1
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKere1
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKire1
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKare1
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKere1
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKire1
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
decFuturoSG1:=result
end;
{:FuturoSG1}


{rule:}
{:CondicSG1}
FUNCTION decCondicSG1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKari1a
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeri1a
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiri1a
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKari1a
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeri1a
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiri1a
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
decCondicSG1:=result
end;
{:CondicSG1}


{rule:}
{:PresIndSG2}
FUNCTION decPresIndSG2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF VERBrec1.futuro = nofuturo THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKas
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKes
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
              ALOVERB_rec1^.persona :=  2
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
          ALOVERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        ALOVERB_rec1^.tiempo :=  Presente
        end
      END;
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF VERBrec1.futuro = nofuturo THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKas
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKes
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
decPresIndSG2:=result
end;
{:PresIndSG2}


{rule:}
{:PresSubjSG2}
FUNCTION decPresSubjSG2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKes
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKas
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKes
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKas
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
decPresSubjSG2:=result
end;
{:PresSubjSG2}


{rule:}
{:ImperfSG2}
FUNCTION decImperfSG2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKabas
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1as
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKabas
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1as
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
decImperfSG2:=result
end;
{:ImperfSG2}


{rule:}
{:PDsg2}
FUNCTION decPDsg2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKaste
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiste
                  end
                END;
              IF VERBrec1.CONJclases * [CONJ9]<>[] THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiste
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                ALOVERB_rec1^.persona :=  2
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKaste
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiste
                  end
                END;
              IF VERBrec1.CONJclases * [CONJ9]<>[] THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiste
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
decPDsg2:=result
end;
{:PDsg2}


{rule:}
{:SubjPasSG2}
FUNCTION decSubjPasSG2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKaras
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKieras
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKaras
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKieras
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
decSubjPasSG2:=result
end;
{:SubjPasSG2}


{rule:}
{:SubjPasaSG2}
FUNCTION decSubjPasaSG2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKases
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKieses
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKases
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKieses
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
decSubjPasaSG2:=result
end;
{:SubjPasaSG2}


{rule:}
{:FuturoSG2}
FUNCTION decFuturoSG2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKara1s
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKera1s
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKira1s
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKara1s
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKera1s
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKira1s
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
decFuturoSG2:=result
end;
{:FuturoSG2}


{rule:}
{:CondicSG2}
FUNCTION decCondicSG2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKari1as
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeri1as
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiri1as
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKari1as
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeri1as
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiri1as
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
decCondicSG2:=result
end;
{:CondicSG2}


{rule:}
{:ImperatSG}
FUNCTION decImperatSG(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.modo = Imperativo) THEN
      BEGIN
      IF VERBrec1.numero = singular THEN
        BEGIN
        IF VERBrec1.persona = 2 THEN
          BEGIN
          IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKa
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKe
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.modo = Imperativo) THEN
      BEGIN
      IF VERBrec1.numero = singular THEN
        BEGIN
        IF VERBrec1.persona = 2 THEN
          BEGIN
          IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKa
              end
            END;
          IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createinputmodels(s1,s2);
              ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
              SFCAT_rec1^.key :=  SFKe
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
decImperatSG:=result
end;
{:ImperatSG}


{rule:}
{:PresIndSG3}
FUNCTION decPresIndSG3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF VERBrec1.futuro = nofuturo THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKa
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKe
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
            ALOVERB_rec1^.numero :=  singular
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF VERBrec1.futuro = nofuturo THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKa
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKe
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
decPresIndSG3:=result
end;
{:PresIndSG3}


{rule:}
{:PresSubjSG3}
FUNCTION decPresSubjSG3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKe
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKa
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKe
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKa
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
decPresSubjSG3:=result
end;
{:PresSubjSG3}


{rule:}
{:ImperfSG3}
FUNCTION decImperfSG3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKaba
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1a
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKaba
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1a
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
decImperfSG3:=result
end;
{:ImperfSG3}


{rule:}
{:PDsg3}
FUNCTION decPDsg3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKo1
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKio1
                  end
                END;
              IF VERBrec1.CONJclases * [CONJ9]<>[] THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKo
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKo1
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKio1
                  end
                END;
              IF VERBrec1.CONJclases * [CONJ9]<>[] THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKo
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
decPDsg3:=result
end;
{:PDsg3}


{rule:}
{:SubjPasSG3}
FUNCTION decSubjPasSG3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKara
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKiera
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKara
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKiera
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
decSubjPasSG3:=result
end;
{:SubjPasSG3}


{rule:}
{:SubjPasaSG3}
FUNCTION decSubjPasaSG3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKase
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKiese
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = singular THEN
          BEGIN
          IF VERBrec1.persona = 3 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKase
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKiese
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
decSubjPasaSG3:=result
end;
{:SubjPasaSG3}


{rule:}
{:FuturoSG3}
FUNCTION decFuturoSG3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKara1
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKera1
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKira1
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKara1
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKera1
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKira1
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
decFuturoSG3:=result
end;
{:FuturoSG3}


{rule:}
{:CondicSG3}
FUNCTION decCondicSG3(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKari1a
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeri1a
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiri1a
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = singular THEN
            BEGIN
            IF VERBrec1.persona = 3 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKari1a
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeri1a
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiri1a
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
decCondicSG3:=result
end;
{:CondicSG3}


{rule:}
{:PresIndPL1}
FUNCTION decPresIndPL1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF VERBrec1.futuro = nofuturo THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKamos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKemos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKimos
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
              ALOVERB_rec1^.persona :=  1
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF VERBrec1.futuro = nofuturo THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKamos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKemos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKimos
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
decPresIndPL1:=result
end;
{:PresIndPL1}


{rule:}
{:PresSubjPL1}
FUNCTION decPresSubjPL1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKemos
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKamos
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKemos
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKamos
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
decPresSubjPL1:=result
end;
{:PresSubjPL1}


{rule:}
{:ImperfPL1}
FUNCTION decImperfPL1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKa1bamos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1amos
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKa1bamos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1amos
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
decImperfPL1:=result
end;
{:ImperfPL1}


{rule:}
{:PDpl1}
FUNCTION decPDpl1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKamos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKimos { bevat ook "sterk"}
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                ALOVERB_rec1^.persona :=  1
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKamos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKimos { bevat ook "sterk"}
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
decPDpl1:=result
end;
{:PDpl1}


{rule:}
{:SubjPasPL1}
FUNCTION decSubjPasPL1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKa1ramos
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKie1ramos
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKa1ramos
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKie1ramos
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
decSubjPasPL1:=result
end;
{:SubjPasPL1}


{rule:}
{:SubjPasaPL1}
FUNCTION decSubjPasaPL1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKa1semos
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKie1semos
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 1 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKa1semos
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKie1semos
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
decSubjPasaPL1:=result
end;
{:SubjPasaPL1}


{rule:}
{:FuturoPL1}
FUNCTION decFuturoPL1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKaremos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeremos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiremos
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKaremos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeremos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiremos
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
decFuturoPL1:=result
end;
{:FuturoPL1}


{rule:}
{:CondicPL1}
FUNCTION decCondicPL1(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKari1amos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeri1amos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiri1amos
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 1 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKari1amos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKeri1amos
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKiri1amos
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
decCondicPL1:=result
end;
{:CondicPL1}


{rule:}
{:PresIndPL2}
FUNCTION decPresIndPL2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF VERBrec1.futuro = nofuturo THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKa1is
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKe1is
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1s
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
              ALOVERB_rec1^.persona :=  2
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF VERBrec1.futuro = nofuturo THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKa1is
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKe1is
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1s
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
decPresIndPL2:=result
end;
{:PresIndPL2}


{rule:}
{:PresSubjPL2}
FUNCTION decPresSubjPL2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKe1is
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKa1is
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKe1is
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKa1is
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
decPresSubjPL2:=result
end;
{:PresSubjPL2}


{rule:}
{:ImperfPL2}
FUNCTION decImperfPL2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKabais
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1ais
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKabais
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKi1ais
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
decImperfPL2:=result
end;
{:ImperfPL2}


{rule:}
{:PDpl2}
FUNCTION decPDpl2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKasteis
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKisteis { bevat ook "sterk"}
                  end
                END;
              if success and (level=7) then
                begin
              level:=6;
                ALOVERB_rec1^.persona :=  2
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKasteis
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKisteis { bevat ook "sterk"}
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
decPDpl2:=result
end;
{:PDpl2}


{rule:}
{:SubjPasPL2}
FUNCTION decSubjPasPL2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKarais
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKierais
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKarais
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKierais
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
decSubjPasPL2:=result
end;
{:SubjPasPL2}


{rule:}
{:SubjPasaPL2}
FUNCTION decSubjPasaPL2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKaseis
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKieseis
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Pasado) THEN
      BEGIN
      IF VERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF VERBrec1.numero = plural THEN
          BEGIN
          IF VERBrec1.persona = 2 THEN
            BEGIN
            IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKaseis
                end
              END;
            IF (VERBrec1.CONJclases * [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[]) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createinputmodels(s1,s2);
                ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                SFCAT_rec1^.key :=  SFKieseis
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
decSubjPasaPL2:=result
end;
{:SubjPasaPL2}


{rule:}
{:FuturoPL2}
FUNCTION decFuturoPL2(Is:LISTREE_pStree)
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
    IF (NOT(nadaCLASE IN VERBrec1.Aloclases)) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKare1is
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKere1is
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKire1is
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
    IF (nadaCLASE IN VERBrec1.Aloclases) then
        if (VERBrec1.tiempo = Presente) THEN
      BEGIN
      IF VERBrec1.modo = Indicativo THEN
        BEGIN
        IF VERBrec1.futuro = sifuturo THEN
          BEGIN
          IF VERBrec1.numero = plural THEN
            BEGIN
            IF VERBrec1.persona = 2 THEN
              BEGIN
              IF (VERBrec1.CONJclases * [CONJ1,CONJ6]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKare1is
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ2,CONJ4]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKere1is
                  end
                END;
              IF (VERBrec1.CONJclases * [CONJ3,CONJ5,CONJ9]<>[]) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createinputmodels(s1,s2);
                  ALOVERB_rec1^ :=  copyT_verbtoalo(VERBrec1);
                  SFCAT_rec1^.key :=  SFKire1is
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
decFuturoPL2:=result
end;
{:FuturoPL2}

