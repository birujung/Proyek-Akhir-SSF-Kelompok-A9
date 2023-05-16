#define __SFR_OFFSET 0x00
#include "avr/io.h"
#include "avr/interrupt.h"

.global main

.org 0x0000
RJMP main
.org 0x0002
RJMP reset

main:
RCALL init_interrupt
waitStart:
SBIC PIND,3
RJMP option
backtoStart:
RJMP waitStart



option:
SBIC PIND,4
RJMP choose10
SBIC PIND,5
RJMP choose20
SBIC PIND,6
RJMP choose30
RJMP option


SPI_MAX7219_init:
;------------
.equ  SCK, 5  ;clk 13
.equ  MOSI, 3 ;din 11
.equ  SS, 2   ;cs 10
;--------------------------------------------------------------
LDI   R17, (1<<MOSI)|(1<<SCK)|(1<<SS)
OUT   DDRB, R17       ;set MOSI, SCK, SS as o/p
      ;--------------------------------------------------------
LDI   R17, (1<<SPE)|(1<<MSTR)|(1<<SPR0)
OUT   SPCR, R17       ;enable SPI as master, fsck=fosc/16
      ;--------------------------------------------------------
LDI   R17, 0x0A       ;set segment intensity (0 to 15)
LDI   R18, 5          ;intensity level = 8
RCALL send_bytes      ;send command & data to MAX7219
      ;--------------------------------------------------------
LDI   R17, 0x09       ;set decoding mode command
LDI   R18, 0b11001111 ;decoding byte
RCALL send_bytes      ;send command & data to MAX7219
      ;--------------------------------------------------------
LDI   R17, 0x0B       ;set scan limit command
LDI   R18, 0x07       ;8 digits connected to MAX7219
RCALL send_bytes      ;send command & data to MAX7219
      ;--------------------------------------------------------
LDI   R17, 0x0C       ;set turn ON/OFF command
LDI   R18, 0x01       ;turn ON MAX7219
RCALL send_bytes      ;send command & data to MAX7219
      ;--------------------------------------------------------
RET
;==============================================================

uptime_logic:
LDI R25,0
LDI R17, 0x04
MOV R18, R25
RCALL send_bytes

agn3:
LDI R29,0
LDI R17, 0x03
MOV R18, R29
RCALL send_bytes

agn2:
LDI R30,0
LDI R17,0x02
MOV R18, R30
RCALL send_bytes

agn1:
LDI R31,0
loopA:
LDI R17, 0x01
MOV R18, R31
RCALL send_bytes
INC R31
CPI R31, 11
BREQ inc_MSD
RCALL delay_timer1
RJMP loopA

inc_MSD:
RCALL DHT11_sensor
LDI R17, 0x02
INC R30
CPI R30,6
BREQ inc_min
MOV R18,R30
RCALL send_bytes
RJMP agn1

inc_min:
LDI R17,0x03
INC R29
CPI R29,10
BREQ inc_min2
MOV R18,R29
RCALL send_bytes
RJMP agn2

inc_min2:
;RCALL DHT11_sensor
LDI R17,0x04
INC R25
CPI R25,3  ;CP R25,R15
BREQ backtoStart
MOV R18,R25
RCALL send_bytes
RJMP agn3




send_bytes:
CBI   PORTB, SS       ;enable slave device MAX7219
OUT   SPDR, R17       ;transmit command
      ;--------------------------------------------------------
ll2:  
IN    R19, SPSR
SBRS  R19, SPIF       ;wait for byte transmission
RJMP  ll2             ;to complete
      ;--------------------------------------------------------
OUT   SPDR, R18       ;transmit data
      ;--------------------------------------------------------
ll3:  
IN    R19, SPSR
SBRS  R19, SPIF       ;wait for byte transmission
RJMP  ll3             ;to complete
      ;--------------------------------------------------------
SBI   PORTB, SS       ;disable slave device MAX7219
RET


