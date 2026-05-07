.model small
.stack 50h

.code
main proc

    mov ah, 02h
    mov dl, 'M'
    int 21h          ; prints M

    jmp skip         ; jump over the next block

    mov ah, 02h
    mov dl, 'T'
    int 21h          ; this line is NEVER reached

    skip:
    mov ah, 02h
    mov dl, 'A'
    int 21h          ; prints A

    mov ah, 4ch
    int 21h

main endp
end main
