/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : CISAM.C
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

#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>
#include <memory.h>
#include <limits.h>
#include "gendef.h"
#include "isam.h"
#include "cisam.h"
#include "paspar.h"

static int      Errorcode = 0;

static void FUNCDEF (
timeoutread, (CISAM_FileType  filedescriptor,
              int             readtype));

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

CISAM_FileType cisam_initfile ( p_filename, lengthfilename, variableaddress,
                                variablesize, accessmode )

    PPC_string           *p_filename;
    CISAM_FileNameRange  lengthfilename;
    caddr_t              variableaddress;
    int                  variablesize;
    CISAM_AccessMode     accessmode;

{
    CISAM_FileType      p_descr;
    char                *p_dot;    

    Errorcode = 0;
    p_descr = (CISAM_FileType) malloc (sizeof(CISAM_FileDescription));

    p_descr->p_filename = PPC_to_string (p_filename);
    if ( strlen (p_descr->p_filename) > CISAM_FileNameSize ) {
        Errorcode = CISAM_LENGTH;
        return NULL;
    }
    p_dot = strchr ( p_descr->p_filename, '.' );
    if ( p_dot != NULL ) {
        *p_dot = '\0';
    }
    p_descr->isfd = -1;
    p_descr->varaddress = variableaddress;
    p_descr->varsize = variablesize;
    p_descr->accessmode = accessmode;
    p_descr->nrofkeys = 0;
    p_descr->currentindex = CISAM_DefaultIndex -1;
    p_descr->takecurrentfornext = FALSE;
    p_descr->filesharing = FALSE;
    p_descr->timeout = -1;
    p_descr->readlockless = FALSE;
    p_descr->lastrecordlocked = FALSE;
    p_descr->recordlocking = TRUE;

    return p_descr;

}             /* end of cisam_initfile */

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

