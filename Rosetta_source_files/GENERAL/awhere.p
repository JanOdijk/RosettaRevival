(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : AWhere
 *  Creation date   :  9-DEC-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(AWHERE);

pragma C_Include('globdef.pf');
pragma C_Include('wnd.pf');
pragma C_Include('awhere.pf');
pragma C_include('converts.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM AWhere;

WITH GLOBDEF, WND, Conversions;

TYPE
   Attention_mode = record
      attention_on : Boolean;
      wind         : WND_Xid;
   end;

VAR
   comp             : GLOBDEF_LevelType;
   attention        : array [0 .. 4] of Attention_mode;
   nrstrees         : INTEGER;
   MParser_string   : String (50);

PROCEDURE AWhere_Init;
BEGIN {AWhere_Init}
IF NOT GlobDef_GetBatchMode THEN BEGIN
   comp := 0;
   attention[0].attention_on := false;
   attention[0].wind := X_mw_alayout_text;
   attention[1].attention_on := false;
   attention[1].wind := X_mw_amorph_text;
   attention[2].attention_on := false;
   attention[2].wind := X_mw_sparser_text;
   attention[3].attention_on := false;
   attention[3].wind := X_mw_mparser_text;
   attention[4].attention_on := false;
   attention[4].wind := X_mw_atrans_text;

(* read string of MParser phase *)

   WND_GetString (X_mw_mparser_text, MParser_string);
END;

END {AWhere_Init};


PROCEDURE AWhere_Component(c: INTEGER);
BEGIN
   IF NOT GlobDef_GetBatchMode THEN BEGIN
      IF (c < 0) or (c > 4) THEN
         writeln ('AWhere_Component: c = ', c);
      IF attention[comp].attention_on then begin
         WND_ToggleAttention (attention[comp].wind);
	 attention[comp].attention_on := false;
      end;
      comp := c;
      WND_ToggleAttention (attention[comp].wind);
      attention[comp].attention_on := true;
   END;
END {AWhere_Component};



PROCEDURE AWhere_NrTreesGet;
Const width = 3;
Var new_string : String (50);
    s          : String (10);
BEGIN
   IF NOT GlobDef_GetBatchMode THEN BEGIN
      IF nrstrees = 0 THEN BEGIN
         WND_SetString (attention[comp].wind, MParser_string);
      END
      ELSE BEGIN
	 (* make room at end of MParser_string for nrstrees; hopefully
            only blanks are removed
         *)
	 new_string := MParser_string;
         Set_length (new_string, Length (new_string) - width - 1);
	 RtoS (real(nrstrees), width, 0, s);
	 new_string := new_string || ' ' || s;
         WND_SetString (attention[comp].wind, new_string);
         nrstrees:=nrstrees-1;
      END
   END;
END {AWhere_NrTreesGet};


PROCEDURE AWhere_NrTreesStore(n: INTEGER);

BEGIN
   nrstrees := n
END {AWhere_NrTreesStore};



PROCEDURE AWhere_Hide;
VAR i : integer;
BEGIN
   IF NOT GlobDef_GetBatchMode THEN BEGIN
      for i := 0 to 4 do begin
          if attention[i].attention_on then begin
              WND_ToggleAttention (attention[comp].wind);
	      attention[comp].attention_on := false;
	  end;
      end;
      WND_UnManage (X_mw_analysis_frame);
   END;
END {AWhere_Hide};


PROCEDURE AWhere_Pop;
BEGIN
   IF NOT GlobDef_GetBatchMode THEN WND_Manage (X_mw_analysis_frame, X_undefined);
END {AWhere_Pop};
