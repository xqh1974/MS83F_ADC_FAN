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
	FNCALL	_main,_PWM_INIT
	FNCALL	_main,_INT_INIT
	FNCALL	_main,_GetKeyEvent
	FNCALL	_main,_SYS_SLEEP
	FNCALL	_main,_SET_PWM4_ON
	FNCALL	_main,_SET_FAN_SPEED
	FNCALL	_main,_DELAY_MS
	FNCALL	_main,_detect_block
	FNCALL	_detect_block,_GET_ADC_VALUE
	FNCALL	_detect_block,___lmul
	FNCALL	_detect_block,___lwdiv
	FNCALL	_detect_block,_SYS_SLEEP
	FNCALL	_SET_FAN_SPEED,_SET_PWM4_ON
	FNCALL	_DELAY_MS,_DELAY_1MS
	FNCALL	_GET_ADC_VALUE,_DELAY_30US
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_Buff_AN6
	global	_Buff_AN7
	global	_Val_Volt
	global	_over_load_cnt
	global	_fan_speed
	global	GetKeyEvent@keytime
	global	_is_led_on
	global	_PSTRCON
psect	text522,local,class=CODE,delta=2
global __ptext522
__ptext522:
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
	global	_GIE
_GIE	set	95
	global	_GO_DONE
_GO_DONE	set	249
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_PA6
_PA6	set	46
	global	_PC1
_PC1	set	57
	global	_PC3
_PC3	set	59
	global	_SLVREN
_SLVREN	set	220
	global	_SWDTEN
_SWDTEN	set	192
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
	global	_INTEDG
_INTEDG	set	1038
	global	_TRISC3
_TRISC3	set	1083
	global	_PR4L
_PR4L	set	276
	global	_PWM3CR0
_PWM3CR0	set	271
	global	_PWM3CR1
_PWM3CR1	set	272
	global	_PWM4CR0
_PWM4CR0	set	277
	global	_PWM4CR1
_PWM4CR1	set	278
	global	_PWM5CR0
_PWM5CR0	set	283
	global	_PWM5CR1
_PWM5CR1	set	284
	global	_T4CKDIV
_T4CKDIV	set	279
	global	_TMR4H
_TMR4H	set	275
	global	_TMR4L
_TMR4L	set	274
	global	_TMR4IF
_TMR4IF	set	2224
	global	_TMR4ON
_TMR4ON	set	2226
	file	"ms83f_adc_fan.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_is_led_on:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
GetKeyEvent@keytime:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_Buff_AN6:
       ds      2

_Buff_AN7:
       ds      2

_Val_Volt:
       ds      2

_over_load_cnt:
       ds      2

_fan_speed:
       ds      1

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
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
	global	?_ADC_INIT
?_ADC_INIT:	; 0 bytes @ 0x0
	global	?_DELAY_30US
?_DELAY_30US:	; 0 bytes @ 0x0
	global	?_DELAY_1MS
?_DELAY_1MS:	; 0 bytes @ 0x0
	global	?_DELAY_MS
?_DELAY_MS:	; 0 bytes @ 0x0
	global	?_PWM_INIT
?_PWM_INIT:	; 0 bytes @ 0x0
	global	?_SET_PWM4_ON
?_SET_PWM4_ON:	; 0 bytes @ 0x0
	global	?_SET_FAN_SPEED
?_SET_FAN_SPEED:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_INT_INIT
?_INT_INIT:	; 0 bytes @ 0x0
	global	?_SYS_SLEEP
?_SYS_SLEEP:	; 0 bytes @ 0x0
	global	?_detect_block
?_detect_block:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_GetKeyEvent
?_GetKeyEvent:	; 1 bytes @ 0x0
	ds	2
	global	??_DEVICE_INIT
??_DEVICE_INIT:	; 0 bytes @ 0x2
	global	??_ADC_INIT
??_ADC_INIT:	; 0 bytes @ 0x2
	global	??_DELAY_30US
??_DELAY_30US:	; 0 bytes @ 0x2
	global	??_DELAY_1MS
??_DELAY_1MS:	; 0 bytes @ 0x2
	global	??_PWM_INIT
??_PWM_INIT:	; 0 bytes @ 0x2
	global	??_SET_PWM4_ON
??_SET_PWM4_ON:	; 0 bytes @ 0x2
	global	??_INT_INIT
??_INT_INIT:	; 0 bytes @ 0x2
	global	??_SYS_SLEEP
??_SYS_SLEEP:	; 0 bytes @ 0x2
	global	??_GetKeyEvent
??_GetKeyEvent:	; 0 bytes @ 0x2
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x2
	global	?___lmul
?___lmul:	; 4 bytes @ 0x2
	global	DELAY_30US@a
DELAY_30US@a:	; 1 bytes @ 0x2
	global	DELAY_1MS@a
DELAY_1MS@a:	; 1 bytes @ 0x2
	global	SET_PWM4_ON@duty
SET_PWM4_ON@duty:	; 1 bytes @ 0x2
	global	GetKeyEvent@key_event
GetKeyEvent@key_event:	; 1 bytes @ 0x2
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x2
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x2
	ds	1
	global	??_DELAY_MS
??_DELAY_MS:	; 0 bytes @ 0x3
	global	??_SET_FAN_SPEED
??_SET_FAN_SPEED:	; 0 bytes @ 0x3
	global	?_GET_ADC_VALUE
?_GET_ADC_VALUE:	; 2 bytes @ 0x3
	global	GET_ADC_VALUE@Vref
GET_ADC_VALUE@Vref:	; 1 bytes @ 0x3
	global	DELAY_MS@Time
DELAY_MS@Time:	; 1 bytes @ 0x3
	global	SET_FAN_SPEED@speed
SET_FAN_SPEED@speed:	; 1 bytes @ 0x3
	ds	1
	global	DELAY_MS@a
DELAY_MS@a:	; 1 bytes @ 0x4
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x4
	ds	1
	global	??_GET_ADC_VALUE
??_GET_ADC_VALUE:	; 0 bytes @ 0x5
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x6
	global	GET_ADC_VALUE@ChannelNO
GET_ADC_VALUE@ChannelNO:	; 1 bytes @ 0x6
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x6
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x6
	ds	1
	global	GET_ADC_VALUE@TempADCBuffer
GET_ADC_VALUE@TempADCBuffer:	; 2 bytes @ 0x7
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x7
	ds	2
	global	GET_ADC_VALUE@TempAdcon0
GET_ADC_VALUE@TempAdcon0:	; 1 bytes @ 0x9
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xA
	global	??___lmul
??___lmul:	; 0 bytes @ 0xA
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x0
	ds	4
	global	??_detect_block
??_detect_block:	; 0 bytes @ 0x4
	ds	5
	global	detect_block@i
detect_block@i:	; 1 bytes @ 0x9
	ds	1
	global	detect_block@limit
detect_block@limit:	; 1 bytes @ 0xA
	ds	1
	global	main@key
