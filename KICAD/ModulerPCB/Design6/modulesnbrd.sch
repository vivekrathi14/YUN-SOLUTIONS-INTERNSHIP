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
LIBS:modulesnbrd-cache
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
L Jack-DC J6
U 1 1 5AAA14B7
P 1475 800
F 0 "J6" H 1475 1010 50  0000 C CNN
F 1 "Jack-DC" H 1475 625 50  0000 C CNN
F 2 "Connectors:Barrel_Jack_CUI_PJ-102AH" H 1525 760 50  0001 C CNN
F 3 "" H 1525 760 50  0001 C CNN
	1    1475 800 
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5AAA1523
P 2090 700
F 0 "C1" H 2115 800 50  0000 L CNN
F 1 "C" H 2115 600 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 2128 550 50  0001 C CNN
F 3 "" H 2090 700 50  0001 C CNN
	1    2090 700 
	0    1    1    0   
$EndComp
Text Label 1805 700  0    60   ~ 0
VCC
Text Label 2335 700  0    60   ~ 0
GND
Text Label 1775 900  0    60   ~ 0
GND
$Comp
L VCC #PWR01
U 1 1 5AAA15DF
P 575 740
F 0 "#PWR01" H 575 590 50  0001 C CNN
F 1 "VCC" H 575 890 50  0000 C CNN
F 2 "" H 575 740 50  0001 C CNN
F 3 "" H 575 740 50  0001 C CNN
	1    575  740 
	1    0    0    -1  
$EndComp
Text Label 575  920  0    60   ~ 0
VCC
$Comp
L GND #PWR02
U 1 1 5AAA160C
P 915 825
F 0 "#PWR02" H 915 575 50  0001 C CNN
F 1 "GND" H 915 675 50  0000 C CNN
F 2 "" H 915 825 50  0001 C CNN
F 3 "" H 915 825 50  0001 C CNN
	1    915  825 
	1    0    0    -1  
$EndComp
Text Label 915  640  0    60   ~ 0
GND
$Comp
L PWR_FLAG #FLG03
U 1 1 5AAA1634
P 630 765
F 0 "#FLG03" H 630 840 50  0001 C CNN
F 1 "PWR_FLAG" H 630 915 50  0000 C CNN
F 2 "" H 630 765 50  0001 C CNN
F 3 "" H 630 765 50  0001 C CNN
	1    630  765 
	0    1    1    0   
$EndComp
$Comp
L PWR_FLAG #FLG04
U 1 1 5AAA1656
P 975 760
F 0 "#FLG04" H 975 835 50  0001 C CNN
F 1 "PWR_FLAG" H 975 910 50  0000 C CNN
F 2 "" H 975 760 50  0001 C CNN
F 3 "" H 975 760 50  0001 C CNN
	1    975  760 
	0    1    1    0   
$EndComp
$Comp
L Conn_02x02_Odd_Even J9
U 1 1 5AAA167B
P 2290 1170
F 0 "J9" H 2340 1270 50  0000 C CNN
F 1 "LM2596" H 2340 970 50  0000 C CNN
F 2 "LM2596:LM2596" H 2290 1170 50  0001 C CNN
F 3 "" H 2290 1170 50  0001 C CNN
	1    2290 1170
	1    0    0    -1  
$EndComp
Text Label 1950 1170 0    60   ~ 0
5V
Text Label 2680 1170 0    60   ~ 0
VBAT
Text Label 2300 1490 0    60   ~ 0
GND
$Comp
L Conn_01x04 J2
U 1 1 5AAA1788
P 780 1300
F 0 "J2" H 780 1500 50  0000 C CNN
F 1 "VCC_BKT" H 780 1000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 780 1300 50  0001 C CNN
F 3 "" H 780 1300 50  0001 C CNN
	1    780  1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1775 700  1940 700 
Wire Wire Line
	2240 700  2335 700 
Wire Wire Line
	1775 800  1775 900 
Wire Wire Line
	575  740  575  920 
Wire Wire Line
	915  640  915  825 
Wire Wire Line
	630  765  575  765 
Connection ~ 575  765 
Wire Wire Line
	975  760  915  760 
Connection ~ 915  760 
Wire Wire Line
	2090 1170 1950 1170
Wire Wire Line
	2590 1170 2680 1170
Wire Wire Line
	2090 1270 2090 1490
