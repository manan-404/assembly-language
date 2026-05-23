.model small
.stack 100h

.data
    balanced     db "Balanced$"
    not_balanced db "Not Balanced$"

.code
main proc

    mov ax, @data
    mov ds, ax

    mov cx, 0            ; CX = stack counter (how many open brackets)

    read_loop:
        mov ah, 01h
        int 21h          ; read character

        cmp al, 13       ; Enter pressed?
        je done_reading

        cmp al, '('      ; opening bracket?
        je push_it

        cmp al, ')'      ; closing bracket?
        je pop_it

        jmp read_loop    ; any other character — ignore

        push_it:
            push ax      ; push opening bracket
            inc cx       ; increment counter
            jmp read_loop

        pop_it:
            cmp cx, 0    ; is stack empty?
            je not_bal   ; if yes — unbalanced

            pop ax       ; pop one opening bracket
            dec cx       ; decrement counter
            jmp read_loop

    done_reading:
    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    cmp cx, 0            ; is stack empty at end?
    jne not_bal          ; if not — unbalanced

    mov ah, 09h
    mov dx, offset balanced
    int 21h
    jmp done

    not_bal:
    mov ah, 09h
    mov dx, offset not_balanced
    int 21h

    done:
    mov ah, 4ch
    int 21h

main endp
end main