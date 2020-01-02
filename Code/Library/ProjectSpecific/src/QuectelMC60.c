/* Include header files */
#include "M051Series.h"
#include "QuectelMC60.h"
#include "lcd4bit.h"
#include <string.h>
#include <stdio.h>

/* 
   For modifying the code for flash, changes must be done in
   1. M66FOPEN() and 2. HTTP_Init();
*/

/* Global Variable Declaration */
char Recbuff[RXBUFSIZE]={0};   // buffer for GSM Communication (string)
char BUFF[BUFFSIZE]={0};       // buffer for downloaded 128 bytes (string)
unsigned int size=0;           // size is used to point at buffer array location
unsigned char bytes[2]={0};    // To receive first two bytes of data (string)
char UTC[25]={0}; 			   // buffer for time stamping (string)
char ID[5]={0};                // buffer to get the Device ID (string)
char c1[50]={0};               // dummy string
unsigned int FHID=0;           // File Handle ID
char FH[8]={0};				   // buffer to get File Handle (string)
char FS[7]={0};                // buffer to get File Size (string)
unsigned int FSINT=0;          // File Size

/*---------------------------------------------------------------------------------------------------------*/
/* Function Definitions                                                                                    */
/*---------------------------------------------------------------------------------------------------------*/

/* 

UART0_Init()- UART Initialisation 
1. Resets the UART
2. Sets the baudrate
3. Enables Hardwae Flow Control
4. Enables UART Interrupt (ISR)

*/
void UART0_Init()
{
    /* Reset UART0 */
    SYS_ResetModule(UART0_RST);
    /* Configure UART0 and set UART0 Baudrate= 115200 */
    UART_Open(UART0, 115200);
	
	/* (HARDWARE FLOW CONTROL) */
	/* Enable RTS and CTS autoflow control */
    UART_EnableFlowCtrl(UART0);
	/* Enable Interrupt call back function i.e. ISR*/
	NVIC_EnableIRQ(UART0_IRQn);
}

/* 

UART_RXChar()- Receive a character 
1. Reads the character or byte or data from UART FIFO buffer
   using RBR register

*/
char UART_RXChar()
{
	    while(UART_GET_RX_EMPTY(UART0)==0)
		/* Get the character from UART Buffer */
        return UART_READ(UART0);
}

/* 

UART_TXChar()- Transmits a character 
1. Trasmits the character or byte from UART from UART FIFO buffer
   using THR register

*/
void UART_TXChar(char x)
{
	      while(UART_IS_TX_FULL(UART0));  /* Wait TX is not full to transmit data */ 
          UART_WRITE(UART0,x);
}

/* 

UART_TXString()- Transmits a string 
1. Transmits a chunk or group of characters or bytes

*/
void UART_TXString(char *y)
{
	while(*y)
	{
	UART_TXChar(*y);
	y++;
	}
}

/* 

UART0_IRQHandler()- UART ISR 
1. Reads UART ISR flag status i.e RDA flag status
2. Receives data in the buffer i.e. Recbuff

*/
void UART0_IRQHandler(void)
{
        /* A flag variable- UARTIntSts */
	    unsigned int UARTIntSts = UART0->ISR;
		char c;
	    
	   /* If data reception interrupt has been set, then only fill the buffer */
	    if(UARTIntSts & UART_ISR_RDA_INT_Msk) 
	    {
			c= UART_RXChar();
			/* Check if buffer register is full or not (300 bytes) */
			if(size<RXBUFSIZE)
			{
				Recbuff[size]=c;
				size++;
			}
	    }
		
}

/* 
   flushbuff()-FLUSH BUFFER 
   It only clears buffer i.e Recbuff data
*/

void flushbuff()
{
	unsigned int i=0,l1=0;
	
	l1=strlen(Recbuff);
	if(l1==0);
	else
	{
		for(i=0;i<=l1-1;i++)
		{
			Recbuff[i]=0;
		}
    }
}

/*
	flush()-Flush Entire Buffer
    i.e clears entire buffer, eg. Recbuff- clears all 300 bytes
*/
void flush(unsigned int a)
{
	unsigned int i=0;
	if(a==0)
	{
	for(i=0;i<RXBUFSIZE;i++)
	{
		Recbuff[i]=0;
	}
}
	else if(a==1)
	{
		for(i=0;i<512;i++)
		BUFF[i]=0;
	}
}



