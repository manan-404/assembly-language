.model small
.stack 50h

.code
main proc

    mov ah, 01h   ; read first digit
    int 21h
    mov bl, al

    mov ah, 01h   ; read second digit
    int 21h
    mov cl, al

    add bl, cl    ; add both (still have double ASCII offset)
    sub bl, 48    ; subtract one ASCII offset to correct

    mov ah, 02h
    mov dl, bl
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
