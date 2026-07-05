/********************************** (C) COPYRIGHT  *******************************
 * File Name          : debug.c
 * Author             : WCH
 * Version            : V1.0.0
 * Date               : 2021/06/06
 * Description        : This file contains all the functions prototypes for UART
 *                      Printf , Delay functions.
 *********************************************************************************
 * Copyright (c) 2021 Nanjing Qinheng Microelectronics Co., Ltd.
 * Attention: This software (modified or not) and binary are used for
 * microcontroller manufactured by Nanjing Qinheng Microelectronics.
 *******************************************************************************/
#include "debug.h"

static uint8_t p_us = 0;
static uint16_t p_ms = 0;

#define DEBUG_DATA0_ADDRESS ((volatile uint32_t *)0xE0000380)
#define DEBUG_DATA1_ADDRESS ((volatile uint32_t *)0xE0000384)


u8 RxBuffer[RX_SIZE] = {0};
u8 RxCnt = 0;
USART_TypeDef *portLog = USART1;

// uint32_t reg_pcfr1;

/*********************************************************************
 * @fn      Delay_Init
 *
 * @brief   Initializes Delay Funcation.
 *
 * @return  none
 */
void Delay_Init (void) {
    p_us = SystemCoreClock / 8000000;
    p_ms = (uint16_t)p_us * 1000;
}

/*********************************************************************
 * @fn      Delay_Us
 *
 * @brief   Microsecond Delay Time.
 *
 * @param   n - Microsecond number.
 *
 * @return  None
 */
void Delay_Us (uint32_t n) {
    uint32_t i;

    SysTick->SR &= ~(1 << 0);
    i = (uint32_t)n * p_us;

    SysTick->CMP = i;
    SysTick->CTLR |= (1 << 4);
    SysTick->CTLR |= (1 << 5) | (1 << 0);

    while ((SysTick->SR & (1 << 0)) != (1 << 0));
    SysTick->CTLR &= ~(1 << 0);
}

/*********************************************************************
 * @fn      Delay_Ms
 *
 * @brief   Millisecond Delay Time.
 *
 * @param   n - Millisecond number.
 *
 * @return  None
 */
void Delay_Ms (uint32_t n) {
    uint32_t i;

    SysTick->SR &= ~(1 << 0);
    i = (uint32_t)n * p_ms;

    SysTick->CMP = i;
    SysTick->CTLR |= (1 << 4);
    SysTick->CTLR |= (1 << 5) | (1 << 0);

    while ((SysTick->SR & (1 << 0)) != (1 << 0));
    SysTick->CTLR &= ~(1 << 0);
}

/*********************************************************************
 * @fn      USART_Printf_Init
 *
 * @brief   Initializes the USARTx peripheral.
 *
 * @param   baudrate - USART communication baud rate.
 *
 * @return  None
 */
//
#if (DEBUG == DEBUG_UART1)
int IRQ_DBG = USART1_IRQn;
void USART1_IRQHandler (void) __attribute__ ((interrupt ("WCH-Interrupt-fast")));

void USART1_IRQHandler (void)
#elif (DEBUG == DEBUG_UART2)
int IRQ_DBG = USART2_IRQn;
void USART2_IRQHandler (void) __attribute__ ((interrupt ("WCH-Interrupt-fast")));

void USART2_IRQHandler (void)
#elif (DEBUG == DEBUG_UART3)
int IRQ_DBG = USART3_IRQn;
void USART3_IRQHandler (void) __attribute__ ((interrupt ("WCH-Interrupt-fast")));

void USART3_IRQHandler (void)
#endif
{
    u8 byte = 0;

    if (USART_GetITStatus (portLog, USART_IT_RXNE) != RESET) {
        byte = USART_ReceiveData (portLog);
        if (RxCnt >= RX_SIZE)
            RxCnt = 0;
        RxBuffer[RxCnt++] = byte;
        if (byte == '\n') {
            memset (getBuffer, 0, RX_SIZE);
            memcpy (getBuffer, RxBuffer, RxCnt);
            memset (RxBuffer, 0, RX_SIZE);
            RxCnt = 0;
            putPrnEvt();
        }
    }
}

