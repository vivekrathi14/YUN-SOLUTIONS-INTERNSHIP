/**************************************************************************//**
 * @file     main.c
 * @version  V3.00
 * 
 * @brief    GENERIC IoT APPLICATION.
 *
 * @note
 * Copyright (C) 2013 Nuvoton Technology Corp. All rights reserved.
 ******************************************************************************/
 
 /*
	basic program flow
	lcd displays
	if object is detected, lcd displays "object detected" and "enter your phone number"
	if no number is entered lcd displays TIME OUT in 20 s, wherein object won't be detected for 20 s
	if a number is entered-
	case 1: directly enter i.e. "#" key for the first time, it wont display anything
	case 2: enters 5 out of 10 digits and stops, doen't press enter i.e. "#" key, TIME OUT will be 
	        displayed on LCD in 20 s after the last entry.
	
	
 
 */
/* Include header files */
#include <stdio.h>       
#include "M051Series.h"
#include "lcd4bit.h"
#include <string.h>
#include "QuectelMC60.h"
#include "keypad.h"
#include "Flash1.h"


#define PLLCON_SETTING      CLK_PLLCON_50MHz_HXT
#define PLL_CLOCK           50000000

/* Global Variables Declaration */
unsigned int int_c=0; //int_c= interrupt counter
unsigned int c11,c22; //count 1=c1 and count 2=c2
unsigned char flag = FALSE; //flag for interrupt
unsigned int d=0; // d is distance
unsigned int detect=0; // detect flag
/* Removed debouncing as it couldn't detect swift movements */
//unsigned int count=0; // debouncing variable for ultrasonic
signed int object=0; // Object count of the objects detected by Ultrasonic Sensor
unsigned int d1=0; // dummy variable
char a[50]={"0"}; //data packet 1
char db[10]={0}; // dummy string for data packet 2
char *time; // pointer for UTC time
char b[50]={"1"}; // Data Packet 2
char uflag=0;	// ultrasonic flag for detect=1
char pflag=0;	//position flag for 20 stimeout
char keypad_data[20];	//buffer for keypad data
char kflag=0; // keypad flag if keypad has been used


/* Other Global variables are declared in the .c files for keypad, Quectel and LCD */
/* 
	System Inititalisation Function-
    Decides clock settings
    Primitive Register Configuration
*/

