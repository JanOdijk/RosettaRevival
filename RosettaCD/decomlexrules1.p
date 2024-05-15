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
{:ParticleToVerb}
FUNCTION decParticleToVerb(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
PARTrec1tree:LSSTREE_pstree;
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
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   VERBrec2:LSDOMAINT_VERBrecord;
   SUBVERBrec2:LSDOMAINT_SUBVERBrecord;
   PARTrec1:LSDOMAINT_PARTICLErecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
   BVERBrec1:LSDOMAINT_BVERBrecord;
    PART_rec1:LSDOMAINT_pPARTICLErecord;
    VERB_rec1:LSDOMAINT_pVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
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

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>partrel then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
match:=true;
PARTrec1tree:=s;
if s^.ls^.cat=PART then
PARTrec1:=s^.ls^.PARTfield^
else match:=false;
skip
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
begin{reltreeproc2}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=SUBVERB then
SUBVERBrec2:=s^.ls^.SUBVERBfield^
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
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=VERB then
VERBrec2:=s^.ls^.VERBfield^
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
s:=PARTrec1tree;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
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
var
rs1,rs2:LSSTREE_pRelNode;
procedure createreltree1(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createinputmodel0(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel0}
s:=BVERBrec1tree;
s^.sons:=nil;
s^.li^.n:=0
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
begin{createinputmodel0}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=           1
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
begin{createinputmodel2}
s:=MAKET_Stree(VERB);
  VERB_rec1:=s^.ls^.VERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=           1
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
    IF (PARTrec1.key = VERBrec2.particle) then
        if (VERBrec2.status = partV) then
          if (SUBVERBrec2.lastaffix = partaffix) then
            if (VERBrec2.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        VERB_rec1^ :=  VERBrec2;
        VERB_rec1^.status :=  bareV
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
decParticleToVerb:=result
end;
{:ParticleToVerb}


{rule:}
{:VerbBtoSub}
FUNCTION decVerbBtoSub(Is:LISTREE_pStree)
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
decVerbBtoSub:=result
end;
{:VerbBtoSub}


{rule:}
{:VerbOttEnk1}
FUNCTION decVerbOttEnk1(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) then
        if (VERBrec1.tense = presenttense) then
          if (VERBrec1.modus = indicative) then
            if (VERBrec1.number = singular) then
              if ([1,0] * VERBrec1.persons <> []) then
                if (VERBrec1.eORenForm = NoForm) THEN
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
decVerbOttEnk1:=result
end;
{:VerbOttEnk1}


{rule:}
{:VerbOttEnk1extra}
FUNCTION decVerbOttEnk1extra(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [14] <> []) then
        if (VERBrec1.tense = presenttense) then
          if (VERBrec1.modus = indicative) then
            if (VERBrec1.number = singular) then
              if ([0,1] * VERBrec1.persons <> []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKdelD
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
decVerbOttEnk1extra:=result
end;
{:VerbOttEnk1extra}


{rule:}
{:VerbOttEnk2}
FUNCTION decVerbOttEnk2(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) then
        if (VERBrec1.tense = presenttense) then
          if (VERBrec1.modus = indicative) then
            if (VERBrec1.number = singular) then
              if ([2,3,4,5] * VERBrec1.persons <> []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKt
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
decVerbOttEnk2:=result
end;
{:VerbOttEnk2}


{rule:}
{:VerbOttMv}
FUNCTION decVerbOttMv(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) then
        if (VERBrec1.tense = presenttense) then
          if (VERBrec1.modus = indicative) then
            if (VERBrec1.number = plural) then
              if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      IF [1,2,3] * VERBrec1.persons <> [] THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKen
          end
        END;
      IF [4,5] * VERBrec1.persons <> [] THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKt
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
decVerbOttMv:=result
end;
{:VerbOttMv}


{rule:}
{:VerbOvtEnk}
FUNCTION decVerbOvtEnk(Is:LISTREE_pStree)
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
    IF (VERBrec1.tense = pasttense) then
        if (VERBrec1.modus = indicative) then
          if (VERBrec1.number = singular) then
            if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      IF ([1,2,3,4,5] * VERBrec1.persons <> []) then
          if (VERBrec1.conjclasses * [3,4] <> []) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKdete
          end
        END;
      IF ([1,2,3,4] * VERBrec1.persons <> []) then
          if (VERBrec1.conjclasses * [5,6] <> []) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKovt1
          end
        END;
      IF ([1,2,3,4] * VERBrec1.persons <> []) then
          if (VERBrec1.conjclasses * [7,8] <> []) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKovtvd1
          end
        END;
      IF ([1,2,3,4] * VERBrec1.persons <> []) then
          if (VERBrec1.conjclasses * [9,10] <> []) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKovtvd2
          end
        END;
      IF ([1,2,3,4] * VERBrec1.persons <> []) then
          if (VERBrec1.conjclasses * [11,12] <> []) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKovt2
          end
        END;
      IF ([1,2,3,4] * VERBrec1.persons <> []) then
          if (13 in VERBrec1.conjclasses) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKovt3
          end
        END;
      IF ([1,2,3,4,5] * VERBrec1.persons <> []) then
          if (VERBrec1.conjclasses * [15,16] <> []) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKdete
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
decVerbOvtEnk:=result
end;
{:VerbOvtEnk}


{rule:}
{:VerbOvtEnkPers5extra}
FUNCTION decVerbOvtEnkPers5extra(Is:LISTREE_pStree)
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
   Is3:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   VERBrec1:LSDOMAINT_VERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    SFCAT_rec2:LSDOMAINT_pxxkeyrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree;var s3:LSSTREE_pStree);
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
procedure createinputmodel3(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel3}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec2:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2);
createinputmodel3(s3)
end;

begin{main body}
s1:=nil;
s2:=nil;
s3:=nil;
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
    IF (VERBrec1.tense = pasttense) then
        if (VERBrec1.modus = indicative) then
          if (VERBrec1.number = singular) then
            if (5 in VERBrec1.persons) then
              if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      IF VERBrec1.conjclasses * [5,6] <> [] THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKovt1
          end
        END;
      IF VERBrec1.conjclasses * [7,8] <> [] THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKovtvd1
          end
        END;
      IF VERBrec1.conjclasses * [9,10] <> [] THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKovtvd2
          end
        END;
      IF VERBrec1.conjclasses * [11,12] <> [] THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKovt2
          end
        END;
      IF 13 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKovt3
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        SFCAT_rec2^.key :=  SFKt
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
    Is3:=loopholes.retype(s3,LISTREE_pStree);
    LISTREE_addtotuple(Is3,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decVerbOvtEnkPers5extra:=result
end;
{:VerbOvtEnkPers5extra}


{rule:}
{:VerbOvtMv}
FUNCTION decVerbOvtMv(Is:LISTREE_pStree)
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
   Is3:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   VERBrec1:LSDOMAINT_VERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    SFCAT_rec2:LSDOMAINT_pxxkeyrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree;var s3:LSSTREE_pStree);
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
procedure createinputmodel3(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel3}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec2:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2);
createinputmodel3(s3)
end;

begin{main body}
s1:=nil;
s2:=nil;
s3:=nil;
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
    IF (VERBrec1.tense = pasttense) then
        if (VERBrec1.modus = indicative) then
          if (VERBrec1.number = plural) then
            if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      IF [1,2,3] * VERBrec1.persons <> [] THEN
        BEGIN
        IF VERBrec1.conjclasses * [3,4] <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKdete
            end
          END;
        IF VERBrec1.conjclasses * [5,6] <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKovt1
            end
          END;
        IF VERBrec1.conjclasses * [7,8] <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKovtvd1
            end
          END;
        IF VERBrec1.conjclasses * [9,10] <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKovtvd2
            end
          END;
        IF VERBrec1.conjclasses * [11,12] <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKovt2
            end
          END;
        IF 13 in VERBrec1.conjclasses THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKovt3
            end
          END;
        IF VERBrec1.conjclasses * [15,16] <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKdete
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          SFCAT_rec2^.key :=  SFKen
          end
        END;
      IF 5 in VERBrec1.persons THEN
        BEGIN
        IF VERBrec1.conjclasses * [5,6] <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKovt1
            end
          END;
        IF VERBrec1.conjclasses * [7,8] <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKovtvd1
            end
          END;
        IF VERBrec1.conjclasses * [9,10] <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKovtvd2
            end
          END;
        IF VERBrec1.conjclasses * [11,12] <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKovt2
            end
          END;
        IF 13 in VERBrec1.conjclasses THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKovt3
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          SFCAT_rec2^.key :=  SFKt
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
    Is3:=loopholes.retype(s3,LISTREE_pStree);
    LISTREE_addtotuple(Is3,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decVerbOvtMv:=result
end;
{:VerbOvtMv}


{rule:}
{:VerbOvtMvPers4en5extra}
FUNCTION decVerbOvtMvPers4en5extra(Is:LISTREE_pStree)
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
    IF (VERBrec1.tense = pasttense) then
        if (VERBrec1.modus = indicative) then
          if (VERBrec1.number = plural) then
            if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      IF ([4,5] * VERBrec1.persons <> []) then
          if (VERBrec1.conjclasses * [3,4] <> []) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKdete
          end
        END;
      IF (4 in VERBrec1.persons) then
          if (VERBrec1.conjclasses * [5,6] <> []) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKovt1
          end
        END;
      IF (4 in VERBrec1.persons) then
          if (VERBrec1.conjclasses * [7,8] <> []) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKovtvd1
          end
        END;
      IF (4 in VERBrec1.persons) then
          if (VERBrec1.conjclasses * [9,10] <> []) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKovtvd2
          end
        END;
      IF (4 in VERBrec1.persons) then
          if (VERBrec1.conjclasses * [11,12] <> []) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKovt2
          end
        END;
      IF (4 in VERBrec1.persons) then
          if (13 in VERBrec1.conjclasses) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKovt3
          end
        END;
      IF ([4,5] * VERBrec1.persons <> []) then
          if (VERBrec1.conjclasses * [15,16] <> []) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKdete
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
decVerbOvtMvPers4en5extra:=result
end;
{:VerbOvtMvPers4en5extra}


{rule:}
{:VerbVd1}
FUNCTION decVerbVd1(Is:LISTREE_pStree)
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
   Is3:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   VERBrec1:LSDOMAINT_VERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    PFCAT_rec1:LSDOMAINT_pxxkeyrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree;var s3:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=MAKET_Stree(PFCAT);
  PFCAT_rec1:=s^.ls^.PFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel2}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel3(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel3}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2);
createinputmodel3(s3)
end;

begin{main body}
s1:=nil;
s2:=nil;
s3:=nil;
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
    IF (VERBrec1.tense = omegatense) then
        if (VERBrec1.modus = pastpart) then
          if (VERBrec1.eORenForm = NoForm) then
            if (VERBrec1.persons = []) then
              if (VERBrec1.number = omeganumber) THEN
      BEGIN
      IF 3 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKdt
          end
        END;
      IF 5 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKen
          end
        END;
      IF 9 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKovtvd2
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        PFCAT_rec1^.key :=  PFKge
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
    Is3:=loopholes.retype(s3,LISTREE_pStree);
    LISTREE_addtotuple(Is3,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decVerbVd1:=result
end;
{:VerbVd1}


{rule:}
{:VerbVd2}
FUNCTION decVerbVd2(Is:LISTREE_pStree)
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
   Is3:LISTREE_pStree;
   Is4:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   s4:LSSTREE_pStree;
   VERBrec1:LSDOMAINT_VERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    PFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    SFCAT_rec2:LSDOMAINT_pxxkeyrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree;var s3:LSSTREE_pStree;var s4:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=MAKET_Stree(PFCAT);
  PFCAT_rec1:=s^.ls^.PFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel2}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel3(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel3}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel4(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel4}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec2:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2);
