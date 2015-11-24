fprint epu 4
pout epu 1
lenW epu 2
exit epu 1


section	 .text
global _start


_start
mov ecx, arrw ; oder cx beim 8086
mov [ecx] , 0x9000
add ecx , 2 ; nächste Speicherstelle
mov [ecx] , 0xA000
add ecx , 2 ; nächste Speicherstelle
mov [ecx] , 0xA100
mov edx , lenW
mov eax , fprint
mov ebx , pout

int 0x80

mov eax , exit
mov ebx , 0
int 0x80


section	 .data   
arrw DW 0,0,0   
