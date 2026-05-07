.model small
.stack 50h

.data
    str  db "First is bigger$"
    str1 db "First is smaller$"

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 01h      ; read first character
    int 21h
    mov bl, al

    mov ah, 01h      ; read second character
    int 21h

    cmp bl, al       ; compare first with second
    jge first_bigger ; if first >= second

    ; first is smaller
    mov ah, 09h
    mov dx, offset str1
    int 21h
    jmp done

    first_bigger:
        mov ah, 09h
        mov dx, offset str
        int 21h

    done:

    mov ah, 4ch
    int 21h

main endp
end main
