static char sccsid[] = "@(#)39	1.3  src/bos/usr/bin/tip/partab.c, cmdtip, bos411, 9428A410j 6/15/90 23:48:05";
/* 
 * COMPONENT_NAME: UUCP partab.c
 * 
 * FUNCTIONS: 
 *
 * ORIGINS: 10  26  27 
 *
 * (C) COPYRIGHT International Business Machines Corp. 1985, 1989
 * All Rights Reserved
 * Licensed Materials - Property of IBM
 *
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */
/*
 * Copyright (c) 1983 Regents of the University of California.
 * All rights reserved.  The Berkeley software License Agreement
 * specifies the terms and conditions for redistribution.
 */

/* static char sccsid[] = "partab.c	5.1 (Berkeley) 4/30/85"; */

/*
 * Even parity table for 0-0177
 */
char evenpartab[] = {
	0000,0201,0202,0003,0204,0005,0006,0207,
	0210,0011,0012,0213,0014,0215,0216,0017,
	0220,0021,0022,0223,0024,0225,0226,0027,
	0030,0231,0232,0033,0234,0035,0036,0237,
	0240,0041,0042,0243,0044,0245,0246,0047,
	0050,0251,0252,0053,0254,0055,0056,0257,
	0060,0261,0262,0063,0264,0065,0066,0267,
	0270,0071,0072,0273,0074,0275,0276,0077,
	0300,0101,0102,0303,0104,0305,0306,0107,
	0110,0311,0312,0113,0314,0115,0116,0317,
	0120,0321,0322,0123,0324,0125,0126,0327,
	0330,0131,0132,0333,0134,0335,0336,0137,
	0140,0341,0342,0143,0344,0145,0146,0347,
	0350,0151,0152,0353,0154,0355,0356,0157,
	0360,0161,0162,0363,0164,0365,0366,0167,
	0170,0371,0372,0173,0374,0175,0176,0377,
};