createinputmodel3(s3);
createinputmodel4(s4)
end;

begin{main body}
s1:=nil;
s2:=nil;
s3:=nil;
s4:=nil;
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
    IF (VERBrec1.tense = omegatense) then
        if (VERBrec1.modus = pastpart) then
          if (VERBrec1.eORenForm = NoForm) then
            if (VERBrec1.persons = []) then
              if (VERBrec1.number = omeganumber) THEN
      BEGIN
      IF 7 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3,s4);
          SFCAT_rec1^.key :=  SFKovtvd1
          end
        END;
      IF 11 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3,s4);
          SFCAT_rec1^.key :=  SFKvd1
          end
        END;
      IF 15 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3,s4);
          SFCAT_rec1^.key :=  SFKvd2
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        PFCAT_rec1^.key :=  PFKge;
        SFCAT_rec2^.key :=  SFKen
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
    Is3:=loopholes.retype(s3,LISTREE_pStree);
    LISTREE_addtotuple(Is3,tuple);
    Is4:=loopholes.retype(s4,LISTREE_pStree);
    LISTREE_addtotuple(Is4,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decVerbVd2:=result
end;
{:VerbVd2}


{rule:}
{:VerbVd3}
FUNCTION decVerbVd3(Is:LISTREE_pStree)
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
    IF (VERBrec1.tense = omegatense) then
        if (VERBrec1.modus = pastpart) then
          if (VERBrec1.number = omeganumber) then
            if (VERBrec1.persons = []) then
              if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      IF 4 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKdt
          end
        END;
      IF 6 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKen
          end
        END;
      IF 10 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKovtvd2
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
decVerbVd3:=result
end;
{:VerbVd3}


{rule:}
{:VerbVd4}
FUNCTION decVerbVd4(Is:LISTREE_pStree)
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
   Is3:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   VERBrec1:LSDOMAINT_VERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    SFCAT_rec2:LSDOMAINT_pxxkeyrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree;var s3:LSSTREE_pStree);
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
procedure createinputmodel3(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel3}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec2:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2);
createinputmodel3(s3)
end;

