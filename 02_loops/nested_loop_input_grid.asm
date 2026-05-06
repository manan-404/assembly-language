.model small
.stack 50h

.code
main proc

    mov cx, 4         ; outer loop: 4 rows
    outer1:
        mov bx, cx   ; save outer CX in BX

        mov cx, 6    ; inner loop: 6 columns
        inner1:
            mov ah, 01h
            int 21h  ; read one character
        loop inner1

        mov ah, 02h
        mov dl, 10   ; print newline after each row
        int 21h

        mov cx, bx   ; restore outer CX from BX
    loop outer1

    mov ah, 4ch
    int 21h

main endp
end main
