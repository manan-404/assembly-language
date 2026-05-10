.model small
.stack 100h

.data
    str   db 100 dup('$')
    count db '0'

.code
main proc

    mov ax, @data
    mov ds, ax
    mov es, ax

    lea di, str          ; DI points to string buffer

    l1:
        mov ah, 01h
        int 21h          ; read character
        stosb            ; store in buffer

        ; check lowercase vowels
        cmp al, 'a'
        je vowel
        cmp al, 'e'
        je vowel
        cmp al, 'i'
        je vowel
        cmp al, 'o'
        je vowel
        cmp al, 'u'
        je vowel

        ; check uppercase vowels
        cmp al, 'A'
        je vowel
        cmp al, 'E'
        je vowel
        cmp al, 'I'
        je vowel
        cmp al, 'O'
        je vowel
        cmp al, 'U'
        je vowel

        jmp check_end    ; not a vowel

        vowel:
            inc count    ; increment vowel counter

        check_end:
        cmp al, 13       ; Enter pressed?
        je done
    jmp l1

    done:
    mov ah, 02h
    mov dl, 10           ; newline
    int 21h

    mov dl, count        ; print vowel count
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
