#ifdef _POWER_PROLOG_
static char sccsid[] = "@(#)83  1.1  src/bos/usr/ccs/lib/libcurses/slk_label.c, libcurses, bos411, 9428A410j 9/3/93 15:12:46";
/*
 *   COMPONENT_NAME: LIBCURSES
 *
 *   FUNCTIONS: slk_label
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

/* #ident	"@(#)curses:screen/slk_label.c	1.2"		*/



#include	"curses_inc.h"

/* Return the current label of key number 'n'. */

char *
slk_label(n)
int	n;
{
    register	SLK_MAP	*slk = SP->slk;

    /* strip initial blanks */
    /* for (; *lab != '\0'; ++lab)
	if(*lab != ' ')
	    break; */
    /* strip trailing blanks */
    /* for (; cp > lab; --cp)
	if (*(cp-1) != ' ')
	    break; */


    return (!slk || n < 1 || n > slk->_num) ? NULL : slk->_lval[n - 1];
}
