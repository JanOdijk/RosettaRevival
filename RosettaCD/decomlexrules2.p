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
{:bpropernountopropernoun}
FUNCTION decbpropernountopropernoun(Is:LISTREE_pStree)
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
    IF PROPERNOUNrec1.geni = false THEN
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
decbpropernountopropernoun:=result
end;
{:bpropernountopropernoun}


{rule:}
{:bpropertopropergenitief}
FUNCTION decbpropertopropergenitief(Is:LISTREE_pStree)
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
   Is2:LISTREE_pStree;
   s1:LSSTREE_pStree;
   s2:LSSTREE_pStree;
   PROPERNOUNrec1:LSDOMAINT_PROPERNOUNrecord;
   BPROPERNOUNrec1:LSDOMAINT_BPROPERNOUNrecord;
    BPROPERNOUN_rec1:LSDOMAINT_pBPROPERNOUNrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree);
procedure createinputmodel1(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createinputmodel1}
s:=BPROPERNOUNrec1tree;
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
    IF (PROPERNOUNrec1.number = singular) then
        if (PROPERNOUNrec1.possgeni = true) then
          if (PROPERNOUNrec1.geni = true) then
            if (not( OnlyPlural in PROPERNOUNrec1.pluralforms ) ) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKgens
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
decbpropertopropergenitief:=result
end;
{:bpropertopropergenitief}


