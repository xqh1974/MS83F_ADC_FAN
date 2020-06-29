opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_DEVICE_INIT
	FNCALL	_main,_ADC_INIT
	FNCALL	_main,_GET_ADC_VALUE
	FNCALL	_GET_ADC_VALUE,_DELAY_30US
	FNROOT	_main
	global	_PSTRCON
psect	text60,local,class=CODE,delta=2
global __ptext60
__ptext60:
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_Buff_AN2
psect	nvCOMMON,class=COMMON,space=1
global __pnvCOMMON
__pnvCOMMON:
_Buff_AN2:
       ds      2

	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CMCON0
_CMCON0	set	25
	global	_INTCON
_INTCON	set	11
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_ADON
_ADON	set	248
	global	_GO_DONE
_GO_DONE	set	249
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_ANSEL
_ANSEL	set	145
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	136
	file	"ms83f_adc_an2.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_DEVICE_INIT
?_DEVICE_INIT:	; 0 bytes @ 0x0
	global	??_DEVICE_INIT
??_DEVICE_INIT:	; 0 bytes @ 0x0
	global	?_ADC_INIT
?_ADC_INIT:	; 0 bytes @ 0x0
	global	??_ADC_INIT
??_ADC_INIT:	; 0 bytes @ 0x0
	global	?_DELAY_30US
?_DELAY_30US:	; 0 bytes @ 0x0
	global	??_DELAY_30US
??_DELAY_30US:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	DELAY_30US@a
DELAY_30US@a:	; 1 bytes @ 0x0
	ds	1
	global	?_GET_ADC_VALUE
?_GET_ADC_VALUE:	; 2 bytes @ 0x1
	global	GET_ADC_VALUE@Vref
GET_ADC_VALUE@Vref:	; 1 bytes @ 0x1
	ds	2
	global	??_GET_ADC_VALUE
??_GET_ADC_VALUE:	; 0 bytes @ 0x3
	ds	1
	global	GET_ADC_VALUE@ChannelNO
GET_ADC_VALUE@ChannelNO:	; 1 bytes @ 0x4
	ds	1
	global	GET_ADC_VALUE@TempAdcon0
GET_ADC_VALUE@TempAdcon0:	; 1 bytes @ 0x5
	ds	1
	global	GET_ADC_VALUE@TempADCBuffer
GET_ADC_VALUE@TempADCBuffer:	; 2 bytes @ 0x6
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x8
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 2 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8      10
;; BANK0           80      0       0
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?_GET_ADC_VALUE	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_GET_ADC_VALUE
;;   _GET_ADC_VALUE->_DELAY_30US
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     135
;;                        _DEVICE_INIT
;;                           _ADC_INIT
;;                      _GET_ADC_VALUE
;; ---------------------------------------------------------------------------------
;; (1) _GET_ADC_VALUE                                        7     5      2     135
;;                                              1 COMMON     7     5      2
;;                         _DELAY_30US
;; ---------------------------------------------------------------------------------
;; (2) _DELAY_30US                                           1     1      0      30
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _ADC_INIT                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _DEVICE_INIT                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DEVICE_INIT
;;   _ADC_INIT
;;   _GET_ADC_VALUE
;;     _DELAY_30US
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       A       1       71.4%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      0       0       4        0.0%
;;BITBANK1            20      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK1               20      0       0       6        0.0%
;;ABS                  0      0       A       7        0.0%
;;DATA                 0      0       C       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 116 in file "MS83F_ADC_AN2.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DEVICE_INIT
;;		_ADC_INIT
;;		_GET_ADC_VALUE
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"MS83F_ADC_AN2.C"
	line	116
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	117
	
l2186:	
;MS83F_ADC_AN2.C: 117: DEVICE_INIT();
	fcall	_DEVICE_INIT
	line	118
;MS83F_ADC_AN2.C: 118: ADC_INIT();
	fcall	_ADC_INIT
	line	119
;MS83F_ADC_AN2.C: 119: while(1)
	
l1092:	
	line	121
