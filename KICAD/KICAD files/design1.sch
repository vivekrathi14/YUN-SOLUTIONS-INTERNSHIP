EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:design1-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Conn_01x02 J3
U 1 1 5A7C0CD1
P 900 3500
F 0 "J3" H 900 3600 50  0000 C CNN
F 1 "GND" H 900 3300 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch2.54mm" H 900 3500 50  0001 C CNN
F 3 "" H 900 3500 50  0001 C CNN
	1    900  3500
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 J2
U 1 1 5A7C0D2E
P 3400 3400
F 0 "J2" H 3400 3500 50  0000 C CNN
F 1 "VDD/VCC" H 3400 3200 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch2.54mm" H 3400 3400 50  0001 C CNN
F 3 "" H 3400 3400 50  0001 C CNN
	1    3400 3400
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x07 J4
U 1 1 5A7C0D62
P 1900 4400
F 0 "J4" H 1900 4800 50  0000 C CNN
F 1 "KEYPAD-BRKOUT" H 1800 3950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07_Pitch2.54mm" H 1900 4400 50  0001 C CNN
F 3 "" H 1900 4400 50  0001 C CNN
	1    1900 4400
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x16 J11
U 1 1 5A7C0DF1
P 5050 1500
F 0 "J11" H 5050 2300 50  0000 C CNN
F 1 "LCD-BRKOUT-1" H 4850 550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16_Pitch2.54mm" H 5050 1500 50  0001 C CNN
F 3 "" H 5050 1500 50  0001 C CNN
	1    5050 1500
	1    0    0    -1  
$EndComp
Text Label 2350 1950 0    60   ~ 0
12
Text Label 2350 2050 0    60   ~ 0
10
Text Label 2350 2150 0    60   ~ 0
8
Text Label 2350 2250 0    60   ~ 0
6
Text Label 2350 2350 0    60   ~ 0
4
Text Label 2350 2450 0    60   ~ 0
2
Text Label 2350 2550 0    60   ~ 0
48
Text Label 2350 2650 0    60   ~ 0
46
Text Label 2350 2750 0    60   ~ 0
44
Text Label 2350 2850 0    60   ~ 0
42
Text Label 2350 2950 0    60   ~ 0
40
Text Label 2350 3050 0    60   ~ 0
38
Text Label 3150 1950 2    60   ~ 0
11
Text Label 3050 2050 2    60   ~ 0
9
Text Label 3150 2150 2    60   ~ 0
7
Text Label 3150 2250 2    60   ~ 0
5
Text Label 3150 2350 2    60   ~ 0
3
Text Label 3150 2450 2    60   ~ 0
1
Text Label 3150 2550 2    60   ~ 0
47
Text Label 3150 2650 2    60   ~ 0
45
Text Label 3150 2750 2    60   ~ 0
43
Text Label 3150 2850 2    60   ~ 0
41
Text Label 3150 2950 2    60   ~ 0
39
Text Label 3150 3050 2    60   ~ 0
37
$Comp
L VCC #PWR01
U 1 1 5A7C1302
P 1050 850
F 0 "#PWR01" H 1050 700 50  0001 C CNN
F 1 "VCC" H 1050 1000 50  0000 C CNN
F 2 "" H 1050 850 50  0001 C CNN
F 3 "" H 1050 850 50  0001 C CNN
	1    1050 850 
	1    0    0    -1  
$EndComp
Text Label 1050 1050 1    60   ~ 0
VCC
$Comp
L GND #PWR02
U 1 1 5A7C1388
P 700 900
F 0 "#PWR02" H 700 650 50  0001 C CNN
F 1 "GND" H 700 750 50  0000 C CNN
F 2 "" H 700 900 50  0001 C CNN
F 3 "" H 700 900 50  0001 C CNN
	1    700  900 
	1    0    0    -1  
