.model small
.stack 100h

.code
main proc

    mov bl, 3        ; value to add

    mov ah, 01h
    int 21h          ; read character into AL
    mov cl, al

    add cl, bl       ; add 3 to character (ASCII math)

    mov ah, 02h
    mov dl, 10       ; newline
    int 21h

    mov dl, cl       ; print result
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
