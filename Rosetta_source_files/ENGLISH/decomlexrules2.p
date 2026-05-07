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
{:LBNoun}
FUNCTION decLBNoun(Is:LISTREE_pStree)
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
decLBNoun:=result
end;
{:LBNoun}


{rule:}
{:LNounBaseform}
FUNCTION decLNounBaseform(Is:LISTREE_pStree)
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
    IF true THEN
      BEGIN
      IF singular in NOUNrec1.numbers then
          if not( onlyplur in NOUNrec1.plurforms )  THEN
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
      IF plural in NOUNrec1.numbers then
          if onlyplur in NOUNrec1.plurforms THEN
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
      IF plural in NOUNrec1.numbers then
          if singandplur in NOUNrec1.plurforms THEN
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
decLNounBaseform:=result
end;
{:LNounBaseform}


{rule:}
{:LNounPlural}
FUNCTION decLNounPlural(Is:LISTREE_pStree)
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
    IF plural in NOUNrec1.numbers THEN
      BEGIN
      IF regplur in NOUNrec1.plurforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKregS
          end
        END;
      IF regEplur in NOUNrec1.plurforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKregEs
          end
        END;
      IF irrSplur in NOUNrec1.plurforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKirrS
          end
        END;
      IF irrplur in NOUNrec1.plurforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKirrplur
          end
        END;
      IF latplur in NOUNrec1.plurforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKlatplur
          end
        END;
      IF voicingplur in NOUNrec1.plurforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKvoicingS
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
decLNounPlural:=result
end;
{:LNounPlural}


{rule:}
{:LPropernounBaseform}
FUNCTION decLPropernounBaseform(Is:LISTREE_pStree)
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
    IF singular in PROPERNOUNrec1.numbers THEN
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
decLPropernounBaseform:=result
end;
{:LPropernounBaseform}


{rule:}
{:LBPropernounToSubnoun}
FUNCTION decLBPropernounToSubnoun(Is:LISTREE_pStree)
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
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
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
decLBPropernounToSubnoun:=result
end;
{:LBPropernounToSubnoun}


{rule:}
{:LBadj}
FUNCTION decLBadj(Is:LISTREE_pStree)
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
decLBadj:=result
end;
{:LBadj}


{rule:}
{:LAdjToAdvDeriv}
FUNCTION decLAdjToAdvDeriv(Is:LISTREE_pStree)
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
STRTOKEY_getSkey('LYBADVSUFFKEY',hulpint);
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
    IF SUBADVrec1.affix = lyaffix then
        if SUBADVrec1.req = SUBADJrec1.req then
          if SUBADVrec1.env = SUBADJrec1.env then
            if SUBADVrec1.subcs = BADVSUFFrec1.subcs then
              if SUBADVrec1.class = SUBADJrec1.class then
                if SUBADVrec1.deixis = SUBADJrec1.deixis then
                  if SUBADVrec1.aspect = SUBADJrec1.aspect then
                    if SUBADVrec1.retro = SUBADJrec1.retro then
                      if SUBADVrec1.mood = BADVSUFFrec1.mood then
                        if SUBADVrec1.thetaadv = BADVSUFFrec1.thetaadv then
                          if SUBADVrec1.advpatterns= BADVSUFFrec1.advpatterns then
                            if SUBADVrec1.prepkey = BADVSUFFrec1.prepkey then
                              if SUBADVrec1.position = BADVSUFFrec1.position then
                                if SUBADVrec1.possnietnp = BADVSUFFrec1.possnietnp then
                                  if SUBADVrec1.thanas = BADVSUFFrec1.thanas then
                                    if SUBADVrec1.temporal = BADVSUFFrec1.temporal then
                                      if SUBADJrec1.advformation <> noAdv THEN
      BEGIN
      IF irradvComp in SUBADJrec1.compformations then
          if SUBADVrec1.compformations = [irrComp] THEN
        BEGIN
        IF SUBADJrec1.advformation = regAdv THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKregly
            end
          END;
        IF SUBADJrec1.advformation = irregAdv THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKirregly
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF SUBADJrec1.compformations <> [noComp] then
          if not( irradvComp in SUBADJrec1.compformations )  THEN
        BEGIN
        IF SUBADJrec1.advformation = regAdv then
            if SUBADVrec1.compformations = [moreComp] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKregly
            end
          END;
        IF SUBADJrec1.advformation = irregAdv then
            if SUBADVrec1.compformations = [moreComp] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKirregly
            end
          END;
        IF SUBADJrec1.advformation = zeroAdv then
            if SUBADVrec1.compformations = SUBADJrec1.compformations THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKnoly
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF SUBADJrec1.compformations = [noComp] then
          if SUBADVrec1.compformations = [noComp] THEN
        BEGIN
        IF SUBADJrec1.advformation = regAdv THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKregly
            end
          END;
        IF SUBADJrec1.advformation = irregAdv THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKirregly
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
decLAdjToAdvDeriv:=result
end;
{:LAdjToAdvDeriv}


