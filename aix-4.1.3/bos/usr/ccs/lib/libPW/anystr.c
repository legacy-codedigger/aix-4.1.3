static char sccsid[] = "@(#)47	1.5  src/bos/usr/ccs/lib/libPW/anystr.c, libPW, bos411, 9428A410j 6/16/90 00:55:37";
/*
 * COMPONENT_NAME: (LIBPW) Programmers Workbench Library
 *
 * FUNCTIONS: anystr
 *
 * ORIGINS: 3
 *
 *                  SOURCE MATERIALS
 *
 * Copyright (c) 1984 AT&T	
 * All Rights Reserved  
 *
 * THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF AT&T	
 * The copyright notice above does not evidence any   
 * actual or intended publication of such source code.
 * 
 */

# include	"sys/types.h"
# include	"macros.h"

/*
	This routine returns the position of the first character
	in s1 that matches any character in s2.
*/

anystr(s1, s2)
char *s1, *s2;
{
	register int i = -1;
	register int c;

	while (c = s1[++i])
		if (any(c, s2))
			return(i);
	return(-1);
}
