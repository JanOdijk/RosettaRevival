EXPORT(comlexrules2);
pragma C_include('string.pf');
pragma C_include('ldblex.pf');
pragma C_include('strtokey.pf');
pragma C_include('listree.pf');
pragma C_include('comlexrules2.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('maket.pf');
pragma C_include('copyt.pf');
pragma C_include('lsstree.pf');
PROGRAM comlexrules2;
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
FUNCTION comCondicPL2(Is1,Is2:LISTREE_pStree)
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
              IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKari1ais ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ] ( SFCATrec1.key = SFKeri1ais ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] ( SFCATrec1.key = SFKiri1ais ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKari1ais ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ] ( SFCATrec1.key = SFKeri1ais ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] ( SFCATrec1.key = SFKiri1ais ) THEN
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
        VERB_rec1^.tiempo :=  Pasado
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comCondicPL2:=result
end;
{:CondicPL2}


{rule:}
{:ImperatPL}
FUNCTION comImperatPL(Is1,Is2:LISTREE_pStree)
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
      IF ALOVERBrec1.numero = plural THEN
        BEGIN
        IF ALOVERBrec1.persona = 2 THEN
          BEGIN
          IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKad ) THEN
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
          IF ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ] ( SFCATrec1.key = SFKed ) THEN
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
          IF ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] ( SFCATrec1.key = SFKid ) THEN
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
          VERB_rec1^.numero :=  plural
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
          IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKad ) THEN
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
          IF ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ] ( SFCATrec1.key = SFKed ) THEN
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
          IF ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] ( SFCATrec1.key = SFKid ) THEN
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
          VERB_rec1^.numero :=  plural
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
comImperatPL:=result
end;
{:ImperatPL}


{rule:}
{:PresIndPL3}
FUNCTION comPresIndPL3(Is1,Is2:LISTREE_pStree)
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
          IF ALOVERBrec1.persona = 3 THEN
            BEGIN
            IF ALOVERBrec1.futuro = nofuturo THEN
              BEGIN
              IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKan ) THEN
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
              IF ALOVERBrec1.CONJclases * [
                  CONJ2,CONJ3,CONJ4,CONJ5,CONJ9
                  ] ( SFCATrec1.key = SFKen
                  ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKan ) THEN
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
              IF ALOVERBrec1.CONJclases * [
                  CONJ2,CONJ3,CONJ4,CONJ5,CONJ9
                  ] ( SFCATrec1.key = SFKen
                  ) THEN
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
comPresIndPL3:=result
end;
{:PresIndPL3}


{rule:}
{:PresSubjPL3}
FUNCTION comPresSubjPL3(Is1,Is2:LISTREE_pStree)
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
          IF ALOVERBrec1.persona = 3 THEN
            BEGIN
            IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKen ) THEN
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
            IF ALOVERBrec1.CONJclases * [
                  CONJ2,CONJ3,CONJ4,CONJ5,CONJ9
                  ] ( SFCATrec1.key = SFKan
                  ) THEN
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
            IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKen ) THEN
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
            IF ALOVERBrec1.CONJclases * [
                  CONJ2,CONJ3,CONJ4,CONJ5,CONJ9
                  ] ( SFCATrec1.key = SFKan
                  ) THEN
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
comPresSubjPL3:=result
end;
{:PresSubjPL3}


{rule:}
{:ImperfPL3}
FUNCTION comImperfPL3(Is1,Is2:LISTREE_pStree)
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
              IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKaban ) THEN
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
              IF ALOVERBrec1.CONJclases * [
                  CONJ2,CONJ3,CONJ4,CONJ5,CONJ9
                  ] ( SFCATrec1.key = SFKi1an
                  ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKaban ) THEN
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
              IF ALOVERBrec1.CONJclases * [
                  CONJ2,CONJ3,CONJ4,CONJ5,CONJ9]
                  ( SFCATrec1.key = SFKi1an
                  ) THEN
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
comImperfPL3:=result
end;
{:ImperfPL3}


