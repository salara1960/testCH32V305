#include "func.h"

// const char *ver = "ver.0.2";// 07.01 12:33:10
// const char *ver = "ver.0.3";// 07.01 16:30:45
// const char *ver = "ver.0.4";// 07.01 18:35:00
// const char *ver = "ver.0.5";// 08.01 16:43:00
// const char *ver = "ver.0.6 09.05.26";// 08.01 16:43:00
// const char *ver = "ver.0.7 21.05.26";
// const char *ver = "ver.0.8 22.05.26";
// const char *ver = "ver.0.9 23.05.26";
// const char *ver = "ver.1.0 24.05.26";
//const char *ver = "ver.1.1 25.05.26";
//const char *ver = "ver.1.2 28.05.26";
//const char *ver = "ver.1.3 30.05.26";
//const char *ver = "ver.1.4 31.05.26";
//const char *ver = "ver.1.5 11.06.26";
//const char *ver = "ver.1.6 12.06.26";
//const char *ver = "ver.1.7 14.06.26";
const char *ver = "ver.1.8 15.06.26";



const char *eol = "\n";

u8 getBuffer[RX_SIZE];
volatile uint8_t again_flag = 0;
s_recq_t que;
bool queFlag = false;
evt_t evt = noneEvt;
volatile uint32_t epoch = 1781515199;
//1781452255;//1781252806;//1781168930;//1780325733;//1780227269;//1780147283; 
//1779952999;//1779740360;// 1779618399;//1779540639;//1778309280;//1767443364;
uint32_t TZ = 2 * 60 * 60;
volatile uint32_t _ms = 0;
volatile uint32_t seconda = 0;
uint16_t arr = 40 - 1;
uint16_t psc = 71 - 1;  // 354 - 1;//48000 - 1;
u32 cid = 0;
int led = 0;
u8 show = 0;
uint32_t crc_pic, crc_fm;


bool rf_flag = false;

#ifdef SET_ADC
    s16 Calibrattion_Val = 0;
#endif
s32 vcc = -1;
float temp = -1.0;                // s32 temp = -1;
bool adc_mode = false;            // true - vcc, false - temp
u8 adc_channel = ADC_Channel_15;  // for adc_mode=true;
u8 deep = MAX_DEEP;
u8 item_adc = 0;
u16 adcBuf[MAX_DEEP] = {0};

bool bmp280_ok = false;
#ifdef SET_I2C_DEV
    u32 bound;
    u8 sid = 0;
    bool sensReady = false;
#endif

uint16_t fm_id = 0;
#ifdef SET_FMRAM
    SPI_TypeDef *portFMRAM = SPI1;
    uint32_t fm_deep = 0;

    uint32_t blk_addr = START_PIC_ADDR;
    uint32_t blk_num = 0;
    uint32_t blk_cur = 0;
    uint8_t *blk_mem = NULL;
#endif

//--------------------------------------------------------------------

