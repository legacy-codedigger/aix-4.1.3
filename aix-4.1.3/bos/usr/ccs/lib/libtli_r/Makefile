# @(#)21        1.2  src/bos/usr/ccs/lib/libtli_r/Makefile, libtli, bos411, 9428A410j 2/20/94 17:31:33
# COMPONENT_NAME:  LIBTLI
#
# FUNCTIONS:
#
# ORIGINS: 27
#
# IBM CONFIDENTIAL -- (IBM Confidential Restricted when
# combined with the aggregated modules for this product)
#                  SOURCE MATERIALS
# (C) COPYRIGHT International Business Machines Corp. 1993
# All Rights Reserved
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#

VPATH		= ${MAKETOP}/bos/kernext/exp:${MAKETOP}/bos/usr/ccs/lib/libtli

SHARED_LIBRARIES= libtli_r.a
MSGHDRS         = libtli_msg.h
CATFILES        = libtli.cat
HFILES          = ${MSGHDRS}

EXPINC_TARGETS  = export_libtli_msg.h
EXPLIB_TARGETS  = export_libtli_r.a

INCLUDES        = libtli_msg.h

ILIST           = libtli_r.a
IDIR            = /usr/lib/

CFLAGS		= -D_THREAD_SAFE

INCFLAGS	= -I${MAKETOP}/bos/usr/ccs/lib/libtli

LIBS		= libc_r.a libpthreads.a
IMPORTS		= -bI:pse.exp -bI:libtli_r.exp
EXPORTS		= -bE:libtli.exp -bE:libtli_r.exp

SHARED_OFILES = \
	iostate.o taccept.o talloc.o tbind.o tblock.o tclose.o \
	tconnect.o terrno.o terror.o tfixup.o tfree.o tgetinfo.o tgetst.o \
	tlisten.o tlook.o tnblock.o topen.o toptmgmt.o trcv.o \
	trcvcon.o trcvdis.o trcvrel.o trudata.o truderr.o tsnd.o \
	tsnddis.o tsndrel.o tsudata.o tsync.o tunbind.o tdbg.o threads.o

#
# This is a non-shared part to call xti/tli initialization routine.
# more comments are in threads.c and __threads.c.
#
NOSHARED_OFILES = \
	__threads.o

.include <${RULES_MK}>
