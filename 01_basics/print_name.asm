.model small
.stack 100h

.code
main proc

    mov ah, 02h
    mov dl, 'A'
    int 21h

    mov ah, 02h
    mov dl, 'B'
    int 21h

    mov ah, 02h
    mov dl, 'D'
    int 21h

    mov ah, 02h
    mov dl, 'U'
    int 21h

    mov ah, 02h
    mov dl, 'L'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'M'
    int 21h

    mov ah, 02h
    mov dl, 'A'
    int 21h

    mov ah, 02h
    mov dl, 'N'
    int 21h

    mov ah, 02h
    mov dl, 'A'
    int 21h

    mov ah, 02h
    mov dl, 'N'
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