/*---------------------------------------------------------------------------------------------------------*/
/* MC66 function to receive the data using UART (RX-M66->TX-C)                                            */
/*---------------------------------------------------------------------------------------------------------*/


/* RX_M66()- Receive data form M66 */
void RX_M66(unsigned int delayRX,char *response)
{
			unsigned int i=0,timeout=0;
	        size=0; // clears size variable
	        flushbuff(); // clears Recbuff
	
			/* Wait untill you receive first 2 bytes */
	        /* It is just an indicator that Data is being received to the controller from the TX of M66 module  */
	
	        /* The function UART_Read() is being changed, where after timeout it returns 2 rather than FALSE */
	        while(!(UART_Read(UART0,bytes,2)==2));	// waits untill 2 bytes or characters are received
			
	        /* Put those 2 bytes into the received data buffer */
			while(size<2)
			{
				Recbuff[size]=bytes[size];
				size++;
			}
			
			/* Enable the Receiver Interrupt */
			UART_ENABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));
		
			/* wait for the speculated response with timeout of 5 seconds */
			while(!strstr(Recbuff,response))
			{
				timeout++;
			    CLK_SysTickDelay(1);
                if(timeout >= 5000000)
                break;
			}
			
			/* Give a delay of 10-50 ms to receive the junk of data */
			TIMER_Delay(TIMER0,delayRX);
			
			/* Disable the Receiver Interrupt */
			UART_DISABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));
			/* End the receiver buffer string */
			
			/* 
			   In case there is still data available,
			   read it in the buffer- i.e Recbuff
			*/
			
			while(UART_GET_RX_EMPTY(UART0) == 0)
			{
				Recbuff[size++] = UART_READ(UART0);
			}
			Recbuff[size]='\0';
			/* make size=0 i.e. to clear the buffer (clears it by overwriting to buffer array) */
			size=0; 
			
}


/*---------------------------------------------------------------------------------------------------------*/
/* MC66 function to send the AT commands to MC60 and also receive the response using UART  (TX-C->RX-MC60) */
/*---------------------------------------------------------------------------------------------------------*/

/* TX_M66()- Transmits the data to M66 */
void TX_M66(char *s,unsigned int delayTX, char *resp)
{
			
	        /*
				1. Transmit String/ Command
	            2. Flush the buffer
	            3. Receive data in Recbuff
	        */
		    UART_TXString(s);
	        RX_M66(delayTX,resp);
	
	        
}

/* GSM_Network()- Check the network registartion and repeats untill network is registered */
void GSM_Network()
{
	  unsigned int i=0;
	  flushbuff();
	  size=0;
	  while(!((strstr(Recbuff,"0,1")) || (strstr(Recbuff,"0,5"))))	
	  {
			flushbuff();
		    UART_TXString("AT+CREG?\r");
			while(!((UART_Read(UART0,bytes,2)==2)));
			while(size<2)
			{
				Recbuff[size]=bytes[size];
				size++;
			}
			UART_ENABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));
			TIMER_Delay(TIMER0,30000); // 30 ms
			UART_DISABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));
			while(UART_GET_RX_EMPTY(UART0) == 0)
			{
					Recbuff[size++] = UART_READ(UART0);
			}
			Recbuff[size]='\0';
			size=0;
	  }
}

/* TCP State */
//void TCP_State()
//{
//	      
//		  TX_M66("AT+QISTAT\r",50000);
//	      
//}


