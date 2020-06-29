/**********************************************************
*文件名:MS83F_ADC_AN2.c
*功能:MS83Fxx02的ADC通道2功能演示
*器件型号:MS83F1602
*振荡器:内部RC 4MHz 2T
*引脚定义:
*                 ----------------
*  VDD-----------|1(VDD)   (GND)8|------------GND									   
*  PA6-------- ---|2(PA6)    (PA0)7|-------------NC
*  PWM4------ --|3(PC3)    (PA1)6|-------------NC 
*  AN6-------- --|4(PC2)    (PC1)5|-------------KEY									
*                 ----------------
*                 MS83F0802B SOP8
*说明:将AN6(ADC通道6)通过寄存器ADCON1设置到PC2引脚上,
*     通过AD转换检测到AN6引脚上的电压信号
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
//用volatile修饰,强制分配地址,以免该变量被优化掉.
//因为后面程序中变量没有做逻辑判断,没有加volatile修饰会被优化掉
/*====================================================
*函数名:DEVICE_INIT
*功能:上电器件初始化
*输入参数:无
*返回参数:无
====================================================*/
void DEVICE_INIT(void)
{
	OSCCON = 0B01010001;	//Bit7,LFMOD=0,WDT振荡器频率=32KHz
							//Bit6:4,IRCF[2:0]=101,内部RC频率=4MHz
							//Bit0,SCS=1,系统时钟选择为内部振荡器

	INTCON = 0B00000000;	//暂禁止所有中断

	CMCON0 = 0B00000111;	//关闭比较器，CxIN为数字IO口

	PORTA = 0B00000000;
	TRISA = 0B10111111;		//PA输入输出 0-输出 1-输入 //PA6输出控制LED,默认输出0
	WPUA = 0B00000000;		//PA端口上拉控制 1-开上拉 0-关上拉

	PORTC = 0B00000000;
	TRISC = 0B00111111;		//PC输入输出 0-输出 1-输入 
	WPUC = 0B00000000;		//PC端口上拉控制 1-开上拉 0-关上拉

	OPTION = 0B00001000;	//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
}

/*====================================================
*函数名:ADC_INIT
*功能:ADC模块初始化
*输入参数:无
*返回参数:无
====================================================*/
void ADC_INIT(void)
{
	//ANSEL = 0B01000000;	 //设置AN6为模拟输入口
    ANSEL = 0B11000000;	 //设置AN6为模拟输入口
	ADCON1 = 0B01100000; //DIVS=0,时钟选FOSC
						 //ADCS[2:0]=110,分频FOSC/64
}

/*====================================================
*函数名称:DELAY_30US
*功能:短延时函数(4MHz2T)
*输入参数:Time延时时间长度,延时时长Time Us
*返回参数:无 
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
*函数名:GET_ADC_VALUE
*功能:开启AD转换,参考电压为VDD
*输入参数:ADC通道数
*返回参数:采样到的AD值
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
*函数名称:DELAY_1MS
*功能:短延时函数(4MHz2T)
*输入参数:Time延时时间长度,延时时长Time1Ms
*返回参数:无 
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
*函数名称:DELAY_MS
*功能:短延时函数
*输入参数:Time延时时间长度,延时时长Time ms
*返回参数:无 
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
*函数名:PWM_INIT
*功能:PWM模块初始化
*输入参数:无
*返回参数:无
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
*函数名:SET_PWM3_ON
*功能:开启PWM3
*输入参数:无
*返回参数:无
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
*函数名:interrupt ISR
*功能:中断服务函数
*输入参数:无
*返回参数:无
====================================================*/
void interrupt ISR(void)
{
	if(INTE&&INTF)
	{
		INTF = 0;
	}
}
/*====================================================
*函数名:INT_INIT
*功能:外部中断INT初始化
*输入参数:无
*返回参数:无
====================================================*/
void INT_INIT(void)
{
	INTEDG = 0;			//下降沿触发INT中断
	INTF = 0;			//请INT中断标志
	INTE = 0;			//暂时关闭INT中断源
}
void SYS_SLEEP()
{
	GIE = 0;	//如果程序中有开启中断,在休眠前暂时关闭总中断
	ADON = 0;	//如果程序有用到ADC,需要关闭ADC电路
	CLRWDT();
	SWDTEN = 0;	//软件关闭看门狗
				//看门狗可以被设置为一直开启无法软件关闭,也可以为软件开启or关闭
				//如果配置位选项WDTE被设置为Enable,则看门狗一直开启无法软件关闭
				//如果配置位选项WDTE被设置为Disable,则看门狗可以被软件开启or关闭
	SLVREN = 0;	//关闭低电压复位,低电压复位功耗大概是20uA
				//低电压复位的软开关和硬件自动开关可有配置位设置
				//具体可以参照配置位选项表的LVREN选项的说明
				//此例程LVREN选项是选择了SLVREN(低电压复位由程序控制开关)
	INTEDG = 0; //下降沿触发中断
	INTF = 0;
	INTE = 1;	//开启INT中断
	SLEEP();
	NOP();
	INTE = 0;	//关闭INT中断
	INTF = 0;
	SWDTEN = 1; //软件开启看门狗
	CLRWDT();
	SLVREN = 1;
	GIE = 1;	//如果程序中有开启中断,恢复开启总中断
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
    Buff_AN7 = GET_ADC_VALUE(7,1);									//AN7通道,参考电压为内部固定2V
	Val_Volt = (unsigned long)Buff_AN7*2*4*1000/1024;	//电压值放大1000倍
    if(Val_Volt>4000)limit=140;
    else if(Val_Volt>3700)limit=135;
    else if(Val_Volt>3400)limit=130;
    else if(Val_Volt>3100)limit=125;
    else if(Val_Volt>2900)limit=120;
    else if(Val_Volt>2600)limit=115;
    else limit=110;
    Buff_AN6=0;
    for(i=0;i<20;i++)Buff_AN6 += GET_ADC_VALUE(6,1);	//通道6,参考电压内部2V
	Buff_AN6/=20;
	if(Buff_AN6>limit)
	{
			fan_speed=0;
			MOTO_EN=0;
			SYS_SLEEP();
	}
}
/*====================================================
*函数名:main
*功能:主函数
*输入参数:无
*返回参数:无
====================================================*/
#if 1
volatile unsigned over_load_cnt=0;
void main(void)
{
	DEVICE_INIT();      //器件初始化
	ADC_INIT();         //ADC初始化
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
	DEVICE_INIT();      //器件初始化
	ADC_INIT();         //ADC初始化
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
