# @(#)88	1.27  src/bos/usr/ccs/lib/Makefile, Makefiles, bos411, 9434B411a  8/22/94  15:42:57
#
# COMPONENT_NAME:
#
# FUNCTIONS:
#
# ORIGINS: 27
#
# IBM CONFIDENTIAL -- (IBM Confidential Restricted when
# combined with the aggregated modules for this product)
#                  SOURCE MATERIALS
# (C) COPYRIGHT International Business Machines Corp. 1988, 1994
# All Rights Reserved
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
DES_DIR=libdes

EXPINC_SUBDIRS	= ${DES_DIR} libc libIN libcurses libdiag libtli libxti \
	libtli_r libxti_r libpthreads libasl

POWER_SUBDIRS	= \
	libblas libdiag librs2 libc128

EXPLIB_SUBDIRS	= \
	${DES_DIR} \
	proflib \
	libg libl libm libmi libsvid \
	libPW libplot libprint libld libswvpd librts \
	lib300 lib300s lib4014 lib450 liby libs libc libc_r \
	libs2 libiconv libi18n libim libtermcap libbsd libdbm \
	libdbx libIN libcurses libcur libasl libodm \
	libcfg liblvm libpthreads libqb libsrc ${${TARGET_MACHINE}_SUBDIRS} \
	libunpack libtli libxti libnetsvc libnetsvc_r libtli_r libxti_r \
	libpse

SUBDIRS		= \
	cflow ${EXPLIB_SUBDIRS}

.include <${RULES_MK}>

