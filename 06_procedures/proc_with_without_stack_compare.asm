.model small
.stack 100h

.code
main proc

    ; --- without stack ---
    mov bl, 4
    mov cl, 2

    call myfn_no_stack

    add bl, 48
    mov ah, 02h
    mov dl, bl       ; BL is now modified by procedure
    int 21h

    mov dl, 10
    int 21h

    ; --- with stack ---
    mov bl, 4
    mov cl, 2

    call myfn_with_stack

    add bl, 48
    mov ah, 02h
    mov dl, bl       ; BL is preserved — still 4
    int 21h

    mov ah, 4ch
    int 21h

main endp

myfn_no_stack proc

    mov bl, 4
    mov cl, 1
    add bl, cl
    add bl, 48

    mov ah, 02h
    mov dl, bl
    int 21h

    mov dl, 10
    int 21h

    ret

myfn_no_stack endp

myfn_with_stack proc

    push bx
    push cx

    mov bl, 4
    mov cl, 1
    add bl, cl
    add bl, 48

    mov ah, 02h
    mov dl, bl
    int 21h

    mov dl, 10
    int 21h

    pop cx
    pop bx           ; restore original values

    ret

myfn_with_stack endp

end main
