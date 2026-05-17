.model small
.stack 100h

.data
    msg db "Factorial: $"

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 01h
    int 21h              ; read digit
    sub al, 48           ; convert to number
    mov bl, al           ; BL = input number

    call factorial       ; result will be in BX... 
                         ; wait -- BL is our accumulator

    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    mov ah, 09h
    mov dx, offset msg   ; print "Factorial: "
    int 21h

    mov ah, 02h
    mov dl, bl
    add dl, 48           ; convert result to ASCII
    int 21h

    mov ah, 4ch
    int 21h

main endp

factorial proc

    cmp bl, 1            ; base case: if BL == 1, stop
    je done

    push bx              ; save current BL on stack

    dec bl               ; BL = BL - 1
    call factorial       ; recursive call

    pop ax               ; restore saved value into AX
    mul al               ; AL = AL * BL (accumulate result)
    mov bl, al           ; store back in BL

    done:
    ret

factorial endp

end main
