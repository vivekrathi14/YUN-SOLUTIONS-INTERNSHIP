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
LIBS:stm32
LIBS:M0516LDN-cache
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
L M0516LDN U1
U 1 1 5AA47F5B
P 1455 2175
F 0 "U1" H 3105 1875 60  0000 C CNN
F 1 "M0516LDN" H 2805 1825 60  0000 C CNN
F 2 "Housings_QFP:LQFP-48_7x7mm_Pitch0.5mm" H 1455 2175 60  0001 C CNN
F 3 "" H 1455 2175 60  0001 C CNN
	1    1455 2175
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x12 J3
U 1 1 5AA47FF7
P 2905 1075
F 0 "J3" H 2905 1675 50  0000 C CNN
F 1 "Conn_01x12" V 3020 865 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x12_Pitch2.54mm" H 2905 1075 50  0001 C CNN
F 3 "" H 2905 1075 50  0001 C CNN
	1    2905 1075
	0    1    -1   0   
$EndComp
Text Label 1765 1775 0    60   ~ 0
ECHO2
Text Label 1765 1875 0    60   ~ 0
ECHO1
Text Label 1765 1975 0    60   ~ 0
TRIG1
Text Label 1765 2175 0    60   ~ 0
RX0
Text Label 1765 2275 0    60   ~ 0
NC1
Text Label 1775 2375 0    60   ~ 0
TX0
Text Label 1775 2475 0    60   ~ 0
R4
Text Label 1775 2575 0    60   ~ 0
R3
Text Label 1775 2675 0    60   ~ 0
R2
Text Label 1775 2775 0    60   ~ 0
R1
Text Label 1775 2875 0    60   ~ 0
C3
Text Label 3665 2875 0    60   ~ 0
L3
Text Label 3665 2775 0    60   ~ 0
L2
Text Label 3665 2675 0    60   ~ 0
L1
Text Label 3665 2575 0    60   ~ 0
NC2
Text Label 3665 2475 0    60   ~ 0
NC3
Text Label 3650 2175 0    60   ~ 0
NC4
Text Label 3650 2075 0    60   ~ 0
NC5
Text Label 3650 1975 0    60   ~ 0
NC6
Text Label 3650 1875 0    60   ~ 0
NC7
Text Label 3650 1775 0    60   ~ 0
NC8
Text Label 3405 1540 1    60   ~ 0
NC9
Text Label 3305 1540 1    60   ~ 0
NC10
Text Label 3205 1540 1    60   ~ 0
RTS1
Text Label 3105 1540 1    60   ~ 0
CTS1
Text Label 3005 1540 1    60   ~ 0
5V
Text Label 2905 1540 1    60   ~ 0
NC11
Text Label 2805 1540 1    60   ~ 0
NC12
Text Label 2705 1540 1    60   ~ 0
DTR1
Text Label 2605 1540 1    60   ~ 0
RX1
Text Label 2505 1540 1    60   ~ 0
TX1
Text Label 2405 1540 1    60   ~ 0
NC13
Text Label 2305 1540 1    60   ~ 0
TRIG2
$Comp
L C C1
U 1 1 5AA4955A
P 4465 3295
F 0 "C1" H 4490 3395 50  0000 L CNN
F 1 "1uF" H 4490 3195 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4503 3145 50  0001 C CNN
F 3 "" H 4465 3295 50  0001 C CNN
	1    4465 3295
	1    0    0    -1  
$EndComp
Text Label 4465 3525 0    60   ~ 0
GND
$Comp
L GND #PWR01
U 1 1 5AA497DF
P 940 1190
F 0 "#PWR01" H 940 940 50  0001 C CNN
F 1 "GND" H 940 1040 50  0000 C CNN
F 2 "" H 940 1190 50  0001 C CNN
F 3 "" H 940 1190 50  0001 C CNN
	1    940  1190
	1    0    0    -1  
