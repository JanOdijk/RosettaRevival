/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : CISAM.H
 *  Creation date   : 15-FEB-1991
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : This module performs effective file I/O
 *                    by the use of C-ISAM routines.
 *
 *EMP:::===================================================================*/

/*=========================================================================*
 *  Imported modules
 *=========================================================================*/
#ifndef _CISAM_H
#define _CISAM_H

#include <sys/types.h>
#include "isam.h"
#include "paspar.h"

/*MPC:::===================================================================*
 *
 *  Constant name  : CISAM_MaxKeys
 *  Description    : Maximum amount of keys to be used for one indexed file
 *
 *EMP:::===================================================================*/

#define CISAM_MaxKeys    8

/*MPC:::===================================================================*
 *
 *  Constant name  : CISAM_DefaultIndex
 *  Description    : The default index to be used by CISAM_SetIndex
 *                   Minimum = 1 , Maximum = CISAM_MaxKeys 
 *EMP:::===================================================================*/

#define CISAM_DefaultIndex   1

/*MPC:::===================================================================*
 *
 *  Constant name  : CISAM_MaxTimeWait
 *  Description    : The maximum time in seconds a record read, write
 *                   update or delete will for the specified record
 *                   to unlock, before aborting the command
 *
 *EMP:::===================================================================*/

#define CISAM_MaxTimeWait    255

/*MPC:::===================================================================*
 *
 *  Constant name  : CISAM_FileNameSize
 *  Description    : The maximum length of a filename
 *
 *EMP:::===================================================================*/

#define CISAM_FileNameSize   255

/*MPC:::===================================================================*
 *
 *  Constant name  : 'user defined errors constants'
 *  Description    : The integer error codes used in cisam_integerstatus
 *                   correspond to error messages. These error messages
 *                   come from different files.
 *
 *                   code      description           file
 *
 *                   0         OK
 *                   1-99      system errors         errno.h
 *                   100-149   isam errors           isam.h
 *                   200-...   user-defined errors   cisam.h
 *EMP:::===================================================================*/

#define CISAM_PRECOND   	200  /* Precondition does not apply */
#define CISAM_LENGTH    	201  /* Parameter out of range */
#define CISAM_FILELOCK  	202  /* File locked */

/*MPT:::===================================================================*
 *
 *  Type name      : CISAM_KeyRange
 *  Description    : The range in which the amount of defined keys has to be
 *
 *EMP:::===================================================================*/

typedef int   CISAM_KeyRange;       /*  0..CISAM_MaxKeys  !!! */

/*MPT:::===================================================================*
 *
 *  Type name      : CISAM_TimeOutRange
 *  Description    : The time a read, write, update or delete will
 *                   wait to finish before aborting.(in seconds)
 *                   (-1 means : an infinite time)
 *
 *EMP:::===================================================================*/

typedef int   CISAM_TimeOutRange;   /* -1..CISAM_MaxTimeWait  !!! */

/*MPT:::===================================================================*
 *
 *  Type name      : CISAM_StatusType
 *  Description    : Status returned by CISAM_OwnStatus
 *
 *EMP:::===================================================================*/

typedef enum {
    CISAM_NoError,
    CISAM_LengthOutOfRange,
    CISAM_PreconditionError,
     
    CISAM_Error,
    CISAM_EndOfFile,
    CISAM_RecordNotFound,
    CISAM_FileNotFound,
    CISAM_RecordLocked,
    CISAM_FileLocked
}
CISAM_StatusType;

/*MPT:::===================================================================*
 *
 *  Type name      : CISAM_Sort
 *  Description    : The way a key is sorted
 *
 *EMP:::===================================================================*/

typedef enum { 
    CISAM_Up, 
    CISAM_Down
}
CISAM_Sort;

/*MPT:::===================================================================*
 *
 *  Type name      : CISAM_AccessMode
 *  Description    : The way a record will be accessed.
 *
 *EMP:::===================================================================*/

typedef enum { 
    CISAM_Sequential, 
    CISAM_Indexed
}
CISAM_AccessMode;

/*MPT:::===================================================================*
 *
 *  Type name      : CISAM_DuplicateKeys
 *  Description    : specifies if a key may have duplicates or not.
 *
 *EMP:::===================================================================*/

typedef enum {
    CISAM_Duplicate, 
    CISAM_NoDuplicate
}
CISAM_DuplicateKeys;

