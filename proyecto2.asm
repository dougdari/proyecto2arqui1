JUGADOR_CARRIL equ 01
JUGADOR_ACERA  equ 02
ACERA          equ 03
CARRIL         equ 04
CARRO          equ 05
CAMION         equ 06

USUARIO_NORMAL         equ 01
USUARIO_ADMIN          equ 02
USUARIO_ADMIN_ORIGINAL equ 03

TAM_NOMBRE equ 14
TAM_CONTRA equ 19

NO_BLOQUEADO equ 00
BLOQUEADO    equ 01

.MODEL small
.RADIX 16
.STACK
.DATA
vidas    db "O  O  O$"

x_elemento dw 0000
y_elemento dw 0000

coordenadas_jugador dw 0000
coordenada_actual   dw 0000

sprite_jugador db 00, 00, 00, 05, 05, 00, 00, 00 
               db 00, 00, 00, 05, 05, 00, 00, 05 
               db 00, 05, 05, 05, 05, 05, 05, 00 
               db 05, 00, 00, 05, 05, 00, 00, 00 
               db 00, 00, 00, 05, 05, 00, 00, 00 
               db 00, 00, 05, 05, 05, 05, 00, 00 
               db 00, 00, 05, 00, 00, 05, 00, 00 
               db 00, 05, 05, 00, 00, 05, 05, 00 

sprite_jugador_carril db 13, 13, 13, 05, 05, 13, 13, 13, 13, 13, 13, 05, 05, 13, 13, 13 
                      db 13, 13, 13, 05, 05, 13, 13, 05, 13, 13, 13, 05, 05, 13, 13, 05 
                      db 13, 05, 05, 05, 05, 05, 05, 13, 13, 05, 05, 05, 05, 05, 05, 13 
                      db 05, 13, 13, 05, 05, 13, 13, 13, 05, 13, 13, 05, 05, 13, 13, 13 
                      db 13, 13, 13, 05, 05, 13, 13, 13, 13, 13, 13, 05, 05, 13, 13, 13 
                      db 13, 13, 05, 05, 05, 05, 13, 13, 13, 13, 05, 05, 05, 05, 13, 13 
                      db 13, 13, 05, 13, 13, 05, 13, 13, 13, 13, 05, 05, 05, 05, 13, 13 
                      db 1f, 05, 05, 13, 1f, 05, 05, 13, 13, 13, 05, 05, 05, 05, 13, 13

sprite_jugador_acera db 17, 17, 17, 05, 05, 17, 17, 17 
                     db 17, 17, 17, 05, 05, 17, 17, 05 
                     db 17, 05, 05, 05, 05, 05, 05, 17 
                     db 05, 17, 17, 05, 05, 17, 17, 17 
                     db 17, 17, 17, 05, 05, 17, 17, 17 
                     db 17, 17, 05, 05, 05, 05, 17, 17 
                     db 17, 17, 05, 1a, 17, 05, 17, 17 
                     db 17, 05, 05, 17, 17, 05, 05, 17 

sprite_carril  db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 1f, 1f, 13, 13, 1f, 1f, 13, 13 

sprite_banqueta db 17, 17, 17, 17, 17, 17, 17, 17 
                db 17, 17, 17, 1a, 17, 17, 17, 17 
                db 17, 17, 17, 1a, 17, 17, 17, 17 
                db 17, 17, 17, 1a, 17, 17, 17, 17 
                db 17, 17, 17, 1a, 17, 17, 17, 17 
                db 17, 17, 17, 1a, 17, 17, 17, 17 
                db 17, 17, 17, 1a, 17, 17, 17, 17 
                db 17, 17, 17, 17, 17, 17, 17, 17 

mapa_objetos db 3e8 dup (00)

opcion_principal_1  db "F1  Iniciar sesion$"
opcion_principal_2  db "F2  Registro$"
opcion_principal_3  db "F3  Salir$"

opcion1  db "F1  Jugar$"
opcion2  db "F2  Generar puntaje$"
opcion3  db "F3  Ordenar puntajes$"
opcion4  db "F4  Salir$"

cadena_pedir_nombre db "Escriba su nombre: $"
cadena_pedir_contra db "Escriba su clave: $"

;; ESTRUCTURA USUARIO -> 2f bytes
usuario_nombre    db 14 dup (00)
usuario_contra    db 19 dup (00)
usuario_tipo      db         00
usuario_bloqueado db         00