delay_timer1: ; 1 sec delay via timer1
.EQU value, 62498    ;62498
  ;-------------------------------------------------------
CLR R20 ; Clear R20 to be 0
STS TCNT1H, R20 ; Store R20 to High Byte TCNT1
STS TCNT1L, R20 ;initialize counter TCNT1 = 0
LDI R20, hi8(value) ; Store high byte from value to R20
STS OCR1AH, R20 ; Store Content from R20 to OCR1AH
LDI R20, lo8(value) ; Store low byte from value to R20
STS OCR1AL, R20 ; Store Content from R20 to OCR1AL
  ;-------------------------------------------------------
CLR R20 ; Clear R20 to be 0
STS TCCR1A, R20 ; Store content from R20 to TCCR1A
LDI R20, 0b00001100 ; Store a byte to R20
STS TCCR1B, R20 ; CTC mode, prescaler = 256
  ;-------------------------------------------------------
lo4:
IN R20, TIFR1 ;get TIFR1 byte & check
SBRS R20, OCF1A ;if OCF1=1, skip next instruction
RJMP lo4 ;else, loop back & check OFC flag
  ;-------------------------------------------------------
LDI R20, 1<<OCF1A 
OUT TIFR1, R20 ;clear OCF1A and OFC1B flag
  ;-------------------------------------------------------
CLR R20
STS TCCR1B, R20 ;stop timer0
RET

delay_timer0:             ;50 usec delay via Timer 0
    ;---------------------------------------------------------
CLR   R20
OUT   TCNT0, R20      ;initialize timer0 with count=0
LDI   R20, 100
OUT   OCR0A, R20      ;OCR0 = 100
LDI   R20, 0b00001010
OUT   TCCR0B, R20     ;timer0: CTC mode, prescaler 64
    ;---------------------------------------------------------
l2: 
IN    R20, TIFR0      ;get TIFR0 byte & check
SBRS  R20, OCF0A      ;if OCF0=1, skip next instruction
RJMP  l2              ;else, loop back & check OCF0 flag
    ;---------------------------------------------------------
CLR   R20
OUT   TCCR0B, R20     ;stop timer0
    ;---------------------------------------------------------
LDI   R20, (1<<OCF0A)
OUT   TIFR0, R20      ;clear OCF0 flag
RET

convtemp:		;convert and send temperature
;--------------
CLR   R26             ;set counter1, initial value 0 , ini digit ratusann atau puluhan?
CLR   R27             ;set counter2, initial value 0 , ini digit puluhan atau satuan?
      ;--------------------------------------------------------
l70:  
CPI   R28, 100        ;compare R28 with 100
Ret: 
BRMI  l80             ;jump when R28 < 100
INC   R26             ;increment counter1 by 1
SUBI  R28, 100        ;R28 = R28 - 100
RJMP  l70
      ;--------------------------------------------------------
l80:  
CPI   R28, 10         ;compare R28 with 10
BRMI  dsp        ;jump when R28 < 10
INC   R27             ;increment counter2 by 1
SUBI  R28, 10         ;R28 = R28 - 10				6+5+4+3+2+1
RJMP  l80
RET
      ;--------------------------------------------------------  
dsp:  
MOV   R18, R27
LDI   R17, 0x08        ;select digit, R29 ganti dengan 0x01
RCALL send_bytes      ;send command & data to MAX7219
      ;--------------------------------------------------------
MOV   R18, R28
MOV   R17, 0x07      ;select digit, R30 ganti dengan 0x02
RCALL send_bytes      ;send command & data to MAX7219    
      ;--------------------------------------------------------
RET