$EndComp
Text Label 700  700  3    60   ~ 0
GND
Text Label 3050 3400 0    60   ~ 0
VCC
Text Label 550  3500 0    60   ~ 0
GND
Text Label 1500 4100 0    60   ~ 0
C1
Text Label 1500 4200 0    60   ~ 0
C2
Text Label 1500 4300 0    60   ~ 0
C3
Text Label 1500 4400 0    60   ~ 0
R1
Text Label 1500 4500 0    60   ~ 0
R2
Text Label 1500 4600 0    60   ~ 0
R3
Text Label 1500 4700 0    60   ~ 0
R4
Text Label 4850 800  2    60   ~ 0
VSS
Text Label 4850 1000 2    60   ~ 0
VEE
Text Label 4850 1100 2    60   ~ 0
RS
Text Label 4850 1200 2    60   ~ 0
RW
Text Label 4850 1300 2    60   ~ 0
E
Text Label 4850 1400 2    60   ~ 0
D0
Text Label 4850 1500 2    60   ~ 0
D1
Text Label 4850 1600 2    60   ~ 0
D2
Text Label 4850 1700 2    60   ~ 0
D3
Text Label 4850 1800 2    60   ~ 0
D4
Text Label 4850 1900 2    60   ~ 0
D5
Text Label 4850 2000 2    60   ~ 0
D6
Text Label 4850 2100 2    60   ~ 0
D7
Text Label 4850 2200 2    60   ~ 0
L+
Text Label 4850 2300 2    60   ~ 0
L-
Text Label 4600 2200 2    60   ~ 0
VCC
Text Label 4600 900  2    60   ~ 0
VCC
$Comp
L R R1
U 1 1 5A7C2E37
P 700 4450
F 0 "R1" V 780 4450 50  0000 C CNN
F 1 "1k" V 700 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 630 4450 50  0001 C CNN
F 3 "" H 700 4450 50  0001 C CNN
	1    700  4450
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5A7C2E99
P 950 4450
F 0 "R2" V 1030 4450 50  0000 C CNN
F 1 "1k" V 950 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 880 4450 50  0001 C CNN
F 3 "" H 950 4450 50  0001 C CNN
	1    950  4450
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A7C2EC7
P 1250 4450
F 0 "R3" V 1330 4450 50  0000 C CNN
F 1 "1k" V 1250 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 1180 4450 50  0001 C CNN
F 3 "" H 1250 4450 50  0001 C CNN
	1    1250 4450
	1    0    0    -1  
$EndComp
Text Label 700  4700 1    60   ~ 0
C1
Text Label 950  4700 1    60   ~ 0
C2
Text Label 1250 4700 1    60   ~ 0
C3
Text Label 950  4100 0    60   ~ 0
VCC
$Comp
L Conn_01x04 J7
U 1 1 5A7C321B
P 2850 4100
F 0 "J7" H 2850 4300 50  0000 C CNN
F 1 "ULTRA1" H 2850 3800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 2850 4100 50  0001 C CNN
F 3 "" H 2850 4100 50  0001 C CNN
	1    2850 4100
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04 J9
U 1 1 5A7C3280
P 3500 4250
F 0 "J9" H 3500 4450 50  0000 C CNN
F 1 "ULTRA2" H 3500 3950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 3500 4250 50  0001 C CNN
F 3 "" H 3500 4250 50  0001 C CNN
	1    3500 4250
	1    0    0    -1  
$EndComp
Text Label 550  1950 0    60   ~ 0
13
Text Label 550  2050 0    60   ~ 0
15
Text Label 550  2150 0    60   ~ 0
17
Text Label 550  2250 0    60   ~ 0
19
Text Label 550  2350 0    60   ~ 0
21
Text Label 550  2450 0    60   ~ 0
23
Text Label 550  2550 0    60   ~ 0
25
Text Label 550  2650 0    60   ~ 0
27
Text Label 550  2750 0    60   ~ 0
29
Text Label 550  2850 0    60   ~ 0
31
Text Label 550  2950 0    60   ~ 0
33
Text Label 550  3050 0    60   ~ 0
35
Text Label 1500 3050 2    60   ~ 0
36
Text Label 1500 2950 2    60   ~ 0
34
Text Label 1500 2850 2    60   ~ 0
32
Text Label 1500 2750 2    60   ~ 0
30
Text Label 1500 2650 2    60   ~ 0
28
Text Label 1500 2550 2    60   ~ 0
26
Text Label 1500 2450 2    60   ~ 0
24
Text Label 1500 2350 2    60   ~ 0
22
Text Label 1500 2250 2    60   ~ 0
20
Text Label 1500 2150 2    60   ~ 0
18
Text Label 1500 2050 2    60   ~ 0
16
Text Label 1500 1950 2    60   ~ 0
14
Text Label 2400 4000 0    60   ~ 0
VCC
Text Label 2400 4100 0    60   ~ 0
TRIG1
Text Label 2400 4200 0    60   ~ 0
ECHO1
Text Label 2400 4300 0    60   ~ 0
GND
Text Label 3050 4150 0    60   ~ 0
VCC
Text Label 3050 4250 0    60   ~ 0
TRIG2
Text Label 3050 4350 0    60   ~ 0
ECHO2
Text Label 3050 4450 0    60   ~ 0
GND
Wire Wire Line
	2500 1950 2350 1950
