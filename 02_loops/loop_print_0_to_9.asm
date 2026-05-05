.model small
.stack 50h

.code
main proc

    mov cx, 10       ; loop 10 times
    mov bl, '0'      ; start from character '0'

    repeat1:
        mov ah, 02h
        mov dl, bl
        int 21h

        inc bl       ; move to next character

        mov ah, 02h
        mov dl, ' '  ; print space between digits
        int 21h

    loop repeat1

    mov ah, 4ch
    int 21h

main endp
end main
