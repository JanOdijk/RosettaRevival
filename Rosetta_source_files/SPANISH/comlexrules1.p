EXPORT(comlexrules1);
pragma C_include('string.pf');
pragma C_include('ldblex.pf');
pragma C_include('strtokey.pf');
pragma C_include('listree.pf');
pragma C_include('comlexrules1.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('maket.pf');
pragma C_include('copyt.pf');
pragma C_include('lsstree.pf');
PROGRAM comlexrules1;
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
FUNCTION comPtcpasSG(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.modo = PtcPas THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF ((ALOVERBrec1.CONJclases * [CONJ1]<>[])  and  (SFCATrec1.key = SFKado)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKido)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
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
          IF ((ALOVERBrec1.CONJclases * [CONJ1]<>[])  and  (SFCATrec1.key = SFKado)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKido)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.genero :=  neutro
            end
          END;
        IF true THEN
          BEGIN
          IF ((ALOVERBrec1.CONJclases * [CONJ1]<>[])  and  (SFCATrec1.key = SFKada)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKida)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
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
          VERB_rec1^.numero :=  singular
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.modo :=  PtcPas
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF ((ALOVERBrec1.CONJclases * [CONJ1]<>[])  and  (SFCATrec1.key = SFKado)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKido)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
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
          IF ((ALOVERBrec1.CONJclases * [CONJ1]<>[])  and  (SFCATrec1.key = SFKado)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKido)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.genero :=  neutro
            end
          END;
        IF true THEN
          BEGIN
          IF ((ALOVERBrec1.CONJclases * [CONJ1]<>[])  and  (SFCATrec1.key = SFKada)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKida)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
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
          VERB_rec1^.numero :=  singular
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
comPtcpasSG:=result
end;
{:PtcpasSG}


{rule:}
{:PtcpasPL}
FUNCTION comPtcpasPL(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.modo = PtcPas THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF ((ALOVERBrec1.CONJclases * [CONJ1]<>[])  and  (SFCATrec1.key = SFKados)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKidos)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
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
          IF ((ALOVERBrec1.CONJclases * [CONJ1]<>[])  and  (SFCATrec1.key = SFKados)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKidos)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.genero :=  neutro
            end
          END;
        IF true THEN
          BEGIN
          IF ((ALOVERBrec1.CONJclases * [CONJ1]<>[])  and  (SFCATrec1.key = SFKadas)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKidas)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
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
          VERB_rec1^.numero :=  plural
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.modo :=  PtcPas
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF ((ALOVERBrec1.CONJclases * [CONJ1]<>[])  and  (SFCATrec1.key = SFKados)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKidos)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
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
          IF ((ALOVERBrec1.CONJclases * [CONJ1]<>[])  and  (SFCATrec1.key = SFKados)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKidos)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.genero :=  neutro
            end
          END;
        IF true THEN
          BEGIN
          IF ((ALOVERBrec1.CONJclases * [CONJ1]<>[])  and  (SFCATrec1.key = SFKadas)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKidas)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
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
          VERB_rec1^.numero :=  plural
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
comPtcpasPL:=result
end;
{:PtcpasPL}


{rule:}
{:Gerundio}
FUNCTION comGerundio(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.modo = Gerundio THEN
      BEGIN
      IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKando)) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
          end
        END;
      IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKiendo)) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.modo :=  Gerundio
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKando)) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
          end
        END;
      IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKiendo)) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.modo :=  Gerundio
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comGerundio:=result
end;
{:Gerundio}


{rule:}
{:PresIndSG1}
FUNCTION comPresIndSG1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.numero = singular THEN
          BEGIN
          IF ALOVERBrec1.persona = 1 THEN
            BEGIN
            IF ALOVERBrec1.futuro = nofuturo THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ2,CONJ3,CONJ4,CONJ5,CONJ6,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKo)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.futuro :=  nofuturo
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ2,CONJ3,CONJ4,CONJ5,CONJ6,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKo)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.futuro :=  nofuturo
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresIndSG1:=result
end;
{:PresIndSG1}


{rule:}
{:PresSubjSG1}
FUNCTION comPresSubjSG1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.numero = singular THEN
          BEGIN
          IF ALOVERBrec1.persona = 1 THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKe)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKa)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKe)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKa)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresSubjSG1:=result
end;
{:PresSubjSG1}


