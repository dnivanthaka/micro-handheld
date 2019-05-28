
#include <xc.h>
#include <stdint.h>
#include <spi.h>

#include "globals.h"
#include "pcd8544.h"


// Pin configuration
// RES -> RC0
// CE  -> RC1
// D/C -> RC2

void pcd8544_reset()
{
    // Issuing command
    LATCbits.LC1 = 0;
    LATCbits.LC0 = 0;

    __delay_ms(100);

    LATCbits.LC0 = 1;

    __delay_ms(25);

    // Device deselect
    LATCbits.LC1 = 1;
}

//void pcd8544_clear(){
//
//}

void pcd8544_command(uint8_t cmd)
{
    // Setting command mode -> D/C = 0
    LATCbits.LC2 = 0;
    // Device select
    LATCbits.LC1 = 0;

    WriteSPI(cmd);
    
    // Device deselect
    LATCbits.LC1 = 1;

}

void pcd8544_init()
{

    pcd8544_reset();
    
    /*
    //Extended instructions enabled
    pcd8544_command(0x21);
    //Set contrast 0 - 127
    pcd8544_command(0x80 + 0x7F);
    //Temperature control
    pcd8544_command(0x04 + 0x02);
    //Set bias system
    pcd8544_command(0x10 + 0x03);
    //Return to basic instruction set, power on, set horizontal addressing
    pcd8544_command(0x20);
    //Display control set to normal mode
    pcd8544_command(0x08 + 0x04);
    */
    /*
     //Extended instructions enabled
    pcd8544_command(0x20 + 0x01);
    //Set bias system
    pcd8544_command(0x10 + 0x03);
    //Set contrast 0 - 127
    pcd8544_command(0x80 + 0x7F);
    //Temperature control
    pcd8544_command(0x04 + 0x03);
    //Return to basic instruction set, power on, set horizontal addressing
    pcd8544_command(0x20);
    //Display control set to normal mode
    pcd8544_command(0x08 + 0x04);
    */
    pcd8544_command(0x20 | 0x01);
    pcd8544_command(0x10 | 0x03);
    //pcd8544_command(0xB0 + 0x08);
    //0x3F
    pcd8544_command(0x80 | 0x3F);
    //pcd8544_command(0x90);
    pcd8544_command(0x04 | 0x03);
    //pcd8544_command(0x10 + 0x03);
    pcd8544_command(0x20);
    pcd8544_command(0x08 | 0x0C);
}

void pcd8544_set_contrast(uint8_t val)
{   
    pcd8544_command(0x20 | 0x01);
    pcd8544_command(0x80 | 0x3F);
    pcd8544_command(0x20);
}

void pcd8544_clear()
{
    //pcd8544_command(0x09);
    //pcd8544_command(0x0C);
    uint8_t x, y;
    
    // Reset address pointer, set position to 0, 0
    pcd8544_setxy(0, 0);

    // Setting data mode -> D/C = 1
    LATCbits.LC2 = 1;
    // Device select
    LATCbits.LC1 = 0;
   
    for(y=0;y<LCDHEIGHT / 8;y++){
        for(x=0;x<LCDWIDTH;x++){
             WriteSPI(0x00);
        }
    }
    
    LATCbits.LC1 = 1;
}

void pcd8544_flash()
{
    pcd8544_command(0x08);
    __delay_ms(50);
    pcd8544_command(0x09);
    __delay_ms(500);
    pcd8544_command(0x0C);
}

void pcd8544_putpixel(uint8_t x, uint8_t y, uint8_t color)
{
    
    //pcd8544_command(0x80 + x);
    //pcd8544_command(0x40 + y);
    //pcd8544_sendbyte(color);
    
    //pcd8544_command(0x40);
    //pcd8544_buffer[0] = color & 0x01;
    //pcd8544_buffer[x] = y;
    //uint16_t idx = ((y / 8) * 84) + x;
    //pcd8544_buffer[ idx ] |= color << (y % 8);
    //pcd8544_buffer[ x ] = 1;
    
    // Reset address pointer
    //pcd8544_setxy(x, y);

     // Device select
    //LATCbits.LC1 = 0;
    // Setting data mode -> D/C = 1
    //LATCbits.LC2 = 1;

    //WriteSPI(color);

    // Device deselect
    //LATCbits.LC1 = 1;
}

/**
 * Reset cursor position to 0, 0
 */
//void pcd8544_resetxy()
//{
//    pcd8544_command(0x80);
//    pcd8544_command(0x40);
//}

/**
 * Write buffer into lcd
 */
void pcd8544_update()
{
    uint8_t x, y;
    
    // Reset address pointer, set position to 0, 0
    pcd8544_setxy(0, 0);

    // Setting data mode -> D/C = 1
    LATCbits.LC2 = 1;
    // Device select
    LATCbits.LC1 = 0;
   
    for(y=0;y<LCDHEIGHT / 8;y++){
        for(x=0;x<LCDWIDTH;x++){
             WriteSPI(pcd8544_buffer[(y * LCDWIDTH) + x]);
        }
    }
    // pcd8544_command(0x40);
    //Setting command mode
    //LATCbits.LC2 = 0;
     // Device deselect
    LATCbits.LC1 = 1;
}

/**
 * Set cursor on given x and y block
 * @param x
 * @param y
 */
void pcd8544_setxy(uint8_t x, uint8_t y)
{
    pcd8544_command(0x80 | x);
    pcd8544_command(0x40 | y);
}