main@key:	; 1 bytes @ 0xB
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 10, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      12
;; BANK0           80     12      21
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?_GET_ADC_VALUE	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _detect_block->_GET_ADC_VALUE
;;   _detect_block->___lmul
;;   _SET_FAN_SPEED->_SET_PWM4_ON
;;   _DELAY_MS->_DELAY_1MS
;;   _GET_ADC_VALUE->_DELAY_30US
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_detect_block
;;   _detect_block->___lmul
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
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
;; (0) _main                                                 1     1      0    1057
;;                                             11 BANK0      1     1      0
;;                        _DEVICE_INIT
;;                           _ADC_INIT
;;                           _PWM_INIT
;;                           _INT_INIT
;;                        _GetKeyEvent
;;                          _SYS_SLEEP
;;                        _SET_PWM4_ON
;;                      _SET_FAN_SPEED
;;                           _DELAY_MS
;;                       _detect_block
;; ---------------------------------------------------------------------------------
;; (1) _detect_block                                         7     7      0     809
;;                                              4 BANK0      7     7      0
;;                      _GET_ADC_VALUE
;;                             ___lmul
;;                            ___lwdiv
;;                          _SYS_SLEEP
;; ---------------------------------------------------------------------------------
;; (2) _SYS_SLEEP                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _SET_FAN_SPEED                                        1     1      0      44
;;                                              3 COMMON     1     1      0
;;                        _SET_PWM4_ON
;; ---------------------------------------------------------------------------------
;; (1) _DELAY_MS                                             2     2      0      92
;;                                              3 COMMON     2     2      0
;;                          _DELAY_1MS
;; ---------------------------------------------------------------------------------
;; (2) _GET_ADC_VALUE                                        7     5      2     312
;;                                              3 COMMON     7     5      2
;;                         _DELAY_30US
;; ---------------------------------------------------------------------------------
;; (2) ___lmul                                              12     4      8     136
;;                                              2 COMMON     8     0      8
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; (2) ___lwdiv                                              7     3      4     241
;;                                              2 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (1) _GetKeyEvent                                          1     1      0      25
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _INT_INIT                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _SET_PWM4_ON                                          1     1      0      22
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _PWM_INIT                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _DELAY_1MS                                            1     1      0      46
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _DELAY_30US                                           1     1      0      68
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _ADC_INIT                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _DEVICE_INIT                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DEVICE_INIT
;;   _ADC_INIT
;;   _PWM_INIT
;;   _INT_INIT
;;   _GetKeyEvent
;;   _SYS_SLEEP
;;   _SET_PWM4_ON
;;   _SET_FAN_SPEED
;;     _SET_PWM4_ON
;;   _DELAY_MS
;;     _DELAY_1MS
;;   _detect_block
;;     _GET_ADC_VALUE
;;       _DELAY_30US
;;     ___lmul
;;     ___lwdiv
;;     _SYS_SLEEP
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      A       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      C      15       4       26.3%
;;BITBANK1            20      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK1               20      0       0       6        0.0%
;;ABS                  0      0      21       7        0.0%
;;DATA                 0      0      24       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 296 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  key             1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_DEVICE_INIT
;;		_ADC_INIT
;;		_PWM_INIT
;;		_INT_INIT
;;		_GetKeyEvent
;;		_SYS_SLEEP
;;		_SET_PWM4_ON
;;		_SET_FAN_SPEED
;;		_DELAY_MS
;;		_detect_block
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"MS83F_ADC_FAN.C"
	line	296
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	297
	
l2974:	
;MS83F_ADC_FAN.C: 297: DEVICE_INIT();
	fcall	_DEVICE_INIT
	line	298
;MS83F_ADC_FAN.C: 298: ADC_INIT();
	fcall	_ADC_INIT
	line	299
	
l2976:	
;MS83F_ADC_FAN.C: 299: PWM_INIT();
	fcall	_PWM_INIT
	line	300
	
l2978:	
;MS83F_ADC_FAN.C: 300: INT_INIT();
	fcall	_INT_INIT
	line	301
;MS83F_ADC_FAN.C: 301: while(1)
	
l1169:	
	line	303
