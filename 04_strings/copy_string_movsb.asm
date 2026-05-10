.model small
.stack 100h

.data
    str1 db "Hello$"
    str2 db 8 dup('$')   ; destination buffer

.code
main proc

    mov ax, @data
    mov ds, ax
    mov es, ax           ; ES must equal DS for movsb

    lea si, str1         ; SI points to source
    lea di, str2         ; DI points to destination

    movsb                ; copy 'H'
    movsb                ; copy 'e'
    movsb                ; copy 'l'
    movsb                ; copy 'l'
    movsb                ; copy 'o'

    mov ah, 09h
    lea dx, str2         ; print copied string
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
