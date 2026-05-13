.model small
.stack 100h

.code
main proc

    mov ah, 01h
    int 21h          ; read first digit
    mov bl, al
    sub bl, 48       ; convert from ASCII to number

    mov ah, 02h
    mov dl, 10       ; newline
    int 21h

    mov ah, 01h
    int 21h          ; read second input
    mov cl, al

    add cl, bl       ; add number to second input

    mov ah, 02h
    mov dl, 10
    int 21h

    mov dl, cl       ; print result
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
