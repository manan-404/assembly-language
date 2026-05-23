.model small
.stack 100h

.data
    msg1 db "Enter string: $"
    msg2 db "Reversed: $"

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset msg1
    int 21h              ; print "Enter string: "

    mov cx, 0            ; CX will count characters

    ; step 1: read and push each character
    read_loop:
        mov ah, 01h
        int 21h          ; read character into AL

        cmp al, 13       ; Enter pressed?
        je done_reading

        push ax          ; push character onto stack
        inc cx           ; increment count
    jmp read_loop

    done_reading:
    mov bx, cx           ; save count in BX

    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    mov ah, 09h
    mov dx, offset msg2
    int 21h              ; print "Reversed: "

    ; step 2: pop and print each character
    mov cx, bx           ; restore count into CX
    pop_loop:
        pop ax           ; pop character (comes out reversed)
        mov ah, 02h
        mov dl, al
        int 21h          ; print it
    loop pop_loop

    mov ah, 4ch
    int 21h

main endp
end main