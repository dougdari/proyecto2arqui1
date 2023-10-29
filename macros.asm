print macro cadena ;imprimir cadenas
    mov ah,09h ;Numero de funcion para imprimir cadena en pantalla
	mov dx, @data ;con esto le decimos que nuestrfo dato se encuentra en la sección data
	mov ds,dx ;el ds debe apuntar al segmento donde se encuentra la cadena (osea el dx, que apunta  a data)
	mov dx,offset cadena ;especificamos el largo de la cadena, con la instrucción offset
	int 21h  ;ejecutamos la interrupción
endm 

close macro  ;cerrar el programa
    mov ah, 4ch ;Numero de función que finaliza el programa
    xor al,al ;limpiar al 
    int 21h
endm

getChar macro ;obtener caracter
    mov ah,01h ;se guarda en al en código hexadecimal del caracter leído 
    int 21h
endm

ObtenerTexto macro cadena ;macro para recibir una cadena, varios caracteres 

LOCAL ObtenerChar, endTexto 
;si, cx, di  registros que usualmente se usan como contadores 
    xor di,di  ; => mov si, 0  reinica el contador

    ObtenerChar:
        getChar  ;llamamos al método de obtener caracter 
        cmp al, 0dh ; como se guarda en al, comparo si al es igual a salto de línea, ascii de salto de linea en hexadecimal o 10en ascii
        je endTexto ;si es igual que el salto de línea, nos vamos a la etiqueta endTexto, donde agregamos el $ de dolar a la entrada 
        mov cadena[di],al ; mov destino, fuente.  Vamos copiando el ascii del caracter que se guardó en al, al vector cadena en la posicion del contador si
        inc di ; => si = si+1
        jmp ObtenerChar

    endTexto:
        mov al, 36 ;ascii del signo $ o en hexadecimal 24h
        mov cadena[di],al  ;copiamos el $ a la cadena
endm 

clear macro ;limpia pantalla
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
endm

;Operaciones aritmeticas

sumar macro  numero1,numero2,resultado,test1,test2,signo3
  LOCAL salto,noSalto,fin   
     
     mov al,numero1 ;Mueve a al el numero1
     imul test1
     mov bl,al
     xor al,al
     mov al,numero2 ;Mueve a al el numero1
     imul test2
     add al,bl ;Le suma a al el numero2

     ;resuelta
        cmp al,1
        jg salto
        cmp al,1
        jmp noSalto
        
        
        salto:
            ;positivo
            mov resultado,al ;al -> resultado
            xor al,al
            mov al,43
            mov signo3[0],al
            xor al,al
            mov al,36
            mov signo3[1],al  
            mov test1,1
            jmp fin
        noSalto:
            ;negativo
            neg al
            mov resultado,al ;al -> resultado
            xor al,al
            mov al,45
            mov signo3[0],al
            xor al,al
            mov al,36
            mov signo3[1],al 
            mov test1,-1

        fin:
    
endm



    
conversor macro numero1,resultado,numero2
    mov al ,numero1[0]
    ;mov resultado[0], al
    sub al,48
    mov cl,10
    mul cl
    mov bl,al
    mov al, numero2[0]
    sub al,48
    add bl,al
    ;add bl, numero2
    mov resultado,bl

endm

extractorCompleto macro arreglo,numero1,numero2,test1,signo
Local ok,fin
            ;Limpiando el registro ax
            mov ax,0000
        
            mov al ,arreglo[0]
            cmp al,47 ;0
                print arreglo
                ja ok
               
            
            ;abria que agregar en caso es positivo
            ;sobre un resultado anterior.

        

        ok:
            mov al ,arreglo[0] ;Copiamos el numero a la cadena
            mov numero1[0],al ; movemos de al hacia la variable en la posicion0
            mov al, 36 ;ascii del signo $ o en hexadecimal 24h
            mov numero1[1],al  ;copiamos el $ a la cadena
            mov al,0          ;Limpiamos el registro
            mov al ,arreglo[1] ;Movemos el segundo numero a el registro al
            mov numero2[0],al ;movemos de al hacia el numero 2 posicion 0
            mov al, 36 ;ascii del signo $ o en hexadecimal 24h
            mov numero2[1],al  ;copiamos el $ a la cadena
            mov al, 1     ;valores de prueba solamente
            mov test1,al  
            mov al,43     ;movemos el signo + al registro al
            mov signo[0],al  ;movemos el signo + en la variable signo
            mov al,36     ;ascii del signo $ o en hexadecimal 24h
            mov signo[1],al ;movemos el signo $ en la variable signo
            print signo
            jmp fin ;Saltamos a la etiqueta fin
        fin:
            ;Salimos de la macro.
      
            
endm