Wire Wire Line
	2500 2050 2350 2050
Wire Wire Line
	2500 2150 2350 2150
Wire Wire Line
	2500 2250 2350 2250
Wire Wire Line
	2500 2350 2350 2350
Wire Wire Line
	2000 2450 2500 2450
Wire Wire Line
	2500 2550 2350 2550
Wire Wire Line
	2000 2650 2500 2650
Wire Wire Line
	2000 2750 2500 2750
Wire Wire Line
	2500 2850 2350 2850
Wire Wire Line
	2000 2950 2500 2950
Wire Wire Line
	2000 3050 2500 3050
Wire Wire Line
	3000 1950 3150 1950
Wire Wire Line
	3000 2050 3400 2050
Wire Wire Line
	3000 2150 3400 2150
Wire Wire Line
	3000 2250 3400 2250
Wire Wire Line
	3000 2350 3450 2350
Wire Wire Line
	3000 2550 3450 2550
Wire Wire Line
	3000 2650 3450 2650
Wire Wire Line
	3000 2750 3450 2750
Wire Wire Line
	3000 2850 3150 2850
Wire Wire Line
	3000 2950 3450 2950
Wire Wire Line
	3000 3050 3450 3050
Wire Wire Line
	3200 3400 3050 3400
Wire Wire Line
	1050 850  1050 1050
Wire Wire Line
	700  900  700  700 
Wire Wire Line
	3200 3500 3200 3400
Wire Wire Line
	700  3600 700  3500
Wire Wire Line
	700  3500 550  3500
Wire Wire Line
	1700 4100 1500 4100
Wire Wire Line
	1700 4200 1500 4200
Wire Wire Line
	1700 4300 1500 4300
Wire Wire Line
	1700 4400 1500 4400
Wire Wire Line
	1700 4500 1500 4500
Wire Wire Line
	1700 4600 1500 4600
Wire Wire Line
	1700 4700 1500 4700
Wire Wire Line
	4350 800  4850 800 
Wire Wire Line
	4850 900  4600 900 
Wire Wire Line
	4350 1000 4850 1000
Wire Wire Line
	4850 1100 4600 1100
Wire Wire Line
	4350 1200 4850 1200
Wire Wire Line
	4850 1300 4600 1300
Wire Wire Line
	4850 1400 4600 1400
Wire Wire Line
	4850 1500 4600 1500
Wire Wire Line
	4850 1600 4600 1600
Wire Wire Line
	4850 1700 4600 1700
Wire Wire Line
	4850 1800 4600 1800
Wire Wire Line
	4850 1900 4600 1900
Wire Wire Line
	4850 2000 4600 2000
Wire Wire Line
	4850 2100 4600 2100
Wire Wire Line
	4850 2200 4600 2200
Wire Wire Line
	4350 2300 4850 2300
Wire Wire Line
	4350 550  4350 2300
Connection ~ 4350 1200
Connection ~ 4350 1000
Connection ~ 4350 800 
Wire Wire Line
	700  4300 700  4200
Wire Wire Line
	700  4200 1250 4200
Wire Wire Line
	1250 4200 1250 4300
Wire Wire Line
	950  4100 950  4300