//
void USART_Printf_Init (uint32_t baudrate) {
    GPIO_InitTypeDef GPIO_InitStructure;
    USART_InitTypeDef USART_InitStructure;
    NVIC_InitTypeDef NVIC_InitStructure = {0};

#if (DEBUG == DEBUG_UART1)
    RCC_APB2PeriphClockCmd (RCC_APB2Periph_USART1 | RCC_APB2Periph_GPIOA, ENABLE);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;  // TX
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_Init (GPIOA, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;  // RX
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_Init (GPIOA, &GPIO_InitStructure);

#elif (DEBUG == DEBUG_UART2)
    RCC_APB1PeriphClockCmd (RCC_APB1Periph_USART2, ENABLE);
    RCC_APB2PeriphClockCmd (RCC_APB2Periph_GPIOA, ENABLE);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_Init (GPIOA, &GPIO_InitStructure);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3;  // RX
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_Init (GPIOA, &GPIO_InitStructure);

#elif (DEBUG == DEBUG_UART3)
    RCC_APB2PeriphClockCmd (RCC_APB2Periph_GPIOB | RCC_APB2Periph_AFIO, ENABLE);
    RCC_APB1PeriphClockCmd (RCC_APB1Periph_USART3, ENABLE);
    GPIO_PinRemapConfig (GPIO_PartialRemap_USART3, ENABLE);
    // reg_pcfr1 = AFIO->PCFR1;


    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;  // Tx
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_Init (GPIOB, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11;  // RX
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_Init (GPIOB, &GPIO_InitStructure);

    // GPIO_PinRemapConfig(GPIO_FullRemap_USART3, ENABLE);

#endif

    USART_InitStructure.USART_BaudRate = baudrate;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits = USART_StopBits_1;
    USART_InitStructure.USART_Parity = USART_Parity_No;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = USART_Mode_Tx | USART_Mode_Rx;
    USART_Init (portLog, &USART_InitStructure);

    USART_ITConfig (portLog, USART_IT_RXNE, ENABLE);
    NVIC_InitStructure.NVIC_IRQChannel = IRQ_DBG;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init (&NVIC_InitStructure);

    USART_Cmd (portLog, ENABLE);

    /**/
    // printf("\n[%s] R32_AFIO_PCFR1=0x%08X\n\n", __func__, AFIO->PCFR1);
    /**/
}

/*********************************************************************
 * @fn      SDI_Printf_Enable
 *
 * @brief   Initializes the SDI printf Function.
 *
 * @param   None
 *
 * @return  None
 */
void SDI_Printf_Enable (void) {
    *(DEBUG_DATA0_ADDRESS) = 0;
    Delay_Init();
    Delay_Ms (1);
}

/*********************************************************************
 * @fn      _write
 *
 * @brief   Support Printf Function
 *
 * @param   *buf - UART send Data.
 *          size - Data length
 *
 * @return  size: Data length
 */
__attribute__ ((used)) int _write (int fd, char *buf, int size) {
    int i = 0;

#if (SDI_PRINT == SDI_PR_OPEN)
    int writeSize = size;

    do {

        /**
         * data0  data1 8 bytes
         * data0 The lowest byte storage length, the maximum is 7
         *
         */

        while ((*(DEBUG_DATA0_ADDRESS) != 0u)) {
        }

        if (writeSize > 7) {
            *(DEBUG_DATA1_ADDRESS) = (*(buf + i + 3)) | (*(buf + i + 4) << 8) | (*(buf + i + 5) << 16) | (*(buf + i + 6) << 24);
            *(DEBUG_DATA0_ADDRESS) = (7u) | (*(buf + i) << 8) | (*(buf + i + 1) << 16) | (*(buf + i + 2) << 24);

            i += 7;
            writeSize -= 7;
        } else {
            *(DEBUG_DATA1_ADDRESS) = (*(buf + i + 3)) | (*(buf + i + 4) << 8) | (*(buf + i + 5) << 16) | (*(buf + i + 6) << 24);
            *(DEBUG_DATA0_ADDRESS) = (writeSize) | (*(buf + i) << 8) | (*(buf + i + 1) << 16) | (*(buf + i + 2) << 24);

            writeSize = 0;
        }

    } while (writeSize);


#else
    for (i = 0; i < size; i++) {
#if (DEBUG == DEBUG_UART1)
        while (USART_GetFlagStatus(portLog, USART_FLAG_TC) == RESET);
        USART_SendData (portLog, *buf++);
#elif (DEBUG == DEBUG_UART2)
        while (USART_GetFlagStatus (portLog, USART_FLAG_TC) == RESET);
        USART_SendData (portLog, *buf++);
#elif (DEBUG == DEBUG_UART3)
        while (USART_GetFlagStatus (portLog, USART_FLAG_TC) == RESET);
        USART_SendData (portLog, *buf++);
#endif
    }
#endif
    return size;
}

/*********************************************************************
 * @fn      _sbrk
 *
 * @brief   Change the spatial position of data segment.
 *
 * @return  size: Data length
 */
__attribute__ ((used)) void *_sbrk (ptrdiff_t incr) {
    extern char _end[];
    extern char _heap_end[];
    static char *curbrk = _end;

    if ((curbrk + incr < _end) || (curbrk + incr > _heap_end))
        return NULL - 1;

    curbrk += incr;
    return curbrk - incr;
}
