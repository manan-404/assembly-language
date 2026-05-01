.model small
.stack 100h

.code
main proc

    mov ah, 02h
    mov dl, 'A'       ; character literal
    int 21h

    mov ah, 02h
    mov dl, 65        ; decimal
    int 21h

    mov ah, 02h
    mov dl, 41h       ; hexadecimal
    int 21h

    mov ah, 02h
    mov dl, 01000001b ; binary
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
