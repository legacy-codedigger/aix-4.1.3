#ifdef _POWER_PROLOG_
static char sccsid[] = "@(#)76  1.1  src/bos/usr/ccs/lib/libcurses/setnonl.c, libcurses, bos411, 9428A410j 9/3/93 15:12:16";
/*
 *   COMPONENT_NAME: LIBCURSES
 *
 *   FUNCTIONS: _setnonl
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

/* #ident	"@(#)curses:screen/setnonl.c	1.2"		*/



#include	"curses_inc.h"

_setnonl(bf)
int	bf;
{
    SP->fl_nonl = bf;
    return (OK);
}
