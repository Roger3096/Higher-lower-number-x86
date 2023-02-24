name "higher_lower_number_IT"
org 100h

.data
Numero db ?
messaggio1 db "inserisci il numero $"
messaggiomin db "il numero e' minore di 5 $"
messaggiomag db "il numero e' maggiore o uguale a 5 $"
tornaacapo db 10, 13 , "$"

.code

mov dx, offset messaggio1  ;scrive il messaggio per inserire il numero
mov ah, 09h
int 21h 

mov ah, 01h     ;inserisco il numero
int 21h

CMP al, 00H  ;controlla che l'utente non prema enter
JNZ fine   ;se preme enter allora il 

cmp al, 040h   ;verifica che non vengano inserite lettere dall'utente
jb controllo 
cmp al, 099h
ja controllo
JMP fine 

controllo:
cmp al, 053   ;verifica che in al sia presente 5 (in ASCII 053)
jnb superiore   ;se ? maggiore salta su superiore
JMP minore    ;se ? minore salta su minore

minore:

mov DX, offset tornaacapo     ;torna a capo per una maggiore leggibilit?
mov ah, 09H 
int 21h

mov dx, offset messaggiomin    ;scrive 0 in quanto ? minore di 5
mov ah, 09h
int 21h 
JMP fine  ;salta su fine per terminare il programma

superiore:

mov DX, offset tornaacapo    ;torna a capo per una maggiore leggibilit?
mov ah, 09H 
int 21h

mov dx, offset messaggiomag    ;scrive 1 in quanto ? maggiore di 5
mov ah, 09h
int 21h 
 
fine:

ret