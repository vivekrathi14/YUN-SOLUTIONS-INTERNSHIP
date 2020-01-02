#include "M051Series.h"
#include "lcd4bit.h"

static unsigned int cm=0,da=0;

void delayMs(uint32_t us)
{
    TIMER_Delay(TIMER0,1000*us);
}
static void enable(void)
{
	EN=1;
	delayMs(15); // 10 ms
	EN=0;
}

void lcd4cmd(char x)
{
	cm=x&0xF0; 
	P0->DOUT|= (BIT7 & cm); //P07
	P0->DOUT|= (BIT6 & cm); //P06
	P0->DOUT|= (BIT5 & cm); //P05
	P0->DOUT|= (BIT4 & cm); //P04
	RS=0;
	enable();
	P0->DOUT&= ~(BIT7); //P07
	P0->DOUT&= ~(BIT6); //P06
	P0->DOUT&= ~(BIT5); //P05
	P0->DOUT&= ~(BIT4); //P04
	cm=(x<<4)&0xF0;
	P0->DOUT|= (BIT7 & cm); //P07
	P0->DOUT|= (BIT6 & cm); //P06
	P0->DOUT|= (BIT5 & cm); //P05
	P0->DOUT|= (BIT4 & cm); //P04
    RS=0;
	enable();
	P0->DOUT&= ~(BIT7); //P07
	P0->DOUT&= ~(BIT6); //P06
	P0->DOUT&= ~(BIT5); //P05
	P0->DOUT&= ~(BIT4); //P04
}


void lcd4data(char y)
{
	da=y&0xF0;
	P0->DOUT|= (BIT7 & da); //P07
	P0->DOUT|= (BIT6 & da); //P06
	P0->DOUT|= (BIT5 & da); //P05
	P0->DOUT|= (BIT4 & da); //P04
	RS=1;
	enable();
	P0->DOUT&= ~(BIT7); //P07
	P0->DOUT&= ~(BIT6); //P06
	P0->DOUT&= ~(BIT5); //P05
	P0->DOUT&= ~(BIT4); //P04
	da=(y<<4)&0xF0;
	P0->DOUT|= (BIT7 & da); //P07
	P0->DOUT|= (BIT6 & da); //P06
	P0->DOUT|= (BIT5 & da); //P05
	P0->DOUT|= (BIT4 & da); //P04
	RS=1;
	enable();
	P0->DOUT&= ~(BIT7); //P07
	P0->DOUT&= ~(BIT6); //P06
	P0->DOUT&= ~(BIT5); //P05
	P0->DOUT&= ~(BIT4); //P04
}


void lcd4init(void)
{
    lcd4cmd(0x02);	// 2 lines, 4 bit LCD
	delayMs(10); //10 ms
	lcd4cmd(0x28);	// 2 lines, 4 bit LCD
	delayMs(10); //10 ms
	lcd4cmd(0x01); // clear the display
	delayMs(10); // 10 ms
	lcd4cmd(0x0E); // blink the cursor
	delayMs(10); // 10 ms
	lcd4cmd(0x80); // first row/ first column
	delayMs(10); // 10 ms
}


void lcd(char *s)
{
    unsigned int i=0;
    lcd4cmd(0x01);
	lcd4cmd(0x80);
    while(*s)
    {
        lcd4data(*s);
        //lcd4cmd(0x06);
        delayMs(20);
        s++;
        i++;
        if(i==16)        
	    break;
    }
    lcd4cmd(0xC0);
    delayMs(10); //20 ms
    while(*s)
    {
        lcd4data(*s);
        //lcd4cmd(0x06);
        delayMs(10);
        s++;
        i++;
        if(i==31)
        break;
    }
	lcd4cmd(0x80);
}