$EndComp
Text Label 940  1050 2    60   ~ 0
GND
$Comp
L PWR_FLAG #FLG02
U 1 1 5AA4988E
P 995 1125
F 0 "#FLG02" H 995 1200 50  0001 C CNN
F 1 "PWR_FLAG" H 995 1275 50  0000 C CNN
F 2 "" H 995 1125 50  0001 C CNN
F 3 "" H 995 1125 50  0001 C CNN
	1    995  1125
	0    1    1    0   
$EndComp
$Comp
L Crystal Y1
U 1 1 5AA4994F
P 3905 3210
F 0 "Y1" H 3905 3360 50  0000 C CNN
F 1 "Crystal" H 3905 3060 50  0000 C CNN
F 2 "Crystals:Crystal_HC50_Vertical" H 3905 3210 50  0001 C CNN
F 3 "" H 3905 3210 50  0001 C CNN
	1    3905 3210
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5AA49B51
P 3635 3360
F 0 "C2" H 3660 3460 50  0000 L CNN
F 1 "20pF" H 3660 3260 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3673 3210 50  0001 C CNN
F 3 "" H 3635 3360 50  0001 C CNN
	1    3635 3360
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5AA49BF3
P 4145 3360
F 0 "C3" H 4170 3460 50  0000 L CNN
F 1 "20pF" H 4170 3260 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4183 3210 50  0001 C CNN
F 3 "" H 4145 3360 50  0001 C CNN
	1    4145 3360
	1    0    0    -1  
$EndComp
Text Label 3890 3510 0    60   ~ 0
GND
Text Label 2505 3185 1    60   ~ 0
15
Text Label 2605 3190 1    60   ~ 0
16
Text Label 3680 3210 0    60   ~ 0
15
Text Label 4080 3210 0    60   ~ 0
16
$Comp
L Conn_01x09 J2
U 1 1 5AA4A0F3
P 2845 3600
F 0 "J2" H 2845 4100 50  0000 C CNN
F 1 "Conn_01x09" V 2930 3585 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x09_Pitch2.54mm" H 2845 3600 50  0001 C CNN
F 3 "" H 2845 3600 50  0001 C CNN
	1    2845 3600
	0    -1   1    0   
$EndComp
Text Label 4465 3075 0    60   ~ 0
18
Text Label 2805 3180 1    60   ~ 0
18
Text Label 2305 3330 1    60   ~ 0
C2
Text Label 2405 3330 1    60   ~ 0
C1
Text Label 2705 3355 1    60   ~ 0
GND
Text Label 2905 3285 1    60   ~ 0
RS
Text Label 3005 3285 1    60   ~ 0
EN
Text Label 3105 3285 1    60   ~ 0
D4
Text Label 3205 3285 1    60   ~ 0
D5
Text Label 3305 3285 1    60   ~ 0
D6
Text Label 3405 3285 1    60   ~ 0
D7
Text Notes 2610 4120 0    60   ~ 0
M0516LDN\n
$Comp
L Conn_01x11 J1
U 1 1 5AA61CAC
P 1340 2275
F 0 "J1" H 1340 2875 50  0000 C CNN
F 1 "Conn_01x11" H 1340 1675 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x11_Pitch2.54mm" H 1340 2275 50  0001 C CNN
F 3 "" H 1340 2275 50  0001 C CNN
	1    1340 2275
	-1   0    0    -1  
$EndComp
$Comp
L Conn_01x10 J4
U 1 1 5AA62472
P 4360 2175
F 0 "J4" H 4360 2675 50  0000 C CNN
F 1 "Conn_01x10" V 4460 1710 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 4360 2175 50  0001 C CNN
F 3 "" H 4360 2175 50  0001 C CNN
	1    4360 2175
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x05 J5
U 1 1 5AA62B5D
P 4950 965
F 0 "J5" H 4950 1265 50  0000 C CNN
F 1 "Conn_01x05" V 5045 950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 4950 965 50  0001 C CNN
F 3 "" H 4950 965 50  0001 C CNN
	1    4950 965 
	0    -1   -1   0   
