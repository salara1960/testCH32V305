#ifndef __FMRAM_H__
#define __FMRAM_H__

#include "func.h"

#ifdef SET_FMRAM

/*
    CS   ！！ PA4
    DO   ！！ PA6(SPI1_MISO)
    WP   ！！ 3.3V
    DI   ！！ PA7(SPI1_MOSI)
    CLK  ！！ PA5(SPI1_SCK)
    HOLD ！！ 3.3V
*/

#define FM25V10     0x2400
#define FM25V20     0x2508
#define FM25V40     0x2640

#define CMD_WriteEnable         0x06
#define CMD_WriteDisable        0x04
#define CMD_ReadStatusReg       0x05
#define CMD_WriteStatusReg      0x01
#define CMD_ReadData            0x03
#define CMD_FastReadData        0x0B
//#define CMD_FastReadDual        0x3B
#define CMD_PageProgram         0x02
//#define CMD_BlockErase          0xD8
//#define CMD_SectorErase         0x20
//#define CMD_ChipErase           0xC7
//#define CMD_PowerDown           0xB9
//#define CMD_ReleasePowerDown    0xAB
//#define CMD_DeviceID            0xAB
//#define CMD_ManufactDeviceID    0x90
#define CMD_JedecDeviceID       0x9F

#define SPI_CS_SELECT() (GPIO_WriteBit(GPIOA, GPIO_Pin_4, 0))
#define SPI_CS_UNSELECT() (GPIO_WriteBit(GPIOA, GPIO_Pin_4, 1))

#define PAGE_SIZE 256


#pragma pack(push,1)
typedef struct pic_info_t {
    uint32_t crc;
    uint16_t len;
    uint16_t label;
} pic_info_t;
#pragma pack(pop)

//-----------------------------------------------------------------------------
extern pic_info_t pic_info;

extern uint8_t info_buf[9];

extern uint32_t fm_adr_time;

//-----------------------------------------------------------------------------

void SPI_Flash_Init(void);
uint16_t SPI_Flash_ReadID(void);
void SPI_Flash_Read(uint8_t *buf, uint32_t ReadAddr, uint16_t size);
void SPI_Flash_Write(const uint8_t *buf, uint32_t WriteAddr, uint16_t size);
void putPic(const uint8_t *pic, uint32_t fmadr, uint16_t sz);
uint32_t ks32(const uint32_t crc_origin, const uint8_t *buf, const uint32_t size);
uint32_t get_crcFMRAM (uint32_t adr, uint16_t size);
bool checkPicInFMRAM();
void ClrFMRAM(uint16_t fid);
#ifdef SET_DMA_FMRAM
    void DMA_Tx_Init(DMA_Channel_TypeDef *DMA_CHx, u32 ppadr, u32 memadr, u16 bufsize);
    void DMA_Rx_Init(DMA_Channel_TypeDef *DMA_CHx, u32 ppadr, u32 memadr, u16 bufsize);
#endif

//-----------------------------------------------------------------------------

#endif


#endif
