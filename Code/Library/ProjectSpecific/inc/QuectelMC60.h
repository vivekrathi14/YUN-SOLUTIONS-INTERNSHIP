/* Include header file */

#include "M051Series.h"


/* Macro definition */
#define RXBUFSIZE 300
#define BUFFSIZE 200


//extern char packet;
//extern char c[50]={0}; // Data Packet 2

/*---------------------------------------------------------------------------------------------------------*/
/* Function Definitions                                                                                    */
/*---------------------------------------------------------------------------------------------------------*/

/*UART Initialisation */
void UART0_Init();

/*Receive a character */
char UART_RXChar();

/*Transmit a character */
void UART_TXChar(char x);

/*Transmit a string */
void UART_TXString(char *y);

/* UART ISR */
void UART0_IRQHandler(void);

/* 
   FLUSH BUFFER 
   It only clears buffer i.e Recbuff data
*/

void flushbuff();

/*
	Flush Entire Buffer
    i.e clears entire buffer, eg. Recbuff- clears all 300 bytes
*/
void flush(unsigned int a);



/*---------------------------------------------------------------------------------------------------------*/
/* MC66 function to receive the data using UART (RX-M66->TX-C)                                            */
/*---------------------------------------------------------------------------------------------------------*/

/* Receive data form M66 */
void RX_M66(unsigned int delayRX,char *response);

/*---------------------------------------------------------------------------------------------------------*/
/* MC66 function to send the AT commands to MC60 and also receive the response using UART  (TX-C->RX-MC60) */
/*---------------------------------------------------------------------------------------------------------*/
void TX_M66(char *s,unsigned int delayTX, char *resp);

/* Check the network registartion and repeats untill network is registered */
void GSM_Network();

/* GSMTCP_Con()- TCP connection to the server */
void GSMTCP_Con();

/* GSMTCP_Send()- Send data to TCP server */
void GSMTCP_Send(char *cmd,char *msg);

/* GSM_Init()- Sends AT Command only, Initiaisation function */
void GSM_Init();


/* M66DWLD- DOWNLOADS file from server- It is done in the chunks,i.e multiples of page size */
char* M66DWLD(unsigned int FID);

/* M66FOPEN()- It opens the specified file and returns filehandle*/
unsigned int M66FOPEN();

/* M66FSIZE()- It gives the file size and returns file size */
unsigned int M66FSIZE();

/* Initialise commands or configuration for TCP */
void TCP_init();

/* HTTP_Init()- Initialisation for HTTP Server- change the filename i.e levin */
void HTTP_Init();

/* GSM_ID()- Gets IMEI no. and uses its last 4 digits as Device ID*/
char* GSM_ID();
/* GSM_Time()- Time Stamping */
char* GSM_Time();