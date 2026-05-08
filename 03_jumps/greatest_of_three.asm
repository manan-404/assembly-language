.model small
.stack 50h

.data
    msg db "Greatest: $"

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 01h      ; read first digit
    int 21h
    mov bl, al       ; bl = greatest so far

    mov ah, 01h      ; read second digit
    int 21h
    cmp al, bl
    jl skip1         ; if second < current greatest, skip
    mov bl, al       ; else update greatest
    skip1:

    mov ah, 01h      ; read third digit
    int 21h
    cmp al, bl
    jl skip2         ; if third < current greatest, skip
    mov bl, al       ; else update greatest
    skip2:

    mov ah, 02h
    mov dl, 10       ; newline
    int 21h

    mov ah, 09h
    mov dx, offset msg
    int 21h

    mov ah, 02h
    mov dl, bl       ; print greatest
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
