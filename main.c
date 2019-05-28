/*
 * File:   main.c
 * Author: dinusha
 *
 * Created on 25 May 2019, 10:23 PM
 */


#include <xc.h>
#include <stdint.h>
#include <spi.h>

#include "globals.h"
#include "pcd8544.h"

//docs/chips/18f2550.html
#pragma config BOR = OFF, CPD = OFF, FOSC = HS, WDT = OFF, CP0 = OFF, CP1 = OFF, CP2 = OFF, CP3 = OFF, LVP = OFF, FCMEN = OFF
#pragma config PLLDIV = 5
#pragma config CPUDIV = OSC4_PLL6

void pic_init()
{
    // Shutting down unneeded peripherals
    // Shutting down the A/D converter
    ADCON0bits.ADON = 0;
    ADCON1 = 0x0F;

    //Shutting down the USB peripheral
    UCONbits.USBEN = 0;

    // Configuring ports
    TRISCbits.RC0 = 0;
    TRISCbits.RC1 = 0;
    TRISCbits.RC2 = 0;

    LATCbits.LC0  = 1;
    LATCbits.LC1  = 1;
    LATCbits.LC2  = 0;

    //Enabling PORTB pullups
    //INTCON2bits.RBPU = 0;
}

void main(void) {
    pic_init();
    
    //Set SPI clock state high (SSPCON1bits.CKP = 1) for pcd8544 to keep it stable
    OpenSPI(SPI_FOSC_4, MODE_11, SMPEND);

    pcd8544_init();
    
    pcd8544_set_contrast(0x7F);
    
    pcd8544_flash();
    
    //pcd8544_putpixel(0, 1 / 8, 0x01 << 0);
    
    pcd8544_update();
    
    while(1){
        //pcd8544_flash();
        //pcd8544_clear();
        //__delay_ms(100);
        //pcd8544_putpixel(0, 0, 0xff);
//        for(uint8_t i = 0; i < LCDWIDTH ;i++){
//            pcd8544_putpixel(i, 0, 0xff);
//            pcd8544_putpixel(i, 1, 0xff);
//            pcd8544_putpixel(i, 2, 0xff);
//            __delay_ms(25);
//        }
//        __delay_ms(200);
//        for(uint8_t i = LCDWIDTH; i > 0 ;i--){
//            pcd8544_putpixel(i, 0, 0);
//            pcd8544_putpixel(i, 1, 0);
//            pcd8544_putpixel(i, 2, 0);
//            __delay_ms(25);
//        }
        //pcd8544_clear();
        //pcd8544_update();
        __delay_ms(1000);
        pcd8544_clear();
//        for(uint8_t i = 0; i < 16 ;i++){
//            pcd8544_putpixel(0, (i / 8), 0x01 << (i % 8));
//            __delay_ms(200);
//        }
       
    }
    
    CloseSPI();
    
    return;
}
