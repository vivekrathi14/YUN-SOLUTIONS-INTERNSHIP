#include "M051Series.h"

#define RS P44
#define EN P41

void lcd4cmd(char x);
void lcd4data(char y);
void lcd4init(void);
void lcd(char *s);
void delayMs(uint32_t ms);
