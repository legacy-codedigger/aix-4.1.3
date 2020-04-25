/* @(#)48        1.3 8/27/91 12:25:40  */
/*
 * COMPONENT_NAME: User Dictionary Utility
 *
 * FUNCTIONS: header file
 *
 * ORIGINS: IBM
 *
 * IBM CONFIDENTIAL -- (IBM Confidential Restricted when
 * combined with the aggregated modules for this product)
 *                  SOURCE MATERIALS
 * (C) COPYRIGHT International Business Machines Corp. 1989, 1991
 * All Rights Reserved
 * Licensed Material - Property of IBM
 *
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

/********************* START OF MODULE SPECIFICATIONS **********************
 *
 * MODULE NAME:         kuhtdc.t
 *
 * DESCRIPTIVE NAME:    Conversion table(PC code to PC kanji code.)
 *
 * COPYRIGHT:           5756-030 COPYRIGHT IBM CORP 1991
 *                      LICENSED MATERIAL-PROGRAM PROPERTY OF IBM
 *                      REFER TO COPYRIGHT INSTRUCTIONS FORM NO.G120-2083
 *
 * STATUS:              User Dictionary Maintenance for AIX 3.2
 *
 * CLASSIFICATION:      OCO Source Material - IBM Confidential.
 *                      (IBM Confidential-Restricted when aggregated)
 *
 * FUNCTION:            the convert table of PC code to PC kanji code.
 *
 * NOTES:               NA.
 *
 *
 * MODULE TYPE:         Table
 *
 *  PROCESSOR:          C
 *
 *  MODULE SIZE:        NA. ( Include in modele kuhtdc(). )
 *
 *  ATTRIBUTE:          Reentrant
 *
 * ENTRY POINT:         NA.
 *
 *  PURPOSE:            See Function.
 *
 *  LINKAGE:            #include kuhtdc.t
 *
 *  INPUT:              NA.
 *
 *  OUTPUT:             NA.
 *
 * EXIT-NORMAL:         NA.
 *
 *
 * EXIT-ERROR:          NA.
 *
 * EXTERNAL REFERENCES: See Below
 *
 *  ROUTINES:           Kanji Project Subroutines.
 *                              NA.
 *                      Standard Library.
 *                              NA.
 *                      Advanced Display Graphics Support Library(GSL).
 *                              NA.
 *
 *  DATA AREAS:         NA.
 *
 *  CONTROL BLOCK:      NA.
 *
 * TABLES:              Table Defines.
 *                              NA.
 * MACROS:              Kanji Project Macro Library.
 *                              NA.
 *                      Standard Macro Library.
 *                              NA.
 *
 * CHANGE ACTIVITY:     NA.
 *
 ********************* END OF MODULE SPECIFICATIONS ************************
 */

/*
 *      Conversion table.
 */
static  uchar   tdc_tbl[256][6] =
{
/*  00 -- 0f  */
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},

/*  10 -- 1f  */
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},

/*  20 -- 2f  */
{0x81,0x40,0x81,0x40,0x81,0x40},{0x81,0x49,0x81,0x49,0x81,0x49},
{0xfa,0x57,0xfa,0x57,0xfa,0x57},{0x81,0x94,0x81,0x94,0x81,0x94},
{0x81,0x90,0x81,0x90,0x81,0x90},{0x81,0x93,0x81,0x93,0x81,0x93},
{0x81,0x95,0x81,0x95,0x81,0x95},{0xfa,0x56,0xfa,0x56,0xfa,0x56},
{0x81,0x69,0x81,0x69,0x81,0x69},{0x81,0x6a,0x81,0x6a,0x81,0x6a},
{0x81,0x96,0x81,0x96,0x81,0x96},{0x81,0x7b,0x81,0x7b,0x81,0x7b},
{0x81,0x43,0x81,0x43,0x81,0x43},{0x81,0x7c,0x81,0x7c,0x81,0x7c},
{0x81,0x44,0x81,0x44,0x81,0x44},{0x81,0x5e,0x81,0x5e,0x81,0x5e},

/*  30 -- 3f  */
{0x82,0x4f,0x82,0x4f,0x82,0x4f},{0x82,0x50,0x82,0x50,0x82,0x50},
{0x82,0x51,0x82,0x51,0x82,0x51},{0x82,0x52,0x82,0x52,0x82,0x52},
{0x82,0x53,0x82,0x53,0x82,0x53},{0x82,0x54,0x82,0x54,0x82,0x54},
{0x82,0x55,0x82,0x55,0x82,0x55},{0x82,0x56,0x82,0x56,0x82,0x56},
{0x82,0x57,0x82,0x57,0x82,0x57},{0x82,0x58,0x82,0x58,0x82,0x58},
{0x81,0x46,0x81,0x46,0x81,0x46},{0x81,0x47,0x81,0x47,0x81,0x47},
{0x81,0x83,0x81,0x83,0x81,0x83},{0x81,0x81,0x81,0x81,0x81,0x81},
{0x81,0x84,0x81,0x84,0x81,0x84},{0x81,0x48,0x81,0x48,0x81,0x48},

