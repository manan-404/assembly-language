.model small
.stack 50h

.code
main proc

    mov ah, 01h   ; read first digit
    int 21h
    mov bl, al

    mov ah, 02h
    mov dl, 10    ; newline
    int 21h

    mov ah, 01h   ; read second digit
    int 21h
    mov cl, al

    sub bl, cl    ; subtract second from first
    add bl, 48    ; convert result to ASCII

    mov ah, 02h
    mov dl, 10
    int 21h

    mov dl, bl
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