begin{main body}
s1:=nil;
s2:=nil;
s3:=nil;
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
    IF (VERBrec1.tense = omegatense) then
        if (VERBrec1.modus = pastpart) then
          if (VERBrec1.number = omeganumber) then
            if (VERBrec1.persons = []) then
              if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      IF 8 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKovtvd1
          end
        END;
      IF 12 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKvd1
          end
        END;
      IF 16 in VERBrec1.conjclasses THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKvd2
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        SFCAT_rec2^.key :=  SFKen
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
    Is3:=loopholes.retype(s3,LISTREE_pStree);
    LISTREE_addtotuple(Is3,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decVerbVd4:=result
end;
{:VerbVd4}


{rule:}
{:VerbInf}
FUNCTION decVerbInf(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [0,3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) then
        if (VERBrec1.tense = omegatense) then
          if (VERBrec1.modus = infinitive) then
            if (VERBrec1.number = omeganumber) then
              if (VERBrec1.persons = []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKen
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
decVerbInf:=result
end;
{:VerbInf}


{rule:}
{:VerbTd}
FUNCTION decVerbTd(Is:LISTREE_pStree)
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
   Is3:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   VERBrec1:LSDOMAINT_VERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    SFCAT_rec2:LSDOMAINT_pxxkeyrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree;var s3:LSSTREE_pStree);
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
procedure createinputmodel3(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel3}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec2:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2);
createinputmodel3(s3)
end;

begin{main body}
s1:=nil;
s2:=nil;
s3:=nil;
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
    IF (VERBrec1.conjclasses * [0,3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) then
        if (VERBrec1.tense = omegatense) then
          if (VERBrec1.modus = prespart) then
            if (VERBrec1.number = omeganumber) then
              if (VERBrec1.persons = []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2,s3);
        SFCAT_rec1^.key :=  SFKen;
        SFCAT_rec2^.key :=  SFKdt
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
    Is3:=loopholes.retype(s3,LISTREE_pStree);
    LISTREE_addtotuple(Is3,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decVerbTd:=result
end;
{:VerbTd}


{rule:}
{:VerbGbEnk}
FUNCTION decVerbGbEnk(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) then
        if (VERBrec1.tense = omegatense) then
          if (VERBrec1.modus = imperative) then
            if (VERBrec1.number = singular) then
              if (VERBrec1.persons = []) then
                if (VERBrec1.eORenForm = NoForm) THEN
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
decVerbGbEnk:=result
end;
{:VerbGbEnk}


{rule:}
{:VerbGbEnkExtra}
FUNCTION decVerbGbEnkExtra(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [14] <> []) then
        if (VERBrec1.tense = omegatense) then
          if (VERBrec1.modus = imperative) then
            if (VERBrec1.number = singular) then
              if (VERBrec1.persons = []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKdelD
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
decVerbGbEnkExtra:=result
end;
{:VerbGbEnkExtra}


{rule:}
{:VerbGbMv}
FUNCTION decVerbGbMv(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) then
        if (VERBrec1.tense = omegatense) then
          if (VERBrec1.modus = imperative) then
            if (VERBrec1.number = plural) then
              if (VERBrec1.persons = []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKt
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
decVerbGbMv:=result
end;
{:VerbGbMv}


{rule:}
{:VerbConjunctiefOtt}
FUNCTION decVerbConjunctiefOtt(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [3,4,5,6,7,8,9,10,11,12,13,15,16] <> []) then
        if (VERBrec1.tense = presenttense) then
          if (VERBrec1.modus = subjunctive) then
            if (VERBrec1.number = omeganumber) then
              if (VERBrec1.persons = []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKe
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
decVerbConjunctiefOtt:=result
end;
{:VerbConjunctiefOtt}


{rule:}
{:VerbZorOttExtra}
FUNCTION decVerbZorOttExtra(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [1,2] <> []) then
        if (VERBrec1.tense = presenttense) then
          if (VERBrec1.modus = indicative) then
            if (VERBrec1.number = singular) then
              if ([0,1] * VERBrec1.persons <> []) then
                if (VERBrec1.eORenForm = NoForm) THEN
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
decVerbZorOttExtra:=result
end;
{:VerbZorOttExtra}


{rule:}
{:VerbZorOtt}
FUNCTION decVerbZorOtt(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [1,2] <> []) then
        if (VERBrec1.tense = presenttense) then
          if (VERBrec1.modus = indicative) then
            if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      IF VERBrec1.number = singular THEN
        BEGIN
        IF 0 in VERBrec1.persons THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrottenk0
            end
          END;
        IF 2 in VERBrec1.persons THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrottenk2
            end
          END;
        IF 3 in VERBrec1.persons THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrottenk3
            end
          END;
        IF 4 in VERBrec1.persons THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrott4
            end
          END;
        IF 5 in VERBrec1.persons THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrott5
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF VERBrec1.number = plural THEN
        BEGIN
        IF [1,2,3] * VERBrec1.persons <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrottmv
            end
          END;
        IF 4 in VERBrec1.persons THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrott4
            end
          END;
        IF 5 in VERBrec1.persons THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrott5
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
decVerbZorOtt:=result
end;
{:VerbZorOtt}


{rule:}
{:VerbZorOvt}
FUNCTION decVerbZorOvt(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [1,2] <> []) then
        if (VERBrec1.tense = pasttense) then
          if (VERBrec1.modus = indicative) then
            if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      IF VERBrec1.number = singular THEN
        BEGIN
        IF [1,2,3,4] * VERBrec1.persons <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrovtenk
            end
          END;
        IF 5 in VERBrec1.persons THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrovt5
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF VERBrec1.number = plural THEN
        BEGIN
        IF [1,2,3] * VERBrec1.persons <> [] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrovtmv
            end
          END;
        IF 4 in VERBrec1.persons THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrovtenk
            end
          END;
        IF 5 in VERBrec1.persons THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKIrrovt5
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
decVerbZorOvt:=result
end;
{:VerbZorOvt}


{rule:}
{:VerbZorVd1}
FUNCTION decVerbZorVd1(Is:LISTREE_pStree)
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
   Is3:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   VERBrec1:LSDOMAINT_VERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    PFCAT_rec1:LSDOMAINT_pxxkeyrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree;var s3:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=MAKET_Stree(PFCAT);
  PFCAT_rec1:=s^.ls^.PFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
procedure createinputmodel2(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel2}
s:=MAKET_Stree(SUBVERB);
s^.ls^.SUBVERBfield^:=SUBVERBrec1;
  SUBVERB_rec1:=s^.ls^.SUBVERBfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
procedure createinputmodel3(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel3}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec1:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2);
createinputmodel3(s3)
end;

begin{main body}
s1:=nil;
s2:=nil;
s3:=nil;
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
    IF (VERBrec1.conjclasses * [1] <> []) then
        if (VERBrec1.tense = omegatense) then
          if (VERBrec1.modus = pastpart) then
            if (VERBrec1.number = omeganumber) then
              if (VERBrec1.persons = []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2,s3);
        PFCAT_rec1^.key :=  PFKge;
        SFCAT_rec1^.key :=  SFKIrrvd
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
    Is3:=loopholes.retype(s3,LISTREE_pStree);
    LISTREE_addtotuple(Is3,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decVerbZorVd1:=result
end;
{:VerbZorVd1}


{rule:}
{:VerbZorVd2}
FUNCTION decVerbZorVd2(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [2] <> []) then
        if (VERBrec1.tense = omegatense) then
          if (VERBrec1.modus = pastpart) then
            if (VERBrec1.number = omeganumber) then
              if (VERBrec1.persons = []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKIrrvd
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
decVerbZorVd2:=result
end;
{:VerbZorVd2}


{rule:}
{:VerbZorInf}
FUNCTION decVerbZorInf(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [1,2] <> []) then
        if (VERBrec1.tense = omegatense) then
          if (VERBrec1.modus = infinitive) then
            if (VERBrec1.number = omeganumber) then
              if (VERBrec1.persons = []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKIrrottmv
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
decVerbZorInf:=result
end;
{:VerbZorInf}


{rule:}
{:VerbZorTd}
FUNCTION decVerbZorTd(Is:LISTREE_pStree)
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
   Is3:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   VERBrec1:LSDOMAINT_VERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    SFCAT_rec2:LSDOMAINT_pxxkeyrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree;var s3:LSSTREE_pStree);
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
procedure createinputmodel3(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel3}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec2:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2);
createinputmodel3(s3)
end;

begin{main body}
s1:=nil;
s2:=nil;
s3:=nil;
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
    IF (VERBrec1.conjclasses * [1,2] <> []) then
        if (VERBrec1.tense = omegatense) then
          if (VERBrec1.modus = prespart) then
            if (VERBrec1.number = omeganumber) then
              if (VERBrec1.persons = []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2,s3);
        SFCAT_rec1^.key :=  SFKIrrottmv;
        SFCAT_rec2^.key :=  SFKdt
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
    Is3:=loopholes.retype(s3,LISTREE_pStree);
    LISTREE_addtotuple(Is3,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decVerbZorTd:=result
end;
{:VerbZorTd}


{rule:}
{:VerbZorGbEnk}
FUNCTION decVerbZorGbEnk(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [1,2] <> []) then
        if (VERBrec1.tense = omegatense) then
          if (VERBrec1.modus = imperative) then
            if (VERBrec1.number = singular) then
              if (VERBrec1.persons = []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKIrrgb
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
decVerbZorGbEnk:=result
end;
{:VerbZorGbEnk}


{rule:}
{:VerbZorGbMv}
FUNCTION decVerbZorGbMv(Is:LISTREE_pStree)
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
   Is3:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   VERBrec1:LSDOMAINT_VERBrecord;
   SUBVERBrec1:LSDOMAINT_SUBVERBrecord;
    SUBVERB_rec1:LSDOMAINT_pSUBVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    SFCAT_rec2:LSDOMAINT_pxxkeyrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree;var s3:LSSTREE_pStree);
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
procedure createinputmodel3(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel3}
s:=MAKET_Stree(SFCAT);
  SFCAT_rec2:=s^.ls^.SFCATfield;
s^.sons:=nil;
s^.li^.n:=0
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2);
createinputmodel3(s3)
end;

begin{main body}
s1:=nil;
s2:=nil;
s3:=nil;
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
    IF (VERBrec1.conjclasses * [1,2] <> []) then
        if (VERBrec1.tense = omegatense) then
          if (VERBrec1.modus = imperative) then
            if (VERBrec1.number = plural) then
              if (VERBrec1.persons = []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2,s3);
        SFCAT_rec1^.key :=  SFKIrrgb;
        SFCAT_rec2^.key :=  SFKt
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
    Is3:=loopholes.retype(s3,LISTREE_pStree);
    LISTREE_addtotuple(Is3,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decVerbZorGbMv:=result
end;
{:VerbZorGbMv}


{rule:}
{:VerbZorConjunctief}
FUNCTION decVerbZorConjunctief(Is:LISTREE_pStree)
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
    IF (VERBrec1.conjclasses * [1,2] <> []) then
        if (VERBrec1.modus = subjunctive) then
          if (VERBrec1.number = omeganumber) then
            if (VERBrec1.persons = []) then
              if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      IF VERBrec1.tense = presenttense THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKIrrconjott
          end
        END;
      IF VERBrec1.tense = pasttense THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKIrrconjovt
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
decVerbZorConjunctief:=result
end;
{:VerbZorConjunctief}


{rule:}
{:VerbeORenvorm}
FUNCTION decVerbeORenvorm(Is:LISTREE_pStree)
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
    VERB_rec1:LSDOMAINT_pVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=VERB then
VERBrec1:=s^.ls^.VERBfield^
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
s:=MAKET_Stree(VERB);
s^.ls^.VERBfield^:=VERBrec1;
  VERB_rec1:=s^.ls^.VERBfield;
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
    IF (VERBrec1.modus = pastpart)
        or(VERBrec1.modus = prespart) THEN
      BEGIN
      IF VERBrec1.eORenForm = eForm THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKe
          end
        END;
      IF VERBrec1.eORenForm = enForm THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKen
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        VERB_rec1^.eORenForm :=  NoForm
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
decVerbeORenvorm:=result
end;
{:VerbeORenvorm}


{rule:}
{:NOUNcomp1}
FUNCTION decNOUNcomp1(Is:LISTREE_pStree)
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
   Is3:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   SUBNOUNrec2:LSDOMAINT_SUBNOUNrecord;
   NOUNrec1:LSDOMAINT_NOUNrecord;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
    NOUN_rec1:LSDOMAINT_pNOUNrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>modrel then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=NOUN then
NOUNrec1:=s^.ls^.NOUNfield^
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
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
else match:=false;
rs:=s^.sons;
mu2:=rs
end;
begin{reltreeproc2}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec2:=s^.ls^.SUBNOUNfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree;var s3:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(NOUN);
s^.ls^.NOUNfield^:=NOUNrec1;
  NOUN_rec1:=s^.ls^.NOUNfield;
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
procedure createinputmodel3(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu2
end;
begin{createinputmodel3}
s:=MAKET_Stree(SUBNOUN);
s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2);
createinputmodel3(s3)
end;

begin{main body}
s1:=nil;
s2:=nil;
s3:=nil;
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
    IF (SUBNOUNrec1.lastaffix = noaffix) then
        if (NOUNrec1.geni=false) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2,s3);
        SFCAT_rec1^.key :=  SFKstreepCompound {! see note above}
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
    Is3:=loopholes.retype(s3,LISTREE_pStree);
    LISTREE_addtotuple(Is3,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decNOUNcomp1:=result
end;
{:NOUNcomp1}


{rule:}
{:VerbNOUNcomp}
FUNCTION decVerbNOUNcomp(Is:LISTREE_pStree)
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
   Is3:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   s3:LSSTREE_pStree;
   SUBNOUNrec2:LSDOMAINT_SUBNOUNrecord;
   VERBrec1:LSDOMAINT_VERBrecord;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
    VERB_rec1:LSDOMAINT_pVERBrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;

procedure reltreeproc1(var rs:LSSTREE_pRelNode;var match:BOOLEAN);
procedure relnametest(rs:LSSTREE_pRelNode;var match:BOOLEAN);
begin{relnametest}
if rs^.relation<>modrel then
  match:=false
end;
procedure modelproc(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin{modelproc}
if s^.ls^.cat=VERB then
VERBrec1:=s^.ls^.VERBfield^
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
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
else match:=false;
rs:=s^.sons;
mu2:=rs
end;
begin{reltreeproc2}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec2:=s^.ls^.SUBNOUNfield^
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree;var s3:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu1
end;
begin{createinputmodel1}
s:=MAKET_Stree(VERB);
s^.ls^.VERBfield^:=VERBrec1;
  VERB_rec1:=s^.ls^.VERBfield;
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
procedure createinputmodel3(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
procedure createreltreelist(var rs:LSSTREE_pRelNode);
begin{createreltreelist}
rs:=mu2
end;
begin{createinputmodel3}
s:=MAKET_Stree(SUBNOUN);
s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
createreltreelist(rs);
s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createinputmodels}
createinputmodel1(s1);
createinputmodel2(s2);
createinputmodel3(s3)
end;

begin{main body}
s1:=nil;
s2:=nil;
s3:=nil;
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
    IF (SUBNOUNrec1.lastaffix = noaffix) then
        if (VERBrec1.tense = presenttense) then
          if (VERBrec1.modus = indicative) then
            if (VERBrec1.number = singular) then
              if ([0,1] * VERBrec1.persons <> []) then
                if (VERBrec1.eORenForm = NoForm) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2,s3);
        SFCAT_rec1^.key :=  SFKstreepCompound
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
    Is3:=loopholes.retype(s3,LISTREE_pStree);
    LISTREE_addtotuple(Is3,tuple);
    LISTREE_appendtupleofstrees(tuple,result)
    end
  END;
decVerbNOUNcomp:=result
end;
{:VerbNOUNcomp}

