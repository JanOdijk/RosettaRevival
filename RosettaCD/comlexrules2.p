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
{:bpropernountopropernoun}
FUNCTION combpropernountopropernoun(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPROPERNOUNrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPROPERNOUNrec1:LSDOMAINT_BPROPERNOUNrecord;
    PROPERNOUN_rec1:LSDOMAINT_pPROPERNOUNrecord;
    BPROPERNOUN_rec1:LSDOMAINT_pBPROPERNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPROPERNOUNrec1tree:=s;
if s^.ls^.cat=BPROPERNOUN then
BPROPERNOUNrec1:=s^.ls^.BPROPERNOUNfield^
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
s:=BPROPERNOUNrec1tree;
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
  s:=MAKET_Stree(PROPERNOUN);
  PROPERNOUN_rec1:=s^.ls^.PROPERNOUNfield;
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
        PROPERNOUN_rec1^ :=  COPYT_bpropernountopropernoun(BPROPERNOUNrec1);
        PROPERNOUN_rec1^.geni :=  false
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
combpropernountopropernoun:=result
end;
{:bpropernountopropernoun}


{rule:}
{:bpropertopropergenitief}
FUNCTION combpropertopropergenitief(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPROPERNOUNrec1tree:LSSTREE_pstree;
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
   BPROPERNOUNrec1:LSDOMAINT_BPROPERNOUNrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    PROPERNOUN_rec1:LSDOMAINT_pPROPERNOUNrecord;
    BPROPERNOUN_rec1:LSDOMAINT_pBPROPERNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPROPERNOUNrec1tree:=s;
if s^.ls^.cat=BPROPERNOUN then
BPROPERNOUNrec1:=s^.ls^.BPROPERNOUNfield^
else match:=false;
skip
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
begin{createoutputtree}
s:=BPROPERNOUNrec1tree;
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
  s:=MAKET_Stree(PROPERNOUN);
  PROPERNOUN_rec1:=s^.ls^.PROPERNOUNfield;
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
    IF (SFCATrec1.key = SFKgens) then
        if (not( OnlyPlural in BPROPERNOUNrec1.pluralforms ) ) then
          if (BPROPERNOUNrec1.possgeni = true) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        PROPERNOUN_rec1^ :=  COPYT_bpropernountopropernoun(BPROPERNOUNrec1);
        PROPERNOUN_rec1^.number :=  singular;
        PROPERNOUN_rec1^.geni :=  true
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
combpropertopropergenitief:=result
end;
{:bpropertopropergenitief}


{rule:}
{:PropernounWithDimForm}
FUNCTION comPropernounWithDimForm(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPROPERNOUNrec1tree:LSSTREE_pstree;
BNOUNSUFFrec1tree:LSSTREE_pstree;
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
   BPROPERNOUNrec1:LSDOMAINT_BPROPERNOUNrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   BNOUNSUFFrec1:LSDOMAINT_BNOUNrecord;
    PROPERNOUN_rec1:LSDOMAINT_pPROPERNOUNrecord;
    BPROPERNOUN_rec1:LSDOMAINT_pBPROPERNOUNrecord;
    BNOUNSUFF_rec1:LSDOMAINT_pBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPROPERNOUNrec1tree:=s;
if s^.ls^.cat=BPROPERNOUN then
BPROPERNOUNrec1:=s^.ls^.BPROPERNOUNfield^
else match:=false;
skip
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
begin{createoutputtree}
s:=BPROPERNOUNrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
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
StrToKey_GetSkey('DIMBNOUNSUFFKEY',hulpint);
hulpstree:=LDBLEX_read(hulpint);
s:=Loopholes.retype(hulpstree,LSSTREE_pstree);
BNOUNSUFFrec1:=s^.ls^.BNOUNSUFFfield^;
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
  s:=MAKET_Stree(PROPERNOUN);
  PROPERNOUN_rec1:=s^.ls^.PROPERNOUNfield;
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
    IF true THEN
      BEGIN
      IF (not( noDim in BPROPERNOUNrec1.dimforms ) ) THEN
        BEGIN
        IF (SFCATrec1.key = SFKje) then
            if (jeDim in BPROPERNOUNrec1.dimforms) THEN
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
        IF (SFCATrec1.key = SFKetje) then
            if (etjeDim in BPROPERNOUNrec1.dimforms) THEN
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
        IF (SFCATrec1.key = SFKonregdim) then
            if (irregdim in BPROPERNOUNrec1.dimforms) THEN
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
        IF (SFCATrec1.key = SFKdimletterword) then
            if (dimletterword in BPROPERNOUNrec1.dimforms) THEN
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
          PROPERNOUN_rec1^ :=  COPYT_bpropernountopropernoun(BPROPERNOUNrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        PROPERNOUN_rec1^.geni :=  false;
        PROPERNOUN_rec1^.number :=  singular;
        PROPERNOUN_rec1^.genders :=  BNOUNSUFFrec1.genders;
        PROPERNOUN_rec1^.dimforms :=  BNOUNSUFFrec1.dimforms;
        PROPERNOUN_rec1^.pluralforms :=  BNOUNSUFFrec1.pluralforms
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPropernounWithDimForm:=result
end;
{:PropernounWithDimForm}


{rule:}
{:PropernounWithGeniDimForm}
FUNCTION comPropernounWithGeniDimForm(Is1,Is2,Is3:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPROPERNOUNrec1tree:LSSTREE_pstree;
BNOUNSUFFrec1tree:LSSTREE_pstree;
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
   BPROPERNOUNrec1:LSDOMAINT_BPROPERNOUNrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   SFCATrec2:LSDOMAINT_xxkeyrecord;
   BNOUNSUFFrec1:LSDOMAINT_BNOUNrecord;
    PROPERNOUN_rec1:LSDOMAINT_pPROPERNOUNrecord;
    BPROPERNOUN_rec1:LSDOMAINT_pBPROPERNOUNrecord;
    BNOUNSUFF_rec1:LSDOMAINT_pBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPROPERNOUNrec1tree:=s;
if s^.ls^.cat=BPROPERNOUN then
BPROPERNOUNrec1:=s^.ls^.BPROPERNOUNfield^
else match:=false;
skip
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
begin{createoutputtree}
s:=BPROPERNOUNrec1tree;
  s^.sons:=nil;
  s^.li^.n:=0
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
StrToKey_GetSkey('DIMBNOUNSUFFKEY',hulpint);
hulpstree:=LDBLEX_read(hulpint);
s:=Loopholes.retype(hulpstree,LSSTREE_pstree);
BNOUNSUFFrec1:=s^.ls^.BNOUNSUFFfield^;
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
  s:=MAKET_Stree(PROPERNOUN);
  PROPERNOUN_rec1:=s^.ls^.PROPERNOUNfield;
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
    IF (BPROPERNOUNrec1.possgeni = true) then
        if (SFCATrec2.key = SFKgens) THEN
      BEGIN
      IF (not( noDim in BPROPERNOUNrec1.dimforms ) ) THEN
        BEGIN
        IF (SFCATrec1.key = SFKje) then
            if (jeDim in BPROPERNOUNrec1.dimforms) THEN
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
        IF (SFCATrec1.key = SFKetje) then
            if (etjeDim in BPROPERNOUNrec1.dimforms) THEN
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
        IF (SFCATrec1.key = SFKonregdim) then
            if (irregdim in BPROPERNOUNrec1.dimforms) THEN
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
        IF (SFCATrec1.key = SFKdimletterword) then
            if (dimletterword in BPROPERNOUNrec1.dimforms) THEN
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
          PROPERNOUN_rec1^ :=  COPYT_bpropernountopropernoun(BPROPERNOUNrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        PROPERNOUN_rec1^.geni :=  true;
        PROPERNOUN_rec1^.number :=  singular
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPropernounWithGeniDimForm:=result
end;
{:PropernounWithGeniDimForm}


{rule:}
{:bpropernountosubnoun}
FUNCTION combpropernountosubnoun(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPROPERNOUNrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPROPERNOUNrec1:LSDOMAINT_BPROPERNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
    BPROPERNOUN_rec1:LSDOMAINT_pBPROPERNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPROPERNOUNrec1tree:=s;
if s^.ls^.cat=BPROPERNOUN then
BPROPERNOUNrec1:=s^.ls^.BPROPERNOUNfield^
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
s:=BPROPERNOUNrec1tree;
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
  s:=MAKET_Stree(SUBNOUN);
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
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
        SUBNOUN_rec1^.req :=  [pospol, negpol, omegapol];
        SUBNOUN_rec1^.env :=  [pospol, negpol, omegapol];
        SUBNOUN_rec1^.dimforms :=  BPROPERNOUNrec1.dimforms;
        SUBNOUN_rec1^.pluralforms :=  BPROPERNOUNrec1.pluralforms;
        SUBNOUN_rec1^.genders :=  BPROPERNOUNrec1.genders;
        SUBNOUN_rec1^.class :=  BPROPERNOUNrec1.class;
        SUBNOUN_rec1^.deixis :=  BPROPERNOUNrec1.deixis;
        SUBNOUN_rec1^.aspect :=  BPROPERNOUNrec1.aspect;
        SUBNOUN_rec1^.retro :=  BPROPERNOUNrec1.retro;
        SUBNOUN_rec1^.sexes :=  BPROPERNOUNrec1.sexes;
        SUBNOUN_rec1^.subcs :=  [BPROPERNOUNrec1.subc];
        SUBNOUN_rec1^.temporal :=  BPROPERNOUNrec1.temporal;
        SUBNOUN_rec1^.possgeni :=  false;
        SUBNOUN_rec1^.animate :=  BPROPERNOUNrec1.animate;
        SUBNOUN_rec1^.human :=  BPROPERNOUNrec1.human;
        SUBNOUN_rec1^.posscomas :=  [count];
        SUBNOUN_rec1^.thetanp :=  omegathetanp;
        SUBNOUN_rec1^.nounpatterns :=  [];
        SUBNOUN_rec1^.prepkey :=  0;
        SUBNOUN_rec1^.personal :=  true;
        SUBNOUN_rec1^.lastaffix :=  noaffix
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
combpropernountosubnoun:=result
end;
{:bpropernountosubnoun}


{rule:}
{:bnountosub}
FUNCTION combnountosub(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BNOUNrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BNOUNrec1:LSDOMAINT_BNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
    BNOUN_rec1:LSDOMAINT_pBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BNOUNrec1tree:=s;
if s^.ls^.cat=BNOUN then
BNOUNrec1:=s^.ls^.BNOUNfield^
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
s:=BNOUNrec1tree;
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
  s:=MAKET_Stree(SUBNOUN);
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
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
        SUBNOUN_rec1^ :=  COPYT_bnountosubnoun(BNOUNrec1)
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
combnountosub:=result
end;
{:bnountosub}


{rule:}
{:DimForm}
FUNCTION comDimForm(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BNOUNSUFFrec1tree:LSSTREE_pstree;
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
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   BNOUNSUFFrec1:LSDOMAINT_BNOUNrecord;
    SUBNOUN_rec2:LSDOMAINT_pSUBNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
    BNOUNSUFF_rec1:LSDOMAINT_pBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
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
  s:=MAKET_Stree(SUBNOUN);
  s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
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
StrToKey_GetSkey('DIMBNOUNSUFFKEY',hulpint);
hulpstree:=LDBLEX_read(hulpint);
s:=Loopholes.retype(hulpstree,LSSTREE_pstree);
BNOUNSUFFrec1:=s^.ls^.BNOUNSUFFfield^;
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
      IF (not( SUBNOUNrec1.lastaffix = dimaffix ) ) then
          if (not( noDim in SUBNOUNrec1.dimforms ) ) THEN
        BEGIN
        IF (SFCATrec1.key = SFKje) then
            if (jeDim in SUBNOUNrec1.dimforms) THEN
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
        IF (SFCATrec1.key = SFKetje) then
            if (etjeDim in SUBNOUNrec1.dimforms) THEN
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
        IF (SFCATrec1.key = SFKonregdim) then
            if (irregdim in SUBNOUNrec1.dimforms) THEN
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
        IF (SFCATrec1.key = SFKdimletterword) then
            if (dimletterword in SUBNOUNrec1.dimforms) THEN
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
          SUBNOUN_rec2^ :=  SUBNOUNrec1;
          SUBNOUN_rec2^.lastaffix :=  dimaffix
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        SUBNOUN_rec2^.dimforms :=  BNOUNSUFFrec1.dimforms;
        SUBNOUN_rec2^.pluralforms :=  BNOUNSUFFrec1.pluralforms;
        SUBNOUN_rec2^.genders :=  BNOUNSUFFrec1.genders
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comDimForm:=result
end;
{:DimForm}


{rule:}
{:nounenkelvoud}
FUNCTION comnounenkelvoud(Is1:LISTREE_pStree)
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
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
    NOUN_rec1:LSDOMAINT_pNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
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
  s:=MAKET_Stree(SUBNOUN);
  s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
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
  s:=MAKET_Stree(NOUN);
  NOUN_rec1:=s^.ls^.NOUNfield;
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
      IF not( OnlyPlural in SUBNOUNrec1.pluralforms )  THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1);
          NOUN_rec1^.number :=  singular
          end
        END;
      IF OnlyPlural in SUBNOUNrec1.pluralforms THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1);
          NOUN_rec1^.number :=  plural
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        NOUN_rec1^.geni :=  false
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comnounenkelvoud:=result
end;
{:nounenkelvoud}


{rule:}
{:nounmeervoud}
FUNCTION comnounmeervoud(Is1,Is2:LISTREE_pStree)
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
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    NOUN_rec1:LSDOMAINT_pNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
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
  s:=MAKET_Stree(SUBNOUN);
  s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
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
  s:=MAKET_Stree(NOUN);
  NOUN_rec1:=s^.ls^.NOUNfield;
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
    IF (not( OnlyPlural in SUBNOUNrec1.pluralforms ) ) then
        if (not( NoPlural in SUBNOUNrec1.pluralforms ) ) THEN
      BEGIN
      IF (SFCATrec1.key = SFKen) then
          if (enPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKmvs) then
          if (sPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKaTOaa) then
          if (aTOaaPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKaTOee) then
          if (aTOeePlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKeTOee) then
          if (eTOeePlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKeiTOee) then
          if (eiTOeePlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKiTOee) then
          if (iTOeePlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKoTOoo) then
          if (oTOooPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKeren) then
          if (erenPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKien) then
          if (ienPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKden) then
          if (denPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKnen) then
          if (nenPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKieAccent) then
          if (ieAccentPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKlui) then
          if (luiPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKlieden) then
          if (liedenPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKLat) then
          if (LatPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKenIrreg) then
          if (enIrregPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKsIrreg) then
          if (sIrregPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKLatIrreg) then
          if (LatIrregPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        NOUN_rec1^.number :=  plural;
        NOUN_rec1^.geni :=  false
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comnounmeervoud:=result
end;
{:nounmeervoud}


{rule:}
{:noungenitiefenkelvoud}
FUNCTION comnoungenitiefenkelvoud(Is1,Is2:LISTREE_pStree)
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
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    NOUN_rec1:LSDOMAINT_pNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
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
  s:=MAKET_Stree(SUBNOUN);
  s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
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
  s:=MAKET_Stree(NOUN);
  NOUN_rec1:=s^.ls^.NOUNfield;
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
    IF (SFCATrec1.key = SFKgens) then
        if (SUBNOUNrec1.possgeni = true) then
          if (not( OnlyPlural in SUBNOUNrec1.pluralforms ) ) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1);
        NOUN_rec1^.number :=  singular;
        NOUN_rec1^.geni :=  true
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comnoungenitiefenkelvoud:=result
end;
{:noungenitiefenkelvoud}


{rule:}
{:noungenitiefmeervoud}
FUNCTION comnoungenitiefmeervoud(Is1,Is2,Is3:LISTREE_pStree)
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
   SUBNOUNrec1:LSDOMAINT_SUBNOUNrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
   SFCATrec2:LSDOMAINT_xxkeyrecord;
    NOUN_rec1:LSDOMAINT_pNOUNrecord;
    SUBNOUN_rec1:LSDOMAINT_pSUBNOUNrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
if s^.ls^.cat=SUBNOUN then
SUBNOUNrec1:=s^.ls^.SUBNOUNfield^
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
  s:=MAKET_Stree(SUBNOUN);
  s^.ls^.SUBNOUNfield^:=SUBNOUNrec1;
  SUBNOUN_rec1:=s^.ls^.SUBNOUNfield;
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
  s:=MAKET_Stree(NOUN);
  NOUN_rec1:=s^.ls^.NOUNfield;
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
    IF (SFCATrec2.key = SFKgens) then
        if (SUBNOUNrec1.possgeni = true) THEN
      BEGIN
      IF (SFCATrec1.key = SFKmvs) then
          if (sPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      IF (SFCATrec1.key = SFKsIrreg) then
          if (sIrregPlural in SUBNOUNrec1.pluralforms) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          NOUN_rec1^ :=  COPYT_subnountonoun(SUBNOUNrec1)
          end
        END;
      if success and (level=3) then
        begin
        level:=2;
        NOUN_rec1^.number :=  plural;
        NOUN_rec1^.geni :=  true
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comnoungenitiefmeervoud:=result
end;
{:noungenitiefmeervoud}


{rule:}
{:Perspro1}
FUNCTION comPerspro1(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    PERSPRO_rec1:LSDOMAINT_pPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
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
s:=BPERSPROrec1tree;
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
  s:=MAKET_Stree(PERSPRO);
  PERSPRO_rec1:=s^.ls^.PERSPROfield;
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
    IF BPERSPROrec1.generalized = false THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        PERSPRO_rec1^ :=  COPYT_bpersprotoperspro(BPERSPROrec1);
        PERSPRO_rec1^.persprocases :=  [nominative];
        PERSPRO_rec1^.reduced :=  false
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPerspro1:=result
end;
{:Perspro1}


{rule:}
{:Perspro2}
FUNCTION comPerspro2(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
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
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    PERSPRO_rec1:LSDOMAINT_pPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
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
begin{createoutputtree}
s:=BPERSPROrec1tree;
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
  s:=MAKET_Stree(PERSPRO);
  PERSPRO_rec1:=s^.ls^.PERSPROfield;
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
    IF BPERSPROrec1.generalized = false THEN
      BEGIN
      IF BPERSPROrec1.number = singular THEN
        BEGIN
        IF SFCATrec1.key = SFKsgnom THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            PERSPRO_rec1^ :=  COPYT_bpersprotoperspro(BPERSPROrec1);
            PERSPRO_rec1^.persprocases :=  [nominative];
            PERSPRO_rec1^.reduced :=  false
            end
          END;
        IF SFCATrec1.key = SFKsgnomred THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            PERSPRO_rec1^ :=  COPYT_bpersprotoperspro(BPERSPROrec1);
            PERSPRO_rec1^.persprocases :=  [nominative];
            PERSPRO_rec1^.reduced :=  true
            end
          END;
        IF SFCATrec1.key = SFKsgaccdat THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            PERSPRO_rec1^ :=  COPYT_bpersprotoperspro(BPERSPROrec1);
            PERSPRO_rec1^.persprocases :=  [accusative, dative];
            PERSPRO_rec1^.reduced :=  false
            end
          END;
        IF SFCATrec1.key = SFKsgaccdatred THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            PERSPRO_rec1^ :=  COPYT_bpersprotoperspro(BPERSPROrec1);
            PERSPRO_rec1^.persprocases :=  [accusative, dative];
            PERSPRO_rec1^.reduced :=  true
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
        IF SFCATrec1.key = SFKplnom THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            PERSPRO_rec1^ :=  COPYT_bpersprotoperspro(BPERSPROrec1);
            PERSPRO_rec1^.persprocases :=  [nominative];
            PERSPRO_rec1^.reduced :=  false
            end
          END;
        IF SFCATrec1.key = SFKplnomred THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            PERSPRO_rec1^ :=  COPYT_bpersprotoperspro(BPERSPROrec1);
            PERSPRO_rec1^.persprocases :=  [nominative];
            PERSPRO_rec1^.reduced :=  true
            end
          END;
        IF SFCATrec1.key = SFKplaccdat THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            PERSPRO_rec1^ :=  COPYT_bpersprotoperspro(BPERSPROrec1);
            PERSPRO_rec1^.persprocases :=  [accusative, dative];
            PERSPRO_rec1^.reduced :=  false
            end
          END;
        IF SFCATrec1.key = SFKplaccdatred THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            PERSPRO_rec1^ :=  COPYT_bpersprotoperspro(BPERSPROrec1);
            PERSPRO_rec1^.persprocases :=  [accusative, dative];
            PERSPRO_rec1^.reduced :=  true
            end
          END;
        IF SFCATrec1.key = SFKplacc THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            PERSPRO_rec1^ :=  COPYT_bpersprotoperspro(BPERSPROrec1);
            PERSPRO_rec1^.persprocases :=  [accusative];
            PERSPRO_rec1^.reduced :=  false
            end
          END;
        IF SFCATrec1.key = SFKpldat THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            PERSPRO_rec1^ :=  COPYT_bpersprotoperspro(BPERSPROrec1);
            PERSPRO_rec1^.persprocases :=  [dative];
            PERSPRO_rec1^.reduced :=  false
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
comPerspro2:=result
end;
{:Perspro2}


{rule:}
{:Perspro3}
FUNCTION comPerspro3(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
    PERSPRO_rec1:LSDOMAINT_pPERSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
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
s:=BPERSPROrec1tree;
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
  s:=MAKET_Stree(PERSPRO);
  PERSPRO_rec1:=s^.ls^.PERSPROfield;
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
    IF BPERSPROrec1.generalized = true THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        PERSPRO_rec1^ :=  COPYT_bpersprotoperspro(BPERSPROrec1);
        PERSPRO_rec1^.persprocases :=  [nominative, accusative, dative];
        PERSPRO_rec1^.reduced :=  true
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPerspro3:=result
end;
{:Perspro3}


{rule:}
{:PersproToPossadj}
FUNCTION comPersproToPossadj(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
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
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    POSSADJ_rec1:LSDOMAINT_pPOSSADJrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
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
begin{createoutputtree}
s:=BPERSPROrec1tree;
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
  s:=MAKET_Stree(POSSADJ);
  POSSADJ_rec1:=s^.ls^.POSSADJfield;
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
      IF BPERSPROrec1.number = singular THEN
        BEGIN
        IF SFCATrec1.key = SFKsgpossadj THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            POSSADJ_rec1^.eORenForm :=  NoForm;
            POSSADJ_rec1^.reduced :=  false;
            POSSADJ_rec1^.geni :=  false
            end
          END;
        IF SFCATrec1.key = SFKsgpossadjred THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            POSSADJ_rec1^.eORenForm :=  NoForm;
            POSSADJ_rec1^.reduced :=  true;
            POSSADJ_rec1^.geni :=  false
            end
          END;
        IF SFCATrec1.key = SFKsgpossadjgen THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            POSSADJ_rec1^.eORenForm :=  NoForm;
            POSSADJ_rec1^.reduced :=  false;
            POSSADJ_rec1^.geni :=  true
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
        IF SFCATrec1.key = SFKplpossadj THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            POSSADJ_rec1^.eORenForm :=  NoForm;
            POSSADJ_rec1^.reduced :=  false;
            POSSADJ_rec1^.geni :=  false
            end
          END;
        IF SFCATrec1.key = SFKplpossadjonze THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            POSSADJ_rec1^.eORenForm :=  eForm;
            POSSADJ_rec1^.reduced :=  false;
            POSSADJ_rec1^.geni :=  false
            end
          END;
        IF SFCATrec1.key = SFKplpossadjons THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            POSSADJ_rec1^.eORenForm :=  NoForm;
            POSSADJ_rec1^.reduced :=  false;
            POSSADJ_rec1^.geni :=  false
            end
          END;
        IF SFCATrec1.key = SFKplpossadjgen THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            POSSADJ_rec1^.eORenForm :=  NoForm;
            POSSADJ_rec1^.reduced :=  false;
            POSSADJ_rec1^.geni :=  true
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
        POSSADJ_rec1^.mood :=  declxpmood
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comPersproToPossadj:=result
end;
{:PersproToPossadj}


{rule:}
{:PersproToPosspro}
FUNCTION comPersproToPosspro(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BPERSPROrec1tree:LSSTREE_pstree;
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
   BPERSPROrec1:LSDOMAINT_BPERSPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    POSSPRO_rec1:LSDOMAINT_pPOSSPROrecord;
    BPERSPRO_rec1:LSDOMAINT_pBPERSPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BPERSPROrec1tree:=s;
if s^.ls^.cat=BPERSPRO then
BPERSPROrec1:=s^.ls^.BPERSPROfield^
else match:=false;
skip
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
begin{createoutputtree}
s:=BPERSPROrec1tree;
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
  s:=MAKET_Stree(POSSPRO);
  POSSPRO_rec1:=s^.ls^.POSSPROfield;
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
      IF BPERSPROrec1.number = singular THEN
        BEGIN
        IF SFCATrec1.key = SFKsgposs THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            POSSPRO_rec1^.nForm :=  false
            end
          END;
        IF SFCATrec1.key = SFKsgpossnvorm THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            POSSPRO_rec1^.nForm :=  true
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
        IF SFCATrec1.key = SFKplposs THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            POSSPRO_rec1^.nForm :=  false
            end
          END;
        IF SFCATrec1.key = SFKplpossnvorm THEN
          BEGIN
          if success then againsuccess:=true;
          downcount:=downcount-1;
          if downcount=0 then
            begin
            success:=true;
            level:=4;
            createoutputtree(s);
            POSSPRO_rec1^.nForm :=  true
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
comPersproToPosspro:=result
end;
{:PersproToPosspro}


{rule:}
{:BwhProToWhPro}
FUNCTION comBwhProToWhPro(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BWHPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BWHPROrec1:LSDOMAINT_BWHPROrecord;
    WHPRO_rec1:LSDOMAINT_pWHPROrecord;
    BWHPRO_rec1:LSDOMAINT_pBWHPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BWHPROrec1tree:=s;
if s^.ls^.cat=BWHPRO then
BWHPROrec1:=s^.ls^.BWHPROfield^
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
s:=BWHPROrec1tree;
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
  s:=MAKET_Stree(WHPRO);
  WHPRO_rec1:=s^.ls^.WHPROfield;
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
        WHPRO_rec1^ :=  COPYT_bwhprotowhpro(BWHPROrec1)
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comBwhProToWhPro:=result
end;
{:BwhProToWhPro}


{rule:}
{:WhproToPossadj}
FUNCTION comWhproToPossadj(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BWHPROrec1tree:LSSTREE_pstree;
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
   BWHPROrec1:LSDOMAINT_BWHPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    POSSADJ_rec1:LSDOMAINT_pPOSSADJrecord;
    BWHPRO_rec1:LSDOMAINT_pBWHPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BWHPROrec1tree:=s;
if s^.ls^.cat=BWHPRO then
BWHPROrec1:=s^.ls^.BWHPROfield^
else match:=false;
skip
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
begin{createoutputtree}
s:=BWHPROrec1tree;
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
  s:=MAKET_Stree(POSSADJ);
  POSSADJ_rec1:=s^.ls^.POSSADJfield;
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
      IF BWHPROrec1.number = singular THEN
        BEGIN
        IF (SFCATrec1.key = SFKpossadjwiens) then
            if (BWHPROrec1.sexes = [masculine]) THEN
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
        IF (SFCATrec1.key = SFKpossadjwier) then
            if (BWHPROrec1.sexes = [feminine]) THEN
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
      IF BWHPROrec1.number = plural THEN
        BEGIN
        IF (SFCATrec1.key = SFKpossadjwier) then
            if (BWHPROrec1.sexes = [masculine,feminine]) THEN
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
        POSSADJ_rec1^.mood :=  wh;
        POSSADJ_rec1^.reduced :=  false;
        POSSADJ_rec1^.eORenForm :=  NoForm;
        POSSADJ_rec1^.geni :=  false
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comWhproToPossadj:=result
end;
{:WhproToPossadj}


{rule:}
{:DemproToPossadj}
FUNCTION comDemproToPossadj(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
DEMPROrec1tree:LSSTREE_pstree;
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
   DEMPROrec1:LSDOMAINT_DEMPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    POSSADJ_rec1:LSDOMAINT_pPOSSADJrecord;
    DEMPRO_rec1:LSDOMAINT_pDEMPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
DEMPROrec1tree:=s;
if s^.ls^.cat=DEMPRO then
DEMPROrec1:=s^.ls^.DEMPROfield^
else match:=false;
skip
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
begin{createoutputtree}
s:=DEMPROrec1tree;
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
  s:=MAKET_Stree(POSSADJ);
  POSSADJ_rec1:=s^.ls^.POSSADJfield;
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
    IF (SFCATrec1.key = SFKpossadjdiens) then
        if (DEMPROrec1.sexes = [masculine]) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        POSSADJ_rec1^.mood :=  declxpmood;
        POSSADJ_rec1^.reduced :=  false;
        POSSADJ_rec1^.eORenForm :=  NoForm;
        POSSADJ_rec1^.geni :=  false
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comDemproToPossadj:=result
end;
{:DemproToPossadj}


{rule:}
{:BDetToDet1}
FUNCTION comBDetToDet1(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BDETrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BDETrec1:LSDOMAINT_BDETrecord;
    DET_rec1:LSDOMAINT_pDETrecord;
    BDET_rec1:LSDOMAINT_pBDETrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BDETrec1tree:=s;
if s^.ls^.cat=BDET then
BDETrec1:=s^.ls^.BDETfield^
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
s:=BDETrec1tree;
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
  s:=MAKET_Stree(DET);
  DET_rec1:=s^.ls^.DETfield;
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
        DET_rec1^ :=  COPYT_bdettodet(BDETrec1);
        DET_rec1^.eORenForm :=  NoForm
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comBDetToDet1:=result
end;
{:BDetToDet1}


{rule:}
{:BDetToDet2}
FUNCTION comBDetToDet2(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BDETrec1tree:LSSTREE_pstree;
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
   BDETrec1:LSDOMAINT_BDETrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    DET_rec1:LSDOMAINT_pDETrecord;
    BDET_rec1:LSDOMAINT_pBDETrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BDETrec1tree:=s;
if s^.ls^.cat=BDET then
BDETrec1:=s^.ls^.BDETfield^
else match:=false;
skip
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
begin{createoutputtree}
s:=BDETrec1tree;
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
  s:=MAKET_Stree(DET);
  DET_rec1:=s^.ls^.DETfield;
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
      IF (SFCATrec1.key = SFKeDet) then
          if (BDETrec1.eFormation = regeFormation) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          DET_rec1^ :=  COPYT_bdettodet(BDETrec1);
          DET_rec1^.eORenForm :=  eForm
          end
        END;
      IF (SFCATrec1.key = SFKenDet) then
          if (BDETrec1.enFormation = true) THEN
        BEGIN
        if success then againsuccess:=true;
        downcount:=downcount-1;
        if downcount=0 then
          begin
          success:=true;
          level:=3;
          createoutputtree(s);
          DET_rec1^ :=  COPYT_bdettodet(BDETrec1);
          DET_rec1^.eORenForm :=  enForm
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
comBDetToDet2:=result
end;
{:BDetToDet2}


{rule:}
{:Bindefprotoindefpro1}
FUNCTION comBindefprotoindefpro1(Is1:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BINDEFPROrec1tree:LSSTREE_pstree;
   mu1,mu2,mu3,mu4,mu5:LSSTREE_pRelNode;
   s:LSSTREE_pStree;
   hulpint:INTEGER;
   hulpstree:LISTREE_pStree;
   Is:LISTREE_pStree;
   s1:LSSTREE_pStree;
   match,success,againsuccess:BOOLEAN;
   downcount,numberofsuccesses,level:INTEGER;
   result:LISTREE_SetOfStrees;
   BINDEFPROrec1:LSDOMAINT_BINDEFPROrecord;
    INDEFPRO_rec1:LSDOMAINT_pINDEFPROrecord;
    BINDEFPRO_rec1:LSDOMAINT_pBINDEFPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BINDEFPROrec1tree:=s;
if s^.ls^.cat=BINDEFPRO then
BINDEFPROrec1:=s^.ls^.BINDEFPROfield^
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
s:=BINDEFPROrec1tree;
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
  s:=MAKET_Stree(INDEFPRO);
  INDEFPRO_rec1:=s^.ls^.INDEFPROfield;
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
        INDEFPRO_rec1^ :=  COPYT_bindefprotoindefpro(BINDEFPROrec1);
        INDEFPRO_rec1^.geni :=  false
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comBindefprotoindefpro1:=result
end;
{:Bindefprotoindefpro1}


{rule:}
{:Bindefprotoindefpro2}
FUNCTION comBindefprotoindefpro2(Is1,Is2:LISTREE_pStree)
                                 :LISTREE_SetOfStrees;
var
BINDEFPROrec1tree:LSSTREE_pstree;
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
   BINDEFPROrec1:LSDOMAINT_BINDEFPROrecord;
   SFCATrec1:LSDOMAINT_xxkeyrecord;
    INDEFPRO_rec1:LSDOMAINT_pINDEFPROrecord;
    BINDEFPRO_rec1:LSDOMAINT_pBINDEFPROrecord;
procedure modelproc1(s:LSSTREE_pStree;var match:BOOLEAN);
var
   rs:LSSTREE_pRelNode;
begin {modelproc1}
match:=true;
BINDEFPROrec1tree:=s;
if s^.ls^.cat=BINDEFPRO then
BINDEFPROrec1:=s^.ls^.BINDEFPROfield^
else match:=false;
skip
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
begin{createoutputtree}
s:=BINDEFPROrec1tree;
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
  s:=MAKET_Stree(INDEFPRO);
  INDEFPRO_rec1:=s^.ls^.INDEFPROfield;
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
    IF (SFCATrec1.key = SFKgens) then
        if (BINDEFPROrec1.possgeni = true) THEN
      BEGIN
      if success then againsuccess:=true;
      downcount:=downcount-1;
      if downcount=0 then
        begin
        success:=true;
        level:=2;
        createoutputtree(s);
        INDEFPRO_rec1^ :=  COPYT_bindefprotoindefpro(BINDEFPROrec1);
        INDEFPRO_rec1^.geni :=  true
        end
      END;
    skip
    end;
  Is:=loopholes.retype(s,LISTREE_pStree);
  if success then LISTREE_appendstree(Is,result)
  end;
comBindefprotoindefpro2:=result
end;
{:Bindefprotoindefpro2}

