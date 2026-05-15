.model small
.stack 100h

.data
    str      db "The Greatest number is $"
    greatest db '0'

.code
main proc

    mov ax, @data
    mov ds, ax

    myloop:
        mov ah, 01h
        int 21h          ; read character

        cmp al, 13       ; Enter pressed?
        je done

        cmp greatest, al ; compare with current greatest
        jge skip_swap    ; if greatest >= input, skip

        swap:
            mov greatest, al ; update greatest

        skip_swap:
    jmp myloop

    done:
    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    mov ah, 09h
    mov dx, offset str   ; print "The Greatest number is "
    int 21h

    mov ah, 02h
    mov dl, greatest     ; print greatest character
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main