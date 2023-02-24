name "higher_lower_number_EN"
org 100h

.data
message db "insert the number $"
messagelower db "The number is lower than 5 $"
messagehigher db "The number is higher or equal to 5 $"
newline db 10, 13 , "$"

.code

mov dx, offset message  ;writes the message to enter the number
mov ah, 09h
int 21h 

mov ah, 01h     ;insert the number
int 21h

CMP al, 00H  ;verify that the user doesn't press ENTER
JNZ end   ;if he presses it, then it goes to END 

cmp al, 040h   ;check that no letters from the user are entered
jb check 
cmp al, 099h
ja check
JMP end 

check:
cmp al, 053   ;check that in al there is 5 (ASCII 053)
jnb higher   ;if it is higher, it jumps to HIGHER
JMP lower    ;if it is lower, it jump to LOWER

lower:

mov DX, offset newline     ;new line for a better readability
mov ah, 09H 
int 21h

mov dx, offset messagelower    ;writes 0 as it is lower than 5
mov ah, 09h
int 21h 
JMP end  ;jump on END to end the program

higher:

mov DX, offset newline    ;new line for a better readability
mov ah, 09H 
int 21h

mov dx, offset messagehigher    ;writes 1 as it is higher or equal than 5
mov ah, 09h
int 21h 
 
end:

ret
