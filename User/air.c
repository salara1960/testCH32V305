
#ifdef SET_AIR_MODULE

#include "air.h"


char RxAirBuf[AIR_BUF_SIZE] = {0};
volatile uint16_t RxAirCnt = 0;
int8_t airCmd = iNone;
uint8_t airAck = bleNone;
bool airConnect = false;
uint32_t tmr_pas = 0;
bool yes_pas = false;

const char *airPassword = "salara";

#ifdef SET_JDY23
const char *at_cmd[MAX_AT_CMD] = {
    "AT+HOSTEN\r\n",   // | +HOSTEN:<Param> , 0: transparent transmission from slave (APP, applet)
                                            //3: Slave (iBeacon) mode
    "AT+VER\r\n",      // | +VER:JDY-23-V1.2
    "AT+BAUD0\r\n",    // | +OK ; //AT+BAUD<Param> Param:0！！115200,1！！57600,2！！38400,3！！19200,4！！9600,5！！4800,6！！2400,	Default: 4
    "AT+MAC\r\n",      // AT+MAC<Param> | +OK Param: (MAC address string)
    "AT+RST\r\n",      // | +OK
    "AT+DISC\r\n",     // | +OK"
    "AT+STAT\r\n",     // +STAT:<Param> - 00: indicates not connected ,	01: indicates connected
    "AT+SLEEP1\r\n",   // | +OK //	1: light sleep (with broadcast)
    "AT+SLEEP2\r\n",   // | +OK //    2: Deep sleep (no broadcast)
    "AT+NAME\r\n",     // | +OK // Param: module Bluetooth,Maximum: 24 bytes,Default name: JDY-23
    "AT+ADVIN\r\n",    // | +ADVIN:<Param> ; Param:(0-9) : 0:100ms,1:200ms,2:300ms,3:400ms,4:500ms,5:600ms,6:700ms,7:800ms,8:900ms,9:10000ms;Default: 1
    "AT+IBUUID\r\n",   // | +OK ; Param:Hex +IBUUID:<Param> ; Default: FDA50693A4E24FB1AFCFC6EB07647825 - FDA50693A4E24FB1AFCFC6EB07647825
    "AT+ALED0\r\n",    // | +ALED:<Param> ; 0: turn off the broadcast LED indicator
    "AT+ALED1\r\n",    // | +ALED:<Param> ; 1: turn on the broadcast LED indicator ; Default: 1
    "AT+DEFAULT\r\n",  // | +OK
    "AT+MTU1\r\n",     // | +OK ; Param:(1-2) ; 1: 20 byte
    "AT+MTU2\r\n"      // | +OK ; Param:(1-2) ; 2: 128 byte, Default: 1
};
const char *at_ack[MAX_AT_ACK] = {
    "+OK",
    "+Ready",
    "+VER:",  // +VER:JDY-23-V1.2
    "+CONNECTED",
    "+DISCONNECT",
    "+HOSTEN:",   // +HOSTEN:<Param>
    "+MTU:",      // +MTU:<Param>
    "+ALED:",     // +ALED:<Param>
    "+IBUUID:",   // +IBUUID:<Param>
    "+ADVIN:",    // +ADVIN:<Param>
    "+STARTEN:",  // +STARTEN:<Param
    "+NAME:",     // +NAME:<Param>
    "+BAUD:",     // +BAUD:<Param> : 0！！115200,1！！57600,2！！38400,3！！19200,4！！9600,5！！4800,6！！2400 	Default: 4
    "+MAC:"       // +MAC:<Param>
    "+STAT:"      // +STAT:<Param> :  00: indicates not connected , 01: indicates connected
};
#else
const char *at_cmd[MAX_AT_CMD] = { 
    "AT+VERSION\r\n",  // | +VER:JDY-23-V1.2
    "AT+BAUD8\r\n",    // | +OK ; //AT+BAUD<Param> : 4-9600,5-19200,6-38400,7-57600,8-115200,9-128000
    "AT+LADDR\r\n",    // | +LADDR=<Param> (MAC address string)
    "AT+RESET\r\n",    // | +OK
    "AT+DISC\r\n",     // | +OK"
    "AT+DEFAULT\r\n",  //   reset 
    "AT+PIN\r\n",      // | +PIN=<Param> Default PIN: 1234
    "AT+NAME<name>\r\n",//| OK 
};
const char *at_ack[MAX_AT_ACK] = {
    "+OK",
    "OK",                                     // OK
    "+VERSION=JDY-31-V1.35,Bluetooth V3.0",  // +VERSION=<version>
    "+CONNECTED",
    "+DISCONNECT",
    "+NAME=JDY-31-SPP",    // +NAME=<name>
    "+BAUD=8",             // +BAUD=<Param> | 4-9600,5-19200,6-38400,7-57600,8-115200,9-128000
    "+LADDR=18517F7D07D1"  // +LADDR:<mac_addr>
};
#endif


