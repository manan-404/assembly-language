.model small
.stack 50h

.code
main proc

    mov ah, 01h
    int 21h           ; read character into AL
    mov bl, al        ; save input

    mov al, 'z'
    sub al, bl        ; calculate distance from input to 'z'
    inc al            ; include the input character itself
    mov cx, ax        ; set as loop count

    repeat1:
        mov ah, 02h
        mov dl, bl
        int 21h
        inc bl        ; move to next character
    loop repeat1

    mov ah, 4ch
    int 21h

main endp
end main
