/* Include Header Files */
#include "M051Series.h"

/* Define Macros */
/*
	r4= row 4
	r3= row 3
	r2= row 2
	r1= row 1
	c1= column 1
	c2= column 2
	c3= column 3

*/
#define r4 P16 //r4
#define r3 P42 //r3
#define r2 P13 //r2
#define r1 P11 //r1
#define c3 P43 //c3
#define c2 P34 //c2
#define c1 P32 //c1
char keypress();
char KEYPAD(char *keypad_data,char pflag);
