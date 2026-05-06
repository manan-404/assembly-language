.model small
.stack 50h

.code
main proc

    mov cx, 5        ; loop 5 times
    mov bl, '0'      ; start from '0'

    repeat1:
        mov ah, 02h
        mov dl, bl
        int 21h

        add bl, 2    ; skip one digit (jump by 2)

        mov ah, 02h
        mov dl, ' '
        int 21h

    loop repeat1

    mov ah, 4ch
    int 21h

main endp
end main
