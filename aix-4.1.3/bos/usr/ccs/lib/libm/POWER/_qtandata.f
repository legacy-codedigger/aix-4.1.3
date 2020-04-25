* @(#)67	1.1  src/bos/usr/ccs/lib/libm/POWER/_qtandata.f, libm, bos411, 9428A410j 12/13/90 19:46:10
* COMPONENT_NAME: LIBCCNV
*
* FUNCTIONS: none
*
* ORIGINS: 55
*
*                  SOURCE MATERIAL
*
* Copyright (c) ISQUARE, Inc. 1990

*******************************************************************
*            PROGRAM: Data for Quad-Precision TANGENT             *
*            AUTHOR:  ISQUARE, Inc (V. Markstein)                 *
*            DATE:    4/4/90                                      *
*            MOD:     5/1/90 C --> FORTRAN                        *
*                     11/01/90 port --> RS/6000                   *
*            NOTICE:  Copyright (c) ISQUARE, Inc. 1990            *
*******************************************************************

       real*8           tancoeff16(2,1:10)  /

     +     z'3FD5555555555555',z'3C7555555555554C',
     +     z'3FC1111111111111',z'3C41111111327FD4',
     +     z'3FABA1BA1BA1BA1C',z'BC47917B8730ECE8',
     +     z'3F9664F4882C10FA',z'BC08946C04337BC0',
     +     z'3F8226E355E6C239',z'BC16F3F85EB82A9C',
     +     z'3F6D6D3D0E159BD4',z'BC0BF02E91A39520',
     +     z'3F57DA3644E2BF4A',z'3BF4CC81FDF36B54',
     +     z'3F435582B4E9E8D9',z'BBEAAB03E323ED60',
     +     z'3F2F5712DCD1E82C',z'3BA67F16B4DC7710',
     +     z'3F19C9D246D3C681',z'3BA2B1F2BC709028' /

       real*8           cotcoeff16(2,1:9) /
     +     z'3FD5555555555555',z'3C75555555555550',
     +     z'3F96C16C16C16C17',z'BC2F49F49F46AA0E',
     +     z'3F61566ABC011567',z'BC050FFB0703E386',
     +     z'3F2BBD779334EF0B',z'BBC541A35FEBE630',
     +     z'3EF66A8F2BF70EDF',z'BB960EEE58853E10',
     +     z'3EC22805D642B849',z'3B49A32492C33F58',
     +     z'3E8D6DB2D58EAF82',z'3B103D9BCE4CCBB8',
     +     z'3E57DA1C0FF6D02F',z'3AFBDB54E9F15B6C',
     +     z'3E2396A66CC1B8E2',z'3AC04FB70AEC86D2' /

       real*8           tancoeff(2,1:7) /
     +      z'3ff0000000000000',z'0000000000000000',
     +      z'3FD5555555555555',z'3C75555555555549',
     +      z'3FC1111111111111',z'3C41111117771B40',
     +      z'3FABA1BA1BA1BA1C',z'BC47A47153F3999C',
     +      z'3F9664F4882C119E',z'3C2A931E61CFDED8',
     +      z'3F8226E35546FD80',z'BC22700ADC5E76C2',
     +      z'3F6D6DCBC6BCC1FD',z'3C0EB3DD1EBC7C6C' /

       real*8           tantbl(5,6:51) /
     +  z'3FB8000000095B76',z'3FB81210420B0DDD',z'BBADBC24D03EE61B',
     +                      z'40254552EE62D182',z'BC23A778D4D4C82D',
     +  z'3FBC000000F6D8DC',z'3FBC1CB885A84FC9',z'BBA0734FD6E646D7',
     +                      z'40223676163ABE75',z'3C19C932FC451F09',
     +  z'3FC00000002177FC',z'3FC01577AF3710E9',z'BBBB1D6825554EB9',
     +                      z'401FD549F004A93B',z'3BF1B140750F85AD',
     +  z'3FC200000000C2F1',z'3FC21E9E0175E475',z'3BBD91B3A31924A6',
     +                      z'401C41B6E169DC8D',z'3C057A492ABEE9CF',
     +  z'3FC40000004D703E',z'3FC42A13DFCB15A0',z'BB94ED3B3620DA54',
     +                      z'4019642DFDBA3F8F',z'3BBB47D880CDA3C6',
     +  z'3FC60000000CAC24',z'3FC6381F200F2AED',z'3BBF39670381AC58',
     +                      z'40170B09205DE76C',z'BBFEFF3A14B71AB8',
     +  z'3FC8000000473296',z'3FC84906F15CE818',z'3BB03E1136E0F2D3',
     +                      z'4015152ECDA71D37',z'BBE77628DB83D025',
     +  z'3FCA000000B2D7A8',z'3FCA5D140081E4D7',z'BBC0188C9C6AB2DE',
     +                      z'40136BB4BA046E82',z'BC0F80BAA34DE4A8',
     +  z'3FCC00000066CDE2',z'3FCC7490A23DC3B4',z'BBCB362FA69FE4DA',
     +                      z'4011FE3CA58F0345',z'BBFCB31C2F2152B4',
     +  z'3FCE000000252978',z'3FCE8FC901177F3A',z'BBA5E8BA10809B66',
     +                      z'4010C0C5ABFB3524',z'BBFA678BCA50DEEC',
     +  z'3FD0000000638D21',z'3FD05785A4A65715',z'3BC293657FDA2145',
     +                      z'400F549E3203FCA2',z'3BE2971C11C2A8A3',
     +  z'3FD10000002C35A8',z'3FD16953EACF2DA7',z'3BC40A91BA0FE60F',
     +                      z'400D67ECF327EFBB',z'3C05D1EC4B5FCFCB',
     +  z'3FD20000001C3AB2',z'3FD27D78B42A0CE9',z'3BCCED21016F79E8',
     +                      z'400BB0C1F1319BD2',z'BC051F682CBAE56E',
     +  z'3FD30000000F9C12',z'3FD3941EADA8C533',z'BBBB6B8308722CFA',
     +                      z'400A26A8A4D1FD5D',z'BBF11692FACCF74A',
     +  z'3FD40000000B6423',z'3FD4AD71ED5E62C2',z'BBAD55903A1538DA',
     +                      z'4008C2DD5F133FBD',z'BBDDCA831B096361',
     +  z'3FD500000017ECB5',z'3FD5C9A0105DB3D0',z'3BCE9A3CD13B3D17',
     +                      z'40077FE63A7531D9',z'3BE036AE48AA7EC4',
     +  z'3FD6000000785229',z'3FD6E8D85AEC50EC',z'BBC83B796A9E4244',
     +                      z'4006594826E6F5E4',z'BBFE36C352F1803B',
     +  z'3FD70000001C8263',z'3FD80B4BD8D44659',z'BBB499F2DC83C2D8',
     +                      z'40054B4F852854B9',z'3BFB7522CB8BEDBE',
     +  z'3FD800000092A4EC',z'3FD9312D86455645',z'3B93DC769413BABA',
     +                      z'400452E695D5E9C0',z'BBDBF03735429FA9',
     +  z'3FD9000000353578',z'3FDA5AB270323F27',z'BBD5E11A4F5FE60A',
     +                      z'40036D75EB84FD4A',z'BBE3A384FD52C107',
     +  z'3FDA0000002177A0',z'3FDB8811E4F7B2DE',z'3BC5B70A7D15AD3F',
     +                      z'400298CC1A74BDDF',z'3BD4190083E8A76D',
     +  z'3FDB00000071F1F6',z'3FDCB9859CFB26A0',z'3BC8BA6EF094701B',
     +                      z'4001D30AD7B1694B',z'BBFECEAB555C2BC9',
     +  z'3FDC00000071BD74',z'3FDDEF49EB35D726',z'BBCCC6A5DDB5912C',
     +                      z'40011A982075779C',z'BBF958522DBF4C5B',
     +  z'3FDD000000A18446',z'3FDF299DF3CB9E1D',z'BBDAB47B6F4E4DBE',
     +                      z'40006E1272BBF45D',z'3BE9A2882C8CD3D9',
     +  z'3FDE00000009F5E0',z'3FE03461F090AA3D',z'BBB6411F2E55E33D',
     +                      z'3FFF988EC8064412',z'BBE51DE07EC2ADBC',
     +  z'3FDF000000263EAE',z'3FE0D68092D62104',z'3BDD66208142D974',
     +                      z'3FFE68580C88DF44',z'BBDD8335D4838950',
     +  z'3FE00000002FD5FE',z'3FE17B4F5C31640E',z'BBCF7FD94387A68E',
     +                      z'3FFD49AD7DDFB168',z'3BF71CBF13808D41',
     +  z'3FE0800000760E88',z'3FE222F4AFFFC590',z'3BDD3CE822236C45',
     +                      z'3FFC3AF470DCC003',z'BBFBC120A2F987AC',
     +  z'3FE10000000F8806',z'3FE2CD98FEB5905C',z'3BE169C83A579A2C',
     +                      z'3FFB3AC27605E88C',z'BBC11C38B96450D3',
     +  z'3FE18000002B5E5D',z'3FE37B66F43D000E',z'3BD2830EBAC9646C',
     +                      z'3FFA47D66F7CCB9D',z'BBEB41B3171B37E1',
     +  z'3FE20000000A3C10',z'3FE42C8BA0F7A0E3',z'3BE38DF366A12B85',
     +                      z'3FF96112DACBFCBC',z'BBEFEF64EF1EA7D1',
     +  z'3FE2800000595422',z'3FE4E136B0CFA783',z'BBBA398CEE061521',
     +                      z'3FF88578FAA0A3DE',z'3BDA18454AE391EC',
     +  z'3FE300000026966D',z'3FE5999A9E477C73',z'BBCE4AC597E84259',
     +                      z'3FF7B424CEF83049',z'BBF35B989FE75083',
     +  z'3FE380000015B3FD',z'3FE655ECF397B5BE',z'BBE51A33112B4404',
     +                      z'3FF6EC49A1E2DBE5',z'3BB86EE493E45292',
     +  z'3FE4000000146EE3',z'3FE7166689F330B5',z'BBE353785A4867EE',
     +                      z'3FF62D2F215A3E9B',z'3BEA0C9EF65CC2CF',
     +  z'3FE48000000F229A',z'3FE7DB43D3A2EEDF',z'BBE0A454C31E28C0',
     +                      z'3FF5762EE1176AE6',z'BBE1C3BD493469EA',
     +  z'3FE50000002E680F',z'3FE8A4C52CF1484A',z'BB9432B2063946DC',
     +                      z'3FF4C6B2384B4991',z'3BD8E9D0F949DFE6',
     +  z'3FE5800000672096',z'3FE9732F3459A187',z'3BDDADD784F3E87C',
     +                      z'3FF41E306C72DBD4',z'BBEC67AEAE1EBB1F',
     +  z'3FE6000000B6C23F',z'3FEA46CB2D189DAF',z'3BB739F475A8271C',
     +                      z'3FF37C2D1B3BE6EB',z'BBC852038CECB4C0',
     +  z'3FE680000028A725',z'3FEB1FE76A3CF1FF',z'BBEA7D297EE6B9D1',
     +                      z'3FF2E036DC04F43A',z'3BED69F5AF37688F',
     +  z'3FE70000004CA480',z'3FEBFED7CD2DB8E2',z'BBCD123B0537EE2D',
     +                      z'3FF249E609D6492E',z'BBD3803280A8D415',
     +  z'3FE78000000FFDA8',z'3FECE3F642FE6158',z'3BD569F8793799F7',
     +                      z'3FF1B8DBBED5846E',z'3BD9797E39EAD48F',
     +  z'3FE80000001E1B0A',z'3FEDCFA361492AAF',z'BBDA3DECB61278D5',
     +                      z'3FF12CC0E58AA7DC',z'3BB3088E1168567F',
     +  z'3FE88000000B208A',z'3FEEC24707D4CEEF',z'BBE3FF761F807DFF',
     +                      z'3FF0A5456F3C80B0',z'BBCF3891E44E8437',
     +  z'3FE90000000657F8',z'3FEFBC511E0226B6',z'BBEC6FF55F02EDF6',
     +                      z'3FF0221F9DADF743',z'BBD42807FD02BF0B',
     +  z'3FE9800000655AE2',z'3FF05F1D31752EE7',z'BBD8BE76B0E002E9',
     +                      z'3FEF4616C9018897',z'BBDB4E55DEAF57E4' /