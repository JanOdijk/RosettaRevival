(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Mem
 *  Creation date   :  12-OCT-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

pragma C_include('heap.pf');
Export(Mem);
pragma C_include('mem.pf');
pragma C_include('log.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM Mem;
WITH HEAP, LOG;
WITH LOOPHOLES;

CONST
   MaxStacks = 10;

TYPE
   WhichSide  = (Top, Bottom);
   StackList  = ARRAY[1..MaxStacks] OF RECORD
                                          side  : WhichSide;
                                          free  : BOOLEAN;
                                          stack : POINTER;
                                          stacksize  : INTEGER;
                                          ptr   : ARRAY [WhichSide] OF INTEGER
                                       END;
VAR 
   MainList : StackList;
   Done     : BOOLEAN;
   defstack : Mem_Stack;
   alignment: INTEGER;


PROCEDURE Mem_Init;
VAR
   j : INTEGER;
BEGIN
   FOR j := 1 TO MaxStacks DO BEGIN
      MainList[j].free := TRUE
   END;
   defstack := -1;
   alignment := SIZEOF(INTEGER);
   Done := TRUE;
END {Mem_Init};


PROCEDURE Mem_CreateStack(VAR stackid : Mem_Stack;
                          stacksize : INTEGER);
VAR
   j     : INTEGER;
   found : BOOLEAN;
   newstacksize : INTEGER;
BEGIN
   j := 0; found := FALSE;
   WHILE (j < MaxStacks) AND (NOT found) DO BEGIN
      j := j+1;
      found := MainList[j].free
   END;
   IF found THEN BEGIN
      Done := TRUE;
      newstacksize := (((stacksize-1) div SIZEOF(INTEGER))+1) * SIZEOF(INTEGER);
      MainList[j].stack := Malloc(newstacksize);
      MainList[j].stacksize := newstacksize;
      MainList[j].ptr[Top]  := 0;
      MainList[j].ptr[Bottom]  := newstacksize;
      MainList[j].free := FALSE;
      MainList[j].side := Top;
      stackid := j
      END
   ELSE BEGIN
      LOG_Write('Maximum number of stacks exceeded ', 34, 0);
      Done := FALSE;
      stackid := -1 
   END;
END {Mem_CreateStack};


PROCEDURE Mem_ReleaseStack(stackid : Mem_Stack);
BEGIN
   IF (0 < stackid) AND (stackid <= MaxStacks) THEN BEGIN
      Done := TRUE;
      Free(MainList[stackid].stack);
      MainList[stackid].free := TRUE
      END
   ELSE BEGIN
      LOG_Write('Illegal stack identification ', 29, stackid);
      Done := FALSE;
   END;
END {Mem_ReleaseStack};


PROCEDURE Mem_SetDefault(stackid : Mem_Stack);
BEGIN
   IF ((0 < stackid) AND (stackid <= MaxStacks)) THEN BEGIN
      defstack := stackid;
      Done := TRUE
      END
   ELSE BEGIN
      LOG_Write('Illegal stack identification ', 29, stackid);
      Done := FALSE;
   END;
END {Mem_SetDefault};


PROCEDURE Mem_Mark(stackid  : Mem_Stack;
                            VAR stackptr : Mem_StackPtr);
BEGIN
   IF ((0 < stackid) AND (stackid <= MaxStacks)) THEN BEGIN
      stackptr.ptr := MainList[stackid].ptr[Mainlist[stackid].side];
      stackptr.sid := stackid;
      Done := TRUE
      END
   ELSE BEGIN
      LOG_Write('Illegal stack identification ', 29, stackid);
      Done := FALSE;
   END;
END {Mem_Mark};


PROCEDURE Mem_Release(stackid  : Mem_Stack;
                               stackptr : Mem_StackPtr);
BEGIN
   IF ((0 < stackid) AND (stackid <= MaxStacks)) AND
      ( stackptr.sid = stackid ) THEN BEGIN
      IF (0 <= stackptr.ptr ) AND ( stackptr.ptr <= MainList[stackid].stacksize)
         THEN BEGIN
         MainList[stackid].ptr[MainList[stackid].side] := stackptr.ptr;
         Done := TRUE
         END
      ELSE BEGIN
         LOG_Write('Illegal stack ptr', 29, stackptr.ptr);
         Done := FALSE
      END
      END
   ELSE BEGIN
      LOG_Write('Illegal stack identification ', 29, stackid);
      Done := FALSE;
   END;
END {Mem_Release};


PROCEDURE Mem_MarkDefault(VAR stackptr : Mem_StackPtr);
BEGIN
   IF (defstack <> -1) THEN BEGIN
      stackptr.ptr := MainList[defstack].ptr[MainList[defstack].side];
      stackptr.sid := defstack;
      Done := TRUE
      END
   ELSE BEGIN
      LOG_Write('Default stack not set ', 29, defstack);
      Done := FALSE;
   END;
END {Mem_MarkDefault};


PROCEDURE Mem_ReleaseDefault(stackptr : Mem_StackPtr);
BEGIN
   IF ( defstack <> -1) AND
      ( stackptr.sid = defstack ) THEN BEGIN
      IF (0 <= stackptr.ptr ) AND ( stackptr.ptr <= MainList[defstack].stacksize)
         THEN BEGIN
         MainList[defstack].ptr[MainList[defstack].side] := stackptr.ptr;
         Done := TRUE
         END
      ELSE BEGIN
         LOG_Write('Illegal stack ptr', 29, stackptr.ptr);
         Done := FALSE
      END
      END
   ELSE BEGIN
      LOG_Write('Illegal stack identification ', 29, defstack);
      Done := FALSE;
   END;
END {Mem_ReleaseDefault};


PROCEDURE Mem_New(stackid  : Mem_Stack;
                           bytes    : INTEGER;
                           VAR ptr  : Mem_Ptr);
VAR
   alignedsize : INTEGER;
   side        : WhichSide;
BEGIN
   IF (0 < stackid) AND (stackid <= MaxStacks) THEN BEGIN
      IF Mem_Avail(stackid, bytes) THEN BEGIN
         alignedsize := (((bytes-1) div alignment) + 1) * alignment;
         side := MainList[stackid].side;
         IF side = Top THEN BEGIN
            ptr := MainList[stackid].ptr[side] + MainList[stackid].stack;
            MainList[stackid].ptr[side] := MainList[stackid].ptr[side] + alignedsize;
            END
         ELSE BEGIN
            MainList[stackid].ptr[side] := MainList[stackid].ptr[side] - alignedsize;
            ptr := MainList[stackid].ptr[side] + MainList[stackid].stack;
         END;
         Done := TRUE
         END
      ELSE BEGIN
         LOG_Write('Insufficient free stack space ', 30, 
                    MainList[stackid].stacksize - bytes);
         Done := FALSE;
      END;
      END
   ELSE BEGIN
      LOG_Write('Illegal stack identification ', 29, stackid);
      Done := FALSE;
   END;
END {Mem_New};


PROCEDURE Mem_NewDefault(bytes    : INTEGER;
                                  VAR ptr  : Mem_Ptr);
VAR
   alignedsize : INTEGER;
   side        : WhichSide;
BEGIN
   IF ( defstack <> -1 ) THEN BEGIN
      IF Mem_AvailDefault(bytes) THEN BEGIN
         alignedsize := (((bytes-1) div alignment) + 1) * alignment;
         side := MainList[defstack].side;
         IF side = Top THEN BEGIN
            ptr := MainList[defstack].ptr[side] + MainList[defstack].stack;
            MainList[defstack].ptr[side] := MainList[defstack].ptr[side] + alignedsize;
            END
         ELSE BEGIN
            MainList[defstack].ptr[side] := MainList[defstack].ptr[side] - alignedsize;
            ptr := MainList[defstack].ptr[side] + MainList[defstack].stack;
         END;
         Done := TRUE
         END
      ELSE BEGIN
         LOG_Write('Insufficient free stack space ', 30, 
                    MainList[defstack].stacksize - bytes);
         Done := FALSE;
      END;
      END
   ELSE BEGIN
      LOG_Write('Default stack has not been set ', 31, defstack);
      Done := FALSE;
   END;
END {Mem_NewDefault};


FUNCTION Mem_Avail(stackid : Mem_Stack;
                            bytes : INTEGER): BOOLEAN;
VAR
   alignedsize : INTEGER;
BEGIN
   IF (0 < stackid) AND (stackid <= MaxStacks) THEN BEGIN
      alignedsize := (((bytes-1) div alignment) + 1) * alignment;
      IF (MainList[stackid].ptr[Top] + alignedsize) <= MainList[stackid].ptr[Bottom]
         THEN BEGIN
         Mem_Avail := TRUE
         END
      ELSE BEGIN
         Mem_Avail := FALSE
      END
      END
   ELSE BEGIN
      LOG_Write('Illegal stack identification ', 29, stackid);
      Mem_Avail := FALSE
   END;
END {Mem_Avail};


FUNCTION Mem_AvailDefault(bytes : INTEGER): BOOLEAN;
VAR
   alignedsize : INTEGER;
BEGIN
   IF (defstack <> -1 ) THEN BEGIN
      alignedsize := (((bytes-1) div alignment) + 1) * alignment;
      IF (MainList[defstack].ptr[Top] + alignedsize) <= MainList[defstack].ptr[Bottom]
         THEN BEGIN
         Mem_AvailDefault := TRUE
         END
      ELSE BEGIN
         Mem_AvailDefault := FALSE
      END
      END
   ELSE BEGIN
      LOG_Write('Default stack has not been set', 31, defstack);
      Mem_AvailDefault := FALSE
   END;
END {Mem_AvailDefault};


PROCEDURE Mem_TopDefault;
BEGIN
   IF (defstack <> -1 ) THEN BEGIN
      MainList[Defstack].side := Top;
      Done := TRUE
      END
   ELSE BEGIN
      LOG_Write('Default stack has not been set', 31, defstack);
      Done := FALSE
   END;
END {Mem_TopDefault};


PROCEDURE Mem_BottomDefault;
BEGIN
   IF (defstack <> -1 ) THEN BEGIN
      MainList[Defstack].side := Bottom; 
      Done := TRUE
      END
   ELSE BEGIN
      LOG_Write('Default stack has not been set', 31, defstack);
      Done := FALSE
   END;
END {Mem_BottomDefault};


FUNCTION Mem_IsTopDefault: BOOLEAN;
BEGIN
   IF (defstack <> -1 ) THEN BEGIN
      Mem_IsTopDefault := MainList[Defstack].side = Top;
      Done := TRUE
      END
   ELSE BEGIN
      LOG_Write('Default stack has not been set', 31, defstack);
      Mem_IsTopDefault := FALSE;
      Done := FALSE
   END;
END {Mem_TopDefault};


PROCEDURE Mem_Top(stackid : Mem_Stack);
BEGIN
   IF (0 < stackid) AND (stackid <= MaxStacks) THEN BEGIN
      MainList[stackid].side := Top;
      Done := TRUE
      END
   ELSE BEGIN
      LOG_Write('Illegal stack identification ', 29, stackid);
      Done := FALSE;
   END;
END {Mem_Top};


PROCEDURE Mem_Bottom(stackid : Mem_Stack);
BEGIN
   IF (0 < stackid) AND (stackid <= MaxStacks) THEN BEGIN
      MainList[stackid].side := Bottom;
      Done := TRUE
      END
   ELSE BEGIN
      LOG_Write('Illegal stack identification ', 29, stackid);
      Done := FALSE;
   END;
END {Mem_Bottom};


FUNCTION Mem_IsTop(stackid : Mem_Stack): BOOLEAN;
BEGIN
   IF (0 < stackid) AND (stackid <= MaxStacks) THEN BEGIN
      Mem_IsTop := MainList[stackid].side = Top;
      Done := TRUE
      END
   ELSE BEGIN
      LOG_Write('Illegal stack identification ', 29, stackid);
      Mem_IsTop := FALSE;
      Done := FALSE;
   END;
END {Mem_Top};


FUNCTION Mem_Done: BOOLEAN;
BEGIN
   Mem_Done := TRUE {Done}
END {Mem_Done};


PROCEDURE Mem_CopyDefault(source   : Mem_Ptr;
                                   bytes  : INTEGER;
                                   VAR dest : Mem_Ptr);
TYPE
   pCHAR       = ^CHAR;
VAR
   j,
   alignedsize : INTEGER;
   side        : WhichSide;
   s, d        : pCHAR;
BEGIN
   IF ( defstack <> -1 ) THEN BEGIN
      IF Mem_AvailDefault(bytes) THEN BEGIN
         alignedsize := (((bytes-1) div alignment) + 1) * alignment;
         side := MainList[defstack].side;
         IF side = Top THEN BEGIN
            dest := MainList[defstack].ptr[side] + MainList[defstack].stack;
            MainList[defstack].ptr[side] := MainList[defstack].ptr[side] + alignedsize;
            END
         ELSE BEGIN
            MainList[defstack].ptr[side] := MainList[defstack].ptr[side] - alignedsize;
            dest := MainList[defstack].ptr[side] + MainList[defstack].stack;
         END;
         FOR j := 1 TO alignedsize DO BEGIN
            d := Retype(dest+j-1, pChar);
            s := Retype(source+j-1, pChar);
            d^ := s^
         END;
         Done := TRUE
         END
      ELSE BEGIN
         LOG_Write('Insufficient free stack space ', 30, 
                    MainList[defstack].stacksize - bytes);
         Done := FALSE;
      END;
      END
   ELSE BEGIN
      LOG_Write('Default stack has not been set ', 31, defstack);
      Done := FALSE;
   END;
END {Mem_CopyDefault};



