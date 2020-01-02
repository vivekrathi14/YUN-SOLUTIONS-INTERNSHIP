#include "M051Series.h"
#include "keypad.h"
#include "lcd4bit.h"
#include "string.h"
#include "stdlib.h"

/* Variable Declaration */
static unsigned char key=0; // to read user pressed key
static unsigned int cursor=0; // cursor postion
static unsigned int pos=0; // position of string array, i.e keybuff
static unsigned int index=0; // dummy variable


/* Various function definitions */

/* Checks which key has been pressed, default return value is 0 */
char keypress()
{
	/*
	   As we use internall pullups, all columns are at high state.
	*/
	
	/*  r1 grounded */
	r1=0;r2=1;r3=1;r4=1;
	{
		if(c1==0)
		{
			while(c1==0);
			TIMER_Delay(TIMER0,10000); //10 ms (If there is debouncing issue, change delay to 50-100 ms)
			return('1');
		}
		else if (c2==0)
		{
			while(c2==0);
			TIMER_Delay(TIMER0,10000); //10 ms
			return('2');
		}
		else if(c3==0)
		{
			while(c3==0);
			TIMER_Delay(TIMER0,10000); //10 ms
			return('3');
		}
	}
	
	/* r2 grounded */
	r1=1;r2=0;r3=1;r4=1;
	{
		if(c1==0)
		{
			while(c1==0);
			TIMER_Delay(TIMER0,10000); //10 ms
			return('4');
		}
		else if (c2==0)
		{
			while(c2==0);
			TIMER_Delay(TIMER0,10000); //10 ms
			return('5');
		}
		else if(c3==0)
		{
			while(c3==0);
			TIMER_Delay(TIMER0,10000); //10 ms
			return('6');
		}
	}
	
	/* r3 grounded */
	r1=1;r2=1;r3=0;r4=1;
	{
		if(c1==0)
		{
			while(c1==0);
			TIMER_Delay(TIMER0,10000); //10 ms
			return('7');
		}
		else if (c2==0)
		{
			while(c2==0);
			TIMER_Delay(TIMER0,10000); //10 ms
			return('8');
		}
		else if(c3==0)
		{
			while(c3==0);
			TIMER_Delay(TIMER0,10000); //10 ms
			return('9');
		}
	}
	
	/* r4 grounded */
	r1=1;r2=1;r3=1;r4=0;
	{
		if(c1==0)
		{
			while(c1==0);
			TIMER_Delay(TIMER0,10000); //10 ms
			return('*');
		}
		else if (c2==0)
		{
			while(c2==0);
			TIMER_Delay(TIMER0,10000); //10 ms
			return('0');
		}
		else if(c3==0)
		{
			while(c3==0);
			TIMER_Delay(TIMER0,10000); //10 ms
			return('#');
		}
	}

	return 0;
	
}


/* Displays key pressed on LCD */
char KEYPAD(char *keybuff,char pflag)
{
     key=keypress(); // calls function keypress();
	 if(pflag)
	 {
		 pos=0;
		 index=0;
		 pflag=0;
		 cursor=0;
	 }
	 if(key)
	 {
	 index++;
	 if(index==1)
	 {
		 lcd4cmd(0x01);
		 //lcd4cmd(0x02);
		 lcd4cmd(0x80); // Jump to row no. 01
		 
		 
	 }
     }
     /* Cursor Logic */
     if(cursor==16)
     lcd4cmd(0xC0); // Jump to row no. 02
     else if (cursor==32)
     {
         lcd4cmd(0x01); // clear the display
         lcd4cmd(0x80); // Jump to row no. 01
         cursor=0; //clear the  cursor flag or variable
     }
     
     /* Key Logic */
     switch(key)
     {
            
          case '1': lcd4data('1'); // displays the data on LCD
                    keybuff[pos]='1'; // Starts filling the keybuff i.e buffer
                    pos++;	// increments buffer position counter
                    cursor++; //increments cursor position counter
		            return 0x01;
                    
         
          case '2': lcd4data('2'); 
                    keybuff[pos]='2';
                    pos++;
                    cursor++;
		            return 0x01;
                   
         
          case '3': lcd4data('3');
                    keybuff[pos]='3';
                    pos++;
                    cursor++;
		            return 0x01;
                 
         
          case '4': lcd4data('4');
                    keybuff[pos]='4';
                    pos++;
                    cursor++;
					return 0x01;
                    
                    
          case '5': lcd4data('5');
                    keybuff[pos]='5';
                    pos++;
                    cursor++;
					return 0x01;
                  
                    
          case '6': lcd4data('6');
                    keybuff[pos]='6';
                    pos++;
                    cursor++;
					return 0x01;
                    
                    
          case '7': lcd4data('7');
                    keybuff[pos]='7';
                    pos++;
                    cursor++;
					return 0x01;
                    
                    
          case '8': lcd4data('8');
                    keybuff[pos]='8';
                    pos++;
                    cursor++;
					return 0x01;
                  
                    
          case '9': lcd4data('9');
                    keybuff[pos]='9';
                    pos++;
                    cursor++;
					return 0x01;
                   
                    
          /* Case for deleting data i.e. analogous to backspace */			
          case '*': lcd4cmd(0x04);
                    pos--; 
                     // display nothing i.e. blank space, one shouldn't use it,but then logic fails, why?
                    
					lcd4data(' ');
					lcd4cmd(0x06);
					lcd4data(' ');
					lcd4cmd(0x04);
					lcd4data(' ');
					lcd4cmd(0x06);
                    cursor--;
					return 0x01;
                   
                    
          case '0': lcd4data('0');
                    keybuff[pos]='0';
                    pos++;
                    cursor++;
					return 0x01;
                    
          
          /* Case for sending data i.e. enter */
          case '#': if(pos)
					{
					P25=1; // make LED high for visual indication
                    keybuff[pos]='\0';  // end the buffer string
                    pos=0; // clear position variable
                    cursor=0;
					index=0;
                    return 0xFF;
					}
					else
					{
						return 0x01;
					}
					
     }	 
     return 0x00;
}
