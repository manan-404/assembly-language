.model small
.stack 50h

.code
main proc

    mov cx, 5            ; outer loop: 5 rows
    outer1:
        mov dx, cx       ; save outer CX in DX

        mov cx, 4        ; inner loop: 4 characters
        mov bl, 'A'      ; start from 'A'
        inner1:
            mov ah, 02h
            mov dl, bl
            int 21h
            inc bl       ; next character
        loop inner1

        mov ah, 02h
        mov dl, 10       ; newline after each row
        int 21h

        mov cx, dx       ; restore outer CX
    loop outer1

    mov ah, 4ch
    int 21h

main endp
end main