static const uint32_t crc32_tab[256] = {
0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f, 0xe963a535, 0x9e6495a3,
0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988, 0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91,
0x1db71064, 0x6ab020f2, 0xf3b97148, 0x84be41de, 0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec, 0x14015c4f, 0x63066cd9, 0xfa0f3d63, 0x8d080df5,
0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172, 0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,
0x35b5a8fa, 0x42b2986c, 0xdbbbc9d6, 0xacbcf940, 0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116, 0x21b4f4b5, 0x56b3c423, 0xcfba9599, 0xb8bda50f,
0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924, 0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,
0x76dc4190, 0x01db7106, 0x98d220bc, 0xefd5102a, 0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818, 0x7f6a0dbb, 0x086d3d2d, 0x91646c97, 0xe6635c01,
0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e, 0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457,
0x65b0d9c6, 0x12b7e950, 0x8bbeb8ea, 0xfcb9887c, 0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2, 0x4adfa541, 0x3dd895d7, 0xa4d1c46d, 0xd3d6f4fb,
0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0, 0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9,
0x5005713c, 0x270241aa, 0xbe0b1010, 0xc90c2086, 0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4, 0x59b33d17, 0x2eb40d81, 0xb7bd5c3b, 0xc0ba6cad,
0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a, 0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683,
0xe3630b12, 0x94643b84, 0x0d6d6a3e, 0x7a6a5aa8, 0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe, 0xf762575d, 0x806567cb, 0x196c3671, 0x6e6b06e7,
0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc, 0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5,
0xd6d6a3e8, 0xa1d1937e, 0x38d8c2c4, 0x4fdff252, 0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60, 0xdf60efc3, 0xa867df55, 0x316e8eef, 0x4669be79,
0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236, 0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f,
0xc5ba3bbe, 0xb2bd0b28, 0x2bb45a92, 0x5cb36a04, 0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a, 0x9c0906a9, 0xeb0e363f, 0x72076785, 0x05005713,
0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38, 0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21,
0x86d3d2d4, 0xf1d4e242, 0x68ddb3f8, 0x1fda836e, 0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c, 0x8f659eff, 0xf862ae69, 0x616bffd3, 0x166ccf45,
0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2, 0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db,
0xaed16a4a, 0xd9d65adc, 0x40df0b66, 0x37d83bf0, 0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6, 0xbad03605, 0xcdd70693, 0x54de5729, 0x23d967bf,
0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94, 0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d
};
//  §®§Ñ§Ü§â§à§ã §Õ§Ý§ñ §á§â§à§Þ§Ö§Ø§å§ä§à§é§ß§à§Ô§à §á§à§Õ§ã§é§Ö§ä§Ñ §Ü§à§ß§ä§â§à§Ý§î§ß§à§Û §ã§å§Þ§Þ§í CRC32
#define CRC32(crc, ch) ((crc >> 8) ^ crc32_tab[(crc ^ (ch)) & 0xff])
//
uint32_t ks32(const uint32_t crc_origin, const uint8_t *buf, const uint32_t size)
{
uint32_t crc = ~crc_origin;
const uint8_t *p = buf;

    if (!buf || !size) return ~crc;

    for (uint32_t i = 0; i < size; i++) crc = CRC32(crc, *p++);

    return ~crc;
}

//--------------------------------------------------------------------
static char *sensName (uint8_t id) {
    switch (id) {
    case 0x58:
        return "BMP280";
    case 0x60:
        return "BME280";
    }
    return "Unknown";
}

//-----------------------------------------------------------------------------------------
//        §¶§å§ß§Ü§è§Ú§ñ §Ú§ß§Ú§è§Ú§Ñ§Ý§Ú§Ù§Ñ§è§Ú§Ú §à§é§Ö§â§Ö§Õ§Ú §ã§à§à§Ò§ë§Ö§ß§Ú§Û
//
bool initEvt (s_recq_t *q) {
    q->put = q->get = 0;
    // q->cnt = 0;
    for (uint8_t i = 0; i < MAX_QREC; i++) {
        q->rec[i].id = i;
        q->rec[i].evt = noneEvt;
    }

    return true;
}

//
int8_t putEvt (evt_t ev, s_recq_t *q) {
    int8_t ret = -1;

    if (q->rec[q->put].evt == noneEvt) {
        q->rec[q->put].evt = ev;
        ret = q->rec[q->put].id;
        q->put++;
        if (q->put >= MAX_QREC)
            q->put = 0;
        // q->cnt++;
    }

    return ret;
}

//
evt_t getEvt (s_recq_t *q) {
    evt_t ret = -1;

    if (q->rec[q->get].evt != noneEvt) {
        ret = q->rec[q->get].evt;
        q->rec[q->get].evt = noneEvt;
    }

    if (ret >= 0) {
        // if (q->cnt > 0) q->cnt--;
        q->get++;
        if (q->get >= MAX_QREC)
            q->get = 0;
    }

    return ret;
}

