#ifndef __LCD_H__
#define __LCD_H__

#include <unistd.h>
#include <stdbool.h>
#include "fonts.h"


//#define SPI_GPIO
#define SPI_HW

#define USE_HORIZONTAL 2//0


#define LCD_W 240
#define LCD_H 240

#define WHITE         	 0xFFFF
#define BLACK         	 0x0000	  
#define BLUE           	 0x001F  
#define BRED             0XF81F
#define GRED 			 0XFFE0
#define GBLUE			 0X07FF
#define RED           	 0xF800
#define MAGENTA       	 0xF81F
#define GREEN         	 0x07E0
#define CYAN          	 0x7FFF
#define YELLOW        	 0xFFE0
#define BROWN 			 0XBC40 //¡Á???
#define BRRED 			 0XFC07 //¡Á??¨¬??
#define GRAY  			 0X8430 //????
#define DARKBLUE      	 0X01CF	//??????
#define LIGHTBLUE      	 0X7D7C	//??????  
#define GRAYBLUE       	 0X5458 //??????
#define LIGHTGREEN     	 0X841F //??????
#define LGRAY 			 0XC618 //??????(PANNEL),?¡ã??¡À??¡ã??
#define LGRAYBLUE        0XA651 //????????(??????????)
#define LBBLUE           0X2B12 //??¡Á?????(??????????¡¤???)

#define LCD_SCLK_Clr() GPIO_ResetBits(GPIOB,GPIO_Pin_13)//SCLK
#define LCD_SCLK_Set() GPIO_SetBits(GPIOB,GPIO_Pin_13)

#define LCD_MOSI_Clr() GPIO_ResetBits(GPIOB,GPIO_Pin_15)//MOSI
#define LCD_MOSI_Set() GPIO_SetBits(GPIOB,GPIO_Pin_15)

#define LCD_RES_Clr()  GPIO_ResetBits(GPIOB,GPIO_Pin_11)//RES
#define LCD_RES_Set()  GPIO_SetBits(GPIOB,GPIO_Pin_11)

#define LCD_DC_Clr()   GPIO_ResetBits(GPIOB,GPIO_Pin_10)//DC
#define LCD_DC_Set()   GPIO_SetBits(GPIOB,GPIO_Pin_10)

#define LCD_CS_Clr()   GPIO_ResetBits(GPIOB,GPIO_Pin_12)//CS
#define LCD_CS_Set()   GPIO_SetBits(GPIOB,GPIO_Pin_12)

#define LCD_BLK_Clr()  GPIO_ResetBits(GPIOB,GPIO_Pin_9)//BLK
#define LCD_BLK_Set()  GPIO_SetBits(GPIOB,GPIO_Pin_9)

#define PIC_SIZE 52416
#define BLK_SIZE 144

#define ABS(x) ((x) > 0 ? (x) : -(x))

//--------------------------------------------------------------

extern SPI_TypeDef *portLCD;


extern const FontDef *bigFont;
extern const FontDef *midFont;
extern const FontDef *smalFont;
extern const FontDef *litlFont;



int lcd_init();
void LCD_Fill_Slow(u16 xsta, u16 ysta, u16 xend, u16 yend, u16 color);
void LCD_Fill_Fast(u16 xsta, u16 ysta, u16 xend, u16 yend, u16 color);
void LCD_Clr(uint16_t color);
char *mkLineCenter(char *str, uint16_t width);
void LCD_WriteString(uint16_t x,
                    uint16_t y,
                    const char *str,
                    FontDef font,
                    uint16_t color,
                    uint16_t bgcolor);
void lcd_tick(u8 show, const u16 bk_color);
#ifdef SET_FMRAM 
    void LCD_ShowPicture_FMRAM(u16 x, u16 y, u16 length, u16 width);
    #ifdef SET_BIG_PIC
        extern const uint8_t gImage_test[PIC_SIZE];
        void LCD_ShowPicture_Fast(u16 x, u16 y, u16 length, u16 width, const u8 *pic);
    #else
        extern const uint8_t *gImage_test;
    #endif
#endif
void LCD_OFF();
//--------------------------------------------------------------


#endif /* __LCD_H__ */
