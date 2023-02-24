
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
name "numero_maggiore_minore"
org 100h

.data
Numero db ?
messaggio1 db "inserisci il numero $"
messaggiomin db "0 $"
messaggiomag db "1 $"
tornaacapo db 10, 13 , "$"

.code

mov dx, offset messaggio1  ;scrive il messaggio per inserire il numero
mov ah, 09h
int 21h 

mov ah, 01h     ;inserisco il numero
int 21h

CMP al, 00H  ;controlla che l'utente non prema enter
JZ fine   ;se preme enter allora il 

cmp al, 040h   ;verifica che non vengano inserite lettere dall'utente
jb controllo 
cmp al, 099h
ja controllo
JMP fine 

controllo:
cmp al, 053   ;verifica che in al sia presente 5 (in ASCII 053)
jnb superiore   ;se è maggiore salta su superiore
JMP minore    ;se è minore salta su minore

minore:

mov DX, offset tornaacapo     ;torna a capo per una maggiore leggibilità
mov ah, 09H 
int 21h

mov dx, offset messaggiomin    ;scrive 0 in quanto è minore di 5
mov ah, 09h
int 21h 
JMP fine  ;salta su fine per terminare il programma

superiore:

mov DX, offset tornaacapo    ;torna a capo per una maggiore leggibilità
mov ah, 09H 
int 21h

mov dx, offset messaggiomag    ;scrive 1 in quanto è maggiore di 5
mov ah, 09h
int 21h 
 
fine:

ret