Wire Wire Line
	2090 1490 2590 1490
Wire Wire Line
	2590 1490 2590 1270
Wire Wire Line
	630  1500 980  1500
Text Label 630  1500 2    60   ~ 0
5V
Connection ~ 680  1500
Connection ~ 780  1500
Connection ~ 880  1500
$Comp
L Conn_01x04 J5
U 1 1 5AAA1955
P 1425 1295
F 0 "J5" H 1425 1495 50  0000 C CNN
F 1 "GND_BKT" H 1425 995 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 1425 1295 50  0001 C CNN
F 3 "" H 1425 1295 50  0001 C CNN
	1    1425 1295
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1255 1495 1625 1495
Connection ~ 1525 1495
Connection ~ 1425 1495
Connection ~ 1325 1495
Text Label 1255 1495 1    60   ~ 0
GND
$Comp
L SW_DIP_x01 SW1
U 1 1 5AAA1A7D
P 1580 1805
F 0 "SW1" H 1580 1955 50  0000 C CNN
F 1 "PWR S/W" H 1580 1655 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_DIP_x1_W7.62mm_Slide" H 1580 1805 50  0001 C CNN
F 3 "" H 1580 1805 50  0001 C CNN
	1    1580 1805
	1    0    0    -1  
$EndComp
Wire Wire Line
	1280 1805 1175 1805
Text Label 1175 1805 0    60   ~ 0
VCC
Wire Wire Line
	1880 1805 1980 1805
Text Label 1980 1805 0    60   ~ 0
5V
Wire Notes Line
	2950 480  2950 2330
Wire Notes Line
	490  2330 3260 2330
Text Notes 1050 2290 0    60   ~ 0
POWER (VIA ADAPTER)\n5V DC, 2A DC\nDC JACK,PWR BKOUTS,PWR S/W
$Comp
L Conn_01x16 J4
U 1 1 5AAA1F8D
P 1350 2560
F 0 "J4" H 1350 3360 50  0000 C CNN
F 1 "16*2 LCD" H 1350 1660 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16_Pitch2.54mm" H 1350 2560 50  0001 C CNN
F 3 "" H 1350 2560 50  0001 C CNN
	1    1350 2560
	0    -1   -1   0   
$EndComp
Wire Wire Line
	650  2760 650  3020
Wire Wire Line
	750  2760 750  3020
Wire Wire Line
	850  2760 850  3020
Wire Wire Line
	950  2760 950  3020
Wire Wire Line
	1050 2760 1050 3020
Wire Wire Line
	1150 2760 1150 3020
Wire Wire Line
	2150 2760 2150 3070
Wire Wire Line
	2050 2760 2050 3060
Wire Wire Line
	1950 2760 1950 3060
Wire Wire Line
	1850 2760 1850 3060
Wire Wire Line
	1750 2760 1750 3060
Wire Wire Line
	1650 2760 1650 3070
Text Label 650  2760 3    60   ~ 0
VSS
Text Label 750  3020 1    60   ~ 0
5V
Text Label 850  2770 3    60   ~ 0
VEE
Text Label 950  3020 1    60   ~ 0
RS
Text Label 1050 3020 1    60   ~ 0
GND
Text Label 1150 3020 1    60   ~ 0
EN
Text Label 650  3020 3    60   ~ 0
GND
Text Label 850  3020 3    60   ~ 0
GND
Text Label 1650 3070 1    60   ~ 0
D4
Text Label 1750 3060 1    60   ~ 0
D5
Text Label 1850 3060 1    60   ~ 0
D6
Text Label 1950 3060 1    60   ~ 0
D7
Text Label 2050 3060 1    60   ~ 0
5V
Text Label 2150 3070 1    60   ~ 0
GND
Text Label 2050 2800 3    60   ~ 0
L+
Text Label 2150 2760 3    60   ~ 0
L-
NoConn ~ 1250 2760
NoConn ~ 1350 2760
NoConn ~ 1450 2760
NoConn ~ 1550 2760
$Comp
L R R4
U 1 1 5AAA265C
P 2460 2720
F 0 "R4" V 2540 2720 50  0000 C CNN
F 1 "330" V 2460 2720 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2390 2720 50  0001 C CNN
F 3 "" H 2460 2720 50  0001 C CNN
	1    2460 2720
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5AAA26C4
P 2750 2710
F 0 "R5" V 2830 2710 50  0000 C CNN
F 1 "330" V 2750 2710 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2680 2710 50  0001 C CNN
F 3 "" H 2750 2710 50  0001 C CNN
	1    2750 2710
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5AAA26FF
P 3060 2710
F 0 "R6" V 3140 2710 50  0000 C CNN
F 1 "330" V 3060 2710 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2990 2710 50  0001 C CNN
F 3 "" H 3060 2710 50  0001 C CNN
	1    3060 2710
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 5AAA2737
P 2460 3120
F 0 "D1" H 2460 3220 50  0000 C CNN
F 1 "LED" H 2460 3020 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 2460 3120 50  0001 C CNN
F 3 "" H 2460 3120 50  0001 C CNN
	1    2460 3120
	0    -1   -1   0   
