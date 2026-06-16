/********************************** (C) COPYRIGHT *******************************
* File Name          : main.c
* Author             : WCH
* Version            : V1.0.0
* Date               : 2021/06/06
* Description        : Main program body.
*********************************************************************************
* Copyright (c) 2021 Nanjing Qinheng Microelectronics Co., Ltd.
* Attention: This software (modified or not) and binary are used for 
* microcontroller manufactured by Nanjing Qinheng Microelectronics.
*******************************************************************************/

/*
 *@Note
 USART Print debugging routine:
 USART1_Tx(PA9).
 USART1_Rx(PA10 with interrupt) 
*/

#include "func.h"


/* Global typedef */

/* Global define */

/* Global Variable */

/*********************************************************************
 * @fn      main
 *
 * @brief   Main program.
 *
 * @return  none
 */
int main(void)
{
	cid = DBGMCU_GetCHIPID();

	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	SystemCoreClockUpdate();

	Delay_Init();
	TIM1_Init();
	GPIOx_init();

	queFlag = initEvt(&que);
	
	USART_Printf_Init(115200);	

	uint16_t Y = 32, X = 8;
	char screen[32] = {0};
    lcd_init();
	LCD_Fill_Fast(0, 0, LCD_W, Y - 1, BLUE);
	LCD_Fill_Fast(0, LCD_H - Y - 1, LCD_W, LCD_H, RED);
	

#ifdef SET_RTC_USE
    	rtc_err = RTC_Init();
#endif

#ifdef SET_ADC
	u16 ADC_val;
	adc_mode = true;
	ADC_Function_Init(adc_mode);
	if (!adc_mode) adc_channel = ADC_Channel_TempSensor;
	uint32_t start_adc = getMS(2);
#endif

#ifdef SET_I2C_DEV
	IIC_Init(BMx280_SPEED, BMx280_ADDR);

	const uint32_t wait_next = 50; // 50 msec
	uint32_t tmr_sens = 0;
	uint16_t d_size = 6;
	int32_t stemp = 0, spres = 0, shumi = 0;
	uint8_t data_rdx[DATA_LENGTH] = {0};
	evt_t evt_sens = noneEvt;
	bmp280_ok = i2c_master_reset_sensor(&sid);
	if (bmp280_ok) {
		regs.id = sid;
		evt_sens = sensStartEvt;
		tmr_sens = getMS(wait_next >> 1);
		if (sid == BME280_SENSOR) d_size = 8;
	}
#endif

#ifdef SET_BIG_PIC
	crc_pic = ks32(0, gImage_test, PIC_SIZE);
#endif

printf("\r\n");

#ifdef SET_FMRAM
	SPI_Flash_Init();
    fm_id = SPI_Flash_ReadID();
	uint32_t fm_adr = START_PIC_ADDR;
    switch (fm_id) {
		case FM25V10:
		case FM25V20:
		case FM25V40:
			fm_adr_time = sizeof(pic_info_t);
		break;
	}
	short fm_val = -1;
	uint16_t fm_len = 0;
	bool crc_calc = false;
	//
	#ifdef SET_BIG_PIC	
		LCD_ShowPicture_Fast(29, 38, 182, 144, gImage_test);
		Delay_MS(50);
		ClrFMRAM(fm_id);
		Delay_MS(50);
		putPic(gImage_test, fm_adr, PIC_SIZE);
	#else
		putEvt(picEvt, &que);	
	#endif
	//
	crc_fm = get_crcFMRAM(fm_adr, PIC_SIZE);
	//
	if (fm_adr_time > 0) {
		uint32_t ep = 0;
		SPI_Flash_Read((uint8_t *)&ep, fm_adr_time, (uint16_t)sizeof(uint32_t));
		if (epoch > ep) {
			ep = epoch;
			SPI_Flash_Write((uint8_t *)&ep, fm_adr_time, (uint16_t)sizeof(uint32_t));
		}
		if (ep != 0xffffffff) {
			epoch = ep;
			RTC_SetCounter(epoch + TZ);
			Delay_MS(10);
		}
	}
	//
#endif

#ifdef SET_AIR_MODULE
	UART4_Cfg(115200);
	uint32_t air_rst = getMS(2000);
#endif

	result_t lsens = {0.0, 0.0, 0.0};
	uint8_t reboot_flag = 0;
	bool first = true;
	char *uk = NULL;
	prn_msg(0);

	while (queFlag) {

		if (reboot_flag) break;

		if (tmr_sens) {
			if (checkMS(tmr_sens)) {
				tmr_sens = 0;
				if (evt_sens != noneEvt) putEvt(evt_sens, &que);
			}
		}

		if (air_rst) {
			if (checkMS(air_rst)) {
				air_rst = 0;
				airCmd = iRST;
				airWrite(airCmd, NULL, true);
			}
		}

		if (tmr_pas && !yes_pas) {
			if (checkMS(tmr_pas)) {
				tmr_pas = 0;
				airDisconnect();
			}
		}

		evt = getEvt(&que);
		switch (evt) {
			case prnEvt:
				printf("%s", getBuffer);
				if (strstr((char *)getBuffer,"halt")) {
					reboot_flag = 2;
				} else if (strstr((char *)getBuffer,"reboot")) {
					reboot_flag = 1;
				} else if ((uk = strstr((char *)getBuffer,"epoch="))) {
					uk += 6;
					uint32_t ep = atol(uk);
					if (ep > epoch) {
						epoch = ep;
#ifdef SET_RTC_USE
						RTC_SetCounter(epoch + TZ);//
#endif
						putEvt(wrtimeEvt, &que);					
					}
				} else if (strstr((char *)getBuffer,"help")) {
					help();
				}
#ifdef SET_FMRAM					
				 else if ((uk = strstr((char *)getBuffer,"read="))) {//read=0:256				 
					uk += 5;
					fm_adr = atol(uk);
					if ((fm_adr >= 0) && (fm_adr < fm_deep)) {
						char *uki = NULL;
						fm_len = PAGE_SIZE;
						if ((uki = strchr(uk, ':'))) {
							uki++;
							fm_len = atol(uki);
							if (fm_len > 2048) fm_len = 2048;
						}
						putEvt(rdEvt, &que);
					}
				} else if ((uk = strstr((char *)getBuffer,"write="))) {//write=0:255:256
					uk += 6;
					fm_adr = atol(uk);
					if ((fm_adr >= 0) && (fm_adr < fm_deep)) {
						char *uki = NULL;
						fm_val = -1;
						if ((uki = strchr(uk, ':'))) {
							uki++;
							fm_val = atol(uki);
							fm_len = PAGE_SIZE;
							if ((uk = strchr(uki, ':'))) {
								uk++;
								fm_len = atol(uk);
								if (fm_len > 2048) fm_len = 2048;
							}
						}
						putEvt(wrEvt, &que);
					}
				} else if (strstr((char *)getBuffer,"pic")) {
					putEvt(picEvt, &que);
				} else if (strstr((char *)getBuffer,"crc")) {
					if ((uk = strchr((char *)getBuffer, '='))) {
						uk++;
						fm_adr = atol(uk);
						if ((fm_adr >= 0) && (fm_adr < fm_deep)) {
							char *uki = NULL;
							fm_len = PAGE_SIZE;
							if ((uki = strchr(uk, ':'))) {
								uki++;
								fm_len = atol(uki);
								crc_calc = true;
							}
						}
					}
					putEvt(crcEvt, &que);
				}
#endif				
#ifdef SET_AIR_MODULE
				 else if ( ((uk = strstr((char *)getBuffer,"air="))) ||
				 				((uk = strstr((char *)getBuffer,"AIR="))) ) {//air=AT\r\n
				 	uk += 4;
					putAirBuf(uk, strlen(uk));
				 }
#endif
			break;
			case wrtimeEvt:
#ifdef SET_FMRAM
				if (fm_adr_time > 0) {
					SPI_Flash_Write((uint8_t *)&epoch, fm_adr_time, (uint16_t)sizeof(uint32_t));
					putEvt(msgEvt, &que);
				}
#endif			
			break;
			case crcEvt:
			{
#ifdef SET_BIG_PIC
				crc_pic = ks32(0, gImage_test, PIC_SIZE);
#endif
#ifdef SET_FMRAM
				char stz[16] = {0};	
				if (gImage_test) sprintf(stz, " PIC=0x%04X", crc_pic);
				if (crc_calc) {
					crc_calc = false;
					uint32_t crc = get_crcFMRAM(fm_adr, fm_len);
					printf("CRC: FMRAM[0x%X..0x%X]=0x%04X%s\n", fm_adr, fm_adr + fm_len - 1, crc, stz);
				} else {
					crc_fm = get_crcFMRAM(fm_adr, PIC_SIZE);
					printf("CRC: PIC_FMRAM=0x%04X%s\n", crc_fm, stz);
				}
#endif
			}
			break;
			case picEvt:
#ifdef SET_FMRAM
				if (checkPicInFMRAM()) {			
					LCD_Fill_Fast(0, 32, LCD_W, LCD_H - 32, WHITE);
					LCD_ShowPicture_FMRAM(29, 38, 182, 144);
				}
#endif
				if (first) {
					first = false;
					sprintf(screen, "%s", ChipName(cid));
					LCD_WriteString(X,
									LCD_H - Y - bigFont->height,// - 4,
									mkLineCenter(screen, LCD_W / bigFont->width),
									*bigFont,
									DARKBLUE,
									WHITE);
				}
			break;
			case secEvt:
				calcTime(RTC_GetCounter(), screen);
				LCD_WriteString(4, 4, mkLineCenter(screen, LCD_W / bigFont->width), *bigFont, WHITE, BLUE);
			break;
        	case msgEvt:	
#ifdef SET_RTC_USE
                if (!rtc_err) {
                    RTC_Get();
					prn_msg(0);
                } else {
					prn_msg(get_sec(0));
				}
#else
			    prn_msg(get_sec(0));
#endif
			break;
			case rdEvt:
#ifdef SET_FMRAM
			{
				uint8_t *rd_page = (uint8_t *)calloc(1, fm_len);
				if (rd_page) {
					printf("Read: addr=%u len=%u\n", fm_adr, fm_len);
					SPI_Flash_Read(rd_page, fm_adr, fm_len);
					prnBuffer(fm_adr, rd_page, fm_len, 32);
				}
			}
#endif
			break;
			case wrEvt:
#ifdef SET_FMRAM
			{
				uint8_t *wr_page = (uint8_t *)calloc(1, fm_len);
				if (wr_page) {
					printf("Write: addr=%u len=%u val=%d\n", fm_adr, fm_len, fm_val);
					if (fm_val == -1) 
						for (uint16_t i = 0; i < fm_len; i++) wr_page[i] = (uint8_t)i;
					else
						memset(wr_page, (uint8_t)fm_val, fm_len);
					SPI_Flash_Write(wr_page, fm_adr, fm_len);
					prnBuffer(fm_adr, wr_page, fm_len, 32);
				}
			}
#endif
			break;			
			case rfEvt:
			case ffEvt:
#ifdef SET_RF_433			
				printf("%s | Interrupt by %s front\r\n", calcTime(0, tp), (evt == rfEvt) ? "Rising" : "Falling");
#endif
				evt = noneEvt;
			break;
			case adcEvt:
#ifdef SET_ADC
				if (Get_ADC_Average(adc_channel, &ADC_val)) {
					ADC_val = Get_ConversionVal(ADC_val);
					vcc = (ADC_val * 3300 / 4096);
					if (!adc_mode) temp = TempSensor_Volt_To_Temper(vcc);
					start_adc = getMS(75);//111);
				} else {
					again_flag = 1;
				}
#else
				evt = noneEvt;
#endif
			break;
			case sensStartEvt:
#ifdef SET_I2C_DEV			
				i2c_master_test_sensor(&regs);
				evt_sens = sensNextEvt;
				tmr_sens = getMS(wait_next); 
#endif
			break;
			case sensNextEvt:
#ifdef SET_I2C_DEV
				regs.stat &= 0x0f;
				memset(data_rdx, 0, DATA_LENGTH);
				if (!i2c_master_read_sensor(BMP280_REG_PRESSURE, data_rdx, d_size)) {
					if (!bmx280_readCalibrationData(sid)) {
						evt_sens = sensReadyEvt;
						tmr_sens = getMS(wait_next);
					}
				}
#endif
			break;
			case sensReadyEvt:
#ifdef SET_I2C_DEV
				spres = stemp = 0; shumi = 0;
				spres = (data_rdx[0] << 12) | (data_rdx[1] << 4) | (data_rdx[2] >> 4);
				stemp = (data_rdx[3] << 12) | (data_rdx[4] << 4) | (data_rdx[5] >> 4);
				if (sid == BME280_SENSOR) shumi = (data_rdx[6] << 8) | data_rdx[7];
				bmx280_CalcAll(&sens, sid, stemp, spres, shumi);
				evt_sens = sensStartEvt;
				tmr_sens = getMS(wait_next << 1);
				sensReady = true;
				//
				if ((lsens.temp != sens.temp) ||
						(lsens.pres != sens.pres) || 
							(lsens.humi != sens.humi)) {     
					memcpy((u8 *)&lsens, (u8 *)&sens, sizeof(result_t));
            		sprintf(screen,"%lu\"C | %lummHg", lroundf(lsens.temp), lroundf(lsens.pres));
					if (sid == BME280_SENSOR) sprintf(screen+strlen(screen), " | %lu%%", lroundf(lsens.humi));
					LCD_WriteString(8, 
									LCD_H - midFont->height - 4,
									mkLineCenter(screen, LCD_W / midFont->width), 
									*midFont, 
									WHITE,
									RED);
				}
#endif
			break;
		}//switch(evt)
		
#ifdef SET_ADC
		if (start_adc) {
			if (checkMS(start_adc)) {
				start_adc = 0;
				again_flag = 1;
			}
		}
#endif
		//
		Delay_MS(1);
		//
	}

	epoch = RTC_GetCounter() - TZ;
	if (fm_adr_time > 0) { 
		SPI_Flash_Write((uint8_t *)&epoch, fm_adr_time, (uint16_t)sizeof(uint32_t));
		Delay_MS(250);
	}
	if (reboot_flag == 1) {
		NVIC_SystemReset();
	} else if (reboot_flag == 2) {
		LCD_OFF();
		PWR_EnterSTANDBYMode();
	}
	
	GPIO_WriteBit(GPIOA, GPIO_Pin_3, Bit_RESET);
	printf("!!! Error init queue !!!\r\n");
	LOOP_FOREVER();

}