$EndComp
Text Label 4750 1535 1    60   ~ 0
5V
Text Label 4850 1535 1    60   ~ 0
ICE_DAT
Text Label 4950 1530 1    60   ~ 0
ICE_CLK
Text Label 5050 1535 1    60   ~ 0
RST
Text Label 5150 1530 1    60   ~ 0
GND
Text Label 3985 2375 2    60   ~ 0
ICE_CLK
Text Label 3980 2275 2    60   ~ 0
ICE_DAT
Text Label 1835 2075 0    60   ~ 0
RST
$Comp
L VCC #PWR03
U 1 1 5AA63834
P 1425 1065
F 0 "#PWR03" H 1425 915 50  0001 C CNN
F 1 "VCC" H 1425 1215 50  0000 C CNN
F 2 "" H 1425 1065 50  0001 C CNN
F 3 "" H 1425 1065 50  0001 C CNN
	1    1425 1065
	1    0    0    -1  
$EndComp
Text Label 1425 1290 0    60   ~ 0
5V
$Comp
L PWR_FLAG #FLG04
U 1 1 5AA63900
P 1455 1135
F 0 "#FLG04" H 1455 1210 50  0001 C CNN
F 1 "PWR_FLAG" H 1455 1285 50  0000 C CNN
F 2 "" H 1455 1135 50  0001 C CNN
F 3 "" H 1455 1135 50  0001 C CNN
	1    1455 1135
	0    1    1    0   
$EndComp
$Comp
L C C4
U 1 1 5AA65C1F
P 5060 2165
F 0 "C4" H 5085 2265 50  0000 L CNN
F 1 "0.1uF" H 5085 2065 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5098 2015 50  0001 C CNN
F 3 "" H 5060 2165 50  0001 C CNN
	1    5060 2165
	1    0    0    -1  
$EndComp
Wire Wire Line
	1540 1775 2105 1775
Wire Wire Line
	1540 1875 2105 1875
Wire Wire Line
	1540 1975 2105 1975
Wire Wire Line
	1665 2175 2105 2175
Wire Wire Line
	2105 2275 1665 2275
Wire Wire Line
	1665 2375 2105 2375
Wire Wire Line
	2105 2475 1665 2475
Wire Wire Line
	1665 2575 2105 2575
Wire Wire Line
	2105 2675 1665 2675
Wire Wire Line
	1665 2775 2105 2775
Wire Wire Line
	1665 2875 2105 2875
Wire Wire Line
	2305 1275 2305 1575
Wire Wire Line
	2405 1275 2405 1575
Wire Wire Line
	2505 1575 2505 1275
Wire Wire Line
	2605 1275 2605 1575
Wire Wire Line
	2705 1575 2705 1275
Wire Wire Line
	2805 1275 2805 1575
Wire Wire Line
	2905 1275 2905 1575
Wire Wire Line
	3005 1575 3005 1275
Wire Wire Line
	3105 1275 3105 1575
Wire Wire Line
	3205 1575 3205 1275
Wire Wire Line
	3305 1275 3305 1575
Wire Wire Line
	3405 1575 3405 1275
Wire Wire Line
	3605 1775 4160 1775
Wire Wire Line
	3605 1875 4160 1875
Wire Wire Line
	3605 1975 4160 1975
Wire Wire Line
	3605 2075 4160 2075
Wire Wire Line
	3605 2175 4160 2175
Wire Wire Line
	3605 2475 4070 2475
Wire Wire Line
	3605 2575 4090 2575
Wire Wire Line
	3605 2675 4105 2675
Wire Wire Line
	3605 2775 4125 2775
Wire Wire Line
	3605 2875 4160 2875
Wire Wire Line
	4465 3445 4465 3525
Wire Wire Line
	2805 3075 2805 3180
Wire Wire Line
	940  1050 940  1190
Wire Wire Line
	995  1125 940  1125
Connection ~ 940  1125
Wire Wire Line
	3755 3210 3635 3210
Wire Wire Line
	4055 3210 4145 3210
Wire Wire Line
	3635 3510 4145 3510
Wire Wire Line
	2505 3075 2505 3185
Wire Wire Line
	2605 3075 2605 3190
Wire Wire Line
	4465 3145 4465 3075
Wire Wire Line
	2305 3075 2305 3400
