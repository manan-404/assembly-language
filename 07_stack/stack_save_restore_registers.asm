.model small
.stack 100h

.code
main proc

    ; set original values
    mov ax, 1
    mov bx, 2
    mov cx, 3
    mov dx, 4

    ; save all registers
    push ax              ; stack: [1]
    push bx              ; stack: [1, 2]
    push cx              ; stack: [1, 2, 3]
    push dx              ; stack: [1, 2, 3, 4]

    ; modify all registers (simulate some operation)
    mov ax, 10
    mov bx, 20
    mov cx, 30
    mov dx, 40

    ; restore all registers (reverse order — critical)
    pop dx               ; DX = 4
    pop cx               ; CX = 3
    pop bx               ; BX = 2
    pop ax               ; AX = 1

    ; print AX to confirm restoration (should print 1)
    add ax, 48           ; convert to ASCII
    mov ah, 02h
    mov dl, al
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main