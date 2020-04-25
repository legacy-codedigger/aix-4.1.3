/* @(#)95	1.2.1.1  src/bos/usr/lib/nls/loc/jim/jmnt/_Mdaha.t, libKJI, bos411, 9428A410j 7/23/92 03:21:32 */
/*
 * COMPONENT_NAME :	Japanese Input Method - Kanji Monitor
 *
 * ORIGINS :		27 (IBM)
 *
 * IBM CONFIDENTIAL -- (IBM Confidential Restricted when
 * combined with the aggregated modules for this product)
 *                  SOURCE MATERIALS
 * (C) COPYRIGHT International Business Machines Corp. 1989
 * All Rights Reserved
 * Licensed Materials - Property of IBM
 *
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

/********************* START OF MODULE SPECIFICATIONS **********************
 *
 * MODULE NAME:         _Mdaha.t
 *
 * DESCRIPTIVE NAME:    Dakuten handakuten conversiontable.
 *
 * COPYRIGHT:           5601-061 COPYRIGHT IBM CORP 1988
 *                      LICENSED MATERIAL-PROGRAM PROPERTY OF IBM
 *                      REFER TO COPYRIGHT INSTRUCTIONS FORM NO.G120-2083
 *
 * STATUS:              Kanji Monitor V1.0
 *
 * CLASSIFICATION:      OCO Source Material - IBM Confidential.
 *                      (IBM Confidential-Restricted when aggregated)
 *
 * FUNCTION:            Dakuten/handakuten conversion table.
 *
 * NOTES:               _Mdaha process table.
 *
 *
 * MODULE TYPE:         Table.
 *
 *  PROCESSOR:          C
 *
 *  MODULE SIZE:        NA. ( Included in module _Mdaha(). )
 *
 *  ATTRIBUTE:          Reentrant
 *
 * ENTRY POINT:         N.A.
 *
 *  PURPOSE:            See Function.
 *
 *  LINKAGE:            #include _Mdaha.h
 *
 *  INPUT:              NA.
 *
 *
 *  OUTPUT:             NA.
 *
 * EXIT-NORMAL:         N.A.
 *
 *
 * EXIT-ERROR:          N.A.
 *
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
 *  CONTROL BLOCK:      See Below.
 *
 *   INPUT:             DBCS Editor Control Block(DECB,DECB_FLD).
 *                              NA.
 *                      Extended Information Block(EXT).
 *                              NA.
 *                      Kanji Monitor Controle Block(KCB).
 *                              NA.
 *                      Kanji Monitor Internal Save Area(KMISA,FSB).
 *                              NA.
 *                      Trace Block(TRB).
 *                              NA.
 *
 *   OUTPUT:            DBCS Editor Control Block(DECB,DECB_FLD).
 *                              NA.
 *                      Extended Information Block(EXT).
 *                              NA.
 *                      Kanji Monitor Controle Block(KCB).
 *                              NA.
 *                      Kanji Monitor Internal Save Area(KMISA,FSB).
 *                              NA.
 *                      Trace Block(TRB).
 *                              NA.
 *
 * TABLES:              Table Defines.
 *                              NA.
 *
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
 *      Dakuten/Handakuten conversion table. ( _Mdaha() )
 */
