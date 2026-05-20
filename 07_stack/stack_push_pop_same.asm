.model small
.stack 100h

.code
main proc

    mov ax, 7

    push ax          ; stack: [7]
    push ax          ; stack: [7, 7]
    push ax          ; stack: [7, 7, 7]

    pop ax           ; AX = 7
    pop ax           ; AX = 7
    pop bx           ; BX = 7

    mov ah, 4ch
    int 21h

main endp
end main