/*  40 -- 4f  */
{0x81,0x97,0x81,0x97,0x81,0x97},{0x82,0x60,0x82,0x60,0x82,0x60},
{0x82,0x61,0x82,0x61,0x82,0x61},{0x82,0x62,0x82,0x62,0x82,0x62},
{0x82,0x63,0x82,0x63,0x82,0x63},{0x82,0x64,0x82,0x64,0x82,0x64},
{0x82,0x65,0x82,0x65,0x82,0x65},{0x82,0x66,0x82,0x66,0x82,0x66},
{0x82,0x67,0x82,0x67,0x82,0x67},{0x82,0x68,0x82,0x68,0x82,0x68},
{0x82,0x69,0x82,0x69,0x82,0x69},{0x82,0x6a,0x82,0x6a,0x82,0x6a},
{0x82,0x6b,0x82,0x6b,0x82,0x6b},{0x82,0x6c,0x82,0x6c,0x82,0x6c},
{0x82,0x6d,0x82,0x6d,0x82,0x6d},{0x82,0x6e,0x82,0x6e,0x82,0x6e},

/*  50 -- 5f  */
{0x82,0x6f,0x82,0x6f,0x82,0x6f},{0x82,0x70,0x82,0x70,0x82,0x70},
{0x82,0x71,0x82,0x71,0x82,0x71},{0x82,0x72,0x82,0x72,0x82,0x72},
{0x82,0x73,0x82,0x73,0x82,0x73},{0x82,0x74,0x82,0x74,0x82,0x74},
{0x82,0x75,0x82,0x75,0x82,0x75},{0x82,0x76,0x82,0x76,0x82,0x76},
{0x82,0x77,0x82,0x77,0x82,0x77},{0x82,0x78,0x82,0x78,0x82,0x78},
{0x82,0x79,0x82,0x79,0x82,0x79},{0x81,0x6d,0x81,0x6d,0x81,0x6d},
{0x81,0x8f,0x81,0x8f,0x81,0x8f},{0x81,0x6e,0x81,0x6e,0x81,0x6e},
{0x81,0x4f,0x81,0x4f,0x81,0x4f},{0x81,0x51,0x81,0x51,0x81,0x51},

/*  60 -- 6f  */
{0x81,0x4d,0x81,0x4d,0x81,0x4d},{0x82,0x81,0x82,0x81,0x82,0x81},
{0x82,0x82,0x82,0x82,0x82,0x82},{0x82,0x83,0x82,0x83,0x82,0x83},
{0x82,0x84,0x82,0x84,0x82,0x84},{0x82,0x85,0x82,0x85,0x82,0x85},
{0x82,0x86,0x82,0x86,0x82,0x86},{0x82,0x87,0x82,0x87,0x82,0x87},
{0x82,0x88,0x82,0x88,0x82,0x88},{0x82,0x89,0x82,0x89,0x82,0x89},
{0x82,0x8a,0x82,0x8a,0x82,0x8a},{0x82,0x8b,0x82,0x8b,0x82,0x8b},
{0x82,0x8c,0x82,0x8c,0x82,0x8c},{0x82,0x8d,0x82,0x8d,0x82,0x8d},
{0x82,0x8e,0x82,0x8e,0x82,0x8e},{0x82,0x8f,0x82,0x8f,0x82,0x8f},

/*  70 -- 7f  */
{0x82,0x90,0x82,0x90,0x82,0x90},{0x82,0x91,0x82,0x91,0x82,0x91},
{0x82,0x92,0x82,0x92,0x82,0x92},{0x82,0x93,0x82,0x93,0x82,0x93},
{0x82,0x94,0x82,0x94,0x82,0x94},{0x82,0x95,0x82,0x95,0x82,0x95},
{0x82,0x96,0x82,0x96,0x82,0x96},{0x82,0x97,0x82,0x97,0x82,0x97},
{0x82,0x98,0x82,0x98,0x82,0x98},{0x82,0x99,0x82,0x99,0x82,0x99},
{0x82,0x9a,0x82,0x9a,0x82,0x9a},{0x81,0x6f,0x81,0x6f,0x81,0x6f},
{0x81,0x62,0x81,0x62,0x81,0x62},{0x81,0x70,0x81,0x70,0x81,0x70},
{0x81,0x50,0x81,0x50,0x81,0x50},{NULL,NULL,NULL,NULL,NULL,NULL},

