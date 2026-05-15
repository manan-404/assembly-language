.model small
.stack 100h

.data
    str     db "The character displayed using procedure is: $"
    newline db 0Ah, 0Dh, '$'

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 01h
    int 21h          ; read character
    mov bl, al       ; save in BL (shared with procedure)

    call showLetter  ; call the procedure

    mov ah, 4ch
    int 21h

main endp

showLetter proc

    mov ah, 09h
    mov dx, offset newline
    int 21h          ; print newline

    mov dx, offset str
    int 21h          ; print message

    mov ah, 02h
    mov dl, bl       ; print the character from BL
    int 21h

    ret

showLetter endp

end main
