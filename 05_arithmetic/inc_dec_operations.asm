.model small
.stack 100h

.code
main proc

    mov ah, 01h      ; read character
    int 21h
    mov bl, al       ; save input

    mov ah, 02h
    mov dl, 10       ; newline
    int 21h

    dec bl
    dec bl
    mov dl, bl       ; print char - 2
    int 21h

    inc bl
    inc bl
    inc bl
    mov dl, bl       ; print char + 1
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
