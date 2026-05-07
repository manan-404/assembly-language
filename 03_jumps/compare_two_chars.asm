.model small
.stack 50h

.data
    str  db "First num is lower$"
    str1 db "Second num is lower$"

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 01h      ; read first character
    int 21h
    mov bl, al

    mov ah, 01h      ; read second character
    int 21h

    mov ah, 02h
    mov dl, 10       ; newline
    int 21h

    cmp bl, al       ; compare first with second
    jl first_lower   ; if first < second, jump

    ; second is lower
    mov ah, 09h
    mov dx, offset str1
    int 21h
    jmp done

    first_lower:
        mov ah, 02h
        mov dl, 10
        int 21h
        mov ah, 09h
        mov dx, offset str
        int 21h

    done:

    mov ah, 4ch
    int 21h

main endp
end main
