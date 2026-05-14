.model small
.stack 100h

.data
    pos db "Result is Positive$"
    neg db "Result is Negative$"

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 01h
    int 21h              ; read first digit
    sub al, 48           ; convert to number
    mov bl, al

    mov ah, 01h
    int 21h              ; read second digit
    sub al, 48           ; convert to number

    sub bl, al           ; bl = first - second

    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    js is_negative       ; jump if sign flag set (result < 0)

    mov ah, 09h
    mov dx, offset pos   ; print "Positive"
    int 21h
    jmp done

    is_negative:
        mov ah, 09h
        mov dx, offset neg   ; print "Negative"
        int 21h

    done:

    mov ah, 4ch
    int 21h

main endp
end main
