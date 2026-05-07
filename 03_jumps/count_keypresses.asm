.model small
.stack 50h

.code
main proc

    mov bl, '0'      ; counter starts at '0' (ASCII)
    mov cx, 9        ; max 9 keypresses

    repeat:
        mov ah, 01h
        int 21h      ; read character

        cmp al, 13   ; is it Enter key?
        je done      ; if yes, exit loop

        inc bl       ; increment counter
    loop repeat

    done:
    mov ah, 02h
    mov dl, bl       ; print count
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
