(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Oldtree
 *  Creation date   :  9-FEB-1987
 *  Author          : J.Stevens
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Used to process data used by DrawTree
 *
 *EMP:::===================================================================*)

pragma C_Include('strings.pf');
Export(OLDTREE);
pragma C_include('windows.pf');
pragma C_include('wnd.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('strtokey.pf');
pragma C_include('strtomkey.pf');
pragma C_include('listree.pf');
pragma C_include('superdtree.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('hiltree.pf');
pragma C_include('ldmrules.pf');
pragma C_include('ldtypetostr.pf');
pragma C_include('globdef.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('rectoscreen.pf');
pragma C_include('liilrules.pf');
pragma C_include('mem.pf');
pragma C_include('error.pf');
pragma C_include('loop.pf');
pragma C_include('oldtree.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM OldTree;

WITH STRINGS, WND, STR, STRNG, STRTOKEY, STRTOMKEY, LISTREE, SUPERDTREE,
     HYPERDTREE, HILTREE, LDMRULES, LDTYPETOSTR, GLOBDEF, LDCONVREC,
     RECTOSCREEN, LIILRULES, MEM, ERROR, LOOP, WINDOWS;

TYPE pHyp = ^Hyp;
     Hyp = RECORD
                liilp : LIILRULES_LIParameters;
                ldmp  : LDMRULES_LIParameters;
                Id    : WND_Xid;
                Next  : pHyp;
            END;

VAR Hyp_list       : pHyp;
    Temp_dev       : WINDOWS_Device;
    Is_HIL_type    : Boolean;

FUNCTION AddHyp: pHyp;
VAR hyp_elem : pHyp;
BEGIN
    Mem_NewDefault(LoopHoles.SizeOf(Hyp), LoopHoles.Retype(hyp_elem,Mem_ptr));
    hyp_elem^.Id := WND_GetNextDid;
    hyp_elem^.Next := Hyp_list;
    Hyp_list := hyp_elem;
    AddHyp := hyp_elem;
END;

FUNCTION SearchpHyp (hyp_id : WND_Xid) : pHyp;
VAR hyp_elem  : pHyp;
    found : Boolean;
BEGIN
    hyp_elem := Hyp_list;
    found := FALSE;
    WHILE (not found) and (hyp_elem <> nil) DO
    BEGIN
        IF hyp_elem^.Id = hyp_id THEN found := TRUE
                                 ELSE hyp_elem := hyp_elem^.Next;
    END;
    SearchpHyp := hyp_elem;    
END;

FUNCTION HyperDtreeAttributes(OldNode: OLDTREE_OldTree; screen_nr : integer): Boolean;

VAR
   hnc   : HyperDtree_SetOFHNECluster;
   hns   : HyperDtree_SetOfHyperNodeElt;
   hn    : HyperDtree_pHyperNodeElt;
   IsRule   : Boolean;
   sgname   : STRING(40);
   len      : INTEGER;
   forget   : Boolean;
   strkey   : String_String;
   valeu    : array [1..1] of String_String;
   length   : STR_Range;
   hyp_elem : pHyp;
BEGIN {HyperDtreeAttributes}
   IsRule := Oldnode.HyperDtree^.arg^.IsRuleNode;
   hnc := Oldnode.HyperDtree^.arg^.Elts;

   WND_StartAttr (WND_CodeKey (X_hn_area, screen_nr));

   WHILE (NOT HyperDtree_IsEmptyClusterSet(hnc)) DO BEGIN
      HyperDtree_TakeCluster(hns, hnc);
      WHILE (NOT HyperDtree_IsEmptyNode(hns)) DO BEGIN
	 HyperDtree_TakeFromNode(hn, hns);
	 IF IsRule THEN BEGIN
	    LDMRULES_SubgrammarName(hn^.sg, sgname, len);
	    LDMRULES_RuleName(hn^.sg, hn^.R, valeu[1], len);
            hyp_elem := AddHyp;
            hyp_elem^.ldmp := hn^.parameters;
            WND_SetAttr ( hyp_elem^.Id, sgname, FALSE, FALSE, valeu, 1 );
	 END
	 ELSE BEGIN
	    IF Oldnode.HyperDtree^.arg^.BasicNodeKind = HyperDtree_BasicNode THEN BEGIN
	       IF StrToKey_GetSkeyStr(hn^.key, strkey) 
	          THEN valeu[1] := strkey
	          ELSE forget := STR_IntegerToStr (hn^.key, valeu[1], length);
               hyp_elem := AddHyp;
               hyp_elem^.ldmp := hn^.parameters;
               WND_SetAttr (hyp_elem^.Id, 'Basic Expression', FALSE, FALSE, valeu, 1);
	    END
	    ELSE BEGIN
               hyp_elem := AddHyp;
               hyp_elem^.ldmp := hn^.parameters;
               forget := STR_IntegerToStr(hn^.index, valeu[1], length);
               WND_SetAttr (hyp_elem^.Id, 'Variable', FALSE, FALSE, valeu, 1);
	    END;
	 END
      END;
   END;
   WND_EndAttr (WND_CodeKey (X_hn_area, screen_nr));
   HyperDtreeAttributes := IsRule;

END {HyperDtreeAttributes};


FUNCTION HILtreeAttributes(OldNode: OLDTREE_OldTree; screen_nr : integer): Boolean;
VAR
   hns   : HILtree_SetOfHyperNodeElt;
   hn    : HILtree_pHyperNodeElt;
   h     : HILtree_LoHyperILtree;
   arg   : HILtree_HyperILtree;
   n     : HILtree_HyperNodeElt;
   IsRule   : Boolean;
   len      : INTEGER;
   strkey   : String_String;
   valeu    : array [1..1] of String_String;
   length   : STR_Range;
   forget   : Boolean;
   hyp_elem : pHyp;
BEGIN {HILtreeAttributes}
   HILtree_LoadLoHyperILtree(OldNode.HyperILtree, h);
   HILtree_LoadHyperILtree(h.arg, arg);
   IsRule := arg.IsRuleNode;
   hns := arg.Elts;

   WND_StartAttr (WND_CodeKey(X_hn_area, screen_nr));

   WHILE (NOT HILtree_IsEmptyNode(hns)) DO BEGIN
      HILtree_TakeFromNode(hn, hns);
      HILtree_LoadHyperNodeElt(hn, n);
      IF IsRule THEN BEGIN
         LIILRULES_RuleName(n.R, valeu[1], len);
         hyp_elem := AddHyp;
         hyp_elem^.liilp := n.parameters;
         WND_SetAttr (hyp_elem^.Id, 'Rule', FALSE, FALSE, valeu, 1);
      END
      ELSE BEGIN
         IF arg.BasicNodeKind = HILtree_BasicNode THEN BEGIN
            IF StrToMKey_GetMkeyStr(n.key, strkey) 
	       THEN valeu[1] := strkey
	       ELSE forget := STR_IntegerToStr(n.key, valeu[1], length);
            hyp_elem := AddHyp;
            hyp_elem^.liilp := n.parameters;
            WND_SetAttr (hyp_elem^.Id, 'Basic Expression', FALSE, FALSE, valeu, 1);
         END
         ELSE BEGIN
            hyp_elem := AddHyp;
            hyp_elem^.liilp := n.parameters;
            forget := STR_IntegerToStr ( n.index, valeu[1], length);
            WND_SetAttr (hyp_elem^.Id, 'Variable', FALSE, FALSE, valeu, 1);
         END;
      END;
   END;
   WND_EndAttr (WND_CodeKey(X_hn_area, screen_nr));
   HILtreeAttributes := IsRule;
END {HILtreeAttributes};


PROCEDURE HandleHypers (OldNode : OLDTREE_OldTree);
VAR
   screen_nr  : integer;
   window_id  : WND_Xid;
   keys       : array [1..2] of WND_Xid;
   IsRule     : Boolean;
BEGIN
   IF WND_GetFreeScreenNr (WND_Hn, screen_nr) THEN BEGIN
      window_id := WND_CodeKey (X_hn_window, screen_nr);
      WND_Fetch ( window_id );
      IF Is_HIL_type THEN
          IsRule := HILtreeAttributes(OldNode, screen_nr)
      ELSE
          IsRule := HyperDtreeAttributes(OldNode, screen_nr);
   
      keys[1] := WND_CodeKey (X_hn_ok_button, screen_nr); 
      IF IsRule THEN
          keys[2] := - WND_CodeKey (X_hn_attr_button, screen_nr)
      Else
          keys[2] := X_undefined;
      WND_Manage (window_id, Loop_LastExpanded);
      WND_SetKeys (window_id, keys);
   END;
END;


PROCEDURE OldTree_Initialize;
BEGIN
    Hyp_list := nil;
END;

FUNCTION OldTree_SonPresent(OldNode : OLDTREE_OldTree)
                  : BOOLEAN;
VAR
   h   : HILTREE_LoHyperILtree;
   arg : HILTREE_HyperILtree;
BEGIN {OldTree_SonPresent}
   CASE OldNode.TreeType OF
      OLDTREE_Stree : OldTree_SonPresent:=(OldNode.STree^.node^.sons<>NIL);
      OLDTREE_SuperDtree : CASE OldNode.SuperDTree^.it.cur^.it^.nodeKind OF
                      SuperDtree_basicNode : OldTree_SonPresent:= FALSE;
                      SuperDtree_varNode   : OldTree_SonPresent:= FALSE;
                      SuperDtree_ruleNode  : OldTree_SonPresent:=
                                    (OldNode.SuperDTree^.it.cur^.it^.args.first<>NIL)
                      END;
      OLDTREE_HyperDtree : OldTree_SonPresent:=
                                    (OldNode.HyperDtree^.arg^.IsRuleNode);
      OLDTREE_HyperILtree : 
            BEGIN
               HILTREE_LoadLoHyperILtree(OldNode.HyperILtree, h);
               HILTREE_LoadHyperILtree(h.arg, arg);
               OldTree_SonPresent:=(arg.IsRuleNode)
            END
   END {CASE}
END {OldTree_SonPresent};


FUNCTION OldTree_RightNeighbourPresent(OldNode : OLDTREE_OldTree)
                  : BOOLEAN;
VAR
   h   : HILTREE_LoHyperILtree;
BEGIN {OldTree_RightNeighbourPresent}
   CASE OldNode.TreeType OF
      OLDTREE_STree : OldTree_RightNeighbourPresent:=(OldNode.STree^.brother<>NIL);
      OLDTREE_SuperDtree : OldTree_RightNeighbourPresent:=(OldNode.SuperDTree^.next<>NIL);
      OLDTREE_HyperDtree : Oldtree_RightNeighbourPresent:=
                                    (OldNode.HyperDtree^.next <> NIL);
      OLDTREE_HyperILtree : 
            BEGIN
               HILTREE_LoadLoHyperILtree(OldNode.HyperILtree, h);
               Oldtree_RightNeighbourPresent:=(h.next <> HNIL)
            END
   END {CASE}
END {OldTree_RightNeighbourPresent};


FUNCTION OldTree_Down(OldNode : OLDTREE_OldTree)
                  : OLDTREE_OldTree;
VAR TempNode : OLDTREE_OldTree;
   h   : HILTREE_LoHyperILtree;
   arg : HILTREE_HyperILtree;
BEGIN {OldTree_Down}
   CASE OldNode.TreeType OF
      OLDTREE_STree : BEGIN
                      TempNode.TreeType:=OLDTREE_STree;
                      TempNode.STree:=OldNode.STree^.node^.sons;
                      END;
      OLDTREE_SuperDTree : BEGIN
                      TempNode.TreeType:=OLDTREE_SuperDTree;
                      TempNode.SuperDTree:= OldNode.SuperDTree^.it.cur^.it^.args.first
                      END;
      OLDTREE_HyperDtree : BEGIN
                      TempNode.Treetype:=OLDTREE_HyperDtree;
                      TempNode.HyperDtree:=OldNode.HyperDtree^.arg^.args.first
                      END;
      OLDTREE_HyperILtree : 
            BEGIN
               HILTREE_LoadLoHyperILtree(OldNode.HyperILtree, h);
               HILTREE_LoadHyperILtree(h.arg, arg);
               TempNode.Treetype:=OLDTREE_HyperILtree;
               TempNode.HyperILtree:=arg.args.first
            END
   END {CASE};
   OLDTREE_Down:=TempNode;
END {OldTree_Down};


FUNCTION OldTree_Right(OldNode : OLDTREE_OldTree)
                  : OLDTREE_OldTree;
VAR TempNode : OLDTREE_OldTree;
     h   : HILTREE_LoHyperILtree;
BEGIN {OldTree_Right}
   CASE OldNode.TreeType OF
      OLDTREE_STree : BEGIN
                      TempNode.TreeType:=OLDTREE_STree;
                      TempNode.STree:=OldNode.STree^.brother;
                      END;
      OLDTREE_SuperDTree : BEGIN
                      TempNode.TreeType:=OLDTREE_SuperDTree;
                      TempNode.SuperDTree:= OldNode.SuperDtree^.next
                      END;
      OLDTREE_HyperDTree : BEGIN
                      TempNode.TreeType:=OLDTREE_HyperDTree;
                      TempNode.HyperDTree:= OldNode.HyperDtree^.next
                      END;
      OLDTREE_HyperILtree : 
            BEGIN
               HILTREE_LoadLoHyperILtree(OldNode.HyperILtree, h);
               TempNode.TreeType:=OLDTREE_HyperILTree;
               TempNode.HyperILtree:= h.next
            END   
      END {CASE};
   OLDTREE_Right:=TempNode;
END {OldTree_Right};


PROCEDURE OLDTREE_GetRelation(OldNode : OLDTREE_OldTree;
                                       VAR Relation : STRING;
                                       VAR Length   : INTEGER);
VAR
    LocRel   : STR_String;
    Len      : Str_Range;
    h   : HILTREE_LoHyperILtree;
    arg : HILTREE_HyperILtree;
    strlength : Str_Range;
BEGIN {OLDTREE_GetRelation}
   CASE OldNode.TreeType OF
      OLDTREE_STree : BEGIN
			LDTYPETOSTR_Rel(LocRel, Len, Oldnode.Stree^.relation);
			IF STR_Compare(LocRel, Len, 'LIREL0', 6) = 0 THEN BEGIN
			   STR_Extract(Relation, strLength, 'root', 4, 1, 4);
			   END
			ELSE BEGIN
			   STR_Extract(Relation, strLength, LocRel, Len, 1, Len);
			END;
                      END;
      OLDTREE_SuperDTree :    {use relation field for subgrammar name}
                      CASE OldNode.SuperDTree^.it.cur^.it^.nodeKind OF
                      SuperDtree_basicNode : Str_Extract(Relation, strlength, 
                                                         'basic expr', 10, 1, 10);
                      SuperDtree_varNode   : LDTYPETOSTR_Cat (Relation, strLength,
                                            Oldnode.SuperDtree^.it.cur^.it^.varType);
                      SuperDtree_ruleNode  :  BEGIN
                                            LDMrules_SubgrammarName (
                                            Oldnode.SuperDtree^.it.cur^.it^.sg,
                                            Relation,Length); 
                                            StrLength := Length
                                            END;
                      END;
      OLDTREE_HyperDtree :    {use relation field for subgrammar name}
                      IF OldNode.HyperDtree^.arg^.IsRuleNode THEN BEGIN
                         Str_Extract(Relation, strlength, 'Rule Node', 9, 1, 9);
                         END
                      ELSE BEGIN
                         IF (Oldnode.HyperDtree^.arg^.BasicNodeKind =
                             HyperDtree_BasicNode)
                         THEN Str_Extract(Relation, strlength, 'Basic Node', 10, 1,  10)
                         ELSE Str_Extract(Relation, strlength, 'Var Node'  , 8, 1,  8);
                      END;
      OLDTREE_HyperILtree :    {use relation field for subgrammar name}
                  BEGIN
                      HILTREE_LoadLoHyperILtree(OldNode.HyperILtree, h);
                      HILTREE_LoadHyperILtree(h.arg, arg);
                      IF arg.IsRuleNode THEN BEGIN
                         Str_Extract(Relation, strlength, 'Rule Node', 9, 1, 9);
                         END
                      ELSE BEGIN
                         Str_Extract(Relation, strlength, 'Leaf Node', 9, 1,  9);
                      END;
                  END
   END {CASE};
   Length := StrLength;
END {OLDTREE_GetRelation};



PROCEDURE OLDTREE_GetCategory(OldNode : OLDTREE_OldTree;
                                       VAR Category : STRING;
                                       VAR Length   : INTEGER);
VAR forgetResult : BOOLEAN;
    h      : HILTREE_LoHyperILtree;
    arg    : HILTREE_HyperILtree;
    strkey : String_String;
    stringlength : String_Range;
    strlength : Str_Range;
BEGIN {OLDTREE_GetCategory}
   CASE OldNode.TreeType OF
      OLDTREE_STree : LDTYPETOSTR_Cat(Category, StrLength, Oldnode.Stree^.node^.cat);
      OLDTREE_SuperDTree :    {use category field for rule/transformation name}
                      CASE OldNode.SuperDTree^.it.cur^.it^.nodeKind OF
                      SuperDtree_basicNode : 
            IF StrToKey_GetSkeyStr(Oldnode.SuperDtree^.it.cur^.it^.key, strkey) THEN BEGIN
               String_ExtractChars(Category, StringLength, strkey, 1, 
                                   String_length(strkey));
               StrLength := StringLength;
               END
            ELSE BEGIN
               forgetResult:= Str_IntegerToStr (
                      Oldnode.SuperDtree^.it.cur^.it^.key, Category, StrLength);
            END;
                      SuperDtree_varNode   : forgetResult:= Str_IntegerToStr (
                                            Oldnode.SuperDtree^.it.cur^.it^.index,
                                            Category, StrLength);
                      SuperDtree_ruleNode : forgetResult:= Str_IntegerToStr (
                                            Oldnode.SuperDtree^.it.cur^.it^.R,
                                            Category, StrLength);
{
                      SuperDtree_ruleNode  : BEGIN
                                            LDMrules_RuleName (
                                            Oldnode.SuperDtree^.it.cur^.it^.sg,
                                            Oldnode.SuperDtree^.it.cur^.it^.R,
                                            Category, Length);
                                            StrLength := Length
                                            END; 
}
                      END;
      OLDTREE_HyperDtree :
                      forgetresult := STR_IntegerToStr(
                                      OldNode.HyperDtree^.arg^.Elts.NrOfElts,
                                      Category, StrLength);
      OLDTREE_HyperILtree :
              BEGIN
                 HILTREE_LoadLoHyperILtree(OldNode.HyperILtree, h);
                 HILTREE_LoadHyperILtree(h.arg, arg);
                 forgetresult := STR_IntegerToStr(arg.Elts.NrOfElts,
                                                  Category, StrLength)
              END
   END {CASE};
   Length := StrLength;
END {OLDTREE_GetCategory};

PROCEDURE OLDTREE_NodeAttributes(OldNode : OLDTREE_OldTree);

BEGIN {OLDTREE_NodeAttributes}

   Is_HIL_type := FALSE;                          
   CASE Oldnode.TreeType OF
   OLDTREE_STree: BEGIN
                     RECTOSCREEN_WriteStree(Oldnode.Stree^.node);
                  END;
   OLDTREE_SuperDTree: CASE OldNode.SuperDTree^.it.cur^.it^.nodeKind OF
		   SuperDtree_basicNode : ERROR_Write(ERROR_NoExtraInfo);
		   SuperDtree_varNode   : ERROR_Write(ERROR_NoExtraInfo);
		   SuperDtree_ruleNode  : LDMrules_PrintParameters (
                                          Temp_dev, Oldnode.SuperDtree^.it.cur^.it^.parameters); 
                  END;
   OLDTREE_HyperDtree: BEGIN
                          HandleHypers(OldNode);
                       END;
   OLDTREE_HyperILtree: BEGIN 
                          Is_HIL_type := TRUE;
                          HandleHypers(OldNode);
                        END
   END;
END {OLDTREE_NodeAttributes};

PROCEDURE OLDTREE_HandleKey ( key : WND_Xid );
VAR
   simple_key,
   hyp_id       : WND_Xid;
   screen_nr    : integer;
   hyp_elem     : pHyp;
BEGIN

   WND_DecodeKey ( key, simple_key, screen_nr);
   CASE simple_key OF
   X_hn_ok_button :
       BEGIN
           WND_FreeScreenNr (WND_Hn, screen_nr);
           WND_DestroyAttr (WND_CodeKey (X_hn_area, screen_nr));
           WND_Unmanage (WND_CodeKey (X_hn_window, screen_nr));
       END;
   X_hn_attr_button :
       BEGIN
           WND_GetAttrSelected (WND_CodeKey(X_hn_area, screen_nr), hyp_id);
           IF hyp_id <> X_undefined THEN BEGIN
               hyp_elem := SearchpHyp (hyp_id);
               Loop_SetLastExpanded (WND_CodeKey (X_hn_window, screen_nr));
               IF Is_HIL_type THEN
                  LIILRULES_PrintParameters(Temp_dev, hyp_elem^.liilp)
               ELSE 
                  LDMRULES_PrintParameters(Temp_dev, hyp_elem^.ldmp);
           END
           ELSE BEGIN
               ERROR_Write (ERROR_NoAttrSelected);
           END;
       END;
   END;

END {OLDTREE_HandleKey};
