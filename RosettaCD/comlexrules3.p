EXPORT(comlexrules3);
pragma C_include('string.pf');
pragma C_include('strtokey.pf');
pragma C_include('ldblex.pf');
pragma C_include('listree.pf');
pragma C_include('comlexrules3.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('maket.pf');
pragma C_include('copyt.pf');
pragma C_include('lsstree.pf');
PROGRAM comlexrules3;
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
{:adjbtosub}
FUNCTION comadjbtosub(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BADJrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BADJrec1:LSDOMAINT_BADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
    BADJ_rec1:LSDOMAINT_pBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BADJrec1tree:=s;
if s^.ls^.cat=BADJ then
BADJrec1:=s^.ls^.BADJfield^
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
s:=BADJrec1tree;
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
  s:=MAKET_Stree(SUBADJ);
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
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
        SUBADJ_rec1^ :=  COPYT_badjtosubadj(BADJrec1)
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadjbtosub:=result
end;
{:adjbtosub}


{rule:}
{:adjposvorm}
FUNCTION comadjposvorm(Is1:LISTREE_pStree)
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
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
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
  s:=MAKET_Stree(SUBADJ);
  s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
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
  s:=MAKET_Stree(ADJ);
  ADJ_rec1:=s^.ls^.ADJfield;
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
        ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1);
        ADJ_rec1^.form :=  positive;
        ADJ_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadjposvorm:=result
end;
{:adjposvorm}


{rule:}
{:adjsPositive}
FUNCTION comadjsPositive(Is1,Is2:LISTREE_pStree)
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
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
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
  s:=MAKET_Stree(SUBADJ);
  s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
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
  s:=MAKET_Stree(ADJ);
  ADJ_rec1:=s^.ls^.ADJfield;
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
    IF (SFCATrec1.key = SFKadjs) then
        if (SUBADJrec1.sFormation = true) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1);
        ADJ_rec1^.form :=  sPositive;
        ADJ_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadjsPositive:=result
end;
{:adjsPositive}


