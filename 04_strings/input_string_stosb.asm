.model small
.stack 100h

.data
    str  db "hello world$"
    str1 db 20 dup('$')

.code
main proc

    mov ax, @data
    mov ds, ax
    mov es, ax           ; ES must equal DS for stosb

    lea di, str1         ; DI points to destination buffer

    mov cx, 19           ; max 19 characters

    l1:
        mov ah, 01h
        int 21h          ; read character into AL

        cmp al, 13       ; Enter pressed?
        je done

        stosb            ; store AL at [DI], increment DI automatically
    loop l1

    done:
    mov ah, 02h
    mov dl, 10
    int 21h

    mov ah, 09h
    mov dx, offset str1
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
