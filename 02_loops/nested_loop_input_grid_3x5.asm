.model small
.stack 50h

.code
main proc

    mov cx, 3            ; outer loop: 3 rows
    outer:
        mov bx, cx       ; save outer CX in BX

        mov cx, 5        ; inner loop: 5 columns
        inner:
            mov ah, 01h
            int 21h      ; read one character
        loop inner

        mov cx, bx       ; restore outer CX

        mov ah, 02h
        mov dl, 10       ; newline after each row
        int 21h

    loop outer

    mov ah, 4ch
    int 21h

main endp
end main