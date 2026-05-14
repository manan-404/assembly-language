.model small
.stack 100h

.code
main proc

    mov al, 'A'      ; AL = 01000001 = 65
    mov cl, 4        ; rotate right by 4 positions

    ror al, cl       ; rotate: 01000001 → 00010100

    mov ah, 02h
    mov dl, al       ; print result
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
