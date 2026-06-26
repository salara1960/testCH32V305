#ifndef __FUNC_H__
#define __FUNC_H__

#include "hdr.h"

#define MAX_QREC 48
#define MAX_DEEP 8


typedef int evt_t;

typedef struct {
	uint32_t cel;
	uint32_t dro;
} s_float_t;

#pragma pack(push,1)
typedef struct que_rec_t {
	int8_t id;
	evt_t evt;
} que_rec_t;
#pragma pack(pop)
#pragma pack(push,1)
typedef struct s_recq_t {
	//volatile uint8_t lock;
    //uint8_t cnt;
	uint8_t put;
	uint8_t get;
	que_rec_t rec[MAX_QREC];
} s_recq_t;
#pragma pack(pop)

enum {
	bleDis = 0,
	bleCon = 1,
	bleNone = 255
};


extern volatile bool en_irg;
extern volatile uint8_t ble_ack_con;
extern uint32_t tmr_enIrg;

extern volatile uint8_t again_flag;
extern s_recq_t que;
extern bool queFlag;
//
bool initEvt(s_recq_t *q);
void crl_adcBuf();
int8_t putEvt(evt_t ev, s_recq_t *q);
evt_t getEvt(s_recq_t *q);
int8_t putPrnEvt();
//
extern u8 getBuffer[RX_SIZE];
extern const char *ver;
extern evt_t evt;
extern u32 cid;
//
#ifdef SET_ADC
	extern s16 Calibrattion_Val;
	void clrAdcBuf();
    void ADC_Function_Init(bool mv);
    bool Get_ADC_Average(u8 ch, u16 *val);//, u8 times);
    u16 Get_ConversionVal(s16 val);
#endif
extern s32 vcc;
extern float temp; //s32 temp;
extern bool adc_mode;
extern u8 adc_channel;
extern u8 deep;
extern u8 show;
extern uint32_t crc_pic, crc_fm;

extern bool bmp280_ok;
#ifdef SET_I2C_DEV
	extern u32 bound;
	extern u8 sid;
	extern bool sensReady;
#endif

extern uint16_t fm_id;
#ifdef SET_FMRAM
	extern uint32_t blk_addr;
    extern uint32_t blk_num;
    extern uint32_t blk_cur;
	extern uint8_t *blk_mem;

    extern SPI_TypeDef *portFMRAM;
	extern uint32_t fm_deep;
#endif

//
void floatPart (float val, s_float_t *part);
uint32_t get_sec(uint32_t t);
int check_sec(uint32_t t);
char *calcTime(uint32_t sec, char *st);
void Delay_MS(uint32_t ms);
uint32_t getMS(uint32_t ms);
int checkMS(uint32_t ms);
void GPIOx_init(void);
void TIM1_Init(void);
const char *ChipName(u32 cid);
void help();
void prn_msg(u32 tm);
uint32_t ks32(const uint32_t crc_origin, const uint8_t *buf, const uint32_t size);
void prnBuffer(uint32_t adr, const uint8_t *buf, uint32_t len, const int lsize);
const char *fmramName(uint16_t fid);
void toUppers(char *st);
void EXTI4_INT_INIT(void);


#endif