.model small
.stack 100h

.code
main proc

    mov al, 'A'      ; AL = 01000001 = 65
    mov cl, 6        ; rotate left by 6 positions

    rol al, cl       ; rotate: 01000001 → 01010000 = 'P'

    mov ah, 02h
    mov dl, al       ; print result ('P')
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
