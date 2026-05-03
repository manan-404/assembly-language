.model small
.stack 50h

.code
main proc

    mov ah, 01h   ; read character
    int 21h
    mov bl, al

    mov ah, 02h
    mov dl, 10    ; print newline
    int 21h

    mov dl, bl    ; print the character
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