{rule:}
{:PropernounWithDimForm}
FUNCTION decPropernounWithDimForm(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BPROPERNOUNrec1tree:LSSTREE_pstree;
BNOUNSUFFrec1tree:LSSTREE_pstree;
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
   PROPERNOUNrec1:LSDOMAINT_PROPERNOUNrecord;
   BPROPERNOUNrec1:LSDOMAINT_BPROPERNOUNrecord;
   BNOUNSUFFrec1:LSDOMAINT_BNOUNrecord;
    BPROPERNOUN_rec1:LSDOMAINT_pBPROPERNOUNrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    BNOUNSUFF_rec1:LSDOMAINT_pBNOUNrecord;
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
STRTOKEY_getSkey('DIMBNOUNSUFFKEY',hulpint);
match:=(s^.ls^.BNOUNSUFFfield^.key
 = hulpint);
BNOUNSUFFrec1tree:=s;
if s^.ls^.cat=BNOUNSUFF then
BNOUNSUFFrec1:=s^.ls^.BNOUNSUFFfield^
else match:=false;
skip
end;
begin{reltreeproc2}
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
begin{createinputmodel1}
s:=BPROPERNOUNrec1tree;
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
    IF (PROPERNOUNrec1.geni = false) then
        if (PROPERNOUNrec1.number = singular) then
          if (PROPERNOUNrec1.genders = BNOUNSUFFrec1.genders) then
            if (PROPERNOUNrec1.dimforms = BNOUNSUFFrec1.dimforms) then
              if (PROPERNOUNrec1.pluralforms = BNOUNSUFFrec1.pluralforms) THEN
      BEGIN
      IF (not( noDim in BPROPERNOUNrec1.dimforms ) ) THEN
        BEGIN
        IF jeDim in BPROPERNOUNrec1.dimforms THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKje
            end
          END;
        IF etjeDim in BPROPERNOUNrec1.dimforms THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKetje
            end
          END;
        IF irregdim in BPROPERNOUNrec1.dimforms THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKonregdim
            end
          END;
        IF dimletterword in BPROPERNOUNrec1.dimforms THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKdimletterword
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
decPropernounWithDimForm:=result
end;
{:PropernounWithDimForm}


{rule:}
{:PropernounWithGeniDimForm}
FUNCTION decPropernounWithGeniDimForm(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BPROPERNOUNrec1tree:LSSTREE_pstree;
BNOUNSUFFrec1tree:LSSTREE_pstree;
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
   PROPERNOUNrec1:LSDOMAINT_PROPERNOUNrecord;
   BPROPERNOUNrec1:LSDOMAINT_BPROPERNOUNrecord;
   BNOUNSUFFrec1:LSDOMAINT_BNOUNrecord;
    BPROPERNOUN_rec1:LSDOMAINT_pBPROPERNOUNrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    SFCAT_rec2:LSDOMAINT_pxxkeyrecord;
    BNOUNSUFF_rec1:LSDOMAINT_pBNOUNrecord;
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
STRTOKEY_getSkey('DIMBNOUNSUFFKEY',hulpint);
match:=(s^.ls^.BNOUNSUFFfield^.key
 = hulpint);
BNOUNSUFFrec1tree:=s;
if s^.ls^.cat=BNOUNSUFF then
BNOUNSUFFrec1:=s^.ls^.BNOUNSUFFfield^
else match:=false;
skip
end;
begin{reltreeproc2}
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
begin{createinputmodel1}
s:=BPROPERNOUNrec1tree;
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
    IF (PROPERNOUNrec1.possgeni = true) then
        if (PROPERNOUNrec1.geni = true) then
          if (PROPERNOUNrec1.number = singular) THEN
      BEGIN
      IF (not( noDim in BPROPERNOUNrec1.dimforms ) ) THEN
        BEGIN
        IF jeDim in BPROPERNOUNrec1.dimforms THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKje
            end
          END;
        IF etjeDim in BPROPERNOUNrec1.dimforms THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKetje
            end
          END;
        IF irregdim in BPROPERNOUNrec1.dimforms THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKonregdim
            end
          END;
        IF dimletterword in BPROPERNOUNrec1.dimforms THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2,s3);
            SFCAT_rec1^.key :=  SFKdimletterword
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
        SFCAT_rec2^.key :=  SFKgens
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
decPropernounWithGeniDimForm:=result
end;
{:PropernounWithGeniDimForm}


{rule:}
{:bpropernountosubnoun}
FUNCTION decbpropernountosubnoun(Is:LISTREE_pStree)
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
    IF (SUBNOUNrec1.dimforms = BPROPERNOUNrec1.dimforms) then
        if (SUBNOUNrec1.pluralforms = BPROPERNOUNrec1.pluralforms) then
          if (SUBNOUNrec1.genders = BPROPERNOUNrec1.genders) then
            if (SUBNOUNrec1.class = BPROPERNOUNrec1.class) then
              if (SUBNOUNrec1.deixis = BPROPERNOUNrec1.deixis) then
                if (SUBNOUNrec1.aspect = BPROPERNOUNrec1.aspect) then
                  if (SUBNOUNrec1.retro = BPROPERNOUNrec1.retro) then
                    if (SUBNOUNrec1.sexes = BPROPERNOUNrec1.sexes) then
                      if (SUBNOUNrec1.temporal = BPROPERNOUNrec1.temporal) then
                        if (SUBNOUNrec1.possgeni = false) then
                          if (SUBNOUNrec1.animate = BPROPERNOUNrec1.animate) then
                            if (SUBNOUNrec1.human = BPROPERNOUNrec1.human) then
                              if (SUBNOUNrec1.lastaffix = noaffix) then
                                if (BPROPERNOUNrec1.subc IN SUBNOUNrec1.subcs) THEN
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
decbpropernountosubnoun:=result
end;
{:bpropernountosubnoun}


{rule:}
{:bnountosub}
FUNCTION decbnountosub(Is:LISTREE_pStree)
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
decbnountosub:=result
end;
{:bnountosub}


{rule:}
{:DimForm}
FUNCTION decDimForm(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BNOUNSUFFrec1tree:LSSTREE_pstree;
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
   SUBNOUNrec2:LSDOMAINT_SUBNOUNrecord;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
   BNOUNSUFFrec1:LSDOMAINT_BNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
    SFCAT_rec1:LSDOMAINT_pxxkeyrecord;
    BNOUNSUFF_rec1:LSDOMAINT_pBNOUNrecord;
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
STRTOKEY_getSkey('DIMBNOUNSUFFKEY',hulpint);
match:=(s^.ls^.BNOUNSUFFfield^.key
 = hulpint);
BNOUNSUFFrec1tree:=s;
if s^.ls^.cat=BNOUNSUFF then
BNOUNSUFFrec1:=s^.ls^.BNOUNSUFFfield^
else match:=false;
skip
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
    IF (SUBNOUNrec2.pluralforms = BNOUNSUFFrec1.pluralforms) then
        if (SUBNOUNrec2.genders = BNOUNSUFFrec1.genders) then
          if (SUBNOUNrec2.dimforms = BNOUNSUFFrec1.dimforms) THEN
      BEGIN
      IF (SUBNOUNrec2.lastaffix = dimaffix) then
          if (not( noDim in SUBNOUNrec1.dimforms ) ) then
            if (not( SUBNOUNrec1.lastaffix = dimaffix ) ) THEN
        BEGIN
        IF jeDim in SUBNOUNrec1.dimforms THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKje
            end
          END;
        IF etjeDim in SUBNOUNrec1.dimforms THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKetje
            end
          END;
        IF irregdim in SUBNOUNrec1.dimforms THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKonregdim
            end
          END;
        IF dimletterword in SUBNOUNrec1.dimforms THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKdimletterword
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
decDimForm:=result
end;
{:DimForm}


{rule:}
{:nounenkelvoud}
FUNCTION decnounenkelvoud(Is:LISTREE_pStree)
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
    IF NOUNrec1.geni = false THEN
      BEGIN
      IF (NOUNrec1.number = singular) then
          if (not( OnlyPlural in NOUNrec1.pluralforms ) ) THEN
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
      IF (NOUNrec1.number = plural) then
          if (OnlyPlural in NOUNrec1.pluralforms) THEN
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
decnounenkelvoud:=result
end;
{:nounenkelvoud}


{rule:}
{:nounmeervoud}
FUNCTION decnounmeervoud(Is:LISTREE_pStree)
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
    IF (NOUNrec1.number = plural) then
        if (NOUNrec1.geni = false) then
          if (not( OnlyPlural in NOUNrec1.pluralforms ) ) THEN
      BEGIN
      IF enPlural in NOUNrec1.pluralforms THEN
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
      IF sPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKmvs
          end
        END;
      IF aTOaaPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKaTOaa
          end
        END;
      IF aTOeePlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKaTOee
          end
        END;
      IF eTOeePlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKeTOee
          end
        END;
      IF eiTOeePlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKeiTOee
          end
        END;
      IF iTOeePlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKiTOee
          end
        END;
      IF oTOooPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKoTOoo
          end
        END;
      IF erenPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKeren
          end
        END;
      IF ienPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKien
          end
        END;
      IF denPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKden
          end
        END;
      IF nenPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKnen
          end
        END;
      IF ieAccentPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKieAccent
          end
        END;
      IF luiPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKlui
          end
        END;
      IF liedenPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKlieden
          end
        END;
      IF LatPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKLat
          end
        END;
      IF enIrregPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKenIrreg
          end
        END;
      IF sIrregPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKsIrreg
          end
        END;
      IF LatIrregPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKLatIrreg
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
decnounmeervoud:=result
end;
{:nounmeervoud}


{rule:}
{:noungenitiefenkelvoud}
FUNCTION decnoungenitiefenkelvoud(Is:LISTREE_pStree)
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
    IF (NOUNrec1.number = singular) then
        if (NOUNrec1.possgeni = true) then
          if (NOUNrec1.geni = true) then
            if (not( OnlyPlural in NOUNrec1.pluralforms ) ) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKgens
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
decnoungenitiefenkelvoud:=result
end;
{:noungenitiefenkelvoud}


{rule:}
{:noungenitiefmeervoud}
FUNCTION decnoungenitiefmeervoud(Is:LISTREE_pStree)
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
   NOUNrec1:LSDOMAINT_NOUNrecord;
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
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

procedure createinputmodels(var s1:LSSTREE_pStree;var s2:LSSTREE_pStree;var s3:LSSTREE_pStree);
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
    IF (NOUNrec1.number = plural) then
        if (NOUNrec1.geni = true) then
          if (NOUNrec1.possgeni = true) THEN
      BEGIN
      IF sIrregPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKsIrreg
          end
        END;
      IF sPlural in NOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2,s3);
          SFCAT_rec1^.key :=  SFKmvs
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        SFCAT_rec2^.key :=  SFKgens
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
decnoungenitiefmeervoud:=result
end;
{:noungenitiefmeervoud}


{rule:}
{:Perspro1}
FUNCTION decPerspro1(Is:LISTREE_pStree)
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
    IF (nominative in PERSPROrec1.persprocases) then
        if (PERSPROrec1.generalized = false) then
          if (PERSPROrec1.reduced = false) THEN
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
decPerspro1:=result
end;
{:Perspro1}


{rule:}
{:Perspro2}
FUNCTION decPerspro2(Is:LISTREE_pStree)
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
    IF PERSPROrec1.generalized = false THEN
      BEGIN
      IF PERSPROrec1.number = singular THEN
        BEGIN
        IF (nominative in PERSPROrec1.persprocases) then
            if (PERSPROrec1.reduced = false) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKsgnom
            end
          END;
        IF (nominative in PERSPROrec1.persprocases) then
            if (PERSPROrec1.reduced = true) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKsgnomred
            end
          END;
        IF ([accusative, dative] * PERSPROrec1.persprocases <> []) then
            if (PERSPROrec1.reduced = false) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKsgaccdat
            end
          END;
        IF ([accusative, dative] * PERSPROrec1.persprocases <> []) then
            if (PERSPROrec1.reduced = true) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKsgaccdatred
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF PERSPROrec1.number = plural THEN
        BEGIN
        IF (nominative in PERSPROrec1.persprocases) then
            if (PERSPROrec1.reduced = false) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKplnom
            end
          END;
        IF (nominative in PERSPROrec1.persprocases) then
            if (PERSPROrec1.reduced = true) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKplnomred
            end
          END;
        IF ([accusative, dative] * PERSPROrec1.persprocases <> []) then
            if (PERSPROrec1.reduced = false) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKplaccdat
            end
          END;
        IF ([accusative, dative] * PERSPROrec1.persprocases <> []) then
            if (PERSPROrec1.reduced = true) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKplaccdatred
            end
          END;
        IF (accusative in PERSPROrec1.persprocases) then
            if (PERSPROrec1.reduced = false) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKplacc
            end
          END;
        IF (dative in PERSPROrec1.persprocases) then
            if (PERSPROrec1.reduced = false) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKpldat
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
decPerspro2:=result
end;
{:Perspro2}


{rule:}
{:Perspro3}
FUNCTION decPerspro3(Is:LISTREE_pStree)
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
    IF ([nominative, accusative, dative] * PERSPROrec1.persprocases <> []) then
        if (PERSPROrec1.generalized = true) then
          if (PERSPROrec1.reduced = true) THEN
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
decPerspro3:=result
end;
{:Perspro3}


{rule:}
{:PersproToPossadj}
FUNCTION decPersproToPossadj(Is:LISTREE_pStree)
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
    IF POSSADJrec1.mood = declxpmood THEN
      BEGIN
      IF BPERSPROrec1.number = singular THEN
        BEGIN
        IF (POSSADJrec1.eORenForm = NoForm) then
            if (POSSADJrec1.reduced = false) then
              if (POSSADJrec1.geni = false) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKsgpossadj
            end
          END;
        IF (POSSADJrec1.eORenForm = NoForm) then
            if (POSSADJrec1.reduced = true) then
              if (POSSADJrec1.geni = false) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKsgpossadjred
            end
          END;
        IF (POSSADJrec1.eORenForm = NoForm) then
            if (POSSADJrec1.reduced = false) then
              if (POSSADJrec1.geni = true) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKsgpossadjgen
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF BPERSPROrec1.number = plural THEN
        BEGIN
        IF (POSSADJrec1.eORenForm = NoForm) then
            if (POSSADJrec1.reduced = false) then
              if (POSSADJrec1.geni = false) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKplpossadj
            end
          END;
        IF (POSSADJrec1.eORenForm = eForm) then
            if (POSSADJrec1.reduced = false) then
              if (POSSADJrec1.geni = false) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKplpossadjonze
            end
          END;
        IF (POSSADJrec1.eORenForm = NoForm) then
            if (POSSADJrec1.reduced = false) then
              if (POSSADJrec1.geni = false) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKplpossadjons
            end
          END;
        IF (POSSADJrec1.eORenForm = NoForm) then
            if (POSSADJrec1.reduced = false) then
              if (POSSADJrec1.geni = true) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKplpossadjgen
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
decPersproToPossadj:=result
end;
{:PersproToPossadj}


{rule:}
{:PersproToPosspro}
FUNCTION decPersproToPosspro(Is:LISTREE_pStree)
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
    IF BPERSPROrec1.number = singular THEN
      BEGIN
      IF POSSPROrec1.nForm = false THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKsgposs
          end
        END;
      IF POSSPROrec1.nForm = true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKsgpossnvorm
          end
        END;
      if success and (level=3) then
        begin
      level:=2;
        skip
        end
      END;
    IF BPERSPROrec1.number = plural THEN
      BEGIN
      IF POSSPROrec1.nForm = false THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKplposs
          end
        END;
      IF POSSPROrec1.nForm = true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKplpossnvorm
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
decPersproToPosspro:=result
end;
{:PersproToPosspro}


{rule:}
{:BwhProToWhPro}
FUNCTION decBwhProToWhPro(Is:LISTREE_pStree)
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
decBwhProToWhPro:=result
end;
{:BwhProToWhPro}


{rule:}
{:WhproToPossadj}
FUNCTION decWhproToPossadj(Is:LISTREE_pStree)
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
    IF (POSSADJrec1.mood = wh) then
        if (POSSADJrec1.reduced = false) then
          if (POSSADJrec1.eORenForm = NoForm) then
            if (POSSADJrec1.geni = false) THEN
      BEGIN
      IF BWHPROrec1.number = singular THEN
        BEGIN
        IF BWHPROrec1.sexes = [masculine] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKpossadjwiens
            end
          END;
        IF BWHPROrec1.sexes = [feminine] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKpossadjwier
            end
          END;
        if success and (level=4) then
          begin
        level:=3;
          skip
          end
        END;
      IF BWHPROrec1.number = plural THEN
        BEGIN
        IF BWHPROrec1.sexes = [masculine,feminine] THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createinputmodels(s1,s2);
            SFCAT_rec1^.key :=  SFKpossadjwier
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
decWhproToPossadj:=result
end;
{:WhproToPossadj}


{rule:}
{:DemproToPossadj}
FUNCTION decDemproToPossadj(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
DEMPROrec1tree:LSSTREE_pstree;
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
   DEMPROrec1:LSDOMAINT_DEMPROrecord;
    DEMPRO_rec1:LSDOMAINT_pDEMPROrecord;
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
DEMPROrec1tree:=s;
if s^.ls^.cat=DEMPRO then
DEMPROrec1:=s^.ls^.DEMPROfield^
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
s:=DEMPROrec1tree;
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
    IF (POSSADJrec1.mood = declxpmood) then
        if (POSSADJrec1.reduced = false) then
          if (POSSADJrec1.eORenForm = NoForm) then
            if (POSSADJrec1.geni = false) then
              if (DEMPROrec1.sexes = [masculine]) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKpossadjdiens
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
decDemproToPossadj:=result
end;
{:DemproToPossadj}


{rule:}
{:BDetToDet1}
FUNCTION decBDetToDet1(Is:LISTREE_pStree)
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
    IF DETrec1.eORenForm = NoForm THEN
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
decBDetToDet1:=result
end;
{:BDetToDet1}


{rule:}
{:BDetToDet2}
FUNCTION decBDetToDet2(Is:LISTREE_pStree)
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
    IF true THEN
      BEGIN
      IF (DETrec1.eORenForm = eForm) then
          if (DETrec1.eFormation = regeFormation) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKeDet
          end
        END;
      IF (DETrec1.eORenForm = enForm) then
          if (DETrec1.enFormation = true) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createinputmodels(s1,s2);
          SFCAT_rec1^.key :=  SFKenDet
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
decBDetToDet2:=result
end;
{:BDetToDet2}


{rule:}
{:Bindefprotoindefpro1}
FUNCTION decBindefprotoindefpro1(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BINDEFPROrec1tree:LSSTREE_pstree;
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
   INDEFPROrec1:LSDOMAINT_INDEFPROrecord;
   BINDEFPROrec1:LSDOMAINT_BINDEFPROrecord;
    BINDEFPRO_rec1:LSDOMAINT_pBINDEFPROrecord;
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
BINDEFPROrec1tree:=s;
if s^.ls^.cat=BINDEFPRO then
BINDEFPROrec1:=s^.ls^.BINDEFPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=INDEFPRO then
INDEFPROrec1:=s^.ls^.INDEFPROfield^
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
s:=BINDEFPROrec1tree;
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
    IF INDEFPROrec1.geni = false THEN
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
decBindefprotoindefpro1:=result
end;
{:Bindefprotoindefpro1}


{rule:}
{:Bindefprotoindefpro2}
FUNCTION decBindefprotoindefpro2(Is:LISTREE_pStree)
                          :LISTREE_SetOfTupleOfStrees;
VAR
BINDEFPROrec1tree:LSSTREE_pstree;
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
   INDEFPROrec1:LSDOMAINT_INDEFPROrecord;
   BINDEFPROrec1:LSDOMAINT_BINDEFPROrecord;
    BINDEFPRO_rec1:LSDOMAINT_pBINDEFPROrecord;
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
BINDEFPROrec1tree:=s;
if s^.ls^.cat=BINDEFPRO then
BINDEFPROrec1:=s^.ls^.BINDEFPROfield^
else match:=false;
skip
end;
begin{reltreeproc1}
relnametest(rs,match);
if match then modelproc(rs^.node,match)
end;
begin{modelproc}
if s^.ls^.cat=INDEFPRO then
INDEFPROrec1:=s^.ls^.INDEFPROfield^
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
s:=BINDEFPROrec1tree;
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
    IF (INDEFPROrec1.geni = true) then
        if (INDEFPROrec1.possgeni = true) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createinputmodels(s1,s2);
        SFCAT_rec1^.key :=  SFKgens
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
decBindefprotoindefpro2:=result
end;
{:Bindefprotoindefpro2}