;MS83F_ADC_AN2.C: 120: {
;MS83F_ADC_AN2.C: 121: Buff_AN2 = GET_ADC_VALUE(2,0);
	clrf	(?_GET_ADC_VALUE)
	movlw	(02h)
	fcall	_GET_ADC_VALUE
	movf	(1+(?_GET_ADC_VALUE)),w
	movwf	(_Buff_AN2+1)	;volatile
	movf	(0+(?_GET_ADC_VALUE)),w
	movwf	(_Buff_AN2)	;volatile
	line	122
	
l2188:	
;MS83F_ADC_AN2.C: 122: _nop();
	nop
	line	123
	
l2190:	
;MS83F_ADC_AN2.C: 123: _nop();
	nop
	goto	l1092
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	125
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_GET_ADC_VALUE
psect	text61,local,class=CODE,delta=2
global __ptext61
__ptext61:

;; *************** function _GET_ADC_VALUE *****************
;; Defined at:
;;		line 90 in file "MS83F_ADC_AN2.C"
;; Parameters:    Size  Location     Type
;;  ChannelNO       1    wreg     unsigned char 
;;  Vref            1    1[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  ChannelNO       1    4[COMMON] unsigned char 
;;  TempADCBuffe    2    6[COMMON] unsigned int 
;;  TempAdcon0      1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    1[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         4       0       0
;;      Temps:          1       0       0
;;      Totals:         7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DELAY_30US
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text61
	file	"MS83F_ADC_AN2.C"
	line	90
	global	__size_of_GET_ADC_VALUE
	__size_of_GET_ADC_VALUE	equ	__end_of_GET_ADC_VALUE-_GET_ADC_VALUE
	
_GET_ADC_VALUE:	
	opt	stack 6
; Regs used in _GET_ADC_VALUE: [wreg+status,2+status,0+pclath+cstack]
;GET_ADC_VALUE@ChannelNO stored from wreg
	line	92
	movwf	(GET_ADC_VALUE@ChannelNO)
	line	91
	
l2156:	
	line	92
;MS83F_ADC_AN2.C: 92: unsigned int TempADCBuffer=0;
	clrf	(GET_ADC_VALUE@TempADCBuffer)
	clrf	(GET_ADC_VALUE@TempADCBuffer+1)
	line	94
	
l2158:	
;MS83F_ADC_AN2.C: 94: TempAdcon0 = (ChannelNO<<2);
	movf	(GET_ADC_VALUE@ChannelNO),w
	movwf	(??_GET_ADC_VALUE+0)+0
	clrc
	rlf	(??_GET_ADC_VALUE+0)+0,f
	clrc
	rlf	(??_GET_ADC_VALUE+0)+0,w
	movwf	(GET_ADC_VALUE@TempAdcon0)
	line	95
	
l2160:	
;MS83F_ADC_AN2.C: 95: if(Vref==0) {TempAdcon0 |= 0b10000001;}
	movf	(GET_ADC_VALUE@Vref),f
	skipz
	goto	u21
	goto	u20
u21:
	goto	l2164
u20:
	
l2162:	
	movlw	(081h)
	iorwf	(GET_ADC_VALUE@TempAdcon0),f
	goto	l2174
	line	96
	
l2164:	
;MS83F_ADC_AN2.C: 96: else if(Vref==1) {TempAdcon0 |= 0b10100001;}
	decf	(GET_ADC_VALUE@Vref),w
	skipz
	goto	u31
	goto	u30
u31:
	goto	l2168
u30:
	
l2166:	
	movlw	(0A1h)
	iorwf	(GET_ADC_VALUE@TempAdcon0),f
	goto	l2174
	line	97
	
l2168:	
;MS83F_ADC_AN2.C: 97: else if(Vref==2) {TempAdcon0 |= 0b11000001;}
	movf	(GET_ADC_VALUE@Vref),w
	xorlw	02h
	skipz
	goto	u41
	goto	u40
u41:
	goto	l2172
u40:
	
l2170:	
	movlw	(0C1h)
	iorwf	(GET_ADC_VALUE@TempAdcon0),f
	goto	l2174
	line	98
	
l2172:	
;MS83F_ADC_AN2.C: 98: else {TempAdcon0 |= 0b11100001;}
	movlw	(0E1h)
	iorwf	(GET_ADC_VALUE@TempAdcon0),f
	line	99
	
l2174:	
;MS83F_ADC_AN2.C: 99: ADCON0 = TempAdcon0;
	movf	(GET_ADC_VALUE@TempAdcon0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	100
	
l2176:	
;MS83F_ADC_AN2.C: 100: DELAY_30US();
	fcall	_DELAY_30US
	line	101
	
l2178:	
;MS83F_ADC_AN2.C: 101: GO_DONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	102
;MS83F_ADC_AN2.C: 102: while(GO_DONE==1) asm("clrwdt");
	goto	l1086
	
l1087:	
# 102 "MS83F_ADC_AN2.C"
clrwdt ;#
psect	text61
	
l1086:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(249/8),(249)&7
	goto	u51
	goto	u50
u51:
	goto	l1087
u50:
	line	103
	
l2180:	
;MS83F_ADC_AN2.C: 103: TempADCBuffer = ADRESH;
	movf	(30),w	;volatile
	movwf	(GET_ADC_VALUE@TempADCBuffer)
	clrf	(GET_ADC_VALUE@TempADCBuffer+1)
	line	104
;MS83F_ADC_AN2.C: 104: TempADCBuffer = (TempADCBuffer<<8)|ADRESL;
	movf	(GET_ADC_VALUE@TempADCBuffer),w
	movwf	(??_GET_ADC_VALUE+0)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(GET_ADC_VALUE@TempADCBuffer)
	movf	(??_GET_ADC_VALUE+0)+0,w
	movwf	(GET_ADC_VALUE@TempADCBuffer+1)
	line	105
	
l2182:	
;MS83F_ADC_AN2.C: 105: ADON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(248/8),(248)&7
	line	106
;MS83F_ADC_AN2.C: 106: return(TempADCBuffer);
	movf	(GET_ADC_VALUE@TempADCBuffer+1),w
	movwf	(?_GET_ADC_VALUE+1)
	movf	(GET_ADC_VALUE@TempADCBuffer),w
	movwf	(?_GET_ADC_VALUE)
	line	107
	
l1089:	
	return
	opt stack 0
GLOBAL	__end_of_GET_ADC_VALUE
	__end_of_GET_ADC_VALUE:
;; =============== function _GET_ADC_VALUE ends ============

	signat	_GET_ADC_VALUE,8314
	global	_DELAY_30US
psect	text62,local,class=CODE,delta=2
global __ptext62
__ptext62:

;; *************** function _DELAY_30US *****************
;; Defined at:
;;		line 74 in file "MS83F_ADC_AN2.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_GET_ADC_VALUE
;; This function uses a non-reentrant model
;;
psect	text62
	file	"MS83F_ADC_AN2.C"
	line	74
	global	__size_of_DELAY_30US
	__size_of_DELAY_30US	equ	__end_of_DELAY_30US-_DELAY_30US
	
_DELAY_30US:	
	opt	stack 6
; Regs used in _DELAY_30US: [wreg+status,2+status,0]
	line	77
	
l2146:	
;MS83F_ADC_AN2.C: 75: unsigned char a;
;MS83F_ADC_AN2.C: 77: for(a=0;a<6;a++)
	clrf	(DELAY_30US@a)
	line	78
	
l1075:	
	line	79
# 79 "MS83F_ADC_AN2.C"
clrwdt ;#
psect	text62
	line	77
	
l2152:	
	incf	(DELAY_30US@a),f
	
l2154:	
	movlw	(06h)
	subwf	(DELAY_30US@a),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l1075
u10:
	line	81
	
l1077:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_30US
	__end_of_DELAY_30US:
;; =============== function _DELAY_30US ends ============

	signat	_DELAY_30US,88
	global	_ADC_INIT
psect	text63,local,class=CODE,delta=2
global __ptext63
__ptext63:

;; *************** function _ADC_INIT *****************
;; Defined at:
;;		line 61 in file "MS83F_ADC_AN2.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text63
	file	"MS83F_ADC_AN2.C"
	line	61
	global	__size_of_ADC_INIT
	__size_of_ADC_INIT	equ	__end_of_ADC_INIT-_ADC_INIT
	
_ADC_INIT:	
	opt	stack 7
; Regs used in _ADC_INIT: [wreg]
	line	62
	
l2144:	
;MS83F_ADC_AN2.C: 62: ANSEL = 0B00000100;
	movlw	(04h)
	movwf	(145)^080h	;volatile
	line	63
;MS83F_ADC_AN2.C: 63: ADCON1 = 0B01100000;
	movlw	(060h)
	movwf	(159)^080h	;volatile
	line	65
	
l1072:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_INIT
	__end_of_ADC_INIT:
;; =============== function _ADC_INIT ends ============

	signat	_ADC_INIT,88
	global	_DEVICE_INIT
psect	text64,local,class=CODE,delta=2
global __ptext64
__ptext64:

;; *************** function _DEVICE_INIT *****************
;; Defined at:
;;		line 34 in file "MS83F_ADC_AN2.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text64
	file	"MS83F_ADC_AN2.C"
	line	34
	global	__size_of_DEVICE_INIT
	__size_of_DEVICE_INIT	equ	__end_of_DEVICE_INIT-_DEVICE_INIT
	
_DEVICE_INIT:	
	opt	stack 7
; Regs used in _DEVICE_INIT: [wreg+status,2]
	line	35
	
l2128:	
;MS83F_ADC_AN2.C: 35: OSCCON = 0B01010001;
	movlw	(051h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	39
	
l2130:	
;MS83F_ADC_AN2.C: 39: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	41
	
l2132:	
;MS83F_ADC_AN2.C: 41: CMCON0 = 0B00000111;
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	43
;MS83F_ADC_AN2.C: 43: PORTA = 0B00000000;
	clrf	(5)	;volatile
	line	44
	
l2134:	
;MS83F_ADC_AN2.C: 44: TRISA = 0B11111111;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	45
	
l2136:	
;MS83F_ADC_AN2.C: 45: WPUA = 0B00000000;
	clrf	(149)^080h	;volatile
	line	47
	
l2138:	
;MS83F_ADC_AN2.C: 47: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	48
	
l2140:	
;MS83F_ADC_AN2.C: 48: TRISC = 0B00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	49
;MS83F_ADC_AN2.C: 49: WPUC = 0B00000000;
	clrf	(136)^080h	;volatile
	line	51
	
l2142:	
;MS83F_ADC_AN2.C: 51: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	52
	
l1069:	
	return
	opt stack 0
GLOBAL	__end_of_DEVICE_INIT
	__end_of_DEVICE_INIT:
;; =============== function _DEVICE_INIT ends ============

	signat	_DEVICE_INIT,88
psect	text65,local,class=CODE,delta=2
global __ptext65
__ptext65:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
