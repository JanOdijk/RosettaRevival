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
{:LBVerb}
FUNCTION comLBVerb(Is1:LISTREE_pStree)
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
        SUBVERB_rec1^ :=  copyT_bverbtosubverb(BVERBrec1)
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comLBVerb:=result
end;
{:LBVerb}


{rule:}
{:LVerbBaseform}
FUNCTION comLVerbBaseform(Is1:LISTREE_pStree)
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
      IF [1, 2, 3, 4, 8, 9, 10, 11] * SUBVERBrec1.conjclasses <> [] THEN
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
            VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.modus :=  indicative;
            VERB_rec1^.tense :=  presenttense;
            VERB_rec1^.persons :=  [1,2];
            VERB_rec1^.numbers :=  [singular]
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
            VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.modus :=  indicative;
            VERB_rec1^.tense :=  presenttense;
            VERB_rec1^.persons :=  [1,2,3];
            VERB_rec1^.numbers :=  [plural]
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
            VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.modus :=  infinitive;
            VERB_rec1^.tense :=  omegatense;
            VERB_rec1^.persons :=  [];
            VERB_rec1^.numbers :=  []
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
            VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.modus :=  subjunctive;
            VERB_rec1^.tense :=  presenttense;
            VERB_rec1^.persons :=  [1,2,3];
            VERB_rec1^.numbers :=  [singular, plural]
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          skip
          end
        END;
      IF [12, 13] * SUBVERBrec1.conjclasses <> [] THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.modus :=  indicative;
          VERB_rec1^.tense :=  presenttense;
          VERB_rec1^.persons :=  [1,2,3];
          VERB_rec1^.numbers :=  [singular, plural]
          end
        END;
      IF 14 in SUBVERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.modus :=  indicative;
          VERB_rec1^.tense :=  pasttense;
          VERB_rec1^.persons :=  [1,2,3];
          VERB_rec1^.numbers :=  [singular, plural]
          end
        END;
      IF 0 in SUBVERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.modus :=  infinitive;
          VERB_rec1^.tense :=  omegatense;
          VERB_rec1^.persons :=  [];
          VERB_rec1^.numbers :=  []
          end
        END;
      IF 0 in SUBVERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.modus :=  subjunctive;
          VERB_rec1^.tense :=  presenttense;
          VERB_rec1^.persons :=  [1,2,3];
          VERB_rec1^.numbers :=  [singular, plural]
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
comLVerbBaseform:=result
end;
{:LVerbBaseform}


{rule:}
{:LVerbSform}
FUNCTION comLVerbSform(Is1,Is2:LISTREE_pStree)
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
      IF SFCATrec1.key = SFKregS then
          if SUBVERBrec1.sform = regS THEN
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
      IF SFCATrec1.key = SFKregEs then
          if SUBVERBrec1.sform = regEs THEN
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
      IF SFCATrec1.key = SFKirrS then
          if SUBVERBrec1.sform = irrS THEN
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
        VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.tense :=  presenttense;
        VERB_rec1^.persons :=  [3];
        VERB_rec1^.numbers :=  [singular]
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comLVerbSform:=result
end;
{:LVerbSform}


{rule:}
{:LVerbPasttense}
FUNCTION comLVerbPasttense(Is1,Is2:LISTREE_pStree)
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
      IF SFCATrec1.key = SFKirrpt then
          if [1,8] * SUBVERBrec1.conjclasses <> [] THEN
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
      IF SFCATrec1.key = SFKirrpt2 then
          if 5 in SUBVERBrec1.conjclasses THEN
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
      IF SFCATrec1.key = SFKirrptpp then
          if 2 in SUBVERBrec1.conjclasses THEN
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
      IF SFCATrec1.key = SFKirrnc then
          if [3,9] * SUBVERBrec1.conjclasses <> [] THEN
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
      IF SFCATrec1.key = SFKregptpp then
          if [4,10] * SUBVERBrec1.conjclasses <> [] THEN
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
      IF SFCATrec1.key = SFKcdptpp then
          if 11 in SUBVERBrec1.conjclasses THEN
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
      IF SFCATrec1.key = SFKmodpt then
          if 12 in SUBVERBrec1.conjclasses THEN
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
        VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.tense :=  pasttense;
        VERB_rec1^.persons :=  [1,2,3];
        VERB_rec1^.numbers :=  [singular, plural]
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comLVerbPasttense:=result
end;
{:LVerbPasttense}


