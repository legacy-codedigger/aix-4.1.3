static char sccsid[] = "@(#)93	1.8  src/bos/usr/bin/uucp/gename.c, cmduucp, bos411, 9428A410j 6/17/93 14:05:04";
/* 
 * COMPONENT_NAME: CMDUUCP gename.c
 * 
 * FUNCTIONS: gename, getseq, initSeq, sysseq 
 *
 * ORIGINS: 10  27  3 
 *
 * (C) COPYRIGHT International Business Machines Corp. 1985, 1989
 * All Rights Reserved
 * Licensed Materials - Property of IBM
 *
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */



/*	Copyright (c) 1984 AT&T	*/
/*	  All Rights Reserved  	*/

/*	THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF AT&T	*/
/*	The copyright notice above does not evidence any   	*/
/*	actual or intended publication of such source code.	*/


/*	/sccs/src/cmd/uucp/s.gename.c
	gename.c	1.1	7/29/85 16:32:57
*/
#include "uucp.h"

/* VERSION( gename.c	5.2 -  -  ); */

static struct {
	char	sys[NAMESIZE];
	int	job;
	int	subjob;
} syslst[30];		/* no more than 30 systems per job */

extern nl_catd catd;
static int nsys = 0;
static int sysseq(char *);

 /* generate file name
  *	pre	-> file prefix
  *	sys	-> system name
  *	grade	-> service grade 
  *	file	-> buffer to return filename must be of size DIRSIZ+1
  * return:
  *	none
  */
gename(pre, sys, grade, file)
char pre, *sys, grade, *file;
{
	int	n;

	DEBUG(9, "gename(%c, ", pre);
	DEBUG(9, "%s, ", sys);
	DEBUG(9, "%c)\n", grade);
	if (*sys == '\0') {
		sys = Myname;
		DEBUG(9, MSGSTR(MSG_GE1, "null sys -> %s\n"), sys);
	}
	n = sysseq(sys);
	if (pre == CMDPRE || pre == XQTPRE) {
		(void) sprintf(file, "%c.%.*s%c%.4x",
			pre, SYSNSIZE, sys, grade,syslst[n].job); 
	} else
		(void) sprintf(file, "%c.%.5s%.4x%.3x",
			pre, sys, syslst[n].job & 0xffff,
				++syslst[n].subjob & 0xfff); 
	DEBUG(4, MSGSTR(MSG_GE2, "file - %s\n"), file);
	return;
}


#define SLOCKTIME 10
#define SLOCKTRIES 5
#define SEQLEN 4

 /*
  * get next sequence number
  * returns:  
  *	number between 1 and 0xffff
  *
  * sequence number 0 is reserved for polling
  */
static int
getseq(sys)
char	*sys;
{
	register FILE *fp;
	register int i;
	int n;
	int	seed;
	char seqlock[MAXFULLNAME], seqfile[MAXFULLNAME];

	ASSERT(nsys < sizeof (syslst)/ sizeof (syslst[0]),
	    MSGSTR(MSG_GE3, "SYSLST OVERFLOW"), "", sizeof (syslst));

	(void) time((time_t *)&seed);	/* crank up the sequence initializer */
	srand(seed);

	(void) sprintf(seqlock, "%s%s", SEQLOCK, sys);
	BASENAME(seqlock, '/')[MAXBASENAME] = '\0';
	for (i = 1; i < SLOCKTRIES; i++) {
		if (!ulockf(seqlock, (time_t) SLOCKTIME))
			break;
		sleep(5);
	}

	ASSERT(i < SLOCKTRIES, MSGSTR(MSG_UDEFS_6,"CANNOT LOCK"), seqlock, 0);

	(void) sprintf(seqfile, "%s/%s", SEQDIR, sys);
	if ((fp = fopen(seqfile, "r")) != NULL) {
		/* read sequence number file */
		if (fscanf(fp, "%4x", &n) != 1) {
		    n = rand();
		    clearerr(fp);
		}
		fp = freopen(seqfile, "w", fp);
		ASSERT(fp != NULL, MSGSTR(MSG_UDEFS_1,"CANNOT OPEN"),
                       seqfile, errno);
		(void) chmod(seqfile, 0666);
	} else {
		/* can not read file - create a new one */
		ASSERT((fp = fopen(seqfile, "w")) != NULL,
		    MSGSTR(MSG_UDEFS_4, "CANNOT CREATE"), seqfile, errno);
		(void) chmod(seqfile, 0666);
		n = rand();
	}

	n++;
	n &= 0xffff;	/* 4 byte sequence numbers */
	(void) fprintf(fp, "%.4x\n", n);
	ASSERT(ferror(fp) == 0, MSGSTR(MSG_UDEFS_2, "CANNOT_WRITE"), 
		seqfile, errno);
	(void) fclose(fp);
	ASSERT(ferror(fp) == 0, MSGSTR(MSG_UDEFS_15, "CANNOT CLOSE"), 
                seqfile, errno);
	rmlock(seqlock);
	DEBUG(6, MSGSTR(MSG_GE4, "%s seq "), sys); DEBUG(6, 
		 MSGSTR(MSG_GE5, "now %x\n"), n);

	(void) strcpy(syslst[nsys].sys, sys);
	syslst[nsys].job = n;
	syslst[nsys].subjob = rand() & 0xfff;	/* random initial value */
	return(nsys++);
}

static int
sysseq(char *sys)
{
	int	i;

	for (i = 0; i < nsys; i++)
		if (strncmp(syslst[i].sys, sys, SYSNSIZE) == SAME)
		  return(i);

	return(getseq(sys));
}

/*
 *	initSeq() exists because it is sometimes important to forget any
 *	cached work files.  for example, when processing a bunch of spooled X.
 *	files, we must not re-use any C. files used to send back output.
 */
void
initSeq()
{
	nsys = 0;
}
