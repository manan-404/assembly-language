.model small
.stack 100h

.code
main proc

    mov al, 3
    mov bl, 7

    call assign      ; procedure preserves AL and BL

    add al, 48       ; convert to ASCII
    add bl, 48

    mov ah, 02h
    mov dl, al       ; print AL (still 3)
    int 21h

    mov dl, bl       ; print BL (still 7)
    int 21h

    mov ah, 4ch
    int 21h

main endp

assign proc

    push ax          ; save AX
    push bx          ; save BX

    mov al, 8        ; modify (but will be undone)
    mov bl, 7

    pop bx           ; restore BX
    pop ax           ; restore AX

    ret

assign endp

end main
