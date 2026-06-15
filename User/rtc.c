#include "rtc.h"
#include "func.h"

#ifdef SET_RTC_USE

uint8_t rtc_err = 0;
_calendar_obj calendar;

const uint8_t table_week[12] = {0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5};
const uint8_t mon_table[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

//-----------------------------------------------------------------------------
static void RTC_NVIC_Config(void)
{
        NVIC_InitTypeDef NVIC_InitStructure = {0};

        NVIC_InitStructure.NVIC_IRQChannel = RTC_IRQn;
        NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
        NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
        NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
        
        NVIC_Init(&NVIC_InitStructure);
}
//-----------------------------------------------------------------------------
uint8_t Is_Leap_Year(uint16_t year)
{
    if (year % 4 == 0) {
        if (year % 100 == 0) {
            if (year % 400 == 0) return 1;
                            else return 0;
        } else return 1;
    } else return 0;
}
//-----------------------------------------------------------------------------
uint8_t RTC_Set(uint16_t syear, uint8_t smon, uint8_t sday, uint8_t hour, uint8_t min, uint8_t sec)
{
uint16_t t;
uint32_t seccount = 0;

    if (syear < 1970 || syear > 2099) return 1;
    for (t = 1970; t < syear; t++) {
        if (Is_Leap_Year(t)) seccount += 31622400;
                        else seccount += 31536000;
    }
    smon -= 1;
    for (t = 0; t < smon; t++) {
        seccount += (uint32_t)mon_table[t] * 86400;
        if (Is_Leap_Year(syear) && t == 1) seccount += 86400;
    }
    seccount += (uint32_t)(sday - 1) * 86400;
    seccount += (uint32_t)hour * 3600;
    seccount += (uint32_t)min * 60;
    seccount += sec;

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR | RCC_APB1Periph_BKP, ENABLE);
    PWR_BackupAccessCmd(ENABLE);
    RTC_SetCounter(seccount);
    RTC_WaitForLastTask();

    return 0;
}
//-----------------------------------------------------------------------------
uint8_t RTC_SetSec(uint32_t sec)
{
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR | RCC_APB1Periph_BKP, ENABLE);
    PWR_BackupAccessCmd(ENABLE);
    RTC_SetCounter(sec);
    RTC_WaitForLastTask();

    return 0;
}
//-----------------------------------------------------------------------------
uint8_t RTC_Get_Week(uint16_t year, uint8_t month, uint8_t day)
{
uint16_t temp2;
uint8_t  yearH, yearL;

    yearH = year / 100;
    yearL = year % 100;
    if (yearH > 19) yearL += 100;
    temp2 = yearL + yearL / 4;
    temp2 = temp2 % 7;
    temp2 = temp2 + day + table_week[month - 1];
    if (yearL % 4 == 0 && month < 3) temp2--;
    
    return (temp2 % 7);
}
//-----------------------------------------------------------------------------
uint8_t RTC_Get(void)
{
static uint16_t daycnt = 0;
uint32_t        timecount = 0;
uint32_t        temp = 0;
uint16_t        temp1 = 0;

    timecount = RTC_GetCounter();
    temp = timecount / 86400;
    if (daycnt != temp) {
        daycnt = temp;
        temp1 = 1970;
        while (temp >= 365) {
            if (Is_Leap_Year(temp1)) {
                if (temp >= 366) temp -= 366;
                            else break;
            } else temp -= 365;
            temp1++;
        }
        calendar.w_year = temp1;
        temp1 = 0;
        while (temp >= 28) {
            if (Is_Leap_Year(calendar.w_year) && temp1 == 1) {
                if (temp >= 29) temp -= 29;
                           else break;
            } else {
                if (temp >= mon_table[temp1]) temp -= mon_table[temp1];
                                         else break;
            }
            temp1++;
        }
        calendar.w_month = temp1 + 1;
        calendar.w_date = temp + 1;
    }
    temp = timecount % 86400;
    calendar.hour = temp / 3600;
    calendar.min = (temp % 3600) / 60;
    calendar.sec = (temp % 3600) % 60;
    calendar.week = RTC_Get_Week(calendar.w_year, calendar.w_month, calendar.w_date);
        
    return 0;
}
//-----------------------------------------------------------------------------
uint8_t RTC_Init(void)
{
uint8_t temp = 0;

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR | RCC_APB1Periph_BKP, ENABLE);
    PWR_BackupAccessCmd(ENABLE);
    //RTC_ClearITPendingBit(RTC_IT_ALR);
    RTC_ClearITPendingBit(RTC_IT_SEC);
    // Is it the first configuration

    BKP_DeInit();
    RCC_LSEConfig(RCC_LSE_ON);
    while ((RCC_GetFlagStatus(RCC_FLAG_LSERDY) == RESET) && (temp < 250)) {
        temp++;
        Delay_MS(20);
    }
    if (temp >= 250) return temp;
    RCC_RTCCLKConfig(RCC_RTCCLKSource_LSE);//RCC_RTCCLKSource_HSE_Div128);//RCC_RTCCLKSource_LSE);
    RCC_RTCCLKCmd(ENABLE);
    RTC_WaitForLastTask();
    RTC_WaitForSynchro();
    RTC_ITConfig(RTC_IT_SEC, ENABLE);//RTC_ITConfig(RTC_IT_ALR, ENABLE);
    RTC_WaitForLastTask();

    RTC_EnterConfigMode();
    RTC_SetPrescaler(32767);
    RTC_WaitForLastTask();
    RTC_SetCounter(epoch + TZ);//
    //RTC_Set(2025, 01, 04, 12, 48, 00); // Setup Time - //RTC_SetSec(epoch);//RTC_Set(2025, 03, 11, 14, 20, 59); /* Setup Time */
    RTC_ExitConfigMode();

    BKP_WriteBackupRegister(BKP_DR1, 0xA1A1);

    RTC_NVIC_Config();
    RTC_Get();

    return 0;
}
//-----------------------------------------------------------------------------
uint8_t RTC_Alarm_Set(uint16_t syear, uint8_t smon, uint8_t sday, uint8_t hour, uint8_t min, uint8_t sec)
{
uint16_t t;
uint32_t seccount = 0;

    if (syear < 1970 || syear > 2099) return 1;
    for (t = 1970; t < syear; t++) {
        if (Is_Leap_Year(t)) seccount += 31622400;
                        else seccount += 31536000;
    }
    smon -= 1;
    for (t = 0; t < smon; t++) {
        seccount += (uint32_t)mon_table[t] * 86400;
        if (Is_Leap_Year(syear) && t == 1) seccount += 86400;
    }
    seccount += (uint32_t)(sday - 1) * 86400;
    seccount += (uint32_t)hour * 3600;
    seccount += (uint32_t)min * 60;
    seccount += sec;

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR | RCC_APB1Periph_BKP, ENABLE);
    PWR_BackupAccessCmd(ENABLE);
    //RTC_SetAlarm(seccount);
    RTC_WaitForLastTask();

    return 0;
}
//-----------------------------------------------------------------------------
void RTC_IRQHandler(void) __attribute__((interrupt("WCH-Interrupt-fast")));
void RTC_IRQHandler(void)
{
    if(RTC_GetITStatus(RTC_IT_SEC) != RESET) // Seconds interrupt
    {
        RTC_Get();
    }
    /*if(RTC_GetITStatus(RTC_IT_ALR) != RESET) // Alarm clock interrupt
    {
        RTC_ClearITPendingBit(RTC_IT_ALR);
        RTC_Get();
    }*/

    RTC_ClearITPendingBit(RTC_IT_SEC | RTC_IT_OW);// | RTC_IT_ALR);
    RTC_WaitForLastTask();
}



#endif