;; ESTRUCTURA JUEGO   -> 06 bytes
juego_cod_usuario dw 0000
juego_tiempo      dw 0000
juego_puntos      dw 0000

;; COPIA ESTRUCTURA
juego_tmp_cod_usuario dw 0000
juego_tmp_tiempo      dw 0000
juego_tmp_puntos      dw 0000

buffer_entrada db 0ff,00
               db 0ff dup (00)

usuarios_archivo db "USRS.ACE",00
juegos_archivo   db "PUNTOS.ACE",00

cadena_limpiar db "                                       $" 

handle_a dw 0000
handle_b dw 0000
tam_archivo_origen dw 0000
un_byte  db 00
copia_puntos db "PUNTOS02.ACE",00

indice_burbuja        dw 0000
cantidad_de_registros dw 0000
hubo_intercambio      db 00
numero_a              dw 0000
numero_b              dw 0000

numero               db  '000000','$'

cadena_mostrar_cod_usuario db 'Codigo de usuario:   $'
cadena_mostrar_cod_puntos  db 'Puntos obtenidos:    $'
cadena_mostrar_cod_tiempo  db 'Tiempo transcurrido: $'
cadena_separador           db '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=$'
cadena_ayuda               db '-- presiona cualquier tecla --$'
cadena_ayuda_fin           db '-- el fin, presiona cualquier tecla --$'

fila_texto db 00
.CODE
.STARTUP
		;; ingreso al modo de video 13h
		mov AL, 13
		mov AH, 00
		int 10

menu_principal:
		call limpiar_pantalla
		mov DH, 08
		mov DL, 08
		mov BH, 00
		mov AH, 02
		int 10
		mov DX, offset opcion_principal_1
		mov AH, 09
		int 21
		mov DH, 0a
		mov DL, 08
		mov BH, 00
		mov AH, 02
		int 10
		mov DX, offset opcion_principal_2
		mov AH, 09
		int 21
		mov DH, 0c
		mov DL, 08
		mov BH, 00
		mov AH, 02
		int 10
		mov DX, offset opcion_principal_3
		mov AH, 09
		int 21
esperar_opcion_menu_principal:
		mov AH, 00
		int 16
		cmp AH, 3b
		je menu_usuario
		cmp AH, 3c
		je registro
		cmp AH, 3d
		je fin
		jmp esperar_opcion_menu_principal

registro:
		call limpiar_pantalla
		mov DH, 08
		mov DL, 04
		mov BH, 00
		mov AH, 02
		int 10
		mov DX, offset cadena_pedir_nombre
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		mov AL, TAM_NOMBRE
		mov DI, offset usuario_nombre
		call copiar_dato
		;;
		mov DH, 0a
		mov DL, 04
		mov BH, 00
		mov AH, 02
		int 10
		mov DX, offset cadena_pedir_contra
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		mov AL, TAM_CONTRA
		mov DI, offset usuario_contra
		call copiar_dato
		;;
		mov AL, USUARIO_NORMAL
		mov [usuario_tipo], AL
		;;
		mov AL, NO_BLOQUEADO
		mov [usuario_bloqueado], AL
		;;
		call escribir_usuario
		call limpiar_pantalla
		jmp menu_principal

menu_usuario:
		call limpiar_pantalla
		mov DH, 08
		mov DL, 08
		mov BH, 00
		mov AH, 02
		int 10
		mov DX, offset opcion1
		mov AH, 09
		int 21
		mov DH, 0a
		mov DL, 08
		mov BH, 00
		mov AH, 02
		int 10
		mov DX, offset opcion2
		mov AH, 09
		int 21
		mov DH, 0c
		mov DL, 08
		mov BH, 00
		mov AH, 02
		int 10
		mov DX, offset opcion3
		mov AH, 09
		int 21
		mov DH, 0e
		mov DL, 08
		mov BH, 00
		mov AH, 02
		int 10
		mov DX, offset opcion4
		mov AH, 09
		int 21
		;;
esperar_opcion_menu:
		mov AH, 00
		int 16
		cmp AH, 3b
		je jugar
		cmp AH, 3c
		je generar_puntaje
		cmp AH, 3d
		je ordenar_puntajes
		cmp AH, 3e
		je menu_principal
		jmp esperar_opcion_menu