;MS83F_ADC_FAN.C: 302: {
;MS83F_ADC_FAN.C: 303: char key = GetKeyEvent();
	fcall	_GetKeyEvent
	movwf	(main@key)
	line	304
	
l2980:	
;MS83F_ADC_FAN.C: 304: if(key)
	movf	(main@key),w
	skipz
	goto	u1010
	goto	l3012
u1010:
	line	306
	
l2982:	
;MS83F_ADC_FAN.C: 305: {
;MS83F_ADC_FAN.C: 306: if(key==2)
	movf	(main@key),w
	xorlw	02h
	skipz
	goto	u1021
	goto	u1020
u1021:
	goto	l1171
u1020:
	line	308
	
l2984:	
;MS83F_ADC_FAN.C: 307: {
;MS83F_ADC_FAN.C: 308: if(is_led_on)
	btfss	(_is_led_on/8),(_is_led_on)&7
	goto	u1031
	goto	u1030
u1031:
	goto	l1172
u1030:
	line	310
	
l2986:	
;MS83F_ADC_FAN.C: 309: {
;MS83F_ADC_FAN.C: 310: is_led_on=0;
	bcf	(_is_led_on/8),(_is_led_on)&7
	line	311
;MS83F_ADC_FAN.C: 311: PA6 = 0;
	bcf	(46/8),(46)&7
	line	312
	
l2988:	
;MS83F_ADC_FAN.C: 312: SYS_SLEEP();
	fcall	_SYS_SLEEP
	line	313
;MS83F_ADC_FAN.C: 313: }
	goto	l3012
	line	314
	
l1172:	
	line	316
;MS83F_ADC_FAN.C: 314: else
;MS83F_ADC_FAN.C: 315: {
;MS83F_ADC_FAN.C: 316: is_led_on=1;
	bsf	(_is_led_on/8),(_is_led_on)&7
	line	317
;MS83F_ADC_FAN.C: 317: PA6 = 1;
	bsf	(46/8),(46)&7
	line	318
	
l2990:	
;MS83F_ADC_FAN.C: 318: if(fan_speed)
	movf	(_fan_speed),w	;volatile
	skipz
	goto	u1040
	goto	l1175
u1040:
	line	320
	
l2992:	
;MS83F_ADC_FAN.C: 319: {
;MS83F_ADC_FAN.C: 320: SET_PWM4_ON(0);
	movlw	(0)
	fcall	_SET_PWM4_ON
	line	321
	
l2994:	
;MS83F_ADC_FAN.C: 321: fan_speed=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_fan_speed)	;volatile
	goto	l3012
	line	325
	
l1171:	
;MS83F_ADC_FAN.C: 325: else if(is_led_on==0)
	btfsc	(_is_led_on/8),(_is_led_on)&7
	goto	u1051
	goto	u1050
u1051:
	goto	l3012
u1050:
	line	327
	
l2996:	
;MS83F_ADC_FAN.C: 326: {
;MS83F_ADC_FAN.C: 327: fan_speed++;
	incf	(_fan_speed),f	;volatile
	line	328
	
l2998:	
;MS83F_ADC_FAN.C: 328: if(fan_speed>3)
	movlw	(04h)
	subwf	(_fan_speed),w	;volatile
	skipc
	goto	u1061
	goto	u1060
u1061:
	goto	l3006
u1060:
	line	330
	
l3000:	
;MS83F_ADC_FAN.C: 329: {
;MS83F_ADC_FAN.C: 330: fan_speed=0;
	clrf	(_fan_speed)	;volatile
	line	331
	
l3002:	
;MS83F_ADC_FAN.C: 331: SET_FAN_SPEED(0);
	movlw	(0)
	fcall	_SET_FAN_SPEED
	goto	l2988
	line	336
	
l3006:	
;MS83F_ADC_FAN.C: 334: else
;MS83F_ADC_FAN.C: 335: {
;MS83F_ADC_FAN.C: 336: SET_FAN_SPEED(3);
	movlw	(03h)
	fcall	_SET_FAN_SPEED
	line	337
	
l3008:	
;MS83F_ADC_FAN.C: 337: DELAY_MS(100);
	movlw	(064h)
	fcall	_DELAY_MS
	line	338
	
l3010:	
;MS83F_ADC_FAN.C: 338: over_load_cnt=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_over_load_cnt)	;volatile
	clrf	(_over_load_cnt+1)	;volatile
	goto	l3012
	line	341
	
l1175:	
	line	343
	
l3012:	
;MS83F_ADC_FAN.C: 339: }
;MS83F_ADC_FAN.C: 340: }
;MS83F_ADC_FAN.C: 341: }
;MS83F_ADC_FAN.C: 343: if(fan_speed)
	movf	(_fan_speed),w	;volatile
	skipz
	goto	u1070
	goto	l3044
u1070:
	line	345
	
l3014:	
;MS83F_ADC_FAN.C: 344: {
;MS83F_ADC_FAN.C: 345: over_load_cnt++;
	incf	(_over_load_cnt),f	;volatile
	skipnz
	incf	(_over_load_cnt+1),f	;volatile
	line	346
	
l3016:	
;MS83F_ADC_FAN.C: 346: if(over_load_cnt>=10)
	movlw	high(0Ah)
	subwf	(_over_load_cnt+1),w	;volatile
	movlw	low(0Ah)
	skipnz
	subwf	(_over_load_cnt),w	;volatile
	skipc
	goto	u1081
	goto	u1080
u1081:
	goto	l3042
u1080:
	line	349
	
l3018:	
;MS83F_ADC_FAN.C: 347: {
;MS83F_ADC_FAN.C: 349: TRISC3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	350
	
l3020:	
;MS83F_ADC_FAN.C: 350: PWM4CR0 = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(277)^0100h	;volatile
	line	351
;MS83F_ADC_FAN.C: 351: PWM4CR1 =0;
	clrf	(278)^0100h	;volatile
	line	352
;MS83F_ADC_FAN.C: 352: T4CKDIV = 0;
	clrf	(279)^0100h	;volatile
	line	353
;MS83F_ADC_FAN.C: 353: TMR4H = 0;
	clrf	(275)^0100h	;volatile
	line	354
;MS83F_ADC_FAN.C: 354: TMR4L = 0;
	clrf	(274)^0100h	;volatile
	line	355
;MS83F_ADC_FAN.C: 355: PR4L = 0;
	clrf	(276)^0100h	;volatile
	line	356
	
l3022:	
;MS83F_ADC_FAN.C: 356: TMR4IF = 0;
	bcf	(2224/8)^0100h,(2224)&7
	line	357
	
l3024:	
;MS83F_ADC_FAN.C: 357: TMR4ON = 0;
	bcf	(2226/8)^0100h,(2226)&7
	line	358
	
l3026:	
;MS83F_ADC_FAN.C: 358: DELAY_MS(1);
	movlw	(01h)
	fcall	_DELAY_MS
	line	359
	
l3028:	
;MS83F_ADC_FAN.C: 359: TRISC3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	360
	
l3030:	
;MS83F_ADC_FAN.C: 360: PC3=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(59/8),(59)&7
	line	361
	
l3032:	
;MS83F_ADC_FAN.C: 361: DELAY_MS(5);
	movlw	(05h)
	fcall	_DELAY_MS
	line	362
	
l3034:	
;MS83F_ADC_FAN.C: 362: detect_block();
	fcall	_detect_block
	line	363
	
l3036:	
;MS83F_ADC_FAN.C: 363: SET_FAN_SPEED(fan_speed);
	movf	(_fan_speed),w	;volatile
	fcall	_SET_FAN_SPEED
	line	364
	
l3038:	
;MS83F_ADC_FAN.C: 364: DELAY_MS(4);
	movlw	(04h)
	fcall	_DELAY_MS
	line	365
	
l3040:	
;MS83F_ADC_FAN.C: 365: over_load_cnt=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_over_load_cnt)	;volatile
	clrf	(_over_load_cnt+1)	;volatile
	line	366
;MS83F_ADC_FAN.C: 366: }
	goto	l1169
	line	367
	
l3042:	
;MS83F_ADC_FAN.C: 367: else DELAY_MS(10);
	movlw	(0Ah)
	fcall	_DELAY_MS
	goto	l1169
	line	369
	
l3044:	
;MS83F_ADC_FAN.C: 369: else DELAY_MS(10);
	movlw	(0Ah)
	fcall	_DELAY_MS
	goto	l1169
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	371
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_detect_block
psect	text523,local,class=CODE,delta=2
global __ptext523
__ptext523:

;; *************** function _detect_block *****************
;; Defined at:
;;		line 266 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  limit           1   10[BANK0 ] unsigned char 
;;  i               1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       5       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_GET_ADC_VALUE
;;		___lmul
;;		___lwdiv
;;		_SYS_SLEEP
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text523
	file	"MS83F_ADC_FAN.C"
	line	266
	global	__size_of_detect_block
	__size_of_detect_block	equ	__end_of_detect_block-_detect_block
	
_detect_block:	
	opt	stack 4
; Regs used in _detect_block: [wreg+status,2+status,0+pclath+cstack]
	line	268
	
l2924:	
;MS83F_ADC_FAN.C: 267: char i,limit;
;MS83F_ADC_FAN.C: 268: Buff_AN7 = GET_ADC_VALUE(7,1);
	clrf	(?_GET_ADC_VALUE)
	incf	(?_GET_ADC_VALUE),f
	movlw	(07h)
	fcall	_GET_ADC_VALUE
	movf	(1+(?_GET_ADC_VALUE)),w
	movwf	(_Buff_AN7+1)	;volatile
	movf	(0+(?_GET_ADC_VALUE)),w
	movwf	(_Buff_AN7)	;volatile
	line	269
;MS83F_ADC_FAN.C: 269: Val_Volt = (unsigned long)Buff_AN7*2*4*1000/1024;
	movf	(_Buff_AN7),w	;volatile
	movwf	(?___lmul)
	movf	(_Buff_AN7+1),w	;volatile
	movwf	((?___lmul))+1
	clrf	2+((?___lmul))
	clrf	3+((?___lmul))
	movlw	03h
	movwf	(??_detect_block+0)+0
u915:
	clrc
	rlf	(?___lmul),f
	rlf	(?___lmul+1),f
	rlf	(?___lmul+2),f
	rlf	(?___lmul+3),f
	decfsz	(??_detect_block+0)+0
	goto	u915
	movlw	0
	movwf	3+(?___lmul)+04h
	movlw	0
	movwf	2+(?___lmul)+04h
	movlw	03h
	movwf	1+(?___lmul)+04h
	movlw	0E8h
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	movf	(0+?___lmul),w
	movwf	(??_detect_block+1)+0
	movf	(1+?___lmul),w
	movwf	((??_detect_block+1)+0+1)
	movf	(2+?___lmul),w
	movwf	((??_detect_block+1)+0+2)
	movf	(3+?___lmul),w
	movwf	((??_detect_block+1)+0+3)
	movlw	0Ah
u925:
	clrc
	rrf	(??_detect_block+1)+3,f
	rrf	(??_detect_block+1)+2,f
	rrf	(??_detect_block+1)+1,f
	rrf	(??_detect_block+1)+0,f
u920:
	addlw	-1
	skipz
	goto	u925
	movf	1+(??_detect_block+1)+0,w
	movwf	(_Val_Volt+1)	;volatile
	movf	0+(??_detect_block+1)+0,w
	movwf	(_Val_Volt)	;volatile
	line	270
	
l2926:	
;MS83F_ADC_FAN.C: 270: if(Val_Volt>4000)limit=140;
	movlw	high(0FA1h)
	subwf	(_Val_Volt+1),w	;volatile
	movlw	low(0FA1h)
	skipnz
	subwf	(_Val_Volt),w	;volatile
	skipc
	goto	u931
	goto	u930
u931:
	goto	l2930
u930:
	
l2928:	
	movlw	(08Ch)
	movwf	(detect_block@limit)
	goto	l2952
	line	271
	
l2930:	
;MS83F_ADC_FAN.C: 271: else if(Val_Volt>3700)limit=135;
	movlw	high(0E75h)
	subwf	(_Val_Volt+1),w	;volatile
	movlw	low(0E75h)
	skipnz
	subwf	(_Val_Volt),w	;volatile
	skipc
	goto	u941
	goto	u940
u941:
	goto	l2934
u940:
	
l2932:	
	movlw	(087h)
	movwf	(detect_block@limit)
	goto	l2952
	line	272
	
l2934:	
;MS83F_ADC_FAN.C: 272: else if(Val_Volt>3400)limit=130;
	movlw	high(0D49h)
	subwf	(_Val_Volt+1),w	;volatile
	movlw	low(0D49h)
	skipnz
	subwf	(_Val_Volt),w	;volatile
	skipc
	goto	u951
	goto	u950
u951:
	goto	l2938
u950:
	
l2936:	
	movlw	(082h)
	movwf	(detect_block@limit)
	goto	l2952
	line	273
	
l2938:	
;MS83F_ADC_FAN.C: 273: else if(Val_Volt>3100)limit=125;
	movlw	high(0C1Dh)
	subwf	(_Val_Volt+1),w	;volatile
	movlw	low(0C1Dh)
	skipnz
	subwf	(_Val_Volt),w	;volatile
	skipc
	goto	u961
	goto	u960
u961:
	goto	l2942
u960:
	
l2940:	
	movlw	(07Dh)
	movwf	(detect_block@limit)
	goto	l2952
	line	274
	
l2942:	
;MS83F_ADC_FAN.C: 274: else if(Val_Volt>2900)limit=120;
	movlw	high(0B55h)
	subwf	(_Val_Volt+1),w	;volatile
	movlw	low(0B55h)
	skipnz
	subwf	(_Val_Volt),w	;volatile
	skipc
	goto	u971
	goto	u970
u971:
	goto	l2946
u970:
	
l2944:	
	movlw	(078h)
	movwf	(detect_block@limit)
	goto	l2952
	line	275
	
l2946:	
;MS83F_ADC_FAN.C: 275: else if(Val_Volt>2600)limit=115;
	movlw	high(0A29h)
	subwf	(_Val_Volt+1),w	;volatile
	movlw	low(0A29h)
	skipnz
	subwf	(_Val_Volt),w	;volatile
	skipc
	goto	u981
	goto	u980
u981:
	goto	l2950
u980:
	
l2948:	
	movlw	(073h)
	movwf	(detect_block@limit)
	goto	l2952
	line	276
	
l2950:	
;MS83F_ADC_FAN.C: 276: else limit=110;
	movlw	(06Eh)
	movwf	(detect_block@limit)
	line	277
	
l2952:	
;MS83F_ADC_FAN.C: 277: Buff_AN6=0;
	clrf	(_Buff_AN6)	;volatile
	clrf	(_Buff_AN6+1)	;volatile
	line	278
	
l2954:	
;MS83F_ADC_FAN.C: 278: for(i=0;i<20;i++)Buff_AN6 += GET_ADC_VALUE(6,1);
	clrf	(detect_block@i)
	
l2958:	
	clrf	(?_GET_ADC_VALUE)
	incf	(?_GET_ADC_VALUE),f
	movlw	(06h)
	fcall	_GET_ADC_VALUE
	movf	(0+(?_GET_ADC_VALUE)),w
	addwf	(_Buff_AN6),f	;volatile
	skipnc
	incf	(_Buff_AN6+1),f	;volatile
	movf	(1+(?_GET_ADC_VALUE)),w
	addwf	(_Buff_AN6+1),f	;volatile
	
l2960:	
	incf	(detect_block@i),f
	
l2962:	
	movlw	(014h)
	subwf	(detect_block@i),w
	skipc
	goto	u991
	goto	u990
u991:
	goto	l2958
u990:
	line	279
	
l2964:	
;MS83F_ADC_FAN.C: 279: Buff_AN6/=20;
	movlw	014h
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(_Buff_AN6+1),w	;volatile
	movwf	1+(?___lwdiv)+02h
	movf	(_Buff_AN6),w	;volatile
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(_Buff_AN6+1)	;volatile
	movf	(0+(?___lwdiv)),w
	movwf	(_Buff_AN6)	;volatile
	line	280
	
l2966:	
;MS83F_ADC_FAN.C: 280: if(Buff_AN6>limit)
	movf	(detect_block@limit),w
	movwf	(??_detect_block+0)+0
	clrf	(??_detect_block+0)+0+1
	movf	(_Buff_AN6+1),w	;volatile
	subwf	1+(??_detect_block+0)+0,w
	skipz
	goto	u1005
	movf	(_Buff_AN6),w	;volatile
	subwf	0+(??_detect_block+0)+0,w
u1005:
	skipnc
	goto	u1001
	goto	u1000
u1001:
	goto	l1166
u1000:
	line	282
	
l2968:	
;MS83F_ADC_FAN.C: 281: {
;MS83F_ADC_FAN.C: 282: fan_speed=0;
	clrf	(_fan_speed)	;volatile
	line	283
	
l2970:	
;MS83F_ADC_FAN.C: 283: PC3=0;
	bcf	(59/8),(59)&7
	line	284
	
l2972:	
;MS83F_ADC_FAN.C: 284: SYS_SLEEP();
	fcall	_SYS_SLEEP
	line	286
	
l1166:	
	return
	opt stack 0
GLOBAL	__end_of_detect_block
	__end_of_detect_block:
;; =============== function _detect_block ends ============

	signat	_detect_block,88
	global	_SYS_SLEEP
psect	text524,local,class=CODE,delta=2
global __ptext524
__ptext524:

;; *************** function _SYS_SLEEP *****************
;; Defined at:
;;		line 222 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_detect_block
;;		_main
;; This function uses a non-reentrant model
;;
psect	text524
	file	"MS83F_ADC_FAN.C"
	line	222
	global	__size_of_SYS_SLEEP
	__size_of_SYS_SLEEP	equ	__end_of_SYS_SLEEP-_SYS_SLEEP
	
_SYS_SLEEP:	
	opt	stack 5
; Regs used in _SYS_SLEEP: []
	line	223
	
l2922:	
;MS83F_ADC_FAN.C: 223: GIE = 0;
	bcf	(95/8),(95)&7
	line	224
;MS83F_ADC_FAN.C: 224: ADON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(248/8),(248)&7
	line	225
# 225 "MS83F_ADC_FAN.C"
clrwdt ;#
psect	text524
	line	226
;MS83F_ADC_FAN.C: 226: SWDTEN = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(192/8),(192)&7
	line	230
;MS83F_ADC_FAN.C: 230: SLVREN = 0;
	bcf	(220/8),(220)&7
	line	234
;MS83F_ADC_FAN.C: 234: INTEDG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	235
;MS83F_ADC_FAN.C: 235: INTF = 0;
	bcf	(89/8),(89)&7
	line	236
;MS83F_ADC_FAN.C: 236: INTE = 1;
	bsf	(92/8),(92)&7
	line	237
# 237 "MS83F_ADC_FAN.C"
sleep ;#
psect	text524
	line	238
;MS83F_ADC_FAN.C: 238: _nop();
	nop
	line	239
;MS83F_ADC_FAN.C: 239: INTE = 0;
	bcf	(92/8),(92)&7
	line	240
;MS83F_ADC_FAN.C: 240: INTF = 0;
	bcf	(89/8),(89)&7
	line	241
;MS83F_ADC_FAN.C: 241: SWDTEN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(192/8),(192)&7
	line	242
# 242 "MS83F_ADC_FAN.C"
clrwdt ;#
psect	text524
	line	243
;MS83F_ADC_FAN.C: 243: SLVREN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(220/8),(220)&7
	line	244
;MS83F_ADC_FAN.C: 244: GIE = 1;
	bsf	(95/8),(95)&7
	line	245
	
l1138:	
	return
	opt stack 0
GLOBAL	__end_of_SYS_SLEEP
	__end_of_SYS_SLEEP:
;; =============== function _SYS_SLEEP ends ============

	signat	_SYS_SLEEP,88
	global	_SET_FAN_SPEED
psect	text525,local,class=CODE,delta=2
global __ptext525
__ptext525:

;; *************** function _SET_FAN_SPEED *****************
;; Defined at:
;;		line 179 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;  speed           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  speed           1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SET_PWM4_ON
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text525
	file	"MS83F_ADC_FAN.C"
	line	179
	global	__size_of_SET_FAN_SPEED
	__size_of_SET_FAN_SPEED	equ	__end_of_SET_FAN_SPEED-_SET_FAN_SPEED
	
_SET_FAN_SPEED:	
	opt	stack 5
; Regs used in _SET_FAN_SPEED: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;SET_FAN_SPEED@speed stored from wreg
	movwf	(SET_FAN_SPEED@speed)
	line	180
	
l2702:	
;MS83F_ADC_FAN.C: 180: switch(speed)
	goto	l2714
	line	183
	
l2704:	
;MS83F_ADC_FAN.C: 183: SET_PWM4_ON(205);
	movlw	(0CDh)
	fcall	_SET_PWM4_ON
	line	184
;MS83F_ADC_FAN.C: 184: break;
	goto	l1128
	line	186
	
l2706:	
;MS83F_ADC_FAN.C: 186: SET_PWM4_ON(230);
	movlw	(0E6h)
	fcall	_SET_PWM4_ON
	line	187
;MS83F_ADC_FAN.C: 187: break;
	goto	l1128
	line	189
	
l2708:	
;MS83F_ADC_FAN.C: 189: SET_PWM4_ON(255);
	movlw	(0FFh)
	fcall	_SET_PWM4_ON
	line	190
;MS83F_ADC_FAN.C: 190: break;
	goto	l1128
	line	192
	
l2710:	
;MS83F_ADC_FAN.C: 192: SET_PWM4_ON(0);
	movlw	(0)
	fcall	_SET_PWM4_ON
	line	193
;MS83F_ADC_FAN.C: 193: break;
	goto	l1128
	line	180
	
l2714:	
	movf	(SET_FAN_SPEED@speed),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           12     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l2704
	xorlw	2^1	; case 2
	skipnz
	goto	l2706
	xorlw	3^2	; case 3
	skipnz
	goto	l2708
	goto	l2710
	opt asmopt_on

	line	195
	
l1128:	
	return
	opt stack 0
GLOBAL	__end_of_SET_FAN_SPEED
	__end_of_SET_FAN_SPEED:
;; =============== function _SET_FAN_SPEED ends ============

	signat	_SET_FAN_SPEED,4216
	global	_DELAY_MS
psect	text526,local,class=CODE,delta=2
global __ptext526
__ptext526:

;; *************** function _DELAY_MS *****************
;; Defined at:
;;		line 134 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    3[COMMON] unsigned char 
;;  a               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DELAY_1MS
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text526
	file	"MS83F_ADC_FAN.C"
	line	134
	global	__size_of_DELAY_MS
	__size_of_DELAY_MS	equ	__end_of_DELAY_MS-_DELAY_MS
	
_DELAY_MS:	
	opt	stack 5
; Regs used in _DELAY_MS: [wreg+status,2+status,0+pclath+cstack]
;DELAY_MS@Time stored from wreg
	line	137
	movwf	(DELAY_MS@Time)
	
l2694:	
;MS83F_ADC_FAN.C: 135: unsigned char a;
;MS83F_ADC_FAN.C: 137: for(a=0;a<Time;a++)
	clrf	(DELAY_MS@a)
	goto	l2700
	line	139
	
l2696:	
;MS83F_ADC_FAN.C: 138: {
;MS83F_ADC_FAN.C: 139: DELAY_1MS();
	fcall	_DELAY_1MS
	line	137
	
l2698:	
	incf	(DELAY_MS@a),f
	
l2700:	
	movf	(DELAY_MS@Time),w
	subwf	(DELAY_MS@a),w
	skipc
	goto	u601
	goto	u600
u601:
	goto	l2696
u600:
	line	141
	
l1110:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_MS
	__end_of_DELAY_MS:
;; =============== function _DELAY_MS ends ============

	signat	_DELAY_MS,4216
	global	_GET_ADC_VALUE
psect	text527,local,class=CODE,delta=2
global __ptext527
__ptext527:

;; *************** function _GET_ADC_VALUE *****************
;; Defined at:
;;		line 93 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;  ChannelNO       1    wreg     unsigned char 
;;  Vref            1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  ChannelNO       1    6[COMMON] unsigned char 
;;  TempADCBuffe    2    7[COMMON] unsigned int 
;;  TempAdcon0      1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    3[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         4       0       0
;;      Temps:          1       0       0
;;      Totals:         7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DELAY_30US
;; This function is called by:
;;		_detect_block
;; This function uses a non-reentrant model
;;
psect	text527
	file	"MS83F_ADC_FAN.C"
	line	93
	global	__size_of_GET_ADC_VALUE
	__size_of_GET_ADC_VALUE	equ	__end_of_GET_ADC_VALUE-_GET_ADC_VALUE
	
_GET_ADC_VALUE:	
	opt	stack 4
; Regs used in _GET_ADC_VALUE: [wreg+status,2+status,0+pclath+cstack]
;GET_ADC_VALUE@ChannelNO stored from wreg
	line	95
	movwf	(GET_ADC_VALUE@ChannelNO)
	line	94
	
l2892:	
	line	95
;MS83F_ADC_FAN.C: 95: unsigned int TempADCBuffer=0;
	clrf	(GET_ADC_VALUE@TempADCBuffer)
	clrf	(GET_ADC_VALUE@TempADCBuffer+1)
	line	97
	
l2894:	
;MS83F_ADC_FAN.C: 97: TempAdcon0 = (ChannelNO<<2);
	movf	(GET_ADC_VALUE@ChannelNO),w
	movwf	(??_GET_ADC_VALUE+0)+0
	clrc
	rlf	(??_GET_ADC_VALUE+0)+0,f
	clrc
	rlf	(??_GET_ADC_VALUE+0)+0,w
	movwf	(GET_ADC_VALUE@TempAdcon0)
	line	98
	
l2896:	
;MS83F_ADC_FAN.C: 98: if(Vref==0) {TempAdcon0 |= 0b10000001;}
	movf	(GET_ADC_VALUE@Vref),f
	skipz
	goto	u871
	goto	u870
u871:
	goto	l2900
u870:
	
l2898:	
	movlw	(081h)
	iorwf	(GET_ADC_VALUE@TempAdcon0),f
	goto	l2910
	line	99
	
l2900:	
;MS83F_ADC_FAN.C: 99: else if(Vref==1) {TempAdcon0 |= 0b10100001;}
	decf	(GET_ADC_VALUE@Vref),w
	skipz
	goto	u881
	goto	u880
u881:
	goto	l2904
u880:
	
l2902:	
	movlw	(0A1h)
	iorwf	(GET_ADC_VALUE@TempAdcon0),f
	goto	l2910
	line	100
	
l2904:	
;MS83F_ADC_FAN.C: 100: else if(Vref==2) {TempAdcon0 |= 0b11000001;}
	movf	(GET_ADC_VALUE@Vref),w
	xorlw	02h
	skipz
	goto	u891
	goto	u890
u891:
	goto	l2908
u890:
	
l2906:	
	movlw	(0C1h)
	iorwf	(GET_ADC_VALUE@TempAdcon0),f
	goto	l2910
	line	101
	
l2908:	
;MS83F_ADC_FAN.C: 101: else {TempAdcon0 |= 0b11100001;}
	movlw	(0E1h)
	iorwf	(GET_ADC_VALUE@TempAdcon0),f
	line	102
	
l2910:	
;MS83F_ADC_FAN.C: 102: ADCON0 = TempAdcon0;
	movf	(GET_ADC_VALUE@TempAdcon0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	103
	
l2912:	
;MS83F_ADC_FAN.C: 103: DELAY_30US();
	fcall	_DELAY_30US
	line	104
	
l2914:	
;MS83F_ADC_FAN.C: 104: GO_DONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	105
;MS83F_ADC_FAN.C: 105: while(GO_DONE==1) asm("clrwdt");
	goto	l1096
	
l1097:	
# 105 "MS83F_ADC_FAN.C"
clrwdt ;#
psect	text527
	
l1096:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(249/8),(249)&7
	goto	u901
	goto	u900
u901:
	goto	l1097
u900:
	line	106
	
l2916:	
;MS83F_ADC_FAN.C: 106: TempADCBuffer = ADRESH;
	movf	(30),w	;volatile
	movwf	(GET_ADC_VALUE@TempADCBuffer)
	clrf	(GET_ADC_VALUE@TempADCBuffer+1)
	line	107
;MS83F_ADC_FAN.C: 107: TempADCBuffer = (TempADCBuffer<<8)|ADRESL;
	movf	(GET_ADC_VALUE@TempADCBuffer),w
	movwf	(??_GET_ADC_VALUE+0)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(GET_ADC_VALUE@TempADCBuffer)
	movf	(??_GET_ADC_VALUE+0)+0,w
	movwf	(GET_ADC_VALUE@TempADCBuffer+1)
	line	108
	
l2918:	
;MS83F_ADC_FAN.C: 108: ADON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(248/8),(248)&7
	line	109
;MS83F_ADC_FAN.C: 109: return(TempADCBuffer);
	movf	(GET_ADC_VALUE@TempADCBuffer+1),w
	movwf	(?_GET_ADC_VALUE+1)
	movf	(GET_ADC_VALUE@TempADCBuffer),w
	movwf	(?_GET_ADC_VALUE)
	line	110
	
l1099:	
	return
	opt stack 0
GLOBAL	__end_of_GET_ADC_VALUE
	__end_of_GET_ADC_VALUE:
;; =============== function _GET_ADC_VALUE ends ============

	signat	_GET_ADC_VALUE,8314
	global	___lmul
psect	text528,local,class=CODE,delta=2
global __ptext528
__ptext528:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    2[COMMON] unsigned long 
;;  multiplicand    4    6[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    0[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    2[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         8       0       0
;;      Locals:         0       4       0
;;      Temps:          0       0       0
;;      Totals:         8       4       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_detect_block
;; This function uses a non-reentrant model
;;
psect	text528
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 5
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l2880:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	6
	
l1929:	
	line	7
	btfss	(___lmul@multiplier),(0)&7
	goto	u841
	goto	u840
u841:
	goto	l2884
u840:
	line	8
	
l2882:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u851
	addwf	(___lmul@product+1),f
u851:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u852
	addwf	(___lmul@product+2),f
u852:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u853
	addwf	(___lmul@product+3),f
u853:

	line	9
	
l2884:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	10
	
l2886:	
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u861
	goto	u860
u861:
	goto	l1929
u860:
	line	12
	
l2888:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	13
	
l1932:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	___lwdiv
psect	text529,local,class=CODE,delta=2
global __ptext529
__ptext529:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    2[COMMON] unsigned int 
;;  dividend        2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] unsigned int 
;;  counter         1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         4       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_detect_block
;; This function uses a non-reentrant model
;;
psect	text529
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 5
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l2854:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l2856:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u801
	goto	u800
u801:
	goto	l2876
u800:
	line	11
	
l2858:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	12
	goto	l2862
	line	13
	
l2860:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	14
	incf	(___lwdiv@counter),f
	line	12
	
l2862:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u811
	goto	u810
u811:
	goto	l2860
u810:
	line	17
	
l2864:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	18
	
l2866:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u825
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u825:
	skipc
	goto	u821
	goto	u820
u821:
	goto	l2872
u820:
	line	19
	
l2868:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l2870:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	22
	
l2872:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	23
	
l2874:	
	decfsz	(___lwdiv@counter),f
	goto	u831
	goto	u830
u831:
	goto	l2864
u830:
	line	25
	
l2876:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	26
	
l1867:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_GetKeyEvent
psect	text530,local,class=CODE,delta=2
global __ptext530
__ptext530:

;; *************** function _GetKeyEvent *****************
;; Defined at:
;;		line 247 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  key_event       1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text530
	file	"MS83F_ADC_FAN.C"
	line	247
	global	__size_of_GetKeyEvent
	__size_of_GetKeyEvent	equ	__end_of_GetKeyEvent-_GetKeyEvent
	
_GetKeyEvent:	
	opt	stack 6
; Regs used in _GetKeyEvent: [wreg+status,2+status,0]
	line	249
	
l2602:	
;MS83F_ADC_FAN.C: 248: static unsigned char keytime=0;
;MS83F_ADC_FAN.C: 249: unsigned char key_event=0;
	clrf	(GetKeyEvent@key_event)
	line	250
	
l2604:	
;MS83F_ADC_FAN.C: 250: if(PC1==0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(57/8),(57)&7
	goto	u441
	goto	u440
u441:
	goto	l2614
u440:
	line	252
	
l2606:	
;MS83F_ADC_FAN.C: 251: {
;MS83F_ADC_FAN.C: 252: if(keytime<200)
	movlw	(0C8h)
	subwf	(GetKeyEvent@keytime),w
	skipnc
	goto	u451
	goto	u450
u451:
	goto	l2622
u450:
	line	254
	
l2608:	
;MS83F_ADC_FAN.C: 253: {
;MS83F_ADC_FAN.C: 254: keytime++;
	incf	(GetKeyEvent@keytime),f
	line	255
	
l2610:	
;MS83F_ADC_FAN.C: 255: if(keytime>=200)key_event = 2;
	movlw	(0C8h)
	subwf	(GetKeyEvent@keytime),w
	skipc
	goto	u461
	goto	u460
u461:
	goto	l2622
u460:
	
l2612:	
	movlw	(02h)
	movwf	(GetKeyEvent@key_event)
	goto	l2622
	line	260
	
l2614:	
;MS83F_ADC_FAN.C: 258: else
;MS83F_ADC_FAN.C: 259: {
;MS83F_ADC_FAN.C: 260: if(keytime>10 && keytime<200)key_event=1;
	movlw	(0Bh)
	subwf	(GetKeyEvent@keytime),w
	skipc
	goto	u471
	goto	u470
u471:
	goto	l2620
u470:
	
l2616:	
	movlw	(0C8h)
	subwf	(GetKeyEvent@keytime),w
	skipnc
	goto	u481
	goto	u480
u481:
	goto	l2620
u480:
	
l2618:	
	clrf	(GetKeyEvent@key_event)
	incf	(GetKeyEvent@key_event),f
	line	261
	
l2620:	
;MS83F_ADC_FAN.C: 261: keytime=0;
	clrf	(GetKeyEvent@keytime)
	line	263
	
l2622:	
;MS83F_ADC_FAN.C: 262: }
;MS83F_ADC_FAN.C: 263: return key_event;
	movf	(GetKeyEvent@key_event),w
	line	264
	
l1148:	
	return
	opt stack 0
GLOBAL	__end_of_GetKeyEvent
	__end_of_GetKeyEvent:
;; =============== function _GetKeyEvent ends ============

	signat	_GetKeyEvent,89
	global	_INT_INIT
psect	text531,local,class=CODE,delta=2
global __ptext531
__ptext531:

;; *************** function _INT_INIT *****************
;; Defined at:
;;		line 216 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/40
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text531
	file	"MS83F_ADC_FAN.C"
	line	216
	global	__size_of_INT_INIT
	__size_of_INT_INIT	equ	__end_of_INT_INIT-_INT_INIT
	
_INT_INIT:	
	opt	stack 6
; Regs used in _INT_INIT: []
	line	217
	
l2600:	
;MS83F_ADC_FAN.C: 217: INTEDG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	218
;MS83F_ADC_FAN.C: 218: INTF = 0;
	bcf	(89/8),(89)&7
	line	219
;MS83F_ADC_FAN.C: 219: INTE = 0;
	bcf	(92/8),(92)&7
	line	220
	
l1135:	
	return
	opt stack 0
GLOBAL	__end_of_INT_INIT
	__end_of_INT_INIT:
;; =============== function _INT_INIT ends ============

	signat	_INT_INIT,88
	global	_SET_PWM4_ON
psect	text532,local,class=CODE,delta=2
global __ptext532
__ptext532:

;; *************** function _SET_PWM4_ON *****************
;; Defined at:
;;		line 165 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;  duty            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  duty            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_SET_FAN_SPEED
;;		_main
;; This function uses a non-reentrant model
;;
psect	text532
	file	"MS83F_ADC_FAN.C"
	line	165
	global	__size_of_SET_PWM4_ON
	__size_of_SET_PWM4_ON	equ	__end_of_SET_PWM4_ON-_SET_PWM4_ON
	
_SET_PWM4_ON:	
	opt	stack 5
; Regs used in _SET_PWM4_ON: [wreg+status,2]
;SET_PWM4_ON@duty stored from wreg
	movwf	(SET_PWM4_ON@duty)
	line	166
	
l2588:	
;MS83F_ADC_FAN.C: 166: TRISC3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	167
	
l2590:	
;MS83F_ADC_FAN.C: 167: PWM4CR0 = 0b00110010;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(277)^0100h	;volatile
	line	168
;MS83F_ADC_FAN.C: 168: PWM4CR1 = 0b10000000;
	movlw	(080h)
	movwf	(278)^0100h	;volatile
	line	169
;MS83F_ADC_FAN.C: 169: T4CKDIV = 7;
	movlw	(07h)
	movwf	(279)^0100h	;volatile
	line	170
	
l2592:	
;MS83F_ADC_FAN.C: 170: TMR4H = 0;
	clrf	(275)^0100h	;volatile
	line	171
	
l2594:	
;MS83F_ADC_FAN.C: 171: TMR4L = 0;
	clrf	(274)^0100h	;volatile
	line	172
;MS83F_ADC_FAN.C: 172: PR4L = duty;
	movf	(SET_PWM4_ON@duty),w
	movwf	(276)^0100h	;volatile
	line	173
	
l2596:	
;MS83F_ADC_FAN.C: 173: TMR4IF = 0;
	bcf	(2224/8)^0100h,(2224)&7
	line	174
	
l2598:	
;MS83F_ADC_FAN.C: 174: TMR4ON = 1;
	bsf	(2226/8)^0100h,(2226)&7
	line	175
;MS83F_ADC_FAN.C: 175: while(TMR4IF==0) asm("clrwdt");
	goto	l1116
	
l1117:	
# 175 "MS83F_ADC_FAN.C"
clrwdt ;#
psect	text532
	
l1116:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	btfss	(2224/8)^0100h,(2224)&7
	goto	u431
	goto	u430
u431:
	goto	l1117
u430:
	
l1118:	
	line	176
;MS83F_ADC_FAN.C: 176: TRISC3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	177
	
l1119:	
	return
	opt stack 0
GLOBAL	__end_of_SET_PWM4_ON
	__end_of_SET_PWM4_ON:
;; =============== function _SET_PWM4_ON ends ============

	signat	_SET_PWM4_ON,4216
	global	_PWM_INIT
psect	text533,local,class=CODE,delta=2
global __ptext533
__ptext533:

;; *************** function _PWM_INIT *****************
;; Defined at:
;;		line 149 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/40
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text533
	file	"MS83F_ADC_FAN.C"
	line	149
	global	__size_of_PWM_INIT
	__size_of_PWM_INIT	equ	__end_of_PWM_INIT-_PWM_INIT
	
_PWM_INIT:	
	opt	stack 6
; Regs used in _PWM_INIT: [status,2]
	line	150
	
l2586:	
;MS83F_ADC_FAN.C: 150: PWM3CR0 = 0b00000000;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(271)^0100h	;volatile
	line	151
;MS83F_ADC_FAN.C: 151: PWM3CR1 = 0b00000000;
	clrf	(272)^0100h	;volatile
	line	152
;MS83F_ADC_FAN.C: 152: PWM4CR0 = 0b00000000;
	clrf	(277)^0100h	;volatile
	line	153
;MS83F_ADC_FAN.C: 153: PWM4CR1 = 0b00000000;
	clrf	(278)^0100h	;volatile
	line	154
;MS83F_ADC_FAN.C: 154: PWM5CR0 = 0b00000000;
	clrf	(283)^0100h	;volatile
	line	155
;MS83F_ADC_FAN.C: 155: PWM5CR1 = 0b00000000;
	clrf	(284)^0100h	;volatile
	line	156
	
l1113:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_INIT
	__end_of_PWM_INIT:
;; =============== function _PWM_INIT ends ============

	signat	_PWM_INIT,88
	global	_DELAY_1MS
psect	text534,local,class=CODE,delta=2
global __ptext534
__ptext534:

;; *************** function _DELAY_1MS *****************
;; Defined at:
;;		line 118 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DELAY_MS
;; This function uses a non-reentrant model
;;
psect	text534
	file	"MS83F_ADC_FAN.C"
	line	118
	global	__size_of_DELAY_1MS
	__size_of_DELAY_1MS	equ	__end_of_DELAY_1MS-_DELAY_1MS
	
_DELAY_1MS:	
	opt	stack 5
; Regs used in _DELAY_1MS: [wreg+status,2+status,0]
	line	121
	
l2576:	
;MS83F_ADC_FAN.C: 119: unsigned char a;
;MS83F_ADC_FAN.C: 121: for(a=0;a<250;a++)
	clrf	(DELAY_1MS@a)
	line	122
	
l1102:	
	line	123
# 123 "MS83F_ADC_FAN.C"
clrwdt ;#
psect	text534
	line	121
	
l2582:	
	incf	(DELAY_1MS@a),f
	
l2584:	
	movlw	(0FAh)
	subwf	(DELAY_1MS@a),w
	skipc
	goto	u421
	goto	u420
u421:
	goto	l1102
u420:
	line	125
	
l1104:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_1MS
	__end_of_DELAY_1MS:
;; =============== function _DELAY_1MS ends ============

	signat	_DELAY_1MS,88
	global	_DELAY_30US
psect	text535,local,class=CODE,delta=2
global __ptext535
__ptext535:

;; *************** function _DELAY_30US *****************
;; Defined at:
;;		line 77 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1    2[COMMON] unsigned char 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_GET_ADC_VALUE
;; This function uses a non-reentrant model
;;
psect	text535
	file	"MS83F_ADC_FAN.C"
	line	77
	global	__size_of_DELAY_30US
	__size_of_DELAY_30US	equ	__end_of_DELAY_30US-_DELAY_30US
	
_DELAY_30US:	
	opt	stack 4
; Regs used in _DELAY_30US: [wreg+status,2+status,0]
	line	80
	
l2844:	
;MS83F_ADC_FAN.C: 78: unsigned char a;
;MS83F_ADC_FAN.C: 80: for(a=0;a<6;a++)
	clrf	(DELAY_30US@a)
	line	81
	
l1085:	
	line	82
# 82 "MS83F_ADC_FAN.C"
clrwdt ;#
psect	text535
	line	80
	
l2850:	
	incf	(DELAY_30US@a),f
	
l2852:	
	movlw	(06h)
	subwf	(DELAY_30US@a),w
	skipc
	goto	u791
	goto	u790
u791:
	goto	l1085
u790:
	line	84
	
l1087:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_30US
	__end_of_DELAY_30US:
;; =============== function _DELAY_30US ends ============

	signat	_DELAY_30US,88
	global	_ADC_INIT
psect	text536,local,class=CODE,delta=2
global __ptext536
__ptext536:

;; *************** function _ADC_INIT *****************
;; Defined at:
;;		line 63 in file "MS83F_ADC_FAN.C"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text536
	file	"MS83F_ADC_FAN.C"
	line	63
	global	__size_of_ADC_INIT
	__size_of_ADC_INIT	equ	__end_of_ADC_INIT-_ADC_INIT
	
_ADC_INIT:	
	opt	stack 6
; Regs used in _ADC_INIT: [wreg]
	line	65
	
l2564:	
;MS83F_ADC_FAN.C: 65: ANSEL = 0B11000000;
	movlw	(0C0h)
	movwf	(145)^080h	;volatile
	line	66
;MS83F_ADC_FAN.C: 66: ADCON1 = 0B01100000;
	movlw	(060h)
	movwf	(159)^080h	;volatile
	line	68
	
l1082:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_INIT
	__end_of_ADC_INIT:
;; =============== function _ADC_INIT ends ============

	signat	_ADC_INIT,88
	global	_DEVICE_INIT
psect	text537,local,class=CODE,delta=2
global __ptext537
__ptext537:

;; *************** function _DEVICE_INIT *****************
;; Defined at:
;;		line 36 in file "MS83F_ADC_FAN.C"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text537
	file	"MS83F_ADC_FAN.C"
	line	36
	global	__size_of_DEVICE_INIT
	__size_of_DEVICE_INIT	equ	__end_of_DEVICE_INIT-_DEVICE_INIT
	
_DEVICE_INIT:	
	opt	stack 6
; Regs used in _DEVICE_INIT: [wreg+status,2]
	line	37
	
l2548:	
;MS83F_ADC_FAN.C: 37: OSCCON = 0B01010001;
	movlw	(051h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	41
	
l2550:	
;MS83F_ADC_FAN.C: 41: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	43
	
l2552:	
;MS83F_ADC_FAN.C: 43: CMCON0 = 0B00000111;
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	45
;MS83F_ADC_FAN.C: 45: PORTA = 0B00000000;
	clrf	(5)	;volatile
	line	46
	
l2554:	
;MS83F_ADC_FAN.C: 46: TRISA = 0B10111111;
	movlw	(0BFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	47
	
l2556:	
;MS83F_ADC_FAN.C: 47: WPUA = 0B00000000;
	clrf	(149)^080h	;volatile
	line	49
	
l2558:	
;MS83F_ADC_FAN.C: 49: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	50
	
l2560:	
;MS83F_ADC_FAN.C: 50: TRISC = 0B00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	51
;MS83F_ADC_FAN.C: 51: WPUC = 0B00000000;
	clrf	(136)^080h	;volatile
	line	53
	
l2562:	
;MS83F_ADC_FAN.C: 53: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	54
	
l1079:	
	return
	opt stack 0
GLOBAL	__end_of_DEVICE_INIT
	__end_of_DEVICE_INIT:
;; =============== function _DEVICE_INIT ends ============

	signat	_DEVICE_INIT,88
	global	_ISR
psect	text538,local,class=CODE,delta=2
global __ptext538
__ptext538:

;; *************** function _ISR *****************
;; Defined at:
;;		line 203 in file "MS83F_ADC_FAN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text538
	file	"MS83F_ADC_FAN.C"
	line	203
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 4
; Regs used in _ISR: []
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text538
	line	204
	
i1l2298:	
;MS83F_ADC_FAN.C: 204: if(INTE&&INTF)
	btfss	(92/8),(92)&7
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l1132
u4_20:
	
i1l2300:	
	btfss	(89/8),(89)&7
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l1132
u5_20:
	line	206
	
i1l2302:	
;MS83F_ADC_FAN.C: 205: {
;MS83F_ADC_FAN.C: 206: INTF = 0;
	bcf	(89/8),(89)&7
	line	208
	
i1l1132:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text539,local,class=CODE,delta=2
global __ptext539
__ptext539:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