{rule:}
{:ImperfSG1}
FUNCTION comImperfSG1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKaba)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKi1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  imperfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKaba)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKi1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  imperfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comImperfSG1:=result
end;
{:ImperfSG1}


{rule:}
{:PDsg1}
FUNCTION comPDsg1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ALOVERBrec1.persona = 1 THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKe1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5]<>[])
                   and  (SFCATrec1.key = SFKi1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ9]<>[])  and  { "sterk"
                  } ( SFCATrec1.key = SFKe )) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKe1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5]<>[])
                   and  (SFCATrec1.key = SFKi1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ9] <>[])  and  { "sterk"
                  } ( SFCATrec1.key = SFKe )) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPDsg1:=result
end;
{:PDsg1}


{rule:}
{:SubjPasSG1}
FUNCTION comSubjPasSG1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKara)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKiera)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKara)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKiera)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasSG1:=result
end;
{:SubjPasSG1}


{rule:}
{:SubjPasaSG1}
FUNCTION comSubjPasaSG1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKase)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKiese)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKase)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKiese)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasaSG1:=result
end;
{:SubjPasaSG1}


{rule:}
{:FuturoSG1}
FUNCTION comFuturoSG1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.futuro = sifuturo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKare1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4] <>[])  and  (SFCATrec1.key = SFKere1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKire1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKare1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKere1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKire1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comFuturoSG1:=result
end;
{:FuturoSG1}


{rule:}
{:CondicSG1}
FUNCTION comCondicSG1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.futuro = sifuturo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKari1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKeri1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKiri1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKari1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKeri1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKiri1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comCondicSG1:=result
end;
{:CondicSG1}


{rule:}
{:PresIndSG2}
FUNCTION comPresIndSG2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.numero = singular THEN
          BEGIN
          IF ALOVERBrec1.persona = 2 THEN
            BEGIN
            IF ALOVERBrec1.futuro = nofuturo THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKas)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKes)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.futuro :=  nofuturo
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKas)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKes)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.futuro :=  nofuturo
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresIndSG2:=result
end;
{:PresIndSG2}


{rule:}
{:PresSubjSG2}
FUNCTION comPresSubjSG2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.numero = singular THEN
          BEGIN
          IF ALOVERBrec1.persona = 2 THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKes)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKas)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKes)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKas)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresSubjSG2:=result
end;
{:PresSubjSG2}


{rule:}
{:ImperfSG2}
FUNCTION comImperfSG2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKabas)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKi1as)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  imperfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKabas)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKi1as)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  imperfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comImperfSG2:=result
end;
{:ImperfSG2}


{rule:}
{:PDsg2}
FUNCTION comPDsg2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ALOVERBrec1.persona = 2 THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKaste)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5]<>[])
                   and  (SFCATrec1.key = SFKiste)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ9]<>[])  and  { "sterk"
                  } ( SFCATrec1.key = SFKiste
                  )) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKaste)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5]<>[])
                   and  (SFCATrec1.key = SFKiste)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ9]<>[])  and  { "sterk"
                  } ( SFCATrec1.key = SFKiste
                  )) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPDsg2:=result
end;
{:PDsg2}


{rule:}
{:SubjPasSG2}
FUNCTION comSubjPasSG2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKaras)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKieras)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKaras)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKieras)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasSG2:=result
end;
{:SubjPasSG2}


{rule:}
{:SubjPasaSG2}
FUNCTION comSubjPasaSG2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKases)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKieses)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKases)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKieses)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasaSG2:=result
end;
{:SubjPasaSG2}


{rule:}
{:FuturoSG2}
FUNCTION comFuturoSG2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.futuro = sifuturo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKara1s)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKera1s)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKira1s)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKara1s)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKera1s)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKira1s)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comFuturoSG2:=result
end;
{:FuturoSG2}


{rule:}
{:CondicSG2}
FUNCTION comCondicSG2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.futuro = sifuturo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKari1as)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key
                  = SFKeri1as)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKiri1as)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKari1as)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key
                  = SFKeri1as)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKiri1as)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comCondicSG2:=result
end;
{:CondicSG2}


