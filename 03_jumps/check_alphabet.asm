.model small
.stack 50h

.data
    alpha    db "Given character is alphabet$"
    notAlpha db "Given character is not alphabet$"

.code
main proc

    mov bx, @data
    mov ds, bx

    mov ah, 01h
    int 21h          ; read character into AL

    cmp al, 'a'
    jge check_upper  ; if al >= 'a', check upper bound
    jmp not_alpha    ; else not an alphabet

    check_upper:
        cmp al, 'z'
        jle is_alpha ; if al <= 'z', it's an alphabet
        jmp not_alpha

    is_alpha:
        mov ah, 02h
        mov dl, 10
        int 21h
        mov ah, 09h
        lea dx, alpha
        int 21h
        jmp done

    not_alpha:
        mov ah, 09h
        mov dx, offset notAlpha
        int 21h

    done:

    mov ah, 4ch
    int 21h

main endp
end main
