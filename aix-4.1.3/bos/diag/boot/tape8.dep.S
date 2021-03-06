# @(#)08	1.8  src/bos/diag/boot/tape8.dep.S, diagboot, bos411, 9440C411a 10/7/94 16:44:58
# COMPONENT_NAME: DIAGBOOT
#
# FUNCTIONS: Diagnostic tape 8 Contents File
#
# ORIGINS: 27
#
# (C) COPYRIGHT International Business Machines Corp. 1994
# All Rights Reserved
# Licensed Materials - Property of IBM
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
########################################################################
#	Product topology
./usr/lpp/diagnostics/bin/umlc
./usr/lpp/diagnostics/catalog/default/umlc.cat
./usr/bin/ls
#	configuration service aid
./usr/sbin/lscfg
./usr/lpp/diagnostics/bin/ucfgvpd
./usr/lpp/diagnostics/catalog/default/ucfgvpd.cat
#       CEREADME
./usr/lpp/diagnostics/CEREADME
./usr/lpp/diagnostics/bin/uhint
./usr/lpp/diagnostics/catalog/default/uhint.cat
#	diagnostics test list service aid
./usr/lpp/diagnostics/bin/udtl
./usr/lpp/diagnostics/catalog/default/udtl.cat
#	display service aids
./usr/lib/drivers/middd_load
#./usr/lib/drivers/bbldd
./usr/lpp/diagnostics/bin/u5081
#./usr/lpp/diagnostics/bin/unep
./usr/lpp/diagnostics/catalog/default/u5081.cat
#./usr/lpp/diagnostics/catalog/default/unep.cat
#./usr/lpp/diagnostics/catalog/default/ubblue.cat
./usr/lpp/diagnostics/bin/usky
./usr/lpp/diagnostics/bin/uskym
#./usr/lpp/diagnostics/bin/ugem
./usr/lpp/diagnostics/bin/uped
./usr/lpp/diagnostics/bin/ulega2
./usr/lpp/diagnostics/bin/usga
./usr/lpp/diagnostics/bin/uwga
#./usr/lpp/diagnostics/bin/ubblue
./usr/lib/microcode/8ee3lb.00.01
./usr/lib/microcode/8ee3l2b.00.01
./usr/lib/microcode/8ee3xb.01.01
./usr/lib/microcode/8ee3nb.01.01
./usr/lib/microcode/8ee3ld1.00.04
./usr/lib/microcode/8ee3ld2.00.04
./usr/lib/microcode/8ee3ld3.00.04
./usr/lib/microcode/8ee3ld4.00.04
./usr/lib/microcode/8ee3ld5.00.04
./usr/lib/microcode/8ee3p4d1.00.01
./usr/lib/microcode/8ee3p4d2.00.01
./usr/lib/microcode/8ee3p4d3.00.01
./usr/lib/microcode/8ee3p4d4.00.01
./usr/lib/microcode/8ee3p4d5.00.01
