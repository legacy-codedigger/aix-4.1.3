static char sccsid[] = "@(#)48	1.2  src/bos/usr/ccs/lib/libc/cfsetospeed.c, libctty, bos411, 9428A410j 6/16/90 01:34:53";

/*
 * COMPONENT_NAME: LIBCTTY terminal control routines
 *
 * FUNCTIONS: cfsetospeed
 *
 * ORIGINS: 27
 *
 * IBM CONFIDENTIAL -- (IBM Confidential Restricted when
 * combined with the aggregated modules for this product)
 *                  SOURCE MATERIALS
 * (C) COPYRIGHT International Business Machines Corp. 1988, 1989
 * All Rights Reserved
 *
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

#include <termios.h>
#include <errno.h>

#ifdef cfsetospeed
#undef cfsetospeed
#endif

int cfsetospeed(struct termios *p, speed_t s)
{
    if (s < B0 || s > B38400) {
	errno = EINVAL;
	return -1;
    }
    p->c_cflag &= ~ _CBAUD;
    p->c_cflag |= (s & _CBAUD);
    return 0;
}
