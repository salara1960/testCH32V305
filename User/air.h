#ifndef __AIR_H__
#define __AIR_H__

#ifdef SET_AIR_MODULE

#include "func.h"

#define AIR_BUF_SIZE 256
#define MAX_AT_CMD    17
#define MAX_AT_ACK    15

enum {
	iNone = -1,
	iHOSTEN = 0,//"AT+HOSTEN\r\n" | +HOSTEN:<Param>, Param=0-3
	iVER,//"AT+VER\r\n",          | +VER:JDY-23-V1.2
	iBAUD0,// "AT+BAUD0\r\n",     | +OK ; //AT+BAUD<Param> Param:0！！115200,1！！57600,2！！38400,3！！19200,4！！9600,5！！4800,6！！2400,	Default: 4
	iMAC,// "AT+MAC\r\n",// AT+MAC<Param> | +OK Param: (MAC address string)
	iRST,// "AT+RST\r\n",         | +OK
	iDISC,// "AT+DISC\r\n",       | +OK"
	iSTAT,//"AT+STAT\r\n",// +STAT:<Param> - 00: indicates not connected ,	01: indicates connected
	iSLEEP1,//"AT+SLEEP1\r\n",    | +OK //	1: light sleep (with broadcast)
	iSLEEP2,//"AT+SLEEP2\r\n",    | +OK // 2: Deep sleep (no broadcast)
	iNAME,//"AT+NAME\r\n",        | +OK // Param: module Bluetooth,Maximum: 24 bytes,Default name: JDY-23
	iADVIN,//"AT+ADVIN\r\n",      | +ADVIN:<Param> ; Param:(0-9) : 0:100ms,1:200ms,2:300ms,3:400ms,4:500ms,5:600ms,6:700ms,7:800ms,8:900ms,9:10000ms;Default: 1
	iUUID,//"AT+IBUUID\r\n",      | +OK ; Param:Hex +IBUUID:<Param> ; Default: FDA50693A4E24FB1AFCFC6EB07647825
	iALED0,//"AT+ALED0\r\n",      | +ALED:<Param> ; 0: turn off the broadcast LED indicator
	iALED1,//"AT+ALED1\r\n",      | +ALED:<Param> ; 1: turn on the broadcast LED indicator ; Default: 1
	iDEF,//"AT+DEFAULT\r\n",      | +OK
	iMTU1,//"AT+MTU1\r\n",        | +OK ; Param:(1-2) ; 1: 20 byte
	iMTU2,//"AT+MTU2\r\n"
	iData,
	iLast
};

enum {
	ackOk = 0,
	ackReady,
	ackVER,
	ackCON,
	ackDISC,
	ackHOSTEN,
	ackMTU,
	ackALED,
	ackIBUUID,
	ackADVIN,
	ackSTARTEN,
	ackNAME,
	ackBAUD,
	ackMAC,
	ackSTAT,
	ackPWD
};

extern int8_t airCmd;
extern int8_t airAck;
extern bool airConnect;
extern uint32_t tmr_pas;
extern bool yes_pas;


void UART4_Cfg(uint32_t spd);
void putAirBuf(char *buf, int len);
void airWrite (int8_t cd, char *str, bool prn);
void airDisconnect();

#endif

#endif