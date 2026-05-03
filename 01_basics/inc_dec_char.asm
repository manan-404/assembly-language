.model small
.stack 50h

.code
main proc

    mov ah, 01h   ; read character
    int 21h
    mov bl, al

    mov ah, 02h
    mov dl, 10    ; newline
    int 21h

    inc bl
    mov dl, bl    ; print next character (char + 1)
    int 21h

    mov dl, 10
    int 21h

    dec bl
    dec bl
    mov dl, bl    ; print previous character (char - 1)
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
