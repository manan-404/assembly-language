.model small
.stack 100h

.data
    count dw 1
    char  db 'A'

.code
main proc

    mov ax, @data
    mov ds, ax

    mov cx, 5            ; 5 rows
    outer:
        push cx          ; save outer CX on stack

        mov ah, 02h
        mov cx, count    ; inner loop runs 'count' times
        inner:
            mov dl, char
            int 21h      ; print current character
        loop inner

        mov dl, 10       ; newline after each row
        int 21h

        inc char         ; move to next character (A→B→C...)
        inc count        ; increase repeat count

        pop cx           ; restore outer CX from stack
    loop outer

    mov ah, 4ch
    int 21h

main endp
end main