{rule:}
{:ImperatSG}
FUNCTION comImperatSG(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.modo = Imperativo THEN
      BEGIN
      IF ALOVERBrec1.numero = singular THEN
        BEGIN
        IF ALOVERBrec1.persona = 2 THEN
          BEGIN
          IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKa)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKe)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.persona :=  2
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.numero :=  singular
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.modo :=  Imperativo
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKa)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKe)) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.persona :=  2
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.numero :=  singular
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.modo :=  Imperativo
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comImperatSG:=result
end;
{:ImperatSG}


{rule:}
{:PresIndSG3}
FUNCTION comPresIndSG3(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.numero = singular THEN
          BEGIN
          IF ALOVERBrec1.persona = 3 THEN
            BEGIN
            IF ALOVERBrec1.futuro = nofuturo THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKa)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKe)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.futuro :=  nofuturo
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  3
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKa)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKe)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.futuro :=  nofuturo
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  3
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresIndSG3:=result
end;
{:PresIndSG3}


{rule:}
{:PresSubjSG3}
FUNCTION comPresSubjSG3(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.numero = singular THEN
          BEGIN
          IF ALOVERBrec1.persona = 3 THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKe)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKa)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  3
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKe)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKa)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  3
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresSubjSG3:=result
end;
{:PresSubjSG3}


{rule:}
{:ImperfSG3}
FUNCTION comImperfSG3(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKaba)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKi1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  imperfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKaba)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKi1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  imperfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comImperfSG3:=result
end;
{:ImperfSG3}


{rule:}
{:PDsg3}
FUNCTION comPDsg3(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ALOVERBrec1.persona = 3 THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKo1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5]<>[])
                   and  (SFCATrec1.key = SFKio1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ9]<>[])  and  { "sterk"
                  } ( SFCATrec1.key = SFKo )) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKo1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5]<>[])
                   and  (SFCATrec1.key = SFKio1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ9]<>[])  and  { "sterk"
                  } ( SFCATrec1.key = SFKo )) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPDsg3:=result
end;
{:PDsg3}


{rule:}
{:SubjPasSG3}
FUNCTION comSubjPasSG3(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKara)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKiera)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  3
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKara)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKiera)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  3
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasSG3:=result
end;
{:SubjPasSG3}


{rule:}
{:SubjPasaSG3}
FUNCTION comSubjPasaSG3(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKase)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKiese)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  3
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKase)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKiese)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  3
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasaSG3:=result
end;
{:SubjPasaSG3}


{rule:}
{:FuturoSG3}
FUNCTION comFuturoSG3(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.futuro = sifuturo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKara1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKera1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKira1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKara1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKera1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKira1)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comFuturoSG3:=result
end;
{:FuturoSG3}


{rule:}
{:CondicSG3}
FUNCTION comCondicSG3(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.futuro = sifuturo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKari1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKeri1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKiri1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKari1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKeri1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKiri1a)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  singular
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comCondicSG3:=result
end;
{:CondicSG3}


{rule:}
{:PresIndPL1}
FUNCTION comPresIndPL1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.numero = plural THEN
          BEGIN
          IF ALOVERBrec1.persona = 1 THEN
            BEGIN
            IF ALOVERBrec1.futuro = nofuturo THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKamos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKemos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKimos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.futuro :=  nofuturo
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKamos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKemos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKimos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.futuro :=  nofuturo
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresIndPL1:=result
end;
{:PresIndPL1}


{rule:}
{:PresSubjPL1}
FUNCTION comPresSubjPL1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.numero = plural THEN
          BEGIN
          IF ALOVERBrec1.persona = 1 THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKemos)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKamos)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKemos)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKamos)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresSubjPL1:=result
end;
{:PresSubjPL1}


{rule:}
{:ImperfPL1}
FUNCTION comImperfPL1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKa1bamos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKi1amos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  imperfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKa1bamos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKi1amos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  imperfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comImperfPL1:=result
end;
{:ImperfPL1}


{rule:}
{:PDpl1}
FUNCTION comPDpl1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ALOVERBrec1.persona = 1 THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKamos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKimos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKamos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKimos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPDpl1:=result
end;
{:PDpl1}


{rule:}
{:SubjPasPL1}
FUNCTION comSubjPasPL1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.persona = 1 THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKa1ramos)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKie1ramos)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKa1ramos)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKie1ramos)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasPL1:=result
end;
{:SubjPasPL1}