jugar:
		call limpiar_pantalla
		mov DH, 00
		mov DL, 10
		mov BH, 00
		mov AH, 02
		int 10
		;;
		mov DX, offset vidas
		mov AH, 09
		int 21
		;; ...
		mov AL, 00
		mov AH, 01
		mov BL, ACERA
		call colocar_en_mapa
		mov AL, 01
		mov AH, 01
		mov BL, ACERA
		call colocar_en_mapa
		mov AL, 02
		mov AH, 01
		mov BL, ACERA
		call colocar_en_mapa
		mov AL, 00
		mov AH, 02
		mov BL, CARRIL
		call colocar_en_mapa
		mov AL, 01
		mov AH, 02
		mov BL, CARRIL
		call colocar_en_mapa
		mov AL, 02
		mov AH, 02
		mov BL, CARRIL
		call colocar_en_mapa
		mov AL, 00
		mov AH, 03
		mov BL, CARRIL
		call colocar_en_mapa
		mov AL, 01
		mov AH, 03
		mov BL, CARRIL
		call colocar_en_mapa
		mov AL, 02
		mov AH, 03
		mov BL, CARRIL
		call colocar_en_mapa
		mov AL, 00
		mov AH, 04
		mov BL, CARRIL
		call colocar_en_mapa
		mov AL, 01
		mov AH, 04
		mov BL, CARRIL
		call colocar_en_mapa
		mov AL, 02
		mov AH, 04
		mov BL, CARRIL
		call colocar_en_mapa
		mov AL, 01
		mov AH, 03
		mov BL, JUGADOR_CARRIL
		call colocar_en_mapa
		mov AL, 00
		mov AH, 05
		mov BL, ACERA
		call colocar_en_mapa
		mov AL, 01
		mov AH, 05
		mov BL, ACERA
		call colocar_en_mapa
		mov AL, 02
		mov AH, 05
		mov BL, ACERA
		call colocar_en_mapa
		;;
		call pintar_mapa
infinito:
		jmp infinito
		jmp fin

generar_puntaje:
		mov AX, 00
		mov [juego_cod_usuario], AX
		mov AH, 2c
		int 21
		mov AX, 0f0f
		and AX, DX
		mov [juego_puntos], AX
		mov AH, 2c
		int 21
		mov AX, 0a0a
		and AX, DX
		mov [juego_tiempo], AX
		;;
		mov AH, 3d
		mov AL, 02
		mov DX, offset juegos_archivo
		int 21
		jc crear_archivo_juegos
		jmp guardar_puntaje
crear_archivo_juegos:
		mov AH, 3c
		mov CX, 00
		mov DX, offset juegos_archivo
		int 21
guardar_puntaje:
		mov BX, AX
		mov AH, 42
		mov AL, 02
		mov CX, 00
		mov DX, 00
		int 21
		mov AH, 40
		mov CX, 0006
		mov DX, offset juego_cod_usuario
		int 21
		mov AH, 3e
		int 21
		jmp menu_usuario

ordenar_puntajes:
		call limpiar_pantalla
		mov SI, offset juegos_archivo
		mov DI, offset copia_puntos
		call copiar_archivo
		;; abrir copia
		mov AH, 3d
		mov AL, 02
		mov DX, offset copia_puntos
		int 21
		mov [handle_a], AX
		call burbuja_archivo
		;; abrir copia de nuevo, 'burbuja_archivo' lo cierra para que se ejecuten los cambios
		mov AH, 3d
		mov AL, 02
		mov DX, offset copia_puntos
		int 21
		mov [handle_a], AX
		call imprimir_juegos_copia
		call limpiar_pantalla
		jmp menu_usuario

;; pintar_pixel - pinta un pixel en una posición x, y
;; ENTRADAS:
;;  - SI - x
;;  - DI - y
;;  - CL - color 
;; SALIDA:
pintar_pixel:
		;; DS tiene cierto valor
		;; se preservó DS
		push DS
		;; se coloca la dirección del scanner del modo de video
		mov DX, 0a000
		mov DS, DX
		;;
		mov AX, 140 ;; tamaño máximo de x ;; tamaño máximo de x
		mul DI
		;; DX-AX resultado de la multiplicación
		add AX, SI
		;; índice hacia la memoria del pixel
		mov BX, AX
		mov [BX], CL
		pop DS
		ret

