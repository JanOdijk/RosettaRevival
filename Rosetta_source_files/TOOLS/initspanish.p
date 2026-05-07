(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : INITSPANISH
 *  Creation date   : 14 sept 1990
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
pragma C_Include('mb.pf');
pragma C_Include('globdef.pf');
pragma C_Include('log.pf');
pragma C_Include('pc.pf');

PROGRAM INITSPANISH;
WITH MB,GLOBDEF,LOG,PC;

var 
  mbxlexedinit: MB_mbxid;
  status: GLOBDEF_status;
  readymessage: MB_communicationblock;
BEGIN
  LOG_Open('loginitspanish', 11, GLOBDEF_Yes);
  MB_Init;
  status := MB_Open('LEXEDINIT',takeaccess,GLOBDEF_yes,mbxlexedinit);
  if status = notsuccessful then writeln('open mailbox failure');
  status := PC_Create('SPANISHLEXED', 'lexedspanish');
  if status = notsuccessful then writeln('Create process failure');
  MB_take(mbxlexedinit,readymessage);
  MB_Close(mbxlexedinit, GLOBDEF_Yes);
  LOG_Close;
END. { INITSPANISH }
