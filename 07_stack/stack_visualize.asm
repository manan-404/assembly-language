.model small
.stack 100h

.code
main proc

    mov ah, 02h

    mov bl, 'A'
    push bx          ; push A — stack: [A]

    mov bl, 'B'
    push bx          ; push B — stack: [A, B]

    mov bl, 'C'
    push bx          ; push C — stack: [A, B, C]

    pop bx
    mov dl, bl
    int 21h          ; prints C (last in, first out)

    pop bx
    mov dl, bl
    int 21h          ; prints B

    pop bx
    mov dl, bl
    int 21h          ; prints A

    mov ah, 4ch
    int 21h

main endp
end main