//
int8_t putPrnEvt() {
    int8_t ret = -1;

    if (que.rec[que.put].evt == noneEvt) {
        que.rec[que.put].evt = prnEvt;
        ret = que.rec[que.put].id;
        que.put++;
        if (que.put >= MAX_QREC)
            que.put = 0;
    }

    return ret;
}

//
//--------------------------------------------------------------------
void floatPart (float val, s_float_t *part) {
    part->cel = (uint32_t)val;
    part->dro = (val - part->cel) * 1000000;
}

//--------------------------------------------------------------------
uint32_t get_sec (uint32_t t) {
    return (seconda + t);
}
//
int check_sec (uint32_t t) {
    return (get_sec (0) >= t) ? 1 : 0;
}
//
char *calcTime (uint32_t sec, char *st) {
#ifdef SET_RTC_USE
    if (!rtc_err) {
        RTC_Get();
        sprintf (st, "%02u.%02u %02u:%02u:%02u",
                 calendar.w_date, calendar.w_month, calendar.hour, calendar.min, calendar.sec);
    }
#else
    sec %= (60 * 60 * 24);
    uint32_t hour = sec / (60 * 60);
    sec %= (60 * 60);
    uint32_t min = sec / (60);
    sec %= 60;

    sprintf (st, "%02u:%02u:%02u", hour, min, sec);
#endif

    return st;
}

//--------------------------------------------------------------------
uint32_t get_MS() {
    return _ms;
}

//--------------------------------------------------------------------
uint32_t getMS (uint32_t ms) {
    return (get_MS() + ms);
}

//--------------------------------------------------------------------
int checkMS (uint32_t ms) {
    return (get_MS() >= ms) ? 1 : 0;
}

//--------------------------------------------------------------------
void Delay_MS (uint32_t ms) {
    uint32_t val = ms + get_MS();
    while (val > get_MS());
}

//--------------------------------------------------------------------
void GPIOx_init (void) {
    GPIO_InitTypeDef GPIO_InitStructure = {0};

    RCC->APB2PCENR |= RCC_APB2Periph_GPIOA;
    // RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init (GPIOA, &GPIO_InitStructure);
#ifdef SET_RF_433
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init (GPIOA, &GPIO_InitStructure);
    //
    GPIO_WriteBit (GPIOA, GPIO_Pin_5, Bit_SET);
#endif
}

//--------------------------------------------------------------------
void TIM1_UP_IRQHandler (void) __attribute__ ((interrupt ("WCH-Interrupt-fast")));

void TIM1_UP_IRQHandler (void) {
    if (TIM_GetITStatus (TIM1, TIM_IT_Update) == SET) {
        _ms++;
        if (again_flag) {
            again_flag = 0;
            putEvt (adcEvt, &que);
        }
        if (!(_ms % 999)) {
            GPIO_WriteBit (GPIOA, GPIO_Pin_3, (!led) ? (led = Bit_SET) : (led = Bit_RESET));
            //
            //lcd_tick ((show++) & 1, RED);
            //
            seconda++;
            putEvt (secEvt, &que);
            if (!(seconda % 10))
                putEvt (msgEvt, &que);
        }
    }
    TIM_ClearITPendingBit (TIM1, TIM_IT_Update);
}

//
void TIM1_Init (void)  // u16 arr, u16 psc)
{
    NVIC_InitTypeDef NVIC_InitStructure = {0};
    TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStructure = {0};

    RCC->APB2PCENR |= RCC_APB2Periph_TIM1;
    // RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);

    TIM_TimeBaseInitStructure.TIM_Period = arr;
    TIM_TimeBaseInitStructure.TIM_Prescaler = psc;
    TIM_TimeBaseInitStructure.TIM_ClockDivision = TIM_CKD_DIV1;
    TIM_TimeBaseInitStructure.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseInitStructure.TIM_RepetitionCounter = 50;
    TIM_TimeBaseInit (TIM1, &TIM_TimeBaseInitStructure);

    TIM1->INTFR = (uint16_t)~TIM_IT_Update;  // TIM_ClearITPendingBit(TIM1, TIM_IT_Update);

    NVIC_InitStructure.NVIC_IRQChannel = TIM1_UP_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init (&NVIC_InitStructure);

    TIM1->DMAINTENR |= TIM_IT_Update;  // IM_ITConfig(TIM1, TIM_IT_Update, ENABLE);
    TIM1->CTLR1 |= TIM_CEN;            // TIM_Cmd(TIM1, ENABLE);   //TIM_GenerateEvent(TIM1, TIM_IT_Update);
}

