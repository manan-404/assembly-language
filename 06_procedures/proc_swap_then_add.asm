.model small
.stack 100h

.code
main proc

    mov ax, 50
    mov bx, 80

    call swapNums    ; swap AX and BX
    call addNums     ; add them, result in CX

    mov ah, 02h
    mov dx, cx       ; print result
    int 21h

    mov ah, 4ch
    int 21h

main endp

swapNums proc

    push ax
    push bx

    pop ax           ; AX gets BX's value
    pop bx           ; BX gets AX's value

    ret

swapNums endp

addNums proc

    push ax

    add ax, bx       ; ax = ax + bx
    mov cx, ax       ; store result in CX

    pop ax

    ret

addNums endp

end main