{rule:}
{:PDpl3}
FUNCTION comPDpl3(Is1,Is2:LISTREE_pStree)
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
              IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKaron ) THEN
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
              IF ALOVERBrec1.CONJclases * [
                  CONJ2,CONJ3,CONJ4,CONJ5, CONJ9]
                  ( SFCATrec1.key = SFKieron
                  ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKaron ) THEN
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
              IF ALOVERBrec1.CONJclases * [
                  CONJ2,CONJ3,CONJ4,CONJ5, CONJ9]
                  ( SFCATrec1.key = SFKieron
                  ) THEN
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
comPDpl3:=result
end;
{:PDpl3}


{rule:}
{:SubjPasPL3}
FUNCTION comSubjPasPL3(Is1,Is2:LISTREE_pStree)
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
            IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKaran ) THEN
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
            IF ALOVERBrec1.CONJclases * [
                  CONJ2,CONJ3,CONJ4,CONJ5,CONJ9
                  ] ( SFCATrec1.key = SFKieran
                  ) THEN
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
            IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKaran ) THEN
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
            IF ALOVERBrec1.CONJclases * [
                  CONJ2,CONJ3,CONJ4,CONJ5,CONJ9
                  ] ( SFCATrec1.key = SFKieran
                  ) THEN
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
comSubjPasPL3:=result
end;
{:SubjPasPL3}


{rule:}
{:SubjPasaPL3}
FUNCTION comSubjPasaPL3(Is1,Is2:LISTREE_pStree)
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
            IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKasen ) THEN
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
            IF ALOVERBrec1.CONJclases * [
                  CONJ2,CONJ3,CONJ4,CONJ5,CONJ9
                  ] ( SFCATrec1.key = SFKiesen
                  ) THEN
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
            IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKasen ) THEN
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
            IF ALOVERBrec1.CONJclases * [
                  CONJ2,CONJ3,CONJ4,CONJ5,CONJ9
                  ] ( SFCATrec1.key = SFKiesen
                  ) THEN
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
comSubjPasaPL3:=result
end;
{:SubjPasaPL3}


{rule:}
{:FuturoPL3}
FUNCTION comFuturoPL3(Is1,Is2:LISTREE_pStree)
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
              IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKara1n ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ] ( SFCATrec1.key = SFKera1n ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] ( SFCATrec1.key = SFKira1n ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKara1n ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ] ( SFCATrec1.key = SFKera1n ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] ( SFCATrec1.key = SFKira1n ) THEN
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
comFuturoPL3:=result
end;
{:FuturoPL3}


{rule:}
{:CondicPL3}
FUNCTION comCondicPL3(Is1,Is2:LISTREE_pStree)
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
              IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKari1an ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ] ( SFCATrec1.key = SFKeri1an ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] ( SFCATrec1.key = SFKiri1an ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKari1an ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ] ( SFCATrec1.key = SFKeri1an ) THEN
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
              IF ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] ( SFCATrec1.key = SFKiri1an ) THEN
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
comCondicPL3:=result
end;
{:CondicPL3}


{rule:}
{:Infinitivo}
FUNCTION comInfinitivo(Is1,Is2:LISTREE_pStree)
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
    IF ALOVERBrec1.modo = Infinitivo THEN
      BEGIN
      IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKar ) THEN
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
      IF ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ] ( SFCATrec1.key = SFKer ) THEN
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
      IF ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] ( SFCATrec1.key = SFKir ) THEN
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
        VERB_rec1^.modo :=  Infinitivo
        end
      END;
    IF nadaCLASE IN ALOVERBrec1.Aloclases THEN
      BEGIN
      IF ALOVERBrec1.CONJclases * [ CONJ1,CONJ6 ] ( SFCATrec1.key = SFKar ) THEN
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
      IF ALOVERBrec1.CONJclases * [ CONJ2,CONJ4 ] ( SFCATrec1.key = SFKer ) THEN
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
      IF ALOVERBrec1.CONJclases * [ CONJ3,CONJ5,CONJ9 ] ( SFCATrec1.key = SFKir ) THEN
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
        VERB_rec1^.modo :=  Infinitivo
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comInfinitivo:=result
end;
{:Infinitivo}


