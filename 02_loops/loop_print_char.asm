.model small
.stack 50h

.code
main proc

    mov cx, 5        ; loop 5 times
    label1:
        mov ah, 02h
        mov dl, 'a'
        int 21h
    loop label1      ; cx--, if cx != 0 jump back to label1

    mov ah, 4ch
    int 21h

main endp
end main
