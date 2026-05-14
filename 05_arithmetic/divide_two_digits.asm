.model small
.stack 100h

.data
    msg1 db "Quotient: $"
    msg2 db "Remainder: $"

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 01h
    int 21h              ; read first digit (dividend)
    sub al, 48           ; convert to number
    mov bl, al           ; save dividend in BL

    mov ah, 01h
    int 21h              ; read second digit (divisor)
    sub al, 48           ; convert to number
    mov cl, al           ; save divisor in CL

    ; prepare for division
    mov al, bl           ; AL = dividend
    mov ah, 0            ; AH must be 0 before div

    div cl               ; AL = AL / CL (quotient)
                         ; AH = AL % CL (remainder)

    mov bl, al           ; save quotient
    mov bh, ah           ; save remainder

    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    mov ah, 09h
    mov dx, offset msg1  ; print "Quotient: "
    int 21h

    mov ah, 02h
    mov dl, bl
    add dl, 48           ; convert quotient to ASCII
    int 21h

    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    mov ah, 09h
    mov dx, offset msg2  ; print "Remainder: "
    int 21h

    mov ah, 02h
    mov dl, bh
    add dl, 48           ; convert remainder to ASCII
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