Connection ~ 950  4200
Wire Wire Line
	700  4600 700  4700
Wire Wire Line
	950  4600 950  4700
Wire Wire Line
	1250 4600 1250 4700
Wire Wire Line
	750  1950 550  1950
Wire Wire Line
	750  2050 550  2050
Wire Wire Line
	750  2150 550  2150
Wire Wire Line
	750  2250 550  2250
Wire Wire Line
	750  2350 550  2350
Wire Wire Line
	750  2450 550  2450
Wire Wire Line
	750  2550 550  2550
Wire Wire Line
	750  2650 550  2650
Wire Wire Line
	750  2750 550  2750
Wire Wire Line
	750  2850 550  2850
Wire Wire Line
	750  2950 550  2950
Wire Wire Line
	750  3050 550  3050
Wire Wire Line
	1250 1950 1500 1950
Wire Wire Line
	1250 2050 1500 2050
Wire Wire Line
	1250 2150 1500 2150
Wire Wire Line
	1250 2350 1750 2350
Wire Wire Line
	1250 2450 1750 2450
Wire Wire Line
	1250 2550 1750 2550
Wire Wire Line
	1250 2650 1750 2650
Wire Wire Line
	1250 2850 1750 2850
Wire Wire Line
	1250 2950 1500 2950
Wire Wire Line
	1250 3050 1500 3050
Wire Wire Line
	2650 4000 2400 4000
Wire Wire Line
	2650 4100 2400 4100
Wire Wire Line
	2650 4200 2400 4200
Wire Wire Line
	2650 4300 2400 4300
Wire Wire Line
	3300 4150 3050 4150
Wire Wire Line
	3300 4250 3050 4250
Wire Wire Line
	3300 4350 3050 4350
Wire Wire Line
	3300 4450 3050 4450
Text Label 3450 2450 2    60   ~ 0
TRIG1
Wire Wire Line
	3000 2450 3450 2450
Text Label 3450 2550 2    60   ~ 0
C3
Text Label 3450 2650 2    60   ~ 0
R3
Text Label 3450 2750 2    60   ~ 0
R1
Text Label 3450 2950 2    60   ~ 0
C1
Text Label 2000 2950 0    60   ~ 0
C2
Text Label 2000 2750 0    60   ~ 0
R2
Text Label 2000 2650 0    60   ~ 0
R4
Text Label 2000 2450 0    60   ~ 0
ECHO1
Text Label 3450 2350 2    60   ~ 0
TRIG2
Text Label 3400 2050 2    60   ~ 0
ECHO2
Text Label 1750 2250 2    60   ~ 0
RS
Wire Wire Line
	1250 2250 1750 2250
Text Label 1750 2350 2    60   ~ 0
E
Text Label 1750 2450 2    60   ~ 0
D4
Text Label 1750 2550 2    60   ~ 0
D5
Text Label 1750 2650 2    60   ~ 0
D6
Wire Wire Line
	1250 2750 1500 2750
Text Label 1750 2850 2    60   ~ 0
D7
NoConn ~ 550  1950
NoConn ~ 550  2050
NoConn ~ 550  2150
NoConn ~ 550  2250
NoConn ~ 550  2350
NoConn ~ 550  2450
NoConn ~ 550  2550
NoConn ~ 550  2650
NoConn ~ 550  2750
NoConn ~ 550  2850
NoConn ~ 550  2950
NoConn ~ 550  3050
NoConn ~ 1500 1950
NoConn ~ 1500 2050
NoConn ~ 1500 2150
NoConn ~ 1500 2750
NoConn ~ 1500 2950
NoConn ~ 1500 3050
Text Label 3400 2150 2    60   ~ 0
TX0
Text Label 3400 2250 2    60   ~ 0
RX0
NoConn ~ 2350 1950
NoConn ~ 2350 2050
NoConn ~ 2350 2150
NoConn ~ 2350 2250
NoConn ~ 2350 2350
NoConn ~ 2350 2550
NoConn ~ 2350 2850
NoConn ~ 3150 1950
NoConn ~ 3400 2150
NoConn ~ 3400 2250
NoConn ~ 3150 2850
Text Label 3450 3050 2    60   ~ 0
RTS0
NoConn ~ 3450 3050
Text Label 2000 3050 0    60   ~ 0
CTSO
NoConn ~ 2000 3050
$Comp
L Conn_01x04 J5
U 1 1 5A7C6F8B
P 2000 800
F 0 "J5" H 2000 1000 50  0000 C CNN
F 1 "VCC-BRKOUT" H 2000 500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 2000 800 50  0001 C CNN
F 3 "" H 2000 800 50  0001 C CNN
	1    2000 800 
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04 J8
U 1 1 5A7C6FC9
P 2850 800
F 0 "J8" H 2850 1000 50  0000 C CNN
F 1 "GND-BRKOUT" H 2850 500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 2850 800 50  0001 C CNN
F 3 "" H 2850 800 50  0001 C CNN
	1    2850 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1000 1800 600 