void cisam_open ( filedescriptor, accesstype, neworold )
    CISAM_FileType    filedescriptor;
    CISAM_AccessType  accesstype;
    CISAM_Age         neworold;
{
    int            i, isamtype;

    Errorcode = 0;
    if ( filedescriptor->isfd != -1 ||
         ( filedescriptor->accessmode == CISAM_Indexed && 
           filedescriptor->nrofkeys == 0 ) ||
         ( filedescriptor->accessmode == CISAM_Sequential &&
           filedescriptor->nrofkeys > 0 ) ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    /* the check for extra keys on old files should also be included here */

    if ( neworold == CISAM_New ) {
        if ( filedescriptor->accessmode == CISAM_Sequential ) {
            filedescriptor->p_keys[0] = (struct keydesc *)
                                  malloc ( sizeof (struct keydesc) );
            filedescriptor->p_keys[0]->k_nparts = 0;
            filedescriptor->nrofkeys = 1;
        }
        filedescriptor->isfd = isbuild ( filedescriptor->p_filename,
                                         filedescriptor->varsize,
                                         filedescriptor->p_keys[0],
                                         ISINOUT + ISEXCLLOCK );
        if ( filedescriptor->isfd == -1 ) {
            Errorcode = (iserrno == ELOCKED) ? CISAM_FILELOCK : iserrno;
            return;
        }
        for ( i = 1; i < filedescriptor->nrofkeys; i++ ) {
            if ( isaddindex ( filedescriptor->isfd, 
                              filedescriptor->p_keys[i] ) == -1 ) {
                Errorcode = (iserrno == ELOCKED) ? CISAM_FILELOCK : iserrno;
                return;
            }
        }
        if ( isclose ( filedescriptor->isfd ) == -1 ) {
            Errorcode = (iserrno == ELOCKED) ? CISAM_FILELOCK : iserrno;
            return;
        }
    }

    filedescriptor->accesstype = accesstype;
    switch ( accesstype ) {
        case CISAM_Inp: isamtype = ISINPUT; break;
        case CISAM_Out: isamtype = ISOUTPUT; break;
        case CISAM_IO : isamtype = ISINOUT; break;
    }
    filedescriptor->isfd = isopen ( filedescriptor->p_filename,
                                    isamtype + ISMANULOCK );

    if ( filedescriptor->isfd == -1 ) {
        Errorcode = (iserrno == ELOCKED) ? CISAM_FILELOCK : iserrno;
        return;
    }

    filedescriptor->recordlocking =
              ( filedescriptor->accesstype == CISAM_IO &&
                filedescriptor->filesharing );

    if ( accesstype != CISAM_Inp && ! filedescriptor->filesharing ) {
        if ( islock (filedescriptor->isfd) == -1 ) {
            Errorcode = (iserrno == ELOCKED) ? CISAM_FILELOCK : iserrno;
            return;
        }
    }

    if ( accesstype != CISAM_Out ) {
        cisam_setindex ( filedescriptor, 0 );
    }
    if (Errorcode != 0 && Errorcode == ELOCKED ) {
        Errorcode = CISAM_FILELOCK;
    }

}              /* end of cisam_openfile */

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

void cisam_close ( filedescriptor )

    CISAM_FileType  filedescriptor;
{
    int       i;

    Errorcode = 0;
    if ( filedescriptor->isfd == -1 ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    if ( filedescriptor->recordlocking ) {
        if ( isrelease ( filedescriptor->isfd ) == -1 ) {
            Errorcode = iserrno;
            return;
        }
    }

    if ( filedescriptor->accesstype != CISAM_Inp &&
         ! filedescriptor->filesharing ) {
        if ( isunlock ( filedescriptor->isfd ) == -1 ) {
            Errorcode = iserrno;
            return;
        }
    }

    if ( isclose ( filedescriptor->isfd ) == -1 ) {
        Errorcode = iserrno;
        return;
    }

    for ( i = 0; i < filedescriptor->nrofkeys; i++ ) {
        free ( filedescriptor->p_keys[i] );
    }
    free ( filedescriptor );

}             /* end of cisam_close */

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

void cisam_definekey ( filedescriptor, keyposition, keysize, keytype,
                       duplicates, sorting )

    CISAM_FileType        filedescriptor;
    int                   keyposition;
    int                   keysize;
    CISAM_KeyType         keytype;
    CISAM_DuplicateKeys   duplicates;
    CISAM_Sort            sorting;
{
    struct keydesc      *p_kd;

    Errorcode = 0;
    if ( filedescriptor->isfd != -1 || 
         filedescriptor->accessmode != CISAM_Indexed ) {
        Errorcode = CISAM_PRECOND;
        return;
    }
    if ( filedescriptor->nrofkeys >= CISAM_MaxKeys ) {
        Errorcode = CISAM_LENGTH;
        return;
    }

    filedescriptor->p_keys[filedescriptor->nrofkeys] = (struct keydesc *)
                                      malloc ( sizeof (struct keydesc) );
    p_kd = filedescriptor->p_keys[filedescriptor->nrofkeys];
    filedescriptor->nrofkeys ++;

    if ( duplicates == CISAM_Duplicate ) {
        p_kd->k_flags = ISDUPS;
    }
    else {
        p_kd->k_flags = ISNODUPS;
    }
    p_kd->k_nparts = 1;
    p_kd->k_part[0].kp_start = keyposition;
    p_kd->k_part[0].kp_leng  = keysize;
    if ( keytype == CISAM_String ) {
        p_kd->k_part[0].kp_type = CHARTYPE;
    }
    else {
        p_kd->k_part[0].kp_type = LONGTYPE;
    }
    if ( sorting == CISAM_Down ) {
        p_kd->k_part[0].kp_type += ISDESC;
    }
    
}             /* end of cisam_definekey */

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

void cisam_readbykey ( filedescriptor, p_newsize,
                      searchkeyaddress, searchkeysize )

    CISAM_FileType       filedescriptor;
    int                  *p_newsize;
    caddr_t              searchkeyaddress;
    int                  searchkeysize;
{

    Errorcode = 0;
    if ( filedescriptor->isfd == -1 || 
         filedescriptor->accessmode != CISAM_Indexed ||
         searchkeysize !=
filedescriptor->p_keys[filedescriptor->currentindex]->k_part[0].kp_leng ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    filedescriptor->takecurrentfornext = FALSE;
    memcpy (
     filedescriptor->varaddress +
     filedescriptor->p_keys[filedescriptor->currentindex]->k_part[0].kp_start,
     searchkeyaddress, searchkeysize );

    timeoutread ( filedescriptor, ISEQUAL );
    *p_newsize = filedescriptor->varsize;

}              /* end of cisam_readbykey */

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

void cisam_readbyvalue ( filedescriptor, p_newsize, searchvalue )

    CISAM_FileType       filedescriptor;
    int                  *p_newsize;
    int                  searchvalue;
{
    Errorcode = 0;
    cisam_readbykey ( filedescriptor, p_newsize,
                     (caddr_t) &searchvalue, LONGSIZE );

}              /* end of cisam_readbyvalue */

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

void cisam_readbystring ( filedescriptor, p_newsize,
                          p_searchstring, keysize )

    CISAM_FileType       filedescriptor;
    int                  *p_newsize;
    PPC_string           *p_searchstring;
    int                  keysize;
{
    char          *p_str;

    Errorcode = 0;
    p_str = PPC_to_string ( p_searchstring );
    if ( strlen ( p_str ) != keysize ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    cisam_readbykey ( filedescriptor, p_newsize, (caddr_t) p_str, keysize );

}              /* end of cisam_readbystring */

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

void cisam_readnext ( filedescriptor, p_newsize )

    CISAM_FileType       filedescriptor;
    int                  *p_newsize;
{
    int          readtype;

    Errorcode = 0;
    if ( filedescriptor->isfd == -1 ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    if ( filedescriptor->takecurrentfornext ) {
        readtype = ISCURR;
        filedescriptor->takecurrentfornext = FALSE;
    }
    else {
        readtype = ISNEXT;
    }

    timeoutread ( filedescriptor, readtype );
    *p_newsize = filedescriptor->varsize;

}              /* end of cisam_readnext */

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

void cisam_write ( filedescriptor, newsize )

    CISAM_FileType       filedescriptor;
    int                  newsize;
{

    Errorcode = 0;
    if ( filedescriptor->isfd == -1 ||
         filedescriptor->varsize != newsize ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    if ( filedescriptor->recordlocking ) {
        if ( isrelease ( filedescriptor->isfd ) == -1 ) {
            Errorcode = iserrno;
            return;
        }
    }
    filedescriptor->lastrecordlocked = FALSE;
    filedescriptor->takecurrentfornext = FALSE;    
    if ( iswrcurr ( filedescriptor->isfd, filedescriptor->varaddress )
         == -1 ) {
        Errorcode = iserrno;
        return;
    }

}              /* end of cisam_write */

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
void cisam_update ( filedescriptor, newsize )

    CISAM_FileType       filedescriptor;
    int                  newsize;
{
    caddr_t         temp_addr;

    Errorcode = 0;
    if ( filedescriptor->isfd == -1 ||
         filedescriptor->varsize != newsize ||
         ! filedescriptor->lastrecordlocked ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    filedescriptor->takecurrentfornext = FALSE;

    if ( isrewcurr ( filedescriptor->isfd, filedescriptor->varaddress )
         == -1 ) {
        Errorcode = iserrno;
        return;
    }

}              /* end of cisam_update */

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_Delete
 *  Description     : This procedure deletes the current record. 
 *                    This record is the last handled record in a previous
 *                    ISAM-call.
 *  Precondition    : The file has been opened.
 *                    An CISAM_Read.... has to preceed this procedure.
 *                    The current record is locked.
 *  Postcondition   : The last read record has been deleted.
 *
 *EMP:::===================================================================*/

void cisam_delete ( filedescriptor )

    CISAM_FileType        filedescriptor;
{

    Errorcode = 0;
    if ( filedescriptor->isfd == -1 ||
         ! filedescriptor->lastrecordlocked ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    filedescriptor->takecurrentfornext = FALSE;

    if ( isdelcurr ( filedescriptor->isfd ) == -1 ) {
        Errorcode = iserrno;
        return;
    }

}              /* end of cisam_delete */

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

void cisam_setindex ( filedescriptor, index )

    CISAM_FileType        filedescriptor;
    CISAM_KeyRange        index;
{

    Errorcode = 0;
    if ( filedescriptor->isfd == -1 ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    if ( filedescriptor->recordlocking ) {
        if ( isrelease ( filedescriptor->isfd ) == -1 ) {
            Errorcode = iserrno;
            return;
        }
    }
    filedescriptor->lastrecordlocked = FALSE;

    if ( index == 0 ) {
        index = CISAM_DefaultIndex;
    }
    if ( index <= filedescriptor->nrofkeys ) {
        if ( isstart ( filedescriptor->isfd, 
                       filedescriptor->p_keys[index - 1],
                       0, filedescriptor->varaddress, ISFIRST ) == -1 ) {
            Errorcode = iserrno;
            return;
        }
        filedescriptor->takecurrentfornext = TRUE;
        filedescriptor->currentindex = index - 1;
    }

}              /* end of cisam_setindex */

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

CISAM_StatusType cisam_ownstatus ( )
{
    CISAM_StatusType     status;

    switch ( Errorcode ) {
    /* OK */
        case 0         : status = CISAM_NoError; break;

    /* system errors */
        case ENOENT    : status = CISAM_FileNotFound; break;

    /* isam errors */
        case ELOCKED   : status = CISAM_RecordLocked; break;
        case EENDFILE  : status = CISAM_EndOfFile; break;
        case ENOREC    : status = CISAM_RecordNotFound; break;
        case EFLOCKED  : status = CISAM_FileLocked; break;
        case EFNAME    : status = CISAM_LengthOutOfRange; break;

    /* user defined errors */
        case CISAM_PRECOND    : status = CISAM_PreconditionError; break;
        case CISAM_LENGTH     : status = CISAM_LengthOutOfRange; break;
        case CISAM_FILELOCK   : status = CISAM_FileLocked; break;
        default        : status = CISAM_Error; break;
    }
    return status;

}              /* end of cisam_ownstatus */

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

int cisam_integerstatus ( )
{
    return Errorcode;
}              /* end of cisam_integerstatus */

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

void cisam_filesharing ( filedescriptor, sharedaccess )

    CISAM_FileType    filedescriptor;
    CISAM_AccessType  sharedaccess;
{

    Errorcode = 0;
    if ( filedescriptor->isfd != -1 ||
         sharedaccess != CISAM_IO ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    filedescriptor->filesharing = TRUE;

}              /* end of cisam_filesharing */

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

void cisam_timeout ( filedescriptor, waittime )

    CISAM_FileType      filedescriptor;
    CISAM_TimeOutRange  waittime;
{

    Errorcode = 0;
    if ( waittime > CISAM_MaxTimeWait || waittime < -1 ) {
        Errorcode = CISAM_LENGTH;
        return;
    }

    filedescriptor->timeout = waittime;

}              /* end of cisam_timeout */

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

void cisam_release ( filedescriptor )

    CISAM_FileType      filedescriptor;
{

    Errorcode = 0;
    if ( filedescriptor->isfd == -1 ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    if ( filedescriptor->recordlocking ) {
        if ( isrelease ( filedescriptor->isfd ) == -1 ) {
            Errorcode = iserrno;
            return;
        }
    }
    filedescriptor->lastrecordlocked = FALSE;

}              /* end of cisam_release */

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

void cisam_reset ( filedescriptor )

    CISAM_FileType      filedescriptor;
{

    Errorcode = 0;
    if ( filedescriptor->isfd == -1 ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    if ( filedescriptor->recordlocking ) {
        if ( isrelease ( filedescriptor->isfd ) == -1 ) {
            Errorcode = iserrno;
            return;
        }
    }
    filedescriptor->lastrecordlocked = FALSE;

    if ( isstart ( filedescriptor->isfd,
                   filedescriptor->p_keys[filedescriptor->currentindex],
                   0, filedescriptor->varaddress, ISFIRST ) == -1 ) {
        Errorcode = iserrno;
        return;
    }
    filedescriptor->takecurrentfornext = TRUE;

}              /* end of cisam_reset */

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

void cisam_disablereadlock ( filedescriptor )

    CISAM_FileType      filedescriptor;
{
    Errorcode = 0;
    if ( filedescriptor->isfd != -1 ) {
        Errorcode = CISAM_PRECOND;
        return;
    }

    filedescriptor->readlockless = TRUE;

}              /* end of cisam_disablereadlock */

/*MPF:::===================================================================*
 *
 *  Procedure Name  : CISAM_RevisionDate
 *  Description     : Returns the revision date and time in the absolute
 *                    representation
 *  Precondition    :
 *  Postcondition   : p_found IFF file was found AND RevisionDate is revision 
 *                    date of the file 
 *
 *EMP:::===================================================================*/

void cisam_revisiondate ( p_filename, lengthfilename, p_found, p_revisiondate)

    PPC_string          *p_filename;
    CISAM_FileNameRange lengthfilename;
    Boolean             *p_found;
    CISAM_Time          *p_revisiondate;
{
    static struct stat    buf;
    char                  *p_name;

    p_name = PPC_to_string (p_filename);

    if ( stat (p_name, &buf) == -1 ) {
        Errorcode = errno;
        *p_revisiondate = 0;
        *p_found = FALSE;
    }
    else {
        *p_revisiondate = buf.st_mtime;
        *p_found = TRUE;
    }
 
}             /* end of CISAM_revisiondate */

/*MPF:::===================================================================*
 *
 *  Function Name  : CISAM_CompareDate
 *  Description    : compares two absolute times
 *                   returns CISAM_same if the times are equal
 *                   returns CISAM_earlier if the first time is earlier
 *                   returns CISAM_later if the first time is later
 *
 *EMP:::===================================================================*/

CISAM_CompareResult   cisam_comparedate ( time1, time2 )

    CISAM_Time   time1;
    CISAM_Time   time2;
{
    if ( time1 == time2 ) {
        return CISAM_same;
    }
    else if ( time1 > time2 ) {
        return CISAM_later;
    }
    else {
        return CISAM_earlier;
    }

}             /* end of cisam_comparedate */

/*MPF:::===================================================================*
 *
 *  Function Name  : CISAM_NewestDate
 *  Description    : returns the newest date in the system
 *
 *EMP:::===================================================================*/

CISAM_Time   cisam_newestdate ( )
{
    return LONG_MAX;
}             /* end of cisam_newestdate */

/*MPF:::===================================================================*
 *
 *  Function Name  : CISAM_OldestDate
 *  Description    : returns the oldest date in the system
 *
 *EMP:::===================================================================*/

CISAM_Time cisam_oldestdate ( )
{
    return LONG_MIN;
}              /* end of cisam_oldestdate */

/*MPF:::===================================================================*
 *
 *  Procedure Name  : timeoutread
 *  Description     : This procedure executes a read within a time-out loop.
 *  Precondition    : The file is opened and the variable to the file has
 *                    been filled with the correct information (according
 *                    to readtype).
 *  Postcondition   : The record has been read.
 *
 *EMP:::===================================================================*/

static void timeoutread ( filedescriptor, readtype )

    CISAM_FileType  filedescriptor;
    int             readtype;
{
    int          time;
    Boolean      read, lockon;

    if ( filedescriptor->recordlocking ) {
        if ( isrelease ( filedescriptor->isfd ) == -1 ) {
            Errorcode = iserrno;
            return;
        }
    }
    filedescriptor->lastrecordlocked = FALSE;

    time = 0;
    read = FALSE;
    lockon = FALSE;

    if ( filedescriptor->recordlocking ) {
        readtype += ISLOCK;
        lockon = TRUE;
    }

    while ( ! read && ( filedescriptor->timeout == -1 ||
                         time <= filedescriptor->timeout ) ) {
        if ( time > 0 ) {
            sleep(1);
        }
        if ( isread ( filedescriptor->isfd, 
                      filedescriptor->varaddress, readtype ) == -1 ) {
            if ( iserrno == ELOCKED ) {
                if ( filedescriptor->readlockless ) {
                    readtype -= ISLOCK;
                    lockon = FALSE;
                    Errorcode = iserrno;
                }
            }
            else {
                Errorcode = iserrno;
                return;
            }
        }
        else {
            read = TRUE;
            if ( lockon ) {
                filedescriptor->lastrecordlocked = TRUE;
            }
        }
        time ++;
    }
    if ( ! read ) {
        Errorcode = iserrno;
    }
}              /* end of timeoutread */
