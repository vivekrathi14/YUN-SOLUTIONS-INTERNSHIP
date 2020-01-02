/*
******************************************
 * @file     main.c
 * $Date:    16/04/18
 * @brief    Bootloader-
             It downloads the updated bin file from the server and flashes it into the memory (APROM)
 * @note
 * Copyright (C) Yun Solutions LLP. All rights reserved.
*******************************************
*/

/* 
   For modifying the code for flash, changes must be done in
   This can be done in header file Flash1.h
   1. load_Image(address); and 2. FMC_SetVectorPageAddr(address);
*/

/* Include all header files- (Even if they are included in .c files) */
#include <stdio.h>			//for sprintf(); , sscanf();
#include "M051Series.h"     //for default registers
#include "QuectelMC60.h"	//for GSM Communication
#include <string.h>			//for strstr(); ,strcpy();
#include "lcd4bit.h"		//for 4 bit LCD display
#include "Flash1.h"

/* Define PLL Clock settings */
#define PLLCON_SETTING      CLK_PLLCON_50MHz_HXT
#define PLL_CLOCK           50000000

/* Defining Data Type */
typedef void (FUNC_PTR)(void);


/* Global variable Declaration */
char *FBUFF=0;					//pointer to the buffer
char checksum[210]={0};			//checksum for downloaded data
char rchecksum[210]={0};		//checksum for received data
signed int inc=0,inc1=0;		//increment variables
unsigned int bWDTFlag=0;

/* Function Definitions */

/* GPIO_init()- Initializes LCD pins */

void GPIO_init()
{
    /* LCD PINS- All are o/p*/
    GPIO_SetMode(P0, BIT7, GPIO_PMD_OUTPUT); //P07 D7= 32
    GPIO_SetMode(P0, BIT6, GPIO_PMD_OUTPUT); //P06 D6= 33
    GPIO_SetMode(P0, BIT5, GPIO_PMD_OUTPUT); //P05 D5= 34
    GPIO_SetMode(P0, BIT4, GPIO_PMD_OUTPUT); //P04 D4= 35
    GPIO_SetMode(P4, BIT1, GPIO_PMD_OUTPUT); // P41- EN = 36
    GPIO_SetMode(P4, BIT4, GPIO_PMD_OUTPUT); // P44- RS = 28
}

/* SYS_Init()- System Initialisation, congfigures system registers */

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
   CLK->PLLCON = CLK_PLLCON_50MHz_HXT;
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
	   2. Watchdog Timer (Avoids faulty system hung up)
    */
	
   CLK->APBCLK = CLK_APBCLK_TMR0_EN_Msk | CLK_APBCLK_WDT_EN_Msk;

   /* 
      Peripheral clock source 
      1. TIMER0- HIRC=22.1184 MHz
      2. WDT- LIRC=10 kHz
    */
   CLK->CLKSEL1 = CLK_CLKSEL1_TMR0_S_HIRC | CLK_CLKSEL1_WDT_S_LIRC;
    
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

/* load_Image()- Writes the image to the flash at specified flashing address */

void load_Image(unsigned int flash_addr)
{

	/* 
	
	Variable Declaration 
	
	iteration- loop variable
	FID- File Handle ID
	data- 32 bit data
	i,j,k,l- loop variables
	c2[50]- character array (string)
	
	*/
    unsigned int iteration=0,FID=0,data=0;
	unsigned int i=0,j=0,k=0,l=0;
	char c2[50]={0};
	
	/* FMC Functions */
	FMC_Open();
	FMC_EnableAPUpdate();
	
	iteration= M66FSIZE()/512; // Here, we use 512 as it is the page size, iterations must be either multiple or factor of 512
	FID=M66FOPEN();            // We get file handle ID for future use
	lcd("Flashing");		   // Displays "Flashing" on LCD
	
	/* 
	
	Flashing Logic 
	1. first for() loop is for erasing the memory
	2. Here we download data in chunks of 128 bytes
	   Hence, second for() loop is for downloading 128 bytes
	3. Now we write those downloaded 128 bytes to the flash/memory
	   Hence, third for() loop
	
	*/
	for(i=0,k=0;i<=iteration;i++,k=k+FMC_FLASH_PAGE_SIZE) // first for() loop 
	{
		unsigned int m=0,sum=0;
		FMC_Erase(flash_addr+k);						  // Erases 512 bytes
		for(l=0;l<4;l++,m=m+128)						  // second for() loop
		{
			sum=0;
			FBUFF=M66DWLD(FID);							  // Downloads 128 bytes
			for(j=0;j<128;j+=4)							  // third for() loop 
			{
				
				    /* Make 32 bit i.e 4 bytes data */
					data=FBUFF[j]|(FBUFF[j+1]<<8)|(FBUFF[j+2]<<16)|(FBUFF[j+3]<<24);
				    sum=sum+data;
					FMC_Write(flash_addr+k+j+m,data);	  // Write 4 bytes to the flash/memory
					data=0;
				
			}
			checksum[inc++]=sum;
		    flush(1);                                     // Clears buffer (128 bytes buffer)
	    }
	}
	checksum[inc]='\0';
	
	lcd4cmd(0x01);
	lcd4cmd(0x02);
	lcd("Flashing Done");                                // Displays "Flashing Done" on LCD
    
	unsigned int u32Data=0;
	
	/* Verify loader i.e check for error if any*/
    for(i=0,k=0;i<=iteration;i++,k=k+FMC_FLASH_PAGE_SIZE)
	{
		unsigned int m=0;
		for(l=0;l<4;l++,m=m+128)
		{
			unsigned int usum=0;
			for(j=0;j<128;j+=4)
			{
				u32Data=FMC_Read(flash_addr+k+j+m);
				usum=usum+u32Data;
				u32Data=0;
			}
			rchecksum[inc1++]=usum;
		}
	}
	rchecksum[inc1]='\0';

    unsigned int result,flag2=0;
	result=strcmp(checksum,rchecksum);
	if(result==0)
	{
		flag2=1;
		lcd4cmd(0x01);
	    lcd4cmd(0x02);
	    lcd("Flash Verified");
    
	}
	else
	{
		flag2=0;
		lcd4cmd(0x01);
	    lcd4cmd(0x02);
	    lcd("Flash Unverified");
	}
	
	
	FMC_DisableAPUpdate();
	FMC_Close();
	/* Close the opened file */
	sprintf(c2,"AT+QFCLOSE=%d\r",FID);
	TX_M66(c2,20000,"OK");
	
}

