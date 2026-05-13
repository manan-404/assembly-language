.model small
.stack 100h

.code
main proc

    mov ah, 01h
    int 21h          ; read first digit
    sub al, 48       ; convert to number
    mov bl, al       ; save in BL

    mov ah, 01h
    int 21h          ; read second digit
    sub al, 48       ; convert to number

    imul bl          ; AX = AL * BL

    add al, 48       ; convert result back to ASCII

    mov ah, 02h
    mov dl, al       ; print result
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
