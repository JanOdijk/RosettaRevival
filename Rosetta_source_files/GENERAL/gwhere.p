(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : GWhere
 *  Creation date   :  9-DEC-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

EXPORT(GWHERE);

pragma C_include('globdef.pf');
pragma C_include('wnd.pf');
pragma C_include('gwhere.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM GWhere;

WITH GLOBDEF, WND;

TYPE
   Attention_mode = record
      attention_on : Boolean;
      wind         : WND_Xid;
   end;

VAR
   comp             : GLOBDEF_LevelType;
   attention        : array [5 .. 9] of Attention_mode;


PROCEDURE GWhere_Init;
BEGIN {GWhere_Init}
IF NOT GlobDef_GetBatchMode THEN BEGIN
   comp := 0;
   attention[5].attention_on := false;
   attention[5].wind := X_mw_gtrans_text;
   attention[6].attention_on := false;
   attention[6].wind := X_mw_mgeneration_text;
   attention[7].attention_on := false;
   attention[7].wind := X_mw_linearizer_text;
   attention[8].attention_on := false;
   attention[8].wind := X_mw_gmorph_text;
   attention[9].attention_on := false;
   attention[9].wind := X_mw_glayout_text;
END;

END {GWhere_Init};


PROCEDURE GWhere_Component(c: INTEGER);

BEGIN
   IF NOT GlobDef_GetBatchMode THEN BEGIN
      IF (c < 5) or (c > 9) THEN
         writeln ('GWhere_Component: c = ', c);
      IF attention[comp].attention_on then begin
         WND_ToggleAttention (attention[comp].wind);
	 attention[comp].attention_on := false;
      end;
      comp := c;
      WND_ToggleAttention (attention[comp].wind);
      attention[comp].attention_on := true;
   END;
END {GWhere_Component};


PROCEDURE GWhere_Hide;
VAR i : integer;
BEGIN
   IF NOT GlobDef_GetBatchMode THEN BEGIN
      for i := 5 to 9 do begin
          if attention[i].attention_on then begin
              WND_ToggleAttention (attention[comp].wind);
	      attention[comp].attention_on := false;
	  end;
      end;
      WND_UnManage (X_mw_generation_frame);
   END;
END {GWhere_Hide};


PROCEDURE GWhere_Pop;
BEGIN
   IF NOT GlobDef_GetBatchMode THEN WND_Manage (X_mw_generation_frame, X_undefined);
END {GWhere_Pop};