Text Label 1800 600  0    60   ~ 0
VCC
Connection ~ 1800 700 
Connection ~ 1800 800 
Connection ~ 1800 900 
Wire Wire Line
	2650 1000 2650 600 
Text Label 2650 600  0    60   ~ 0
GND
Connection ~ 2650 700 
Connection ~ 2650 800 
Connection ~ 2650 900 
$Comp
L PWR_FLAG #FLG03
U 1 1 5A7C72D0
P 800 750
F 0 "#FLG03" H 800 825 50  0001 C CNN
F 1 "PWR_FLAG" H 800 900 50  0000 C CNN
F 2 "" H 800 750 50  0001 C CNN
F 3 "" H 800 750 50  0001 C CNN
	1    800  750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  750  800  800 
Wire Wire Line
	800  800  700  800 
Connection ~ 700  800 
$Comp
L PWR_FLAG #FLG04
U 1 1 5A7C7387
P 1150 950
F 0 "#FLG04" H 1150 1025 50  0001 C CNN
F 1 "PWR_FLAG" H 1150 1100 50  0000 C CNN
F 2 "" H 1150 950 50  0001 C CNN
F 3 "" H 1150 950 50  0001 C CNN
	1    1150 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	1150 950  1050 950 
Connection ~ 1050 950 
NoConn ~ 4600 1400
NoConn ~ 4600 1500
NoConn ~ 4600 1600
NoConn ~ 4600 1700
Wire Notes Line
	500  1700 3700 1700
Text Notes 1300 1650 0    60   ~ 0
POWER AND POWER BREAKOUTS\n5 V DC- 1.5/2 A DC
Wire Notes Line
	3700 500  3700 5000
Wire Notes Line
	3700 3800 500  3800
Text Notes 1300 3600 0    60   ~ 0
NUVOTON M0516LDN BREAKOUT\n
Wire Notes Line
	2300 3800 2300 5300
Wire Notes Line
	2300 5300 500  5300
Text Notes 950  5200 0    60   ~ 0
KEYPAD BREAKOUT\n
Wire Notes Line
	3700 5000 2300 5000
Text Notes 2550 4850 0    60   ~ 0
ULTRASONIC SENSOR \n       BREAKOUT\n
Wire Notes Line
	5850 500  5850 2950
Wire Notes Line
	5850 2950 3700 2950
Text Notes 4350 2750 0    60   ~ 0
4BIT LCD BREAKOUT\n
$Comp
L Conn_02x12_Odd_Even J1
U 1 1 5A7C4290
P 950 2450
F 0 "J1" H 1000 3050 50  0000 C CNN
F 1 "NUVOTON-M0516LDN-L" H 1000 1750 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x12_Pitch2.54mm" H 950 2450 50  0001 C CNN
F 3 "" H 950 2450 50  0001 C CNN
	1    950  2450
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x12_Odd_Even J6
U 1 1 5A7C430D
P 2700 2450
F 0 "J6" H 2750 3050 50  0000 C CNN
F 1 "NUVOTON-MO516LDN-R" H 2750 1750 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x12_Pitch2.54mm" H 2700 2450 50  0001 C CNN
F 3 "" H 2700 2450 50  0001 C CNN
	1    2700 2450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
