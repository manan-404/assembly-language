.model small
.stack 50h

.code
main proc

    mov cx, 5            ; 5 rows
    mov dx, 1            ; current row number (starts at 1)

    outer1:
        mov bx, cx       ; save outer CX

        mov cx, dx       ; inner loop runs 'row number' times
        mov bl, dl       ; current digit (1 to 5)
        add bl, 48       ; convert to ASCII

        inner1:
            mov ah, 02h
            mov dl, bl   ; print row digit
            int 21h

            mov ah, 02h
            mov dl, ' '  ; space
            int 21h
        loop inner1

        mov ah, 02h
        mov dl, 10       ; newline after each row
        int 21h

        mov cx, bx       ; restore outer CX
        mov dl, cl       ; restore DL from remaining outer count

        ; recalculate row number = 6 - cx (since cx counts down)
        mov dl, 6
        sub dl, cl       ; row 1 when cx=5, row 2 when cx=4...

    loop outer1

    mov ah, 4ch
    int 21h

main endp
end main
