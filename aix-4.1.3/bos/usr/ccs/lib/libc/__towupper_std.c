static char sccsid[] = "@(#)24	1.4.1.2  src/bos/usr/ccs/lib/libc/__towupper_std.c, libcchr, bos411, 9428A410j 1/12/93 11:11:20";
/*
 * COMPONENT_NAME: (LIBCCHR) LIBC Character Classification Funcions
 *
 * FUNCTIONS: __towupper_std
 *
 * ORIGINS: 27
 *
 * This module contains IBM CONFIDENTIAL code. -- (IBM
 * Confidential Restricted when combined with the aggregated
 * modules for this product)
 *                  SOURCE MATERIALS
 * (C) COPYRIGHT International Business Machines Corp. 1991, 1992
 * All Rights Reserved
 *
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 *
 */
/*
 *
 * FUNCTION: converts a character (process code) to uppercase.  If the character
 *           does not have an uppercase, then the character is returned unchanged
 *	    
 *
 * PARAMETERS: hdl -- The ctype info for the current locale
 *              wc -- The character (process code) to be converted
 *
 *
 * RETURN VALUES: The uppercase of wc
 *               wc
 *
 *
 */
#include <ctype.h>
    
wint_t __towupper_std(_LC_ctype_objhdl_t hdl, wint_t wc)
{
    if(wc > __OBJ_DATA(hdl)->max_wc || wc < __OBJ_DATA(hdl)->min_wc)
	return(wc);
    return(__OBJ_DATA(hdl)->upper[wc]);
}