/* GSMTCP_Con()- TCP connection to the server */
void GSMTCP_Con()
{
	TX_M66("AT+QIOPEN=\"TCP\",\"130.211.246.202\",\"12339\"\r",20000,"CONNECT");
	if(strstr(Recbuff,"CONNECT FAIL"))
	{
		TX_M66("AT+QICLOSE\r",20000,"CLOSE OK");
		GSMTCP_Con();
	}
}
/* GSMTCP_Send()- Send data to TCP server */
void GSMTCP_Send(char *cmd,char *msg)
{
	 unsigned int i=0;
	 flushbuff();
	 size=0;
	 UART_TXString(cmd);
	
     while(!((UART_Read(UART0,bytes,2)==2)));
     while(size<2)
     {
				Recbuff[size]=bytes[size];
				size++;
	 }
	 UART_ENABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));
	 TIMER_Delay(TIMER0,20000); // 20 ms for '>'
	 
	 UART_TXString(msg);
	 
	 UART_TXChar(0x1A);
	 while(!((strstr(Recbuff,"SEND OK"))||(strstr(Recbuff,"ERROR"))||(strstr(Recbuff,"SEND FAIL"))));
	 TIMER_Delay(TIMER0,10000); // *prior was 10 ms, sometimes SEND OK not sent, hence 20 ms
	 
     
	 UART_DISABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));
	 while(UART_GET_RX_EMPTY(UART0) == 0)
	 {
		Recbuff[size++] = UART_READ(UART0);
	 }
     Recbuff[size]='\0';
	 if(strstr(Recbuff,"ERROR"))
	 {
		 P22=1;
		 UART_TXChar(0x1B);
		 GSM_Network();
		 GSMTCP_Con();
		 GSMTCP_Send("AT+QISEND\r",msg);
	 }
	 size=0;
}

/* GSM_Init()- Sends AT Command only, Initiaisation function */
void GSM_Init()
{
	flushbuff();
	UART_TXChar(0x1B);
	UART_TXString("AT\r");
	flushbuff();
	while(!((UART_Read(UART0,bytes,2)==2)));	
    while(size<2)
	{
		Recbuff[size]=bytes[size];
		size++;
	}
	/* Enable the Receiver Interrupt */
	UART_ENABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));
	TIMER_Delay(TIMER0,30000);
	/* Disable the Receiver Interrupt */
	UART_DISABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));
	while(UART_GET_RX_EMPTY(UART0) == 0)
	{
		Recbuff[size++] = UART_READ(UART0);
	}
    Recbuff[size]='\0';
	size=0;
}

/* GSM_ID()- Gets IMEI no. and uses its last 4 digits as Device ID */
char * GSM_ID()
{
	unsigned int i=0,j=0,d=0,l=0;
	char *p;
	char IMEI[20]={0};
	unsigned int IDInt=0;
	size=0;
	TX_M66("AT+QGSN\r",20000,"OK");
	p=strstr(Recbuff,"+QGSN:");
	for(;*p!='\0' && d<3;p++)
	{
		if(*p=='\"')
		{
			d++;
			if(d==2)
			{
				IMEI[j-1]='\0';
			}
		}
		if(d==1)
		{
			IMEI[j]=*(p+1);
			j++;
		}
		
	}
	l=strlen(IMEI);
	l=l-4;
	
	for(i=0;i<4;i++,l++)
	{
	ID[i]=IMEI[l];
	}
	ID[i]='\0';
	//sscanf(ID,"%d",&IDInt);
	return ID;
}
/* GSM_Time()- Time Stamping */
char* GSM_Time()
{
	unsigned int i=0,j=0,d=0;
	char *p;
	TX_M66("AT+CCLK?\r",20000,"OK");
	p=strstr(Recbuff,"+CCLK:");
	for(;*p!='\0' && d<3;p++)
	{
		if(*p=='\"')
		{
			d++;
			if(d==2)
			{
				UTC[j-1]='\0';
			}
		}
		if(d==1)
		{
			UTC[j]=*(p+1);
			j++;
		}
		
	}
	return UTC;
}

/***********************************************************************************************************************************
 M66 File Hnadling i.e. Downloading, Reading , Opening, Closing
***********************************************************************************************************************************/

