.model small
.stack 50h

.code
main proc

    mov ah, 01h   ; read character from keyboard into AL
    int 21h

    mov bl, al    ; save input to BL

    mov ah, 02h   ; print character
    mov dl, bl
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
