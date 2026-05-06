(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : RECTOSCREEN
 *  Creation date   :  18-FEB-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(RECTOSCREEN);
pragma C_include('wnd.pf');
pragma C_include('files.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('strtokey.pf');
pragma C_include('error.pf');
pragma C_include('mem.pf');
pragma C_include('listree.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('ldgetkey.pf');
pragma C_include('globsubst.pf');
pragma C_include('loop.pf');
pragma C_include('drawstree.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('rectoscreen.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM RECTOSCREEN;
WITH FILES, WND, STR, STRNG, STRTOKEY, ERROR, MEM, LISTREE, LDCATSETS,
     LDGETKEY, GLOBSUBST, LOOP, DRAWSTREE, LDCONVREC;

CONST
   MaxAttrSetSize     = 20;
   { for file writing only : }
   MaxFieldNameLength = 15;
   FileWidth          = 80;

TYPE ATTR_INFO = RECORD
                     t        : LDCONVREC_pAttrStruct;
                     start_id : WND_Did;
                     end_id   : WND_Did;
                     node     : LISTREE_pStree;
                     isvar    : Boolean;
                 END;

VAR info_array : array [0..MAX_SCREENS -1] of ATTR_INFO;


FUNCTION FromScreen(VAR t  : LDCONVREC_pAttrStruct; screen_nr : integer): BOOLEAN;
VAR
    isvar,
    correct    : BOOLEAN;

    PROCEDURE Pass1;
    VAR
        i, n_val   : INTEGER;
        dummy      : String_string;
        attrvalues : array [1..MaxAttrSetSize] of String_String;
        id         : WND_Xid;

    FUNCTION CheckValue (str : String_String) : BOOLEAN;
    VAR ok : BOOLEAN;
        i  : INTEGER;
    BEGIN
        ok := TRUE;
        FOR i := 1 to LENGTH(str) DO BEGIN
            ok := ok and ( str[i] in  ['a'..'z', 'A'..'Z', '0'..'9', '_'] );
        END;
        CheckValue := ok;
    END;

    BEGIN
        FOR id := info_array[screen_nr].start_id TO info_array[screen_nr].end_id DO
        BEGIN
            WND_GetAttrValues ( id, dummy, attrvalues, n_val );
            FOR i := 1 to n_val DO BEGIN
                correct := correct and CheckValue (attrvalues[i]);
	    END
        END;
        IF NOT correct THEN Error_Write(Error_IncorrectNode);
    END {Pass1};


    PROCEDURE Pass2;

    VAR last_attr    : LDCONVREC_pAttrStruct;
        last_set_elt : LDCONVREC_pSetValueType; 
        n_strs, i,
        intkey       : INTEGER;
        name         : String_String;
        attrvalues   : array [1..MaxAttrSetSize] of String_String;
        attrids      : array [1..MaxAttrSetSize] OF WND_Did;
        count,
        nrids        : INTEGER;
        complex,
        forget       : Boolean;
        id           : WND_Xid;

    PROCEDURE MakeAttr;
    VAR h: LDCONVREC_pAttrStruct;
    BEGIN
        Mem_NewDefault(LoopHoles.SizeOf(LDCONVREC_AttrStruct), 
                       LoopHoles.Retype(h,Mem_ptr));
        WITH h^ DO BEGIN
            SetValue := NIL;
            NextAttr := NIL;
        END;
        IF last_attr = NIL THEN BEGIN
            t := h;
        END
        ELSE BEGIN
            last_attr^.NextAttr := h;            
        END;
        last_attr := h;
    END {MakeAttr};

    PROCEDURE MakeSetElt;
    VAR h: LDCONVREC_pSetValueType;
    BEGIN
        Mem_NewDefault(LoopHoles.SizeOf(LDCONVREC_SetValueType), 
                       LoopHoles.Retype(h,Mem_ptr));
        WITH h^ DO BEGIN
            NextValue := NIL;
        END;
        IF last_set_elt = NIL THEN BEGIN
            last_attr^.setvalue := h;
        END
        ELSE BEGIN
            last_set_elt^.NextValue := h;            
        END;            
        last_set_elt := h;
    END {MakeSetElt};

    BEGIN
        last_attr := info_array[screen_nr].t;
        t := last_attr;
        WND_GetAttrChanged (WND_CodeKey(X_attr_area,screen_nr),attrids,nrids);
        count := 1;
        IF nrids > 0 THEN	
        FOR id := info_array[screen_nr].start_id TO info_array[screen_nr].end_id DO
        BEGIN
            IF attrids[count] = id THEN BEGIN
               count := count+1;
               complex := FALSE;
	       {
               MakeAttr;
               }
               WND_GetAttrValues (id, name, attrvalues, n_strs);
               last_attr^.fieldname.str := name;
               last_attr^.fieldname.len := LENGTH (last_attr^.fieldname.str);
               IF last_attr^.fieldname.str[last_attr^.fieldname.len] = ']' THEN BEGIN
                   { the string was postfixed with ' []', see ToScreen }
                   complex := TRUE;
                   last_attr^.fieldname.len := last_attr^.fieldname.len - 3;
                   set_length (last_attr^.fieldname.str, last_attr^.fieldname.len);
               END;
	       IF complex THEN BEGIN
                   last_attr^.Typeindicator := EnumSet;
                   last_set_elt := NIL;
                   last_attr^.setvalue := NIL;
                   FOR i := 1 to n_strs DO BEGIN
                       IF attrvalues[i] <> '' THEN BEGIN
                           MakeSetElt;
                           last_set_elt^.eltvalue.str := attrvalues[i];
                           last_set_elt^.eltvalue.len :=
                                    LENGTH(last_set_elt^.eltvalue.str);
                       END
                   END
               END
	       ELSE BEGIN
                   last_attr^.Typeindicator := Strin;
                   last_attr^.fieldvalue.str := attrvalues[1];
                   IF NOT isvar AND ( last_attr^.fieldname.str = 'KEY' ) THEN BEGIN
                       IF StrToKey_GetSkey(attrvalues[1], intkey) THEN BEGIN
                           forget := Str_IntegerToStr (intkey, last_attr^.fieldvalue.str,
                                                       last_attr^.fieldvalue.len);
                       END;
                   END;
                   last_attr^.fieldvalue.len := LENGTH(last_attr^.fieldvalue.str);
               END;
	    END;
            last_attr := last_attr^.NextAttr;
        END;
    END {Pass2};

BEGIN
    isvar := info_array[screen_nr].isvar;
    correct := TRUE;
    {
    Pass1;
    }
    IF correct THEN BEGIN 
        Pass2
    END;
    FromScreen := correct
END {FromScreen};


PROCEDURE ToScreen(editable : Boolean; isvar : Boolean;
                   screen_nr : integer);

VAR
    t         : LDCONVREC_pAttrStruct;
    s         : LDCONVREC_pSetValueType;
    name      : String_String;
    i, n_elts : INTEGER;
    sa        : array [1..MaxAttrSetSize] of String_String;
    complex,
    first_attr: Boolean;
    stringkey : String_String;
    key       : INTEGER;
    id        : WND_Did;
BEGIN
    t := info_array[screen_nr].t;
    WND_StartAttr (WND_CodeKey(X_attr_area, screen_nr));
    info_array[screen_nr].start_id := 1;
    info_array[screen_nr].end_id := 0;
    first_attr := TRUE;
    WHILE ( t <> NIL ) DO BEGIN
        name := t^.Fieldname.Str;
        IF t^.Typeindicator = EnumSet THEN BEGIN
            complex := TRUE;
            String_Append (name, ' []');
            s := t^.SetValue;
            i := 1;
            WHILE s <> NIL DO BEGIN
               sa[i] := s^.EltValue.Str;
               s := s^.NextValue;
               i := i + 1;
            END;
            n_elts := i - 1;
        END 
        ELSE BEGIN
            complex := FALSE;
            n_elts := 1;
            sa[1] := t^.FieldValue.Str;
            IF NOT isvar AND ( t^.FieldName.Str = 'KEY' ) THEN BEGIN
                IF Str_StrToInteger(sa[1], LENGTH(sa[1]), key) THEN BEGIN
                    IF StrToKey_GetSkeyStr(key, stringkey) THEN BEGIN
                        sa[1] := stringkey;
                    END;
                END;
            END;
        END;
        id := WND_GetNextDid;
        info_array[screen_nr].end_id := id;
        IF first_attr THEN BEGIN
            info_array[screen_nr].start_id := id;
            first_attr := FALSE;
        END;
        WND_SetAttr (id, name, complex, editable, sa, n_elts);
        t := t^.NextAttr;
    END;
    WND_EndAttr (WND_CodeKey(X_attr_area, screen_nr));

END {ToScreen};


PROCEDURE ToFile(screen_nr : integer);
VAR
    t             : LDCONVREC_pAttrStruct;
    s             : LDCONVREC_pSetValueType;
    FileName      : FILES_NameBuffer;
    f             : FILES_Text;
    NumberOfLines : INTEGER; 
    keys          : array [1..2] of WND_Xid;
    key           : WND_Xid;
    stop          : Boolean;
BEGIN
    t := info_array[screen_nr].t;
    WND_Clear(X_file_window);
    WND_Manage(X_file_window, WND_CodeKey (X_attr_window, screen_nr));
    keys[1] := X_file_ok_button;
    keys[2] := X_file_cancel_button;
    WND_SetKeys (X_file_window, keys);
    stop := FALSE;
    WHILE not stop DO BEGIN
        WND_GetKey (key);
        IF key = X_file_ok_button THEN BEGIN
            WND_GetString (X_file_window, FileName);
            IF FileName = '' THEN BEGIN
                WND_RingBell(1);
            END
            ELSE BEGIN
                FILES_Open(f, FileName, Length(FileName), 3);
     
                IF NOT FILES_Done THEN BEGIN
{
                    ERROR_Write(ERROR_ErrorInFileName)
}
                END
                ELSE BEGIN
                    NumberOfLines := 0;
                    WHILE ( t <> NIL ) DO BEGIN
        	        NumberOfLines := NumberOfLines + 1;
        	        FILES_WriteStr(f, t^.Fieldname.Str, t^.Fieldname.Len,
        		               MaxFieldNameLength, TRUE);
        	        FILES_WriteStr(f, ' : ', 3, 3, TRUE);
        	        IF t^.Typeindicator = EnumSet THEN BEGIN
        	            FILES_WriteStr(f, '[ ', 2, 2, TRUE);
        	            s := t^.SetValue;
        	            WHILE s <> NIL DO BEGIN
        		        IF (( FILES_Position(f) + s^.EltValue.len + 2 ) 
        		            > FileWidth) THEN BEGIN
        		            FILES_WriteLine(f, TRUE);
        		            NumberOfLines := NumberOfLines + 1;
        		            FILES_WriteSpace(f, Maxfieldnamelength + 6);
        		        END;
        		        FILES_WriteStr(f, s^.EltValue.Str, s^.EltValue.Len, 
        			       	       S^.EltValue.Len+1, TRUE);
        		        s := s^.NextValue
        	            END;
        	            FILES_WriteChar(f, ']');
        	        END 
        	        ELSE BEGIN
        	            FILES_WriteStr(f, t^.FieldValue.Str, t^.FieldValue.Len,
        			  	   t^.FieldValue.Len, TRUE);
        	        END;
        	        FILES_WriteLine(f, TRUE);
        	        t := t^.NextAttr
                    END;
                END;      
                FILES_Close(f);
                stop := TRUE;
            END;
        END
        ELSE BEGIN
            stop := TRUE
        END;
    END;

    WND_UnManage(X_file_window);

END {ToFile};


PROCEDURE RECTOSCREEN_Write(t  : LDCONVREC_pAttrStruct);
VAR
   screen_nr : integer;
   window_id : WND_Xid;
   keys     : array [1..2] of WND_Xid;
BEGIN

   IF WND_GetFreeScreenNr (WND_Attr, screen_nr) THEN BEGIN
      window_id := WND_CodeKey (X_attr_window, screen_nr);
      WND_Fetch ( window_id );
      info_array[screen_nr].t := t;
      IF info_array[screen_nr].t = nil THEN BEGIN
         ERROR_Write (ERROR_NoAttributes);
         WND_FreeScreenNr (WND_Attr, screen_nr);
      END
      ELSE BEGIN
         ToScreen( FALSE, FALSE {?????}, screen_nr);
         WND_Manage (window_id, Loop_LastExpanded);
         keys[1] := WND_CodeKey (X_attr_ok_button, screen_nr);
         keys[2] := WND_CodeKey (X_attr_tofile_button, screen_nr);
         WND_SetKeys (window_id, keys);
      END;
   END;
END {RECTOSCREEN_Write};


PROCEDURE RECTOSCREEN_WriteStree(node : LISTREE_pStree);
VAR
   isvar           : BOOLEAN;
   vtree           : LISTREE_pStree;
   keys            : array [1..3] of WND_Xid;
   screen_nr,
   dummy           : integer;
   window_id       : WND_Xid;
BEGIN
   IF WND_GetFreeScreennr (WND_Attr, screen_nr) THEN BEGIN
      isvar := LDCATSets_VarCatSet(node^.cat);
      IF isvar THEN BEGIN
         vtree := GlobSubst_Get(LDGETKEY_Get(node));
         IF vtree <> NIL THEN BEGIN
            dummy := DrawStree_Manage (vtree, Loop_LastExpanded);
         END
         ELSE BEGIN
            isvar := FALSE;
         END;
      END;
      info_array[screen_nr].isvar := isvar;
      info_array[screen_nr].node  := node;
      window_id := WND_CodeKey (X_attr_window, screen_nr);
      WND_Fetch ( window_id );
      info_array[screen_nr].t := LDCONVREC_GetAttrbs(node);
      IF info_array[screen_nr].t = nil THEN BEGIN
         ERROR_Write (ERROR_NoAttributes);
         WND_FreeScreenNr (WND_Attr, screen_nr);
      END
      ELSE BEGIN
         ToScreen( TRUE, isvar, screen_nr);
         WND_Manage (window_id, Loop_LastExpanded);
         keys[1] := WND_CodeKey (X_attr_ok_button, screen_nr);
         keys[2] := WND_CodeKey (X_attr_tofile_button, screen_nr);
         keys[3] := WND_CodeKey (X_attr_confirm_button, screen_nr);
         WND_SetKeys (window_id, keys);
      END
   END
END {RECTOSCREEN_WriteStree};

PROCEDURE RECTOSCREEN_HandleKey ( key : WND_Xid );
VAR keys       : array [1..1] of WND_Xid;
    simple_key : WND_Xid;
    screen_nr  : integer;
    status     : BOOLEAN;
    temp_t     : LDCONVREC_pAttrStruct;
BEGIN
   WND_DecodeKey ( key, simple_key, screen_nr);
   CASE simple_key OF
   X_attr_ok_button :
       BEGIN
           WND_FreeScreenNr (WND_Attr, screen_nr);
           WND_DestroyAttr (WND_CodeKey (X_attr_area, screen_nr));
           WND_Unmanage (WND_CodeKey (X_attr_window, screen_nr));
       END;
   X_attr_tofile_button :
       BEGIN
           ToFile (screen_nr);
       END;
   X_attr_confirm_button :
       BEGIN
           keys[1] := key;
           WND_UnsetKeys (keys);
           temp_t := NIL;
           status := FromScreen(temp_t, screen_nr);
           IF status THEN BEGIN
               status := LDCONVREC_GetNode(temp_t, info_array[screen_nr].node);
               IF status THEN BEGIN
                   info_array[screen_nr].t := temp_t
               END
               ELSE BEGIN
                   Error_Write(Error_InCorrectNode)
               END
           END;
           WND_SetKeys (WND_CodeKey (X_attr_window, screen_nr), keys);
       END;    
   END;

END; {RECTOSCREEN_HandleKey}