static  struct  table
{
        uchar   t1[4];
        uchar   t2[4];
} td[] =
{
/* hiragana */
{{0x82,0xa9,0xde,0x00},{0x82,0xaa,0x00,0x00}},  /* ga */
{{0x82,0xab,0xde,0x00},{0x82,0xac,0x00,0x00}},  /* gi */
{{0x82,0xad,0xde,0x00},{0x82,0xae,0x00,0x00}},  /* gu */
{{0x82,0xaf,0xde,0x00},{0x82,0xb0,0x00,0x00}},  /* ge */
{{0x82,0xb1,0xde,0x00},{0x82,0xb2,0x00,0x00}},  /* go */

{{0x82,0xb3,0xde,0x00},{0x82,0xb4,0x00,0x00}},  /* za */
{{0x82,0xb5,0xde,0x00},{0x82,0xb6,0x00,0x00}},  /* zi */
{{0x82,0xb7,0xde,0x00},{0x82,0xb8,0x00,0x00}},  /* zu */
{{0x82,0xb9,0xde,0x00},{0x82,0xba,0x00,0x00}},  /* ze */
{{0x82,0xbb,0xde,0x00},{0x82,0xbc,0x00,0x00}},  /* zo */

{{0x82,0xbd,0xde,0x00},{0x82,0xbe,0x00,0x00}},  /* da */
{{0x82,0xbf,0xde,0x00},{0x82,0xc0,0x00,0x00}},  /* di */
{{0x82,0xc2,0xde,0x00},{0x82,0xc3,0x00,0x00}},  /* du */
{{0x82,0xc4,0xde,0x00},{0x82,0xc5,0x00,0x00}},  /* de */
{{0x82,0xc6,0xde,0x00},{0x82,0xc7,0x00,0x00}},  /* do */

{{0x82,0xcd,0xde,0x00},{0x82,0xce,0x00,0x00}},  /* ba */
{{0x82,0xcd,0xdf,0x00},{0x82,0xcf,0x00,0x00}},  /* pa */
{{0x82,0xd0,0xde,0x00},{0x82,0xd1,0x00,0x00}},  /* bi */
{{0x82,0xd0,0xdf,0x00},{0x82,0xd2,0x00,0x00}},  /* pi */
{{0x82,0xd3,0xde,0x00},{0x82,0xd4,0x00,0x00}},  /* bu */
{{0x82,0xd3,0xdf,0x00},{0x82,0xd5,0x00,0x00}},  /* pu */
{{0x82,0xd6,0xde,0x00},{0x82,0xd7,0x00,0x00}},  /* be */
{{0x82,0xd6,0xdf,0x00},{0x82,0xd8,0x00,0x00}},  /* pe */
{{0x82,0xd9,0xde,0x00},{0x82,0xda,0x00,0x00}},  /* bo */
{{0x82,0xd9,0xdf,0x00},{0x82,0xdb,0x00,0x00}},  /* po */

/* katakana */
{{0x83,0x45,0xde,0x00},{0x83,0x94,0x00,0x00}},  /* vu */

{{0x83,0x4a,0xde,0x00},{0x83,0x4b,0x00,0x00}},  /* ga */
{{0x83,0x4c,0xde,0x00},{0x83,0x4d,0x00,0x00}},  /* gi */
{{0x83,0x4e,0xde,0x00},{0x83,0x4f,0x00,0x00}},  /* gu */
{{0x83,0x50,0xde,0x00},{0x83,0x51,0x00,0x00}},  /* ge */
{{0x83,0x52,0xde,0x00},{0x83,0x53,0x00,0x00}},  /* go */

{{0x83,0x54,0xde,0x00},{0x83,0x55,0x00,0x00}},  /* za */
{{0x83,0x56,0xde,0x00},{0x83,0x57,0x00,0x00}},  /* zi */
{{0x83,0x58,0xde,0x00},{0x83,0x59,0x00,0x00}},  /* zu */
{{0x83,0x5a,0xde,0x00},{0x83,0x5b,0x00,0x00}},  /* ze */
{{0x83,0x5c,0xde,0x00},{0x83,0x5d,0x00,0x00}},  /* zo */

{{0x83,0x5e,0xde,0x00},{0x83,0x5f,0x00,0x00}},  /* da */
{{0x83,0x60,0xde,0x00},{0x83,0x61,0x00,0x00}},  /* di */
{{0x83,0x63,0xde,0x00},{0x83,0x64,0x00,0x00}},  /* du */
{{0x83,0x65,0xde,0x00},{0x83,0x66,0x00,0x00}},  /* de */
{{0x83,0x67,0xde,0x00},{0x83,0x68,0x00,0x00}},  /* do */

{{0x83,0x6e,0xde,0x00},{0x83,0x6f,0x00,0x00}},  /* ba */
{{0x83,0x6e,0xdf,0x00},{0x83,0x70,0x00,0x00}},  /* pa */
{{0x83,0x71,0xde,0x00},{0x83,0x72,0x00,0x00}},  /* bi */
{{0x83,0x71,0xdf,0x00},{0x83,0x73,0x00,0x00}},  /* pi */
{{0x83,0x74,0xde,0x00},{0x83,0x75,0x00,0x00}},  /* bu */
{{0x83,0x74,0xdf,0x00},{0x83,0x76,0x00,0x00}},  /* pu */
{{0x83,0x77,0xde,0x00},{0x83,0x78,0x00,0x00}},  /* be */
{{0x83,0x77,0xdf,0x00},{0x83,0x79,0x00,0x00}},  /* pe */
{{0x83,0x7a,0xde,0x00},{0x83,0x7b,0x00,0x00}},  /* bo */
{{0x83,0x7a,0xdf,0x00},{0x83,0x7c,0x00,0x00}}   /* po */
};

/* Dakuten conversion table size. */
#define TABSIZE ( sizeof(td)/sizeof(struct table) )