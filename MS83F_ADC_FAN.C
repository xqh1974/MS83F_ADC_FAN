/**********************************************************
*�ļ���:MS83F_ADC_AN2.c
*����:MS83Fxx02��ADCͨ��2������ʾ
*�����ͺ�:MS83F1602
*����:�ڲ�RC 4MHz 2T
*���Ŷ���:
*                 ----------------
*  VDD-----------|1(VDD)   (GND)8|------------GND									   
*  PA6-------- ---|2(PA6)    (PA0)7|-------------NC
*  PWM4------ --|3(PC3)    (PA1)6|-------------NC 
*  AN6-------- --|4(PC2)    (PC1)5|-------------KEY									
*                 ----------------
*                 MS83F0802B SOP8
*˵��:��AN6(ADCͨ��6)ͨ���Ĵ���ADCON1���õ�PC2������,
*     ͨ��ADת����⵽AN6�����ϵĵ�ѹ�ź�
**********************************************************/
#include "syscfg.h";
#include "MS83Fxx02.h";

#define LED_EN			PA6
#define MOTO_EN			PC3
#define PIN_KEY_DET	PC1
bit is_led_on = 0;
volatile unsigned char fan_speed=0;
volatile unsigned int Buff_AN6=0;
volatile unsigned int Buff_AN7=0,Val_Volt=0;
//��volatile����,ǿ�Ʒ����ַ,����ñ������Ż���.
//��Ϊ��������б���û�����߼��ж�,û�м�volatile���λᱻ�Ż���
/*====================================================
*������:DEVICE_INIT
*����:�ϵ�������ʼ��
*�������:��
*���ز���:��
====================================================*/
void DEVICE_INIT(void)
{
	OSCCON = 0B01010001;	//Bit7,LFMOD=0,WDT����Ƶ��=32KHz
							//Bit6:4,IRCF[2:0]=101,�ڲ�RCƵ��=4MHz
							//Bit0,SCS=1,ϵͳʱ��ѡ��Ϊ�ڲ�����

	INTCON = 0B00000000;	//�ݽ�ֹ�����ж�

	CMCON0 = 0B00000111;	//�رձȽ�����CxINΪ����IO��

	PORTA = 0B00000000;
	TRISA = 0B10111111;		//PA������� 0-��� 1-���� //PA6�������LED,Ĭ�����0
	WPUA = 0B00000000;		//PA�˿��������� 1-������ 0-������

	PORTC = 0B00000000;
	TRISC = 0B00111111;		//PC������� 0-��� 1-���� 
	WPUC = 0B00000000;		//PC�˿��������� 1-������ 0-������

	OPTION = 0B00001000;	//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
}

/*====================================================
*������:ADC_INIT
*����:ADCģ���ʼ��
*�������:��
*���ز���:��
====================================================*/
void ADC_INIT(void)
{
	//ANSEL = 0B01000000;	 //����AN6Ϊģ�������
    ANSEL = 0B11000000;	 //����AN6Ϊģ�������
	ADCON1 = 0B01100000; //DIVS=0,ʱ��ѡFOSC
						 //ADCS[2:0]=110,��ƵFOSC/64
}

/*====================================================
*��������:DELAY_30US
*����:����ʱ����(4MHz2T)
*�������:Time��ʱʱ�䳤��,��ʱʱ��Time Us
*���ز���:�� 
====================================================*/
void DELAY_30US(void)
{
	unsigned char a;

	for(a=0;a<6;a++)
	{
		CLRWDT();
	}
}

/*====================================================
*������:GET_ADC_VALUE
*����:����ADת��,�ο���ѹΪVDD
*�������:ADCͨ����
*���ز���:��������ADֵ
====================================================*/
unsigned int GET_ADC_VALUE(unsigned char ChannelNO,unsigned char Vref)
{
	unsigned char TempAdcon0=0;
	unsigned int TempADCBuffer=0;

	TempAdcon0 = (ChannelNO<<2);
	if(Vref==0) {TempAdcon0 |= 0b10000001;}
	else if(Vref==1) {TempAdcon0 |= 0b10100001;}
	else if(Vref==2) {TempAdcon0 |= 0b11000001;}
	else {TempAdcon0 |= 0b11100001;}
	ADCON0 = TempAdcon0;
	DELAY_30US();
	GO_DONE = 1;
	while(GO_DONE==1) CLRWDT();
	TempADCBuffer = ADRESH;
	TempADCBuffer = (TempADCBuffer<<8)|ADRESL;
	ADON = 0;
	return(TempADCBuffer);
}
/*====================================================
*��������:DELAY_1MS
*����:����ʱ����(4MHz2T)
*�������:Time��ʱʱ�䳤��,��ʱʱ��Time1Ms
*���ز���:�� 
====================================================*/
void DELAY_1MS(void)
{
	unsigned char a;

	for(a=0;a<250;a++)
	{
		CLRWDT();
	}
}

