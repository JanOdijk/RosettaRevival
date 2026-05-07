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
{:LPersproNom}
FUNCTION decLPersproNom(Is:LISTREE_pStree)
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
    IF PERSPROrec1.persprocase = nominative THEN
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
decLPersproNom:=result
end;
{:LPersproNom}


{rule:}
{:LPersproAcc}
FUNCTION decLPersproAcc(Is:LISTREE_pStree)
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
    IF PERSPROrec1.persprocase = accusative THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKacc
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
decLPersproAcc:=result
end;
{:LPersproAcc}


{rule:}
{:LPossadj}
FUNCTION decLPossadj(Is:LISTREE_pStree)
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
    IF POSSADJrec1.mood = nowh THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKposs
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
decLPossadj:=result
end;
{:LPossadj}


{rule:}
{:LPosspro}
FUNCTION decLPosspro(Is:LISTREE_pStree)
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
    IF BPERSPROrec1.predpos = true THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKpredposs
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
decLPosspro:=result
end;
{:LPosspro}


{rule:}
{:LWhpro}
FUNCTION decLWhpro(Is:LISTREE_pStree)
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
      IF BWHPROrec1.whcase = true then
          if WHPROrec1.cases <> [accusative] THEN
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
      IF BWHPROrec1.whcase = false then
          if WHPROrec1.cases = [] THEN
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
decLWhpro:=result
end;
{:LWhpro}


{rule:}
{:LWhproAcc}
FUNCTION decLWhproAcc(Is:LISTREE_pStree)
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
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   WHPROrec1:LSDOMAINT_WHPROrecord;
   BWHPROrec1:LSDOMAINT_BWHPROrecord;
    BWHPRO_rec1:LSDOMAINT_pBWHPROrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BWHPROrec1tree;
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
    IF accusative in WHPROrec1.cases then
        if BWHPROrec1.whcase = true THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKacc
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
decLWhproAcc:=result
end;
{:LWhproAcc}


{rule:}
{:LWhpossadj}
FUNCTION decLWhpossadj(Is:LISTREE_pStree)
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
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   POSSADJrec1:LSDOMAINT_POSSADJrecord;
   BWHPROrec1:LSDOMAINT_BWHPROrecord;
    BWHPRO_rec1:LSDOMAINT_pBWHPROrecord;
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
s:=BWHPROrec1tree;
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
    IF POSSADJrec1.mood = wh then
        if BWHPROrec1.poss = true THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKposs
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
decLWhpossadj:=result
end;
{:LWhpossadj}


{rule:}
{:LDet}
FUNCTION decLDet(Is:LISTREE_pStree)
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
decLDet:=result
end;
{:LDet}


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
        if (CARDrec1.possnumbers = [singular]) THEN
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
        if (CARDrec1.possnumbers = [plural]) THEN
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
if rs^.relation<>postmodrel then
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
    IF (DIGITrec1.key = intkey ( 's_1DIGITkey' )) then
        if (DIGITrec1.valeu = 1) then
          if (CARDrec2.possnumbers = [plural]) THEN
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
    IF (DIGITrec1.key = intkey ( 's_2DIGITkey' )) then
        if (DIGITrec1.valeu = 2) then
          if (CARDrec2.possnumbers = [plural]) THEN
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
    IF (DIGITrec1.key = intkey ( 's_3DIGITkey' )) then
        if (DIGITrec1.valeu = 3) then
          if (CARDrec2.possnumbers = [plural]) THEN
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
    IF (DIGITrec1.key = intkey ( 's_4DIGITkey' )) then
        if (DIGITrec1.valeu = 4) then
          if (CARDrec2.possnumbers = [plural]) THEN
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
    IF (DIGITrec1.key = intkey ( 's_5DIGITkey' )) then
        if (DIGITrec1.valeu = 5) then
          if (CARDrec2.possnumbers = [plural]) THEN
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
    IF (DIGITrec1.key = intkey ( 's_6DIGITkey' )) then
        if (DIGITrec1.valeu = 6) then
          if (CARDrec2.possnumbers = [plural]) THEN
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
    IF (DIGITrec1.key = intkey ( 's_7DIGITkey' )) then
        if (DIGITrec1.valeu = 7) then
          if (CARDrec2.possnumbers = [plural]) THEN
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
    IF (DIGITrec1.key = intkey ( 's_8DIGITkey' )) then
        if (DIGITrec1.valeu = 8) then
          if (CARDrec2.possnumbers = [plural]) THEN
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
    IF (DIGITrec1.key = intkey ( 's_9DIGITkey' )) then
        if (DIGITrec1.valeu = 9) then
          if (CARDrec2.possnumbers = [plural]) THEN
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
    IF (DIGITrec1.key = intkey('s_0DIGITkey')) then
        if (DIGITrec1.valeu = 0) then
          if (CARDrec2.possnumbers = [plural]) THEN
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
{:ORDINALrule1}
FUNCTION decORDINALrule1(Is:LISTREE_pStree)
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
if rs^.relation<>modrel then
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
    IF SUBADJrec1.affix = ordaffix THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKregord
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
decORDINALrule1:=result
end;
{:ORDINALrule1}