/*  80 -- 8f  */
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},

/*  90 -- 9f  */
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},

/*  a0 -- af  */
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,0x81,0x42,0x81,0x42},
{NULL,NULL,0x81,0x75,0x81,0x75},{NULL,NULL,0x81,0x76,0x81,0x76},
{NULL,NULL,0x81,0x41,0x81,0x41},{NULL,NULL,0x81,0x45,0x81,0x45},
{NULL,NULL,0x83,0x92,0x82,0xf0},{NULL,NULL,0x83,0x40,0x82,0x9f},
{NULL,NULL,0x83,0x42,0x82,0xa1},{NULL,NULL,0x83,0x44,0x82,0xa3},
{NULL,NULL,0x83,0x46,0x82,0xa5},{NULL,NULL,0x83,0x48,0x82,0xa7},
{NULL,NULL,0x83,0x83,0x82,0xe1},{NULL,NULL,0x83,0x85,0x82,0xe3},
{NULL,NULL,0x83,0x87,0x82,0xe5},{NULL,NULL,0x83,0x62,0x82,0xc1},

/*  b0 -- bf  */
{NULL,NULL,0x81,0x5b,0x81,0x5b},{NULL,NULL,0x83,0x41,0x82,0xa0},
{NULL,NULL,0x83,0x43,0x82,0xa2},{NULL,NULL,0x83,0x45,0x82,0xa4},
{NULL,NULL,0x83,0x47,0x82,0xa6},{NULL,NULL,0x83,0x49,0x82,0xa8},
{NULL,NULL,0x83,0x4a,0x82,0xa9},{NULL,NULL,0x83,0x4c,0x82,0xab},
{NULL,NULL,0x83,0x4e,0x82,0xad},{NULL,NULL,0x83,0x50,0x82,0xaf},
{NULL,NULL,0x83,0x52,0x82,0xb1},{NULL,NULL,0x83,0x54,0x82,0xb3},
{NULL,NULL,0x83,0x56,0x82,0xb5},{NULL,NULL,0x83,0x58,0x82,0xb7},
{NULL,NULL,0x83,0x5a,0x82,0xb9},{NULL,NULL,0x83,0x5c,0x82,0xbb},

/*  c0 -- cf  */
{NULL,NULL,0x83,0x5e,0x82,0xbd},{NULL,NULL,0x83,0x60,0x82,0xbf},
{NULL,NULL,0x83,0x63,0x82,0xc2},{NULL,NULL,0x83,0x65,0x82,0xc4},
{NULL,NULL,0x83,0x67,0x82,0xc6},{NULL,NULL,0x83,0x69,0x82,0xc8},
{NULL,NULL,0x83,0x6a,0x82,0xc9},{NULL,NULL,0x83,0x6b,0x82,0xca},
{NULL,NULL,0x83,0x6c,0x82,0xcb},{NULL,NULL,0x83,0x6d,0x82,0xcc},
{NULL,NULL,0x83,0x6e,0x82,0xcd},{NULL,NULL,0x83,0x71,0x82,0xd0},
{NULL,NULL,0x83,0x74,0x82,0xd3},{NULL,NULL,0x83,0x77,0x82,0xd6},
{NULL,NULL,0x83,0x7a,0x82,0xd9},{NULL,NULL,0x83,0x7d,0x82,0xdc},

/*  d0 -- df  */
{NULL,NULL,0x83,0x7e,0x82,0xdd},{NULL,NULL,0x83,0x80,0x82,0xde},
{NULL,NULL,0x83,0x81,0x82,0xdf},{NULL,NULL,0x83,0x82,0x82,0xe0},
{NULL,NULL,0x83,0x84,0x82,0xe2},{NULL,NULL,0x83,0x86,0x82,0xe4},
{NULL,NULL,0x83,0x88,0x82,0xe6},{NULL,NULL,0x83,0x89,0x82,0xe7},
{NULL,NULL,0x83,0x8a,0x82,0xe8},{NULL,NULL,0x83,0x8b,0x82,0xe9},
{NULL,NULL,0x83,0x8c,0x82,0xea},{NULL,NULL,0x83,0x8d,0x82,0xeb},
{NULL,NULL,0x83,0x8f,0x82,0xed},{NULL,NULL,0x83,0x93,0x82,0xf1},
{NULL,NULL,0x81,0x4a,0x81,0x4a},{NULL,NULL,0x81,0x4b,0x81,0x4b},

/*  e0 -- ef  */
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},

/*  f0 -- ff  */
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL},
{NULL,NULL,NULL,NULL,NULL,NULL},{NULL,NULL,NULL,NULL,NULL,NULL}
};