$EndComp
$Comp
L LED D2
U 1 1 5AAA2787
P 2750 3120
F 0 "D2" H 2750 3220 50  0000 C CNN
F 1 "LED" H 2750 3020 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 2750 3120 50  0001 C CNN
F 3 "" H 2750 3120 50  0001 C CNN
	1    2750 3120
	0    -1   -1   0   
$EndComp
$Comp
L LED D3
U 1 1 5AAA27DB
P 3060 3130
F 0 "D3" H 3060 3230 50  0000 C CNN
F 1 "LED" H 3060 3030 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 3060 3130 50  0001 C CNN
F 3 "" H 3060 3130 50  0001 C CNN
	1    3060 3130
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2460 2870 2460 2970
Wire Wire Line
	2750 2860 2750 2970
Wire Wire Line
	3060 2860 3060 2980
Wire Wire Line
	2460 2570 2460 2520
Wire Wire Line
	2460 2520 3060 2520
Wire Wire Line
	3060 2520 3060 2560
Wire Wire Line
	2750 2560 2750 2520
Connection ~ 2750 2520
Text Label 2750 2520 0    60   ~ 0
5V
Wire Wire Line
	2460 3270 2460 3380
Text Label 2460 3380 0    60   ~ 0
L1
Wire Wire Line
	2750 3270 2750 3380
Text Label 2750 3380 0    60   ~ 0
L2
Wire Wire Line
	3060 3280 3060 3390
Text Label 3060 3390 0    60   ~ 0
L3
Wire Notes Line
	3260 2330 3260 3980
Wire Notes Line
	3260 3980 490  3980
Text Notes 1300 3770 0    60   ~ 0
16*2 LCD(4 BIT) 5V DC\n3 LEDs (SOURCING)
$Comp
L Conn_01x02 J1
U 1 1 5AAA35AF
P 640 4180
F 0 "J1" H 640 4280 50  0000 C CNN
F 1 "UART0" H 640 3980 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 640 4180 50  0001 C CNN
F 3 "" H 640 4180 50  0001 C CNN
	1    640  4180
	0    -1   -1   0   
$EndComp
$Comp
L Conn_01x04 J3
U 1 1 5AAA364F
P 1160 4170
F 0 "J3" H 1160 4370 50  0000 C CNN
F 1 "ULTRA1" H 1160 3870 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 1160 4170 50  0001 C CNN
F 3 "" H 1160 4170 50  0001 C CNN
	1    1160 4170
	0    -1   -1   0   
$EndComp
$Comp
L Conn_01x04 J8
U 1 1 5AAA36A3
P 2040 4160
F 0 "J8" H 2040 4360 50  0000 C CNN
F 1 "ULTRA2" H 2040 3860 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 2040 4160 50  0001 C CNN
F 3 "" H 2040 4160 50  0001 C CNN
	1    2040 4160
	0    -1   -1   0   
$EndComp
Wire Wire Line
	640  4380 640  4500
Text Label 640  4500 1    60   ~ 0
RX0
Wire Wire Line
	740  4380 740  4500
Text Label 740  4500 1    60   ~ 0
TX0
Wire Wire Line
	1060 4370 1060 4660
Text Label 1060 4660 1    60   ~ 0
5V
Wire Wire Line
	1160 4370 1160 4660
Text Label 1160 4660 1    60   ~ 0
TRIG1
Wire Wire Line
	1260 4370 1260 4660
Text Label 1260 4660 1    60   ~ 0
ECHO1
Wire Wire Line
	1360 4370 1360 4660