{rule:}
{:LAdjBaseform}
FUNCTION decLAdjBaseform(Is:LISTREE_pStree)
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
    IF ADJrec1.compform = basic THEN
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
decLAdjBaseform:=result
end;
{:LAdjBaseform}


{rule:}
{:LAdjComp}
FUNCTION decLAdjComp(Is:LISTREE_pStree)
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
    IF ADJrec1.compform = compar THEN
      BEGIN
      IF regcomp in ADJrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKregcomp
          end
        END;
      IF cdcomp in ADJREC1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKcdcomp
          end
        END;
      IF irrcomp in ADJrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKirrcomp
          end
        END;
      IF irrcomp2 in ADJrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKirrcomp2
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
decLAdjComp:=result
end;
{:LAdjComp}


{rule:}
{:LAdjSuper}
FUNCTION decLAdjSuper(Is:LISTREE_pStree)
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
    IF ADJrec1.compform = super THEN
      BEGIN
      IF regcomp in ADJrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKregsuper
          end
        END;
      IF cdcomp in ADJrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKcdsuper
          end
        END;
      IF irrcomp in ADJrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKirrsuper
          end
        END;
      IF irrcomp2 in ADJrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKirrsuper2
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
decLAdjSuper:=result
end;
{:LAdjSuper}


{rule:}
{:LBadV}
FUNCTION decLBadV(Is:LISTREE_pStree)
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
decLBadV:=result
end;
{:LBadV}


{rule:}
{:LAdvBaseform}
FUNCTION decLAdvBaseform(Is:LISTREE_pStree)
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
    IF ADVrec1.compform = basic THEN
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
decLAdvBaseform:=result
end;
{:LAdvBaseform}


{rule:}
{:LAdvComp}
FUNCTION decLAdvComp(Is:LISTREE_pStree)
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
   ADVrec1:LSDOMAINT_ADVrecord;
   SUBADVrec1:LSDOMAINT_SUBADVrecord;
    SUBADV_rec1:LSDOMAINT_pSUBADVrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
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
    IF ADVrec1.compform =compar THEN
      BEGIN
      IF regcomp in ADVrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKregcomp
          end
        END;
      IF cdcomp in ADVREC1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKcdcomp
          end
        END;
      IF irrcomp in ADVrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKirrcomp
          end
        END;
      IF irrcomp2 in ADVrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKirrcomp2
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
decLAdvComp:=result
end;
{:LAdvComp}


{rule:}
{:LAdvSuper}
FUNCTION decLAdvSuper(Is:LISTREE_pStree)
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
   ADVrec1:LSDOMAINT_ADVrecord;
   SUBADVrec1:LSDOMAINT_SUBADVrecord;
    SUBADV_rec1:LSDOMAINT_pSUBADVrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
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
    IF ADVrec1.compform = super THEN
      BEGIN
      IF regcomp in ADVrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKregsuper
          end
        END;
      IF cdcomp in ADVrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKcdsuper
          end
        END;
      IF irrcomp in ADVrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKirrsuper
          end
        END;
      IF irrcomp2 in ADVrec1.compformations THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKirrsuper2
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
decLAdvSuper:=result
end;
{:LAdvSuper}