void SYS_Init(void)
{
    /*---------------------------------------------------------------------------------------------------------*/
    /* Init System Clock                                                                                       */
    /*---------------------------------------------------------------------------------------------------------*/

    /* Enable Internal RC 22.1184MHz clock */
    CLK->PWRCON |= CLK_PWRCON_OSC22M_EN_Msk;

    /* Waiting for Internal RC clock ready */
    while(!(CLK->CLKSTATUS & CLK_CLKSTATUS_OSC22M_STB_Msk));

    /* Switch HCLK clock source to Internal RC and HCLK source divide 1 */
    CLK->CLKSEL0 = (CLK->CLKSEL0 & (~CLK_CLKSEL0_HCLK_S_Msk)) | CLK_CLKSEL0_HCLK_S_HIRC;
    CLK->CLKDIV = (CLK->CLKDIV & (~CLK_CLKDIV_HCLK_N_Msk)) | CLK_CLKDIV_HCLK(1);

    /* Set PLL to Power down mode and HW will also clear PLL_STB bit in CLKSTATUS register */
    CLK->PLLCON |= CLK_PLLCON_PD_Msk;    
    
    /* Enable external XTAL 12MHz clock */
    CLK->PWRCON |= CLK_PWRCON_XTL12M_EN_Msk;

    /* Waiting for external XTAL clock ready */
    while(!(CLK->CLKSTATUS & CLK_CLKSTATUS_XTL12M_STB_Msk));

    /* Set core clock as PLL_CLOCK from PLL */
    CLK->PLLCON = PLLCON_SETTING;
    while(!(CLK->CLKSTATUS & CLK_CLKSTATUS_PLL_STB_Msk));
    CLK->CLKSEL0 = (CLK->CLKSEL0 & (~CLK_CLKSEL0_HCLK_S_Msk)) | CLK_CLKSEL0_HCLK_S_PLL;

    /* Update System Core Clock */
    /* User can use SystemCoreClockUpdate() to calculate PllClock, SystemCoreClock and CycylesPerUs automatically. */
    PllClock        = PLL_CLOCK;            // PLL
    SystemCoreClock = PLL_CLOCK / 1;        // HCLK
    CyclesPerUs     = PLL_CLOCK / 1000000;  // For CLK_SysTickDelay()
	/* 
	   Enable peripheral clock 
	   1. TIMER0- Delay (Polling Method)
	   2. TIMER1- Time for echo pulse
	   3. TIMER2- ISR for ultrasonic sensor sampling, every 2s
	   4. WATCHDOG TIMER for timeout of 27s
	   5. TIMER3- ISR for timeout for 20s
	*/
    CLK->APBCLK = CLK_APBCLK_TMR0_EN_Msk |
                   CLK_APBCLK_TMR1_EN_Msk |CLK_APBCLK_TMR2_EN_Msk|CLK_APBCLK_WDT_EN_Msk|CLK_APBCLK_TMR3_EN_Msk;

    /* 
	Peripheral clock source 
	  1. TIMER0- HIRC=22.1184 MHz
	  2. TIMER1- HCLK=50 MHz
	  3. TIMER2- HIRC=22.1184 MHz
	  4. WDT- LIRC=10 kHz
	  5. TIMER3- HIRC= 22.1184 MHz
	*/
    CLK->CLKSEL1 = CLK_CLKSEL1_TMR0_S_HIRC|
                   CLK_CLKSEL1_TMR1_S_HCLK | CLK_CLKSEL1_TMR2_S_HXT|CLK_CLKSEL1_WDT_S_LIRC|CLK_CLKSEL1_TMR3_S_HIRC;
	
	
	/* Need to change this piece of code */
	/** Enable UART module clock **/
    CLK_EnableModuleClock(UART0_MODULE);
    /** Select UART module clock source **/
    CLK_SetModuleClock(UART0_MODULE, CLK_CLKSEL1_UART_S_HXT, CLK_CLKDIV_UART(1));

   
    /*---------------------------------------------------------------------------------------------------------*/
    /* UART I/O Multi-function                                                                                 */
    /*---------------------------------------------------------------------------------------------------------*/
    /** Set P3 multi-function pins for UART0 RXD and TXD **/
    SYS->P3_MFP &= ~(SYS_MFP_P30_Msk | SYS_MFP_P31_Msk);
    SYS->P3_MFP |= (SYS_MFP_P30_RXD0 | SYS_MFP_P31_TXD0); // RX=5, TX=7
	
	/* Set P0 multi-function pins for UART0 RTS and CTS */ //we need only CTS
    SYS->P0_MFP &= ~(SYS_MFP_P03_Msk | SYS_MFP_P02_Msk);
    SYS->P0_MFP |= (SYS_MFP_P03_RTS0 | SYS_MFP_P02_CTS0); //RTS0=37 , CTS0=38

                   
}

/* GPIOP2P3P4_IRQHandler()- GPIO ISR for Ultrasonic Sensor*/
void GPIOP2P3P4_IRQHandler(void)
{
    
	  	int_c++;
	    flag = TRUE; // flag
	    if (int_c==1)
		{   
			/* Open and Start the TIMER */
			TIMER_Open(TIMER1, TIMER_CONTINUOUS_MODE, 2);//Timer 1 initialisation
			TIMER_Start(TIMER1);
			c11 = TIMER1->TDR; //get count value c1= c1 aprrox= 0 to 10
			GPIO_CLR_INT_FLAG(P2, BIT7); // Clear Interrupt Flag Bit			  
		}
		 
		if (int_c==2)
		{
			  GPIO_CLR_INT_FLAG(P2, BIT7); //Clear Interrupt Flag Bit
			  c22=TIMER1->TDR;
			  int_c=0; // make interrupt counter to 0
		}
}