;; pintar_sprite - pinta el sprite en la posición especificada en memoria
;; ENTRADA:
;;   BX -> datos del sprite a pintar
pintar_sprite:
		mov SI, [x_elemento]
		mov DI, [y_elemento]
		xchg BP, CX
		mov CX, 0000
		mov CL, 08    ;; altura del jugador, 8 en este caso
ciclo_filas:
		xchg BP, CX
		mov CX, 0000
		mov CL, 08    ;; anchura del jugador, 8 en este caso
ciclo_columnas:
		push BX
		push CX
		mov CL, [BX]
		call pintar_pixel
		pop CX
		pop BX
		inc SI
		inc BX
		loop ciclo_columnas
		;; terminó una fila
		;;; incremento y
		inc DI
		;;; reinicio x
		mov SI, [x_elemento]
		xchg BP, CX
		loop ciclo_filas
		ret

;; colocar_en_mapa -
;; ENTRADA:
;;  AL -> x del elemento
;;  AH -> y del elemento
;;  BL -> código del elemento
colocar_en_mapa:
		push AX    ;; guardar las posiciones en la pila
		mov AL, AH
		mov AH, 00
		mov DI, AX
		mov AX, 28 ;; tamaño máximo de x
		mul DI
		;; DX-AX resultado de la multiplicación
		pop DX
		mov DH, 00
		add AX, DX  ;; AX = 28*y + x
		;; índice hacia la memoria del pixel
		mov SI, offset mapa_objetos
		add SI, AX
		mov [SI], BL
		ret

;; obtener_de_mapa -
;; ENTRADA:
;;  AL -> x del elemento
;;  AH -> y del elemento
;; SALIDA:
;;  BL -> código del elemento
obtener_de_mapa:
		push AX    ;; guardar las posiciones en la pila
		mov AL, AH
		mov AH, 00
		mov DI, AX
		mov AX, 28 ;; tamaño máximo de x
		mul DI
		;; DX-AX resultado de la multiplicación
		pop DX
		mov DH, 00
		add AX, DX  ;; AX = 28*y + x
		;; índice hacia la memoria del pixel
		mov SI, offset mapa_objetos
		add SI, AX
		mov BL, [SI]
		ret

;; pintar_mapa - 
pintar_mapa:
		mov AX, 0000
		mov [coordenada_actual], AX
		mov CX, 19
ciclo_filas_mapa:
		xchg BP, CX
		mov CX, 28
ciclo_columnas_mapa:
		mov AX, [coordenada_actual]
		call obtener_de_mapa
		;; ============================
		;; selección de sprite a pintar
		;; ============================
		cmp BL, ACERA
		je pintar_acera
		cmp BL, CARRIL
		je pintar_carril
		cmp BL, JUGADOR_CARRIL
		je pintar_jugador_carril
		jmp ciclo_columnas_mapa_loop
		;; ==============================================
		;; definición de qué sprite pintar para cada caso
		;; ==============================================
pintar_acera:
		mov BX, offset sprite_banqueta
		jmp pintar_sprite_en_posicion
pintar_carril:
		mov BX, offset sprite_carril
		jmp pintar_sprite_en_posicion
pintar_jugador_carril:
		mov BX, offset sprite_jugador_carril
		jmp pintar_sprite_en_posicion
pintar_sprite_en_posicion:
		mov AX, [coordenada_actual]
		mov AH, 08
		mul AH
		mov [x_elemento], AX
		mov AX, [coordenada_actual]
		mov AL, AH
		mov AH, 08
		mul AH
		mov [y_elemento], AX
		push CX
		push BP
		call pintar_sprite
		pop BP
		pop CX
		jmp ciclo_columnas_mapa_loop
ciclo_columnas_mapa_loop:
		mov AX, [coordenada_actual]
		inc AL
		mov [coordenada_actual], AX
		loop ciclo_columnas_mapa
		mov AX, [coordenada_actual]
		mov AL, 00
		inc AH
		mov [coordenada_actual], AX
		xchg BP, CX
		loop ciclo_filas_mapa
		ret

;; escribir_usuario - escribe un usuario en el archivo USRS.ACE
;; ENTRADA:
;;   - [usuario_nombre] -> nombre del usuario
;;   - ...
escribir_usuario:
		mov AH, 3d
		mov AL, 02
		mov DX, offset usuarios_archivo
		int 21
		jc crear_archivo
		jmp escribir_estructura_usuario