void airAckParse(char *uk);
void airDisconnect();
void UART4_IRQHandler (void) __attribute__ ((interrupt ("WCH-Interrupt-fast")));

void UART4_Cfg (uint32_t spd) {
    GPIO_InitTypeDef GPIO_InitStructure = {0};
    USART_InitTypeDef USART_InitStructure = {0};
    NVIC_InitTypeDef NVIC_InitStructure = {0};

    RCC_APB1PeriphClockCmd (RCC_APB1Periph_UART4, ENABLE);
    RCC_APB2PeriphClockCmd (RCC_APB2Periph_GPIOC, ENABLE);

    /* UART4 TX-->PC.10   RX-->PC.11 */
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_Init (GPIOC, &GPIO_InitStructure);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_Init (GPIOC, &GPIO_InitStructure);

    USART_InitStructure.USART_BaudRate = spd;  // 115200;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits = USART_StopBits_1;
    USART_InitStructure.USART_Parity = USART_Parity_No;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = USART_Mode_Tx | USART_Mode_Rx;

    USART_Init (UART4, &USART_InitStructure);
    USART_ITConfig (UART4, USART_IT_RXNE, ENABLE);

    NVIC_InitStructure.NVIC_IRQChannel = UART4_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init (&NVIC_InitStructure);

    USART_Cmd (UART4, ENABLE);
}

//
void UART4_IRQHandler (void) {
    if (USART_GetITStatus (UART4, USART_IT_RXNE) != RESET) {
        u8 byte = USART_ReceiveData (UART4);
        RxAirBuf[RxAirCnt++] = byte;
        if (RxAirCnt == AIR_BUF_SIZE)
            RxAirCnt = 0;
        if (byte == 0x0a) {
            if (strlen ((char *)RxAirBuf)) printf ("%s", RxAirBuf);
            airAckParse(RxAirBuf);
            memset (RxAirBuf, 0, AIR_BUF_SIZE);
            RxAirCnt = 0;
        }
    }
}
//
void putAirBuf (char *buf, int len) {
    char *ukz = NULL;

    if ((ukz = strchr (buf, '\n'))) {
        *ukz = '\0';
        strcat (buf, "\r\n");
        len++;
    }
    for (int i = 0; i < len; i++) {
        while (USART_GetFlagStatus (UART4, USART_FLAG_TXE) == RESET);
        USART_SendData (UART4, *buf++);
    }
}
//
void airWrite(int8_t cd, char *str, bool prn)
{
    if (!str) {
        if ((cd <= iNone) || (cd >= iLast)) return;
    }

    char *uks = at_cmd[cd];
    int len = strlen (at_cmd[cd]);
    //air_ack_wait = 1;
    //txDoneFlagAir = 0;
    if (str) {
        uks = str;
        char *ukz = NULL;
        if ((ukz = strchr (uks, '\n'))) {
            *ukz = '\0';
            strcat (uks, "\r\n");
            len = strlen (uks);
        }
    }
    if (prn) printf("%s", uks);
    for (int i = 0; i < len; i++) {
        while (USART_GetFlagStatus (UART4, USART_FLAG_TXE) == RESET);
        USART_SendData (UART4, *uks++);
    }
}
//-----------------------------------------------------------------------------------------
void airAckParse(char *uk)
{
/*
	if (strstr(uk, at_ack[ackCON])) {
		airAck = ackCON;
        airConnect = true;
        tmr_pas = getMS(5000);
	} else if (strstr(uk, at_ack[ackDISC])) {
		airAck = ackDISC;
        airConnect = false;
        tmr_pas = 0;
        yes_pas = false;
	} else if (strstr(uk, airPassword)) {
        if (airConnect) {
            tmr_pas = 0;
            yes_pas = true;
        }
    } else airAck = -1;
*/
    if (strstr(uk, at_ack[ackOk])) {
        airAck = ackOk;
        if (airCmd == iRST) tmr_enIrg = getMS(1500);//putEvt(enIrgEvt, &que);
    } else {
        if (strstr(uk, airPassword)) {
            if (airConnect) {
                tmr_pas = 0;
                yes_pas = true;
            }
        } else airAck = bleNone;
    }
}
//-----------------------------------------------------------------------------------------
void airDisconnect()
{
	if (airConnect) {
		airCmd = iDISC;
		airWrite(airCmd, NULL, true);
	}
}
//-----------------------------------------------------------------------------------------


#endif