DHT11_sensor:
;-----------------------------------------------------------------
;agn:RCALL delay_2s      ;wait 2s for DHT11 to get ready, bisa diganti ke 3s, mungkin ini gabutuh
;-----------------------------------------------------------------
;start_signal
;------------
SBI   DDRD, 7       ;pin PD7 as o/p
CBI   PORTD, 7      ;first, send low pulse
RCALL delay_20ms    ;for 20ms
SBI   PORTD, 7      ;then send high pulse
;-----------------------------------------------------------------
;responce signal
;---------------
CBI   DDRD, 7       ;pin PD7 as i/p
w1: 
SBIC  PIND, 7
RJMP  w1            ;wait for DHT11 low pulse
w2: SBIS  PIND, 7
RJMP  w2            ;wait for DHT11 high pulse
w3: 
SBIC  PIND, 7
RJMP  w3            ;wait for DHT11 low pulse
;-----------------------------------------------------------------
RCALL DHT11_reading ;read humidity (1st byte of 40-bit data)
MOV   R13, R24
RCALL DHT11_reading
RCALL DHT11_reading ;read temp (3rd byte of 40-bit data)
;-----------------------------------------------------------------
;convert temp & humidity bytes to decimal & display on MAX7219
;-------------------------------------------------------------
MOV   R28, R24		;4 line ini bakal ga butuh
    ;LDI   R29, 0x07
    ;LDI   R30, 0x06
    ;-------------------
RCALL convtemp  ;temp in decimal
    ;-------------------
    ;MOV   R28, R25
    ;LDI   R29, 0x02
    ;LDI   R30, 0x01
    ;-------------------
    ;RCALL convtemp  ;humidity in decimal
    ;-------------------
    ;RJMP  agn           ;go back & get another sensor reading
RET
;=================================================================
DHT11_reading:
LDI   R16, 8        ;set counter for receiving 8 bits
CLR   R24           ;clear data register
    ;-------------------------------------------------------
w4: 
SBIS  PIND, 7
RJMP  w4            ;detect data bit (high pulse)
RCALL delay_timer0  ;wait 50us & then check bit value
    ;-------------------------------------------------------
SBIS  PIND, 7       ;if received bit=1, skip next inst
RJMP  skp           ;else, received bit=0, jump to skp
SEC                 ;set carry flag (C=1)
ROL   R24           ;shift in 1 into LSB data register
RJMP  w5            ;jump & wait for low pulse
skp:
LSL   R24           ;shift in 0 into LSB data register
    ;-------------------------------------------------------
w5: 
SBIC  PIND, 7
RJMP  w5            ;wait for DHT11 low pulse
    ;-------------------------------------------------------
DEC   R16           ;decrement counter
BRNE  w4            ;go back & detect next bit
RET                 ;return to calling subroutine
;=================================================================
;delay subroutines
;=================================================================
delay_20ms:             ;delay 20ms
LDI   R21, 255
l3: 
LDI   R22, 210
l4: 
LDI   R23, 2
l5: 
DEC   R23
BRNE  l5
DEC   R22
BRNE  l4
DEC   R21
BRNE  l3
RET

init_interrupt:
;CLR R24 			; clear R24 to 0
CBI DDRD,3
CBI DDRD,4
CBI DDRD,5
CBI DDRD,6
CBI DDRD, 2 		; Input pull up INT 0 (Pin 2)
SBI PORTD, 2
LDI R16, (1 << ISC01)   ; Falling Edge mode source = INT0 and INT1?
STS EICRA, R16
SBI EIMSK, INT0		; Enable INT0
SEI				; Enable global interrupts
RET


choose10:
LDI R25,1
MOV R15,R25
RCALL SPI_MAX7219_init
RCALL disp_space
RJMP uptime_logic

choose20:
LDI R25,2
MOV R15, R25
RCALL SPI_MAX7219_init
RCALL disp_space
RJMP uptime_logic

choose30:
LDI R25,3
MOV R15,R25
RCALL SPI_MAX7219_init
RCALL disp_space
RJMP uptime_logic

disp_space:
LDI R17,0x05
LDI R18,0x00
RCALL send_bytes

LDI R17,0x06
LDI R18,0x4E
RCALL send_bytes
RET


reset:
;RCALL shutdown_MAX
;RJMP shutdown_MAX
SBI EIFR, INTF0   ; Return from interrupt
RETI