{rule:}
{:InfIRR}
FUNCTION comInfIRR(Is1:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
  s:=MAKET_Stree(VERB);
  VERB_rec1:=s^.ls^.VERBfield;
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
      IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          skip
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.modo :=  Infinitivo
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comInfIRR:=result
end;
{:InfIRR}


{rule:}
{:PtcpasIRR}
FUNCTION comPtcpasIRR(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
        BEGIN
        IF true THEN
          BEGIN
          IF SFCATrec1.key = SFKPtcPasMascSg THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
              VERB_rec1^.genero :=  masc
              end
            END;
          IF SFCATrec1.key = SFKPtcPasFemSg THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
              VERB_rec1^.genero :=  fem
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            VERB_rec1^.numero :=  singular
            end
          END;
        IF true THEN
          BEGIN
          IF SFCATrec1.key = SFKPtcPasFemPl THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
              VERB_rec1^.genero :=  fem
              end
            END;
          IF SFCATrec1.key = SFKPtcPasMascPl THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
              VERB_rec1^.genero :=  masc
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
comPtcpasIRR:=result
end;
{:PtcpasIRR}


{rule:}
{:GerundioIRR}
FUNCTION comGerundioIRR(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF SUBVERBrec1.CONJclases * [ CONJ0 ] ( SFCATrec1.key = SFKgerundio ) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1)
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
comGerundioIRR:=result
end;
{:GerundioIRR}


{rule:}
{:PresIndIRRsg}
FUNCTION comPresIndIRRsg(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
          BEGIN
          IF true THEN
            BEGIN
            IF SFCATrec1.key = SFK1SgIndPres THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  1
                end
              END;
            IF SFCATrec1.key = SFK2SgIndPres THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  2
                end
              END;
            IF SFCATrec1.key = SFK3SgIndPres THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
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
            skip
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo;
          VERB_rec1^.futuro :=  nofuturo
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
comPresIndIRRsg:=result
end;
{:PresIndIRRsg}


{rule:}
{:PresIndIRRpl}
FUNCTION comPresIndIRRpl(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
          BEGIN
          IF true THEN
            BEGIN
            IF SFCATrec1.key = SFK1PlIndPres THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  1
                end
              END;
            IF SFCATrec1.key = SFK2PlIndPres THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  2
                end
              END;
            IF SFCATrec1.key = SFK3PlIndPres THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  3
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
            skip
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.modo :=  Indicativo;
          VERB_rec1^.futuro :=  nofuturo
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
comPresIndIRRpl:=result
end;
{:PresIndIRRpl}


{rule:}
{:PresSubjIRRsg}
FUNCTION comPresSubjIRRsg(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF (SUBVERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
          BEGIN
          IF true THEN
            BEGIN
            IF SFCATrec1.key = SFK1Sg3SubjPres THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  1
                end
              END;
            IF SFCATrec1.key = SFK2SgSubjPres THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  2
                end
              END;
            IF SFCATrec1.key = SFK1Sg3SubjPres THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
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
            skip
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
comPresSubjIRRsg:=result
end;
{:PresSubjIRRsg}


{rule:}
{:PresSubjIRRpl}
FUNCTION comPresSubjIRRpl(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
          BEGIN
          IF true THEN
            BEGIN
            IF SFCATrec1.key = SFK1PlSubjPres THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  1
                end
              END;
            IF SFCATrec1.key = SFK2PlSubjPres THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  2
                end
              END;
            IF SFCATrec1.key = SFK3PlSubjPres THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  3
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
            skip
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
comPresSubjIRRpl:=result
end;
{:PresSubjIRRpl}


{rule:}
{:ImperfIRRsg}
FUNCTION comImperfIRRsg(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
            BEGIN
            IF true THEN
              BEGIN
              IF SFCATrec1.key = SFK1Sg3Imperf THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  1
                  end
                END;
              IF SFCATrec1.key = SFK2SgImperf THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  2
                  end
                END;
              IF SFCATrec1.key = SFK1Sg3Imperf THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  3
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.numero :=  singular
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
comImperfIRRsg:=result
end;
{:ImperfIRRsg}


{rule:}
{:ImperfIRRpl}
FUNCTION comImperfIRRpl(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
            BEGIN
            IF true THEN
              BEGIN
              IF SFCATrec1.key = SFK1PlImperf THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  1
                  end
                END;
              IF SFCATrec1.key = SFK2PlImperf THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  2
                  end
                END;
              IF SFCATrec1.key = SFK3PlImperf THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  3
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.numero :=  plural
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
comImperfIRRpl:=result
end;
{:ImperfIRRpl}


{rule:}
{:PDirrSG}
FUNCTION comPDirrSG(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
            BEGIN
            IF true THEN
              BEGIN
              IF SFCATrec1.key = SFK1SgPD THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  1
                  end
                END;
              IF SFCATrec1.key = SFK2SgPD THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  2
                  end
                END;
              IF SFCATrec1.key = SFK3SgPD THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  3
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.numero :=  singular
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
comPDirrSG:=result
end;
{:PDirrSG}


{rule:}
{:PDirrPL}
FUNCTION comPDirrPL(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
            BEGIN
            IF true THEN
              BEGIN
              IF SFCATrec1.key = SFK1PlPD THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  1
                  end
                END;
              IF SFCATrec1.key = SFK2PlPD THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  2
                  end
                END;
              IF SFCATrec1.key = SFK3PlPD THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  3
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.numero :=  plural
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
comPDirrPL:=result
end;
{:PDirrPL}


{rule:}
{:SubjPasIRRsg}
FUNCTION comSubjPasIRRsg(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
          BEGIN
          IF true THEN
            BEGIN
            IF SFCATrec1.key = SFK1Sg3SubjPas THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  1
                end
              END;
            IF SFCATrec1.key = SFK2SgSubjPas THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  2
                end
              END;
            IF SFCATrec1.key = SFK1Sg3SubjPas THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
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
            skip
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
comSubjPasIRRsg:=result
end;
{:SubjPasIRRsg}


{rule:}
{:SubjPasIRRpl}
FUNCTION comSubjPasIRRpl(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
          BEGIN
          IF true THEN
            BEGIN
            IF SFCATrec1.key = SFK1PlSubjPas THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  1
                end
              END;
            IF SFCATrec1.key = SFK2PlSubjPas THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  2
                end
              END;
            IF SFCATrec1.key = SFK3PlSubjPas THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  3
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
            skip
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
comSubjPasIRRpl:=result
end;
{:SubjPasIRRpl}


{rule:}
{:SubjPasaIRRsg}
FUNCTION comSubjPasaIRRsg(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
          BEGIN
          IF true THEN
            BEGIN
            IF SFCATrec1.key = SFK1Sg3SubjPasa THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  1
                end
              END;
            IF SFCATrec1.key = SFK2SgSubjPasa THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  2
                end
              END;
            IF SFCATrec1.key = SFK1Sg3SubjPasa THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
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
            skip
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
comSubjPasaIRRsg:=result
end;
{:SubjPasaIRRsg}


{rule:}
{:SubjPasaIRRpl}
FUNCTION comSubjPasaIRRpl(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
          BEGIN
          IF true THEN
            BEGIN
            IF SFCATrec1.key = SFK1PlSubjPasa THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  1
                end
              END;
            IF SFCATrec1.key = SFK2PlSubjPasa THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  2
                end
              END;
            IF SFCATrec1.key = SFK3PlSubjpasa THEN
              BEGIN
              if success then againsuccess:=true;
              downcount:=downcount-1;
              if downcount=0 then
                begin
                success:=true;
                level:=6;
                createoutputtree(s);
                VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                VERB_rec1^.persona :=  3
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
            skip
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
comSubjPasaIRRpl:=result
end;
{:SubjPasaIRRpl}


{rule:}
{:FuturoIRRsg}
FUNCTION comFuturoIRRsg(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
            BEGIN
            IF true THEN
              BEGIN
              IF SFCATrec1.key = SFK1SgFut THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  1
                  end
                END;
              IF SFCATrec1.key = SFK2SgFut THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  2
                  end
                END;
              IF SFCATrec1.key = SFK3SgFut THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  3
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.numero :=  singular
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
comFuturoIRRsg:=result
end;
{:FuturoIRRsg}


{rule:}
{:FuturoIRRpl}
FUNCTION comFuturoIRRpl(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
            BEGIN
            IF true THEN
              BEGIN
              IF SFCATrec1.key = SFK1PlFut THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  1
                  end
                END;
              IF SFCATrec1.key = SFK2PlFut THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  2
                  end
                END;
              IF SFCATrec1.key = SFK3PlFut THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  3
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.numero :=  plural
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
comFuturoIRRpl:=result
end;
{:FuturoIRRpl}


{rule:}
{:CondIRRsg}
FUNCTION comCondIRRsg(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF SUBVERBrec1.CONJclases * [ CONJ0 ] THEN
            BEGIN
            IF true THEN
              BEGIN
              IF SFCATrec1.key = SFK1Sg3Cond THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  1
                  end
                END;
              IF SFCATrec1.key = SFK2SgCond THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  2
                  end
                END;
              IF SFCATrec1.key = SFK1Sg3Cond THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  3
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.numero :=  singular
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
comCondIRRsg:=result
end;
{:CondIRRsg}


{rule:}
{:CondIRRpl}
FUNCTION comCondIRRpl(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF true THEN
          BEGIN
          IF (SUBVERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
            BEGIN
            IF true THEN
              BEGIN
              IF SFCATrec1.key = SFK1PlCond THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  1
                  end
                END;
              IF SFCATrec1.key = SFK2PlCond THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  2
                  end
                END;
              IF SFCATrec1.key = SFK3PlCond THEN
                BEGIN
                if success then againsuccess:=true;
                downcount:=downcount-1;
                if downcount=0 then
                  begin
                  success:=true;
                  level:=7;
                  createoutputtree(s);
                  VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
                  VERB_rec1^.persona :=  3
                  end
                END;
              if success and (level=7) then
                begin
                level:=6;
                VERB_rec1^.numero :=  plural
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
comCondIRRpl:=result
end;
{:CondIRRpl}


{rule:}
{:ImperatIRR}
FUNCTION comImperatIRR(Is1,Is2:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
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
      IF true THEN
        BEGIN
        IF (SUBVERBrec1.CONJclases * [ CONJ0 ] <>[]) THEN
          BEGIN
          IF SFCATrec1.key = SFKsgImperat THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
              VERB_rec1^.numero :=  singular
              end
            END;
          IF SFCATrec1.key = SFKplImperat THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
              VERB_rec1^ :=  copyT_subtoverb(SUBVERBrec1);
              VERB_rec1^.numero :=  plural
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
          VERB_rec1^.persona :=  2
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
comImperatIRR:=result
end;
{:ImperatIRR}


{rule:}
{:ALOSUBnadadiftong}
FUNCTION comALOSUBnadadiftong(Is1:LISTREE_pStree)
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
    IF SUBVERBrec1.Aloclases = [nadaCLASE] THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        ALOVERB_rec1^ :=  copyT_subtoaloverb ( SUBVERBrec1 )
        end
      END;
    IF SUBVERBrec1.Aloclases = [diftongCLASE] THEN
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
                ALOVERB_rec1^.futuro :=  nofuturo
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
              ALOVERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.modo :=  Subjuntivo
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
          ALOVERB_rec1^.modo :=  PtcPas
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
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
            ALOVERB_rec1^.modo :=  Subjuntivo
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
                ALOVERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.aspecto :=  perfectivo
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
comALOSUBnadadiftong:=result
end;
{:ALOSUBnadadiftong}


{rule:}
{:ALOSUBirrMedek}
FUNCTION comALOSUBirrMedek(Is1:LISTREE_pStree)
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
    IF SUBVERBrec1.Aloclases = [irrMedekCLASE] THEN
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
                ALOVERB_rec1^.futuro :=  nofuturo
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  plural
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
                ALOVERB_rec1^.futuro :=  nofuturo
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
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
            ALOVERB_rec1^.modo :=  Subjuntivo
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
                ALOVERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.aspecto :=  perfectivo
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
comALOSUBirrMedek:=result
end;
{:ALOSUBirrMedek}


{rule:}
{:ALOSUBsterk}
FUNCTION comALOSUBsterk(Is1:LISTREE_pStree)
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
    IF SUBVERBrec1.Aloclases = [sterkCLASE] THEN
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
              ALOVERB_rec1^.numero :=  plural
              end
            END;
          if success and (level=5) then
            begin
            level:=4;
            ALOVERB_rec1^.modo :=  Subjuntivo
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
              ALOVERB_rec1^.aspecto :=  imperfectivo
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
comALOSUBsterk:=result
end;
{:ALOSUBsterk}


{rule:}
{:ALOSUBeiouHalf}
FUNCTION comALOSUBeiouHalf(Is1:LISTREE_pStree)
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
    IF SUBVERBrec1.Aloclases = [eiouHalfCLASE] THEN
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
                ALOVERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  singular
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
                level:=6;
                createoutputtree(s);
                ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
                ALOVERB_rec1^.persona :=  3
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
            ALOVERB_rec1^.modo :=  Subjuntivo
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
comALOSUBeiouHalf:=result
end;
{:ALOSUBeiouHalf}


{rule:}
{:ALOSUBeiouHeel}
FUNCTION comALOSUBeiouHeel(Is1:LISTREE_pStree)
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
    IF SUBVERBrec1.Aloclases = [eiouHeelCLASE] THEN
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
                ALOVERB_rec1^.futuro :=  nofuturo
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
              ALOVERB_rec1^.futuro :=  sifuturo
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
              ALOVERB_rec1^.aspecto :=  imperfectivo
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
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo
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
comALOSUBeiouHeel:=result
end;
{:ALOSUBeiouHeel}


{rule:}
{:ALOSUByMinPres}
FUNCTION comALOSUByMinPres(Is1:LISTREE_pStree)
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
    IF SUBVERBrec1.Aloclases = [yMinPresCLASE] THEN
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
                ALOVERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  singular
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
                ALOVERB_rec1^.persona :=  3
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
            ALOVERB_rec1^.tiempo :=  Presente
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Subjuntivo
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
              ALOVERB_rec1^.aspecto :=  imperfectivo
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
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo
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
comALOSUByMinPres:=result
end;
{:ALOSUByMinPres}


{rule:}
{:ALOSUBumlaut}
FUNCTION comALOSUBumlaut(Is1:LISTREE_pStree)
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
    IF SUBVERBrec1.Aloclases = [umlautCLASE] THEN
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
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
            ALOVERB_rec1^.tiempo :=  Pasado
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Subjuntivo
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
                ALOVERB_rec1^.persona :=  3
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.aspecto :=  perfectivo
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
        if success and (level=4) then
          begin
          level:=3;
          ALOVERB_rec1^.modo :=  Indicativo
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
comALOSUBumlaut:=result
end;
{:ALOSUBumlaut}


{rule:}
{:ALOSUBve}
FUNCTION comALOSUBve(Is1:LISTREE_pStree)
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
    IF SUBVERBrec1.Aloclases = [veCLASE] THEN
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
                ALOVERB_rec1^.futuro :=  nofuturo
                end
              END;
            if success and (level=6) then
              begin
              level:=5;
              ALOVERB_rec1^.numero :=  plural
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
                ALOVERB_rec1^.futuro :=  nofuturo
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
                ALOVERB_rec1^.persona :=  3
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
        IF true THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            ALOVERB_rec1^ :=  copyT_subtoaloverb(SUBVERBrec1);
            ALOVERB_rec1^.modo :=  Subjuntivo
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
comALOSUBve:=result
end;
{:ALOSUBve}

