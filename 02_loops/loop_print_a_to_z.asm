.model small
.stack 50h

.code
main proc

    mov cx, 26       ; 26 letters in alphabet
    mov bl, 'A'      ; start from 'A'

    repeat1:
        mov ah, 02h
        mov dl, bl
        int 21h

        mov ah, 02h
        mov dl, ' '  ; space between letters
        int 21h

        inc bl       ; move to next letter
    loop repeat1

    mov ah, 4ch
    int 21h

main endp
end main