Wire Wire Line
	2305 3400 2445 3400
Wire Wire Line
	2405 3075 2405 3375
Wire Wire Line
	2405 3375 2545 3375
Wire Wire Line
	2545 3375 2545 3400
Wire Wire Line
	2705 3075 2705 3400
Wire Wire Line
	2705 3400 2645 3400
Wire Wire Line
	2905 3075 2905 3315
Wire Wire Line
	2905 3315 2745 3315
Wire Wire Line
	2745 3315 2745 3400
Wire Wire Line
	2845 3400 2845 3335
Wire Wire Line
	2845 3335 3005 3335
Wire Wire Line
	3005 3335 3005 3075
Wire Wire Line
	2945 3400 2945 3350
Wire Wire Line
	2945 3350 3105 3350
Wire Wire Line
	3105 3350 3105 3075
Wire Wire Line
	3045 3400 3045 3365
Wire Wire Line
	3045 3365 3205 3365
Wire Wire Line
	3205 3365 3205 3075
Wire Wire Line
	3145 3400 3145 3380
Wire Wire Line
	3145 3380 3305 3380
Wire Wire Line
	3305 3380 3305 3075
Wire Wire Line
	3245 3400 3405 3400
Wire Wire Line
	3405 3400 3405 3075
Wire Notes Line
	640  815  5815 815 
Wire Notes Line
	5815 815  5815 4315
Wire Notes Line
	5815 4315 645  4315
Wire Notes Line
	645  4315 645  815 
Wire Wire Line
	1665 2175 1665 2075
Wire Wire Line
	1665 2075 1540 2075
Wire Wire Line
	1665 2275 1665 2195
Wire Wire Line
	1665 2195 1540 2195
Wire Wire Line
	1540 2195 1540 2175
Wire Wire Line
	1665 2375 1665 2305
Wire Wire Line
	1665 2305 1540 2305
Wire Wire Line
	1540 2305 1540 2275
Wire Wire Line
	1665 2475 1665 2415
Wire Wire Line
	1665 2415 1540 2415
Wire Wire Line
	1540 2415 1540 2375
Wire Wire Line
	1665 2495 1665 2575
Wire Wire Line
	1665 2495 1540 2495
Wire Wire Line
	1540 2495 1540 2475
Wire Wire Line
	1665 2675 1665 2600
Wire Wire Line
	1665 2600 1540 2600
Wire Wire Line
	1540 2600 1540 2575
Wire Wire Line
	1665 2775 1665 2700
Wire Wire Line
	1665 2700 1540 2700
Wire Wire Line
	1540 2700 1540 2675
Wire Wire Line
	1665 2875 1665 2805
Wire Wire Line
	1665 2805 1540 2805
Wire Wire Line
	1540 2805 1540 2775
Wire Wire Line
	4160 2875 4160 2675
Wire Wire Line
	4125 2775 4125 2575
Wire Wire Line
	4125 2575 4160 2575
Wire Wire Line
	4105 2675 4105 2475
Wire Wire Line
	4105 2475 4160 2475
Wire Wire Line
	4090 2575 4090 2375
Wire Wire Line
	4090 2375 4160 2375
Wire Wire Line
	4070 2475 4070 2275
Wire Wire Line
	4070 2275 4160 2275
Wire Wire Line
	4750 1165 4750 1535
Wire Wire Line
	4850 1165 4850 1535
Wire Wire Line
	4950 1165 4950 1530
Wire Wire Line
	5050 1165 5050 1535
Wire Wire Line
	5150 1165 5150 1530
Wire Wire Line
	3605 2275 3980 2275
Wire Wire Line
	3605 2375 3985 2375
Wire Wire Line
	2105 2075 1835 2075
Wire Wire Line
	1425 1065 1425 1290
Wire Wire Line
	1455 1135 1425 1135
Connection ~ 1425 1135
Wire Wire Line
	5060 2015 5060 1930
Text Label 5060 1930 0    60   ~ 0
5V
Wire Wire Line
	5060 2315 5060 2400
Text Label 5060 2400 0    60   ~ 0
GND
$EndSCHEMATC
