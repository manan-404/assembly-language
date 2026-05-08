.model small
.stack 50h

.data
    upper  db "Uppercase letter$"
    lower  db "Lowercase letter$"
    digit  db "Digit$"
    other  db "Other character$"

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 01h
    int 21h              ; read character into AL

    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    ; check uppercase A-Z
    cmp al, 'A'
    jl check_lower
    cmp al, 'Z'
    jg check_lower
    mov ah, 09h
    mov dx, offset upper
    int 21h
    jmp done

    check_lower:
    cmp al, 'a'
    jl check_digit
    cmp al, 'z'
    jg check_digit
    mov ah, 09h
    mov dx, offset lower
    int 21h
    jmp done

    check_digit:
    cmp al, '0'
    jl is_other
    cmp al, '9'
    jg is_other
    mov ah, 09h
    mov dx, offset digit
    int 21h
    jmp done

    is_other:
    mov ah, 09h
    mov dx, offset other
    int 21h

    done:

    mov ah, 4ch
    int 21h

main endp
end main
