static char sccsid[] = "@(#)70	1.3.2.2  src/bos/usr/ccs/lib/libc/__wcsftime_std.c, libcfmt, bos411, 9428A410j 1/12/93 11:11:26";
/*
 * COMPONENT_NAME: LIBCFMT
 *
 * FUNCTIONS:  __wcsftime_std
 *
 * ORIGINS: 27
 *
 * IBM CONFIDENTIAL -- (IBM Confidential Restricted when
 * combined with the aggregated modules for this product)
 *                  SOURCE MATERIALS
 * (C) COPYRIGHT International Business Machines Corp. 1991, 1992
 * All Rights Reserved
 *
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */
#pragma alloca

#include <sys/localedef.h>
#include <time.h>
#include <stddef.h>
#include <stdlib.h>

/*
 * FUNCTION: This is the standard method for function wcsftime.
 *	     This function behaves the same as strftime() except the 
 *	     ouput buffer is wchar_t. Indeed, __wcsftime_std() calls strftime()
 *	     which performs the conversion in single byte first. Then the
 *	     output from strftime() is converted to wide character string by
 *	     mbstowcs().
 *
 * PARAMETERS:
 *           _LC_time_objhdl_t hdl - pointer to the handle of the LC_TIME
 *                             catagory which contains all the time related
 *                             information of the specific locale.
 *           const char *ws  - the output data buffer in wide character
 *			       format.
 *	     size_t maxsize  - the maximum number of wide character including
 *			       the terminating null to be output to ws buffer.
 *           const char *fmt - the format string which specifies the expected
 *                             format to be output to the ws buffer.
 *           struct tm *tm   - the time structure to provide specific time
 *			       information when needed.
 *
 * return VALUE DESCRIPTIONS:
 *           - if successful, it returns the number of bytes placed into the
 *	       ws buffer not including the terminating null byte.
 *           - if fail for any reason, it returns 0.
 */

size_t __wcsftime_std(_LC_time_objhdl_t hdl, wchar_t *ws, size_t maxsize, 
		      const char *format, const struct tm *timeptr)
{
	char	*temp;
	size_t	size;
	size_t	rc;
	int	wc_num;
	
	
	size = MB_CUR_MAX * maxsize;
	if ( (temp = (char *)alloca(size)) == NULL)
		return(0);

	if ( (rc = strftime (temp, size, format, timeptr)) == 0) {
		return(0);
	}
	if ((wc_num = mbstowcs (ws, temp, rc+1)) == -1) {
		return(0);
	}
	if (rc) {
		if (wc_num < maxsize) {
			return(wc_num);
		}
		else {
			return(0);
		}
	}
	else {
		return(0);
	}
}