/*====================================================
*��������:DELAY_MS
*����:����ʱ����
*�������:Time��ʱʱ�䳤��,��ʱʱ��Time ms
*���ز���:�� 
====================================================*/
void DELAY_MS(unsigned char Time)
{
	unsigned char a;

	for(a=0;a<Time;a++)
	{
		DELAY_1MS();
	}
}
/*====================================================
*������:PWM_INIT
*����:PWMģ���ʼ��
*�������:��
*���ز���:��
====================================================*/
void PWM_INIT(void)
{
	PWM3CR0 = 0b00000000;
	PWM3CR1 = 0b00000000;
	PWM4CR0 = 0b00000000;
	PWM4CR1 = 0b00000000;
	PWM5CR0 = 0b00000000;
	PWM5CR1 = 0b00000000;
}

/*====================================================
*������:SET_PWM3_ON
*����:����PWM3
*�������:��
*���ز���:��
====================================================*/
void SET_PWM4_ON(unsigned char duty)
{
	TRISC3 = 1;
	PWM4CR0 = 0b00110010;
	PWM4CR1 = 0b10000000;
	T4CKDIV = 7;
	TMR4H = 0;
	TMR4L = 0;
	PR4L = duty;
	TMR4IF = 0;
	TMR4ON = 1;
	while(TMR4IF==0) CLRWDT();
	TRISC3 = 0;
}
void SET_FAN_SPEED(char speed)
{
    switch(speed)
    {
     case 1:
		SET_PWM4_ON(205);
        break;
     case 2:
		SET_PWM4_ON(230);
        break;
     case 3:
		SET_PWM4_ON(255);
        break;
     default:
		SET_PWM4_ON(0);
        break;
	}
}
/*====================================================
*������:interrupt ISR
*����:�жϷ�����
*�������:��
*���ز���:��
====================================================*/
void interrupt ISR(void)
{
	if(INTE&&INTF)
	{
		INTF = 0;
	}
}
/*====================================================
*������:INT_INIT
*����:�ⲿ�ж�INT��ʼ��
*�������:��
*���ز���:��
====================================================*/
void INT_INIT(void)
{
	INTEDG = 0;			//�½��ش���INT�ж�
	INTF = 0;			//��INT�жϱ�־
	INTE = 0;			//��ʱ�ر�INT�ж�Դ
}
void SYS_SLEEP()
{
	GIE = 0;	//����������п����ж�,������ǰ��ʱ�ر����ж�
	ADON = 0;	//����������õ�ADC,��Ҫ�ر�ADC��·
	CLRWDT();
	SWDTEN = 0;	//�����رտ��Ź�
				//���Ź����Ա�����Ϊһֱ�����޷������ر�,Ҳ����Ϊ��������or�ر�
				//�������λѡ��WDTE������ΪEnable,���Ź�һֱ�����޷������ر�
				//�������λѡ��WDTE������ΪDisable,���Ź����Ա���������or�ر�
	SLVREN = 0;	//�رյ͵�ѹ��λ,�͵�ѹ��λ���Ĵ����20uA
				//�͵�ѹ��λ�������غ�Ӳ���Զ����ؿ�������λ����
				//������Բ�������λѡ�����LVRENѡ���˵��
				//������LVRENѡ����ѡ����SLVREN(�͵�ѹ��λ�ɳ�����ƿ���)
	INTEDG = 0; //�½��ش����ж�
	INTF = 0;
	INTE = 1;	//����INT�ж�
	SLEEP();
	NOP();
	INTE = 0;	//�ر�INT�ж�
	INTF = 0;
	SWDTEN = 1; //�����������Ź�
	CLRWDT();
	SLVREN = 1;
	GIE = 1;	//����������п����ж�,�ָ��������ж�
}
char GetKeyEvent(void)
{
	static unsigned char keytime=0;
    unsigned char key_event=0;
    if(PIN_KEY_DET==0)
    {
        if(keytime<200)
        {
			keytime++;
			if(keytime>=200)key_event = 2;
        }
    }
    else
    {
        if(keytime>10 && keytime<200)key_event=1;
        keytime=0;
    }
    return key_event;
}
void detect_block()
{
    char i,limit;
    Buff_AN7 = GET_ADC_VALUE(7,1);									//AN7ͨ��,�ο���ѹΪ�ڲ��̶�2V
	Val_Volt = (unsigned long)Buff_AN7*2*4*1000/1024;	//��ѹֵ�Ŵ�1000��
    if(Val_Volt>4000)limit=140;
    else if(Val_Volt>3700)limit=135;
    else if(Val_Volt>3400)limit=130;
    else if(Val_Volt>3100)limit=125;
    else if(Val_Volt>2900)limit=120;
    else if(Val_Volt>2600)limit=115;
    else limit=110;
    Buff_AN6=0;
    for(i=0;i<20;i++)Buff_AN6 += GET_ADC_VALUE(6,1);	//ͨ��6,�ο���ѹ�ڲ�2V
	Buff_AN6/=20;
	if(Buff_AN6>limit)
	{
			fan_speed=0;
			MOTO_EN=0;
			SYS_SLEEP();
	}
}
/*====================================================
*������:main
*����:������
*�������:��
*���ز���:��
====================================================*/
#if 1
volatile unsigned over_load_cnt=0;
void main(void)
{
	DEVICE_INIT();      //������ʼ��
	ADC_INIT();         //ADC��ʼ��
    PWM_INIT();
    INT_INIT();
	while(1)
	{
        char key = GetKeyEvent();
        if(key)
        {
            if(key==2)//long press
            {
                if(is_led_on)
                {
                    is_led_on=0;
                    LED_EN = 0;
                    SYS_SLEEP();
                }
                else
                {
					is_led_on=1;
					LED_EN = 1;
                    if(fan_speed)
                    {
                        SET_PWM4_ON(0);
                        fan_speed=0;
                    }
                }
            }
             else if(is_led_on==0)//short press and LED off
             {
                 fan_speed++;
                 if(fan_speed>3)
                 {
                     fan_speed=0;
                     SET_FAN_SPEED(0);
                     SYS_SLEEP();
                 }
                 else
                 {
					 SET_FAN_SPEED(3);
					 DELAY_MS(100);
					 over_load_cnt=0;
                 }
             }
        }
 
        if(fan_speed)
        {
            over_load_cnt++;
            if(over_load_cnt>=10)
            {               
				//SET_FAN_SPEED(3);
                TRISC3 = 1;
                PWM4CR0 = 0;
				PWM4CR1 =0;
				T4CKDIV = 0;
				TMR4H = 0;
				TMR4L = 0;
				PR4L = 0;
				TMR4IF = 0;
				TMR4ON = 0;
                DELAY_MS(1);
                TRISC3 = 0;
                MOTO_EN=1;
				DELAY_MS(5);
				detect_block();
				SET_FAN_SPEED(fan_speed);
                DELAY_MS(4);
                over_load_cnt=0;
            }
            else  DELAY_MS(10);          
        }
        else DELAY_MS(10);
	}
}
#else
void main(void)
{
	DEVICE_INIT();      //������ʼ��
	ADC_INIT();         //ADC��ʼ��
    TRISC3 = 0;
    MOTO_EN=0;
    INT_INIT();
	while(1)
	{
        char key = GetKeyEvent();
        if(key)
        {
            if(key==2)//long press
            {
                if(is_led_on)
                {
                    is_led_on=0;
                    LED_EN = 0;
                    SYS_SLEEP();
                }
                else
                {
					is_led_on=1;
					LED_EN = 1;
                    if(fan_speed)
                    {
                        MOTO_EN=0;
                        fan_speed=0;
                    }
                }
            }
             else if(is_led_on==0)//short press and LED off
             {
                 fan_speed++;
                 if(fan_speed>3)
                 {
                     fan_speed=0;
                     MOTO_EN=0;
					 SYS_SLEEP();
                 }
                 else
                 {
                     MOTO_EN=1;
                     DELAY_MS(200);
                 }
             }
        }
/*
        if(fan_speed)
        {
             MOTO_EN=1;
             DELAY_MS(3);
             detect_block();
             if(fan_speed==1)
             {
				 MOTO_EN=0;
                 DELAY_MS(9); 
             }
             else  if(fan_speed==2)
             {
                 DELAY_MS(4);
				 MOTO_EN=0;
				 DELAY_MS(3); 
             } 
             else  DELAY_MS(7);  
                   
        }
        else */DELAY_MS(10);
	}
}
#endif