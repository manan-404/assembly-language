.model small
.stack 100h

.data
    str  db "hello world$"
    str1 db 20 dup('$')  ; buffer of 20 bytes filled with '$'

.code
main proc

    mov ax, @data
    mov ds, ax

    mov si, 0            ; SI = source index, start at 0
    mov cx, 20           ; max 20 characters

    l1:
        mov ah, 01h
        int 21h          ; read one character into AL

        cmp al, 13       ; Enter key pressed?
        je done          ; if yes, stop

        mov str1[si], al ; store character in buffer
        inc si           ; move to next position
    loop l1

    done:
    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    mov ah, 09h
    mov dx, offset str1  ; print the stored string
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
