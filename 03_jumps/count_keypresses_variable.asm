.model small
.stack 50h

.data
    count db 0

.code
main proc

    mov ax, @data
    mov ds, ax

    mov cx, 6        ; max 6 keypresses
    l1:
        mov ah, 01h
        int 21h      ; read character

        inc count    ; increment memory variable directly
    loop l1

    add count, 48    ; convert count to ASCII

    mov ah, 02h
    mov dl, 10       ; newline
    int 21h

    mov dl, count    ; print count
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main