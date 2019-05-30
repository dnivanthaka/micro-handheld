
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

    __delay_ms(50);

    LATCbits.LC0 = 1;

    __delay_ms(25);

    // Device deselect
    LATCbits.LC1 = 1;
}

void pcd8544_command(uint8_t cmd)
{
    // Device select
    LATCbits.LC1 = 0;
    // Setting command mode -> D/C = 0
    LATCbits.LC2 = 0;


    WriteSPI(cmd);
    
    // Device deselect
    LATCbits.LC1 = 1;
    //pcd8544_send_raw(&cmd, 1, PCD8544_CMD);

}

void pcd8544_init()
{

    pcd8544_reset();

    //Extended instructions enabled
    pcd8544_command(0x21);
    //Set contrast 0 - 127
    pcd8544_command(0xBD);
    //Temperature control
    pcd8544_command(0x04 + 0x02); 
    //Set bias system
    pcd8544_command(0x10 + 0x03); 
    //Return to basic instruction set, power on, set horizontal addressing
    pcd8544_command(0x20);
    //Display control set to normal mode
    pcd8544_command(0x08 + 0x04);
}

void pcd8544_set_contrast(uint8_t val)
{   
    pcd8544_command(0x20 | 0x01);
    pcd8544_command(0x80 | 0x3F);
    pcd8544_command(0x20);
}

void pcd8544_clear()
{
    //uint8_t x, y;
    
    // Reset address pointer, set position to 0, 0
    pcd8544_setxy(0, 0);

    // Device select
    LATCbits.LC1 = 0;
    // Setting data mode -> D/C = 1
    LATCbits.LC2 = 1;

   
    /*for(y=0;y<LCDHEIGHT / 8;y++){
        for(x=0;x<LCDWIDTH;x++){
             //WriteSPI(0x00);
            pcd8544_buffer[(y * LCDWIDTH) + x] = 0;
        }
    }*/
    
    for(uint16_t i=0;i<BUFF_LEN;i++){
        pcd8544_buffer[i] = 0;
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
    uint8_t y_val = y / 8;

    if(color & 0x01){
        pcd8544_buffer[(y_val * LCDWIDTH) + x] |= 1 << (y % 8);
    }else{
        pcd8544_buffer[(y_val * LCDWIDTH) + x] &= ~(1 << (y % 8));
    }
}

void pcd8544_buff_setxy(uint8_t x, uint8_t y)
{
    pcd8544_x_pos = x;
    pcd8544_y_pos = y;
}

/**
 * Write buffer into lcd
 */
void pcd8544_render()
{
    //uint8_t x, y;
    
    // Reset address pointer, set position to 0, 0
    pcd8544_setxy(0, 0);
    //pcd8544_setxy(pcd8544_x_pos, pcd8544_y_pos);

    // Device select
    LATCbits.LC1 = 0;
    // Setting data mode -> D/C = 1
    LATCbits.LC2 = 1;

   
//    for(y=0;y<LCDHEIGHT / 8;y++){
//        for(x=0;x<LCDWIDTH;x++){
//             WriteSPI(pcd8544_buffer[(y * LCDWIDTH) + x]);
//        }
//    }
    for(uint16_t i=0;i<BUFF_LEN;i++){
        WriteSPI(pcd8544_buffer[i]);
    }
//    WriteSPI(pcd8544_buffer[(pcd8544_y_pos * LCDWIDTH) + pcd8544_x_pos]);
//    WriteSPI(pcd8544_buffer[(pcd8544_y_pos * LCDWIDTH) + (pcd8544_x_pos + 1)]);
//    WriteSPI(pcd8544_buffer[((pcd8544_y_pos + 1) * LCDWIDTH) + pcd8544_x_pos]);
//    WriteSPI(pcd8544_buffer[((pcd8544_y_pos + 1) * LCDWIDTH) + (pcd8544_x_pos + 1)]);
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


//void pcd8544_send_raw(uint8_t *data, uint16_t len, enum pcd_data_t typ)
//{
//    // Device select
//    LATCbits.LC1 = 0;
//    
//    // Setting command mode -> D/C = 0
//    LATCbits.LC2 = typ;
//
//    for(uint16_t i = 0; i<len; i++){
//        WriteSPI(*(data + i));
//    }
//    
//    // Device deselect
//    LATCbits.LC1 = 1;
//}