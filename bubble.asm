section .data
    array db 5, 2, 8, 6, 1
    len equ $ - array

section .text
    global _start
    _start:

        mov ecx, len
        dec ecx

    outer_loop:
        mov ebx, 0

        mov edx, ecx
        dec edx
    
    inner_loop:
         mov esi, 
         add esi, 1              ; proximo index
         
         mov al, [array + edx]    
         cmp al, [array + esi]
         jle no_swap

         mov ah, [array + esi]
         mov [array + edx], ah
         mov [array + esi], al

         mov ebx, 1
    
    no_swap:
         dec edx
         cmp edx, 0
         jnz inner_loop

         cmp ebx, 0
         jz done

         dec ecx
         jnz outer_loop

    done:
         mov ecx, len
         mov esi, 0

    print_loop:
         movzx eax, byte [array + esi]
         add eax, 48
         mov [output], al
         mov eax, 4
         mov ebx, 1
         mov edx, 1
         int 0x80

         inc esi
         loop print_loop

         mov eax, 1
         xor ebx, ebx
         int 0x80