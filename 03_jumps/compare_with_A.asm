.model small
.stack 50h

.data
    str  db "Both characters are equal$"
    str1 db "Both characters are not equal$"

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 01h
    int 21h          ; read character into AL

    cmp al, 'A'      ; compare input with 'A'
    je ifequal       ; if equal, jump to ifequal

    ; not equal block
    mov ah, 02h
    mov dl, 10
    int 21h
    mov ah, 09h
    mov dx, offset str1
    int 21h
    jmp done         ; skip the equal block

    ifequal:
        mov ah, 09h
        mov dx, offset str
        int 21h

    done:

    mov ah, 4ch
    int 21h

main endp
end main