{rule:}
{:SubjPasaPL1}
FUNCTION comSubjPasaPL1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.persona = 1 THEN
          BEGIN
          IF ALOVERBrec1.numero = plural THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKa1semos)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKie1semos)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKa1semos)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKie1semos)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  1
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasaPL1:=result
end;
{:SubjPasaPL1}


{rule:}
{:FuturoPL1}
FUNCTION comFuturoPL1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.futuro = sifuturo THEN
          BEGIN
          IF ALOVERBrec1.persona = 1 THEN
            BEGIN
            IF ALOVERBrec1.numero = plural THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKaremos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key
                  = SFKeremos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKiremos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKaremos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key
                  = SFKeremos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKiremos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comFuturoPL1:=result
end;
{:FuturoPL1}


{rule:}
{:CondicPL1}
FUNCTION comCondicPL1(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.futuro = sifuturo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKari1amos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key
                  = SFKeri1amos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKiri1amos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKari1amos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key
                  = SFKeri1amos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKiri1amos)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  1
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comCondicPL1:=result
end;
{:CondicPL1}


{rule:}
{:PresIndPL2}
FUNCTION comPresIndPL2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.numero = plural THEN
          BEGIN
          IF ALOVERBrec1.persona = 2 THEN
            BEGIN
            IF ALOVERBrec1.futuro = nofuturo THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKa1is)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKe1is)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKi1s)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.futuro :=  nofuturo
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKa1is)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases * [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key = SFKe1is)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKi1s)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.futuro :=  nofuturo
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresIndPL2:=result
end;
{:PresIndPL2}


{rule:}
{:PresSubjPL2}
FUNCTION comPresSubjPL2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF ALOVERBrec1.numero = plural THEN
          BEGIN
          IF ALOVERBrec1.persona = 2 THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKe1is)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKa1is)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKe1is)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKa1is)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPresSubjPL2:=result
end;
{:PresSubjPL2}


{rule:}
{:ImperfPL2}
FUNCTION comImperfPL2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.aspecto = imperfectivo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKabais)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKi1ais)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  imperfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKabais)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKi1ais)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  imperfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comImperfPL2:=result
end;
{:ImperfPL2}


{rule:}
{:PDpl2}
FUNCTION comPDpl2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.aspecto = perfectivo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ALOVERBrec1.persona = 2 THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKasteis)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKisteis)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKasteis)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKisteis)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.aspecto :=  perfectivo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPDpl2:=result
end;
{:PDpl2}


{rule:}
{:SubjPasPL2}
FUNCTION comSubjPasPL2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKarais)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKierais)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKarais)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKierais)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasPL2:=result
end;
{:SubjPasPL2}


{rule:}
{:SubjPasaPL2}
FUNCTION comSubjPasaPL2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Pasado THEN
      BEGIN
      IF ALOVERBrec1.modo = Subjuntivo THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKaseis)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKieseis)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF ((ALOVERBrec1.CONJclases * [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key = SFKaseis)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]<>[])
                   and  (SFCATrec1.key = SFKieseis)) THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.persona :=  2
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  plural
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Subjuntivo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comSubjPasaPL2:=result
end;
{:SubjPasaPL2}


{rule:}
{:FuturoPL2}
FUNCTION comFuturoPL2(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.tiempo = Presente THEN
      BEGIN
      IF ALOVERBrec1.modo = Indicativo THEN
        BEGIN
        IF ALOVERBrec1.futuro = sifuturo THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKare1is)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key
                  = SFKere1is)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKire1is)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF true THEN
            BEGIN
            IF true THEN
              BEGIN
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ1,CONJ6]<>[])  and  (SFCATrec1.key
                  = SFKare1is)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ2,CONJ4]<>[])  and  (SFCATrec1.key
                  = SFKere1is)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              IF ((ALOVERBrec1.CONJclases *
                  [CONJ3,CONJ5,CONJ9]<>[]) 
                  and  (SFCATrec1.key = SFKire1is)) THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_alotoverb(ALOVERBrec1)
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.persona :=  2
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              VERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.futuro :=  sifuturo
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tiempo :=  Presente
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comFuturoPL2:=result
end;
{:FuturoPL2}

