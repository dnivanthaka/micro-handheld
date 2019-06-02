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

uint16_t frame_count = 0;

const uint8_t ball_bitmap[] = { 
  0x06, 0x0f, 0x0f, 0x06
};

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
    
    //Enabling timer TMR0 interrupt
    T0CONbits.T0PS0 = 1;
    T0CONbits.T0PS1 = 1;
    T0CONbits.T0PS2 = 0;
    T0CONbits.PSA = 0;
    T0CONbits.T0SE = 0;
    T0CONbits.T0CS = 0;
    T0CONbits.T08BIT = 1;
    T0CONbits.TMR0ON = 1;
    
    INTCONbits.TMR0IE = 1;
    
    ei();
}

/**
 * Send a character to display
 * @param ch
 * @param x
 * @param y
 */
void putchar(uint8_t ch, uint8_t x, uint8_t y)
{
    pcd8544_cp(&ASCII[ch - 0x20], 5, x, y);
}

void interrupt frame_update(void)
{
    if(TMR0IE && TMR0IF){
        TMR0IF = 0;
        
        frame_count++;
        return;
    }
}

void main(void) {
    uint16_t start_time = 0;
    
    pic_init();
    
    //Set SPI clock state high (SSPCON1bits.CKP = 1) for pcd8544 to keep it stable
    OpenSPI(SPI_FOSC_4, MODE_11, SMPEND);

    pcd8544_init();
    
    //pcd8544_set_contrast(0x7F);
    
    pcd8544_flash();
    
    //pcd8544_putpixel(0, 1 / 8, 0x01 << 0);
    
    pcd8544_render();
    __delay_ms(500);
    pcd8544_clear();
    pcd8544_render();
    
    uint8_t i = 0;
    int x_vel = 1, y_vel = 1;
    uint8_t x_pos = 0, y_pos = 0;
 
    //pcd8544_cp(ball_bitmap, 8, 50, 0);
    
    while(1){
        start_time = frame_count;
        
        if(x_pos + 4 + x_vel >= LCDWIDTH){
            x_vel = -x_vel;
        }
        
        if(x_pos + x_vel < 0){
            x_vel = 1;
        }
        
        if(y_pos + 4 + y_vel >= LCDHEIGHT){
            y_vel = -y_vel;
        }
        
        if(y_pos + y_vel < 0){
            y_vel = 1;
        }
        
        //putchar('A', 5, 2);
//        pcd8544_putch('B', 10, 0);
//        pcd8544_putch('C', 15, 0);
//        pcd8544_putch('1', 20, 0);
//        pcd8544_putch('2', 25, 0);
        
        x_pos = x_pos + x_vel;
        y_pos = y_pos + y_vel;
        
        pcd8544_clear();
        
        putchar('A', 5, 1);
        
        //pcd8544_putpixel(x_pos, y_pos, 1);
        //pcd8544_putpixel(x_pos + 1, y_pos, 1);
        //pcd8544_putpixel(x_pos, y_pos + 1, 1);
        //pcd8544_putpixel(x_pos + 1, y_pos + 1, 1);
        //pcd8544_cp(ball_bitmap, 8, x_pos, y_pos);
        //pcd8544_cp(ball_bitmap, 4, x_pos % LCDWIDTH, y_pos % LCDHEIGHT);
        //pcd8544_buff_setxy(x_pos, y_pos / 8);
        
        pcd8544_render();
        
//        pcd8544_putpixel(x_pos, y_pos, 0);
//        pcd8544_putpixel(x_pos + 1, y_pos, 0);
//        pcd8544_putpixel(x_pos, y_pos + 1, 0);
//        pcd8544_putpixel(x_pos + 1, y_pos + 1, 0);
        
        
        
        //i++;
        
//        if(i > LCDHEIGHT){
//            i = 0;
//        }
        
        //__delay_ms(100);
        
        while((frame_count - start_time) < 80);
        
        //__delay_ms(100);
       
    }
    
    CloseSPI();
    
    return;
}
