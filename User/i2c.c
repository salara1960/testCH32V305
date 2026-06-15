#include "i2c.h"
#include "func.h"

#ifdef SET_I2C_DEV

I2C_TypeDef *i2cPort = I2C1;
regs_t regs = {0};
result_t sens = {0.0};
static bmx280_calib_t calib;
uint8_t bmx_data[24] = {0};

//------------------------------------------------------------------
void IIC_Init(u32 bound, u16 address)
{
    GPIO_InitTypeDef GPIO_InitStructure = {0};
    I2C_InitTypeDef  I2C_InitTSturcture = {0};

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB | RCC_APB2Periph_AFIO, ENABLE);
    GPIO_PinRemapConfig(GPIO_Remap_I2C1, ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C1, ENABLE);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_OD;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_OD;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);

    I2C_InitTSturcture.I2C_ClockSpeed = bound;
    I2C_InitTSturcture.I2C_Mode = I2C_Mode_I2C;
    I2C_InitTSturcture.I2C_DutyCycle = I2C_DutyCycle_2; //16_9;
    I2C_InitTSturcture.I2C_OwnAddress1 = address;
    I2C_InitTSturcture.I2C_Ack = I2C_Ack_Enable;
    I2C_InitTSturcture.I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
    I2C_Init(i2cPort, &I2C_InitTSturcture);

    I2C_Cmd(i2cPort, ENABLE);

    I2C_AcknowledgeConfig(i2cPort, ENABLE);

}
//------------------------------------------------------------------
void i2c_ReadBytes(uint8_t addr, uint8_t reg, uint8_t *buf, const int16_t count)
{
    while (I2C_GetFlagStatus(i2cPort, I2C_FLAG_BUSY) != RESET);

    I2C_GenerateSTART(i2cPort, ENABLE);

        while (!I2C_CheckEvent(i2cPort, I2C_EVENT_MASTER_MODE_SELECT));
        I2C_Send7bitAddress(i2cPort, addr << 1, I2C_Direction_Transmitter);

        while (!I2C_CheckEvent(i2cPort, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));

        I2C_SendData(i2cPort, reg);
        while (!I2C_CheckEvent(i2cPort, I2C_EVENT_MASTER_BYTE_TRANSMITTED));

    I2C_GenerateSTART(i2cPort, ENABLE);

        while (!I2C_CheckEvent(i2cPort, I2C_EVENT_MASTER_MODE_SELECT));
        I2C_Send7bitAddress(i2cPort, addr << 1, I2C_Direction_Receiver);

        while (!I2C_CheckEvent(i2cPort, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
        
        int16_t i = -1;
        while (++i < count) {
            while (I2C_GetFlagStatus(i2cPort, I2C_FLAG_RXNE) == RESET);
            *buf++ = I2C_ReceiveData(i2cPort);
        }
        //I2C_AcknowledgeConfig(i2cPort, DISABLE);

    I2C_GenerateSTOP(i2cPort, ENABLE);
}
//------------------------------------------------------------------
void i2c_WriteBytes(uint8_t addr, uint8_t reg, uint8_t *buf, const short count)
{
short i = -1;

    while (I2C_GetFlagStatus(i2cPort, I2C_FLAG_BUSY) != RESET);
    
    I2C_GenerateSTART(i2cPort, ENABLE);

        while (!I2C_CheckEvent(i2cPort, I2C_EVENT_MASTER_MODE_SELECT));
        I2C_Send7bitAddress(i2cPort, addr << 1, I2C_Direction_Transmitter);

        while (!I2C_CheckEvent(i2cPort, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));

        I2C_SendData(i2cPort, reg);
        while (!I2C_CheckEvent(i2cPort, I2C_EVENT_MASTER_BYTE_TRANSMITTED));

        while (++i < count) {
            if (I2C_GetFlagStatus(i2cPort, I2C_FLAG_TXE) != RESET) {
                I2C_SendData(i2cPort, *buf++);
                while (!I2C_CheckEvent(i2cPort, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
            }
        }
        //while (!I2C_CheckEvent(i2cPort, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
    
    I2C_GenerateSTOP(i2cPort, ENABLE);
}
//-----------------------------------------------------------------------------
bool i2c_master_reset_sensor(uint8_t *bmx280_id)
{
bool ret = false;
uint8_t rst_val = BMP280_RESET_VALUE;

    if (bmx280_id) {
        i2c_WriteBytes(BMx280_ADDR, BMP280_REG_RESET, &rst_val, 1);
        i2c_ReadBytes(BMx280_ADDR, BMP280_REG_ID, bmx280_id, 1);
        ret = true;
    }

    return ret;
}
//-----------------------------------------------------------------------------
int8_t i2c_master_read_sensor(uint8_t reg, uint8_t *data_rd, const short size)
{
int8_t ret = 1;

	if ((size > 0) && (data_rd)) {
        i2c_ReadBytes(BMx280_ADDR, reg, data_rd, size);
        ret = 0;
	}

    return ret;
}
//-----------------------------------------------------------------------------
void i2c_master_test_sensor(regs_t *rg)
{
uint8_t dat[] = {BMP280_OSRS_T | BMP280_OSRS_P | BMP280_FORCED1_MODE,
				 BMP280_REG_CONFIG,
				 BMP280_CONF_T_SB | BMP280_CONF_FILTER | BMP280_CONF_SPI3W,
				 BME280_REG_CTRL_HUM, //for BME280_SENSOR only
				 BME280_OSRS_H};      //for BME280_SENSOR only
short len = (short)sizeof(dat);

    if (sid != BME280_SENSOR) len -= 2;

    i2c_WriteBytes(BMx280_ADDR, BMP280_REG_CTRL, dat, len);
    
    i2c_ReadBytes(BMx280_ADDR, BMP280_REG_STATUS, dat, 3);

    memcpy(&rg->stat, dat, 3);
}
//-----------------------------------------------------------------------------
int8_t bmx280_readCalibrationData(uint8_t chip_id)
{
int8_t err = 1;

    if (!i2c_master_read_sensor(BMP280_REG_CALIB, bmx_data, 24)) {
        memset(&calib, 0, sizeof(bmx280_calib_t));
        calib.dig_T1 = (bmx_data[1] << 8) | bmx_data[0];
        calib.dig_T2 = (bmx_data[3] << 8) | bmx_data[2];
        calib.dig_T3 = (bmx_data[5] << 8) | bmx_data[4];
        calib.dig_P1 = (bmx_data[7] << 8) | bmx_data[6];
        calib.dig_P2 = (bmx_data[9] << 8) | bmx_data[8];
        calib.dig_P3 = (bmx_data[11] << 8) | bmx_data[10];
        calib.dig_P4 = (bmx_data[13] << 8) | bmx_data[12];
        calib.dig_P5 = (bmx_data[15] << 8) | bmx_data[14];
        calib.dig_P6 = (bmx_data[17] << 8) | bmx_data[16];
        calib.dig_P7 = (bmx_data[19] << 8) | bmx_data[18];
        calib.dig_P8 = (bmx_data[21] << 8) | bmx_data[20];
        calib.dig_P9 = (bmx_data[23] << 8) | bmx_data[22];

        if (chip_id == BME280_SENSOR) {//humidity
            // Read section 0xA1
            if (i2c_master_read_sensor(0xA1, bmx_data, 1)) goto outm;
            calib.dig_H1 = bmx_data[0];
            // Read section 0xE1
            if (i2c_master_read_sensor(0xE1, bmx_data, 7)) goto outm;
            calib.dig_H2 = (bmx_data[1] << 8) | bmx_data[0];
            calib.dig_H3 = bmx_data[2];
            calib.dig_H4 = (bmx_data[3] << 4) | (0x0f & bmx_data[4]);
            calib.dig_H5 = (bmx_data[5] << 4) | ((bmx_data[4] >> 4) & 0x0F);
            calib.dig_H6 = bmx_data[6];
        }

        err = 0;
    }

outm:

    return err;
}
//-----------------------------------------------------------------------------
void bmx280_CalcAll(result_t *ssen, uint8_t chip_id, int32_t tp, int32_t pp, int32_t hh)
{
double var1, var2, p, var_H;
double t1, p1, h1 = -1.0;

	//Temp // Returns temperature in DegC, double precision. Output value of ¡°51.23¡± equals 51.23 DegC.
    var1 = (((double) tp) / 16384.0 - ((double)calib.dig_T1)/1024.0) * ((double)calib.dig_T2);
    var2 = ((((double) tp) / 131072.0 - ((double)calib.dig_T1)/8192.0) * (((double)tp)/131072.0 - ((double) calib.dig_T1)/8192.0)) * ((double)calib.dig_T3);
    // t_fine carries fine temperature as global value
    int32_t t_fine = (int32_t)(var1 + var2);
    t1 = (var1 + var2) / 5120.0;

    //Press // Returns pressure in Pa as double. Output value of ¡°96386.2¡± equals 96386.2 Pa = 963.862 hPa
    var1 = ((double)t_fine / 2.0) - 64000.0;
    var2 = var1 * var1 * ((double) calib.dig_P6) / 32768.0;
    var2 = var2 + var1 * ((double) calib.dig_P5) * 2.0;
    var2 = (var2 / 4.0) + (((double) calib.dig_P4) * 65536.0);
    var1 = (((double) calib.dig_P3) * var1 * var1 / 524288.0 + ((double) calib.dig_P2) * var1) / 524288.0;
    var1 = (1.0 + var1 / 32768.0) * ((double) calib.dig_P1);
    if (var1 == 0.0) {
        p = 0;
    } else {
        p = 1048576.0 - (double)pp;
        p = (p - (var2 / 4096.0)) * 6250.0 / var1;
        var1 = ((double) calib.dig_P9) * p * p / 2147483648.0;
        var2 = p * ((double) calib.dig_P8) / 32768.0;
        p = p + (var1 + var2 + ((double) calib.dig_P7)) / 16.0;
    }
    p1 = (p/100) * 0.75006375541921;//convert hPa to mmHg

    if (chip_id == BME280_SENSOR) {// Returns humidity in %rH as as double. Output value of ¡°46.332¡± represents 46.332 %rH
        var_H = (((double)t_fine) - 76800.0);
        var_H = (hh - (((double)calib.dig_H4) * 64.0 + ((double)calib.dig_H5) / 16384.0 * var_H)) *
                (((double)calib.dig_H2) / 65536.0 * (1.0 + ((double)calib.dig_H6) / 67108864.0 * var_H *
                (1.0 + ((double)calib.dig_H3) / 67108864.0 * var_H)));
        var_H = var_H * (1.0 - ((double)calib.dig_H1) * var_H / 524288.0);
        if (var_H > 100.0) {
        	var_H = 100.0;
        } else {
        	if (var_H < 0.0) var_H = 0.0;
        }
        h1 = var_H;
    }

    ssen->temp = (float)t1;
    ssen->pres = (float)p1;
    ssen->humi = (float)h1;

}
//-----------------------------------------------------------------------------

#endif
