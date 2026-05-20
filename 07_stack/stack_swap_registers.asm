.model small
.stack 100h

.code
main proc

    mov ax, 20       ; AX = 20
    push ax          ; stack: [20]

    mov bx, 30       ; BX = 30
    push bx          ; stack: [20, 30]

    pop ax           ; AX = 30 (last in, first out)
    pop bx           ; BX = 20

    mov ah, 4ch
    int 21h

main endp
end main
