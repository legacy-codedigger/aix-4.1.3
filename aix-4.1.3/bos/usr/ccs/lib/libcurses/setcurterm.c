#ifdef _POWER_PROLOG_
static char sccsid[] = "@(#)73  1.1  src/bos/usr/ccs/lib/libcurses/setcurterm.c, libcurses, bos411, 9428A410j 9/3/93 15:11:59";
/*
 *   COMPONENT_NAME: LIBCURSES
 *
 *   FUNCTIONS: setcurterm
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

/* #ident	"@(#)curses:screen/setcurterm.c	1.5"		*/



#include "curses_inc.h"

/*
 * Establish the terminal that the #defines in term.h refer to.
 */

TERMINAL *
setcurterm(newterminal)
register TERMINAL *newterminal;
{
    register	TERMINAL	*oldterminal = cur_term;

    if (newterminal)
    {
#ifdef	_VR3_COMPAT_CODE
	acs_map = cur_term->_acs32map;
#else	/* _VR3_COMPAT_CODE */
	acs_map = cur_term->_acsmap;
#endif	/* _VR3_COMPAT_CODE */
	cur_bools = newterminal->_bools;
	cur_nums = newterminal->_nums;
	cur_strs = newterminal->_strs;
	cur_term = newterminal;
    }
    return (oldterminal);
}
