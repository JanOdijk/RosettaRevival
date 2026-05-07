/*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : Paspar
 *  Creation date   : 1991-02-06
 *  Author          : H. M. M. van de Schoot
 *                                                                  
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Definitions and functions for Pascal parameters
 *                    in C functions
 *
 *EMP:::===================================================================*/

#ifndef _PASPAR_H
#define _PASPAR_H

/*=========================================================================*
 *  Imported modules
 *=========================================================================*/

typedef struct {
    unsigned short len;
    char data [1];	/* actual length is len */
}
    PPC_string;


/*MPF:::===================================================================*
 *
 *  Function Name  : PPC_to_string
 *  Description    : Converts a Pascal string to a zero terminated 
 *                   string
 *  Parameters     : p_string : pointer to PPC_string string structure
 *  Result         : pointer to zero terminated char array
 *                   (this string is allocated by the function;
 *                    it is left to the caller to free the string)
 *  Precondition   : TRUE
 *  Postcondition  : a string exists which can be used in C string functions
 *EMP:::===================================================================*/

extern char * FUNCDEF (
PPC_to_string, (
    PPC_string *p_string));


/*MPF:::===================================================================*
 *
 *  Function Name  : PPC_from_string
 *  Description    : Converts a zero terminated string to a Pascal string
 *  Parameters     : p_pstring: pointer to PPC_string string structure
 *                   max_pstring_len: max length of p_pstring
 *                   p_string : pointer to zero terminated string
 *  Precondition   : TRUE
 *  Postcondition  : p_pstring contains p_string
 *EMP:::===================================================================*/

extern void FUNCDEF (
PPC_from_string, (
    PPC_string *p_pstring,
    int max_pstring_len,
    char * p_string));


#endif /* _PASPAR_H */
