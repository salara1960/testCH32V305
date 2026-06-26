/********************************** (C) COPYRIGHT *******************************
* File Name          : ch32v30x_it.c
* Author             : WCH
* Version            : V1.0.0
* Date               : 2024/03/06
* Description        : Main Interrupt Service Routines.
*********************************************************************************
* Copyright (c) 2021 Nanjing Qinheng Microelectronics Co., Ltd.
* Attention: This software (modified or not) and binary are used for 
* microcontroller manufactured by Nanjing Qinheng Microelectronics.
*******************************************************************************/
#include "ch32v30x_it.h"
#include "func.h"

//#define SET_RTC_MODULE

void NMI_Handler(void) __attribute__((interrupt("WCH-Interrupt-fast")));
void HardFault_Handler(void) __attribute__((interrupt("WCH-Interrupt-fast")));
#ifdef SET_RTC_MODULE
    void RTC_IRQHandler(void) __attribute__((interrupt("WCH-Interrupt-fast")));
#endif


/*********************************************************************
 * @fn      NMI_Handler
 *
 * @brief   This function handles NMI exception.
 *
 * @return  none
 */
void NMI_Handler(void)
{
  while (1)
  {
  }
}

/*********************************************************************
 * @fn      HardFault_Handler
 *
 * @brief   This function handles Hard Fault exception.
 *
 * @return  none
 */
void HardFault_Handler(void)
{
  NVIC_SystemReset();
  int ld = 0;
  while (1)
  {
    GPIO_WriteBit(GPIOA, GPIO_Pin_3, (!ld) ? (ld = Bit_SET) : (ld = Bit_RESET));
    Delay_MS(200);
  }
}
//
#ifdef SET_BLE_STAT_PIN
    void EXTI4_IRQHandler(void) __attribute__((interrupt("WCH-Interrupt-fast")));
    //
    void EXTI4_IRQHandler(void)
    {
        if (en_irg) {
            ble_ack_con = GPIO_ReadInputDataBit(GPIOC, BLE_STAT_PIN);// 1:rising-connect,0:falling-disconnect
            //printf("PC4=%d\n", ble_ack_con);
            putEvt(bleEvt, &que);
        }
        if (EXTI_GetITStatus(EXTI_Line4) != RESET) EXTI_ClearITPendingBit(EXTI_Line4); // Clear Flag
    }
#endif

#ifdef SET_RTC_MODULE
void RTC_IRQHandler(void)
{
    if(RTC_GetITStatus(RTC_IT_SEC) != RESET) // Seconds interrupt
    {
        RTC_Get();
    }
    if(RTC_GetITStatus(RTC_IT_ALR) != RESET) // Alarm clock interrupt
    {
        RTC_ClearITPendingBit(RTC_IT_ALR);
        RTC_Get();
    }

    RTC_ClearITPendingBit(RTC_IT_SEC | RTC_IT_OW);
    RTC_WaitForLastTask();
}
#endif



