.model small
.stack 100h

.code
main proc

    mov al, 3
    mov bl, 7

    call assign      ; procedure will overwrite AL and BL

    add al, 48       ; convert to ASCII
    add bl, 48

    mov ah, 02h
    mov dl, al       ; print AL (will be 8, not 3)
    int 21h

    mov dl, bl       ; print BL (will be 7)
    int 21h

    mov ah, 4ch
    int 21h

main endp

assign proc

    mov al, 8        ; overwrites caller's AL
    mov bl, 7        ; overwrites caller's BL

    ret

assign endp

end main
