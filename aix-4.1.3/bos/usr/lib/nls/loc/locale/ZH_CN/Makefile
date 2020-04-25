# @(#)28	1.1  src/bos/usr/lib/nls/loc/locale/ZH_CN/Makefile, ils-zh_CN, bos41B, 9504A 12/20/94 10:24:20
#
#   COMPONENT_NAME: cfgnls
#
#   FUNCTIONS:	none
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

VPATH 		= ${MAKETOP}bos/usr/lib/nls/charmap:${MAKETOP}bos/usr/lib/nls/loc/locale/zh_CN

CFLAGS		= -D_ILS_MACROS

LOCALE_SRC	= ZH_CN.UTF-8.src

CHARMAP		= UTF-8

LOCALES		= ${LOCALE_SRC:R}

OTHERS		= ${CHARMAP} ${LOCALE_SRC} ${LOCALES}

SHARED_LIBRARIES	= ZH_CN.o

SHARED_OFILES	= \
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

LIBS = libc.a
EXPORTS	= methods.exp

ILIST = ZH_CN.m ${SHARED_LIBRARIES} ${LOCALE_SRC} ${LOCALES}
IDIR = /usr/lib/nls/loc/
ZH_CN.m_IDIR	= /usr/lib/nls/loc/methods/
ZH_CN.o_IDIR	= /usr/lib/nls/loc/methods/

.include <${RULES_MK}>

BASEFLAGS	=-v -c -C '${_CCFLAGS_} -F${ODE_TOOLS}/etc/xlC.cfg' \
		 -P ${ODE_TOOLS}/usr
LDBINDFLAGS	=${LIBDIRS} -bbinder:${ODE_TOOLS}/usr/lib/bind \
		 -bglink:${ODE_TOOLS}/usr/lib/glink.o

METH_PATH	=-blibpath:/usr/lib/nls/loc/methods:/usr/lib:/lib

TMP_METH	=${ODE_TOOLS}/usr/lib/nls/loc/methods/ZH_CN_meth

LOCDEF_METH	=${BASEFLAGS} -L '${LDBINDFLAGS} ${METH_PATH}'

${LOCALES} : $${.TARGET:E} $${.TARGET:=.src} ${ZH_CN.m:P} ${SHARED_LIBRARIES}
	${LOCDEF} -f ${CHARMAP} -i ${.ALLSRC:M*.src} -m ${ZH_CN.m:P} \
	-M ${TMP_METH} ${LOCDEF_METH} ${.TARGET} || [ $$? -lt 2 ]

${LOCALE_SRC} :	${zh_CN.IBM-eucCN.src:P}
	${CP} ${.ALLSRC} ${.TARGET}

${CHARMAP} :	UTF-8.cm CN.csid
	${CAT} ${.ALLSRC} > ${.TARGET}