/* main function */
int main()
{

    /* 
	
	 Variable Declaration
     i- loop variable
     *ResetFunc- void pointer	
	
	*/
	unsigned int i=0;
	FUNC_PTR   *ResetFunc;
	
	
	/* Unlock protected registers (As we are using FMC and IAP) */
    SYS_UnlockReg();
	
    /* Init System, peripheral clock and multi-function I/O */
    SYS_Init();
	
	FMC_Open();
	
	/* Enable WDT time-out reset function and select time-out interval to 2^18 * WDT clock then start WDT counting */
	WDT_Open(WDT_TIMEOUT_2POW18, WDT_RESET_DELAY_1026CLK, TRUE, FALSE);
	/* Clear WDT Flag*/
	if(WDT_GET_RESET_FLAG() == 1)
    {
        WDT_CLEAR_RESET_FLAG();	
		bWDTFlag=FMC_Read(DATA_FLASH_BASE_ADDR);
		if(bWDTFlag==0x5000)
		{
			
			/* 
	        Change VECMAP for booting to APROM 
	        Very IMP- the flash address and the parameter i.e address passed to
	         FMC_SetVectorPageAddr(address); must be same
            User need to change it manually
	        */
        FMC_SetVectorPageAddr(0x5000);
		/* Reset All IP before boot to new AP */
        SYS->IPRSTC2 = 0xFFFFFFFF;
        SYS->IPRSTC2 = 0;
    
         /* Obtain Reset Handler address of new boot. */
         ResetFunc = (FUNC_PTR *)M32(4);  

         /* Set Main Stack Pointer register of new boot */ 
         __set_MSP(M32(0));
    
         /* Call reset handler of new boot */
         ResetFunc();       
		}
		
		
    }
    
	
	FMC_Erase(DATA_FLASH_BASE_ADDR);
	FMC_Write(DATA_FLASH_BASE_ADDR,0);
	
	/* Initialise UART0 */
    UART0_Init();
	WDT_RESET_COUNTER();
	
	/* Initialise GPIO pins for LCD */
    GPIO_init();  
	
	/* Initialise LCD in 4 bit mode */
    lcd4init();  
	WDT_RESET_COUNTER();
	
    lcd("Starting Upgrade"); // Displays "Starting Upgrade" on LCD
	/* Initialise GSM module i.e M66 */
	GSM_Init();
	
	/* Wait for 15 seconds- for URC (Unsolicited Result Codes) */
	for(i=0;i<15;i++)
	{
		TIMER_Delay(TIMER0,1000000); // Delay of 1 second
	}
	
	/* Initialise TCP connection */
	TCP_init();
	WDT_RESET_COUNTER();
	
	/* Initialse HTTP for file downloading */
	HTTP_Init();
	WDT_RESET_COUNTER();
	
	
	/* 
	Load Image file and flash it to the desired address- here 0x5000
	To change the address, user simply need to change the adress parameter 
	in function load_Image(adress);
	User need to change it manually
	
	*/
	load_Image(FLASH_ADDR);
	
	WDT_RESET_COUNTER();
	WDT_Close();
	
	
    lcd("Branching"); // Displays "Branching" on LCD
	FMC_Open();
    
    /* Mask all interrupt before changing VECMAP to avoid wrong interrupt handler fetched */
    //__set_PRIMASK(1); // This prevents (frustates) other interrupts like UART and GPIO, if used

    /* 
	Change VECMAP for booting to APROM 
	Very IMP- the flash address and the parameter i.e address passed to
	          FMC_SetVectorPageAddr(address); must be same
    User need to change it manually
	*/
    FMC_SetVectorPageAddr(FLASH_ADDR);
    char vec_map[8] = {0};
    sprintf(vec_map, "%08X", FMC_GetVECMAP());
	
    lcd(vec_map); // Displays the mapped address on LCD (Here 0x5000)
    delayMs(1000);
	
	
	/* 
	
	IAP- In Appliacation Programming 
	Basically it is software reset without using chip reset
	Multibooting provision using software reset
	
	*/
	
	/* Reset All IP before boot to new AP */
    SYS->IPRSTC2 = 0xFFFFFFFF;
    SYS->IPRSTC2 = 0;
    
    /* Obtain Reset Handler address of new boot. */
    ResetFunc = (FUNC_PTR *)M32(4);  

    /* Set Main Stack Pointer register of new boot */ 
    __set_MSP(M32(0));
    
    /* Call reset handler of new boot */
    ResetFunc();       

    while(1);
}
