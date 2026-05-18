.model small
.stack 100h

.code
main proc

    mov ax, 0

    call countUp     ; AX will be 5 after this

    mov ah, 02h
    mov dx, ax
    int 21h

    mov ah, 4ch
    int 21h

main endp

countUp proc

    mov cx, 5
    count:
        inc ax       ; increment AX each iteration
    loop count

    ret

countUp endp

end main
