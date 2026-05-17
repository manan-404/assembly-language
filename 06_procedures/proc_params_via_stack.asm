.model small
.stack 100h

.data
    msg db "Sum: $"

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ax, 3            ; first parameter
    push ax

    mov ax, 4            ; second parameter
    push ax

    call addNums         ; call procedure

    add sp, 4            ; clean up stack (2 parameters x 2 bytes each)

    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    mov ah, 09h
    mov dx, offset msg   ; print "Sum: "
    int 21h

    mov ah, 02h
    mov dl, bl           ; print result
    add dl, 48           ; convert to ASCII
    int 21h

    mov ah, 4ch
    int 21h

main endp

addNums proc

    push bp              ; save BP
    mov bp, sp           ; BP points to top of stack

    ; stack layout at this point:
    ; [BP + 0] = saved BP
    ; [BP + 2] = return address
    ; [BP + 4] = second parameter (4)
    ; [BP + 6] = first parameter (3)

    mov al, [bp + 4]     ; get second parameter
    mov bl, [bp + 6]     ; get first parameter
    add bl, al           ; bl = first + second

    pop bp               ; restore BP
    ret

addNums endp

end main
