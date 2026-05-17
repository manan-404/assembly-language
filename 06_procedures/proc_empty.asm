.model small
.stack 100h

.code
main proc

    call myproc

    mov ah, 4ch
    int 21h

main endp

myproc proc

    nop              ; does nothing — placeholder
    ret

myproc endp

end main