extractorCompletoNumero macro arreglo,digito1,digito2, banderaSigno
Local positivo, negativo,fin
     
            mov ax,0000        
 
            ;print arreglo


            mov al, arreglo[0]
            cmp al, '-'
            je negativo          
            
        positivo:

            mov banderaSigno, 0

            mov al ,arreglo[0] ;Copiamos el numero a la cadena
            mov digito1[0],al ; movemos de al hacia la variable en la posicion0
            mov al, 36 ;ascii del signo $ o en hexadecimal 24h
            mov digito1[1],al  ;copiamos el $ a la cadena
            mov al,0          ;Limpiamos el registro
            mov al ,arreglo[1] ;Movemos el segundo numero a el registro al
            mov digito2[0],al ;movemos de al hacia el numero 2 posicion 0
            mov al, 36 ;ascii del signo $ o en hexadecimal 24h
            mov digito2[1],al  ;copiamos el $ a la cadena


            ;mov al, offset operando1
            ;neg al

            jmp fin ;Saltamos a la etiqueta fin

        negativo:

            mov banderaSigno, 0
            mov banderaSigno, 1

            mov al ,arreglo[1] ;Copiamos el numero a la cadena
            mov digito1[0],al ; movemos de al hacia la variable en la posicion0
            mov al, 36 ;ascii del signo $ o en hexadecimal 24h
            mov digito1[1],al  ;copiamos el $ a la cadena
            mov al,0          ;Limpiamos el registro
            mov al ,arreglo[2] ;Movemos el segundo numero a el registro al
            mov digito2[0],al ;movemos de al hacia el numero 2 posicion 0
            mov al, 36 ;ascii del signo $ o en hexadecimal 24h
            mov digito2[1],al  ;copiamos el $ a la cadena

        fin:
            ;Salimos de la macro.
      
            
endm

conversorNumero macro numero1,numero2,resultado, signoBandera
LOCAL aplicarComplemento2, salirDeConversor

    mov al ,numero1[0]
    ;mov resultado[0], al
    sub al,48
    mov cl,10
    mul cl
    mov bl,al
    mov al, numero2[0]
    sub al,48
    add bl,al
    ;add bl, numero2
    mov resultado,bl

    cmp signoBandera, 1
    je aplicarComplemento2
    jmp salirDeConversor

    aplicarComplemento2:
    
    
    neg resultado

    salirDeConversor:

endm

sumarNumerosMacro macro  numero1,numero2,resultado

    xor ax, ax
    mov al,numero1 ;Mueve a al el numero1
    add al,numero2 ;Le suma a al el numero2
    mov resultado,al

endm

restarNumerosMacro macro  numero1,numero2,resultado

    xor ax, ax
    mov al,numero1 ;Mueve a al el numero1
    sub al,numero2 ;Le resta a al el numero2
    mov resultado,al

endm

multiplicacionNumerosMacro macro  numero1,numero2,resultado

    xor ax, ax
    xor bx, bx
    mov AL, numero1
    mov BL, numero2    
    imul BL 
    mov resultado, AL

endm

divicionNumerosMacro macro  numero1,numero2,resultado

    xor ax, ax
    xor bx, bx
    mov AL, numero1
    mov BL, numero2    
    idiv BL 
    mov resultado, AL

endm

imprimirDecimal macro numero,guardar
    mov al, numero     
    aam               
    add ax, 3030h     
    push ax            
    mov dl, ah         
    mov guardar[0], dl
    mov ah, 02h        
    int 21h
    pop dx             
    mov al,dl
    mov guardar[1], al
    mov ah, 02h        
    int 21h
endm

convertirNumero3Cifras macro valorNumerico, guardar, final
LOCAL BNumCadPos,BInvertirPos

    xor AX, AX

    lea AX, valorNumerico
    mov DX, offset guardar

    push AX
    push BX
    push CX
    push DX
    push DI

    mov BX, 10
    mov DI, DX

    xor CX, CX

    BNumCadPos:

        xor DX, DX
        div BX
        add DL, '0'
        push DX
        inc CX
        cmp AX, 0
        jne BNumCadPos

    BInvertirPos:

        pop [DI]
        inc DI
        loop BInvertirPos

        ;mov al, 36
        ;mov [DI], al

        mov byte ptr[DI], '$'

        pop DI
        pop DX
        pop CX
        pop BX
        pop AX

endm

escribirOperandos macro digito1, digito2, posicion, signo, cadena
LOCAL numeroSinSigno, finEscritura

    xor AX, AX
    mov AL, posicion
    mov DI, AX

    cmp signo, 1
    jne numeroSinSigno

    mov AL, '-'
    mov cadena[DI], AL

    inc posicion
    inc DI

    mov AL, digito1[0]
    mov cadena[DI], AL

    inc posicion
    inc DI

    mov AL, digito2[0]
    mov cadena[DI], AL

    jmp finEscritura

    numeroSinSigno:

        mov AL, digito1[0]
        mov cadena[DI], AL
        inc posicion
        inc DI
        mov AL, digito2[0]
        mov cadena[DI], AL

    finEscritura:

endm


copiarCadena macro origen, destino 
LOCAL loopCopia

    xor cx, cx
    xor ax, ax
    xor si, si
    mov cx, 100  ; Número de elementos en el array
    mov si, 0   ; Índice de inicio

loopCopia:

    mov al, [origen + si]
    mov [destino + si], al  ; Almacena 0 en la posición actual
    inc si                  ; Incrementa el índice
    loop loopCopia 


endm