{rule:}
{:LVerbPastparticiple}
FUNCTION comLVerbPastparticiple(Is1,Is2:LISTREE_pStree)
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
      IF SFCATrec1.key = SFKirrpp then
          if [0,1,4,9] * SUBVERBrec1.conjclasses <> [] THEN
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
      IF SFCATrec1.key = SFKirrptpp then
          if 2 in SUBVERBrec1.conjclasses THEN
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
      IF SFCATrec1.key = SFKirrpp2 then
          if 6 in SUBVERBrec1.conjclasses THEN
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
      IF SFCATrec1.key = SFKirrpp3 then
          if 7 in SUBVERBrec1.conjclasses THEN
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
      IF SFCATrec1.key = SFKirrnc then
          if [3,8] * SUBVERBrec1.conjclasses <> [] THEN
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
      IF SFCATrec1.key = SFKregptpp then
          if 10 in SUBVERBrec1.conjclasses THEN
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
      IF SFCATrec1.key = SFKcdptpp then
          if 11 in SUBVERBrec1.conjclasses THEN
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
        VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.modus :=  participle;
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.numbers :=  []
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comLVerbPastparticiple:=result
end;
{:LVerbPastparticiple}


{rule:}
{:LVerbIngform}
FUNCTION comLVerbIngform(Is1,Is2:LISTREE_pStree)
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
      IF SFCATrec1.key = SFKreging then
          if SUBVERBrec1.ingform = reging THEN
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
      IF SFCATrec1.key = SFKreging then
          if SUBVERBrec1.ingform = cdreging THEN
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
      IF SFCATrec1.key = SFKcding then
          if SUBVERBrec1.ingform = cding THEN
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
      IF SFCATrec1.key = SFKcding then
          if SUBVERBrec1.ingform = cdreging THEN
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
      IF SFCATrec1.key = SFKirring then
          if SUBVERBrec1.ingform = irring THEN
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
        VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.modus :=  ingform;
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.numbers :=  []
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comLVerbIngform:=result
end;
{:LVerbIngform}


{rule:}
{:LVerbBe}
FUNCTION comLVerbBe(Is1,Is2:LISTREE_pStree)
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
    IF 0 in SUBVERBrec1.conjclasses THEN
      BEGIN
      IF SFCATrec1.key = SFKam THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.modus :=  indicative;
          VERB_rec1^.tense :=  presenttense;
          VERB_rec1^.persons :=  [1];
          VERB_rec1^.numbers :=  [singular]
          end
        END;
      IF SFCATrec1.key = SFKis THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.modus :=  indicative;
          VERB_rec1^.tense :=  presenttense;
          VERB_rec1^.persons :=  [3];
          VERB_rec1^.numbers :=  [singular]
          end
        END;
      IF SFCATrec1.key = SFKare THEN
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
            VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.modus :=  indicative;
            VERB_rec1^.tense :=  presenttense;
            VERB_rec1^.persons :=  [2];
            VERB_rec1^.numbers :=  [singular]
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
            VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.modus :=  indicative;
            VERB_rec1^.tense :=  presenttense;
            VERB_rec1^.persons :=  [1,2,3];
            VERB_rec1^.numbers :=  [plural]
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          skip
          end
        END;
      IF SFCATrec1.key = SFKwas THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.modus :=  indicative;
          VERB_rec1^.tense :=  pasttense;
          VERB_rec1^.persons :=  [1,3];
          VERB_rec1^.numbers :=  [singular]
          end
        END;
      IF SFCATrec1.key = SFKwere THEN
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
            VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.modus :=  indicative;
            VERB_rec1^.tense :=  pasttense;
            VERB_rec1^.persons :=  [2];
            VERB_rec1^.numbers :=  [singular]
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
            VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.modus :=  indicative;
            VERB_rec1^.tense :=  pasttense;
            VERB_rec1^.persons :=  [1,2,3];
            VERB_rec1^.numbers :=  [plural]
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
            VERB_rec1^ :=  copyT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.modus :=  subjunctive;
            VERB_rec1^.tense :=  pasttense;
            VERB_rec1^.persons :=  [1,2,3];
            VERB_rec1^.numbers :=  [singular, plural]
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
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comLVerbBe:=result
end;
{:LVerbBe}

