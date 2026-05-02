.model small
.stack 100h

.code
main proc

    mov ah, 01h   ; read first character
    int 21h
    mov bl, al

    mov ah, 01h   ; read second character
    int 21h
    mov bh, al

    mov ah, 02h
    mov dl, bl    ; print first character
    int 21h

    mov dl, 10    ; print newline
    int 21h

    mov dl, bh    ; print second character
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
