static char sccsid[] = "@(#)08	1.5  src/bos/usr/ccs/lib/libPW/patoi.c, libPW, bos411, 9428A410j 6/16/90 00:56:35";
/*
 * COMPONENT_NAME: (LIBPW) Programmers Workbench Library
 *
 * FUNCTIONS: patoi
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

/*
	Function to convert ascii string to integer.  Converts
	positive numbers only.  Returns -1 if non-numeric
	character encountered.
*/

patoi(s)
register char *s;
{
	register int i;

	i = 0;
	while(*s >= '0' && *s <= '9') i = 10 * i + *s++ - '0';

	if(*s) return(-1);
	return(i);
}