Text Label 1360 4660 1    60   ~ 0
GND
Wire Wire Line
	1940 4360 1940 4650
Text Label 1940 4650 1    60   ~ 0
5V
Wire Wire Line
	2040 4360 2040 4650
Text Label 2040 4650 1    60   ~ 0
TRIG2
Wire Wire Line
	2140 4360 2140 4650
Text Label 2140 4650 1    60   ~ 0
ECHO2
Wire Wire Line
	2240 4360 2240 4650
Text Label 2240 4650 1    60   ~ 0
GND
Wire Notes Line
	2640 3980 2640 5020
Wire Notes Line
	2640 5020 480  5020
Text Notes 500  4900 0    60   ~ 0
UART0 BKOUT,ULTRA SENSOR1,ULTRA SENSOR2\n
$Comp
L Conn_01x07 J7
U 1 1 5AAA4690
P 1860 5890
F 0 "J7" H 1860 6290 50  0000 C CNN
F 1 "KEYPAD" H 1860 5490 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07_Pitch2.54mm" H 1860 5890 50  0001 C CNN
F 3 "" H 1860 5890 50  0001 C CNN
	1    1860 5890
	1    0    0    -1  
$EndComp
Wire Wire Line
	1370 5590 1660 5590
Text Label 1430 5590 0    60   ~ 0
C1
Wire Wire Line
	1200 5690 1660 5690
Text Label 1430 5690 0    60   ~ 0
C2
Wire Wire Line
	1030 5790 1660 5790
Text Label 1430 5790 0    60   ~ 0
C3
Wire Wire Line
	1660 5890 1430 5890
Text Label 1430 5890 0    60   ~ 0
R1
Wire Wire Line
	1660 5990 1430 5990
Text Label 1430 5990 0    60   ~ 0
R2
Wire Wire Line
	1660 6090 1430 6090
Text Label 1430 6090 0    60   ~ 0
R3
Wire Wire Line
	1660 6190 1430 6190
Text Label 1430 6190 0    60   ~ 0
R4
$Comp
L R R3
U 1 1 5AAA4D5B
P 1370 5300
F 0 "R3" V 1450 5300 50  0000 C CNN
F 1 "1K" V 1370 5300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1300 5300 50  0001 C CNN
F 3 "" H 1370 5300 50  0001 C CNN
	1    1370 5300
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5AAA4DED
P 1200 5300
F 0 "R2" V 1280 5300 50  0000 C CNN
F 1 "1K" V 1200 5300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1130 5300 50  0001 C CNN
F 3 "" H 1200 5300 50  0001 C CNN
	1    1200 5300
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5AAA4E40
P 1030 5300
F 0 "R1" V 1110 5300 50  0000 C CNN
F 1 "1K" V 1030 5300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 960 5300 50  0001 C CNN
F 3 "" H 1030 5300 50  0001 C CNN
	1    1030 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1370 5450 1370 5590
Wire Wire Line
	1200 5450 1200 5690
Wire Wire Line
	1030 5450 1030 5790
Wire Wire Line
	1030 5150 1030 5100
Wire Wire Line
	1030 5100 1370 5100
Wire Wire Line
	1370 5100 1370 5150
Wire Wire Line
	1200 5150 1200 5100
Connection ~ 1200 5100
Text Label 1200 5100 0    60   ~ 0
5V
Wire Notes Line
	2120 5020 2120 6660
Wire Notes Line
	2120 6660 480  6660
Text Notes 990  6540 0    60   ~ 0
4*3 KEYPAD\n
$Comp
L Conn_01x11 J10
U 1 1 5AAA59E6
P 3640 1600
F 0 "J10" H 3640 2200 50  0000 C CNN
F 1 "M0516LEFT" V 3760 1700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x11_Pitch2.54mm" H 3640 1600 50  0001 C CNN
F 3 "" H 3640 1600 50  0001 C CNN
	1    3640 1600
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x09 J11
U 1 1 5AAA5A79
P 4340 2290
F 0 "J11" H 4340 2790 50  0000 C CNN
F 1 "M0516DOWN" V 4430 2220 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x09_Pitch2.54mm" H 4340 2290 50  0001 C CNN
F 3 "" H 4340 2290 50  0001 C CNN
	1    4340 2290
	0    -1   -1   0   