//--------------------------------------------------------------------
/**/
const char *ChipName (u32 cid) {
    if ((cid & 0x0f) == 0x04) {
        switch (cid & 0xffffff00) {
        case 0x30330500:
            return "CH32V303CBT6";
        case 0x30320500:
            return "CH32V303RBT6";
        case 0x30310500:
            return "CH32V303RCT6";
        case 0x30300500:
            return "CH32V303VCT6";
        }
    } else if ((cid & 0x0f) == 0x08) {
        switch (cid & 0xffffff00) {
        case 0x30520500:
            return "CH32V305FBP6";
        case 0x30500500:
            return "CH32V305RBT6";
        case 0x305B0500:
            return "CH32V305GBU6";
        case 0x305C0500:
            return "CH32V305CCT6";
        case 0x30730500:
            return "CH32V307WCU6";
        case 0x30720500:
            return "CH32V307FBP6";
        case 0x30710500:
            return "CH32V307RCT6";
        case 0x30700500:
            return "CH32V307VCT6";
        case 0x3170B500:
            return "CH32V317VCT6";
        case 0x3173B500:
            return "CH32V317WCU6";
        case 0x3175B500:
            return "CH32V317TCU6";
        }
    }

    return "Unknown";
}
//--------------------------------------------------------------------
void prn_msg (u32 tm) {
    char tmp[32] = {0};
    char md[64] = {0};
    char tp[80] = {0};

    if (adc_mode) {
        if (vcc >= 0) {
            sprintf (md, ", Vcc %dmv", vcc);
        }
    } else {
        if (temp >= 0.0) {
            s_float_t flo = {0, 0};
            floatPart (temp, &flo);
            sprintf (md, ", CPU %u.%02u\"C", flo.cel, flo.dro / 10000);
        }
    }

    // snum++;

    if (bmp280_ok) {
        sprintf (tp, ", \e[0;92m%s\x1B[0m", sensName(sid));
        if (sensReady) {
            s_float_t tflo = {0, 0};
            floatPart (sens.temp, &tflo);
            s_float_t pflo = {0, 0};
            floatPart (sens.pres, &pflo);
            sprintf (tp + strlen (tp), ":[%u.%02u\"C | %u.%02u mmHg",
                     tflo.cel, tflo.dro / 10000, pflo.cel, pflo.dro / 10000);
            if (sid == BME280_SENSOR) {
                s_float_t hflo = {0, 0};
                floatPart (sens.humi, &hflo);
                sprintf (tp + strlen (tp), " | %u.%u %%", hflo.cel, hflo.dro / 10000);
            }
            strcat (tp, "]");
        }
    }
#ifdef SET_RTC_USE
    printf ("%s | %s, RISC-V \e[0;91m%s\x1B[0m, SystemClk %d MHz, LCD \e[0;93mST7789\x1B[0m (SPI2)%s%s%s%s\r\n",
            calcTime (tm, tmp),
            ver,
            // snum,
            ChipName (cid),
            SystemCoreClock / 1000000,
            //(rtc_err == 0) ? "Ok" : "Error",
            // rtc_err,
            fm_id ? fmramName(fm_id) : "",
            rf_flag ? ", RF H3V4F-433" : "",
            tp,
            md);
#else
    printf ("%s | %s, RISC-V \e[0;91m%s\x1B[0m, SystemClk %d MHz, LCD ST7789 (SPI2)%s%s%s\r\n",
            calcTime (tm, tmp),
            ver,
            // snum,
            ChipName (cid),
            SystemCoreClock / 1000000,
            rf_flag ? ", RF H3V4F-433" : "",
            tp,
            md);
#endif
}
//--------------------------------------------------------------------
void help()
{
	printf("USART1 (debug):\n\tTX - PA9\n\tRX - PA10\n"
		   "SPI2 (ST7789):\n\tSCLK - PB13\n\tMOSI - PB15\n\tRES - PB11\n\tDC - PB10\n\tCS - PB12\n\tBLK - PB9\n"
		   "SPI1 (FM25V40):\n\tNSS - PA4\n\tSCLK - PA5\n\tMISO - PA6\n\tMOSI - PA7\n"
		   "WCH-LinkE:\n\tSWDIO - PA13\n\tSWCLK - PA14\n"
		   "VCC:\n\tADC15 - PC5\n");
}
//--------------------------------------------------------------------
/**/
#ifdef SET_RF_433
//------------------------------------------------------------------------------------------
void EXTI_PA4_INIT (void) {
    GPIO_InitTypeDef GPIO_InitStructure = {0};
    EXTI_InitTypeDef EXTI_InitStructure = {0};
    NVIC_InitTypeDef NVIC_InitStructure = {0};

    // RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO | RCC_APB2Periph_GPIOA, ENABLE);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPD;  // GPIO_Mode_IN_FLOATING;//GPIO_Mode_IPU;
    GPIO_Init (GPIOA, &GPIO_InitStructure);

    /* GPIOA ----> EXTI_Line4 */
    GPIO_EXTILineConfig (GPIO_PortSourceGPIOA, GPIO_PinSource4);
    EXTI_InitStructure.EXTI_Line = EXTI_Line4;
    EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
    EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising_Falling;  // EXTI_Trigger_Rising;//EXTI_Trigger_Falling;
    EXTI_InitStructure.EXTI_LineCmd = ENABLE;
    EXTI_Init (&EXTI_InitStructure);

    NVIC_InitStructure.NVIC_IRQChannel = EXTI4_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 2;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init (&NVIC_InitStructure);
}

