/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : RenameFixid
 *  Creation date   : 15-dec-1992
 *  Author          : Frank Uittenbogaard
 *
 *  Copyright (c) 1992, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : This module renames fixid.fixed. Client: Lexed
 *
 *EMP:::===================================================================*/


/*=========================================================================*
 *  Imported modules
 *=========================================================================*/

#include "gendef.h"
#include "paspar.h"
#include <errno.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "renamefixid.h"
#include "mkkey.h"
#include "logc.h"



/*=========================================================================*
 *  Exported procedure RENAMEFIXID_RenameFixid
 *=========================================================================*/

void RENAME_renamefixid (LanguageNr)
int LanguageNr;
{
   switch (LanguageNr) {
     case 1: 
       rename("/home/leermake/archive/rosetta3/dutch/fixid.fixid",
              "/home/leermake/archive/rosetta3/dutch/fixid.old"); break;
     case 2:
       rename("/home/leermake/archive/rosetta3/english/fixid.fixid",
              "/home/leermake/archive/rosetta3/english/fixid.old"); break;
     case 3:
       rename("/home/leermake/archive/rosetta3/spanish/fixid.fixid",
              "/home/leermake/archive/rosetta3/spanish/fixid.old"); break;
     default: break;
   }
}            /* end of RENAMEFIXID_RenameFixid */