$EndComp
$Comp
L Conn_01x10 J13
U 1 1 5AAA5AF0
P 4950 1660
F 0 "J13" H 4950 2160 50  0000 C CNN
F 1 "M0516RIGHT" V 5070 1580 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 4950 1660 50  0001 C CNN
F 3 "" H 4950 1660 50  0001 C CNN
	1    4950 1660
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x12 J12
U 1 1 5AAA5B61
P 4360 990
F 0 "J12" H 4360 1590 50  0000 C CNN
F 1 "M0516UP" V 4480 930 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x12_Pitch2.54mm" H 4360 990 50  0001 C CNN
F 3 "" H 4360 990 50  0001 C CNN
	1    4360 990 
	0    1    1    0   
$EndComp
Wire Wire Line
	3440 1100 3210 1100
Wire Wire Line
	3440 1200 3210 1200
Wire Wire Line
	3440 1300 3210 1300
Wire Wire Line
	3440 1400 3210 1400
Wire Wire Line
	3440 1600 3210 1600
Wire Wire Line
	3440 1700 3210 1700
Wire Wire Line
	3440 1800 3210 1800
Wire Wire Line
	3440 1900 3210 1900
Wire Wire Line
	3440 2000 3210 2000
Wire Wire Line
	3440 2100 3210 2100
Wire Wire Line
	3940 2490 3940 2710
Wire Wire Line
	4040 2490 4040 2720
Wire Wire Line
	4140 2490 4140 2720
Wire Wire Line
	4240 2490 4240 2720
Wire Wire Line
	4340 2490 4340 2710
Wire Wire Line
	4440 2490 4440 2710
Wire Wire Line
	4540 2490 4540 2710
Wire Wire Line
	4640 2490 4640 2710
Wire Wire Line
	4740 2490 4740 2710
Wire Wire Line
	5150 2060 5440 2060
Wire Wire Line
	5150 1960 5440 1960
Wire Wire Line
	5150 1860 5440 1860
Wire Wire Line
	4660 790  4660 560 
Wire Wire Line
	4560 790  4560 560 
Wire Wire Line
	4460 790  4460 560 
Wire Wire Line
	4160 790  4160 560 
Wire Wire Line
	4060 790  4060 560 
Wire Wire Line
	3960 790  3960 560 
Wire Wire Line
	3760 790  3760 560 
Text Label 3210 1100 0    60   ~ 0
ECHO2
Text Label 3210 1200 0    60   ~ 0
ECHO1
Text Label 3210 1400 0    60   ~ 0
RX0
Text Label 3210 1600 0    60   ~ 0
TX0
Text Label 3210 1700 0    60   ~ 0
R4
Text Label 3210 1800 0    60   ~ 0
R3
Text Label 3210 1900 0    60   ~ 0
R2
Text Label 3210 2000 0    60   ~ 0
R1
Text Label 3210 2100 0    60   ~ 0
C3
Text Label 3210 1300 0    60   ~ 0
TRIG1
Text Label 3940 2710 3    60   ~ 0
C2
Text Label 4040 2720 3    60   ~ 0
C1
Text Label 4140 2720 3    60   ~ 0
GND
Text Label 4240 2720 3    60   ~ 0
RS
Text Label 4340 2710 3    60   ~ 0
EN
Text Label 4440 2710 3    60   ~ 0
D4
Text Label 4540 2710 3    60   ~ 0
D5
Text Label 4640 2710 3    60   ~ 0
D6
Text Label 4740 2710 3    60   ~ 0
D7
Text Label 5440 2060 0    60   ~ 0
L3
Text Label 5440 1960 0    60   ~ 0
L2
Text Label 4660 560  3    60   ~ 0
RTS1
Text Label 4560 560  3    60   ~ 0
CTS1
Text Label 4460 560  3    60   ~ 0
5V
Text Label 4160 560  3    60   ~ 0
DTR1
Text Label 4060 560  3    60   ~ 0
RX1
Text Label 3960 560  3    60   ~ 0
TX1
Text Label 3760 560  3    60   ~ 0
TRIG2
NoConn ~ 3440 1500
NoConn ~ 5150 1760
NoConn ~ 5150 1660
NoConn ~ 5150 1560
NoConn ~ 5150 1460
NoConn ~ 5150 1360
NoConn ~ 5150 1260
NoConn ~ 5150 1160
NoConn ~ 4860 790 
NoConn ~ 4760 790 
NoConn ~ 4360 790 
NoConn ~ 4260 790 
NoConn ~ 3860 790 
Text Label 5440 1860 0    60   ~ 0
L1
Wire Notes Line
	5860 490  5860 3500
