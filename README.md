# Example project nanoCH32V305 board

RISC-V CH32V305(WeAct nanoCH32V305 board) + st7789(spi) + fm25v40(spi) + bme280(i2c)



# Средства разработки:

```
- RISC-V IDE MounRiver Studio - среда разработки для микроконтроллеров RISC-V семейства WCH  (http://www.mounriver.com/download)
- WCH-LinkE - загрузчик/отладчик для плат микроконтроллеров RISC-V семейства WCH (можно приобрести тут - https://aliexpress.ru)
```


## Состав рабочего оборудования:

```
- WeAct nanoCH32V305 - отладочная плата с микроконтроллером RISC-V
- Sensor BME280 Module - Модуль датчика температуры, атмосферного давления и влажности (i2c)
- OLED Display ST7789 - Модуль дисплея 240x240 (spi)
- FM25V40 chip - F-RAM чип памяти емкостью 512КБ (spi)
```


# Функционал:

* ПО построено по модели BARE METAL (без использования ОС) с использованием очередью событий.
  События обслуживаются в основном цикле программы. Восновном формируются события в 
  обработчиках прерываний от используемых модулей микроконтроллера.
* Устройство инициализирует некоторые интерфейсы микроконтроллера :
  - GPIO : подключен сетодиод PA3 - секундный тик.
  - ADC : канал 15 АЦП (PC5), на него подается напряжение питания.
  - USART1 : параметры порта 115200 8N1 - порт для логов и передачи команд утсройству, если подключен комп.
  - TIM1 : таймер-счетчик временных интервалов в 1 мсек., реализован в обработчике прерывания от таймера.
  - SPI2 : обслуживает OLED ST7789.
  - SPI1 : F-RAM чип FM25V40 (содержит стартовую картинку + служебные данные и epoch time для старта RTC).
  - I2C1 : датчик BME280 (температура, атмосферное давление и вляжность).
* Прием команд по последовательному порту (USART1) выполняется в обработчике прерывания.
* Через USART1 можно отправлять команды на устройство, например :

```
epoch=1781516087
    установить текущее время в формате UTC
 Unix epoch time - 1781516087
```


```
help
USART1 (debug):
        TX - PA9
        RX - PA10
SPI2 (ST7789):
        SCLK - PB13
        MOSI - PB15
        RES - PB11
        DC - PB10
        CS - PB12
        BLK - PB9
SPI1 (FM25V40):
        NSS - PA4
        SCLK - PA5
        MISO - PA6
        MOSI - PA7
WCH-LinkE:
        SWDIO - PA13
        SWCLK - PA14
VCC:
        ADC15 - PC5
```


```
read=0
Read: addr=0 len=256
00000000 BC BF 4A F5 CC C0 12 34 54 C4 2F 6A FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
00000020 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
00000040 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
00000060 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
00000080 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
000000A0 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
000000C0 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
000000E0 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
```


```
write=256:255:256
Write: addr=256 len=256 val=255
00000100 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
00000120 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
00000140 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
00000160 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
00000180 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
000001A0 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
000001C0 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
000001E0 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
```


```
reboot
    рестарт устройства с записью текущего времени в F-RAM
```

```
halt
    перевод устройства в режим standby с записью текущего времени в F-RAM
```


* Функционал проекта в процессе пополнения.