void GPIO_init()
{
    /* 1. KEYPAD PINS */
    /* Rows as output */
    GPIO_SetMode(P1, BIT6, GPIO_PMD_OUTPUT); //P16 r1=2
    GPIO_SetMode(P4, BIT2, GPIO_PMD_OUTPUT); //P42 r2=48
    GPIO_SetMode(P1, BIT3, GPIO_PMD_OUTPUT); //P13 r3=46
    GPIO_SetMode(P1, BIT1, GPIO_PMD_OUTPUT); //P11 r4=44
    /* Columns as input */
    GPIO_SetMode(P4, BIT3, GPIO_PMD_INPUT); // P43- 12 =c1
    GPIO_SetMode(P3, BIT4, GPIO_PMD_INPUT); // P34- 10 =c2
    GPIO_SetMode(P3, BIT2, GPIO_PMD_INPUT); // P32- 08 =c3
    
    /* 2. Ultrasonic Sensor */
    /* Configure P2.7 as Input mode and enable interrupt by rising edge trigger */
    GPIO_SetMode(P4, BIT5, GPIO_PMD_OUTPUT);  //GENERAL GPIO PIN,trigger= P45=29
    GPIO_SetMode(P2, BIT7, GPIO_PMD_INPUT);	//INPUT USED as INTERRUPT,echo= P27=27
    /* !TODO Piece of code for Ultarsonic sensor 2 */

    /* 3. LCD PINS- All are o/p*/
    GPIO_SetMode(P0, BIT7, GPIO_PMD_OUTPUT); //P07 D7= 32
    GPIO_SetMode(P0, BIT6, GPIO_PMD_OUTPUT); //P06 D6= 33
    GPIO_SetMode(P0, BIT5, GPIO_PMD_OUTPUT); //P05 D5= 34
    GPIO_SetMode(P0, BIT4, GPIO_PMD_OUTPUT); //P04 D4= 35
    GPIO_SetMode(P4, BIT1, GPIO_PMD_OUTPUT); // P41- EN = 36
    GPIO_SetMode(P4, BIT4, GPIO_PMD_OUTPUT); // P44- RS = 28

    /* 4.LED PINS- ALL are o/p */
    GPIO_SetMode(P2, BIT5, GPIO_PMD_OUTPUT); //P25 L3= 25
    GPIO_SetMode(P2, BIT4, GPIO_PMD_OUTPUT); //P24 L2= 23
    GPIO_SetMode(P2, BIT2, GPIO_PMD_OUTPUT); //P22 L1= 21
    /* LEDs Initialization */
    P22=0;
    P24=0;
    P25=0;	
}
/* TIMER 2 Initialisation for sampling Ultrasonic Sensor every 5 s */
void TIMER2_init()
{

	/* Open Timer2 frequency to 0.2 Hz i.e. 2 s in periodic mode, and enable interrupt */
	/* TIMER2, CLK= 22.1184 MHz */
    TIMER2->TCMPR = __HXT; //12000000
    TIMER2->TCSR = TIMER_TCSR_IE_Msk | TIMER_PERIODIC_MODE; //Interrupt has been enabled**
    TIMER_SET_PRESCALE_VALUE(TIMER2,1); //prescalar=3, i.e. 0.5*(3+1=4)=2s
}