/*MPT:::===================================================================*
 *
 *  Type name      : CISAM_AccessType
 *  Description    : The type of operations on the opened file
 *
 *EMP:::===================================================================*/

typedef enum {
    CISAM_Inp,
    CISAM_Out,
    CISAM_IO
}
CISAM_AccessType;

/*MPT:::===================================================================*
 *
 *  Type name      : CISAM_KeyType
 *  Description    : The type of an allowed key
 *
 *EMP:::===================================================================*/

typedef enum {
    CISAM_String,
    CISAM_Value
}
CISAM_KeyType;

/*MPT:::===================================================================*
 *
 *  Type name      : CISAM_Age
 *  Description    : Defines if it is a new or an old file
 *
 *EMP:::===================================================================*/

typedef enum {
    CISAM_New, 
    CISAM_Old
}
CISAM_Age;

/*MPT:::===================================================================*
 *
 *  Type name      : CISAM_FileNameRange
 *  Description    : The range for the filename length
 *
 *EMP:::===================================================================*/

typedef int   CISAM_FileNameRange;  /*  0..CISAM_FileNameSize !!! */

/*MPT:::===================================================================*
 *
 *  Type name      : CISAM_FileDescription
 *  Description    : A variable of this type contains all the 
 *                   information needed to access the corresponding file.
 *                  !! This structure should be considered hidden !!
 *
 *EMP:::===================================================================*/

typedef struct {
    char                         *p_filename;
    int                          isfd;
    caddr_t                      varaddress;
    int                          varsize;
    CISAM_AccessMode             accessmode;
    CISAM_AccessType             accesstype;
    struct keydesc               *p_keys[CISAM_MaxKeys];
    int                          nrofkeys;
    int                          currentindex;
    Boolean                      takecurrentfornext;
    Boolean                      filesharing;
    CISAM_TimeOutRange           timeout;
    Boolean                      readlockless;
    Boolean                      lastrecordlocked;
    Boolean                      recordlocking;
}
CISAM_FileDescription;

/*MPT:::===================================================================*
 *
 *  Type name      : CISAM_FileType
 *  Description    : A variable of this type connects a file to
 *                   a process
 *
 *EMP:::===================================================================*/

typedef CISAM_FileDescription     *CISAM_FileType;


/*MPT:::===================================================================*
 *  Type name      : CISAM_Time
 *  Description    : structure used to store absolute time
 *
 *EMP:::===================================================================*/

typedef time_t                    CISAM_Time;

/*MPT:::===================================================================*
 *  Type name      : CISAM_CompareResult
 *  Description    : t1 before t2 = CISAM_earlier
 *                   t1 at t2     = CISAM_same
 *                   t1 after t2  = CISAM_later
 *
 *EMP:::===================================================================*/

typedef enum {
    CISAM_earlier,
    CISAM_same,
    CISAM_later
}
CISAM_CompareResult;


/*MPF:::===================================================================*
 *
 *  Function Name  : CISAM_InitFile
 *  Description    : This function will create and initialize the internal
 *                   file-structure according to the inputs and some defaults.
 *  Result         : a variable of the type CISAM_FileType 
 *  Precondition   : The file is not yet opened.
 *  Postcondition  : The new filedescriptor contains filename and
 *                   accessmode and is connected to the variable
 *  Side Effects   : The filedescriptor contains a pointer to the variable !
 *
 *EMP:::===================================================================*/

