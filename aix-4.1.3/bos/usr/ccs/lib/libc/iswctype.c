static char sccsid[] = "@(#)07	1.1  src/bos/usr/ccs/lib/libc/iswctype.c, libcchr, bos411, 9428A410j 1/12/93 12:41:34";
/*
 * COMPONENT_NAME: (LIBCCHR) LIBC Character Classification Funcions
 *
 * FUNCTIONS: is_wctype
 *
 * ORIGINS: 27
 *
 * This module contains IBM CONFIDENTIAL code. -- (IBM
 * Confidential Restricted when combined with the aggregated
 * modules for this product)
 *                  SOURCE MATERIALS
 * (C) COPYRIGHT International Business Machines Corp. 1991 , 1992
 * All Rights Reserved
 *
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 *
 */
#include <sys/lc_sys.h>
#include <sys/localedef.h>
#include <ctype.h>

#undef iswctype

int iswctype(wint_t wc, wctype_t mask)
{
	return _CALLMETH(__lc_ctype,__is_wctype)(__lc_ctype, wc, mask);
}
