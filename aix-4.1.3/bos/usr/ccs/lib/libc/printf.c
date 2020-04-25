static char sccsid[] = "@(#)71	1.13  src/bos/usr/ccs/lib/libc/printf.c, libcprnt, bos411, 9428A410j 10/3/93 13:13:19";
/*
 * COMPONENT_NAME: (LIBCPRNT) Standard C Library Print Functions 
 *
 * FUNCTIONS: printf, fprintf, sprintf, vfprintf, vprintf,
 *            vsprintf, vwsprintf, wsprintf
 *
 * ORIGINS: 27 
 *
 * This module contains IBM CONFIDENTIAL code. -- (IBM
 * Confidential Restricted when combined with the aggregated
 * modules for this product)
 *                  SOURCE MATERIALS
 * (C) COPYRIGHT International Business Machines Corp. 1993
 * All Rights Reserved
 *
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

#define PRINTF     printf
#define FPRINTF    fprintf
#define SPRINTF    sprintf
#define VFPRINTF   vfprintf
#define VPRINTF   vprintf
#define VSPRINTF   vsprintf
#define VWSPRINTF  vwsprintf
#define WSPRINTF   wsprintf
#define DOPRNT     _doprnt

#include "printf_macros.c"




