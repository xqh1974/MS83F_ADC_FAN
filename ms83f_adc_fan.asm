//Deviec:MS83Fxx02
//-----------------------Variable---------------------------------
		_is_led_on		EQU		7AH
		_fan_speed		EQU		34H
		_Buff_AN6		EQU		2CH
		_Buff_AN7		EQU		2EH
		_Val_Volt		EQU		30H
		_over_load_cnt		EQU		32H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	222H 			//0009 	3A22
		LJUMP 	215H 			//000A 	3A15
		LDWI 	7H 			//000B 	2A07
		ORG		000CH

		//;MS83F_ADC_FAN.C: 267: char i,limit;
		//;MS83F_ADC_FAN.C: 268: Buff_AN7 = GET_ADC_VALUE(7,1);
		CLRR 	73H 			//000C 	0173
		INCR	73H,1 			//000D 	09F3
		LCALL 	105H 			//000E 	3105
		LDR 	74H,0 			//000F 	0874
		STR 	2FH 			//0010 	01AF
		LDR 	73H,0 			//0011 	0873
		STR 	2EH 			//0012 	01AE

		//;MS83F_ADC_FAN.C: 269: Val_Volt = (unsigned long)Buff_AN7*2*4*1000/1024;
		LDR 	2EH,0 			//0013 	082E
		ORG		0014H
		STR 	72H 			//0014 	01F2
		LDR 	2FH,0 			//0015 	082F
		STR 	73H 			//0016 	01F3
		LDWI 	3H 			//0017 	2A03
		CLRR 	74H 			//0018 	0174
		CLRR 	75H 			//0019 	0175
		STR 	24H 			//001A 	01A4
		BCR 	STATUS,0 		//001B 	1003
		ORG		001CH
		RLR 	72H,1 			//001C 	05F2
		RLR 	73H,1 			//001D 	05F3
		RLR 	74H,1 			//001E 	05F4
		RLR 	75H,1 			//001F 	05F5
		DECRSZ 	24H,1 		//0020 	0EA4
		LJUMP 	1BH 			//0021 	381B
		LDWI 	0H 			//0022 	2A00
		STR 	79H 			//0023 	01F9
		ORG		0024H
		LDWI 	3H 			//0024 	2A03
		CLRR 	78H 			//0025 	0178
		STR 	77H 			//0026 	01F7
		LDWI 	E8H 			//0027 	2AE8
		STR 	76H 			//0028 	01F6
		LCALL 	13DH 			//0029 	313D
		LDR 	72H,0 			//002A 	0872
		STR 	25H 			//002B 	01A5
		ORG		002CH
		LDR 	73H,0 			//002C 	0873
		STR 	26H 			//002D 	01A6
		LDR 	74H,0 			//002E 	0874
		STR 	27H 			//002F 	01A7
		LDR 	75H,0 			//0030 	0875
		STR 	28H 			//0031 	01A8
		LDWI 	AH 			//0032 	2A0A
		BCR 	STATUS,0 		//0033 	1003
		ORG		0034H
		RRR	28H,1 			//0034 	06A8
		RRR	27H,1 			//0035 	06A7
		RRR	26H,1 			//0036 	06A6
		RRR	25H,1 			//0037 	06A5
		ADDWI 	FFH 			//0038 	27FF
		BTSS 	STATUS,2 		//0039 	1D03
		LJUMP 	33H 			//003A 	3833
		LDR 	26H,0 			//003B 	0826
		ORG		003CH
		STR 	31H 			//003C 	01B1
		LDR 	25H,0 			//003D 	0825
		STR 	30H 			//003E 	01B0

		//;MS83F_ADC_FAN.C: 270: if(Val_Volt>4000)limit=140;
		LDWI 	FH 			//003F 	2A0F
		SUBWR 	31H,0 			//0040 	0C31
		LDWI 	A1H 			//0041 	2AA1
		BTSC 	STATUS,2 		//0042 	1503
		SUBWR 	30H,0 			//0043 	0C30
		ORG		0044H
		BTSS 	STATUS,0 		//0044 	1C03
		LJUMP 	48H 			//0045 	3848
		LDWI 	8CH 			//0046 	2A8C
		LJUMP 	76H 			//0047 	3876

		//;MS83F_ADC_FAN.C: 271: else if(Val_Volt>3700)limit=135;
		LDWI 	EH 			//0048 	2A0E
		SUBWR 	31H,0 			//0049 	0C31
		LDWI 	75H 			//004A 	2A75
		BTSC 	STATUS,2 		//004B 	1503
		ORG		004CH
		SUBWR 	30H,0 			//004C 	0C30
		BTSS 	STATUS,0 		//004D 	1C03
		LJUMP 	51H 			//004E 	3851
		LDWI 	87H 			//004F 	2A87
		LJUMP 	76H 			//0050 	3876

		//;MS83F_ADC_FAN.C: 272: else if(Val_Volt>3400)limit=130;
		LDWI 	DH 			//0051 	2A0D
		SUBWR 	31H,0 			//0052 	0C31
		LDWI 	49H 			//0053 	2A49
		ORG		0054H
		BTSC 	STATUS,2 		//0054 	1503
		SUBWR 	30H,0 			//0055 	0C30
		BTSS 	STATUS,0 		//0056 	1C03
		LJUMP 	5AH 			//0057 	385A
		LDWI 	82H 			//0058 	2A82
		LJUMP 	76H 			//0059 	3876

		//;MS83F_ADC_FAN.C: 273: else if(Val_Volt>3100)limit=125;
		LDWI 	CH 			//005A 	2A0C
		SUBWR 	31H,0 			//005B 	0C31
		ORG		005CH
		LDWI 	1DH 			//005C 	2A1D
		BTSC 	STATUS,2 		//005D 	1503
		SUBWR 	30H,0 			//005E 	0C30
		BTSS 	STATUS,0 		//005F 	1C03
		LJUMP 	63H 			//0060 	3863
		LDWI 	7DH 			//0061 	2A7D
		LJUMP 	76H 			//0062 	3876

		//;MS83F_ADC_FAN.C: 274: else if(Val_Volt>2900)limit=120;
		LDWI 	BH 			//0063 	2A0B
		ORG		0064H
		SUBWR 	31H,0 			//0064 	0C31
		LDWI 	55H 			//0065 	2A55
		BTSC 	STATUS,2 		//0066 	1503
		SUBWR 	30H,0 			//0067 	0C30
		BTSS 	STATUS,0 		//0068 	1C03
		LJUMP 	6CH 			//0069 	386C
		LDWI 	78H 			//006A 	2A78
		LJUMP 	76H 			//006B 	3876
		ORG		006CH

		//;MS83F_ADC_FAN.C: 275: else if(Val_Volt>2600)limit=115;
		LDWI 	AH 			//006C 	2A0A
		SUBWR 	31H,0 			//006D 	0C31
		LDWI 	29H 			//006E 	2A29
		BTSC 	STATUS,2 		//006F 	1503
		SUBWR 	30H,0 			//0070 	0C30
		BTSS 	STATUS,0 		//0071 	1C03
		LJUMP 	75H 			//0072 	3875
		LDWI 	73H 			//0073 	2A73
		ORG		0074H
		LJUMP 	76H 			//0074 	3876

		//;MS83F_ADC_FAN.C: 276: else limit=110;
		LDWI 	6EH 			//0075 	2A6E
		STR 	2AH 			//0076 	01AA

		//;MS83F_ADC_FAN.C: 277: Buff_AN6=0;
		CLRR 	2CH 			//0077 	012C
		CLRR 	2DH 			//0078 	012D

		//;MS83F_ADC_FAN.C: 278: for(i=0;i<20;i++)Buff_AN6 += GET_ADC_VALUE(6,1);
		CLRR 	29H 			//0079 	0129
		LDWI 	6H 			//007A 	2A06
		CLRR 	73H 			//007B 	0173
		ORG		007CH
		INCR	73H,1 			//007C 	09F3
		LCALL 	105H 			//007D 	3105
		LDR 	73H,0 			//007E 	0873
		ADDWR 	2CH,1 			//007F 	0BAC
		BTSC 	STATUS,0 		//0080 	1403
		INCR	2DH,1 			//0081 	09AD
		LDR 	74H,0 			//0082 	0874
		ADDWR 	2DH,1 			//0083 	0BAD
		ORG		0084H
		LDWI 	14H 			//0084 	2A14
		INCR	29H,1 			//0085 	09A9
		SUBWR 	29H,0 			//0086 	0C29
		BTSS 	STATUS,0 		//0087 	1C03
		LJUMP 	7AH 			//0088 	387A

		//;MS83F_ADC_FAN.C: 279: Buff_AN6/=20;
		LDWI 	14H 			//0089 	2A14
		STR 	72H 			//008A 	01F2
		CLRR 	73H 			//008B 	0173
		ORG		008CH
		LDR 	2DH,0 			//008C 	082D
		STR 	75H 			//008D 	01F5
		LDR 	2CH,0 			//008E 	082C
		STR 	74H 			//008F 	01F4
		LCALL 	170H 			//0090 	3170
		LDR 	73H,0 			//0091 	0873
		STR 	2DH 			//0092 	01AD
		LDR 	72H,0 			//0093 	0872
		ORG		0094H
		STR 	2CH 			//0094 	01AC

		//;MS83F_ADC_FAN.C: 280: if(Buff_AN6>limit)
		LDR 	2AH,0 			//0095 	082A
		STR 	24H 			//0096 	01A4
		CLRR 	25H 			//0097 	0125
		LDR 	2DH,0 			//0098 	082D
		SUBWR 	25H,0 			//0099 	0C25
		BTSS 	STATUS,2 		//009A 	1D03
		LJUMP 	9EH 			//009B 	389E
		ORG		009CH
		LDR 	2CH,0 			//009C 	082C
		SUBWR 	24H,0 			//009D 	0C24
		BTSC 	STATUS,0 		//009E 	1403
		RET		 					//009F 	0004

		//;MS83F_ADC_FAN.C: 281: {
		//;MS83F_ADC_FAN.C: 282: fan_speed=0;
		CLRR 	34H 			//00A0 	0134

		//;MS83F_ADC_FAN.C: 283: PC3=0;
		BCR 	7H,3 			//00A1 	1187

		//;MS83F_ADC_FAN.C: 284: SYS_SLEEP();
		LJUMP 	1D3H 			//00A2 	39D3

		//;MS83F_ADC_FAN.C: 297: DEVICE_INIT();
		LCALL 	1ECH 			//00A3 	31EC
		ORG		00A4H

		//;MS83F_ADC_FAN.C: 298: ADC_INIT();
		LCALL 	255H 			//00A4 	3255

		//;MS83F_ADC_FAN.C: 299: PWM_INIT();
		LCALL 	236H 			//00A5 	3236

		//;MS83F_ADC_FAN.C: 300: INT_INIT();
		LCALL 	24FH 			//00A6 	324F

		//;MS83F_ADC_FAN.C: 301: while(1)
		//;MS83F_ADC_FAN.C: 302: {
		//;MS83F_ADC_FAN.C: 303: char key = GetKeyEvent();
		LCALL 	19AH 			//00A7 	319A
		STR 	2BH 			//00A8 	01AB

		//;MS83F_ADC_FAN.C: 304: if(key)
		LDR 	2BH,0 			//00A9 	082B
		BTSC 	STATUS,2 		//00AA 	1503
		LJUMP 	D3H 			//00AB 	38D3
		ORG		00ACH

		//;MS83F_ADC_FAN.C: 305: {
		//;MS83F_ADC_FAN.C: 306: if(key==2)
		LDR 	2BH,0 			//00AC 	082B
		XORWI 	2H 			//00AD 	2602
		BTSS 	STATUS,2 		//00AE 	1D03
		LJUMP 	C0H 			//00AF 	38C0

		//;MS83F_ADC_FAN.C: 307: {
		//;MS83F_ADC_FAN.C: 308: if(is_led_on)
		BTSS 	7AH,0 			//00B0 	1C7A
		LJUMP 	B6H 			//00B1 	38B6

		//;MS83F_ADC_FAN.C: 309: {
		//;MS83F_ADC_FAN.C: 310: is_led_on=0;
		BCR 	7AH,0 			//00B2 	107A

		//;MS83F_ADC_FAN.C: 311: PA6 = 0;
		BCR 	5H,6 			//00B3 	1305
		ORG		00B4H

		//;MS83F_ADC_FAN.C: 312: SYS_SLEEP();
		LCALL 	1D3H 			//00B4 	31D3

		//;MS83F_ADC_FAN.C: 313: }
		LJUMP 	D3H 			//00B5 	38D3

		//;MS83F_ADC_FAN.C: 314: else
		//;MS83F_ADC_FAN.C: 315: {
		//;MS83F_ADC_FAN.C: 316: is_led_on=1;
		BSR 	7AH,0 			//00B6 	187A

		//;MS83F_ADC_FAN.C: 317: PA6 = 1;
		BSR 	5H,6 			//00B7 	1B05

		//;MS83F_ADC_FAN.C: 318: if(fan_speed)
		LDR 	34H,0 			//00B8 	0834
		BTSC 	STATUS,2 		//00B9 	1503
		LJUMP 	D3H 			//00BA 	38D3

		//;MS83F_ADC_FAN.C: 319: {
		//;MS83F_ADC_FAN.C: 320: SET_PWM4_ON(0);
		LDWI 	0H 			//00BB 	2A00
		ORG		00BCH
		LCALL 	1B8H 			//00BC 	31B8

		//;MS83F_ADC_FAN.C: 321: fan_speed=0;
		BCR 	STATUS,5 		//00BD 	1283
		CLRR 	34H 			//00BE 	0134
		LJUMP 	D3H 			//00BF 	38D3

		//;MS83F_ADC_FAN.C: 325: else if(is_led_on==0)
		BTSC 	7AH,0 			//00C0 	147A
		LJUMP 	D3H 			//00C1 	38D3

		//;MS83F_ADC_FAN.C: 326: {
		//;MS83F_ADC_FAN.C: 327: fan_speed++;
		INCR	34H,1 			//00C2 	09B4

		//;MS83F_ADC_FAN.C: 328: if(fan_speed>3)
		LDWI 	4H 			//00C3 	2A04
		ORG		00C4H
		SUBWR 	34H,0 			//00C4 	0C34
		BTSS 	STATUS,0 		//00C5 	1C03
		LJUMP 	CBH 			//00C6 	38CB

		//;MS83F_ADC_FAN.C: 329: {
		//;MS83F_ADC_FAN.C: 330: fan_speed=0;
		CLRR 	34H 			//00C7 	0134

		//;MS83F_ADC_FAN.C: 331: SET_FAN_SPEED(0);
		LDWI 	0H 			//00C8 	2A00
		LCALL 	201H 			//00C9 	3201
		LJUMP 	B4H 			//00CA 	38B4

		//;MS83F_ADC_FAN.C: 334: else
		//;MS83F_ADC_FAN.C: 335: {
		//;MS83F_ADC_FAN.C: 336: SET_FAN_SPEED(3);
		LDWI 	3H 			//00CB 	2A03
		ORG		00CCH
		LCALL 	201H 			//00CC 	3201

		//;MS83F_ADC_FAN.C: 337: DELAY_MS(100);
		LDWI 	64H 			//00CD 	2A64
		LCALL 	22DH 			//00CE 	322D

		//;MS83F_ADC_FAN.C: 338: over_load_cnt=0;
		BCR 	STATUS,5 		//00CF 	1283
		BCR 	STATUS,6 		//00D0 	1303
		CLRR 	32H 			//00D1 	0132
		CLRR 	33H 			//00D2 	0133

		//;MS83F_ADC_FAN.C: 339: }
		//;MS83F_ADC_FAN.C: 340: }
		//;MS83F_ADC_FAN.C: 341: }
		//;MS83F_ADC_FAN.C: 343: if(fan_speed)
		LDR 	34H,0 			//00D3 	0834
		ORG		00D4H
		BTSC 	STATUS,2 		//00D4 	1503
		LJUMP 	102H 			//00D5 	3902

		//;MS83F_ADC_FAN.C: 344: {
		//;MS83F_ADC_FAN.C: 345: over_load_cnt++;
		INCR	32H,1 			//00D6 	09B2
		BTSC 	STATUS,2 		//00D7 	1503
		INCR	33H,1 			//00D8 	09B3

		//;MS83F_ADC_FAN.C: 346: if(over_load_cnt>=10)
		LDWI 	0H 			//00D9 	2A00
		SUBWR 	33H,0 			//00DA 	0C33
		LDWI 	AH 			//00DB 	2A0A
		ORG		00DCH
		BTSC 	STATUS,2 		//00DC 	1503
		SUBWR 	32H,0 			//00DD 	0C32
		BTSS 	STATUS,0 		//00DE 	1C03
		LJUMP 	FFH 			//00DF 	38FF

		//;MS83F_ADC_FAN.C: 347: {
		//;MS83F_ADC_FAN.C: 349: TRISC3 = 1;
		BSR 	STATUS,5 		//00E0 	1A83
		BSR 	7H,3 			//00E1 	1987

		//;MS83F_ADC_FAN.C: 350: PWM4CR0 = 0;
		BCR 	STATUS,5 		//00E2 	1283
		BSR 	STATUS,6 		//00E3 	1B03
		ORG		00E4H
		CLRR 	15H 			//00E4 	0115

		//;MS83F_ADC_FAN.C: 351: PWM4CR1 =0;
		CLRR 	16H 			//00E5 	0116

		//;MS83F_ADC_FAN.C: 352: T4CKDIV = 0;
		CLRR 	17H 			//00E6 	0117

		//;MS83F_ADC_FAN.C: 353: TMR4H = 0;
		CLRR 	13H 			//00E7 	0113

		//;MS83F_ADC_FAN.C: 354: TMR4L = 0;
		CLRR 	12H 			//00E8 	0112

		//;MS83F_ADC_FAN.C: 355: PR4L = 0;
		CLRR 	14H 			//00E9 	0114
		LDWI 	1H 			//00EA 	2A01

		//;MS83F_ADC_FAN.C: 356: TMR4IF = 0;
		BCR 	16H,0 			//00EB 	1016
		ORG		00ECH

		//;MS83F_ADC_FAN.C: 357: TMR4ON = 0;
		BCR 	16H,2 			//00EC 	1116

		//;MS83F_ADC_FAN.C: 358: DELAY_MS(1);
		LCALL 	22DH 			//00ED 	322D
		LDWI 	5H 			//00EE 	2A05

		//;MS83F_ADC_FAN.C: 359: TRISC3 = 0;
		BSR 	STATUS,5 		//00EF 	1A83
		BCR 	STATUS,6 		//00F0 	1303
		BCR 	7H,3 			//00F1 	1187

		//;MS83F_ADC_FAN.C: 360: PC3=1;
		BCR 	STATUS,5 		//00F2 	1283
		BSR 	7H,3 			//00F3 	1987
		ORG		00F4H

		//;MS83F_ADC_FAN.C: 361: DELAY_MS(5);
		LCALL 	22DH 			//00F4 	322D

		//;MS83F_ADC_FAN.C: 362: detect_block();
		LCALL 	BH 			//00F5 	300B

		//;MS83F_ADC_FAN.C: 363: SET_FAN_SPEED(fan_speed);
		LDR 	34H,0 			//00F6 	0834
		LCALL 	201H 			//00F7 	3201

		//;MS83F_ADC_FAN.C: 364: DELAY_MS(4);
		LDWI 	4H 			//00F8 	2A04
		LCALL 	22DH 			//00F9 	322D

		//;MS83F_ADC_FAN.C: 365: over_load_cnt=0;
		BCR 	STATUS,5 		//00FA 	1283
		BCR 	STATUS,6 		//00FB 	1303
		ORG		00FCH
		CLRR 	32H 			//00FC 	0132
		CLRR 	33H 			//00FD 	0133

		//;MS83F_ADC_FAN.C: 366: }
		LJUMP 	A7H 			//00FE 	38A7

		//;MS83F_ADC_FAN.C: 367: else DELAY_MS(10);
		LDWI 	AH 			//00FF 	2A0A
		LCALL 	22DH 			//0100 	322D
		LJUMP 	A7H 			//0101 	38A7

		//;MS83F_ADC_FAN.C: 369: else DELAY_MS(10);
		LDWI 	AH 			//0102 	2A0A
		LCALL 	22DH 			//0103 	322D
		ORG		0104H
		LJUMP 	A7H 			//0104 	38A7
		STR 	76H 			//0105 	01F6

		//;MS83F_ADC_FAN.C: 95: unsigned int TempADCBuffer=0;
		CLRR 	77H 			//0106 	0177
		CLRR 	78H 			//0107 	0178

		//;MS83F_ADC_FAN.C: 97: TempAdcon0 = (ChannelNO<<2);
		STR 	75H 			//0108 	01F5
		BCR 	STATUS,0 		//0109 	1003
		RLR 	75H,1 			//010A 	05F5
		BCR 	STATUS,0 		//010B 	1003
		ORG		010CH
		RLR 	75H,0 			//010C 	0575
		STR 	79H 			//010D 	01F9

		//;MS83F_ADC_FAN.C: 98: if(Vref==0) {TempAdcon0 |= 0b10000001;}
		LDR 	73H,1 			//010E 	08F3
		BTSS 	STATUS,2 		//010F 	1D03
		LJUMP 	113H 			//0110 	3913
		LDWI 	81H 			//0111 	2A81
		LJUMP 	11EH 			//0112 	391E

		//;MS83F_ADC_FAN.C: 99: else if(Vref==1) {TempAdcon0 |= 0b10100001;}
		DECRSZ 	73H,0 		//0113 	0E73
		ORG		0114H
		LJUMP 	117H 			//0114 	3917
		LDWI 	A1H 			//0115 	2AA1
		LJUMP 	11EH 			//0116 	391E

		//;MS83F_ADC_FAN.C: 100: else if(Vref==2) {TempAdcon0 |= 0b11000001;}
		LDR 	73H,0 			//0117 	0873
		XORWI 	2H 			//0118 	2602
		BTSS 	STATUS,2 		//0119 	1D03
		LJUMP 	11DH 			//011A 	391D
		LDWI 	C1H 			//011B 	2AC1
		ORG		011CH
		LJUMP 	11EH 			//011C 	391E

		//;MS83F_ADC_FAN.C: 101: else {TempAdcon0 |= 0b11100001;}
		LDWI 	E1H 			//011D 	2AE1
		IORWR 	79H,1 			//011E 	03F9

		//;MS83F_ADC_FAN.C: 102: ADCON0 = TempAdcon0;
		LDR 	79H,0 			//011F 	0879
		BCR 	STATUS,5 		//0120 	1283
		BCR 	STATUS,6 		//0121 	1303
		STR 	1FH 			//0122 	019F

		//;MS83F_ADC_FAN.C: 103: DELAY_30US();
		LCALL 	247H 			//0123 	3247
		ORG		0124H

		//;MS83F_ADC_FAN.C: 104: GO_DONE = 1;
		BCR 	STATUS,5 		//0124 	1283
		BCR 	STATUS,6 		//0125 	1303
		BSR 	1FH,1 			//0126 	189F

		//;MS83F_ADC_FAN.C: 105: while(GO_DONE==1) asm("clrwdt");
		BCR 	STATUS,5 		//0127 	1283
		BCR 	STATUS,6 		//0128 	1303
		BTSS 	1FH,1 			//0129 	1C9F
		LJUMP 	12DH 			//012A 	392D
		CLRWDT	 			//012B 	0001
		ORG		012CH
		LJUMP 	127H 			//012C 	3927

		//;MS83F_ADC_FAN.C: 106: TempADCBuffer = ADRESH;
		LDR 	1EH,0 			//012D 	081E
		STR 	77H 			//012E 	01F7
		CLRR 	78H 			//012F 	0178

		//;MS83F_ADC_FAN.C: 107: TempADCBuffer = (TempADCBuffer<<8)|ADRESL;
		STR 	75H 			//0130 	01F5
		BSR 	STATUS,5 		//0131 	1A83
		LDR 	1EH,0 			//0132 	081E
		STR 	77H 			//0133 	01F7
		ORG		0134H
		LDR 	75H,0 			//0134 	0875
		STR 	78H 			//0135 	01F8

		//;MS83F_ADC_FAN.C: 108: ADON = 0;
		BCR 	STATUS,5 		//0136 	1283
		BCR 	1FH,0 			//0137 	101F

		//;MS83F_ADC_FAN.C: 109: return(TempADCBuffer);
		LDR 	78H,0 			//0138 	0878
		STR 	74H 			//0139 	01F4
		LDR 	77H,0 			//013A 	0877
		STR 	73H 			//013B 	01F3
		ORG		013CH
		RET		 					//013C 	0004
		CLRR 	20H 			//013D 	0120
		CLRR 	21H 			//013E 	0121
		CLRR 	22H 			//013F 	0122
		CLRR 	23H 			//0140 	0123
		BTSS 	72H,0 			//0141 	1C72
		LJUMP 	157H 			//0142 	3957
		LDR 	76H,0 			//0143 	0876
		ORG		0144H
		ADDWR 	20H,1 			//0144 	0BA0
		LDR 	77H,0 			//0145 	0877
		BCR 	STATUS,2 		//0146 	1103
		BTSC 	STATUS,0 		//0147 	1403
		ADDWI 	1H 			//0148 	2701
		BTSS 	STATUS,2 		//0149 	1D03
		ADDWR 	21H,1 			//014A 	0BA1
		LDR 	78H,0 			//014B 	0878
		ORG		014CH
		BCR 	STATUS,2 		//014C 	1103
		BTSC 	STATUS,0 		//014D 	1403
		ADDWI 	1H 			//014E 	2701
		BTSS 	STATUS,2 		//014F 	1D03
		ADDWR 	22H,1 			//0150 	0BA2
		LDR 	79H,0 			//0151 	0879
		BCR 	STATUS,2 		//0152 	1103
		BTSC 	STATUS,0 		//0153 	1403
		ORG		0154H
		ADDWI 	1H 			//0154 	2701
		BTSS 	STATUS,2 		//0155 	1D03
		ADDWR 	23H,1 			//0156 	0BA3
		BCR 	STATUS,0 		//0157 	1003
		RLR 	76H,1 			//0158 	05F6
		RLR 	77H,1 			//0159 	05F7
		RLR 	78H,1 			//015A 	05F8
		RLR 	79H,1 			//015B 	05F9
		ORG		015CH
		BCR 	STATUS,0 		//015C 	1003
		RRR	75H,1 			//015D 	06F5
		RRR	74H,1 			//015E 	06F4
		RRR	73H,1 			//015F 	06F3
		RRR	72H,1 			//0160 	06F2
		LDR 	75H,0 			//0161 	0875
		IORWR 	74H,0 			//0162 	0374
		IORWR 	73H,0 			//0163 	0373
		ORG		0164H
		IORWR 	72H,0 			//0164 	0372
		BTSS 	STATUS,2 		//0165 	1D03
		LJUMP 	141H 			//0166 	3941
		LDR 	23H,0 			//0167 	0823
		STR 	75H 			//0168 	01F5
		LDR 	22H,0 			//0169 	0822
		STR 	74H 			//016A 	01F4
		LDR 	21H,0 			//016B 	0821
		ORG		016CH
		STR 	73H 			//016C 	01F3
		LDR 	20H,0 			//016D 	0820
		STR 	72H 			//016E 	01F2
		RET		 					//016F 	0004
		CLRR 	77H 			//0170 	0177
		CLRR 	78H 			//0171 	0178
		LDR 	73H,0 			//0172 	0873
		IORWR 	72H,0 			//0173 	0372
		ORG		0174H
		BTSC 	STATUS,2 		//0174 	1503
		LJUMP 	195H 			//0175 	3995
		CLRR 	76H 			//0176 	0176
		INCR	76H,1 			//0177 	09F6
		BTSC 	73H,7 			//0178 	17F3
		LJUMP 	17EH 			//0179 	397E
		BCR 	STATUS,0 		//017A 	1003
		RLR 	72H,1 			//017B 	05F2
		ORG		017CH
		RLR 	73H,1 			//017C 	05F3
		LJUMP 	177H 			//017D 	3977
		BCR 	STATUS,0 		//017E 	1003
		RLR 	77H,1 			//017F 	05F7
		RLR 	78H,1 			//0180 	05F8
		LDR 	73H,0 			//0181 	0873
		SUBWR 	75H,0 			//0182 	0C75
		BTSS 	STATUS,2 		//0183 	1D03
		ORG		0184H
		LJUMP 	187H 			//0184 	3987
		LDR 	72H,0 			//0185 	0872
		SUBWR 	74H,0 			//0186 	0C74
		BTSS 	STATUS,0 		//0187 	1C03
		LJUMP 	191H 			//0188 	3991
		LDR 	72H,0 			//0189 	0872
		SUBWR 	74H,1 			//018A 	0CF4
		LDR 	73H,0 			//018B 	0873
		ORG		018CH
		BTSS 	STATUS,0 		//018C 	1C03
		DECR 	75H,1 			//018D 	0DF5
		SUBWR 	75H,1 			//018E 	0CF5
		BSR 	77H,0 			//018F 	1877
		BCR 	STATUS,0 		//0190 	1003
		RRR	73H,1 			//0191 	06F3
		RRR	72H,1 			//0192 	06F2
		DECRSZ 	76H,1 		//0193 	0EF6
		ORG		0194H
		LJUMP 	17EH 			//0194 	397E
		LDR 	78H,0 			//0195 	0878
		STR 	73H 			//0196 	01F3
		LDR 	77H,0 			//0197 	0877
		STR 	72H 			//0198 	01F2
		RET		 					//0199 	0004

		//;MS83F_ADC_FAN.C: 248: static unsigned char keytime=0;
		//;MS83F_ADC_FAN.C: 249: unsigned char key_event=0;
		CLRR 	72H 			//019A 	0172

		//;MS83F_ADC_FAN.C: 250: if(PC1==0)
		BCR 	STATUS,5 		//019B 	1283
		ORG		019CH
		BCR 	STATUS,6 		//019C 	1303
		BTSC 	7H,1 			//019D 	1487
		LJUMP 	1ABH 			//019E 	39AB

		//;MS83F_ADC_FAN.C: 251: {
		//;MS83F_ADC_FAN.C: 252: if(keytime<200)
		LDWI 	C8H 			//019F 	2AC8
		SUBWR 	7BH,0 			//01A0 	0C7B
		BTSC 	STATUS,0 		//01A1 	1403
		LJUMP 	1B6H 			//01A2 	39B6
		LDWI 	C8H 			//01A3 	2AC8
		ORG		01A4H

		//;MS83F_ADC_FAN.C: 253: {
		//;MS83F_ADC_FAN.C: 254: keytime++;
		INCR	7BH,1 			//01A4 	09FB

		//;MS83F_ADC_FAN.C: 255: if(keytime>=200)key_event = 2;
		SUBWR 	7BH,0 			//01A5 	0C7B
		BTSS 	STATUS,0 		//01A6 	1C03
		LJUMP 	1B6H 			//01A7 	39B6
		LDWI 	2H 			//01A8 	2A02
		STR 	72H 			//01A9 	01F2
		LJUMP 	1B6H 			//01AA 	39B6

		//;MS83F_ADC_FAN.C: 258: else
		//;MS83F_ADC_FAN.C: 259: {
		//;MS83F_ADC_FAN.C: 260: if(keytime>10 && keytime<200)key_event=1;
		LDWI 	BH 			//01AB 	2A0B
		ORG		01ACH
		SUBWR 	7BH,0 			//01AC 	0C7B
		BTSS 	STATUS,0 		//01AD 	1C03
		LJUMP 	1B5H 			//01AE 	39B5
		LDWI 	C8H 			//01AF 	2AC8
		SUBWR 	7BH,0 			//01B0 	0C7B
		BTSC 	STATUS,0 		//01B1 	1403
		LJUMP 	1B5H 			//01B2 	39B5
		CLRR 	72H 			//01B3 	0172
		ORG		01B4H
		INCR	72H,1 			//01B4 	09F2

		//;MS83F_ADC_FAN.C: 261: keytime=0;
		CLRR 	7BH 			//01B5 	017B

		//;MS83F_ADC_FAN.C: 262: }
		//;MS83F_ADC_FAN.C: 263: return key_event;
		LDR 	72H,0 			//01B6 	0872
		RET		 					//01B7 	0004
		STR 	72H 			//01B8 	01F2
		LDWI 	32H 			//01B9 	2A32

		//;MS83F_ADC_FAN.C: 166: TRISC3 = 1;
		BSR 	STATUS,5 		//01BA 	1A83
		BSR 	7H,3 			//01BB 	1987
		ORG		01BCH

		//;MS83F_ADC_FAN.C: 167: PWM4CR0 = 0b00110010;
		BCR 	STATUS,5 		//01BC 	1283
		BSR 	STATUS,6 		//01BD 	1B03
		STR 	15H 			//01BE 	0195

		//;MS83F_ADC_FAN.C: 168: PWM4CR1 = 0b10000000;
		LDWI 	80H 			//01BF 	2A80
		STR 	16H 			//01C0 	0196

		//;MS83F_ADC_FAN.C: 169: T4CKDIV = 7;
		LDWI 	7H 			//01C1 	2A07
		STR 	17H 			//01C2 	0197

		//;MS83F_ADC_FAN.C: 170: TMR4H = 0;
		CLRR 	13H 			//01C3 	0113
		ORG		01C4H

		//;MS83F_ADC_FAN.C: 171: TMR4L = 0;
		CLRR 	12H 			//01C4 	0112

		//;MS83F_ADC_FAN.C: 172: PR4L = duty;
		LDR 	72H,0 			//01C5 	0872
		STR 	14H 			//01C6 	0194

		//;MS83F_ADC_FAN.C: 173: TMR4IF = 0;
		BCR 	16H,0 			//01C7 	1016

		//;MS83F_ADC_FAN.C: 174: TMR4ON = 1;
		BSR 	16H,2 			//01C8 	1916

		//;MS83F_ADC_FAN.C: 175: while(TMR4IF==0) asm("clrwdt");
		BCR 	STATUS,5 		//01C9 	1283
		BSR 	STATUS,6 		//01CA 	1B03
		BTSC 	16H,0 			//01CB 	1416
		ORG		01CCH
		LJUMP 	1CFH 			//01CC 	39CF
		CLRWDT	 			//01CD 	0001
		LJUMP 	1C9H 			//01CE 	39C9

		//;MS83F_ADC_FAN.C: 176: TRISC3 = 0;
		BSR 	STATUS,5 		//01CF 	1A83
		BCR 	STATUS,6 		//01D0 	1303
		BCR 	7H,3 			//01D1 	1187
		RET		 					//01D2 	0004

		//;MS83F_ADC_FAN.C: 223: GIE = 0;
		BCR 	INTCON,7 		//01D3 	138B
		ORG		01D4H

		//;MS83F_ADC_FAN.C: 224: ADON = 0;
		BCR 	STATUS,5 		//01D4 	1283
		BCR 	1FH,0 			//01D5 	101F
		CLRWDT	 			//01D6 	0001

		//;MS83F_ADC_FAN.C: 226: SWDTEN = 0;
		BCR 	STATUS,5 		//01D7 	1283
		BCR 	STATUS,6 		//01D8 	1303
		BCR 	18H,0 			//01D9 	1018

		//;MS83F_ADC_FAN.C: 230: SLVREN = 0;
		BCR 	1BH,4 			//01DA 	121B

		//;MS83F_ADC_FAN.C: 234: INTEDG = 0;
		BSR 	STATUS,5 		//01DB 	1A83
		ORG		01DCH
		BCR 	1H,6 			//01DC 	1301

		//;MS83F_ADC_FAN.C: 235: INTF = 0;
		BCR 	INTCON,1 		//01DD 	108B

		//;MS83F_ADC_FAN.C: 236: INTE = 1;
		BSR 	INTCON,4 		//01DE 	1A0B
		SLEEP	 			//01DF 	0002

		//;MS83F_ADC_FAN.C: 238: _nop();
		NOP		 					//01E0 	0000

		//;MS83F_ADC_FAN.C: 239: INTE = 0;
		BCR 	INTCON,4 		//01E1 	120B

		//;MS83F_ADC_FAN.C: 240: INTF = 0;
		BCR 	INTCON,1 		//01E2 	108B

		//;MS83F_ADC_FAN.C: 241: SWDTEN = 1;
		BCR 	STATUS,5 		//01E3 	1283
		ORG		01E4H
		BCR 	STATUS,6 		//01E4 	1303
		BSR 	18H,0 			//01E5 	1818
		CLRWDT	 			//01E6 	0001

		//;MS83F_ADC_FAN.C: 243: SLVREN = 1;
		BCR 	STATUS,5 		//01E7 	1283
		BCR 	STATUS,6 		//01E8 	1303
		BSR 	1BH,4 			//01E9 	1A1B

		//;MS83F_ADC_FAN.C: 244: GIE = 1;
		BSR 	INTCON,7 		//01EA 	1B8B
		RET		 					//01EB 	0004
		ORG		01ECH

		//;MS83F_ADC_FAN.C: 37: OSCCON = 0B01010001;
		LDWI 	51H 			//01EC 	2A51
		BSR 	STATUS,5 		//01ED 	1A83
		STR 	FH 			//01EE 	018F

		//;MS83F_ADC_FAN.C: 41: INTCON = 0B00000000;
		CLRR 	INTCON 			//01EF 	010B

		//;MS83F_ADC_FAN.C: 43: CMCON0 = 0B00000111;
		LDWI 	7H 			//01F0 	2A07
		BCR 	STATUS,5 		//01F1 	1283
		STR 	19H 			//01F2 	0199

		//;MS83F_ADC_FAN.C: 45: PORTA = 0B00000000;
		CLRR 	5H 			//01F3 	0105
		ORG		01F4H

		//;MS83F_ADC_FAN.C: 46: TRISA = 0B10111111;
		LDWI 	BFH 			//01F4 	2ABF
		BSR 	STATUS,5 		//01F5 	1A83
		STR 	5H 			//01F6 	0185

		//;MS83F_ADC_FAN.C: 47: WPUA = 0B00000000;
		CLRR 	15H 			//01F7 	0115

		//;MS83F_ADC_FAN.C: 49: PORTC = 0B00000000;
		BCR 	STATUS,5 		//01F8 	1283
		CLRR 	7H 			//01F9 	0107

		//;MS83F_ADC_FAN.C: 50: TRISC = 0B00111111;
		LDWI 	3FH 			//01FA 	2A3F
		BSR 	STATUS,5 		//01FB 	1A83
		ORG		01FCH
		STR 	7H 			//01FC 	0187

		//;MS83F_ADC_FAN.C: 51: WPUC = 0B00000000;
		CLRR 	8H 			//01FD 	0108

		//;MS83F_ADC_FAN.C: 53: OPTION = 0B00001000;
		LDWI 	8H 			//01FE 	2A08
		STR 	1H 			//01FF 	0181
		RET		 					//0200 	0004
		STR 	73H 			//0201 	01F3

		//;MS83F_ADC_FAN.C: 193: break;
		//;MS83F_ADC_FAN.C: 180: switch(speed)
		XORWI 	1H 			//0202 	2601
		BTSC 	STATUS,2 		//0203 	1503
		ORG		0204H
		LJUMP 	20DH 			//0204 	3A0D
		XORWI 	3H 			//0205 	2603
		BTSC 	STATUS,2 		//0206 	1503
		LJUMP 	20FH 			//0207 	3A0F
		XORWI 	1H 			//0208 	2601
		BTSC 	STATUS,2 		//0209 	1503
		LJUMP 	211H 			//020A 	3A11
		LJUMP 	213H 			//020B 	3A13
		ORG		020CH
		RET		 					//020C 	0004

		//;MS83F_ADC_FAN.C: 183: SET_PWM4_ON(205);
		LDWI 	CDH 			//020D 	2ACD
		LJUMP 	1B8H 			//020E 	39B8

		//;MS83F_ADC_FAN.C: 184: break;
		//;MS83F_ADC_FAN.C: 186: SET_PWM4_ON(230);
		LDWI 	E6H 			//020F 	2AE6
		LJUMP 	1B8H 			//0210 	39B8

		//;MS83F_ADC_FAN.C: 187: break;
		//;MS83F_ADC_FAN.C: 189: SET_PWM4_ON(255);
		LDWI 	FFH 			//0211 	2AFF
		LJUMP 	1B8H 			//0212 	39B8

		//;MS83F_ADC_FAN.C: 190: break;
		//;MS83F_ADC_FAN.C: 192: SET_PWM4_ON(0);
		LDWI 	0H 			//0213 	2A00
		ORG		0214H
		LJUMP 	1B8H 			//0214 	39B8
		CLRR 	7AH 			//0215 	017A
		CLRR 	7BH 			//0216 	017B
		CLRR 	2CH 			//0217 	012C
		CLRR 	2DH 			//0218 	012D
		CLRR 	2EH 			//0219 	012E
		CLRR 	2FH 			//021A 	012F
		CLRR 	30H 			//021B 	0130
		ORG		021CH
		CLRR 	31H 			//021C 	0131
		CLRR 	32H 			//021D 	0132
		CLRR 	33H 			//021E 	0133
		CLRR 	34H 			//021F 	0134
		CLRR 	STATUS 			//0220 	0103
		LJUMP 	A3H 			//0221 	38A3

		//;MS83F_ADC_FAN.C: 204: if(INTE&&INTF)
		BTSC 	INTCON,4 		//0222 	160B
		BTSS 	INTCON,1 		//0223 	1C8B
		ORG		0224H
		LJUMP 	226H 			//0224 	3A26

		//;MS83F_ADC_FAN.C: 205: {
		//;MS83F_ADC_FAN.C: 206: INTF = 0;
		BCR 	INTCON,1 		//0225 	108B
		LDR 	71H,0 			//0226 	0871
		STR 	PCLATH 			//0227 	018A
		SWAPR 	70H,0 			//0228 	0770
		STR 	STATUS 			//0229 	0183
		SWAPR 	7EH,1 			//022A 	07FE
		SWAPR 	7EH,0 			//022B 	077E
		ORG		022CH
		RETI		 			//022C 	0009
		STR 	73H 			//022D 	01F3

		//;MS83F_ADC_FAN.C: 135: unsigned char a;
		//;MS83F_ADC_FAN.C: 137: for(a=0;a<Time;a++)
		CLRR 	74H 			//022E 	0174
		LDR 	73H,0 			//022F 	0873
		SUBWR 	74H,0 			//0230 	0C74
		BTSC 	STATUS,0 		//0231 	1403
		RET		 					//0232 	0004

		//;MS83F_ADC_FAN.C: 138: {
		//;MS83F_ADC_FAN.C: 139: DELAY_1MS();
		LCALL 	23FH 			//0233 	323F
		ORG		0234H
		INCR	74H,1 			//0234 	09F4
		LJUMP 	22FH 			//0235 	3A2F

		//;MS83F_ADC_FAN.C: 150: PWM3CR0 = 0b00000000;
		BCR 	STATUS,5 		//0236 	1283
		BSR 	STATUS,6 		//0237 	1B03
		CLRR 	FH 			//0238 	010F

		//;MS83F_ADC_FAN.C: 151: PWM3CR1 = 0b00000000;
		CLRR 	10H 			//0239 	0110

		//;MS83F_ADC_FAN.C: 152: PWM4CR0 = 0b00000000;
		CLRR 	15H 			//023A 	0115

		//;MS83F_ADC_FAN.C: 153: PWM4CR1 = 0b00000000;
		CLRR 	16H 			//023B 	0116
		ORG		023CH

		//;MS83F_ADC_FAN.C: 154: PWM5CR0 = 0b00000000;
		CLRR 	1BH 			//023C 	011B

		//;MS83F_ADC_FAN.C: 155: PWM5CR1 = 0b00000000;
		CLRR 	1CH 			//023D 	011C
		RET		 					//023E 	0004

		//;MS83F_ADC_FAN.C: 119: unsigned char a;
		//;MS83F_ADC_FAN.C: 121: for(a=0;a<250;a++)
		CLRR 	72H 			//023F 	0172
		CLRWDT	 			//0240 	0001
		LDWI 	FAH 			//0241 	2AFA
		INCR	72H,1 			//0242 	09F2
		SUBWR 	72H,0 			//0243 	0C72
		ORG		0244H
		BTSC 	STATUS,0 		//0244 	1403
		RET		 					//0245 	0004
		LJUMP 	240H 			//0246 	3A40

		//;MS83F_ADC_FAN.C: 78: unsigned char a;
		//;MS83F_ADC_FAN.C: 80: for(a=0;a<6;a++)
		CLRR 	72H 			//0247 	0172
		CLRWDT	 			//0248 	0001
		LDWI 	6H 			//0249 	2A06
		INCR	72H,1 			//024A 	09F2
		SUBWR 	72H,0 			//024B 	0C72
		ORG		024CH
		BTSC 	STATUS,0 		//024C 	1403
		RET		 					//024D 	0004
		LJUMP 	248H 			//024E 	3A48

		//;MS83F_ADC_FAN.C: 217: INTEDG = 0;
		BSR 	STATUS,5 		//024F 	1A83
		BCR 	STATUS,6 		//0250 	1303
		BCR 	1H,6 			//0251 	1301

		//;MS83F_ADC_FAN.C: 218: INTF = 0;
		BCR 	INTCON,1 		//0252 	108B

		//;MS83F_ADC_FAN.C: 219: INTE = 0;
		BCR 	INTCON,4 		//0253 	120B
		ORG		0254H
		RET		 					//0254 	0004

		//;MS83F_ADC_FAN.C: 65: ANSEL = 0B11000000;
		LDWI 	C0H 			//0255 	2AC0
		STR 	11H 			//0256 	0191

		//;MS83F_ADC_FAN.C: 66: ADCON1 = 0B01100000;
		LDWI 	60H 			//0257 	2A60
		STR 	1FH 			//0258 	019F
		RET		 					//0259 	0004
			END
