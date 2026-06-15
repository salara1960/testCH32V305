#ifndef __RTC_H_
#define __RTC_H_

#include "hdr.h"

#ifdef SET_RTC_USE

	typedef struct {
    	vu8 hour;
    	vu8 min;
    	vu8 sec;

    	vu16 w_year;
    	vu8  w_month;
    	vu8  w_date;
    	vu8  week;
	} _calendar_obj;

	extern uint32_t TZ;
    extern uint8_t rtc_err;
    extern _calendar_obj calendar;

    uint8_t RTC_SetSec(uint32_t sec);
    uint8_t RTC_Get(void);
    uint8_t RTC_Init(void);

	extern void Delay_MS(uint32_t ms);

#endif

#endif
