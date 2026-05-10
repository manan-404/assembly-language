.model small
.stack 100h

.data
    buffer db 50 dup('$')
    msg    db "Length: $"
    count  db 0

.code
main proc

    mov ax, @data
    mov ds, ax
    mov es, ax

    lea di, buffer       ; DI points to buffer

    l1:
        mov ah, 01h
        int 21h          ; read character

        cmp al, 13       ; Enter pressed?
        je done

        stosb            ; store character in buffer
        inc count        ; increment length counter
    jmp l1

    done:
    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    mov ah, 09h
    mov dx, offset msg   ; print "Length: "
    int 21h

    mov ah, 02h
    mov dl, count        ; print count
    add dl, 48           ; convert to ASCII
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
