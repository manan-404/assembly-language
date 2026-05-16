.model small
.stack 100h

.code
main proc

    call printNums   ; call procedure

    mov ah, 4ch
    int 21h

main endp

printNums proc

    mov bl, '0'
    mov cx, 10       ; loop 10 times

    start:
        mov ah, 02h
        mov dl, bl
        int 21h      ; print digit
        inc bl       ; next digit
    loop start

    ret

printNums endp

end main
