#ifndef __FONTS_H__
#define __FONTS_H__

//#pragma pack(push,1)
typedef struct FontDef {
    const unsigned char width;
    unsigned char height;
    const unsigned short *data;
} FontDef;
//#pragma pack(pop)

//Font lib.
extern const FontDef Font_8x8;
extern const FontDef Font_7x10;
extern const FontDef Font_11x18;
extern const FontDef Font_16x26;


#endif
