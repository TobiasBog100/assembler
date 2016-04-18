
.device ATtiny26
.nolist
.include "tn26def.inc"
.list

.def TEMP = R16
.def RSWAP = R17


 
.cseg

.org 0x000
rjmp Init

.org 0x001
rjmp interrupt0 

rjmp Init

Init:

ldi TEMP, RAMEND
out SP, TEMP

ldi     ZL, LOW(swapbyte<<1)
ldi     ZH, HIGH(swapbyte<<1)

lpm TEMP, Z

sts byteram, TEMP


ldi TEMP, 0xFF
out DDRA, TEMP

ldi TEMP, 0b11100001
out DDRB, TEMP

ldi TEMP, 0b00000101
out TCCR0, TEMP

ldi TEMP, 0b00000000
out TCNT0, TEMP

ldi TEMP, 1<<ISC01
out MCUCR, TEMP
 
ldi TEMP, 1<<INT0 
out GIMSK, TEMP

sei


main:

ldi TEMP, 0xFF

loop:


out PORTA, TEMP
rcall delay
clc
ror TEMP
cpi TEMP, 0x00
brne loop

out PORTA, TEMP
rcall delay

rjmp main



delay:
push R18
push R19
lds  R18, byteram
ldi R19, 0x01

cpi R18, 0xF0
breq delay1

ldi R19, 0x0A


delay1:
Warten:
in R18, TIFR
sbrs R18, 1
rjmp Warten

ldi R18, 0b00000010
out TIFR, R18

dec R19
cpi R19, 0x00 
brne delay1

pop R19
pop R18
ret

interrupt0:
lds RSWAP, byteram
swap RSWAP
sts byteram, RSWAP
ldi RSWAP, 0xFF
out PORTA, RSWAP
reti


swapbyte: 
.db 0x0F

.DSEG
byteram:
.Byte 1