extern CISAM_FileType FUNCDEF (
cisam_initfile, ( PPC_string          *p_filename,
                  CISAM_FileNameRange lengthfilename,
                  caddr_t             variableaddress,
                  int                 variablesize,
                  CISAM_AccessMode    accessmode));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_Open
 *  Description     : This procedure will try to open a file.
 *                    If the file is new, creation will also take place.
 *                    The keys defined for a new file between initialization
 *                    and opening will all be physically added to the file
 *                    (being numbered starting from 1) and the first defined
 *                    key (primary) will be actuated. 
 *                    If CISAM_FileSharing was called between initialization
 *                    and opening or the file is opened for input only,
 *                    the file is not locked for output.
 * Precondition     : CISAM_InitFile has been called (after the last call to
 *                    CISAM_Close, i.e. for every opening of a file the
 *                    initialization has to take place).
 *                    If the file has indexed access, at least one key
 *                    (the primary key) has been defined between 
 *                    initialization and opening. 
 *                    For old indexed files the set of defined keys must
 *                    be a subset of the set of keys defined on creation.
 *                    If the file has sequential access, no keys have been
 *                    defined.
 *                    If the file-age is 'old', the file should be present
 *                    (.dat), and its index-definition file also (.idx).
 *  Postcondition   : The file corresponding with the descriptor
 *                    has been opened. Keys are added and the primary key is
 *                    actuated.
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_open, (CISAM_FileType    filedescriptor,
             CISAM_AccessType  accesstype,
             CISAM_Age         neworold));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_Close
 *  Description     : This procedure closes a file and clears the
 *                    filedescriptor-structure. This structure cannot
 *                    be used anymore afterwards.
 *                    The key-references will be lost, so before opening
 *                    a file again, the keys must be defined again.
 *  Precondition    : The file linked with the filedescriptor is opened.
 *  Postcondition   : The file linked with the filedescriptor is closed
 *                    and the file-descriptor-structure is empty.
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_close, ( CISAM_FileType  filedescriptor ));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_DefineKey
 *  Description     : This procedure defines a (new) key for a file. It
 *                    sets up the linkage between a key-description and
 *                    its number, used by the CISAM_SetIndex-procedure.
 *                    The order of calling this procedure for one file with
 *                    different keys determines the order of the keys, giving
 *                    them a number starting from 1 ( the first being the
 *                    primary key).
 *                    The physical adding of the key takes place on opening
 *                    a new file, keys for old files must already exist.
 *  Precondition    : The file has been initialized for indexed access, 
 *                    not yet opened.
 *  Postcondition   : A new key definition has been added to the file and the
 *                    link to its number has been made.
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_definekey, ( CISAM_FileType       filedescriptor,
                   int                  keyposition,
                   int                  keysize,
                   CISAM_KeyType        keytype,
                   CISAM_DuplicateKeys  duplicates,
                   CISAM_Sort           sorting));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_ReadByKey
 *  Description     : This procedure reads the (first) record for which
 *                    the key (= current index) equals the given searchkey
 *                    value.
 *                    The contents of the SearchKeyAddress gives this value.
 *                    This record is returned in the variable connected
 *                    to the file. The size of the record is also returned
 *                    (, this is however a constant since C-ISAM only
 *                    handles fixed length records !).
 *                    To prevent the abortion of the reading of locked
 *                    records, a time-out period given by the CISAM_TimeOut
 *                    procedure is used to wait for the record to unlock
 *                    (the default time-out period is infinite).
 *                    The read causes a lock itself if the file was opened
 *                    for output. If readlock has been disabled, no time-out
 *                    period applies. The lock is then only tried once, and if
 *                    this fails, the errorcode is set but the read is still
 *                    executed.
 *  Precondition    : The file must be opened for indexed access (thus
 *                    a current index will be set).
 *                    SearchKeySize = FileDescriptor.
 *                       Keys[FileDescriptor.CurrentIndex].k_part[0].kp_leng
 *  Postcondition   : The first record with the specified key has been
 *                    returned in the variable connected to the file,
 *                    and NewSize contains it size.
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_readbykey, ( CISAM_FileType       filedescriptor,
                   int                  *p_newsize,
                   caddr_t              searchkeyaddress,
                   int                  searchkeysize));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_ReadByValue
 *  Description     : See CISAM_ReadByKey.
 *                    Not the address and the size of the searchkey are
 *                    given but its integer value only.
 *  Precondition    : The file must be opened for indexed access (thus
 *                    a current index will be set).
 *  Postcondition   : The first record with the specified key has been
 *                    returned in the variable connected to the file,
 *                    and NewSize contains it size.
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_readbyvalue, ( CISAM_FileType       filedescriptor,
                     int                  *p_newsize,
                     int                  searchvalue));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_ReadByString
 *  Description     : See CISAM_ReadByKey.
 *                    Not the address and the size of the searchkey are
 *                    given but its string value (array + size).
 *  Precondition    : The file must be opened for indexed access (thus
 *                    a current index will be set).
 *                    KeySize = SIZE (SearchString) and
 *                    KeySize = FileDescriptor.
 *                       Keys[FileDescriptor.CurrentIndex].k_part[0].kp_leng
 *  Postcondition   : The first record with the specified key has been
 *                    returned in the variable connected to the file,
 *                    and NewSize contains it size.
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_readbystring, ( CISAM_FileType       filedescriptor,
                      int                  *p_newsize,
                      PPC_string           *p_searchstring,
                      int                  keysize));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_ReadNext
 *  Description     :  This procedure reads the next record within the
 *                     current index.
 *                     This record is returned in the variable connected
 *                     to the file.
 *                     The size of the record is returned (,this is however
 *                     a constant since C-ISAM only handles fixed length 
 *                     records !).
 *                     To prevent the abortion of the reading of locked
 *                     records, a time-out period given by the CISAM_TimeOut
 *                     procedure is used to wait for the record to unlock
 *                     (the default time-out period is infinite).
 *                     The read causes a lock itself if the file was opened
 *                     for output. If readlock has been disabled, no time-out
 *                     period applies. The lock is then only tried once, and
 *                     if this fails, the errorcode is set but the read is
 *                     still executed.
 *                     The next record is always determined by the previous
 *                     call to an ISAM-procedure:
 *          - After CISAM_Open, CISAM_SetIndex or CISAM_Reset the next
 *            record will be the first record within the current index.
 *          - After CISAM_Read..., CISAM_Write, CISAM_Update or
 *            CISAM_Delete the record following the handled record within the
 *            current index will be the next record.
 *  Precondition    : The file must be opened (thus a current index will 
 *                    be set).
 *  Postcondition   : The next record has been read and placed in the 
 *                    variable.
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_readnext, ( CISAM_FileType       filedescriptor,
                  int                  *p_newsize));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_Write
 *  Description     : This procedure inserts the record present in the
 *                    variable belonging to the file at its proper place. 
 *                    For indexed files this will be ordered by the primary
 *                    key, and for sequential files this will be at the end.
 *  Precondition    : The file has been opened.
 *                    NewSize = FileDescriptor.VariableSize
 *  Postcondition   : The record with size NewSize is inserted
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_write, ( CISAM_FileType       filedescriptor,
               int                  newsize));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_Update
 *  Description     : This procedure updates the current record with the
 *                    value present in the variable attached to the file.
 *                    This record is the last handled record in a previous
 *                    ISAM-call.
 *  Precondition    : The file has been opened.
 *                    An CISAM_Read.... has to preceed this procedure.
 *                    NewSize = FileDescriptor.VariableSize
 *                    The current record is locked.
 *  Postcondition   : The last read record has been updated.
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_update, ( CISAM_FileType       filedescriptor,
                int                  newsize));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_Delete
 *  Description     : This procedure deletes the current record. 
 *                    This record is the last handled record in a previous
 *                    ISAM-call.
 *  Precondition    : The file has been opened.
 *                    An CISAM_Read.... has to preceed this procedure.
 *                    NewSize = FileDescriptor.VariableSize
 *                    The current record is locked.
 *  Postcondition   : The last read record has been deleted.
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_delete, ( CISAM_FileType        filedescriptor));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_SetIndex
 *  Description     : This procedure changes the current index.
 *                    The linkage between the integer and the index depends
 *                    on the calls to CISAM_DefineKey.
 *                    If Index = 0 the default index is taken (primary key).
 *                    The current record pointer is put before the beginning
 *                    of the first record according to the new index.
 *  Precondition    : The file has been opened for indexed access. (This
 *                    condition does not apply to the call coming from
 *                    CISAM_open, because the dummy sequential key must
 *                    be set).
 *                    The file has been initialized for indexed access.
 *  Postcondition   : Current Index = Index 
 *                    If the new index doesn't exist, the index will not
 *                    change
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_setindex, ( CISAM_FileType        filedescriptor,
                  CISAM_KeyRange        index));

