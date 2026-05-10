.model small
.stack 100h

.data
    buffer db 50 dup('$')
    msg    db "Reversed: $"
    count  db 0

.code
main proc

    mov ax, @data
    mov ds, ax
    mov es, ax

    lea di, buffer       ; DI points to buffer

    ; step 1: read string and store it
    l1:
        mov ah, 01h
        int 21h          ; read character

        cmp al, 13       ; Enter pressed?
        je done_input

        stosb            ; store in buffer
        inc count        ; track length
    jmp l1

    done_input:
    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    mov ah, 09h
    mov dx, offset msg   ; print "Reversed: "
    int 21h

    ; step 2: print string in reverse
    mov si, 0
    mov bl, count
    dec bl               ; point to last character (0-indexed)

    mov cl, count        ; loop count = string length
    mov ch, 0

    reverse_loop:
        mov dl, buffer[bx]  ; read character at index BX
        mov ah, 02h
        int 21h             ; print it

        dec bx              ; move backwards
    loop reverse_loop

    mov ah, 4ch
    int 21h

main endp
end main