crear_archivo:
		mov AH, 3c
		mov CX, 0000
		mov DX, offset usuarios_archivo
		int 21
escribir_estructura_usuario:
		;; posicionar en el final del archivo
		mov BX, AX   ; handle
		mov AL, 02
		mov CX, 0000
		mov DX, 0000
		mov AH, 42
		int 21
		;; guardar el usuario
		mov AH, 40
		mov CX, 002f
		mov DX, offset usuario_nombre
		int 21
		;; cerrar archivo
		mov AH, 3e
		int 21
		ret

;; copiar_dato - copia el contenido del buffer en el campo indicado
;; ENTRADA:
;;   - AL -> tamaño del campo
;;   - DI -> direccion del campo
copiar_dato:
		mov CX, 0000
		mov CL, AL
		mov AH, 00
		push DI
ciclo_limpiar_dato:
		mov [DI], AH
		inc DI
		loop ciclo_limpiar_dato
		pop DI
		;;
		mov SI, offset buffer_entrada
		inc SI
		mov AL, [SI]
		mov CX, 0000
		mov CL, AL
		inc SI
ciclo_copiar_dato:
		mov AL, [SI]
		mov [DI], AL
		inc DI
		inc SI
		loop ciclo_copiar_dato
		ret

;; limpiar_pantalla - limpia la pantalla
limpiar_pantalla:
		push CX
		mov CX, 1a
ciclo_limpiar_pantalla:
		mov DX, offset cadena_limpiar
		mov AH, 09
		int 21
		loop ciclo_limpiar_pantalla
		pop CX
		ret

;; copiar_archivo - copia un archivo
;; ENTRADA:
;;   SI -> nombre del archivo origen
;;   DI -> nombre del archivo destino
;; SALIDA:
copiar_archivo:
		;; abrir archivo origen
		mov AH, 3d
		mov AL, 00
		mov DX, SI
		int 21
		;
		mov BX, AX
		mov [handle_a], BX
		;; obtener tamaño de archivo origen
		mov AH, 42
		mov AL, 02
		mov CX, 00
		mov DX, 00
		int 21
		;; AX -> tamaño del archivo en bytes
		mov [tam_archivo_origen], AX
		;; reestablecer puntero de archivo
		mov AH, 42
		mov AL, 00
		mov CX, 00
		mov DX, 00
		int 21
		;; abrir o crear archivo destino
		mov AH, 3d
		mov AL, 01
		mov DX, DI
		int 21
		jc crear_archivo_para_copiar
		jmp guardar_handle_b
crear_archivo_para_copiar:
		mov AH, 3c
		mov CX, 0000
		mov DX, DI
		int 21
		;
guardar_handle_b:
		mov [handle_b], AX
		;; truncar archivo destino
		mov AH, 40
		mov BX, [handle_b]
		mov CX, 00
		mov DX, offset un_byte
		int 21
		;; inicializar contador
		mov CX, [tam_archivo_origen]
ciclo_copiar_archivo:
		push CX
		;; leer un byte
		mov AH, 3f
		mov BX, [handle_a]
		mov CX, 0001
		mov DX, offset un_byte
		int 21
		;; copiar un byte
		mov AH, 40
		mov BX, [handle_b]
		mov CX, 0001
		mov DX, offset un_byte
		int 21
		;;
		pop CX
		loop ciclo_copiar_archivo
		;; cerrar archivos
		mov AH, 3e
		mov BX, [handle_a]
		int 21
		mov AH, 3e
		mov BX, [handle_b]
		int 21
		ret

;; obtener_cantidad_de_registros
obtener_cantidad_de_registros:
		mov AH, 42
		mov AL, 02
		mov BX, [handle_a]
		mov CX, 00
		mov DX, 00
		int 21
		mov DX, 00
		mov CX, 0006
		div CX
		mov [cantidad_de_registros], AX
		ret

;; inicializar puntero de archivo
inicializar_puntero_de_archivo:
		mov AH, 42
		mov AL, 00
		mov BX, [handle_a]
		mov CX, 00
		mov DX, 00
		int 21
		ret

leer_juego:
		mov AH, 3f
		mov BX, [handle_a]
		mov CX, 0006
		mov DX, offset juego_cod_usuario
		int 21
		ret

