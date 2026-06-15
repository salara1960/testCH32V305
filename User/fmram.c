#include "fmram.h"
#include "func.h"

#ifdef SET_FMRAM

//-----------------------------------------------------------------------------

uint8_t info_buf[9] = {0};
pic_info_t pic_info = {0xff};
uint32_t fm_adr_time = 0;

//-----------------------------------------------------------------------------
void SPI_Flash_Init(void)
{
GPIO_InitTypeDef GPIO_InitStructure = {0};
SPI_InitTypeDef  SPI_InitStructure = {0};

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_SPI1, ENABLE);

    SPI_CS_UNSELECT();

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
    GPIO_SetBits(GPIOA, GPIO_Pin_4);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
    SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
    SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
    SPI_InitStructure.SPI_CPOL = SPI_CPOL_High;
    SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;
    SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
    SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_4;//16;//64-2MHz, 32-4MHz, 16-8MHz, 8-16MHz
    SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
    SPI_InitStructure.SPI_CRCPolynomial = 7;
    SPI_Init(portFMRAM, &SPI_InitStructure);

#ifdef SET_DMA_FMRAM
	SPI_I2S_DMACmd(portFMRAM, SPI_I2S_DMAReq_Tx, ENABLE);
	SPI_I2S_DMACmd(portFMRAM, SPI_I2S_DMAReq_Rx, ENABLE);
