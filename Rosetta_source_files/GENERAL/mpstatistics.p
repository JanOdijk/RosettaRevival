(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : MPStatistics
 *  Creation date   :  2-MAR-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(MPSTATISTICS);
pragma C_include('wnd.pf');
pragma C_include('globdef.pf');
pragma C_include('mpstatistics.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM MPStatistics;
WITH WND, GLOBDEF;

VAR 
   AppliedRules  : INTEGER;
   TriedRules    : INTEGER;
   TreeRules     : INTEGER;
   AppliedFilters: INTEGER;
   TriedFilters  : INTEGER;
   TreeFilters   : INTEGER;
   StartCPU      : INTEGER;
   StopCPU       : INTEGER;

PROCEDURE MPStatistics_Init;
BEGIN
   AppliedRules := 0;
   TriedRules   := 0;
END {MPStatistics_Init};


PROCEDURE MPStatistics_Default;
BEGIN
   AppliedRules := 0;
   TriedRules   := 0;
END {MPStatistics_Default};


PROCEDURE MPStatistics_StoreAppliedRules(i: INTEGER);
BEGIN
   AppliedRules := i
END {StoreAppliedRules};


PROCEDURE MPStatistics_StoreTriedRules(i: INTEGER);
BEGIN
   TriedRules := i
END {StoreTriedRules};


PROCEDURE MPStatistics_StoreTreeRules(i: INTEGER);
BEGIN
   TreeRules := i
END {StoreTreeRules};


PROCEDURE MPStatistics_StoreAppliedFilter(i: INTEGER);
BEGIN
   AppliedFilters := i
END {StoreAppliedFilters};


PROCEDURE MPStatistics_StoreTriedFilter(i: INTEGER);
BEGIN
   TriedFilters := i
END {StoreTriedFilters};


PROCEDURE MPStatistics_StoreTreeFilter(i: INTEGER);
BEGIN
   TreeFilters := i
END {StoreTreeFilters};


PROCEDURE MPStatistics_StartCPUClock;
BEGIN
   StartCPU := 0{CLOCK};
END {MPStatistics_StartCPUClock};


PROCEDURE MPStatistics_StopCPUClock;
BEGIN
   StopCPU := 0{CLOCK};
END {MPStatistics_StopCPUClock};


PROCEDURE MPStatistics_Menu;
VAR
   keys   : array [1..1] of WND_Xid;
   key    : WND_Xid;
BEGIN
   WND_SetInteger (X_mps_appliedrules_text, AppliedRules);
   WND_SetInteger (X_mps_triedrules_text, TriedRules);
   WND_SetInteger (X_mps_treerules_text, TreeRules);
   WND_SetInteger (X_mps_successfilters_text, Appliedfilters);
   WND_SetInteger (X_mps_treefilters_text, Treefilters);
   WND_SetInteger (X_mps_totalfilters_text, Triedfilters);
   WND_SetInteger (X_mps_cpu_text, (StopCPU-StartCPU));

   WND_Manage (X_mps_window, X_undefined);
   keys[1] := X_mps_ok_button;
   WND_SetKeys (X_mps_window, keys);
   WND_GetKey (key);
   WND_Unmanage (X_mps_window);

END {MPStatistics_Menu};


