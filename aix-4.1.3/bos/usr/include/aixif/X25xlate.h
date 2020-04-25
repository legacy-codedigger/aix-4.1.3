/* @(#)08	1.5  src/bos/usr/include/aixif/X25xlate.h, sockinc, bos411, 9428A410j 11/5/93 11:59:34 */
/*
 * COMPONENT_NAME: (CMDNET) Network commands 
 *
 * FUNCTIONS:
 *
 * ORIGINS: 27 
 *
 * (C) COPYRIGHT International Business Machines Corp. 1988, 1989 
 * All Rights Reserved
 * Licensed Materials - Property of IBM
 *
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 *
 */

#ifndef _H_X25xlate
#define _H_X25xlate

#include <odmi.h>

struct X25xlate {
	long _id;
	long _reserved;
	long _scratch;
	short find_id;
	short vc_type;
	short rcv_wndsiz;
	short xmit_wndsiz;
	char remote_dte[16];
	short rcv_pktsiz;
	short xmit_pktsiz;
	char opt_fac[33];	/* 32 ascii digits (16 hex bytes) + null */
	char callusr_data[33];	/* 32 ascii digits (16 hex bytes) + null */
	char rpoa_selec[40];
	short cug_indx;
	short cug_indxout;
	short logical_chann;
	short port_num;
	char host[40];
	char hostaddr[40];
	short ccitt_support;
	};
#define X25xlate_Descs 17

extern struct Class X25xlate_CLASS[];
#define get_X25xlate_list(a,b,c,d,e) (struct X25xlate * )odm_get_list(a,b,c,d,e)

#endif  /*_H_X25xlate */