/*MPF:::===================================================================*
 *
 *  Function Name  : CISAM_OwnStatus
 *  Description    : This function transforms the C-ISAM error code resulting
 *                   from the last called ISAM-routine into an
 *                   CISAM_StatusType.
 *  Result         : CISAM_StatusType
 *  Precondition   : At least one ISAM routine has been called.
 *  Postcondition  : The resulting statustype is set.
 *
 *EMP:::===================================================================*/

extern CISAM_StatusType FUNCDEF (
cisam_ownstatus, (void));

/*MPF:::===================================================================*
 *
 *  Function Name  : CISAM_IntegerStatus
 *  Description    : This function returns the C-ISAM error code resulting
 *                   from the last called ISAM-routine.
 *  Result         : int
 *  Precondition   : At least one ISAM routine has been called.
 *  Postcondition  : The resulting integer is set.
 *
 *EMP:::===================================================================*/

extern int FUNCDEF (
cisam_integerstatus, (void));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_FileSharing
 *  Description     : This procedure can be called to specify which 
 *                    access options may be shared with other users
 *                    (on opening the file).
 *  Precondition    : The file has been initialized but not yet opened.
 *                    SharedAccess = {CISAM_inp, CISAM_out}
 *  Postcondition   : On opening the file the specified shared access
 *                    options will be possible.
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_filesharing, ( CISAM_FileType    filedescriptor,
                     CISAM_AccessType  sharedaccess));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_TimeOut
 *  Description     : This procedure can be called to specify the maximum 
 *                    time (in seconds) a record access routine will try
 *                    to lock a record before aborting the routine.
 *                    If a value of -1 is specified, the time out period will
 *                    be infinite (this also is the default value).
 *  Precondition    : The file has been initialized.
 *  Postcondition   : All record I/O routines of the specified FileDescriptor
 *                    will have a timeout of <WaitTime> seconds.
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_timeout, ( CISAM_FileType      filedescriptor,
                 CISAM_TimeOutRange  waittime));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_Release
 *  Description     : This procedure can be called to explicitly release 
 *                    all the records of a file locked because of a call
 *                    to CISAM_Update or CISAM_Delete.
 *                    If no locking-problems occur, this function is
 *                    superfluous.
 *  Precondition    : The file is opened.
 *  Postcondition   : No record is locked by the FileDescriptor
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_release, ( CISAM_FileType      filedescriptor));

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_Reset
 *  Description     : This procedure can be called to rewind the current 
 *                    record pointer before the beginning of the first
 *                    record (according to the current key).
 *  Precondition    : The file is opened
 *  Postcondition   : Next element is the first element of the file
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_reset, ( CISAM_FileType      filedescriptor));