//
void EXTI4_IRQHandler (void) __attribute__ ((interrupt ("WCH-Interrupt-fast")));

void EXTI4_IRQHandler (void) {
    if (EXTI_GetITStatus (EXTI_Line4) == SET) {
        //
        // Delay_Us(1);
        uint8_t val = GPIO_ReadInputDataBit (GPIOA, GPIO_Pin_4);
        GPIO_WriteBit (GPIOA, GPIO_Pin_5, val);
        ////GPIO_WriteBit(GPIOA, GPIO_Pin_5, (!rf_led) ? (rf_led = Bit_SET) : (rf_led = Bit_RESET));
        // if (!val) putEvt(rfEvt, &que); else putEvt(ffEvt, &que); //evt = rfEvt; else evt = ffEvt;
        //
        EXTI_ClearITPendingBit (EXTI_Line4);  // Clear Flag
    }
}

//-------------------------------------------------------------------------------
#endif
//
#ifdef SET_ADC
//-------------------------------------------------------------------------------
void ADC_Function_Init (bool mv) {
    ADC_InitTypeDef ADC_InitStructure = {0};
    GPIO_InitTypeDef GPIO_InitStructure = {0};

    RCC_APB2PeriphClockCmd (RCC_APB2Periph_ADC1, ENABLE);
    if (mv)
        RCC_APB2PeriphClockCmd (RCC_APB2Periph_GPIOC, ENABLE);
    RCC_ADCCLKConfig (RCC_PCLK2_Div2);  // Div4);//Div8

    if (mv) {
        GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5;
        GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AIN;
        GPIO_Init (GPIOC, &GPIO_InitStructure);
    }

    ADC_DeInit (ADC1);
    ADC_InitStructure.ADC_Mode = ADC_Mode_Independent;
    ADC_InitStructure.ADC_ScanConvMode = DISABLE;
    ADC_InitStructure.ADC_ContinuousConvMode = DISABLE;
    ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv_None;
    ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
    ADC_InitStructure.ADC_NbrOfChannel = 1;
    ADC_Init (ADC1, &ADC_InitStructure);
    //
    ADC_Cmd (ADC1, ENABLE);
    //
    ADC_BufferCmd (ADC1, DISABLE);  // disable buffer

    ADC_ResetCalibration (ADC1);
    while (ADC_GetResetCalibrationStatus (ADC1));
    ADC_StartCalibration (ADC1);
    while (ADC_GetCalibrationStatus (ADC1));
    Calibrattion_Val = Get_CalibrationValue (ADC1);

    ADC_BufferCmd (ADC1, ENABLE);  // enable buffer

    if (!mv)
        ADC_TempSensorVrefintCmd (ENABLE);
}