/* M66DWLD- DOWNLOADS file from server- It is done in the chunks,i.e multiples of page size */
char* M66DWLD(unsigned int FID)
{
	unsigned int i=0,j=0;
	char *ptr;
	size=0;
	sprintf(c1,"AT+QFREAD=%d,128\r",FID);
	UART_TXString(c1);
	memset(c1,0,strlen(c1));
	flush(0); // clears entire Recbuff
    while(!((UART_Read(UART0,bytes,2)==2)));
    while(size<2)
    {
			Recbuff[size]=bytes[size];
			size++;
	}

	UART_ENABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));
	
	TIMER_Delay(TIMER0,100000); // 100 ms, OK received
	
	UART_DISABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));

	while(UART_GET_RX_EMPTY(UART0)==0)
	{
		Recbuff[size++]=UART_READ(UART0);
	}
	Recbuff[size]='\0';
	size=0; 
	ptr=strstr(Recbuff,"CONNECT");
	while(!ptr)
	{
	sprintf(c1,"AT+QFREAD=%d,128\r",FHID);
	UART_TXString(c1);
	memset(c1,0,strlen(c1));
	flush(0);
    while(!((UART_Read(UART0,bytes,2)==2)));
    while(size<2)
    {
			Recbuff[size]=bytes[size];
			size++;
	}
	UART_ENABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));
	
	TIMER_Delay(TIMER0,100000); // 100 ms, OK received
	
	UART_DISABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));

	while(UART_GET_RX_EMPTY(UART0)==0)
	{
		Recbuff[size++]=UART_READ(UART0);
	}
	Recbuff[size]='\0';
	size=0; 
	ptr=strstr(Recbuff,"CONNECT");
	}
	
	ptr=ptr+13;
	for(j=0;j<128;j++)
	{
		BUFF[j]=*ptr;
		ptr++;
	}
	
	return BUFF;
}

/* 

M66FOPEN()- It opens the specified file and returns filehandle
Very Imp- User need to change the "main.bin" with their bin file for intended
          application

*/
unsigned int M66FOPEN()
{
	unsigned int i=0,j=0;
	char *p;
	size=0;
	TX_M66("AT+QFOPEN=\"main.bin\"\r",20000,"OK");   // Need to change for other application
	p=strstr(Recbuff," ");
	p++;
	for(i=0;i<8;i++)
	{
		FH[i]=*p;
		p++;
	}
	FH[i]='\0';
	sscanf(FH,"%d",&FHID);
	return FHID;
}

/* M66FSIZE()- It gives the file size and returns file size */
unsigned int M66FSIZE()
{
	unsigned int i=0,j=0;
	char *p;
	size=0;
	TX_M66("AT+QFLDS\r",20000,"OK");
	p=strstr(Recbuff," ");
	p++;
	for(i=0;*p!=',';i++)
	{
		FS[i]=*p;
		p++;
	}
	FS[i]='\0';
	sscanf(FS,"%d",&FSINT);
	
	return FSINT;
	
	
	
}

/* Initialise commands or configuration for TCP */
void TCP_init()
{
	TX_M66("AT\r",20000,"OK");	//Sends AT command to GSM
    GSM_Network();	//Checks Data Connectivity i.e regsitered to network
	lcd("Network Found");
    TX_M66("AT+QIFGCNT=0\r",20000,"OK");	//Sets Context 0 as foreground text
	TX_M66("AT+QICSGP=1,\"IOT.COM\"\r",20000,"OK");	//Sets APN for current Network
	GSMTCP_Con();	// Connects to TCP Server
	lcd4cmd(0x01);
	lcd4cmd(0x02);
	lcd("Server Connected");
}

/* HTTP_Init()- Initialisation for HTTP Server- change the filename i.e main.bin */
void HTTP_Init()
{
	//TX_M66("AT+QFLST=\"*\"\r",20000,"OK");
	
	/* Delete the files in storage i.e UFS */
	TX_M66("AT+QFDEL=\"*\"\r",20000, "OK");
	
	/* Set URL for HTTP Server */
	/* Need to change this depending on application */
	TX_M66("AT+QHTTPURL=31\r",20000,"CONNECT");
	TX_M66("http://130.211.246.202/main.bin\r",20000,"OK");
	
	/* Sends GET request to HTTP Server */
	TX_M66("AT+QHTTPGET=60\r",20000,"OK");
	
	/* Downloads the specified file */
	TX_M66("AT+QHTTPDL=\"main.bin\"\r",20000,"+QHTTPDL:"); // Need to change this depending on the application
	lcd4cmd(0x01);
	lcd4cmd(0x02);
	lcd("Downloading Done");
}

