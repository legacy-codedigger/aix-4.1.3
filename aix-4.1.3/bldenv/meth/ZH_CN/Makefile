# @(#)73	1.1  src/bldenv/meth/ZH_CN/Makefile, ils-zh_CN, bos41B, 9504A 12/16/94 16:53:14
#
#   COMPONENT_NAME: CFGNLS
#
#   FUNCTIONS: Makefile for Chinese Methods
#
#   ORIGINS: 27
#
#   IBM CONFIDENTIAL -- (IBM Confidential Restricted when
#   combined with the aggregated modules for this product)
#                    SOURCE MATERIALS
#
#   (C) COPYRIGHT International Business Machines Corp. 1994
#   All Rights Reserved
#   US Government Users Restricted Rights - Use, duplication or
#   disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#

VPATH			= ${MAKETOP}/bos/usr/lib/nls/loc/locale/ZH_CN:${MAKETOP}/bos/kernel:${MAKETOP}/bos/usr/include
HFILES			= local_includes
INCFLAGS		= -I./includes
PROGRAMS		= ZH_CN_meth

OFILES		= \
	ZH_CN_meth.o \
	__mblen_utf8cn.o \
	__mbstopcs_utf8cn.o \
	__mbstowcs_utf8cn.o \
	__mbtopc_utf8cn.o \
	__mbtowc_utf8cn.o \
	__pcstombs_utf8cn.o \
	__pctomb_utf8cn.o \
	__wcstombs_utf8cn.o \
	__wcswidth_utf8cn.o \
	__wctomb_utf8cn.o \
	__wcwidth_utf8cn.o

STRIP_FLAG	=
LDFLAGS = -bnso -H8 -bh:5 -bI:/lib/syscalls.exp -estd_method_hdl

ILIST 		= ${PROGRAMS}
IDIR		= /usr/lib/nls/loc/methods/

.include <${RULES_MK}>

local_includes : stdlib.h sys/localedef.h sys/lc_core.h sys/lc_sys.h
	${TOUCH} ${.TARGET}
	${RM} -fr includes
	${MKDIR} -p includes/sys
	${CP} ${stdlib.h:P} includes
	${CP} ${sys/localedef.h:P} includes/sys
	${CP} ${sys/lc_core.h:P} includes/sys
	${CP} ${sys/lc_sys.h:P} includes/sys