{rule:}
{:adjcompvorm}
FUNCTION comadjcompvorm(Is1,Is2:LISTREE_pStree)
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
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
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
  s:=MAKET_Stree(SUBADJ);
  s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
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
  s:=MAKET_Stree(ADJ);
  ADJ_rec1:=s^.ls^.ADJfield;
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
      IF (SFCATrec1.key = SFKer) then
          if (erComp in SUBADJrec1.comparatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1)
          end
        END;
      IF (SFCATrec1.key = SFKonreger) then
          if (erIrregComp in SUBADJrec1.comparatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ADJ_rec1^.form :=  comparative;
        ADJ_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadjcompvorm:=result
end;
{:adjcompvorm}


{rule:}
{:adjsComparative}
FUNCTION comadjsComparative(Is1,Is2,Is3:LISTREE_pStree)
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
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   SFCATrec2:LSDOMAINT_xxkeyrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
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
  s:=MAKET_Stree(SUBADJ);
  s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
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
  s:=MAKET_Stree(ADJ);
  ADJ_rec1:=s^.ls^.ADJfield;
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
    IF SFCATrec2.key = SFKadjs THEN
      BEGIN
      IF (SFCATrec1.key = SFKer) then
          if (erComp in SUBADJrec1.comparatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1)
          end
        END;
      IF (SFCATrec1.key = SFKonreger) then
          if (erIrregComp in SUBADJrec1.comparatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ADJ_rec1^.form :=  sComparative;
        ADJ_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadjsComparative:=result
end;
{:adjsComparative}


{rule:}
{:adjsupvorm}
FUNCTION comadjsupvorm(Is1,Is2:LISTREE_pStree)
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
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
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
  s:=MAKET_Stree(SUBADJ);
  s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
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
  s:=MAKET_Stree(ADJ);
  ADJ_rec1:=s^.ls^.ADJfield;
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
      IF (SFCATrec1.key = SFKst) then
          if (stSup in SUBADJrec1.superlatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1)
          end
        END;
      IF (SFCATrec1.key = SFKonregst) then
          if (stIrregSup in SUBADJrec1.superlatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ADJ_rec1^.form :=  superlative;
        ADJ_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadjsupvorm:=result
end;
{:adjsupvorm}


{rule:}
{:adjallersupvorm}
FUNCTION comadjallersupvorm(Is1,Is2,Is3:LISTREE_pStree)
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
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
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
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
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
  s:=MAKET_Stree(SUBADJ);
  s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
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
  s:=MAKET_Stree(ADJ);
  ADJ_rec1:=s^.ls^.ADJfield;
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
    IF PFCATrec1.key = PFKaller THEN
      BEGIN
      IF (SFCATrec1.key = SFKst) then
          if (allerSup in SUBADJrec1.superlatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1)
          end
        END;
      IF (SFCATrec1.key = SFKonregst) then
          if (allerIrregSup in SUBADJrec1.superlatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADJ_rec1^ :=  COPYT_subadjtoadj(SUBADJrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ADJ_rec1^.form :=  allerSuperlative;
        ADJ_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadjallersupvorm:=result
end;
{:adjallersupvorm}


{rule:}
{:adjEform}
FUNCTION comadjEform(Is1,Is2:LISTREE_pStree)
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
   ADJrec1:LSDOMAINT_ADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=ADJ then
ADJrec1:=s^.ls^.ADJfield^
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
  s:=MAKET_Stree(ADJ);
  s^.ls^.ADJfield^:=ADJrec1;
  ADJ_rec1:=s^.ls^.ADJfield;
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
    IF ADJrec1.eORenForm = NoForm THEN
      BEGIN
      IF (ADJrec1.form = comparative)
          or(ADJrec1.form = superlative)
            or(ADJrec1.form = allersuperlative) THEN
        BEGIN
        IF SFCATrec1.key = SFKe THEN
          BEGIN
          IF (attributive in ADJrec1.uses)
              or(nominalised in ADJrec1.uses) THEN
            BEGIN
            if success then againsuccess:=true;
            downcount:=downcount-1;
            if downcount=0 then
              begin
              success:=true;
              level:=5;
              createoutputtree(s);
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
      IF ADJrec1.form = positive THEN
        BEGIN
        IF (SFCATrec1.key = SFKe) then
            if (((ADJrec1.eFormation = regeFormation)
                   and  (attributive in ADJrec1.uses))
                   or  ((ADJrec1.eNominalised
                  = regeNominalised)  and  (nominalised
                  in ADJrec1.uses))) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            skip
            end
          END;
        IF (SFCATrec1.key = SFKonrege) then
            if (((ADJrec1.eFormation = irregeFormation)
                   and  (attributive in ADJrec1.uses))
                   or  ((ADJrec1.eNominalised
                  = irregeNominalised)  and
                   (nominalised in ADJrec1.uses))) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
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
        ADJ_rec1^.eORenForm :=  eForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadjEform:=result
end;
{:adjEform}


{rule:}
{:adjENform}
FUNCTION comadjENform(Is1,Is2:LISTREE_pStree)
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
   ADJrec1:LSDOMAINT_ADJrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADJ_rec1:LSDOMAINT_pADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=ADJ then
ADJrec1:=s^.ls^.ADJfield^
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
  s:=MAKET_Stree(ADJ);
  s^.ls^.ADJfield^:=ADJrec1;
  ADJ_rec1:=s^.ls^.ADJfield;
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
    IF ADJrec1.eORenForm = eForm THEN
      BEGIN
      IF (nominalised in ADJrec1.uses) then
          if (SFCATrec1.key = SFKen) THEN
        BEGIN
        IF (ADJrec1.form = positive)
            or(ADJrec1.form = comparative)
              or(ADJrec1.form = superlative)
                or(ADJrec1.form = allersuperlative) THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
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
        ADJ_rec1^.eORenForm :=  enForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadjENform:=result
end;
{:adjENform}


{rule:}
{:badvtosubadv}
FUNCTION combadvtosubadv(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BADVrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BADVrec1:LSDOMAINT_BADVrecord;
    SUBADV_rec1:LSDOMAINT_pSUBADVrecord;
    BADV_rec1:LSDOMAINT_pBADVrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BADVrec1tree:=s;
if s^.ls^.cat=BADV then
BADVrec1:=s^.ls^.BADVfield^
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
s:=BADVrec1tree;
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
  s:=MAKET_Stree(SUBADV);
  SUBADV_rec1:=s^.ls^.SUBADVfield;
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
        SUBADV_rec1^ :=  COPYT_badvtosubadv(BADVrec1)
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
combadvtosubadv:=result
end;
{:badvtosubadv}


{rule:}
{:AdvFromAdj}
FUNCTION comAdvFromAdj(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BADVSUFFrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   SUBADJrec1:LSDOMAINT_SUBADJrecord;
   BADVSUFFrec1:LSDOMAINT_BADVrecord;
    SUBADV_rec1:LSDOMAINT_pSUBADVrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
    BADVSUFF_rec1:LSDOMAINT_pBADVrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADJ then
SUBADJrec1:=s^.ls^.SUBADJfield^
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
  s:=MAKET_Stree(SUBADJ);
  s^.ls^.SUBADJfield^:=SUBADJrec1;
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=complrel;
createoutputtree(s);
rs1^.node:=s
end;
procedure createreltree2(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
StrToKey_GetSkey('ADJADVBADVSUFFKEY',hulpint);
hulpstree:=LDBLEX_read(hulpint);
s:=Loopholes.retype(hulpstree,LSSTREE_pstree);
BADVSUFFrec1:=s^.ls^.BADVSUFFfield^;
  s^.sons:=nil;
  s^.li^.n:=0
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
  s:=MAKET_Stree(SUBADV);
  SUBADV_rec1:=s^.ls^.SUBADVfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           2
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
      IF SUBADJrec1.possadv = true THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          SUBADV_rec1^.lastaffix :=  advaffix
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        SUBADV_rec1^.req :=  SUBADJrec1.req;
        SUBADV_rec1^.env :=  SUBADJrec1.env;
        SUBADV_rec1^.comparatives :=  SUBADJrec1.comparatives;
        SUBADV_rec1^.superlatives :=  SUBADJrec1.superlatives;
        SUBADV_rec1^.subcs :=  BADVSUFFrec1.subcs;
        SUBADV_rec1^.Qstatus :=  BADVSUFFrec1.Qstatus;
        SUBADV_rec1^.class :=  SUBADJrec1.class;
        SUBADV_rec1^.deixis :=  SUBADJrec1.deixis;
        SUBADV_rec1^.aspect :=  SUBADJrec1.aspect;
        SUBADV_rec1^.retro :=  SUBADJrec1.retro;
        SUBADV_rec1^.mood :=  BADVSUFFrec1.mood;
        SUBADV_rec1^.thetaadv :=  BADVSUFFrec1.thetaadv;
        SUBADV_rec1^.advpatterns :=  BADVSUFFrec1.advpatterns;
        SUBADV_rec1^.prepkey :=  BADVSUFFrec1.prepkey;
        SUBADV_rec1^.temporal :=  BADVSUFFrec1.temporal;
        SUBADV_rec1^.possnietnp :=  BADVSUFFrec1.possnietnp;
        SUBADV_rec1^.thanas :=  BADVSUFFrec1.thanas;
        SUBADV_rec1^.Radvb :=  false
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comAdvFromAdj:=result
end;
{:AdvFromAdj}


{rule:}
{:advposvorm}
FUNCTION comadvposvorm(Is1:LISTREE_pStree)
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
   SUBADVrec1:LSDOMAINT_SUBADVrecord;
    ADV_rec1:LSDOMAINT_pADVrecord;
    SUBADV_rec1:LSDOMAINT_pSUBADVrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADV then
SUBADVrec1:=s^.ls^.SUBADVfield^
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
  s:=MAKET_Stree(SUBADV);
  s^.ls^.SUBADVfield^:=SUBADVrec1;
  SUBADV_rec1:=s^.ls^.SUBADVfield;
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
  s:=MAKET_Stree(ADV);
  ADV_rec1:=s^.ls^.ADVfield;
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
        ADV_rec1^ :=  COPYT_subadvtoadv(SUBADVrec1);
        ADV_rec1^.eORenForm :=  NoForm;
        ADV_rec1^.form :=  positive
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadvposvorm:=result
end;
{:advposvorm}


{rule:}
{:advcompvorm}
FUNCTION comadvcompvorm(Is1,Is2:LISTREE_pStree)
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
   SUBADVrec1:LSDOMAINT_SUBADVrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADV_rec1:LSDOMAINT_pADVrecord;
    SUBADV_rec1:LSDOMAINT_pSUBADVrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADV then
SUBADVrec1:=s^.ls^.SUBADVfield^
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
  s:=MAKET_Stree(SUBADV);
  s^.ls^.SUBADVfield^:=SUBADVrec1;
  SUBADV_rec1:=s^.ls^.SUBADVfield;
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
  s:=MAKET_Stree(ADV);
  ADV_rec1:=s^.ls^.ADVfield;
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
      IF (SFCATrec1.key = SFKer) then
          if (erComp in SUBADVrec1.comparatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADV_rec1^ :=  COPYT_subadvtoadv(SUBADVrec1)
          end
        END;
      IF (SFCATrec1.key = SFKonreger) then
          if (erIrregComp in SUBADVrec1.comparatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADV_rec1^ :=  COPYT_subadvtoadv(SUBADVrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ADV_rec1^.eORenForm :=  NoForm;
        ADV_rec1^.form :=  comparative
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadvcompvorm:=result
end;
{:advcompvorm}


{rule:}
{:advsupvorm}
FUNCTION comadvsupvorm(Is1,Is2:LISTREE_pStree)
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
   SUBADVrec1:LSDOMAINT_SUBADVrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADV_rec1:LSDOMAINT_pADVrecord;
    SUBADV_rec1:LSDOMAINT_pSUBADVrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBADV then
SUBADVrec1:=s^.ls^.SUBADVfield^
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
  s:=MAKET_Stree(SUBADV);
  s^.ls^.SUBADVfield^:=SUBADVrec1;
  SUBADV_rec1:=s^.ls^.SUBADVfield;
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
  s:=MAKET_Stree(ADV);
  ADV_rec1:=s^.ls^.ADVfield;
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
      IF (SFCATrec1.key = SFKst) then
          if (stSup in SUBADVrec1.superlatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADV_rec1^ :=  COPYT_subadvtoadv(SUBADVrec1)
          end
        END;
      IF (SFCATrec1.key = SFKonregst) then
          if (stIrregSup in SUBADVrec1.superlatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADV_rec1^ :=  COPYT_subadvtoadv(SUBADVrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ADV_rec1^.eORenForm :=  NoForm;
        ADV_rec1^.form :=  superlative
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadvsupvorm:=result
end;
{:advsupvorm}


{rule:}
{:advallersupvorm}
FUNCTION comadvallersupvorm(Is1,Is2,Is3:LISTREE_pStree)
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
   SUBADVrec1:LSDOMAINT_SUBADVrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADV_rec1:LSDOMAINT_pADVrecord;
    SUBADV_rec1:LSDOMAINT_pSUBADVrecord;
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
if s^.ls^.cat=SUBADV then
SUBADVrec1:=s^.ls^.SUBADVfield^
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
  s:=MAKET_Stree(SUBADV);
  s^.ls^.SUBADVfield^:=SUBADVrec1;
  SUBADV_rec1:=s^.ls^.SUBADVfield;
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
  s:=MAKET_Stree(ADV);
  ADV_rec1:=s^.ls^.ADVfield;
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
    IF PFCATrec1.key = PFKaller THEN
      BEGIN
      IF (SFCATrec1.key = SFKst) then
          if (allerSup in SUBADVrec1.superlatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADV_rec1^ :=  COPYT_subadvtoadv(SUBADVrec1)
          end
        END;
      IF (SFCATrec1.key = SFKonregst) then
          if (allerIrregSup in SUBADVrec1.superlatives) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          ADV_rec1^ :=  COPYT_subadvtoadv(SUBADVrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        ADV_rec1^.eORenForm :=  NoForm;
        ADV_rec1^.form :=  allersuperlative
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadvallersupvorm:=result
end;
{:advallersupvorm}


{rule:}
{:adveform}
FUNCTION comadveform(Is1,Is2:LISTREE_pStree)
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
   ADVrec1:LSDOMAINT_ADVrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    ADV_rec1:LSDOMAINT_pADVrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=ADV then
ADVrec1:=s^.ls^.ADVfield^
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
  s:=MAKET_Stree(ADV);
  s^.ls^.ADVfield^:=ADVrec1;
  ADV_rec1:=s^.ls^.ADVfield;
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
    IF (ADVrec1.eORenForm = NoForm) then
        if (SFCATrec1.key = SFKe) THEN
      BEGIN
      IF (ADVrec1.form = superlative)
          or(ADVrec1.form = allersuperlative) THEN
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
        ADV_rec1^.eORenForm :=  eForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comadveform:=result
end;
{:adveform}


{rule:}
{:CARDrule1}
FUNCTION comCARDrule1(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
DIGITrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   DIGITrec1:LSDOMAINT_DIGITrecord;
    CARD_rec1:LSDOMAINT_pCARDrecord;
    DIGIT_rec1:LSDOMAINT_pDIGITrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
DIGITrec1tree:=s;
if s^.ls^.cat=DIGIT then
DIGITrec1:=s^.ls^.DIGITfield^
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
s:=DIGITrec1tree;
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
  s:=MAKET_Stree(CARD);
  CARD_rec1:=s^.ls^.CARDfield;
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
    IF DIGITrec1.valeu = 1 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec1^.possnumbers :=  [singular]
        end
      END;
    IF DIGITrec1.valeu <> 1 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec1^.possnumbers :=  [plural]
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comCARDrule1:=result
end;
{:CARDrule1}


{rule:}
{:CARDrule2}
FUNCTION comCARDrule2(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
DIGITrec1tree:LSSTREE_pstree;
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
   CARDrec1:LSDOMAINT_CARDrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   DIGITrec1:LSDOMAINT_DIGITrecord;
    CARD_rec2:LSDOMAINT_pCARDrecord;
    CARD_rec1:LSDOMAINT_pCARDrecord;
    DIGIT_rec1:LSDOMAINT_pDIGITrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=CARD then
CARDrec1:=s^.ls^.CARDfield^
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
  s:=MAKET_Stree(CARD);
  s^.ls^.CARDfield^:=CARDrec1;
  CARD_rec1:=s^.ls^.CARDfield;
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
procedure createreltree2(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
s:=MAKET_stree(DIGIT);
DIGIT_rec1:=s^.ls^.DIGITfield;
  s^.sons:=nil;
  s^.li^.n:=0
end;
begin{createreltree2}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=argrel;
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
  s:=MAKET_Stree(CARD);
  CARD_rec2:=s^.ls^.CARDfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           2
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
    IF SFCATrec1.key = SFK1 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.possnumbers :=  [plural];
        DIGIT_rec1^.key :=  intkey('s_1DIGITkey');
        DIGIT_rec1^.valeu :=  1
        end
      END;
    IF SFCATrec1.key = SFK2 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.possnumbers :=  [plural];
        DIGIT_rec1^.key :=  intkey('s_2DIGITkey');
        DIGIT_rec1^.valeu :=  2
        end
      END;
    IF SFCATrec1.key = SFK3 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.possnumbers :=  [plural];
        DIGIT_rec1^.key :=  intkey('s_3DIGITkey');
        DIGIT_rec1^.valeu :=  3
        end
      END;
    IF SFCATrec1.key = SFK4 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.possnumbers :=  [plural];
        DIGIT_rec1^.key :=  intkey('s_4DIGITkey');
        DIGIT_rec1^.valeu :=  4
        end
      END;
    IF SFCATrec1.key = SFK5 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.possnumbers :=  [plural];
        DIGIT_rec1^.key :=  intkey('s_5DIGITkey');
        DIGIT_rec1^.valeu :=  5
        end
      END;
    IF SFCATrec1.key = SFK6 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.possnumbers :=  [plural];
        DIGIT_rec1^.key :=  intkey('s_6DIGITkey');
        DIGIT_rec1^.valeu :=  6
        end
      END;
    IF SFCATrec1.key = SFK7 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.possnumbers :=  [plural];
        DIGIT_rec1^.key :=  intkey('s_7DIGITkey');
        DIGIT_rec1^.valeu :=  7
        end
      END;
    IF SFCATrec1.key = SFK8 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.possnumbers :=  [plural];
        DIGIT_rec1^.key :=  intkey('s_8DIGITkey');
        DIGIT_rec1^.valeu :=  8
        end
      END;
    IF SFCATrec1.key = SFK9 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.possnumbers :=  [plural];
        DIGIT_rec1^.key :=  intkey('s_9DIGITkey');
        DIGIT_rec1^.valeu :=  9
        end
      END;
    IF SFCATrec1.key = SFK0 THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        CARD_rec2^.possnumbers :=  [plural];
        DIGIT_rec1^.key :=  intkey('s_0DIGITkey');
        DIGIT_rec1^.valeu :=  0
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comCARDrule2:=result
end;
{:CARDrule2}


{rule:}
{:ORDINALrule1}
FUNCTION comORDINALrule1(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BADJSUFFrec1tree:LSSTREE_pstree;
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
   CARDrec1:LSDOMAINT_CARDrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   BADJSUFFrec1:LSDOMAINT_BADJrecord;
    SUBADJ_rec1:LSDOMAINT_pSUBADJrecord;
    CARD_rec1:LSDOMAINT_pCARDrecord;
    BADJSUFF_rec1:LSDOMAINT_pBADJrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=CARD then
CARDrec1:=s^.ls^.CARDfield^
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
  s:=MAKET_Stree(CARD);
  s^.ls^.CARDfield^:=CARDrec1;
  CARD_rec1:=s^.ls^.CARDfield;
  createreltreelist(rs);
  s^.sons:=rs;
s^.li^.n:=numberofelements(rs)
end;
begin{createreltree1}
LISTREE_makerelnode(Loopholes.retype(rs,LISTREE_prelnode));
rs^.relation:=complrel;
createoutputtree(s);
rs1^.node:=s
end;
procedure createreltree2(var rs:LSSTREE_pRelNode);
var
   s:LSSTREE_pStree;
procedure createoutputtree(var s:LSSTREE_pStree);
var
   rs:LSSTREE_pRelNode;
begin{createoutputtree}
StrToKey_GetSkey('ORDBADJSUFFKEY',hulpint);
hulpstree:=LDBLEX_read(hulpint);
s:=Loopholes.retype(hulpstree,LSSTREE_pstree);
BADJSUFFrec1:=s^.ls^.BADJSUFFfield^;
  s^.sons:=nil;
  s^.li^.n:=0
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
  s:=MAKET_Stree(SUBADJ);
  SUBADJ_rec1:=s^.ls^.SUBADJfield;
  createreltreelist(rs);
  s^.sons:=rs;
  s^.li^.n:=           2
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
    IF SFCATrec1.key = SFKe THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        SUBADJ_rec1^ :=  COPYT_BADJTOSUBADJ(BADJSUFFrec1)
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comORDINALrule1:=result
end;
{:ORDINALrule1}

