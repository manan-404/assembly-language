.model small
.stack 50h

.data
    str db "Hello world$"

.code
main proc

    mov ax, @data  ; load address of data segment
    mov ds, ax     ; point DS register to our data

    mov ah, 09h    ; print string function
    mov dx, offset str
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