//--------------------------------------------------------------------
/*
void crl_adcBuf()
{
        memset((u8 *)adcBuf, 0, sizeof(u16) * MAX_DEEP);
        item_adc = 0;
}
*/
//--------------------------------------------------------------------
u16 Get_ADC_Val (u8 ch) {

    ADC_RegularChannelConfig (ADC1, ch, 1, ADC_SampleTime_28Cycles5);
    ADC_SoftwareStartConvCmd (ADC1, ENABLE);

    while (!ADC_GetFlagStatus (ADC1, ADC_FLAG_EOC));

    return ADC_GetConversionValue (ADC1);
}

//--------------------------------------------------------------------
void clrAdcBuf() {
    item_adc = 0;
    memset ((u8 *)adcBuf, 0, sizeof (u16) * MAX_DEEP);
}

//--------------------------------------------------------------------
bool Get_ADC_Average (u8 ch, u16 *val) {
    u32 sum = 0;
    bool ret = false;

    u16 data = Get_ADC_Val (ch);
    if (!item_adc) {
        for (int8_t i = 0; i < MAX_DEEP; i++) adcBuf[i] = data;
        item_adc = MAX_DEEP;
    } else {
        for (int8_t i = MAX_DEEP - 2; i >= 0; i--) adcBuf[i + 1] = adcBuf[i];
        adcBuf[0] = data;
        if (item_adc < MAX_DEEP)
            item_adc++;
    }
    if (item_adc == MAX_DEEP) {
        for (uint8_t i = 0; i < MAX_DEEP; i++) sum += adcBuf[i];
        sum /= MAX_DEEP;
        *val = (u16)sum;
        ret = true;
    }

    return ret;
}

//--------------------------------------------------------------------
u16 Get_ConversionVal (s16 val) {
    if ((val + Calibrattion_Val) < 0 || !val)
        return 0;
    if ((Calibrattion_Val + val) > 4095 || (val == 4095))
        return 4095;

    return (val + Calibrattion_Val);
}
//-----------------------------------------------------------------------------
const char *fmramName(uint16_t fid)
{
#ifdef SET_FMRAM
    switch (fid) {
        case FM25V10 :
            fm_deep = 128 * 1024;
            return ", FM25V10 (SPI1)";
        case FM25V20 :
            fm_deep = 256 * 1024;
            return ", FM25V20 (SPI1)";
        case FM25V40 :
            fm_deep = 512 * 1024;
            return ", FM25V40 (SPI1)";
    }
#endif
    return "None";
}
//-----------------------------------------------------------------------------
void prnBuffer(uint32_t adr, const uint8_t *buf, uint32_t len, const int lsize)
{
	if (!len || !lsize || !buf) return;

	char *stx = (char *)calloc(1, len << 2);
	if (stx) {
        sprintf(stx+strlen(stx), "%08X", adr);
	    int i = -1;
	    while (++i < len) {
	        if ((i > 0) && (!(i % lsize))) {
                strcat(stx, eol);
                adr += lsize;
                sprintf(stx+strlen(stx), "%08X", adr);
            }
	        sprintf(stx+strlen(stx), " %02X", *(uint8_t *)(buf + i));
	    }
	    if (stx[strlen(stx) - 1] != '\n') strcat(stx, eol);
	    printf("%s", stx);
	    free(stx);
	}
}
//-----------------------------------------------------------------------------


#endif
