.model small
.stack 100h

.code
main proc

    mov ax, 0

    call sumLoop

    mov ah, 02h
    mov dx, ax       ; print final sum
    int 21h

    mov dx, bx       ; print original value
    int 21h

    mov ah, 4ch
    int 21h

main endp

sumLoop proc

    push ax          ; save original AX (0)

    mov cx, 5
    adding:
        add ax, 2    ; add 2 each time
    loop adding

    pop bx           ; restore original into BX (not AX)

    ret

sumLoop endp

end main