/* TIMER3_init()-TIMER 3 Initialisation for timeout every 20 s */
void TIMER3_init()
{

	/* Open Timer3 frequency to 0.05 Hz i.e. 20 s in periodic mode, and enable interrupt */
	/* TIMER3, CLK= 22.1184 MHz */
    TIMER3->TCMPR = 11059200; 
    TIMER3->TCSR = TIMER_TCSR_IE_Msk | TIMER_PERIODIC_MODE; //Interrupt has been enabled**
    TIMER_SET_PRESCALE_VALUE(TIMER3, 39); //prescalar=39, i.e. 0.5*(39+1=40) =20s
	TIMER_EnableInt(TIMER3);
}

 
/* TMR2_IRQHandler(void)- TIMER2 ISR*/
void TMR2_IRQHandler(void)
{
        /* Clear Timer2 time-out interrupt flag */
	    TIMER_ClearIntFlag(TIMER2);
	    if(detect) // checks value of detect flag variable
		{
	        //P26=0; // LED blinks- indicates that sensor has detected an object
			uflag=1;
			detect=0; // clear the flag
		    object++; // increment the object value
			lcd4cmd(0x01);
			lcd("Object Detected");
			TIMER_Delay(TIMER0,1000000);
			lcd4cmd(0x01);
			lcd("Enter Your Phone Number");
			TIMER_Delay(TIMER0,1000000);
			pflag=1;	//position flag for keypad_data[], to clear the buffer
			KEYPAD(keypad_data,pflag);	//KEYPAD() to reflect pflag value
			pflag=0;
			TIMER3_init(); // Initialise TIMER 3 for timeout of 20s
			TIMER_Start(TIMER3);
		}
}

/* TMR3_IRQHandler(void)- TIMER3 ISR*/
void TMR3_IRQHandler(void)
{
		/* Clear Timer2 time-out interrupt flag */
	    TIMER_ClearIntFlag(TIMER3);
	    uflag=0;	// clear ultrasonic sensor flag
		lcd4cmd(0x01); // clear display
		lcd("TIME OUT");
		TIMER_Delay(TIMER0,500000); // delay 500 ms
		lcd4cmd(0x01); // clear display
		lcd4cmd(0x80);// go to 
		pflag=1;	//position flag for keypad_data[], to clear the buffer
		KEYPAD(keypad_data,pflag);	//KEYPAD() to reflect pflag value
		pflag=0;
		object=0;
		TIMER_Close(TIMER3);
}


/* Ultrasonic Function calculates the distance of the detection*/
unsigned int UltraSonic()
{
	   
    /* Generate Trigger Signal */
    P45=0;
    TIMER_Delay(TIMER0,2); //2 uS
    P45=1;
    TIMER_Delay(TIMER0,10); //10 uS
    P45=0; // Make it zero,must

    /* Enable Interrupt at P27=27 as rising edge */
    GPIO_EnableInt(P2, 7, GPIO_INT_RISING);

    /* 
      Waiting for interrupts 
      When Interrupt occurs,program will jump to ISR
    */
//    while(!flag); //wait for interrupt 1 (i.e we are doing polling only)
//    flag = FALSE; //clear the flag (End of Interrupt 1)
	
	unsigned int time=0;
    while(!flag)
	{
      CLK_SysTickDelay(1);
	  time++;
	  if(time>10000) break;
	}//wait for interrupt 1 (i.e we are doing polling only)
    flag = FALSE; //clear the flag (End of Interrupt 1)


    /* Enable Interrupt at P27=27 as falling edge */
    GPIO_EnableInt(P2, 7, GPIO_INT_FALLING);

    /* 
      Use timeout condition for echo-
      i.e. max distance= 250 cm i.e. 2.5 m, speed of sound= 340m/s
      time for 250cm is 2.5/340=7.3 ms, hence max time is 7.3 ms
      As clock freq= 50 MHz, one count= 20 ns, i.e 5,00,000 counts= 10 ms

    */
    while(!flag && TIMER1->TDR-c11<500000); //wait for interrupt 2
    flag = FALSE; // end of interrupt 2
    /* Condition for timeout */
    if(TIMER1->TDR-c11>500000)
    {
        c22=TIMER1->TDR;
        int_c=0;
    }
    GPIO_DisableInt(P2, 7); // Disable the interrupt at P27

    /* Stop and Close the TIMER1 */
    TIMER_Stop(TIMER1);
    TIMER_Close(TIMER1);
	
	/* 
	**Use only for debugging
	This continuous blinking implies-sensor works perfect 
	and doesn't hang in the interrupt
	Remove it when not debugging
	*/
	P24=~P24;

    /* Timeout Conditional logic */
    if(c22-c11>500000)
    {
        return 0;
    }
    else
    {
        return (int)((c22-c11)*0.083/58); 
    }
}


