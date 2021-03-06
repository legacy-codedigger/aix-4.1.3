#ifdef _POWER_PROLOG_
static char sccsid[] = "@(#)17  1.1  src/bos/usr/ccs/lib/libcurses/vwscanw.c, libcurses, bos411, 9428A410j 9/3/93 15:14:59";
/*
 *   COMPONENT_NAME: LIBCURSES
 *
 *   FUNCTIONS: vwscanw
 *		
 *
 *   ORIGINS: 4
 *
 *                    SOURCE MATERIALS
 */
#endif /* _POWER_PROLOG_ */


/*	Copyright (c) 1984 AT&T	*/
/*	  All Rights Reserved  	*/

/*	THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF AT&T	*/
/*	The copyright notice above does not evidence any   	*/
/*	actual or intended publication of such source code.	*/

/* #ident	"@(#)curses:screen/vwscanw.c	1.5"		*/



/*
 * scanw and friends
 *
 */

# include	"curses_inc.h"
# include	<varargs.h>

/*
 *	This routine actually executes the scanf from the window.
 *
 *	This code calls vsscanf, which is like sscanf except
 * 	that it takes a va_list as an argument pointer instead
 *	of the argument list itself.  We provide one until
 *	such a routine becomes available.
 */

/*VARARGS2*/
vwscanw(win, fmt, ap)
WINDOW	*win;
char *fmt;
va_list	ap;
{
	char	buf[256];
	register int n;

	if (wgetstr(win, buf) == ERR)
		n = ERR;
	else
		n = vsscanf(buf, fmt, ap);
	va_end(ap);
	return n;
}
