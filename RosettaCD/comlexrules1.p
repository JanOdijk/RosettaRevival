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
{:ParticleToVerb}
FUNCTION comParticleToVerb(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
PARTrec1tree:LSSTREE_pstree;
BVERBrec1tree:LSSTREE_pstree;
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
   PARTrec1:LSDOMAINT_PARTICLErecord;
   VERBrec1:LSDOMAINT_VERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   BVERBrec1:LSDOMAINT_BVERBrecord;
    VERB_rec2:LSDOMAINT_pVERBrecord;
    SUBVERB_rec2:LSDOMAINT_pSUBVERBrecord;
    PART_rec1:LSDOMAINT_pPARTICLErecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    BVERB_rec1:LSDOMAINT_pBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
PARTrec1tree:=s;
if s^.ls^.cat=PART then
PARTrec1:=s^.ls^.PARTfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
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
match:=true;
BVERBrec1tree:=s;
if s^.ls^.cat=BVERB then
BVERBrec1:=s^.ls^.BVERBfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc0(rs^.node,match)
end;
begin {modelproc0}
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
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc0(rs^.node,match)
end;
begin {modelproc2}
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
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=PARTrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=partrel;
createoutputtree(s);
rs1^.node:=s
end;
procedure createreltree2(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
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
  s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           1
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
  s:=MAKET_Stree(SUBVERB);
  SUBVERB_rec2:=s^.ls^.SUBVERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           2
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
  VERB_rec2:=s^.ls^.VERBfield;
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
    IF (PARTrec1.key = VERBrec1.particle) then
        if (VERBrec1.status = bareV) then
          if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        SUBVERB_rec2^ :=  SUBVERBrec1;
        SUBVERB_rec2^.lastaffix :=  partaffix;
        VERB_rec2^ :=  VERBrec1;
        VERB_rec2^.status :=  partV
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comParticleToVerb:=result
end;
{:ParticleToVerb}


{rule:}
{:VerbBtoSub}
FUNCTION comVerbBtoSub(Is1:LISTREE_pStree)
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
        SUBVERB_rec1^ :=  COPYT_bverbtosubverb(BVERBrec1)
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbBtoSub:=result
end;
{:VerbBtoSub}


{rule:}
{:VerbOttEnk1}
FUNCTION comVerbOttEnk1(Is1:LISTREE_pStree)
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
    IF [3,4,5,6,7,8,9,10,11,12,13,15,16] * SUBVERBrec1.conjclasses <> [] THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  presenttense;
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.number :=  singular;
        VERB_rec1^.persons :=  [1,0];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbOttEnk1:=result
end;
{:VerbOttEnk1}


{rule:}
{:VerbOttEnk1extra}
FUNCTION comVerbOttEnk1extra(Is1,Is2:LISTREE_pStree)
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
    IF (SUBVERBrec1.conjclasses * [14] <> []) then
        if (SFCATrec1.key = SFKdelD) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  presenttense;
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.number :=  singular;
        VERB_rec1^.persons :=  [0,1];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbOttEnk1extra:=result
end;
{:VerbOttEnk1extra}


{rule:}
{:VerbOttEnk2}
FUNCTION comVerbOttEnk2(Is1,Is2:LISTREE_pStree)
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
    IF (SUBVERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) then
        if (SFCATrec1.key = SFKt) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  presenttense;
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.number :=  singular;
        VERB_rec1^.persons :=  [2,3,4,5];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbOttEnk2:=result
end;
{:VerbOttEnk2}


{rule:}
{:VerbOttMv}
FUNCTION comVerbOttMv(Is1,Is2:LISTREE_pStree)
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
    IF (SUBVERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) THEN
      BEGIN
      IF (SFCATrec1.key = SFKen) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [1,2,3]
          end
        END;
      IF (SFCATrec1.key = SFKt) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [4,5]
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tense :=  presenttense;
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.number :=  plural;
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbOttMv:=result
end;
{:VerbOttMv}


{rule:}
{:VerbOvtEnk}
FUNCTION comVerbOvtEnk(Is1,Is2:LISTREE_pStree)
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
      IF (SUBVERBrec1.conjclasses * [3,4] <> []) then
          if (SFCATrec1.key = SFKdete) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [1,2,3,4,5]
          end
        END;
      IF (SUBVERBrec1.conjclasses * [5,6] <> []) then
          if (SFCATrec1.key = SFKovt1) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [1,2,3,4]
          end
        END;
      IF (SUBVERBrec1.conjclasses * [7,8] <> []) then
          if (SFCATrec1.key = SFKovtvd1) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [1,2,3,4]
          end
        END;
      IF (SUBVERBrec1.conjclasses * [9,10] <> []) then
          if (SFCATrec1.key = SFKovtvd2) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [1,2,3,4]
          end
        END;
      IF (SUBVERBrec1.conjclasses * [11,12] <> []) then
          if (SFCATrec1.key = SFKovt2) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [1,2,3,4]
          end
        END;
      IF (13 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKovt3) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [1,2,3,4]
          end
        END;
      IF (SUBVERBrec1.conjclasses * [15,16] <> []) then
          if (SFCATrec1.key = SFKdete) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [1,2,3,4,5]
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tense :=  pasttense;
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.number :=  singular;
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbOvtEnk:=result
end;
{:VerbOvtEnk}


{rule:}
{:VerbOvtEnkPers5extra}
FUNCTION comVerbOvtEnkPers5extra(Is1,Is2,Is3:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   SFCATrec2:LSDOMAINT_xxkeyrecord;
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
procedure modelproc3(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc3}
if s^.ls^.cat=SFCAT then
SFCATrec2:=s^.ls^.SFCATfield^
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
s3:=loopholes.retype(Is3,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
if match then modelproc3(s3,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF SFCATrec2.key = SFKt THEN
      BEGIN
      IF (SUBVERBrec1.conjclasses * [5,6] <> []) then
          if (SFCATrec1.key = SFKovt1) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      IF (SUBVERBrec1.conjclasses * [7,8] <> []) then
          if (SFCATrec1.key = SFKovtvd1) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      IF (SUBVERBrec1.conjclasses * [9,10] <> []) then
          if (SFCATrec1.key = SFKovtvd2) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      IF (SUBVERBrec1.conjclasses * [11,12] <> []) then
          if (SFCATrec1.key = SFKovt2) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      IF (13 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKovt3) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tense :=  pasttense;
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.number :=  singular;
        VERB_rec1^.persons :=  [5];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbOvtEnkPers5extra:=result
end;
{:VerbOvtEnkPers5extra}


{rule:}
{:VerbOvtMv}
FUNCTION comVerbOvtMv(Is1,Is2,Is3:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   SFCATrec2:LSDOMAINT_xxkeyrecord;
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
procedure modelproc3(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc3}
if s^.ls^.cat=SFCAT then
SFCATrec2:=s^.ls^.SFCATfield^
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
s3:=loopholes.retype(Is3,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
if match then modelproc3(s3,match);
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
      IF SFCATrec2.key = SFKen THEN
        BEGIN
        IF (SUBVERBrec1.conjclasses * [3,4] <> []) then
            if (SFCATrec1.key = SFKdete) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
            end
          END;
        IF (SUBVERBrec1.conjclasses * [5,6] <> []) then
            if (SFCATrec1.key = SFKovt1) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
            end
          END;
        IF (SUBVERBrec1.conjclasses * [7,8] <> []) then
            if (SFCATrec1.key = SFKovtvd1) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
            end
          END;
        IF (SUBVERBrec1.conjclasses * [9,10] <> []) then
            if (SFCATrec1.key = SFKovtvd2) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
            end
          END;
        IF (SUBVERBrec1.conjclasses * [11,12] <> []) then
            if (SFCATrec1.key = SFKovt2) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
            end
          END;
        IF (13 in SUBVERBrec1.conjclasses) then
            if (SFCATrec1.key = SFKovt3) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
            end
          END;
        IF (SUBVERBrec1.conjclasses * [15,16] <> []) then
            if (SFCATrec1.key = SFKdete) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.persons :=  [1,2,3]
          end
        END;
      IF SFCATrec2.key = SFKt THEN
        BEGIN
        IF (SUBVERBrec1.conjclasses * [5,6] <> []) then
            if (SFCATrec1.key = SFKovt1) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
            end
          END;
        IF (SUBVERBrec1.conjclasses * [7,8] <> []) then
            if (SFCATrec1.key = SFKovtvd1) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
            end
          END;
        IF (SUBVERBrec1.conjclasses * [9,10] <> []) then
            if (SFCATrec1.key = SFKovtvd2) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
            end
          END;
        IF (SUBVERBrec1.conjclasses * [11,12] <> []) then
            if (SFCATrec1.key = SFKovt2) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
            end
          END;
        IF (13 in SUBVERBrec1.conjclasses) then
            if (SFCATrec1.key = SFKovt3) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.persons :=  [5]
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tense :=  pasttense;
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.number :=  plural;
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbOvtMv:=result
end;
{:VerbOvtMv}


{rule:}
{:VerbOvtMvPers4en5extra}
FUNCTION comVerbOvtMvPers4en5extra(Is1,Is2:LISTREE_pStree)
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
      IF (SUBVERBrec1.conjclasses * [3,4] <> []) then
          if (SFCATrec1.key = SFKdete) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [4,5]
          end
        END;
      IF (SUBVERBrec1.conjclasses * [5,6] <> []) then
          if (SFCATrec1.key = SFKovt1) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [4]
          end
        END;
      IF (SUBVERBrec1.conjclasses * [7,8] <> []) then
          if (SFCATrec1.key = SFKovtvd1) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [4]
          end
        END;
      IF (SUBVERBrec1.conjclasses * [9,10] <> []) then
          if (SFCATrec1.key = SFKovtvd2) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [4]
          end
        END;
      IF (SUBVERBrec1.conjclasses * [11,12] <> []) then
          if (SFCATrec1.key = SFKovt2) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [4]
          end
        END;
      IF (13 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKovt3) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [4]
          end
        END;
      IF (SUBVERBrec1.conjclasses * [15,16] <> []) then
          if (SFCATrec1.key = SFKdete) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.persons :=  [4,5]
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tense :=  pasttense;
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.number :=  plural;
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbOvtMvPers4en5extra:=result
end;
{:VerbOvtMvPers4en5extra}


{rule:}
{:VerbVd1}
FUNCTION comVerbVd1(Is1,Is2,Is3:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   PFCATrec1:LSDOMAINT_xxkeyrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    VERB_rec1:LSDOMAINT_pVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=PFCAT then
PFCATrec1:=s^.ls^.PFCATfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc3(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc3}
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
s3:=loopholes.retype(Is3,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
if match then modelproc3(s3,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF PFCATrec1.key = PFKge THEN
      BEGIN
      IF (3 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKdt) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      IF (5 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKen) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      IF (9 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKovtvd2) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  pastpart;
        VERB_rec1^.number :=  omeganumber;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbVd1:=result
end;
{:VerbVd1}


{rule:}
{:VerbVd2}
FUNCTION comVerbVd2(Is1,Is2,Is3,Is4:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   s4:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   PFCATrec1:LSDOMAINT_xxkeyrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   SFCATrec2:LSDOMAINT_xxkeyrecord;
    VERB_rec1:LSDOMAINT_pVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=PFCAT then
PFCATrec1:=s^.ls^.PFCATfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc3(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc3}
if s^.ls^.cat=SFCAT then
SFCATrec1:=s^.ls^.SFCATfield^
else match:=false;
skip
end;
procedure modelproc4(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc4}
if s^.ls^.cat=SFCAT then
SFCATrec2:=s^.ls^.SFCATfield^
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
s3:=loopholes.retype(Is3,LSSTREE_pStree);
s4:=loopholes.retype(Is4,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
if match then modelproc3(s3,match);
if match then modelproc4(s4,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF (PFCATrec1.key = PFKge) then
        if (SFCATrec2.key = SFKen) THEN
      BEGIN
      IF (7 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKovtvd1) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      IF (11 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKvd1) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      IF (15 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKvd2) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  pastpart;
        VERB_rec1^.number :=  omeganumber;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbVd2:=result
end;
{:VerbVd2}


{rule:}
{:VerbVd3}
FUNCTION comVerbVd3(Is1,Is2:LISTREE_pStree)
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
      IF (4 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKdt) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      IF (6 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKen) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      IF (10 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKovtvd2) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  pastpart;
        VERB_rec1^.number :=  omeganumber;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbVd3:=result
end;
{:VerbVd3}


{rule:}
{:VerbVd4}
FUNCTION comVerbVd4(Is1,Is2,Is3:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   SFCATrec2:LSDOMAINT_xxkeyrecord;
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
procedure modelproc3(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc3}
if s^.ls^.cat=SFCAT then
SFCATrec2:=s^.ls^.SFCATfield^
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
s3:=loopholes.retype(Is3,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
if match then modelproc3(s3,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF SFCATrec2.key = SFKen THEN
      BEGIN
      IF (8 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKovtvd1) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      IF (12 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKvd1) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      IF (16 in SUBVERBrec1.conjclasses) then
          if (SFCATrec1.key = SFKvd2) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  pastpart;
        VERB_rec1^.number :=  omeganumber;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbVd4:=result
end;
{:VerbVd4}


{rule:}
{:VerbInf}
FUNCTION comVerbInf(Is1,Is2:LISTREE_pStree)
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
    IF (SUBVERBrec1.conjclasses * [0,3,4,5,6,7,8,9,10,11,12,13,15,16]<>[]) then
        if (SFCATrec1.key = SFKen) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  infinitive;
        VERB_rec1^.number :=  omeganumber;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbInf:=result
end;
{:VerbInf}


{rule:}
{:VerbTd}
FUNCTION comVerbTd(Is1,Is2,Is3:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   SFCATrec2:LSDOMAINT_xxkeyrecord;
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
procedure modelproc3(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc3}
if s^.ls^.cat=SFCAT then
SFCATrec2:=s^.ls^.SFCATfield^
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
s3:=loopholes.retype(Is3,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
if match then modelproc3(s3,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF (SUBVERBrec1.conjclasses * [0,3,4,5,6,7,8,9,10,11,12,13,15,16]<>[]) then
        if (SFCATrec1.key = SFKen) then
          if (SFCATrec2.key = SFKdt) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  prespart;
        VERB_rec1^.number :=  omeganumber;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbTd:=result
end;
{:VerbTd}


{rule:}
{:VerbGbEnk}
FUNCTION comVerbGbEnk(Is1:LISTREE_pStree)
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
    IF SUBVERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> [] THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  imperative;
        VERB_rec1^.number :=  singular;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbGbEnk:=result
end;
{:VerbGbEnk}


{rule:}
{:VerbGbEnkExtra}
FUNCTION comVerbGbEnkExtra(Is1,Is2:LISTREE_pStree)
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
    IF (SUBVERBrec1.conjclasses * [14] <> []) then
        if (SFCATrec1.key = SFKdelD) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  imperative;
        VERB_rec1^.number :=  singular;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbGbEnkExtra:=result
end;
{:VerbGbEnkExtra}


{rule:}
{:VerbGbMv}
FUNCTION comVerbGbMv(Is1,Is2:LISTREE_pStree)
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
    IF (SUBVERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) then
        if (SFCATrec1.key = SFKt) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  imperative;
        VERB_rec1^.number :=  plural;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbGbMv:=result
end;
{:VerbGbMv}


{rule:}
{:VerbConjunctiefOtt}
FUNCTION comVerbConjunctiefOtt(Is1,Is2:LISTREE_pStree)
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
    IF (SUBVERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) then
        if (SFCATrec1.key = SFKe) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  presenttense;
        VERB_rec1^.modus :=  subjunctive;
        VERB_rec1^.number :=  omeganumber;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbConjunctiefOtt:=result
end;
{:VerbConjunctiefOtt}


{rule:}
{:VerbZorOttExtra}
FUNCTION comVerbZorOttExtra(Is1:LISTREE_pStree)
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
    IF SUBVERBrec1.conjclasses * [1,2] <> [] THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  presenttense;
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.number :=  singular;
        VERB_rec1^.persons :=  [1,0];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbZorOttExtra:=result
end;
{:VerbZorOttExtra}


{rule:}
{:VerbZorOtt}
FUNCTION comVerbZorOtt(Is1,Is2:LISTREE_pStree)
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
    IF SUBVERBrec1.conjclasses * [1,2] <> [] THEN
      BEGIN
      IF true THEN
        BEGIN
        IF SFCATrec1.key = SFKIrrottenk0 THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [0]
            end
          END;
        IF SFCATrec1.key = SFKIrrottenk2 THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [2]
            end
          END;
        IF SFCATrec1.key = SFKIrrottenk3 THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [3]
            end
          END;
        IF SFCATrec1.key = SFKIrrott4 THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [4]
            end
          END;
        IF SFCATrec1.key = SFKIrrott5 THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [5]
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.number :=  singular
          end
        END;
      IF true THEN
        BEGIN
        IF SFCATrec1.key = SFKIrrott4 THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [4]
            end
          END;
        IF SFCATrec1.key = SFKIrrott5 THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [5]
            end
          END;
        IF SFCATrec1.key = SFKIrrottmv THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [1,2,3]
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.number :=  plural
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tense :=  presenttense;
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbZorOtt:=result
end;
{:VerbZorOtt}


{rule:}
{:VerbZorOvt}
FUNCTION comVerbZorOvt(Is1,Is2:LISTREE_pStree)
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
    IF SUBVERBrec1.conjclasses * [1,2] <> [] THEN
      BEGIN
      IF true THEN
        BEGIN
        IF SFCATrec1.key = SFKIrrovtenk THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [1,2,3,4]
            end
          END;
        IF SFCATrec1.key = SFKIrrovt5 THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [5]
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.number :=  singular
          end
        END;
      IF true THEN
        BEGIN
        IF SFCATrec1.key = SFKIrrovtmv THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [1,2,3]
            end
          END;
        IF SFCATrec1.key = SFKIrrovtenk THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [4]
            end
          END;
        IF SFCATrec1.key = SFKIrrovt5 THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
            VERB_rec1^.persons :=  [5]
            end
          END;
        if success and (level=4) then
          begin
          level:=3;
          VERB_rec1^.number :=  plural
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.tense :=  pasttense;
        VERB_rec1^.modus :=  indicative;
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbZorOvt:=result
end;
{:VerbZorOvt}


{rule:}
{:VerbZorVd1}
FUNCTION comVerbZorVd1(Is1,Is2,Is3:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   PFCATrec1:LSDOMAINT_xxkeyrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    VERB_rec1:LSDOMAINT_pVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=PFCAT then
PFCATrec1:=s^.ls^.PFCATfield^
else match:=false;
skip
end;
procedure modelproc2(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc2}
if s^.ls^.cat=SUBVERB then
SUBVERBrec1:=s^.ls^.SUBVERBfield^
else match:=false;
rs:=s^.sons;
mu1:=rs
end;
procedure modelproc3(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc3}
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
s3:=loopholes.retype(Is3,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
if match then modelproc3(s3,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF (SUBVERBrec1.conjclasses * [1] <> []) then
        if (PFCATrec1.key = PFKge) then
          if (SFCATrec1.key = SFKIrrvd) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  pastpart;
        VERB_rec1^.number :=  omeganumber;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbZorVd1:=result
end;
{:VerbZorVd1}


{rule:}
{:VerbZorVd2}
FUNCTION comVerbZorVd2(Is1,Is2:LISTREE_pStree)
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
    IF (SUBVERBrec1.conjclasses * [2] <> []) then
        if (SFCATrec1.key = SFKIrrvd) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  pastpart;
        VERB_rec1^.number :=  omeganumber;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbZorVd2:=result
end;
{:VerbZorVd2}


{rule:}
{:VerbZorInf}
FUNCTION comVerbZorInf(Is1,Is2:LISTREE_pStree)
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
    IF (SUBVERBrec1.conjclasses * [1,2] <> []) then
        if (SFCATrec1.key = SFKIrrottmv) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  infinitive;
        VERB_rec1^.number :=  omeganumber;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbZorInf:=result
end;
{:VerbZorInf}


{rule:}
{:VerbZorTd}
FUNCTION comVerbZorTd(Is1,Is2,Is3:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   SFCATrec2:LSDOMAINT_xxkeyrecord;
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
procedure modelproc3(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc3}
if s^.ls^.cat=SFCAT then
SFCATrec2:=s^.ls^.SFCATfield^
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
s3:=loopholes.retype(Is3,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
if match then modelproc3(s3,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF (SUBVERBrec1.conjclasses * [1,2] <> []) then
        if (SFCATrec1.key = SFKIrrottmv) then
          if (SFCATrec2.key = SFKdt) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  prespart;
        VERB_rec1^.number :=  omeganumber;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbZorTd:=result
end;
{:VerbZorTd}


{rule:}
{:VerbZorGbEnk}
FUNCTION comVerbZorGbEnk(Is1,Is2:LISTREE_pStree)
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
    IF (SUBVERBrec1.conjclasses * [1,2] <> []) then
        if (SFCATrec1.key = SFKIrrgb) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  imperative;
        VERB_rec1^.number :=  singular;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbZorGbEnk:=result
end;
{:VerbZorGbEnk}


{rule:}
{:VerbZorGbMv}
FUNCTION comVerbZorGbMv(Is1,Is2,Is3:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   SFCATrec2:LSDOMAINT_xxkeyrecord;
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
procedure modelproc3(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc3}
if s^.ls^.cat=SFCAT then
SFCATrec2:=s^.ls^.SFCATfield^
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
s3:=loopholes.retype(Is3,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
if match then modelproc3(s3,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF (SUBVERBrec1.conjclasses * [1,2] <> []) then
        if (SFCATrec1.key = SFKIrrgb) then
          if (SFCATrec2.key = SFKt) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
        VERB_rec1^.tense :=  omegatense;
        VERB_rec1^.modus :=  imperative;
        VERB_rec1^.number :=  plural;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbZorGbMv:=result
end;
{:VerbZorGbMv}


{rule:}
{:VerbZorConjunctief}
FUNCTION comVerbZorConjunctief(Is1,Is2:LISTREE_pStree)
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
    IF SUBVERBrec1.conjclasses * [1,2] <> [] THEN
      BEGIN
      IF SFCATrec1.key = SFKIrrconjott THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.tense :=  presenttense
          end
        END;
      IF SFCATrec1.key = SFKIrrconjovt THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^ :=  COPYT_subverbtoverb(SUBVERBrec1);
          VERB_rec1^.tense :=  pasttense
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        VERB_rec1^.modus :=  subjunctive;
        VERB_rec1^.number :=  omeganumber;
        VERB_rec1^.persons :=  [];
        VERB_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comVerbZorConjunctief:=result
end;
{:VerbZorConjunctief}


{rule:}
{:VerbeORenvorm}
FUNCTION comVerbeORenvorm(Is1,Is2:LISTREE_pStree)
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
   VERBrec1:LSDOMAINT_VERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    VERB_rec1:LSDOMAINT_pVERBrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=VERB then
VERBrec1:=s^.ls^.VERBfield^
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
  s:=MAKET_Stree(VERB);
  s^.ls^.VERBfield^:=VERBrec1;
  VERB_rec1:=s^.ls^.VERBfield;
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
    IF ((VERBrec1.modus = pastpart)  or  (VERBrec1.modus = prespart)) then
        if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      IF SFCATrec1.key = SFKe THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^.eORenForm :=  eForm
          end
        END;
      IF SFCATrec1.key = SFKen THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          VERB_rec1^.eORenForm :=  enForm
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
comVerbeORenvorm:=result
end;
{:VerbeORenvorm}


{rule:}
{:NOUNcomp1}
FUNCTION comNOUNcomp1(Is1,Is2,Is3:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   NOUNrec1:LSDOMAINT_NOUNrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
    SUBNOUN_rec2:LSDOMAINT_pSUBNOUNrecord;
    NOUN_rec1:LSDOMAINT_pNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=NOUN then
NOUNrec1:=s^.ls^.NOUNfield^
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
procedure modelproc3(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc3}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
else match:=false;
rs:=s^.sons;
mu2:=rs
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
  s:=MAKET_Stree(NOUN);
  s^.ls^.NOUNfield^:=NOUNrec1;
  NOUN_rec1:=s^.ls^.NOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=modrel;
createoutputtree(s);
rs1^.node:=s
end;
procedure createreltree2(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu2
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBNOUN);
  s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
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
  s:=MAKET_Stree(SUBNOUN);
  SUBNOUN_rec2:=s^.ls^.SUBNOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           2
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
s3:=loopholes.retype(Is3,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
if match then modelproc3(s3,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF (SUBNOUNrec1.lastaffix = noaffix) then
        if (NOUNrec1.geni=false) THEN
      BEGIN
      IF SFCATrec1.key = SFKleegCompound THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          SUBNOUN_rec2^ :=  SUBNOUNrec1
          end
        END;
      IF SFCATrec1.key = SFKstreepCompound THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          SUBNOUN_rec2^ :=  SUBNOUNrec1
          end
        END;
      IF SFCATrec1.key = SFKsCompound THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          SUBNOUN_rec2^ :=  SUBNOUNrec1
          end
        END;
      IF SFCATrec1.key = SFKeCompound THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          SUBNOUN_rec2^ :=  SUBNOUNrec1
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
comNOUNcomp1:=result
end;
{:NOUNcomp1}


{rule:}
{:VerbNOUNcomp}
FUNCTION comVerbNOUNcomp(Is1,Is2,Is3:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   VERBrec1:LSDOMAINT_VERBrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
    SUBNOUN_rec2:LSDOMAINT_pSUBNOUNrecord;
    VERB_rec1:LSDOMAINT_pVERBrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=VERB then
VERBrec1:=s^.ls^.VERBfield^
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
procedure modelproc3(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc3}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
else match:=false;
rs:=s^.sons;
mu2:=rs
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
  s:=MAKET_Stree(VERB);
  s^.ls^.VERBfield^:=VERBrec1;
  VERB_rec1:=s^.ls^.VERBfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=modrel;
createoutputtree(s);
rs1^.node:=s
end;
procedure createreltree2(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu2
end;
begin{createoutputtree}
  s:=MAKET_Stree(SUBNOUN);
  s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
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
  s:=MAKET_Stree(SUBNOUN);
  SUBNOUN_rec2:=s^.ls^.SUBNOUNfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           2
end;

begin {main body}
s:=nil;
s1:=loopholes.retype(Is1,LSSTREE_pStree);
s2:=loopholes.retype(Is2,LSSTREE_pStree);
s3:=loopholes.retype(Is3,LSSTREE_pStree);
match:=true;
againsuccess:=true;
numberofsuccesses:=0;
LISTREE_initsetofstrees(result);
modelproc1(s1,match);
if match then modelproc2(s2,match);
if match then modelproc3(s3,match);
WHILE againsuccess DO
  begin
  againsuccess:=false;
  success:=false;
  level:=0;
  numberofsuccesses:=numberofsuccesses+1;
  downcount:=numberofsuccesses;
  if match then
    begin
    IF (SUBNOUNrec1.lastaffix = noaffix) then
        if (VERBrec1.tense = presenttense) then
          if (VERBrec1.modus = indicative) then
            if (VERBrec1.number = singular) then
              if ([0,1] * VERBrec1.persons <> []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      IF (SFCATrec1.key = SFKleegCompound) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          SUBNOUN_rec2^ :=  SUBNOUNrec1
          end
        END;
      IF (SFCATrec1.key = SFKstreepCompound) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          SUBNOUN_rec2^ :=  SUBNOUNrec1
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
comVerbNOUNcomp:=result
end;
{:VerbNOUNcomp}

