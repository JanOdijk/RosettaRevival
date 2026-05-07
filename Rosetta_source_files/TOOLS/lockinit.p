pragma C_Include('lilock.pf');
pragma C_include('logname.pf');

PROGRAM LOCKINIT;
WITH LILOCK,LOGNAME;

var
  LogNames: text;

BEGIN
  reset(LogNames,'lognames');
  Logname_Init(LogNames);
  LILOCK_InitLock;
END {LOCKINIT}.
