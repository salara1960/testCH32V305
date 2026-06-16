/*
 * hrd.h
 *
 *  Created on: Jan 03, 2026
 *      Author: alarm
 */

#ifndef USER_HDR_H_
#define USER_HDR_H_


#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdarg.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <time.h>
#include <unistd.h>
#include <machine/endian.h>
#include "string.h"
#include "debug.h"
#include "func.h"
#include "lcd.h"
#include "fonts.h"


#define SET_ADC
#define SET_RTC_USE
#define SET_I2C_DEV
//#define SET_FMRAM <- move to compile command
//#define SET_BIG_PIC //<- move to compile command 
#ifdef SET_FMRAM
	#define START_PIC_ADDR 16
	#define PIC_IN_FMRAM
#endif

#ifdef SET_RTC_USE
	extern volatile uint32_t epoch;
	#include "rtc.h"
#endif

#ifdef SET_I2C_DEV
	#include "i2c.h"
#endif

#ifdef SET_FMRAM
	#include "fmram.h"
#endif

#ifdef SET_AIR_MODULE
	#include "air.h"
#endif


#define HTONS(x) ((uint16_t)((x >> 8) | ((x << 8) & 0xff00)))
#define LOOP_FOREVER() while(1) { Delay_Ms(1); }

enum {
	noneEvt = -1,
	rstEvt,
	rfEvt,
	ffEvt,
	secEvt,
	msgEvt,
	adcEvt, //start adc temp channel
	sensStartEvt,
	sensNextEvt,
	sensReadyEvt,
	prnEvt,
	rdEvt,
	wrEvt,
	crcEvt,
	picEvt,
	wrtimeEvt,
	errEvt,
};

#endif /* USER_HDR_H_ */
