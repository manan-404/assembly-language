.model small
.stack 100h

.code
main proc

    mov ax, 10
    mov bx, 20

    call addNums     ; result will be in CX

    mov ah, 02h
    mov dx, cx       ; print result
    int 21h

    mov ah, 4ch
    int 21h

main endp

addNums proc

    push ax          ; save AX

    add ax, bx       ; ax = ax + bx
    mov cx, ax       ; return result in CX

    pop ax           ; restore AX

    ret

addNums endp

end main
