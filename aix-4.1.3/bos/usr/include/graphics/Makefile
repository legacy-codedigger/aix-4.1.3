# @(#)74        1.11  src/bos/usr/include/graphics/Makefile, sysxdisp, bos41J, 9509A_all 2/21/95 19:25:58
#
# COMPONENT_NAME: (sysxdisp)  Kernel extension(s) for Display Devices
#
# FUNCTIONS:
#
# ORIGINS: 27
#
# IBM CONFIDENTIAL -- (IBM Confidential Restricted when
# combined with the aggregated modules for this product)
# (C) COPYRIGHT International Business Machines Corp. 1994
# All Rights Reserved
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#

VPGAI		= ${MAKETOP}/bos/kernext/rcm/inc/gai
VPLFT		= ${MAKETOP}/bos/kernext/lft/inc
VPSKY		= ${MAKETOP}/bos/kernext/disp/sky/inc
VPSGA		= ${MAKETOP}/bos/kernext/disp/sga/inc
VPWGA		= ${MAKETOP}/bos/kernext/disp/wga/inc
VPMISC		= ${MAKETOP}/bos/kernext/inc/POWER:${MAKETOP}/bos/kernext/disp/inc/
VPINPUT     = ${MAKETOP}bos/kernext/inputdd/inc

VPATH		= ${VPGAI}:${VPLFT}:${VPSKY}:${VPSGA}:${VPWGA}:${VPMISC}:${VPINPUT}

SUBDIRS		= trace mid ccm rcm sys

EXPINC_SUBDIRS	= ${SUBDIRS}

INSTALL_FILES	= vt.h gai.h

INCLUDES	= ${INSTALL_FILES} 60x_regs.h \
 		   fkproc.h 	fkprocFont.h 	kks.h  \
		   lft.h 	lftras.h 	lft_swkbd.h  tabcmd.h \
 		   lft_dds.h  ddsent.h sgadds.h wgadds.h ddsmid.h 

gai.h_EXPDIR		= /usr/include/gai/
60x_regs.h_EXPDIR 	= /usr/include/graphics/
EXPDIR			= /usr/include/

gai.h_IDIR	= /usr/include/gai/
IDIR		= /usr/include/
ILIST   	= ${INSTALL_FILES}


.if exists (${TARGET_MACHINE}/machdep.mk)
.include <${TARGET_MACHINE}/machdep.mk>
.endif

.include <${RULES_MK}>
