.model small
.stack 50h

.code
main proc

    mov ah, 01h
    int 21h          ; read character to skip
    mov bl, al       ; save it

    mov ah, 02h
    mov dl, 10       ; newline
    int 21h

    mov cx, 26       ; 26 letters
    mov bl, 'a'      ; start from 'a'

    repeat:
        cmp al, bl   ; compare input with current letter
        je skip      ; if match, skip printing

        mov ah, 02h
        mov dl, bl
        int 21h      ; print current letter

        skip:
        inc bl       ; move to next letter
    loop repeat

    mov ah, 4ch
    int 21h

main endp
end main