Wire Notes Line
	8460 3500 3260 3500
Text Notes 4160 3170 0    60   ~ 0
M0516LDN\n
$Comp
L Conn_01x09 J14
U 1 1 5AAAC251
P 6490 1560
F 0 "J14" H 6490 2060 50  0000 C CNN
F 1 "M66L" H 6490 1060 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x09_Pitch2.54mm" H 6490 1560 50  0001 C CNN
F 3 "" H 6490 1560 50  0001 C CNN
	1    6490 1560
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x09 J15
U 1 1 5AAAC2B3
P 7160 880
F 0 "J15" H 7160 1380 50  0000 C CNN
F 1 "M66U" V 7280 700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x09_Pitch2.54mm" H 7160 880 50  0001 C CNN
F 3 "" H 7160 880 50  0001 C CNN
	1    7160 880 
	0    -1   -1   0   
$EndComp
$Comp
L Conn_01x12 J17
U 1 1 5AAAC37D
P 8010 1720
F 0 "J17" H 8010 2320 50  0000 C CNN
F 1 "M66R" V 8120 1760 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x12_Pitch2.54mm" H 8010 1720 50  0001 C CNN
F 3 "" H 8010 1720 50  0001 C CNN
	1    8010 1720
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x08 J16
U 1 1 5AAAC478
P 7180 2410
F 0 "J16" H 7180 2810 50  0000 C CNN
F 1 "M66D" V 7280 2360 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 7180 2410 50  0001 C CNN
F 3 "" H 7180 2410 50  0001 C CNN
	1    7180 2410
	0    1    1    0   
$EndComp
Wire Wire Line
	6290 1760 6030 1760
Text Label 6030 1760 0    60   ~ 0
GND
Wire Wire Line
	6980 2210 6980 1960
Text Label 6980 1960 3    60   ~ 0
RX1
Wire Wire Line
	7080 2210 7080 1960
Text Label 7080 1960 3    60   ~ 0
TX1
Wire Wire Line
	7180 2210 7180 1960
Text Label 7180 1960 3    60   ~ 0
DTR1
Wire Wire Line
	7480 2210 7480 1960
Text Label 7480 1960 3    60   ~ 0
CTS1
Wire Wire Line
	7810 1220 7630 1220
Text Label 7630 1220 0    60   ~ 0
GND
Wire Wire Line
	7810 1920 7610 1920
Text Label 7610 1920 0    60   ~ 0
GND
Wire Wire Line
	7810 2320 7600 2320
Text Label 7600 2320 0    60   ~ 0
RTS1
Wire Wire Line
	6860 1080 6960 1080
Wire Wire Line
	6960 1080 6960 1200
Text Label 6960 1200 3    60   ~ 0
VBAT
Wire Wire Line
	7060 1080 7160 1080
Wire Wire Line
	7160 1080 7160 1200
Text Label 7160 1200 3    60   ~ 0
GND
Wire Wire Line
	7460 1080 7560 1080
Wire Wire Line
	7560 1080 7560 1170
Text Label 7560 1170 2    60   ~ 0
GND
NoConn ~ 6290 1160
NoConn ~ 6290 1260
NoConn ~ 6290 1360
NoConn ~ 6290 1460
NoConn ~ 6290 1560
NoConn ~ 6290 1660
NoConn ~ 6290 1860
NoConn ~ 6290 1960
NoConn ~ 6760 1080
NoConn ~ 7260 1080
NoConn ~ 7360 1080
NoConn ~ 6780 2210
NoConn ~ 6880 2210
NoConn ~ 7280 2210
NoConn ~ 7380 2210
NoConn ~ 7810 1320
NoConn ~ 7810 1420
NoConn ~ 7810 1520
NoConn ~ 7810 1620
NoConn ~ 7810 1720
NoConn ~ 7810 1820
NoConn ~ 7810 2020
NoConn ~ 7810 2120
NoConn ~ 7810 2220
Wire Notes Line
	8460 480  8460 3500
Text Notes 7010 3030 0    60   ~ 0
M66\n
$EndSCHEMATC