;; verificar_intercambio
verificar_intercambio:
		call leer_juego
		mov AX, [juego_puntos]
		mov [numero_a], AX
		call leer_juego
		mov AX, [juego_puntos]
		mov [numero_b], AX
		mov AX, [numero_a]
		cmp AX, [numero_b]
		jbe retornar_no_intercambio
		;;
		mov AL, 01
		mov [hubo_intercambio], AL
		ret
retornar_no_intercambio:
		mov AL, 00
		ret

;; burbuja_archivo - ejecuta el algoritmo burbuja en un archivo abierto
;; ENTRADA:
;;   - [handle_a] -> handle del archivo a ordenar
burbuja_archivo:
		mov AX, 0000
		mov [indice_burbuja], AX
		mov [hubo_intercambio], AL
		;;
		call obtener_cantidad_de_registros
		;;
repetir_burbuja:
		call inicializar_puntero_de_archivo
		mov CX, [cantidad_de_registros]
		mov AL, 00
		mov [hubo_intercambio], AL
		mov AX, 0000
		mov [indice_burbuja], AX
ciclo_burbuja_archivo:
		push CX
		;; posicionarse en el registro actual dentro del archivo
		mov AX, [indice_burbuja]
		mov DX, 0006
		mul DX
		;;
		mov DX, AX
		mov AH, 42
		mov AL, 00
		mov BX, [handle_a]
		mov CX, 00
		int 21
		;;
		call verificar_intercambio
		cmp AL, 01
		je intercambiar
		jmp siguiente_iteracion
		;;
intercambiar:
		mov AX, [indice_burbuja]
		mov DX, 0006
		mul DX
		;; AX -> posición del registro actual en el archivo
		mov DX, AX
		mov AH, 42
		mov AL, 00
		mov BX, [handle_a]
		mov CX, 00
		int 21
		;;
		call leer_juego
		mov AX, [juego_cod_usuario]
		mov [juego_tmp_cod_usuario], AX
		mov AX, [juego_puntos]
		mov [juego_tmp_puntos], AX
		mov AX, [juego_tiempo]
		mov [juego_tmp_tiempo], AX
		call leer_juego
		;;
		mov AH, 42
		mov AL, 01
		mov BX, [handle_a]
		mov CX, 00
		mov DX, 00
		int 21
		;; DX-AX -> posición actual
		mov CX, 000c
		sub AX, CX
		;;
		mov DX, AX
		mov AH, 42
		mov AL, 00
		mov BX, [handle_a]
		mov CX, 00
		int 21
		;; escribimos el registro siguiente en la posición actual
		mov AH, 40
		mov BX, [handle_a]
		mov CX, 0006
		mov DX, offset juego_cod_usuario
		int 21
		;; escribimos el registro actual en la posición siguiente
		mov AH, 40
		mov BX, [handle_a]
		mov CX, 0006
		mov DX, offset juego_tmp_cod_usuario
		int 21
		;;
siguiente_iteracion:
		inc [indice_burbuja]
		pop CX
		loop hacer_ciclo_burbuja
		jmp no_hacer_ciclo_burbuja
hacer_ciclo_burbuja:
		jmp ciclo_burbuja_archivo
no_hacer_ciclo_burbuja:
		;; verificar si se debe iterar de nuevo
		mov AL, [hubo_intercambio]
		cmp AL, 01
		je repetir_burbuja
		;; cerrar archivo
		mov AH, 3e
		mov BX, [handle_a]
		int 21
		ret

;; numAstr - convierte un número entero en cadena
;;     Entrada: AX -> numero de entrada
;;     Salida:  [numero] -> el número convertido a cadena
numAstr:                                ;;; Limpiar la cadena
                mov CX, 06h
                mov BX, offset numero
                mov DX, 30h
limpiar:        mov [BX], DL
                inc BX
                loop limpiar
                dec BX                   ;;; Posicionarse en el caracter de las unidades
                cmp AX, 0000h            ;;; Si el número es 0 no hacer nada
                je retorno
		jg unidad
		neg AX
		mov DL, 2d
		mov [numero], DL
unidad:         mov DL,[BX]              ;;; Incrementar las unidades
                inc DL
                mov [BX],DL
                dec AX                   ;;; Decrementar el número de entrada
                mov SI, BX               ;;; Guardar el dato de la posición de las unidades en otro registro