#endif

    SPI_Cmd(portFMRAM, ENABLE);
}
//-----------------------------------------------------------------------------
#ifdef SET_DMA_FMRAM
//
void DMA_Tx_Init(DMA_Channel_TypeDef* DMA_CHx, u32 ppadr, u32 memadr, u16 bufsize)
{
	DMA_InitTypeDef DMA_InitStructure = {0};

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);

	DMA_DeInit(DMA_CHx);

	DMA_InitStructure.DMA_PeripheralBaseAddr = ppadr;
	DMA_InitStructure.DMA_MemoryBaseAddr = memadr;
	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;
	DMA_InitStructure.DMA_BufferSize = bufsize;
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;
	DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
	DMA_InitStructure.DMA_Priority = DMA_Priority_VeryHigh;
	DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
	DMA_Init(DMA_CHx, &DMA_InitStructure);
}
//
void DMA_Rx_Init(DMA_Channel_TypeDef* DMA_CHx, u32 ppadr, u32 memadr, u16 bufsize)
{
	DMA_InitTypeDef DMA_InitStructure = {0};

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);

	DMA_DeInit(DMA_CHx);

	DMA_InitStructure.DMA_PeripheralBaseAddr = ppadr;
	DMA_InitStructure.DMA_MemoryBaseAddr = memadr;
	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;
	DMA_InitStructure.DMA_BufferSize = bufsize;
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;
	DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
	DMA_InitStructure.DMA_Priority = DMA_Priority_High;
	DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
	DMA_Init( DMA_CHx, &DMA_InitStructure );
}
//
#endif
//-----------------------------------------------------------------------------
uint8_t SPI_WriteRead(uint8_t tx)
{
    while (SPI_I2S_GetFlagStatus(portFMRAM, SPI_I2S_FLAG_TXE) == RESET);
	SPI_I2S_SendData(portFMRAM, tx);

    while(SPI_I2S_GetFlagStatus(portFMRAM, SPI_I2S_FLAG_RXNE) == RESET);
    return (uint8_t)SPI_I2S_ReceiveData(portFMRAM);
}
//-----------------------------------------------------------------------------
void SPI_ReadBuf(uint8_t *buf, uint16_t size)
{
int l = -1;

    while (++l < size) {
        while(SPI_I2S_GetFlagStatus(portFMRAM, SPI_I2S_FLAG_RXNE) == RESET);
        *buf++ = (uint8_t)SPI_I2S_ReceiveData(portFMRAM);
    }
}
//-----------------------------------------------------------------------------
void SPI_WriteBuf(uint8_t *buf, uint16_t size)
{
int l = -1;

    while (++l < size) {
        while(SPI_I2S_GetFlagStatus(portFMRAM, SPI_I2S_FLAG_TXE) == RESET);
        SPI_I2S_SendData(portFMRAM, *buf++);
        //while(SPI_I2S_GetFlagStatus(portFMRAM, SPI_I2S_FLAG_TXE) == RESET);
    }
}
//-----------------------------------------------------------------------------
uint8_t SPI_Flash_ReadSR(void)
{
    SPI_CS_SELECT();
        SPI_WriteRead(CMD_ReadStatusReg);
        uint8_t byte = SPI_WriteRead(0xff);
    SPI_CS_UNSELECT();

    return byte;
}
//-----------------------------------------------------------------------------
void SPI_Flash_WriteSR(uint8_t val)
{
    SPI_CS_SELECT();
        SPI_WriteRead(CMD_WriteStatusReg);
        SPI_WriteRead(val);
    SPI_CS_UNSELECT();
}
//-----------------------------------------------------------------------------
void SPI_Flash_Wait_Busy(void)
{
    while((SPI_Flash_ReadSR() & 0x01) == 0x01);
}
//-----------------------------------------------------------------------------
void SPI_Flash_WriteEn(void)
{
    SPI_CS_SELECT();
        SPI_WriteRead(CMD_WriteEnable);
    SPI_CS_UNSELECT();
}
//-----------------------------------------------------------------------------
void SPI_Flash_WriteDis(void)
{
    SPI_CS_SELECT();
        SPI_WriteRead(CMD_WriteDisable);
    SPI_CS_UNSELECT();
}
//-----------------------------------------------------------------------------
uint16_t SPI_Flash_ReadID(void)
{
uint8_t mid[9] = {0};    
uint16_t *uid = (uint16_t *)&mid[7];
uint16_t temp = 0;

    SPI_CS_SELECT();
        SPI_WriteRead(CMD_JedecDeviceID);
        //SPI_ReadBuf(&mid[0], 9);
        for (int8_t i = 0; i < 9; i++) mid[i] = SPI_WriteRead(0x00);
        temp = HTONS(*uid);
    SPI_CS_UNSELECT();

    return temp;
}
//-----------------------------------------------------------------------------
void SPI_Flash_Read(uint8_t *buf, uint32_t ReadAddr, uint16_t size)
{
    SPI_CS_SELECT();
        SPI_WriteRead(CMD_ReadData);
        SPI_WriteRead((uint8_t)((ReadAddr) >> 16));
        SPI_WriteRead((uint8_t)((ReadAddr) >> 8));
        SPI_WriteRead((uint8_t)ReadAddr);
        //SPI_WriteRead(0x0);
        //SPI_ReadBuf(buf, size);
        for (uint16_t i = 0; i < size; i++) buf[i] = SPI_WriteRead(0x0);
    SPI_CS_UNSELECT();
}
//-----------------------------------------------------------------------------
void SPI_Flash_Write(const uint8_t *buf, uint32_t WriteAddr, uint16_t size)// write page - 256 byte
{
    SPI_Flash_WriteEn();
    SPI_CS_SELECT();
        /*uint8_t dat[] = {
            CMD_PageProgram,
            (uint8_t)((WriteAddr) >> 16),
            (uint8_t)((WriteAddr) >> 8),
            (uint8_t)WriteAddr            
        };
        SPI_WriteBuf(dat, (uint16_t)sizeof(dat));*/
        SPI_WriteRead(CMD_PageProgram);
        SPI_WriteRead((uint8_t)((WriteAddr) >> 16));
        SPI_WriteRead((uint8_t)((WriteAddr) >> 8));
        SPI_WriteRead((uint8_t)WriteAddr);
        for (uint16_t i = 0; i < size; i++) SPI_WriteRead(buf[i]);
    SPI_CS_UNSELECT();
    SPI_Flash_Wait_Busy();
}
//-----------------------------------------------------------------------------
void putPic(const uint8_t *pic, uint32_t fmadr, uint16_t sz)
{   
    //Clear pic info region in FMRAM (0..7 bytes) 
    memset((uint8_t *)&pic_info, 0xff, sizeof(pic_info_t));
    SPI_Flash_Write((uint8_t *)&pic_info, 0, sizeof(pic_info_t));
#ifdef SET_DMA_FMRAM
    DMA_Tx_Init(DMA1_Channel3, (uint32_t)&portFMRAM->DATAR, (uint32_t)pic, sz);
    DMA_ClearFlag(DMA1_FLAG_TC3);
	DMA_Cmd(DMA1_Channel3, ENABLE);
    while(!DMA_GetFlagStatus(DMA1_FLAG_TC3));
#else    
    SPI_Flash_Write(pic, fmadr, sz);
#endif   
    crc_fm = get_crcFMRAM(fmadr, sz);
}
//-----------------------------------------------------------------------------
uint32_t get_crcFMRAM(uint32_t adr, uint16_t size)
{
    uint32_t blknum = size / 2048;
    uint32_t blklast = size % 2048;
    uint32_t sz = 2048;
    int blk = -1;
    uint32_t crc32 = 0;

    if (blklast) blknum++;
    if (!blklast) blklast = 2048;     
    
    uint8_t *tmp = (uint8_t *)calloc(1, 2048);
    if (tmp) {
        while (++blk < blknum) {
            if (blk == blknum - 1) sz = blklast;
            SPI_Flash_Read(tmp, adr, sz);
            adr += sz;
            crc32 = ks32(crc32, tmp, sz);
        }

        free(tmp);
        //
        adr = 0;
        pic_info.crc = __htonl(crc32);
        pic_info.len = HTONS(size);
        pic_info.label = HTONS(0x1234);
        SPI_Flash_Write((uint8_t *)&pic_info, adr, sizeof(pic_info_t));
        //
    }

    return crc32;
}
//-----------------------------------------------------------------------------
bool checkPicInFMRAM()
{
bool ret = false;
pic_info_t pinfo = {0};

    SPI_Flash_Read((uint8_t *)&pinfo, 0, sizeof(pic_info_t));
    if ((HTONS(pinfo.label) == 0x1234) && (crc_fm == __htonl(pinfo.crc))) ret = true;

    return ret;
}
//-----------------------------------------------------------------------------
void ClrFMRAM(uint16_t fid)
{
uint32_t sz = 2048;    

    if (!fm_deep) return;

    uint8_t *tmp = (uint8_t *)calloc(1, sz);
    if (tmp) {
        memset(tmp, 0xff, sz); 
        uint32_t adr = 0;
        for (uint32_t i = 0; i < fm_deep / sz; i++) {
            SPI_Flash_Write(tmp, adr, sz);
            adr += sz;
        }
        free(tmp);
    }
}
//-----------------------------------------------------------------------------

#endif