/*---------------------------------------------------------------------------------------------------------*/
/* MAIN function                                                                                           */
/*---------------------------------------------------------------------------------------------------------*/
int main(void)
{	
	unsigned int i=0;	// loop variable
	char *ID;	//ID to get IMEI ID string
	char kdata=0;

	/* Calling System Initialisation Functions */
	
    /* Unlock protected registers */
    SYS_UnlockReg();
    /* Init System, peripheral clock and multi-function I/O */
    SYS_Init();
	
	/* 
	As we are using WDT, FMC -we need an access to write to those registers, 
	hence, we must keep regesters unlocked
	*/
	/* Lock protected registers */
	//SYS_LockReg();
	
	/* Enable WDT time-out reset function and select time-out interval to 2^18 * WDT clock then start WDT counting (26.214s)*/
	WDT_Open(WDT_TIMEOUT_2POW18, WDT_RESET_DELAY_1026CLK, TRUE, FALSE);
	
	/* Clear WDT Flag*/
	if(WDT_GET_RESET_FLAG() == 1)
    {
        WDT_CLEAR_RESET_FLAG();	
    }
    /* Logic for Reset after WDT in application program */
	FMC_Open();
	FMC_Erase(DATA_FLASH_BASE_ADDR);
	FMC_Write(DATA_FLASH_BASE_ADDR,0x5000);
    
	/* Program Initialisation */
	UART0_Init(); 	// Initialise UART0 communication
    GPIO_init();  	// Initialise GPIO pins for LCD,Keypad and Ultrasonic sensors
	TIMER2_init(); 	// Initialise TIMER 2 for sampling Ultrasonic sensor every 2 seconds
	
	/* Lower the TIMER 2 Interrupt property */
	//NVIC_SetPriority(TMR2_IRQn,1); 
	
	/* In case the program takes more time or time nearer to WDT time, reset it periodically */
	/* Resets the WDT Counter */
	WDT_RESET_COUNTER();
	
	
	lcd4init();  //Initialise LCD in 4 bit mode
	lcd4cmd(0x01); // clear the display
	lcd("YUN SOLUTIONS"); // display content on the LCD
	/* 
	  GSM Initialise function 
	  1. Sends character 0x1B
	  2. Sends AT Command- if adaptive baudrate-sending AT command is must
	*/
    GSM_Init();
    /* Resets the WDT Counter */
	WDT_RESET_COUNTER();
	
	/* Delay of 15-20 seconds for Unsolicited Result Codes */
//	for(i=0;i<15;i++)
//	{
//		TIMER_Delay(TIMER0,1000000);
//	}
	
	ID=GSM_ID(); // gets device ID
	WDT_RESET_COUNTER();
	/*
	  TCP Initialise function
	  1. Connects to the network i.e GPRS
	  2. Initialise settings for TCP connection
	  3. Connects to the Server
	*/
	TCP_init(); // Initialises TCP
	WDT_RESET_COUNTER();
	
	/* Gets UTC time (GMT) for time stamping */
	time=GSM_Time(); //time has UTC value
	WDT_RESET_COUNTER();
	/* 
	  String or data packet formating
	  1. Data packet a => <Packet No.,Device ID,UTC\n> ,It is sent only once,whenever the system boots or starts for first time
	  2. Data packet c => <Packet No., Device ID,UTC,Keypad Data,Object count\n>, It is sent when user presses enter key
	  
	  a => packet no. - 0
	  b => packet no. - 1
	*/
	sprintf(a,"%s,%s,%s\n",a,ID,time);
	sprintf(b,"%s,%s",b,ID);
	sprintf(db,"%s",b);
	
	/* Sends the desired data or data packet to the server */
	GSMTCP_Send("AT+QISEND\r",a);
    WDT_RESET_COUNTER();
	/* 
		Enable ISRs
		1. TIMER 2 ISR
		2. GPIO ISR
	*/
	NVIC_EnableIRQ(TMR2_IRQn); // TIMER 2 ISR
    NVIC_EnableIRQ(GPIO_P2P3P4_IRQn); // GPIO ISR
	NVIC_EnableIRQ(TMR3_IRQn); // TIMER 3 ISR
	
	/* 
	   Clear the LCD display 
	   Displays message
	*/
	lcd4cmd(0x01);
	lcd("READY TO USE");
	TIMER_Delay(TIMER0,500000); // Delay for 500 ms
	lcd4cmd(0x01);
	lcd4cmd(0x80);
	WDT_RESET_COUNTER();
	/* Start TIMER 2 */
	TIMER_Start(TIMER2);
	
	
    
	
	/* 
	   Infinite while loop 
	   It includes- 
	   1. Continous polling of Ultrasonic Sensor
	   2. Continous polling of the Keypad
	*/
	while(1)
	{
		
        /* Resets the WDT Counter */
        WDT_RESET_COUNTER();
        /* 
           Make all LEDs low/0
           1. P25- LED for Keypad Data Sent
           2. P24- LED for object Data Sent
           3. P22- LED		
        */
        P25=0; // Kepad LED
        //P24=0; // Object LED
        P22=0;
        
	    /* Ultrasonic Polling */
        d=UltraSonic(); // Gets distance d using Ultrasonic sensor
        TIMER_Delay(TIMER0,10000); //10 ms delay, Give some delay so that noisy signal gets reduced (kinda debouncing)

		/* Use a uflag as ultrasonic flag, so that "object detected" on LCD is no more pain */
        /* Conditional Logic */
        if(d1)
		{
		if(d>1 && d<80 && !uflag)
		{
			detect=1;
		}
		}
		d1=d;
		/* Keypad polling */
		kdata= (KEYPAD(keypad_data,pflag));
		/* if key is entered, create timeout condition after last key pressed, i.e. timeout of 20 s */
		if(kdata==0x01)
		{
			uflag=1;
			TIMER_Close(TIMER3);
			TIMER3_init(); // Initialise TIMER 3 for timeout of 20s
			TIMER_Start(TIMER3);
		}
		
		/* if enter key is pressed i.e "#" */
		if(kdata==0xFF)
        {
			if(object)
			{
				TIMER_Close(TIMER3);
				time=GSM_Time(); //to get time UTC
			    P25=0; // make LED high for visual indication
				lcd4cmd(0x01); // clear display
				/* string formating */
				sprintf(b,"%s,%s,%s,%d\n",b,time,keypad_data,object);
				/* Send data to server */
				GSMTCP_Send("AT+QISEND\r",b);
				strcpy(b,db);
			    lcd("MONEY SENT");
			    TIMER_Delay(TIMER0,500000); // delay 500 ms
				object=0;
				lcd4cmd(0x01); // clear display
				lcd4cmd(0x80);// go to home
				uflag=0;
			}
			else
			{
				lcd4cmd(0x01); // clear display
				lcd("MONEY NOT SENT");
				TIMER_Delay(TIMER0,500000); // delay 500 ms
				lcd4cmd(0x01); // clear display
				lcd4cmd(0x80);// go to home
				TIMER_Close(TIMER3);
				uflag=0;
			}
		}
		/* if object is not detected and person enters the key,lcd will clear it immediately */
		if (object==0 && kdata==0x01)
		{
				
				lcd4cmd(0x01);
				lcd4cmd(0x80);
				uflag=0;
				
		}

	}
}
