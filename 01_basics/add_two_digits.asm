.model small
.stack 50h

.code
main proc

    mov bl, 2
    mov cl, 3

    add bl, cl    ; bl = 5
    add bl, 48    ; convert to ASCII ('5' = 53)

    mov ah, 02h
    mov dl, bl
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