/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_DisableReadLock
 *  Description     : This procedure can be called to set the read mode.
 *                    If a file has been opened for output, every read
 *                    will also try to lock the record (for a period defined
 *                    by the time-out). If, however, this function has been
 *                    called, the record lock will only be tried once. If that
 *                    does not work, the record is read without lock.
 *                    Mind that an update or delete is not allowed if the
 *                    record was not locked. Another important side-effect
 *                    is the setting of the error status to RecordLocked,
 *                    even if the record was read without lock.
 *  Precondition    : The file is initialized but not yet opened
 *  Postcondition   : The file has been set to a read lock disable mode.
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_disablereadlock, ( CISAM_FileType      filedescriptor));
 

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_RevisionDate
 *  Description     : Returns the revision date and time in the absolute
 *                    representation
 *  Precondition    :
 *  Postcondition   : IFF file was found AND RevisionDate is revision 
 *                    date of the file 
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
cisam_revisiondate, ( PPC_string          *p_filename,
                      CISAM_FileNameRange lengthfilename,
                      Boolean             *p_found,
                      CISAM_Time          *p_revisiondate ));

/*MPF:::===================================================================*
 *
 *  Function Name  : CISAM_CompareDate
 *  Description    : compares two absolute times
 *                   returns CISAM_same if the times are equal
 *                   returns CISAM_earlier if the first time is earlier
 *                   returns CISAM_later if the first time is later
 *
 *EMP:::===================================================================*/

extern CISAM_CompareResult FUNCDEF (
cisam_comparedate, ( CISAM_Time   time1,
                     CISAM_Time   time2 ));

/*MPF:::===================================================================*
 *
 *  Function Name  : CISAM_NewestDate
 *  Description    : returns the newest date in the system
 *
 *EMP:::===================================================================*/

extern CISAM_Time FUNCDEF (
cisam_newestdate, (void));

/*MPF:::===================================================================*
 *
 *  Function Name  : CISAM_OldestDate
 *  Description    : returns the oldest date in the system
 *
 *EMP:::===================================================================*/

extern CISAM_Time FUNCDEF (
cisam_oldestdate, (void));


#endif /* _CISAM_H */