revisar_cifra:  mov DX, 3ah              ;;; Si en las unidades está el caracter 3Ah o :
                cmp [BX], DL
                je incrementa_ant        ;;; Saltar a la parte donde se incrementa la cifra anterior
                mov BX, SI               ;;; Restablecer la posición de las unidades en el registro original
                cmp AX, 0000h            ;;; Si el número de entrada no es 0
                jne unidad               ;;; Volver a incrementar unidades
                jmp retorno              ;;; Si no terminar rutina
incrementa_ant: mov DX, 30h              ;;; Se coloca el caracter '0' en la cifra actual
                mov [BX], DL
                dec BX                   ;;; Se mueve el índice a la cifra anterior
                mov DL, [BX]             ;;; Se incrementa la cifra indexada por BX
                inc DL
                mov [BX], DL
                cmp BX, offset numero    ;;; Si el índice actual no es la direccion de la primera cifra
                jne revisar_cifra        ;;; revisar la cifra anterior para ver si nuevamente hay que incrementarla
                mov BX, SI               ;;; Reestablecer la posición de las unidades en el registro original
                cmp AX, 0000h            ;;; Si el número de entrada no es 0
                jne unidad               ;;; Volver a incrementar unidades
retorno:        ret                      ;;; Si no retornar

;; imprimir_juegos_copia - imprime algunos registro de un archivo de juegos
imprimir_juegos_copia:
		mov AL, 00
		mov [fila_texto], AL
		call limpiar_pantalla
		call obtener_cantidad_de_registros
		;;
		mov AH, 42
		mov AL, 00
		mov BX, [handle_a]
		mov CX, 00
		mov DX, 00
		int 21
		;;
		mov CX, [cantidad_de_registros]
		mov BP, 0005
ciclo_imprimir_juegos_copia:
		push CX
		call leer_juego
		;; codigo
		inc [fila_texto]
		mov DH, [fila_texto]
		mov DL, 02
		mov BH, 00
		mov AH, 02
		int 10
		mov AH, 09
		mov DX, offset cadena_mostrar_cod_usuario
		int 21
		int 03
		mov AX, [juego_cod_usuario]
		call numAstr
		mov AH, 09
		mov DX, offset numero
		int 21
		;; puntos
		inc [fila_texto]
		mov DH, [fila_texto]
		mov DL, 02
		mov BH, 00
		mov AH, 02
		int 10
		mov AH, 09
		mov DX, offset cadena_mostrar_cod_puntos
		int 21
		mov AX, [juego_puntos]
		call numAstr
		mov AH, 09
		mov DX, offset numero
		int 21
		;; tiempo
		inc [fila_texto]
		mov DH, [fila_texto]
		mov DL, 02
		mov BH, 00
		mov AH, 02
		int 10
		mov AH, 09
		mov DX, offset cadena_mostrar_cod_tiempo
		int 21
		mov AX, [juego_tiempo]
		call numAstr
		mov AH, 09
		mov DX, offset numero
		int 21
		;; separador
		inc [fila_texto]
		mov DH, [fila_texto]
		mov DL, 02
		mov BH, 00
		mov AH, 02
		int 10
		mov AH, 09
		mov DX, offset cadena_separador
		int 21
		;;
		;;
		dec BP
		cmp BP, 0000
		jne hacer_ciclo_imprimir_juegos_copia
		;; ayuda
		inc [fila_texto]
		inc [fila_texto]
		mov DH, [fila_texto]
		mov DL, 02
		mov BH, 00
		mov AH, 02
		int 10
		mov AH, 09
		mov DX, offset cadena_ayuda
		int 21
		;;;
		mov AH, 08
		int 21
		;;
		call limpiar_pantalla
		mov AL, 00
		mov [fila_texto], AL
		mov BP, 0005
hacer_ciclo_imprimir_juegos_copia:
		pop CX
		loop otra_iteracion_imprimir
		jmp retorno_imprimir
otra_iteracion_imprimir:
		jmp ciclo_imprimir_juegos_copia
retorno_imprimir:
		;; cerrar archivo
		mov AH, 3e
		mov BX, [handle_a]
		int 21
		;;
		inc [fila_texto]
		mov DH, [fila_texto]
		mov DL, 02
		mov BH, 00
		mov AH, 02
		int 10
		mov AH, 09
		mov DX, offset cadena_ayuda_fin
		int 21
		;;;
		mov AH, 08
		int 21
		;;
		ret
fin:
.EXIT
END
