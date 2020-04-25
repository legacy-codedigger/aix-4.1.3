#ifdef _POWER_PROLOG_
static char sccsid[] = "@(#)78  1.1  src/bos/usr/ccs/lib/libcurses/setsyx.c, libcurses, bos411, 9428A410j 9/3/93 15:12:26";
/*
 *   COMPONENT_NAME: LIBCURSES
 *
 *   FUNCTIONS: setsyx
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

/* #ident	"@(#)curses:screen/setsyx.c	1.8"		*/



/*
 * Set the current screen coordinates (y, x).
 *
 * This routine may be called before doupdate(). It tells doupdate()
 * where to leave the cursor instead of the location of (x, y) of the
 * last window that was wnoutrefreshed or pnoutrefreshed.
 * If x and y are negative, then the cursor will be left wherever
 * curses decides to leave it, as if leaveok() had been TRUE for the
 * last window refreshed.
 */
#include	"curses_inc.h"

setsyx(y, x)
int	y, x;
{
    if (y < 0 && x < 0)
    {
	SP->virt_scr->_leave = TRUE;
    }
    else
    {
	_virtscr->_cury = y + SP->Yabove;
	_virtscr->_curx = x;
	_virtscr->_leave = FALSE;
	_virtscr->_flags |= _WINMOVED;
    }
    return (OK);
}
