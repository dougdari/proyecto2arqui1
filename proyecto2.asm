
JUGADOR_CARRIL	equ 01
JUGADOR_ACERA	equ 02
ACERA			equ 03
CARRIL			equ 04
R_CARROMORADO	equ 05
R_CARROAZUL		equ 06
L_CARROVERDE	equ 07
L_CARROAMARILLO	equ 08
CAMIONINI		equ 09
CAMIONFIN		equ 10
;;-----------------------------------------FIN JUEGO-----------------------------------------
;;-------------------------------------------USUARIOS-------------------------------------------
USUARIO_NORMAL			equ 02
USUARIO_ADMIN 			equ 01
USUARIO_ADMIN_ORIGINAL	equ 00

SIZE_NAME	 			equ 20
SIZE_PASSWORD 			equ 25
NO_BLOQUEADO			equ 00
BLOQUEADO				equ 01
;;-----------------------------------------FIN USUARIOS-----------------------------------------

;;---------------------------------------FIN CONSTANTES---------------------------------------
.MODEL small
.RADIX 16 ;;HEXADECIMAL
.STACK
.DATA
;;----------------------------------------- HEADER TABLERO-----------------------------------------

vidas dw 0003h
vida_caracter db "O  $"
novida_caracter  db "#  $"
horas db "00:"
minutos db "00:"
segundos db "00$"
conthora dw 0000h
contminuto dw 0000h
contsegundo dw 0000h
cadena_punteo db 05 dup('0'), '$' ;;00000 -> 00002
punteo_actual dw 0000h
;;-----------------------------------------FIN HEADER TABLERO-----------------------------------------

;;---------------------------------------- FOOTER TABLERO-----------------------------------------



dia_cadena db 02 dup (30),'/' 
mes_cadena db 02 dup (30),'/'
anho_cadena db 04 dup (30),' '
hora_cadena db 02 dup (30),':'
minutos_cadena db 02 dup (30),':'
segundos_cadena db 02 dup (30), '$'

dia_numero dw 0000
mes_numero dw 0000
ahno_numero dw 0000

hora_numero dw 0000
minutos_numero dw 0000
segundos_numero dw 0000

;;----------------------------------------FIN FOOTER TABLERO-----------------------------------------

;;-----------------------------------------TABLERO-----------------------------------------
offset_DS_data DW 0000h
count_col_sprite DW 0008h
count_fila_sprite DW 0008h
col_pantalla DW 0000h
fila_pantalla DW 0000h
direccion_sprite DW 0000h
indice_video DW 0000h 

;;
fila_tablero db 0000
col_tablero db 0000

mapa_tablero db 3e8 dup(00)
x_elemento dw 0000
y_elemento dw 0000
coordenadas_jugador dw 0000
coordenada_actual   dw 0000

sprite_jugador_carril db 13, 13, 13, 05, 05, 13, 13, 13 
                      db 13, 13, 13, 05, 05, 13, 13, 05 
                      db 13, 05, 05, 05, 05, 05, 05, 13 
                      db 05, 13, 13, 05, 05, 13, 13, 13 
                      db 13, 13, 13, 05, 05, 13, 13, 13 
                      db 13, 13, 05, 05, 05, 05, 13, 13 
                      db 13, 13, 05, 13, 13, 05, 13, 13 
                      db 1f, 05, 05, 13, 1f, 05, 05, 13 
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
sprite_carro_morado_derecha db 13, 00, 00, 13, 13, 00, 00, 13
							db 05, 05, 05, 05, 05, 05, 05, 05
							db 05, 09, 09, 05, 05, 05, 09, 05
							db 05, 09, 09, 05, 05, 05, 09, 05
							db 05, 09, 09, 05, 05, 05, 09, 05
							db 05, 09, 09, 05, 05, 05, 09, 05
							db 05, 05, 05, 05, 05, 05, 05, 05
							db 13, 00, 00, 13, 13, 00, 00, 13
sprite_carro_azul_derecha   db 13, 00, 00, 13, 13, 00, 00, 13
							db 01, 01, 01, 01, 01, 01, 01, 01
							db 01, 09, 09, 01, 01, 01, 09, 01
							db 01, 09, 09, 01, 01, 01, 09, 01
							db 01, 09, 09, 01, 01, 01, 09, 01
							db 01, 09, 09, 01, 01, 01, 09, 01
							db 01, 01, 01, 01, 01, 01, 01, 01
							db 13, 00, 00, 13, 13, 00, 00, 13
sprite_carro_verde_izq      db 13, 00, 00, 13, 13, 00, 00, 13
							db 02, 02, 02, 02, 02, 02, 02, 02
							db 02, 09, 02, 02, 02, 09, 09, 02
							db 02, 09, 02, 02, 02, 09, 09, 02
							db 02, 09, 02, 02, 02, 09, 09, 02
							db 02, 09, 02, 02, 02, 09, 09, 02
							db 02, 02, 02, 02, 02, 02, 02, 02
							db 13, 00, 00, 13, 13, 00, 00, 13
sprite_carro_amarillo_izq   db 13, 00, 00, 13, 13, 00, 00, 13
							db 06, 06, 06, 06, 06, 06, 06, 06
							db 06, 09, 06, 06, 06, 09, 09, 06
							db 06, 09, 06, 06, 06, 09, 09, 06
							db 06, 09, 06, 06, 06, 09, 09, 06
							db 06, 09, 06, 06, 06, 09, 09, 06
							db 06, 06, 06, 06, 06, 06, 06, 06
							db 13, 00, 00, 13, 13, 00, 00, 13

sprite_inicio_camion_blanco 	db 13, 00, 00, 13, 13, 00, 00, 13
								db 0f, 0f, 0f, 0f, 0f, 0f, 0f, 0f
								db 0f, 0f, 0f, 0f, 0f, 0f, 0f, 0f
								db 0f, 0f, 0f, 0f, 0f, 0f, 0f, 0f
								db 0f, 0f, 0f, 0f, 0f, 0f, 0f, 0f
								db 0f, 0f, 0f, 0f, 0f, 0f, 0f, 0f
								db 0f, 0f, 0f, 0f, 0f, 0f, 0f, 0f
								db 13, 00, 00, 13, 13, 00, 00, 13
sprite_fin_camion_blanco 		db 13, 13, 13, 13, 13, 13, 13, 13
								db 0f, 0f, 0f, 0f, 13, 00, 00, 13
								db 0f, 0f, 0f, 0f, 07, 07, 07, 07
								db 0f, 0f, 0f, 0f, 07, 07, 07, 07
								db 0f, 0f, 0f, 0f, 07, 07, 07, 07
								db 0f, 0f, 0f, 0f, 07, 07, 07, 07
								db 0f, 0f, 0f, 0f, 13, 00, 00, 13
								db 13, 13, 13, 13, 13, 13, 13, 13


cadena_limpiar db "                                        $" 
segundo_ant dw 0000h
carro_random db 00h
cont_fila db 00h
semilla_random dw 01h
fila_mapa db 00h
columna_mapa db 00h
fila_jugador db 00h
columna_jugador db 00h

gameover_cadena db "GAME  OVER$"

tiempo_base_velocidad_lenta db 00h
tiempo_base_velocidad_media db 00h
tiempo_base_velocidad_rapida db 00h

tiempo_base_velocidad_lenta_aux db 00h
tiempo_base_velocidad_media_aux db 00h
tiempo_base_velocidad_rapida_aux db 00h

tiempo_actual db 00h
bandera_tiempo	db 00h

;;---------------------------------------Presentacion---------------------------------------
presentacion db 0ah,0ah,0ah,0ah," Universidad de San Carlos de Guatemala",0ah,0ah
			 db " Facultad de Ingenieria",0ah,0ah
			 db " Arquitectura de Computadoras y",0ah,0ah
			 db " Ensambladores 1",0ah,0ah
			 db " Seccion A",0ah,0ah
			 db " Segundo Semestre 2023",0ah,0ah,0ah,0ah
			 db " Nombre : Douglas Dario Rivera Ojeda",0ah,0ah
			 db " Carnet : 201122881","$"

;;---------------------------------------FIN TABLERO---------------------------------------

;;----------------------------------------USUARIOS----------------------------------------
usuarios_archivo db "USRS.ACE", 00
cadena_login_titulo db "            LOGIN$"
cadena_registro_titulo db "REGISTRO$"
cadena_usuariologin db "USUARIO: $"
cadena_passwordlogin db "PASSWORD: $"
cadena_error_apertura db "ERROR AL ABRIR EL ARCHIVO$"
cadena_error_lectura db "ERROR AL LEER EL ARCHIVO$"
cadena_error_login db "USUARIO O PASSWORD INCORRECTOS$"

buffer_entrada_usuario 	db 32, 00
						db 32 dup(00)
buffer_entrada_password db 32, 00
						db 32 dup(00)

usuario_actual db 14 dup(00), '$'


usuario_leido db 14 dup(00)
password_usuario db 19 dup(00)
rol_usuario db 00 ;; 0 -> admin original | 1 -> admin | 2 -> usuario
estado_usuario db 00 ;; 0 -> no bloqueado | 1 -> bloqueado
handle_usuarios dw 0000h
cont_login db 00h

cadenaarchivo	db "dojeda"
				db 0E dup(00)
				db "201122881A*"
				db 0E dup(00)
				db 00, 00
				
cadena_logincorrecto db "LOGIN CORRECTO$"
cadena_error_longitud_usuario db "ERROR: LONGITUD DE USUARIO INVALIDA$"
cadena_error_caracteres_no_validos db "ERROR: CARACTERES NO VALIDOS EN USUARIO$"
cadena_error_longitud_password db "ERROR: LONGITUD DE PASSWORD INVALIDA$"
cadena_error_caracteres_no_validos_password db "ERROR: CARACTERES NO VALIDOS EN PASSWORD$"
cadena_error_caracteres_requisitos_de_caracteres db "ERROR: NO CUMPLE CON LOS REQUISITOS DE CARACTERES$"
cadena_error_usuario_existe db "ERROR: USUARIO YA EXISTE$"
count_minusculas_password db 00h
count_mayusculas_password db 00h
count_caracter_especial_password db 00h

;;----------------------------------------FIN USUARIOS----------------------------------------
;;----------------------------------------PUNTAJES----------------------------------------

nombre_archivo_puntajes db "PUNTOS.ACE", 00

usuario_puntaje db 14 dup(00)
				db 00	;;Se Guarda el Signo de Imprimir
puntaje_usuario dw 0000h
hora_partida_puntaje dw 0000h
minuto_partida_puntaje dw 0000h
segundo_partida_puntaje dw 0000h


puntos_y_tiempo db " "
cadena_puntaje db "00000   "
cadena_hora_puntaje db "00:"
cadena_minuto_puntaje db "00:"
cadena_segundo_puntaje db "00$"


handle_puntajes dw 0000h

cadena_titulo_ultimos_puntajes db "============ULTIMOS PUNTAJES============", 0ah, 0ah,"$"

;;----------------------------------------FIN PUNTAJES----------------------------------------

;;----------------------------------------ORDENAMIENTO----------------------------------------
 
cadena_titulo_ordenamiento db "               ORDENAMIENTO", 0ah, 0ah,"$"
cantidad_puntajes_leidos db 00h
aux_nombre_usuario db 14 dup(00)
				   db 00h
lista_puntajes db 366 dup(00)
offset_lista_puntajes dw 0000h
offset_impresion_puntajes dw 0000h
offset_posicion_puntajes dw 0000h
count_ordenados db 00h
count_filas_puntajes db 00h
count_marcador db 00h
parametro_puntaje db 00h    ;; '1' -> puntaje | '2' -> tiempo
orientacion_puntaje db 00h	;; '1' -> ascendente | '2' -> descendente
tiempo1_puntaje dw 0000h
tiempo2_puntaje dw 0000h
velocidad_ordenamiento db 00h ;; '1' -> lenta | '2' -> media | '3' -> rapida
cadena_fin_ordenamiento db "ORDENAMIENTO FINALIZADO              $"
rr_delay dw 0000h
hh_delay dw 0000h
cadena_elegir_parametro db "ELEGIR PARAMETRO DE ORDENAMIENTO", 0ah, 0ah, "     1. PUNTAJE", 0ah, "     2. TIEMPO", 0ah, 0ah, "$"
cadena_elegir_orientacion db "ELEGIR ORIENTACION DE ORDENAMIENTO", 0ah, 0ah, "     1. ASCENDENTE", 0ah, "     2. DESCENDENTE", 0ah, 0ah, "$"
cadena_elegir_velocidad db "ELEGIR VELOCIDAD DE ORDENAMIENTO  ", 0ah, 0ah, "     1. LENTA      ", 0ah, "     2. MEDIA       ", 0ah, "     3. RAPIDA", 0ah, 0ah, "$"
cadena_tecla_continuar db "PRESIONE ESC PARA INICIAR SIMULACION$"
nombre_archivo_ordenamiento db "BUBBLE.ACE",00
handle_ordenamiento dw 0000h
offset_escribir_file dw 0000h
coma db ","
salto_linea db 0dh, 0ah
datos_desarrollador db "DESARROLLADO POR: Sergio Saul Ralda Mejia      ", 0ah, "CARNET: 202103216", 0ah, 0ah
cadena_ordenamiento_parametro_puntaje db "SE ORDENO POR PUNTAJE", 0ah
cadena_ordenamiento_parametro_tiempo db "SE ORDENO POR TIEMPO ", 0ah
cadena_ordenamiento_orientacion_ascendente db "SE ORDENO DE FORMA ASCENDENTE ", 0ah
cadena_ordenamiento_orientacion_descendente db "SE ORDENO DE FORMA DESCENDENTE", 0ah
cadena_fecha_ordenamiento db "FECHA: "
cadena_dia_ordenamiento db 02 dup (30),'/'
cadena_mes_ordenamiento db 02 dup (30),'/'
cadena_anho_ordenamiento db 04 dup (30),0ah
cadena_hor_ordenamiento db "HORA: "
cadena_hora_ordenamiento db 02 dup (30),':'
cadena_minutos_ordenamiento db 02 dup (30),':'
cadena_segundos_ordenamiento db 02 dup (30),0ah
dia_ordenamiento db 00h
mes_ordenamiento db 00h
anho_ordenamiento dw 0000h
hora_ordenamiento db 00h
minutos_ordenamiento db 00h
segundos_ordenamiento db 00h
segundos_actuales_ordenamiento db 00h
tiempo_actual_ordenamiento db 00h
tiempo_de_ordenamiento db "Tiempo que duro el ordenamiento: "
cadena_tiempo_ordenamiento db "00"
						   db " Segundos",0ah,0ah
;;----------------------------------------FIN ORDENAMIENTO----------------------------------------


;;----------------------------------------REPORTE HTML----------------------------------------

cadena_reporte_realizado db "REPORTE CREADO$"

nombre_reporte_html db "SYS.HTM",00

handle_reporte_html dw 0000h

dia_generacion db 00h
mes_generacion db 00h
anho_generacion dw 0000h
hora_generacion db 00h
minutos_generacion db 00h
segundos_generacion db 00h

reporte_html db "<!DOCTYPE html><html><head><meta charset='utf-8'><meta http-equiv='X-UA-Compatible' content='IE=edge'>"
             db "<title>Reporte</title><meta name='viewport' content='width=device-width, initial-scale=1'>"
             db "<style>body{display: block;justify-content: center;align-items: center;height: 100vh;margin: 0;}table{border-collapse: collapse;width: 50%;"
             db "margin-top: 20px;}th,td{border: 1px solid #dddddd;text-align: left;padding: 8px;}th{background-color: #f2f2f2;}</style></head>"
             db "<body><h1>Usuario: "
             nombre_usuario db 14 dup (00) 
             db "</h1>"
             db "<h2>Fecha y Hora Generacion Reporte</h2>"
             db "<h2>Fecha: "
             dia_cadena_generacion DB 02 dup (30),'/' 
             mes_cadena_generacion DB 02 dup (30),'/'
             anho_cadena_generacion DB 04 dup (30)
             db "</h2>"
             db "<h2>Hora: "
             hora_cadena_generacion DB 02 dup (30),':'
             minutos_cadena_generacion DB 02 dup (30),':'
             segundos_cadena_generacion DB 02 dup (30)
             db "</h2>"
			 db "<h2>Fecha y Hora de ingreso al Sistema del Usuario</h2>"
             db "<h2>Fecha: "
             dia_cadena_ingreso DB 02 dup (30),'/' 
             mes_cadena_ingreso DB 02 dup (30),'/'
             anho_cadena_ingreso DB 04 dup (30)
             db "</h2>"
             db "<h2>Hora: "
             hora_cadena_ingreso DB 02 dup (30),':'
             minutos_cadena_ingreso DB 02 dup (30),':'
             segundos_cadena_ingreso DB 02 dup (30)
             db "</h2>"

fin_html db "</body></html>"

titulo_tabla_usuarios_activos db "<h1>Usuario Activos</h1>"

titulo_tabla_usuarios_deshabilitados db "<h1>Usuario Deshabilitados</h1>"

inicio_tabla_usuarios db "<table style='display: block;'><thead><tr> <th>Usuario</th> <th>Password</th> <tr>"
             		  db "</thead><tbody>"
abre_fila_tabla_usuarios 		db "<tr> <td>"
							;usuario_tabla db 14 dup (00)
cierra_columna_tabla_usuarios	db "</td> <td>"
							;password_tabla db 19 dup (00)
cierra_fila_tabla_usuarios		db "</td> </tr>"

asterisco db "*"

fin_tabla_usuarios db "</tbody></table>"

titulo_tabla_partidas db "<h1>Ultimas 15 Partidas</h1>"

titulo_tabla_top db "<h1>Puntajes Top 10</h1>"

inicio_tabla_puntaje db "<table style='display: block;'><thead><tr> <th>Usuario</th> <th>Puntuacion</th> <th>Tiempo</th> <tr>"
             		 db "</thead><tbody>"
			 
fila_tabla_puntaje  db "<tr> <td>"
					usuario_tabla_puntaje db 14 dup (00)
					db "</td> <td>"
					puntuacion_tabla db 05 dup (00)
					db "</td>  <td>"
					hora_tabla db 02 dup (00), ':'
					minuto_tabla db 02 dup (00), ':'
					segundo_tabla db 02 dup (00)
					db "</td> </tr>"

fin_tabla_puntaje db "</tbody></table>"

usuario_leido_aux db 14 dup(00)
password_usuario_aux db 19 dup(00)
rol_usuario_aux db 00 ;; 0 -> admin original | 1 -> admin | 2 -> usuario
estado_usuario_aux db 00 ;; 0 -> no bloqueado | 1 -> bloqueado

offset_archivo dw 0000h
max_tabla_puntajes db 0fh
bandera_solo_ordenamiento db 00h

;;----------------------------------------FIN REPORTE HTML----------------------------------------



;;----------------------------------------BLOQUEO USUARIO----------------------------------------

bandera_coincide_usuario db 00h
count_intentos db 00h
usuario_anterior db 14 dup(00)
password_anterior db 19 dup(00)
offset_usuario_coincide dw 0000h
codigo_no_bloqueado db 00h
codigo_bloqueado db 01h
cadena_usuario_bloqueado db "USUARIO BLOQUEADO$"
buffer_desbloqueo_usuario	db 32,00 
							db 32 dup(00)
cadena_titulo_desbloqueo_usuario db "              DESBLOQUEO USUARIO            $"
cadena_ingrese_usuario db "INGRESE USUARIO: $"
offset_desbloque_usuario dw 0000h
cadena_usuario_desbloqueado db "USUARIO DESBLOQUEADO$"
cadena_error_no_existe_usuario db "ERROR: USUARIO NO EXISTE$"
;;----------------------------------------FIN BLOQUEO USUARIO----------------------------------------

;;----------------------------------------PROMOVER USUARIO----------------------------------------

cadena_titulo_promover_usuario db "          PROMOVER O DEGRADAR          $"
menu_promover_degradar_usuario db "	1. PROMOVER USUARIO",0ah,0ah,"	2. DEGRADAR USUARIO",0ah,0ah,"	","$"
buffer_promover_degradar_usuario	db 32,00 
									db 32 dup(00)
cadena_ingrese_usuario_promover db "	INGRESE USUARIO: $"
offset_promover_degradar_usuario dw 0000h
rol_promover_degradar db 00h
opcion_promover_degradar db 00h
cadena_usuario_promovido_degradado db "USUARIO PROMOVIDO/DEGRADADO CON EXITO$"
;;----------------------------------------FIN PROMOVER USUARIO----------------------------------------


;;----------------------------------------ESTADISTICAS----------------------------------------

cadena_titulo_estadisticas db "           ESTADISTICAS          $"


;;----------------------------------------FIN ESTADISTICAS----------------------------------------


;;---------------------------------------INICIO MENU ADMIN ORIGINAL----------------------------
cadena_usuario_base				db "              MENU",0ah,0ah
								db "	 F1	 NUEVA PARTIDA",0ah,0ah
								db "	 F2	 ULTIMAS PARTIDAS",0ah,0ah
								db "	 F3	 CERRAR SESION",0ah,0ah,"$"
cadena_usuario_admin			db "	 F4  ESTADISTICAS",0ah,0ah
								db "	 F5  ORDENAMIENTO",0ah,0ah
								db "	 F6	 DESBLOQUEAR USUARIO",0ah,0ah
								db "	 F7	 REPORTE DEL SISTEMA",0ah,0ah,"$"
cadena_usuario_admin_original	db "	 F8	 PROMOVER O DEGRADAR$",0ah,0ah,"$"

cadena_pantalla_inicial			db "	 F1	 LOGIN",0ah,0ah;db "===========PANTALLA INICIAL=============",0ah,0ah
								;db 0ah,0ah,"	F1	LOGIN",0ah,0ah
								db "	 F2	 REGISTRO",0ah,0ah
								db "	 ESC     SALIR$"

;;MENU PAUSE OPT 1 -> CONTINUAR, OPT 2 -> SALIR
cadena_menu_pause				db "                PAUSE               ",0ah,0ah
								db "	F1	CONTINUAR",0ah,0ah
								db "	F2	SALIR",0ah,0ah,"$"
;;--------------------------------------- MENU PRINCIPAL---------------------------------------

.CODE
.STARTUP 
;;===========================================INICIO_INSTRUCCIONES===========================================

;;-----------------------------------------MODO DE VIDEO-----------------------------------------
    ;Cambiar a modo video 13h
    mov AL, 13h
    mov AH, 00h 
    int 10h
	;;colocar cursos en 0,0 e imprimir presentacion po 2 segundos
	mov AH, 02h
	mov BH, 00h
	mov DH, 00h
	mov DL, 00h
	int 10h
	mov DX, offset presentacion
	mov AH, 09h
	int 21h
	;;Retardo de 2 segundos
	MOV SI, 2710h
et2:	
	DEC SI
	JZ et3
	MOV DI, 1482h
et1:		
	DEC DI
	JNZ et1
	JMP et2
et3:
	jmp PANTALLA_INICIAL
;;---------------------------------------FIN MODO DE VIDEO---------------------------------------

;;ecribir en archivo
	mov CX, 0000
	mov DX, offset usuarios_archivo
	mov AH, 3ch
	int 21h
	mov handle_usuarios, AX
	;;;escribir en archivo
	mov BX, handle_usuarios
	mov CX, 2fh
	mov DX, offset cadenaarchivo
	mov AH, 40h
	int 21h
	;cerrar archivo
	mov BX, handle_usuarios
	mov AH, 3eh
	int 21h

;;------------------------------------------INICIO LOGIN ----------------------------------------------
ERROR_APERTURA_REGISTRO:
	mov AH, 02h
	mov BH, 00h
	mov DH, 18h
	mov DL, 00h
	int 10h
	mov DX, offset cadena_error_apertura
	mov AH, 09h
	int 21h
	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h

	jmp PANTALLA_INICIAL

ERROR_APERTURA:
	mov AH, 02h
	mov BH, 00h
	mov DH, 18h
	mov DL, 00h
	int 10h

	mov DX, offset cadena_error_apertura
	mov AH, 09h
	int 21h
	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h

	jmp PANTALLA_INICIAL
ERROR_LECTURA:
	mov AH, 02h
	mov BH, 00h
	mov DH, 18h
	mov DL, 00h
	int 10h
	mov DX, offset cadena_error_lectura
	mov AH, 09h
	int 21h
	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h

	jmp PANTALLA_INICIAL


ERROR_LOGIN:
	;Verificar si el usuario existe
	cmp bandera_coincide_usuario, 00h
	je SIGUIE_ERROR_LOGIN
	;Verificar si el usuario_anterior es igual al usuario en el buffer
	mov SI, offset buffer_entrada_usuario + 2
	mov DI, offset usuario_anterior
	mov CX, 14h
LOOP_VERIFICAR_USUARIO:
	mov AL, [SI]
	cmp AL, [DI]
	jne ERROR_USUARIO_NO_COINCIDE
	inc SI
	inc DI
	loop LOOP_VERIFICAR_USUARIO
	;;Los usuarios coinciden
	inc count_intentos
	jmp SIGUIE_ERROR_LOGIN
	;
ERROR_USUARIO_NO_COINCIDE:
	mov count_intentos, 00h
	inc count_intentos
	;Copiar el usuario del buffer al usuario_anterior
	mov SI, offset buffer_entrada_usuario + 2
	mov DI, offset usuario_anterior
	mov CX, 14h
LOOP_COPIAR_USUARIO:
	mov AL, [SI]
	mov [DI], AL
	inc SI
	inc DI
	loop LOOP_COPIAR_USUARIO

SIGUIE_ERROR_LOGIN:
	cmp count_intentos, 03h
	jne ERROR_LOGIN_NORMAL
	mov count_intentos, 00h
	mov [usuario_anterior], 00h
	;;;Bloquear usuario
	;Mover a offset Guardado del usuario que coincide
	dec offset_usuario_coincide	
	mov AH, 42h
	mov AL, 00h
	mov BX, handle_usuarios
	mov CX, 0000h
	mov DX, offset_usuario_coincide
	int 21h
	;
	;Escribir en el archivo
	mov BX, handle_usuarios
	mov CX, 0001h
	mov DX, offset codigo_bloqueado
	mov AH, 40h
	int 21h
	;Imprimir cadena de usuario bloqueado
	mov AH, 02h
	mov BH, 00h
	mov DH, 18h
	mov DL, 00h
	int 10h
	mov DX, offset cadena_usuario_bloqueado
	mov AH, 09h
	int 21h

	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h
	jmp FINAL_ERROR_LOGIN
ERROR_LOGIN_NORMAL:
	mov AH, 02h
	mov BH, 00h
	mov DH, 18h
	mov DL, 00h
	int 10h
	mov DX, offset cadena_error_login
	mov AH, 09h
	int 21h

	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h
FINAL_ERROR_LOGIN:
	;Cerrar archivo
	mov BX, handle_usuarios
	mov AH, 3eh
	int 21h
	jmp PANTALLA_INICIAL

;;--------------------------------------PANTALLA INICIAL--------------------------------------------------

PANTALLA_INICIAL:
	call limpiar_pantalla

	mov AH, 02h
	mov BH, 00h
	mov DH, 02h
	mov DL, 00h
	int 10h

	;;imprimir cadena_pantalla_inicial
	mov DX, offset cadena_pantalla_inicial
	mov AH, 09h
	int 21h

	;;esperar a presionar una tecla
	mov AH, 00h
	int 16h

	;;se compara la tecla presionada
	cmp AH, 3bh
	je LOGIN
	cmp AH, 3ch
	je REGISTRO
	cmp AH, 01
	je FINAL_PROGRAMA

	jmp PANTALLA_INICIAL

ERROR_LONGITUD_USUARIO:

	mov AH, 02h
	mov BH, 00h
	mov DH, 17h ;;fila
	mov DL, 00h ;;columna
	int 10h
	mov DX, offset cadena_error_longitud_usuario
	mov AH, 09h
	int 21h

	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h

	jmp REGISTRO

ERROR_CARACTERES_NO_VALIDOS:

	mov AH, 02h
	mov BH, 00h
	mov DH, 17h ;;fila
	mov DL, 00h ;;columna
	int 10h
	mov DX, offset cadena_error_caracteres_no_validos
	mov AH, 09h
	int 21h

	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h

	jmp REGISTRO


ERROR_LONGITUD_PASSWORD:

	mov AH, 02h
	mov BH, 00h
	mov DH, 17h ;;fila
	mov DL, 00h ;;columna
	int 10h
	mov DX, offset cadena_error_longitud_password
	mov AH, 09h
	int 21h

	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h

	jmp REGISTRO

ERROR_CARACTERES_NO_VALIDOS_PASSWORD:

	mov AH, 02h
	mov BH, 00h
	mov DH, 17h ;;fila
	mov DL, 00h ;;columna
	int 10h
	mov DX, offset cadena_error_caracteres_no_validos_password
	mov AH, 09h
	int 21h

	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h

	jmp REGISTRO

ERROR_CARACTERES_REQUISITOS_DE_CARACTERES:

	mov AH, 02h
	mov BH, 00h
	mov DH, 17h ;;fila
	mov DL, 00h ;;columna
	int 10h
	mov DX, offset cadena_error_caracteres_requisitos_de_caracteres
	mov AH, 09h
	int 21h

	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h

	jmp REGISTRO

ERROR_USUARIO_EXISTE:

	mov AH, 02h
	mov BH, 00h
	mov DH, 17h ;;fila
	mov DL, 00h ;;columna
	int 10h
	mov DX, offset cadena_error_usuario_existe
	mov AH, 09h
	int 21h

	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h

	jmp REGISTRO

;;--------------------------------------REGISTRO--------------------------------------------------
REGISTRO:

	;Limpiar counts password
	mov count_minusculas_password, 00h
	mov count_mayusculas_password, 00h
	mov count_caracter_especial_password, 00h

	;Limpiar Pantalla
	call limpiar_pantalla

	;;limpiar buffer usuario
	mov BX, offset buffer_entrada_usuario
	call limpiar_buffer

	;;limpiar buffer password
	mov BX, offset buffer_entrada_password
	call limpiar_buffer

	;;colocar cursor en la posicion fila, col -> 04h, 06h
	mov AH, 02h
	mov BH, 00h
	mov DH, 04h
	mov DL, 05h
	int 10h

	;;imprimir cadena_registro_titulo
	mov DX, offset cadena_registro_titulo
	mov AH, 09h
	int 21h

;;------------------------------------USUARIO------------------------------------
	;;colocar cursor en la posicion fila, col -> 08h, 06h
	mov AH, 02h
	mov BH, 00h
	mov DH, 08h
	mov DL, 06h
	int 10h

	;;imprimir cadena_usuariologin
	mov DX, offset cadena_usuariologin
	mov AH, 09h
	int 21h

	;;pedir nombre de usuario
	mov AH, 0ah
	mov DX, offset buffer_entrada_usuario
	int 21h

	mov AL, [buffer_entrada_usuario+1]
	mov AH, 00
	mov SI, AX
	mov DI, offset buffer_entrada_usuario+2
	add DI, SI
	mov AL, 00
	mov [DI], AL

	;Valida Usuario
	;usuario -> [a-z][a-z0-9._-]    rango {8,20}
	
	;Valida Longitud de Usuario de 8 a 20 caracteres
	mov AL, [buffer_entrada_usuario+1]
	cmp AL, 08h
	jl ERROR_LONGITUD_USUARIO
	cmp AL, 14h
	jg ERROR_LONGITUD_USUARIO

	;Validar que los caracteres sean de [a-z] o de [0-9] o de [._-]
	mov SI, offset buffer_entrada_usuario+2
	mov CH, 00h
	mov CL, [buffer_entrada_usuario+1]
LOOP_VALIDAR_USUARIO:
	mov AL, [SI]
	;Validar Si es '-' o '_' o '.'
	cmp AL, '-'
	je FINAL_LOOP_VALIDAR_USUARIO
	cmp AL, '_'
	je FINAL_LOOP_VALIDAR_USUARIO
	cmp AL, '.'
	je FINAL_LOOP_VALIDAR_USUARIO
	;Validar Si es de [0-9]
	cmp AL, '0'
	jl ERROR_CARACTERES_NO_VALIDOS
	cmp AL, '9'
	jle FINAL_LOOP_VALIDAR_USUARIO
	;Validar Si es de [a-z]
	cmp AL, 'a'
	jl ERROR_CARACTERES_NO_VALIDOS
	cmp AL, 'z'
	jle FINAL_LOOP_VALIDAR_USUARIO
	jmp ERROR_CARACTERES_NO_VALIDOS
FINAL_LOOP_VALIDAR_USUARIO:
	inc SI
	loop LOOP_VALIDAR_USUARIO


;;Abrir Archivo Usuario y verificar que el Usuario no exista

	;;Abrir Archivo de Usuario
	mov AH, 3dh
	mov AL, 00h ;Solo lectura
	mov DX, offset usuarios_archivo
	int 21h

	;;error de apertura
	jc ERROR_APERTURA_REGISTRO
	mov handle_usuarios, AX

	;;Leer los Usuario y verificar que no exista
LEER_USUARIO_REGISTRO:
	;;leer usuario
	mov AH, 3fh
	mov BX, handle_usuarios
	mov CX, 2fh ;;se lee toda la estructura
	mov DX, offset usuario_leido
	int 21h
	;;error de lectura
	jc ERROR_LECTURA
	cmp AX, 00h
	je USUARIO_NO_EXISTE
	mov CX, 0014h
	mov SI, offset usuario_leido
	mov DI, offset [buffer_entrada_usuario + 2]
LOOP_COMPARAR_USUARIO:
	mov AL, [SI]
	cmp AL, [DI]
	jne LEER_USUARIO_REGISTRO
	inc SI
	inc DI
	loop LOOP_COMPARAR_USUARIO
	;;si llega aqui es porque el usuario ya existe
	jmp ERROR_USUARIO_EXISTE

USUARIO_NO_EXISTE:
	;;cerrar archivo
	mov BX, handle_usuarios
	mov AH, 3eh
	int 21h


;;------------------------------------PASSWORD------------------------------------

	;;colocar cursor en la posicion fila, col -> 0ah, 06h
	mov AH, 02h
	mov BH, 00h
	mov DH, 0ah
	mov DL, 06h
	int 10h

	;;imprimir cadena_passwordlogin
	mov DX, offset cadena_passwordlogin
	mov AH, 09h
	int 21h

	;;pedir password
	mov AH, 0ah
	mov DX, offset buffer_entrada_password
	int 21h

	mov AL, [buffer_entrada_password+1]
	mov AH, 00
	mov SI, AX
	mov DI, offset buffer_entrada_password+2
	add DI, SI
	mov AL, 00
	mov [DI], AL

	;Valida Password 
	;Password -> [a-zA-Z*_.-@+?]+ rango {15,25}

	;Valida Longitud de Usuario de 8 a 20 caracteres
	mov AL, [buffer_entrada_password+1]
	cmp AL, 0fh
	jl ERROR_LONGITUD_PASSWORD
	cmp AL, 19h
	jg ERROR_LONGITUD_PASSWORD

	;Validar que los caracteres [a-zA-Z*_.-@+?]+
	mov SI, offset buffer_entrada_password+2
	mov CH, 00h
	mov CL, [buffer_entrada_password+1]
LOOP_VALIDAR_PASSWORD:
	mov AL, [SI]
	;Validar Si es '-' o '_' o '.' o '@' o '+' o '?' o '*'
	cmp AL, '-'
	je DETECTO_CARACTER_ESPECIAL
	cmp AL, '_'
	je DETECTO_CARACTER_ESPECIAL
	cmp AL, '.'
	je DETECTO_CARACTER_ESPECIAL
	cmp AL, '@'
	je DETECTO_CARACTER_ESPECIAL
	cmp AL, '+'
	je DETECTO_CARACTER_ESPECIAL
	cmp AL, '?'
	je DETECTO_CARACTER_ESPECIAL
	cmp AL, '*'
	je DETECTO_CARACTER_ESPECIAL
	;Validar [A-Z]
	cmp AL, 'A'
	jl ERROR_CARACTERES_NO_VALIDOS_PASSWORD
	cmp AL, 'Z'
	jle DETECTO_MAYUSCULA
	;Validar Si es de [a-z]
	cmp AL, 'a'
	jl ERROR_CARACTERES_NO_VALIDOS_PASSWORD
	cmp AL, 'z'
	jle DETECTO_MINUSCULA
	jmp ERROR_CARACTERES_NO_VALIDOS_PASSWORD
DETECTO_CARACTER_ESPECIAL:
	inc count_caracter_especial_password
	jmp FINAL_LOOP_VALIDAR_PASSWORD
DETECTO_MAYUSCULA:
	inc count_mayusculas_password
	jmp FINAL_LOOP_VALIDAR_PASSWORD
DETECTO_MINUSCULA:
	inc count_minusculas_password
FINAL_LOOP_VALIDAR_PASSWORD:
	inc SI
	loop LOOP_VALIDAR_PASSWORD

	;;Validar minimo 4 minusculas, minimo 3 mayusculas y minimo un caracter especial
	cmp count_minusculas_password, 04h
	jl ERROR_CARACTERES_REQUISITOS_DE_CARACTERES
	cmp count_mayusculas_password, 03h
	jl ERROR_CARACTERES_REQUISITOS_DE_CARACTERES
	cmp count_caracter_especial_password, 01h
	jl ERROR_CARACTERES_REQUISITOS_DE_CARACTERES


	;;Abrir Archivo de Usuario
	mov AH, 3dh
	mov AL, 02h
	mov DX, offset usuarios_archivo
	int 21h

	;;error de apertura
	jc ERROR_APERTURA_REGISTRO
	mov handle_usuarios, AX

	;;mover el puntero al final del archivo
	mov AL, 02h
	mov AH, 42h
	mov BX, handle_usuarios
	mov CX, 0000h
	mov DX, 0000h
	int 21h

	jc ERROR_APERTURA_REGISTRO

	;;escribir en el archivo el nuevo usuario
	mov AH, 40h
	mov BX, handle_usuarios
	mov CX, 14h
	mov DX, offset buffer_entrada_usuario + 2
	int 21h

	mov AH, 40h
	mov BX, handle_usuarios
	mov CX, 19h
	mov DX, offset buffer_entrada_password + 2
	int 21h

	mov rol_usuario, 02h
	mov estado_usuario, 00h
	
	mov AH, 40h
	mov BX, handle_usuarios
	mov CX, 01h
	mov DX, offset rol_usuario
	int 21h

	mov AH, 40h
	mov BX, handle_usuarios
	mov CX, 01h
	mov DX, offset estado_usuario
	int 21h

	;;cerrar archivo
	mov BX, handle_usuarios
	mov AH, 3eh
	int 21h


	jmp PANTALLA_INICIAL

;; --------------------------------------- LOGIN ----------------------------------------------

LOGIN:
	call limpiar_pantalla

	;;limpiar buffer usuario
	mov BX, offset buffer_entrada_usuario
	call limpiar_buffer

	;;limpiar buffer password
	mov BX, offset buffer_entrada_password
	call limpiar_buffer

	;;colocar cursor en la posicion fila, col -> 04h, 06h
	mov AH, 02h
	mov BH, 00h
	mov DH, 04h
	mov DL, 05h
	int 10h

	;;imprimir cadena_login_titulo
	mov DX, offset cadena_login_titulo
	mov AH, 09h
	int 21h

;;------------------------------------USUARIO------------------------------------

	;;colocar cursor en la posicion fila, col -> 08h, 06h
	mov AH, 02h
	mov BH, 00h
	mov DH, 08h
	mov DL, 06h
	int 10h

	;;imprimir cadena_usuariologin
	mov DX, offset cadena_usuariologin
	mov AH, 09h
	int 21h

	;;pedir nombre de usuario
	mov AH, 0ah
	mov DX, offset buffer_entrada_usuario
	int 21h

	mov AL, [buffer_entrada_usuario+1]
	mov AH, 00
	mov SI, AX
	mov DI, offset buffer_entrada_usuario+2
	add DI, SI
	mov AL, 00
	mov [DI], AL

;;------------------------------------PASSWORD------------------------------------

	;;colocar cursor en la posicion fila, col -> 0ah, 06h
	mov AH, 02h
	mov BH, 00h
	mov DH, 0ah
	mov DL, 06h
	int 10h

	;;imprimir cadena_passwordlogin
	mov DX, offset cadena_passwordlogin
	mov AH, 09h
	int 21h

	;;pedir password
	mov AH, 0ah
	mov DX, offset buffer_entrada_password
	int 21h

	mov AL, [buffer_entrada_password+1]
	mov AH, 00
	mov SI, AX
	mov DI, offset buffer_entrada_password+2
	add DI, SI
	mov AL, 00
	mov [DI], AL

;;------------------------------------VERIFICAR CREDENCIALES------------------------------------

	;;abrir archivo de usuarios
	mov AH, 3dh
	mov AL, 02h
	mov DX, offset usuarios_archivo
	int 21h
	;;error de apertura
	jc ERROR_APERTURA
	mov handle_usuarios, AX
	mov bandera_coincide_usuario, 00h
LEER_USUARIO:
	;;leer usuario
	mov AH, 3fh
	mov BX, handle_usuarios
	mov CX, 2fh ;;se lee toda la estructura
	mov DX, offset usuario_leido
	int 21h
	;;error de lectura
	jc ERROR_LECTURA
	
	cmp AX, 00h
	je ERROR_LOGIN

	;;comparar usuario
	mov SI, offset usuario_leido
	mov DI, offset [buffer_entrada_usuario + 2] ;; inicio cadena
	mov CX, 2dh ;;tamaño de la cadena 45 decimal = 2dh
	mov cont_login, 00h
CICLO_LEER_USUARIO:
	mov AL, [SI]
	cmp AL, [DI]
	;
	jne LEER_USUARIO
	cmp cont_login, 13h
	jne SEGUIR_LEYENDO
	mov DI, offset [buffer_entrada_password + 1] ;; inicio cadena
	;Si llega aqui es porque el usuario coincide
	mov bandera_coincide_usuario, 01h
	;;Guardar pointer actual del archivo de usuarios
	mov BP, CX
	;
	mov AH, 42h
	mov AL, 01h
	mov BX, handle_usuarios
	mov CX, 0000h
	mov DX, 0000h
	int 21h
	mov offset_usuario_coincide, AX
	mov CX, BP
SEGUIR_LEYENDO:
	inc SI
	inc DI
	inc cont_login
	loop CICLO_LEER_USUARIO
;;Usuario Encontrado. Se posiciona el cursos y se imprime "Login Correcto"
	;Cerrar archivo
	mov BX, handle_usuarios
	mov AH, 3eh
	int 21h
	;Reinicia contador de intentos
	mov count_intentos, 00h
	;Guardar fecha_hora ingreso al Sistema de Usuario
	call ACTUALIZAR_FECHA_HORA
	
	;Verificar si el usuario esta bloqueado
	cmp estado_usuario, 01h
	jne USUARIO_NO_BLOQUEADO
	;Imprimir cadena de usuario bloqueado
	mov AH, 02h
	;Posicionar Cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 18h ;;fila
	mov DL, 00h ;;columna
	int 10h
	mov DX, offset cadena_usuario_bloqueado
	mov AH, 09h
	int 21h
	;Esperar a presionar una tecla
	mov AH, 01h
	int 21h
	;Volver a pantalla inicial
	jmp PANTALLA_INICIAL


USUARIO_NO_BLOQUEADO:
	;Posicionar Cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 18h ;;fila
	mov DL, 00h ;;columna
	int 10h
	mov DX, offset cadena_logincorrecto
	mov AH, 09h
	int 21h

	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h

	jmp MENU
;;------------------------------------------FIN LOGIN ----------------------------------------------

;;------------------------------------------INICIO MENU ADMIN ORIGINAL ----------------------------------------------

MENU:
	call limpiar_pantalla
	;;Mostrar encabezado SIEMPRE
	mov AH, 02h
	mov BH, 00h
	mov DH, 01h
	mov DL, 04h
	int 10h
	mov DX, offset cadena_usuario_base
	mov AH, 09h
	int 21h

	;;admin orginal
	cmp rol_usuario, USUARIO_ADMIN_ORIGINAL
	je MENU_ADMIN_ORIGINAL
	;;admin
	cmp rol_usuario, USUARIO_ADMIN
	je MENU_ADMIN_NORMAL
	;;normal
	jmp SIGUE_MENU

MENU_ADMIN_ORIGINAL:
	mov DX, offset cadena_usuario_admin
	mov AH, 09h
	int 21h
	mov DX, offset cadena_usuario_admin_original
	mov AH, 09h
	int 21h
	jmp SIGUE_MENU
MENU_ADMIN_NORMAL:
	mov DX, offset cadena_usuario_admin	
	mov AH, 09h
	int 21h
SIGUE_MENU:
	;;se lee la tecla presionada
	mov AH, 00h
	int 16h

	;;se compara la tecla presionada
	cmp AH, 3bh ;F1
	je CONFIG_JUEGO  ;Nueva Partida
	cmp AH, 3ch ;F2
	je ULTIMAS_PARTIDAS
	cmp AH, 3dh ;F3
	je PANTALLA_INICIAL
	cmp AH, 3eh ;F4
	je ESTADISTICAS
	cmp AH, 3fh ;F5
	je ORDENAMIENTO
	cmp AH, 40h
	je DESBLOQUEAR_USUARIO
	cmp AH, 41h
	je REPORTE_DEL_SISTEMA
	cmp AH, 42h
	je PROMOVER_O_DEGRADAR
	jmp SIGUE_MENU
;;--------------------------------------------FIN MENU ----------------------------------------------

;;--------------------------------------------ESTADISTICAS----------------------------------------------

ESTADISTICAS:
	call limpiar_pantalla
	;;Imprimir titulo de estadisticas
	;Posicionar Cursos 0,0 e imprimir titulo de puntajes
	mov AH, 02h
	mov BH, 00h
	mov DH, 00h ;;fila
	mov DL, 00h	;;columna
	int 10h

	mov DX, offset cadena_titulo_estadisticas
	mov AH, 09h
	int 21h

	;;Poner $ en la posicion 21 del buffer_entrada_usuario
	mov BX, offset buffer_entrada_usuario + 16
	;;
	mov AL, "$"
	mov [BX], AL

	;;Abrir el archivo de Puntajes
	mov AH, 3dh
	mov AL, 00h ;Solo lectura
	mov DX, offset nombre_archivo_puntajes
	int 21h
	;error de apertura
	;jc ERROR_APERTURA

	mov handle_puntajes, AX

	;;Leer los Puntajes
;;Leer los Usuario y verificar que no exista
LEER_USUARIO_PUNTAJE_ESTADISTICAS:
	;;leer usuario
	mov AH, 3fh
	mov BX,	handle_puntajes
	mov CX, 1Dh ;;se lee toda la estructura
	mov DX, offset usuario_puntaje
	int 21h
	;;error de lectura
	;jc ERROR_LECTURA
	cmp AX, 00h
	je TERMINAR_LECTURA_ESTADISTICAS
	mov CX, 0014h
	mov SI, offset usuario_puntaje
	mov DI, offset [buffer_entrada_usuario + 2]
	;;si llega aqui es porque se encontro el usuario
	;;se imprime el usuario
	mov DX, offset usuario_puntaje
	mov AH, 09h
	int 21h
	;convertir puntaje_usuario en cadena y guardar el cadena_puntaje
	mov AX, puntaje_usuario
	mov DI, offset cadena_puntaje
	mov CX, 0005h
	call numAstr
	;convertir tiempo a cadena
	mov AX, hora_partida_puntaje
	mov DI, offset cadena_hora_puntaje
	mov CX, 0002h
	call numAstr
	mov AX, minuto_partida_puntaje
	mov DI, offset cadena_minuto_puntaje
	mov CX, 0002h
	call numAstr
	mov AX, segundo_partida_puntaje
	mov DI, offset cadena_segundo_puntaje
	mov CX, 0002h
	call numAstr
	;imprimir cadena_puntaje
	mov DX, offset puntos_y_tiempo
	mov AH, 09h
	int 21h
	;;imprimir caracter de salto de linea
	mov DL, 0ah
	mov AH, 02h
	int 21h
	jmp LEER_USUARIO_PUNTAJE_ESTADISTICAS

TERMINAR_LECTURA_ESTADISTICAS:
	;;cerrar archivo
	mov BX, handle_puntajes
	mov AH, 3eh
	int 21h

	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h

	;;Quitar $ en la posicion 21 del buffer_entrada_usuario
	mov BX, offset buffer_entrada_usuario + 16
	;;
	mov AL, 00
	mov [BX], AL

	jmp MENU


;;--------------------------------------------FIN ESTADISTICAS----------------------------------------------




;;--------------------------------------------PROMOVER O DEGRADAR----------------------------------------------

PROMOVER_O_DEGRADAR:
	call limpiar_pantalla
	;;Imprimir titulo de promover o degradar
	;Poner cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 00h ;fila
	mov DL, 00h	;columna
	int 10h	
	;Imprimri titulo de desbloque de usuario
	mov DX, offset cadena_titulo_promover_usuario
	mov AH, 09h
	int 21h
	;Poner cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 02h ;fila
	mov DL, 00h	;columna
	int 10h	
	;Imprimir menu de promover o degradar
	mov DX, offset menu_promover_degradar_usuario
	mov AH, 09h
	int 21h
	;Leer Opcion
	mov AH, 01h
	int 21h
	;Verificar la opcion elegida
	mov opcion_promover_degradar, AL
	cmp AL, '1'
	je PROMOVER_DEGRADAR
	cmp AL, '2'
	je PROMOVER_DEGRADAR
	jmp PROMOVER_O_DEGRADAR
	;
PROMOVER_DEGRADAR:
	;Limpiar buffer
	mov BX, offset buffer_promover_degradar_usuario
	call limpiar_buffer
	;Poner cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 07h ;fila
	mov DL, 00h	;columna
	int 10h	
	;Imprimir ingrese usuario
	mov DX, offset cadena_ingrese_usuario_promover
	mov AH, 09h
	int 21h
	;Leer usuario
	mov AH, 0ah
	mov DX, offset buffer_promover_degradar_usuario
	int 21h
	;Quitar el salto de linea al final del buffer
	mov AL, [buffer_promover_degradar_usuario+1]
	mov AH, 00
	mov SI, AX
	mov DI, offset buffer_promover_degradar_usuario+2
	add DI, SI
	mov AL, 00
	mov [DI], AL
	;Abrir archivo de usuarios
	mov AH, 3dh
	mov AL, 02h
	mov DX, offset usuarios_archivo
	int 21h
	;error de apertura
	;jc ERROR_APERTURA
	mov handle_usuarios, AX
	;
	;Leer los Usuarios
LEER_USUARIO_PROMOVER_DEGRADAR:
	;Guardar pointer actual del archivo de usuarios
	mov AH, 42h
	mov AL, 01h
	mov BX, handle_usuarios
	mov CX, 0000h
	mov DX, 0000h
	int 21h
	mov offset_promover_degradar_usuario, AX
	;leer usuario
	mov AH, 3fh
	mov BX, handle_usuarios
	mov CX, 2fh ;;se lee toda la estructura
	mov DX, offset usuario_leido_aux
	int 21h
	;;error de lectura
	;jc ERROR_LECTURA
	cmp AX, 00h
	je FINAL_LEER_USUARIO_PROMOVER_DEGRADAR
	mov CX, 0014h
	mov SI, offset usuario_leido_aux
	mov DI, offset [buffer_promover_degradar_usuario + 2]
LOOP_COMPARAR_USUARIO_PROMOVER_DEGRADAR:
	mov AL, [SI]
	cmp AL, [DI]
	jne LEER_USUARIO_PROMOVER_DEGRADAR
	inc SI
	inc DI
	loop LOOP_COMPARAR_USUARIO_PROMOVER_DEGRADAR
	;;si llega aqui es porque el usuario coincide
	;Mover a offset Guardado del usuario que coincide
	add offset_promover_degradar_usuario, 002Dh
	;Verficar que opcion se eligio para asi cambiar el rol
	cmp opcion_promover_degradar, '1'
	je PROMOVER_USUARIO
	cmp opcion_promover_degradar, '2'
	je DEGRADAR_USUARIO

PROMOVER_USUARIO:
	mov rol_promover_degradar, 01h
	jmp ESCRIBIR_PROMOVER_DEGRADAR
DEGRADAR_USUARIO:
	mov rol_promover_degradar, 02h
ESCRIBIR_PROMOVER_DEGRADAR:
	mov AH, 42h
	mov AL, 00h
	mov BX, handle_usuarios
	mov CX, 0000h
	mov DX, offset_promover_degradar_usuario
	int 21h
	;
	;Escribir en el archivo
	mov BX, handle_usuarios
	mov CX, 0001h
	mov DX, offset rol_promover_degradar
	mov AH, 40h
	int 21h
	;
	;Cerrar archivo
	mov BX, handle_usuarios
	mov AH, 3eh
	int 21h
	;Poner cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 18h ;fila
	mov DL, 00h	;columna
	int 10h
	;Imprimir cadena de usuario bloqueado
	mov DX, offset cadena_usuario_promovido_degradado
	mov AH, 09h
	int 21h
	;Esperar a presionar una tecla
	mov AH, 01h
	int 21h
	;
	jmp FINAL_PROMOVER_DEGRADAR
FINAL_LEER_USUARIO_PROMOVER_DEGRADAR:
	;Cerrar archivo
	mov BX, handle_usuarios
	mov AH, 3eh
	int 21h
	;Poner cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 18h ;fila
	mov DL, 00h	;columna
	int 10h
	;Imprimir cadena de usuario bloqueado
	mov DX, offset cadena_error_no_existe_usuario
	mov AH, 09h
	int 21h
	;Esperar a presionar una tecla
	mov AH, 01h
	int 21h
	;
	jmp FINAL_PROMOVER_DEGRADAR
FINAL_PROMOVER_DEGRADAR:
	jmp MENU

;;--------------------------------------------FIN PROMOVER O DEGRADAR----------------------------------------------




;;--------------------------------------------DESBLOQUER USUARIO----------------------------------------------

DESBLOQUEAR_USUARIO:
	call limpiar_pantalla
	;Limpiar buffer
	mov BX, offset buffer_desbloqueo_usuario
	call limpiar_buffer
	;Poner cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 00h ;fila
	mov DL, 00h	;columna
	int 10h	
	;Imprimri titulo de desbloque de usuario
	mov DX, offset cadena_titulo_desbloqueo_usuario
	mov AH, 09h
	int 21h
	;Poner cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 02h ;fila
	mov DL, 05h	;columna
	int 10h	
	;Imprimir ingrese usuario
	mov DX, offset cadena_ingrese_usuario
	mov AH, 09h
	int 21h
	;Leer usuario
	mov AH, 0ah
	mov DX, offset buffer_desbloqueo_usuario
	int 21h
	;Quitar el salto de linea al final del buffer
	mov AL, [buffer_desbloqueo_usuario+1]
	mov AH, 00
	mov SI, AX
	mov DI, offset buffer_desbloqueo_usuario+2
	add DI, SI
	mov AL, 00
	mov [DI], AL
	;Abrir archivo de usuarios
	mov AH, 3dh
	mov AL, 02h
	mov DX, offset usuarios_archivo
	int 21h
	;error de apertura
	;jc ERROR_APERTURA
	mov handle_usuarios, AX
	;
	;Leer los Usuarios
LEER_USUARIO_DESBLOQUEO:
	;Guardar pointer actual del archivo de usuarios
	mov AH, 42h
	mov AL, 01h
	mov BX, handle_usuarios
	mov CX, 0000h
	mov DX, 0000h
	int 21h
	mov offset_desbloque_usuario, AX
	;leer usuario
	mov AH, 3fh
	mov BX, handle_usuarios
	mov CX, 2fh ;;se lee toda la estructura
	mov DX, offset usuario_leido_aux
	int 21h
	;;error de lectura
	;jc ERROR_LECTURA
	cmp AX, 00h
	je FINAL_LEER_USUARIO_DESBLOQUEO
	mov CX, 0014h
	mov SI, offset usuario_leido_aux
	mov DI, offset [buffer_desbloqueo_usuario + 2]
LOOP_COMPARAR_USUARIO_DESBLOQUEO:
	mov AL, [SI]
	cmp AL, [DI]
	jne LEER_USUARIO_DESBLOQUEO
	inc SI
	inc DI
	loop LOOP_COMPARAR_USUARIO_DESBLOQUEO
	;;si llega aqui es porque el usuario coincide
	;Mover a offset Guardado del usuario que coincide
	add offset_desbloque_usuario, 002Eh
	mov AH, 42h
	mov AL, 00h
	mov BX, handle_usuarios
	mov CX, 0000h
	mov DX, offset_desbloque_usuario
	int 21h
	;
	;Escribir en el archivo
	mov BX, handle_usuarios
	mov CX, 0001h
	mov DX, offset codigo_no_bloqueado
	mov AH, 40h
	int 21h
	;
	;Cerrar archivo
	mov BX, handle_usuarios
	mov AH, 3eh
	int 21h
	;Poner cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 18h ;fila
	mov DL, 00h	;columna
	int 10h
	;Imprimir cadena de usuario bloqueado
	mov DX, offset cadena_usuario_desbloqueado
	mov AH, 09h
	int 21h
	;Esperar a presionar una tecla
	mov AH, 01h
	int 21h
	;
	jmp FINAL_DESBLOQUEO_USUARIO
FINAL_LEER_USUARIO_DESBLOQUEO:
	;Cerrar archivo
	mov BX, handle_usuarios
	mov AH, 3eh
	int 21h
	;Poner cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 18h ;fila
	mov DL, 00h	;columna
	int 10h
	;Imprimir cadena de usuario bloqueado
	mov DX, offset cadena_error_no_existe_usuario
	mov AH, 09h
	int 21h
	;Esperar a presionar una tecla
	mov AH, 01h
	int 21h
	;
FINAL_DESBLOQUEO_USUARIO:
	jmp MENU

;;--------------------------------------------FIN DESBLOQUEAR USUARIO----------------------------------------------

;;--------------------------------------------REPORTE DEL SISTEMA----------------------------------------------

REPORTE_DEL_SISTEMA:
	;Limpiar Pantalla
	call limpiar_pantalla
	;Guardar Fecha y hora actual
	mov AH, 2ah
	int 21h
	mov dia_generacion, DL
	mov mes_generacion, DH
	mov anho_generacion, CX
	;
	mov AH, 2ch
	int 21h
	mov hora_generacion, CH
	mov minutos_generacion, CL
	mov segundos_generacion, DH
	;Convertir fecha y hora de generacion a cadena
	mov AH, 00h
	mov AL, dia_generacion
	mov DI, offset dia_cadena_generacion
	mov CX, 02h
	call numAstr
	mov AH, 00h
	mov AL, mes_generacion
	mov DI, offset mes_cadena_generacion
	mov CX, 02h
	call numAstr
	mov AX, anho_generacion
	mov DI, offset anho_cadena_generacion
	mov CX, 04h
	call numAstr
	mov AH, 00h
	mov AL, hora_generacion
	mov DI, offset hora_cadena_generacion
	mov CX, 02h
	call numAstr
	mov AH, 00h
	mov AL, minutos_generacion
	mov DI, offset minutos_cadena_generacion
	mov CX, 02h
	call numAstr
	mov AH, 00h
	mov AL, segundos_generacion
	mov DI, offset segundos_cadena_generacion
	mov CX, 02h
	call numAstr
	;Convertir a fecha y hora de ingreso al Sistema a cadena
	mov AX, dia_numero
	mov DI, offset dia_cadena_ingreso
	mov CX, 02h
	call numAstr
	mov AX, mes_numero
	mov DI, offset mes_cadena_ingreso
	mov CX, 02h
	call numAstr
	mov AX, ahno_numero
	mov DI, offset anho_cadena_ingreso
	mov CX, 04h
	call numAstr
	mov AX, hora_numero
	mov DI, offset hora_cadena_ingreso
	mov CX, 02h
	call numAstr
	mov AX, minutos_numero
	mov DI, offset minutos_cadena_ingreso
	mov CX, 02h
	call numAstr
	mov AX, segundos_numero
	mov DI, offset segundos_cadena_ingreso
	mov CX, 02h
	call numAstr
	;
	;Limpiar nombre_usuario
	mov CX, 14h
	mov DI, offset nombre_usuario
LIMPIAR_NOMBRE_USUARIO:
	mov AL, 00h
	mov [DI], AL
	inc DI
	loop LIMPIAR_NOMBRE_USUARIO
	;Compiar nombre de Usuario
	mov SI, offset buffer_entrada_usuario+1
	mov CH, 00h
	mov CL, [SI]
	mov SI, offset buffer_entrada_usuario+2
	mov DI, offset nombre_usuario
COPIAR_NOMBRE_USUARIO:
	mov AL, [SI]
	mov [DI], AL
	inc SI
	inc DI
	loop COPIAR_NOMBRE_USUARIO
	;Crear archivo SYS.HTML
	mov CX, 0000
	mov DX, offset nombre_reporte_html
	mov AH, 3ch
	int 21h
	mov handle_reporte_html, AX
	;escribir encabezado del html en archivo
	mov BX, handle_reporte_html
	mov CX, 02B6h ;Cantida de bytes a escribir
	mov DX, offset reporte_html
	mov AH, 40h
	int 21h
	;;;;;;


;;Inicio Tabla de Usuario Activos-----------------------------
	;Titulo de la Tabla	
	mov BX, handle_reporte_html
	mov CX, 0018h
	mov DX, offset titulo_tabla_usuarios_activos
	mov AH, 40h
	int 21h
	;Inicio Tabla de usuarios Activos
	mov BX, handle_reporte_html
	mov CX, 0061h
	mov DX, offset inicio_tabla_usuarios
	mov AH, 40h
	int 21h

	;Abrir Archivo de Usuarios
	mov AH, 3dh
	mov AL, 00h
	mov DX, offset usuarios_archivo
	int 21h
	;error de apertura
	;jc ERROR_APERTURA
	mov handle_usuarios, AX

	;Leer los Usuarios
LEER_USUARIO_TABLA:
	;leer usuario
	mov AH, 3fh
	mov BX, handle_usuarios
	mov CX, 2fh ;;se lee toda la estructura
	mov DX, offset usuario_leido_aux
	int 21h
	;Si leyo 0 bytes termina el ciclo
	cmp AX, 00h
	je FIN_LEER_USUARIOS_TABLA
	;Verifica si el usuario esta activo
	mov AL, estado_usuario_aux
	cmp AL, 01h
	je LEER_USUARIO_TABLA
	;Escribir en archivo de reporte de sistema abre_fila_tabla_usuarios
	mov BX, handle_reporte_html
	mov CX, 0009h
	mov DX, offset abre_fila_tabla_usuarios
	mov AH, 40h
	int 21h
	;Escribir en archivo de reporte de sistema usuario_leido_aux
	mov BX, handle_reporte_html
	mov CX, 0014h
	mov DX, offset usuario_leido_aux
	mov AH, 40h
	int 21h
	;Escribir en archivo de reporte de sistema cierra_columna_tabla_usuarios
	mov BX, handle_reporte_html
	mov CX, 000Ah
	mov DX, offset cierra_columna_tabla_usuarios
	mov AH, 40h
	int 21h
	;Escribir la password pero convertida en ******
	mov SI, offset password_usuario_aux
	mov CX, 0019h
LOOP_ESCRIBIR_PASSWORD:
	mov AL, 00h
	cmp [SI], AL
	je FIN_ESCRIBIR_PASSWORD
	;Escribir '*' en el archivo de reporte de sistema
	push CX
	;
	mov BX, handle_reporte_html
	mov CX, 0001h
	mov DX, offset asterisco
	mov AH, 40h
	int 21h
	inc SI
	;
	pop CX
	loop LOOP_ESCRIBIR_PASSWORD

FIN_ESCRIBIR_PASSWORD:
	;Escribir en archivo de reporte de sistema cierra_fila_tabla_usuarios
	mov BX, handle_reporte_html
	mov CX, 000Bh
	mov DX, offset cierra_fila_tabla_usuarios
	mov AH, 40h
	int 21h
	jmp LEER_USUARIO_TABLA

FIN_LEER_USUARIOS_TABLA:
	;cerrar archivo
	mov BX, handle_usuarios
	mov AH, 3eh
	int 21h

	;Fin Tabla de Usuarios Activos
	mov BX, handle_reporte_html
	mov CX, 0010h
	mov DX, offset fin_tabla_usuarios
	mov AH, 40h
	int 21h

;;FIN Tabla de Usuario Activos-----------------------------



;;Inicio Tabla de Usuario Inactivos-----------------------------
	;Titulo de la Tabla	
	mov BX, handle_reporte_html
	mov CX, 001Fh
	mov DX, offset titulo_tabla_usuarios_deshabilitados
	mov AH, 40h
	int 21h
	;Inicio Tabla de usuarios Activos
	mov BX, handle_reporte_html
	mov CX, 0061h
	mov DX, offset inicio_tabla_usuarios
	mov AH, 40h
	int 21h

	;Abrir Archivo de Usuarios
	mov AH, 3dh
	mov AL, 00h
	mov DX, offset usuarios_archivo
	int 21h
	;error de apertura
	;jc ERROR_APERTURA
	mov handle_usuarios, AX

	;Leer los Usuarios
LEER_USUARIO_TABLA_INACTIVOS:
	;leer usuario
	mov AH, 3fh
	mov BX, handle_usuarios
	mov CX, 2fh ;;se lee toda la estructura
	mov DX, offset usuario_leido_aux
	int 21h
	;Si leyo 0 bytes termina el ciclo
	cmp AX, 00h
	je FIN_LEER_USUARIOS_TABLA_INACTIVOS
	;Verifica si el usuario esta activo
	mov AL, estado_usuario_aux
	cmp AL, 00h
	je LEER_USUARIO_TABLA_INACTIVOS
	;Escribir en archivo de reporte de sistema abre_fila_tabla_usuarios
	mov BX, handle_reporte_html
	mov CX, 0009h
	mov DX, offset abre_fila_tabla_usuarios
	mov AH, 40h
	int 21h
	;Escribir en archivo de reporte de sistema usuario_leido_aux
	mov BX, handle_reporte_html
	mov CX, 0014h
	mov DX, offset usuario_leido_aux
	mov AH, 40h
	int 21h
	;Escribir en archivo de reporte de sistema cierra_columna_tabla_usuarios
	mov BX, handle_reporte_html
	mov CX, 000Ah
	mov DX, offset cierra_columna_tabla_usuarios
	mov AH, 40h
	int 21h
	;Escribir la password pero convertida en ******
	mov SI, offset password_usuario_aux
	mov CX, 0019h
LOOP_ESCRIBIR_PASSWORD_INACTIVOS:
	mov AL, 00h
	cmp [SI], AL
	je FIN_ESCRIBIR_PASSWORD_INACTIVOS
	;Escribir '*' en el archivo de reporte de sistema
	push CX
	;
	mov BX, handle_reporte_html
	mov CX, 0001h
	mov DX, offset asterisco
	mov AH, 40h
	int 21h
	inc SI
	;
	pop CX
	loop LOOP_ESCRIBIR_PASSWORD_INACTIVOS

FIN_ESCRIBIR_PASSWORD_INACTIVOS:
	;Escribir en archivo de reporte de sistema cierra_fila_tabla_usuarios
	mov BX, handle_reporte_html
	mov CX, 000Bh
	mov DX, offset cierra_fila_tabla_usuarios
	mov AH, 40h
	int 21h
	jmp LEER_USUARIO_TABLA_INACTIVOS

FIN_LEER_USUARIOS_TABLA_INACTIVOS:
	;cerrar archivo
	mov BX, handle_usuarios
	mov AH, 3eh
	int 21h

	;Fin Tabla de Usuarios Activos
	mov BX, handle_reporte_html
	mov CX, 0010h
	mov DX, offset fin_tabla_usuarios
	mov AH, 40h
	int 21h

;;FIN Tabla de Usuario Activos-----------------------------


;;Inicio Tabla Ultimas 15 Partidas-----------------------------

	;Escribir Titulo de tabla de Ultimas 15 Partidas
	mov BX, handle_reporte_html
	mov CX, 001Ch
	mov DX, offset titulo_tabla_partidas
	mov AH, 40h
	int 21h
	;Inicio Tabla de Ultimas 15 Partidas
	mov BX, handle_reporte_html
	mov CX, 0073h
	mov DX, offset inicio_tabla_puntaje
	mov AH, 40h
	int 21h
	;
	;Abrir Archivo de Puntaje
	mov AH, 3dh
	mov AL, 00h
	mov DX, offset nombre_archivo_puntajes
	int 21h
	;error de apertura
	;jc ERROR_APERTURA
	mov handle_puntajes, AX
	;Mover puntero hasta el final del archivo
	mov AH, 42h
	mov AL, 02h
	mov BX, handle_puntajes
	mov CX, 0000h
	mov DX, 0000h
	int 21h
	;offset en -> DX:Ax
	cmp AX, 0000h
	je FIN_LEER_PUNTAJES
	;
	;Leer los Puntajes
	mov offset_archivo, AX
LEER_PUNTAJES_TABLA:
	;Restar 28 offset_archivo
	sub offset_archivo, 001Dh
	;Mover puntero al nuevo offset
	mov AH, 42h
	mov AL, 00h
	mov BX, handle_puntajes
	mov CX, 0000h
	mov DX, offset_archivo
	int 21h
	;Leer Puntaje
	mov AH, 3fh
	mov BX, handle_puntajes
	mov CX, 001Dh ;;se lee toda la estructura
	mov DX, offset usuario_puntaje
	int 21h
	;Copiar usuario_puntaje a usuario_tabla_puntaje
	mov SI, offset usuario_puntaje
	mov DI, offset usuario_tabla_puntaje
	mov CX, 0014h
LOOP_COPIAR_USUARIO_PUNTAJE:
	mov AL, [SI]
	mov [DI], AL
	inc SI
	inc DI
	loop LOOP_COPIAR_USUARIO_PUNTAJE
	;Convertir a cadena el puntaje y guardarlo en puntuacion tabla
	mov AX, puntaje_usuario
	mov DI, offset puntuacion_tabla
	mov CX, 05h
	call numAstr
	;Convertir a cadena hora de la partida
	mov AX, hora_partida_puntaje
	mov DI, offset hora_tabla
	mov CX, 02h
	call numAstr
	;Convertir a cadena minutos de la partida
	mov AX, minuto_partida_puntaje
	mov DI, offset minuto_tabla
	mov CX, 02h
	call numAstr
	;Convertir a cadena segundos de la partida
	mov AX, segundo_partida_puntaje
	mov DI, offset segundo_tabla
	mov CX, 02h
	call numAstr
	;	
	;Escribir en el archivo de Reporte de Sistema fila_tabla_puntaje
	mov BX, handle_reporte_html
	mov CX, 004Ah
	mov DX, offset fila_tabla_puntaje
	mov AH, 40h
	int 21h
	;
	cmp offset_archivo, 0000h
	jne LEER_PUNTAJES_TABLA


FIN_LEER_PUNTAJES:
	;cerrar archivo puntajes
	mov BX, handle_puntajes
	mov AH, 3eh
	int 21h

	;Final Tabla Ultimas 15 Partidas
	mov BX, handle_reporte_html
	mov CX, 0010h
	mov DX, offset fin_tabla_puntaje
	mov AH, 40h
	int 21h


;;Final Tabla Ultimas 15 Partidas-----------------------------


;;Inicio Tabla Top 10 Puntajes-----------------------------
	;Escribir titutlo de tabla de Top 10 Puntajes
	mov BX, handle_reporte_html
	mov CX, 0018h
	mov DX, offset titulo_tabla_top
	mov AH, 40h
	int 21h
	;IR A ORDENAMIENTO
	mov parametro_puntaje, '1' ;;Ordenar por Puntaje
	mov orientacion_puntaje, '2' ;;Ordenar de Mayor a Menor
	mov bandera_solo_ordenamiento, 01h
	jmp SEGUIR_ORDENAMIENTO
REGREAR_REPORTE_SISTEMA:
	mov bandera_solo_ordenamiento, 00h
	;Inicio Tabla de Top 10 Puntajes
	mov BX, handle_reporte_html
	mov CX, 0073h
	mov DX, offset inicio_tabla_puntaje
	mov AH, 40h
	int 21h
	;
	cmp cantidad_puntajes_leidos, 00
	je TERMINA_TABLA_TOP
	;Crear HTML para cada usuario de la lista_puntajes
	mov offset_lista_puntajes, offset lista_puntajes
	mov CH, 00h
	mov CL, cantidad_puntajes_leidos
LOOP_CREAR_HTML_USUARIO:
	push CX
	;Copiar usuario de lista_puntajes a usuario_tabla_puntaje
	mov SI, offset_lista_puntajes
	mov DI, offset usuario_tabla_puntaje
	mov CX, 0014h	
COPIAR_USUARIO_TOP:
	mov AL, [SI]
	mov [DI], AL
	inc SI
	inc DI
	loop COPIAR_USUARIO_TOP
	;Convertir a cadena el puntaje y guardarlo en puntuacion tabla
	mov SI, offset_lista_puntajes
	mov AX, [SI+15h]
	mov DI, offset puntuacion_tabla
	mov CX, 05h
	call numAstr
	;Convertir a cadena hora de la partida
	mov SI, offset_lista_puntajes
	mov AX, [SI+17h]
	mov DI, offset hora_tabla
	mov CX, 02h
	call numAstr
	;Convertir a cadena minutos de la partida
	mov SI, offset_lista_puntajes
	mov AX, [SI+19h]
	mov DI, offset minuto_tabla
	mov CX, 02h
	call numAstr
	;Convertir a cadena segundos de la partida
	mov SI, offset_lista_puntajes
	mov AX, [SI+1Bh]
	mov DI, offset segundo_tabla
	mov CX, 02h
	call numAstr
	;Escribir en el archivo de Reporte de Sistema fila_tabla_puntaje
	mov BX, handle_reporte_html
	mov CX, 004Ah
	mov DX, offset fila_tabla_puntaje
	mov AH, 40h
	int 21h
	;Nuevo Offset
	add offset_lista_puntajes, 001Dh
	;
	pop CX
	dec CX
	cmp CX, 00h
	jne LOOP_CREAR_HTML_USUARIO
	;
TERMINA_TABLA_TOP:
	;
	;Fin Tabla de Top 10 Puntajes
	mov BX, handle_reporte_html
	mov CX, 0010h
	mov DX, offset fin_tabla_puntaje
	mov AH, 40h
	int 21h

;;Final Tabla Top 10 Puntajes-----------------------------

	;;;;;;
	;escribir el cierre del html en el archivo
	mov BX, handle_reporte_html
	mov CX, 000Eh
	mov DX, offset fin_html
	mov AH, 40h
	int 21h

	;cerrar archivo
	mov BX, handle_reporte_html
	mov AH, 3eh
	int 21h

	;Posicionar Cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 12h ;;fila
	mov DL, 00h ;;columna
	int 10h
	;Imprimir cadena_reporte_realizado
	mov DX, offset cadena_reporte_realizado
	mov AH, 09h
	int 21h
	;Esperar a presionar una tecla
	mov AH, 01h
	int 21h	
	jmp MENU
;;--------------------------------------------FIN REPORTE DEL SISTEMA----------------------------------------------

;;--------------------------------------------ORDENAMIENTO ----------------------------------------------

ORDENAMIENTO:
	;;Limpiar Pantalla
	call limpiar_pantalla
	;;Posicionar Cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 00h ;;fila
	mov DL, 00h ;;columna
	int 10h
	;;Imprimir cadena_titulo_ordenamiento
	mov DX, offset cadena_titulo_ordenamiento
	mov AH, 09h
	int 21h
	;;Posicionar Cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 02h ;;fila
	mov DL, 03h ;;columna
	int 10h
	;;Imprimir cadena_elegir_parametro
	mov DX, offset cadena_elegir_parametro
	mov AH, 09h
	int 21h
	;;Posicionar Cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 05h ;;fila
	mov DL, 03h ;;columna
	int 10h
	;Pedir opcion de parametro
	mov AH, 01h
	int 21h
	mov parametro_puntaje, AL
	;;Posicionar Cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 02h ;;fila
	mov DL, 03h ;;columna
	int 10h
	;;Imprimir cadena_elegir_orientacion
	mov DX, offset cadena_elegir_orientacion
	mov AH, 09h
	int 21h
	;;Posicionar Cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 05h ;;fila
	mov DL, 03h ;;columna
	int 10h
	;Pedir opcion de parametro
	mov AH, 01h
	int 21h
	mov orientacion_puntaje, AL

	;;Posicionar Cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 02h ;;fila
	mov DL, 03h ;;columna
	int 10h
	;;Imprimir cadena_elegir_velocidad
	mov DX, offset cadena_elegir_velocidad
	mov AH, 09h
	int 21h
	;;Posicionar Cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 05h ;;fila
	mov DL, 03h ;;columna
	int 10h
	;Pedir opcion de velocidad
	mov AH, 01h
	int 21h	
	mov velocidad_ordenamiento, AL

	cmp velocidad_ordenamiento, '1'
	je VELOCIDAD_LENTA
	cmp velocidad_ordenamiento, '2'
	je VELOCIDAD_MEDIA
	cmp velocidad_ordenamiento, '3'
	je VELOCIDAD_RAPIDA
VELOCIDAD_RAPIDA:	
	;Retardo para 0.3 segundos Rapida
	mov rr_delay, 07d0h
	mov hh_delay, 0a41h
	jmp SEGUIR_ORDENAMIENTO

VELOCIDAD_MEDIA:
	;Retardo para 0.8 segundos Media
	mov rr_delay, 07d0h
	mov hh_delay, 1b58h
	jmp SEGUIR_ORDENAMIENTO

VELOCIDAD_LENTA:
	;Retardo para 1.3 segundos Lenta
	mov rr_delay, 07d0h
	mov hh_delay, 02C6Fh

SEGUIR_ORDENAMIENTO:

	;;Abrir el archivo de Puntajes
	mov AH, 3dh
	mov AL, 00h ;Solo lectura
	mov DX, offset nombre_archivo_puntajes
	int 21h

	;error de apertura
	;jc ERROR_APERTURA

	mov handle_puntajes, AX

	;;Leer los Puntajes y guardarlos en lista_puntajes
	mov cantidad_puntajes_leidos, 00h
	mov offset_lista_puntajes, offset lista_puntajes
LEER_PUNTAJES:
	;;leer usuario
	mov AH, 3fh
	mov BX,	handle_puntajes
	mov CX, 1Dh ;;se lee toda la estructura
	mov DX, offset_lista_puntajes
	int 21h

	;;error de lectura
	;jc ERROR_LECTURA

	add offset_lista_puntajes, AX

	cmp AX, 00h
	je TERMINAR_LECTURA_PUNTAJES
	inc cantidad_puntajes_leidos
	jmp LEER_PUNTAJES
	
TERMINAR_LECTURA_PUNTAJES:
	;;cerrar archivo
	mov BX, handle_puntajes
	mov AH, 3eh
	int 21h
	;;
	cmp bandera_solo_ordenamiento, 01h
	je OMITIR_REPORTE
	;
	call IMPRIMIR_LISTA_PUNTAJES
	;;Esperar a que se presione una tecla para comenzar la simulacion
	;posicionar cursor
	mov AH, 0002h
	mov BH, 00h
	mov DH, 18h ;;fila
	mov DL, 00h ;;columna
	int 10h
	;Imprimir cadena_esperar_tecla
	mov DX, offset cadena_tecla_continuar
	mov AH, 09h
	int 21h
	;;esperar a presionar una tecla
	mov AH, 08h
	int 21h
	;
	;Leer fecha
	mov AH, 2Ah
	int 21h
	;Guardar Fecha
	mov dia_ordenamiento, DL
	mov mes_ordenamiento, DH
	mov anho_ordenamiento, CX
	;Leer hora
	mov AH, 2Ch
	int 21h
	;Guardar Hora
	mov hora_ordenamiento, CH
	mov minutos_ordenamiento, CL
	mov segundos_ordenamiento, DH
	;
OMITIR_REPORTE:
	;Comprobar que la cantidad de puntajes leidos sea mayor a 1
	cmp cantidad_puntajes_leidos, 01h
	jle FINAL_ORDENAMIENTO
;;ORDENAMIENTO DE REGISTROS
ORDENAMIENTO_PUNTAJES:
	mov CH, 00h
	mov CL, cantidad_puntajes_leidos
	dec CX
	mov offset_posicion_puntajes, offset lista_puntajes
	mov count_ordenados, 00h
	mov count_marcador, 02h
LOOP_ORDENAMIENTO:
	;Verificar Buffer para ver si se presiono una letra
	mov AH, 01h
	int 16h
	jz SEGUIR_LOOP_ORDENAMIENTO 
	;Leer tecla
	mov AH, 00h
	int 16h
	jmp FINAL_ORDENAMIENTO
SEGUIR_LOOP_ORDENAMIENTO:
	push CX
	;Imprimir lista de puntajes
	cmp bandera_solo_ordenamiento, 01h
	je OMITIR_IMPRIMIR_LISTA
	call IMPRIMIR_LISTA_PUNTAJES
	;;;Imprimir marcadores de los usuarios que se comparan
	;posicionar cursor
	mov AH, 0002h
	mov BH, 00h
	mov DH, count_marcador
	mov DL, 00h
	int 10h
	;Imprimir caracter '*'
	mov AH, 02h
	mov DL, '*'
	int 21h
	;posicionar cursor
	inc count_marcador
	mov AH, 0002h
	mov BH, 00h
	mov DH, count_marcador
	mov DL, 00h
	int 10h
	;Imprimir caracter '*'
	mov AH, 02h
	mov DL, '*'
	int 21h
	;Delay de velocidad de ordenamiento
	MOV SI, rr_delay
et_2:	
	DEC SI
	JZ et_3
	MOV DI, hh_delay
et_1:		
	DEC DI
	JNZ et_1
	JMP et_2
et_3:
	;
	;Comparar que parametro se eligio
	;
OMITIR_IMPRIMIR_LISTA:
	cmp parametro_puntaje, '1'
	je POR_PUNTAJE
	cmp parametro_puntaje, '2'
	je POR_TIEMPO
	;
POR_PUNTAJE:
	;Guardar en AX y BX los puntajes a comparar
	mov SI, offset_posicion_puntajes
	mov AH, [SI + 16h] ;puntaje 1
	mov AL, [SI + 15h]
	mov BH, [SI + 33h] ;puntaje 2
	mov BL, [SI + 32h]
	jmp ORIENTACION
POR_TIEMPO:
	;;Guardar en AX y BX los tiempos a comparar en segundos
	;Guardar Tiempo 1
	mov SI, offset_posicion_puntajes
	mov AH, [SI + 18h] ;hora 1
	mov AL, [SI + 17h]
	mov CX, 0E10h ;multiplicador de 3600
	mul CX ;Resultando en DX-AX
	mov tiempo1_puntaje, AX
	mov AH, [SI + 1Ah] ;minuto 1
	mov AL, [SI + 19h]
	mov CX, 3Ch ;multiplicador de 60
	mul CX ;Resultando en DX-AX
	add tiempo1_puntaje, AX
	mov AH, [SI + 1Ch] ;segundo 1
	mov AL, [SI + 1Bh]
	add tiempo1_puntaje, AX
	;Guardar Tiempo 2
	mov AH, [SI + 35h] ;hora 2
	mov AL, [SI + 34h]
	mov CX, 0E10h ;multiplicador de 3600
	mul CX ;Resultando en DX-AX
	mov tiempo2_puntaje, AX
	mov AH, [SI + 37h] ;minuto 2
	mov AL, [SI + 36h]
	mov CX, 3Ch ;multiplicador de 60
	mul CX ;Resultando en DX-AX
	add tiempo2_puntaje, AX
	mov AH, [SI + 39h] ;segundo 2
	mov AL, [SI + 38h]
	add tiempo2_puntaje, AX
	;Guardar en AX y BX los tiempos a comparar en segundos
	mov AX, tiempo1_puntaje
	mov BX, tiempo2_puntaje
	;
ORIENTACION:
	;Comparar que Orientacion se eligio
	cmp orientacion_puntaje, '1'
	je ASCENDENTE
	cmp orientacion_puntaje, '2'
	je DESCENDENTE
ASCENDENTE:
	;Comparacion ascendente
	cmp AX, BX
	jg INTERCAMBIO
	jmp FINAL_LOOP_ORDENAMIENTO
DESCENDENTE:
	;Comparacion descendente
	cmp BX, AX
	jg INTERCAMBIO
	jmp FINAL_LOOP_ORDENAMIENTO
INTERCAMBIO:
	mov CX, 001Dh
	mov DI, SI
LOOP_INTERCAMBIAR_USUARIOS:
	mov AH, [DI + 1Dh]
	mov AL, [DI]
	mov [DI + 1Dh], AL
	mov [DI], AH
	inc DI
	loop LOOP_INTERCAMBIAR_USUARIOS
	;Intercambiar los puntajes
	inc count_ordenados
FINAL_LOOP_ORDENAMIENTO:
	add offset_posicion_puntajes, 001Dh
	pop CX
	dec CX
	cmp CX, 00h
	jne LOOP_ORDENAMIENTO
	;
	cmp count_ordenados, 00h
	jne ORDENAMIENTO_PUNTAJES
FINAL_ORDENAMIENTO:
	cmp bandera_solo_ordenamiento, 01h
	je REGREAR_REPORTE_SISTEMA
	;;Imprimir mensaje de ordenamiento finalizado
	;Colocar cursos en la posicion 25,0
	mov AH, 02h
	mov BH, 00h
	mov DH, 18h ;;fila
	mov DL, 00h ;;columna
	int 10h
	;Imprimir mensaje
	mov DX, offset cadena_fin_ordenamiento
	mov AH, 09h
	int 21h
	;
	;;Crear Reporte de Ordenamiento
	;Crear archivo de reporte de ordenamiento
	mov AH, 3Ch
	mov CX, 0000h
	mov DX, offset nombre_archivo_ordenamiento
	int 21h
	;
	mov handle_ordenamiento, AX
	;Escribir datos_desarrolador en el archivo de ordenamiento
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 0043h
	mov DX, offset datos_desarrollador
	int 21h
	;Escribir por el parametro que se ordeno
	cmp parametro_puntaje, '1'
	je ESCRIBIR_POR_PUNTAJE
	cmp parametro_puntaje, '2'
	je ESCRIBIR_POR_TIEMPO
ESCRIBIR_POR_PUNTAJE:
	mov DX, offset cadena_ordenamiento_parametro_puntaje
	jmp ESCRIBIR_EL_PARAMETRO
ESCRIBIR_POR_TIEMPO:
	mov DX, offset cadena_ordenamiento_parametro_tiempo
ESCRIBIR_EL_PARAMETRO:
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 0016h
	int 21h
	;Escribir por la orientacion que se ordeno
	cmp orientacion_puntaje, '1'
	je ESCRIBIR_POR_ASCENDENTE
	cmp orientacion_puntaje, '2'
	je ESCRIBIR_POR_DESCENDENTE
ESCRIBIR_POR_ASCENDENTE:
	mov DX, offset cadena_ordenamiento_orientacion_ascendente
	jmp ESCRIBIR_LA_ORIENTACION
ESCRIBIR_POR_DESCENDENTE:
	mov DX, offset cadena_ordenamiento_orientacion_descendente
ESCRIBIR_LA_ORIENTACION:
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 001Fh
	int 21h
	;Escribir la fecha y hora de ordenamiento
	;Convertir en cadena fecha y hora
	mov AH, 00h
	mov AL, dia_ordenamiento
	mov DI, offset cadena_dia_ordenamiento
	mov CX, 0002h
	call numAstr
	mov AH, 00h
	mov AL, mes_ordenamiento
	mov DI, offset cadena_mes_ordenamiento
	mov CX, 0002h
	call numAstr
	mov AX, anho_ordenamiento
	mov DI, offset cadena_anho_ordenamiento
	mov CX, 0004h
	call numAstr
	mov AH, 00h
	mov AL, hora_ordenamiento
	mov DI, offset cadena_hora_ordenamiento
	mov CX, 0002h
	call numAstr
	mov AH, 00h
	mov AL, minutos_ordenamiento
	mov DI, offset cadena_minutos_ordenamiento
	mov CX, 0002h
	call numAstr
	mov AH, 00h
	mov AL, segundos_ordenamiento
	mov DI, offset cadena_segundos_ordenamiento
	mov CX, 0002h
	call numAstr
	;Escribir Fecha en el archivo de ordenamiento
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 0012h
	mov DX, offset cadena_fecha_ordenamiento
	int 21h
	;Escribir hora
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 000Fh
	mov DX, offset cadena_hor_ordenamiento
	int 21h
	;
	;Comparar segundos al inicio del ordenamiento y al final
	;Leer hora
	mov AH, 2Ch
	int 21h
	;Guardar Segundos
	mov segundos_actuales_ordenamiento, DH
	mov AL, segundos_ordenamiento
	cmp segundos_actuales_ordenamiento, AL
	jge CALCULAR_SEGUNDOS_ORDENAMIENTO
	;Sumar 60 segundos a segundos_actuales_ordenamiento
	add segundos_actuales_ordenamiento, 3Ch
	;Restar segundos_actuales_ordenamiento - segundos_ordenamiento
CALCULAR_SEGUNDOS_ORDENAMIENTO:
	sub segundos_actuales_ordenamiento, AL
	;mov segundos_ordenamiento, segundos_actuales_ordenamiento
	;Converti segundos a cadene en cadena_tiempo_ordenamiento
	mov AH, 00h
	mov AL, segundos_actuales_ordenamiento
	mov DI, offset cadena_tiempo_ordenamiento
	mov CX, 0002h
	call numAstr
	;Escribir tiempo_de_ordenamiento en el archivo de ordenamiento
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 002Eh
	mov DX, offset tiempo_de_ordenamiento
	int 21h
	;Guardar offset
	mov offset_escribir_file, offset lista_puntajes
	;Cargar Contador
	mov CH, 00
	mov CL, cantidad_puntajes_leidos
REPORTE_ORDENAMIENTO:
	push CX
	mov SI, offset_escribir_file
	mov CX, 0014h
LOOP_ESCRIBIR_USUARIO:
	mov AL, 00
	cmp [SI], AL
	je TERMINAR_ESCRITURA_USUARIO
	push CX
	;
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 0001h
	mov DX, SI
	int 21h
	;
	inc SI
	pop CX
	dec CX
	cmp CX, 00h
	jne LOOP_ESCRIBIR_USUARIO
TERMINAR_ESCRITURA_USUARIO:
	;Escribir Coma en el archivo de ordenamiento
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 0001h
	mov DX, offset coma
	int 21h
	;;Escribir puntaje en el archivo de ordenamiento
	mov SI, offset_escribir_file
	mov AH, [SI + 16h]
	mov AL, [SI + 15h]
	mov CX, 0005h
	mov DI, offset cadena_puntaje
	call numAstr
	;Escribir cadena_puntaje en el archivo
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 0005h	
	mov DX, offset cadena_puntaje
	int 21h
	;Escribir Coma en el archivo de ordenamiento
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 0001h
	mov DX, offset coma
	int 21h
	;;Escribir hora en el archivo de ordenamiento
	mov SI, offset_escribir_file
	mov AH, [SI + 18h]
	mov AL, [SI + 17h]
	mov CX, 0002h
	mov DI, offset cadena_hora_puntaje
	call numAstr
	;Escribir cadena_hora_puntaje en el archivo
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 0003h
	mov DX, offset cadena_hora_puntaje
	int 21h
	;Escribir minutos en el archivo de ordenamiento
	mov SI, offset_escribir_file
	mov AH, [SI + 1Ah]
	mov AL, [SI + 19h]
	mov CX, 0002h
	mov DI, offset cadena_minuto_puntaje
	call numAstr
	;Escribir cadena_minuto_puntaje en el archivo
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 0003h
	mov DX, offset cadena_minuto_puntaje
	int 21h
	;Escribir segundos en el archivo de ordenamiento
	mov SI, offset_escribir_file
	mov AH, [SI + 1Ch]
	mov AL, [SI + 1Bh]
	mov CX, 0002h
	mov DI, offset cadena_segundo_puntaje
	call numAstr
	;Escribir cadena_segundo_puntaje en el archivo
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 0002h
	mov DX, offset cadena_segundo_puntaje
	int 21h
	;Escribir Salto de Linea en el archivo de ordenamiento
	mov AH, 40h
	mov BX, handle_ordenamiento
	mov CX, 0002h
	mov DX, offset salto_linea
	int 21h
	;
	add offset_escribir_file, 001Dh
	pop CX
	dec CX
	cmp CX, 00h
	jne REPORTE_ORDENAMIENTO

	;cerrar archivo
	mov BX, handle_ordenamiento
	mov AH, 3eh
	int 21h
	;
	;Esperar a presionar una tecla
	mov AH, 01h
	int 21h
	;
	jmp MENU

;;--------------------------------------------FIN ORDENAMIENTO ----------------------------------------------

;;--------------------------------------------INICIO ULTIMAS PARTIDAS ----------------------------------------------

ULTIMAS_PARTIDAS:
	;;Limpiar Pantalla
	call limpiar_pantalla

	;Posicionar Cursos 0,0 e imprimir titulo de puntajes
	mov AH, 02h
	mov BH, 00h
	mov DH, 00h ;;fila
	mov DL, 00h	;;columna
	int 10h

	mov DX, offset cadena_titulo_ultimos_puntajes
	mov AH, 09h
	int 21h

	;;Poner $ en la posicion 21 del buffer_entrada_usuario
	mov BX, offset buffer_entrada_usuario + 16
	;;
	mov AL, "$"
	mov [BX], AL

	;;Abrir el archivo de Puntajes
	mov AH, 3dh
	mov AL, 00h ;Solo lectura
	mov DX, offset nombre_archivo_puntajes
	int 21h
	;error de apertura
	;jc ERROR_APERTURA

	mov handle_puntajes, AX

	;;Leer los Puntajes
;;Leer los Usuario y verificar que no exista
LEER_USUARIO_PUNTAJE:
	;;leer usuario
	mov AH, 3fh
	mov BX,	handle_puntajes
	mov CX, 1Dh ;;se lee toda la estructura
	mov DX, offset usuario_puntaje
	int 21h
	;;error de lectura
	;jc ERROR_LECTURA
	cmp AX, 00h
	je TERMINAR_LECTURA
	mov CX, 0014h
	mov SI, offset usuario_puntaje
	mov DI, offset [buffer_entrada_usuario + 2]
LOOP_COMPARAR_USUARIO_PUNTAJE:
	mov AL, [SI]
	cmp AL, [DI]
	jne LEER_USUARIO_PUNTAJE
	inc SI
	inc DI
	loop LOOP_COMPARAR_USUARIO_PUNTAJE
	;;si llega aqui es porque se encontro el usuario
	;;se imprime el usuario
	mov DX, offset usuario_puntaje
	mov AH, 09h
	int 21h
	;convertir puntaje_usuario en cadena y guardar el cadena_puntaje
	mov AX, puntaje_usuario
	mov DI, offset cadena_puntaje
	mov CX, 0005h
	call numAstr
	;convertir tiempo a cadena
	mov AX, hora_partida_puntaje
	mov DI, offset cadena_hora_puntaje
	mov CX, 0002h
	call numAstr
	mov AX, minuto_partida_puntaje
	mov DI, offset cadena_minuto_puntaje
	mov CX, 0002h
	call numAstr
	mov AX, segundo_partida_puntaje
	mov DI, offset cadena_segundo_puntaje
	mov CX, 0002h
	call numAstr
	;imprimir cadena_puntaje
	mov DX, offset puntos_y_tiempo
	mov AH, 09h
	int 21h
	;;imprimir caracter de salto de linea
	mov DL, 0ah
	mov AH, 02h
	int 21h
	jmp LEER_USUARIO_PUNTAJE

TERMINAR_LECTURA:
	;;cerrar archivo
	mov BX, handle_puntajes
	mov AH, 3eh
	int 21h

	;;esperar a presionar una tecla
	mov AH, 01h
	int 21h

	;;Quitar $ en la posicion 21 del buffer_entrada_usuario
	mov BX, offset buffer_entrada_usuario + 16
	;;
	mov AL, 00
	mov [BX], AL

	jmp MENU


;;--------------------------------------------FIN ULTIMAS PARTIDAS ----------------------------------------------

;;-----------------------------------------INICIO TABLERO-----------------------------------------
CONFIG_JUEGO:
	;;reiniciar variables juego
	mov vidas, 03h
	mov punteo_actual, 0000h
	mov conthora, 00h
	mov contminuto, 00h
	mov contsegundo, 00h
	mov semilla_random, 01h

	;;Guardar Centencimas Base
	mov AH, 2ch
	int 21
	;DL -> centecimas
	mov tiempo_base_velocidad_lenta, DL
	mov tiempo_base_velocidad_media, DL
	mov tiempo_base_velocidad_rapida, DL

	;Agrgar A mapa tablero Base del juego
	call TABLERO_BASE

	;Posicionar Vehiculos en el mapa
	call POSICIONAR_VEHICULOS	

	;Posicion Inicial Jugador
	mov fila_jugador, 17h
	mov columna_jugador, 13h

JUEGO:
	;;se limpia la pantalla
	call limpiar_pantalla

	;;imprimir usuario
	call imprimir_usuario_footer

	;;imprimir fecha
	call imprimir_fechahora_footer

CICLO_JUEGO:
	;;se imprime el jugador 
	call MOVER_JUGADOR

	;Pinta la Pantalla
	call pintar_mapa

	;;Verificar vidas -> Game Over
	cmp vidas, 00h
	je GAME_OVER

	;;Actualizar Movimientos Vehiculos
	;;col 0 o 27
	;;random de la fila 2 a 16
	call MOVER_VEHICULOS

	;;Actualizar Contadores del Cronometro
	call ACTUALIZAR_CRONOMETRO

	;;Actualizar Cronometros
	call imprimir_tiempo

	;;Verificar Colicion
		;;Si Pierde Las 3 Vidas se Termina el Juego

	;;Actualizar Vidas
	call imprimir_vidas

	;;Verificar Suma Punteo

	;;Actualizar Punteo
	call imprimir_cadena_punteo

	;;Verificar si se presiono tecla
		;;Actualizar Movimiento
		;;Menu Pausa
	call DETECTAR_TECLA

	jmp CICLO_JUEGO
;
GAME_OVER:
	call limpiar_pantalla
	call ALMACENAR_PUNTAJE
	call imprimir_gameover
	jmp MENU
    ;jmp FINAL_PROGRAMA

;; ==============================================  SUBRUTINAS  ==============================================
;;imprimir lista_puntajes
IMPRIMIR_LISTA_PUNTAJES:
	;;Limpiar Pantalla
	call limpiar_pantalla
	;;Posicionar Cursos 0,0 e imprimir titulo de Ordenamiento
	mov AH, 02h
	mov BH, 00h
	mov DH, 00h ;;fila
	mov DL, 00h	;;columna
	int 10h
	;
	mov DX, offset cadena_titulo_ordenamiento
	mov AH, 09h
	int 21h
	;
	cmp cantidad_puntajes_leidos, 14h
	jg MAX_20
	mov CH, 00h
	mov CL, cantidad_puntajes_leidos
	jmp SIGUE_IMPRIMIR_PUNTAJES
MAX_20:
	mov CH, 00h
	mov CL, 14h
SIGUE_IMPRIMIR_PUNTAJES:
	mov offset_impresion_puntajes, offset lista_puntajes
	mov count_filas_puntajes, 02h
IMPRIMIR_PUNTAJES:
	push CX
	;Posicionar cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, count_filas_puntajes ;;fila
	mov DL, 01h ;;columna
	int 10h
	;;Imprimir Usuario
	mov DX, offset_impresion_puntajes
	mov AH, 09h
	int 21h
	;;Imprimir Puntaje
	add offset_impresion_puntajes, 0015h
	mov SI, offset_impresion_puntajes
	mov AH, [SI+1]
	mov AL, [SI]
	mov DI, offset cadena_puntaje
	mov CX, 0005h
	call numAstr
	add offset_impresion_puntajes, 0002h
	mov SI, offset_impresion_puntajes
	mov AH, [SI+1]
	mov AL, [SI]
	mov DI, offset cadena_hora_puntaje
	mov CX, 0002h
	call numAstr
	add offset_impresion_puntajes, 0002h
	mov SI, offset_impresion_puntajes
	mov AH, [SI+1]
	mov AL, [SI]
	mov DI, offset cadena_minuto_puntaje
	mov CX, 0002h
	call numAstr
	add offset_impresion_puntajes, 0002h
	mov SI, offset_impresion_puntajes
	mov AH, [SI+1]
	mov AL, [SI]
	mov DI, offset cadena_segundo_puntaje
	mov CX, 0002h
	call numAstr
	add offset_impresion_puntajes, 0002h
	;;Imprimir Tiempo
	mov DX, offset puntos_y_tiempo
	mov AH, 09h
	int 21h
	;;Imprimir Salto de Linea
	;mov DL, 0ah
	;mov AH, 02h
	;int 21h
	;
	inc count_filas_puntajes
	pop CX
	dec CX
	cmp CX, 00h
	jne IMPRIMIR_PUNTAJES
	ret

ALMACENAR_PUNTAJE:
	;Abrir el archivo de Puntajes
	mov AH, 3dh
	mov AL, 02h ;Solo Escribir
	mov DX, offset nombre_archivo_puntajes
	int 21h
	;error de apertura
	;jc ERROR_APERTURA
	mov handle_puntajes, AX

	;Mover el puntero al final del archivo
	mov AL, 02h
	mov AH, 42h
	mov BX, handle_puntajes
	mov CX, 0000h
	mov DX, 0000h
	int 21h

	;jc ERROR_APERTURA

	;;Quitar $ justo al final del nombre del usuario
	mov BX, offset buffer_entrada_usuario
	mov CL, [BX + 1]
	mov CH, 00
	;;
	add BX, 02h
	;;
	add BX, CX
	;;
	mov AL, 00
	mov [BX], AL

	;;Poner $ en la posicion 21 del buffer_entrada_usuario
	mov BX, offset buffer_entrada_usuario + 16
	;;
	mov AL, "$"
	mov [BX], AL

	;Escribir en el archivo el nuevo puntaje
	;Escribir Usuario desde buffer_entrada_usuario
	mov AH, 40h
	mov BX, handle_puntajes
	mov CX, 15h
	mov DX, offset buffer_entrada_usuario + 2
	int 21h

	;Escribir Punteo desde punteo_actual
	mov AH, 40h
	mov BX, handle_puntajes
	mov CX, 02h
	mov DX, offset [punteo_actual]
	int 21h

	;Escribir Tiempo desde conthora contminuto y contsegundo
	mov AH, 40h
	mov BX, handle_puntajes
	mov CX, 06h
	mov DX, offset [conthora]
	int 21h

	;Cerrar el archivo
	mov BX, handle_puntajes
	mov AH, 3eh
	int 21h

	;;Quitar $ en la posicion 21 del buffer_entrada_usuario
	mov BX, offset buffer_entrada_usuario + 16
	;;
	mov AL, 00
	mov [BX], AL

	ret

ACTUALIZAR_FECHA_HORA:
	;;Se obtiene la fecha 
	mov AH, 2ah
	int 21h
	;;dia
	mov BH, 00
	mov BL, DL
	mov dia_numero, BX
	;;mes
	mov BH, 00
	mov BL, DH
	mov mes_numero, BX
	;;año
	mov ahno_numero, CX

	;;Se obtiene la hora
	mov AH, 2ch
	int 21h

	;;hora
	mov BH, 00
	mov BL, CH
	mov hora_numero, BX
	;;minutos
	mov BH, 00
	mov BL, CL
	mov minutos_numero, BX
	;;segundos
	mov BH, 00
	mov BL, DH
	mov segundos_numero, BX
	;
	ret


;; Actualizar Cronometro
ACTUALIZAR_CRONOMETRO:
	;;Se obtiene la hora
	mov AH, 2ch
	int 21h

	;;segundos
	mov DL, DH
	mov DH, 00h
	cmp segundo_ant, DX
	je FINAL_CRONOMETRO
	mov segundo_ant, DX
	;;Funcion Incrementar Tiempo
	call INCREMENTAR_CRONOMETRO
FINAL_CRONOMETRO:
	ret


;; Delay Sin Parar El Programa
;; Entrada : DL -> Tiempo Base
;			 DH -> Tiempo de Espera
;			 DI -> direccion del tiempo base
;; Salida : bandera_tiempo = 0 -> no Paso Tiempo de Espera(DH) | 1 -> Paso Tiempo de Espera(DH)
DELAY:
	push DX
	mov AH, 2ch
	int 21h
	mov tiempo_actual, DL
	mov CL, DL ;;Copia Tiempo Actual
	pop DX
	cmp tiempo_actual, DL
	jae RESTA
	add tiempo_actual, 64
RESTA:
	sub tiempo_actual, DL
	cmp tiempo_actual, DH
	jae SI_PASO
	mov bandera_tiempo, 00h
	mov [DI], DL
	jmp FINAL_DELAY
SI_PASO:
	mov bandera_tiempo, 01h
	mov [DI], CL
FINAL_DELAY:
	ret

;; ---------------------------------------------- MOVER JUGADOR ----------------------------------------------
;; 
MOVER_JUGADOR:
	;;Colocar en mapa
	;;Entrada: AL -> columna
	;;         AH -> fila
	;;         BL -> valor a colocar
	mov AL, columna_jugador
	mov AH, fila_jugador

	cmp fila_jugador, 01h
	je SUMAR_PUNTEO
	cmp fila_jugador, 17h
	je REEMPLAZAR_ACERA_JUGADOR
	mov BL, JUGADOR_CARRIL
	call COLOCAR_EN_MAPA
	jmp retorno_mover_jugador
SUMAR_PUNTEO:
	cmp vidas, 03h
	je SUMAR_PUNTEO_3
	cmp vidas, 02h
	je SUMAR_PUNTEO_2
	cmp vidas, 01h
	je SUMAR_PUNTEO_1
SUMAR_PUNTEO_3:
	add punteo_actual, 0064h ;Sumar 100
	jmp SEGUIR_SUMA_PUNTEO
SUMAR_PUNTEO_2:
	add punteo_actual, 0032h ;Sumar 50
	jmp SEGUIR_SUMA_PUNTEO
SUMAR_PUNTEO_1:
	add punteo_actual, 0019h ;Sumar 25
SEGUIR_SUMA_PUNTEO:
	mov fila_jugador, 17h
	mov columna_jugador, 13h
	mov AL, columna_jugador
	mov AH, fila_jugador
	mov BL, JUGADOR_ACERA
	call COLOCAR_EN_MAPA
	jmp retorno_mover_jugador 
REEMPLAZAR_ACERA_JUGADOR:
	mov BL, JUGADOR_ACERA
	call COLOCAR_EN_MAPA
retorno_mover_jugador:
	ret
;; ---------------------------------------------- FIN MOVER JUGADOR ----------------------------------------------
;; ----------------------------------------------- DETECTAR TECLA ------------------------------------------------------
DETECTAR_TECLA:
	mov AH, 01h 
	int 16h
	jz FIN_DETECTAR_TECLA
	;;se coloca en mapa la acera o carril dependiendo la fila del jugador
	mov AL, columna_jugador
	mov AH, fila_jugador
	cmp fila_jugador, 01h
	je PINTAR_ACERA_JUGADOR
	cmp fila_jugador, 17h
	je PINTAR_ACERA_JUGADOR
	mov BL, CARRIL
	call COLOCAR_EN_MAPA
	jmp SIG
PINTAR_ACERA_JUGADOR:
	mov BL, ACERA
	call COLOCAR_EN_MAPA
SIG:
	mov AH, 00h
	int 16h
	;;AH ->  scan code
	;; flecha arriba -> 48h
	;; flecha abajo -> 50h
	;; flecha derecha -> 4dh
	;; flecha izquierda -> 4bh
	cmp AH, 48h
	je MOVER_ARRIBA	
	cmp AH, 50h
	je MOVER_ABAJO
	cmp AH, 4dh
	je MOVER_DERECHA
	cmp AH, 4bh
	je MOVER_IZQUIERDA
	cmp AH, 01h
	je PAUSA_JUEGO
	jmp FIN_DETECTAR_TECLA
MOVER_ARRIBA:
	cmp fila_jugador, 02h
	jb FIN_DETECTAR_TECLA
	dec fila_jugador
	mov AL, columna_jugador
	mov AH, fila_jugador
	call OBTENER_DE_MAPA
	cmp BL, 04h
	je SIGUE_NORMAL_ARRIBA
	cmp BL, 03h
	je SIGUE_NORMAL_ARRIBA
	jmp PERDER_CHOQUE
SIGUE_NORMAL_ARRIBA:
	jmp FIN_DETECTAR_TECLA
MOVER_ABAJO:
	cmp fila_jugador, 16h
	ja FIN_DETECTAR_TECLA
	inc fila_jugador
	mov AL, columna_jugador
	mov AH, fila_jugador
	call OBTENER_DE_MAPA
	cmp BL, 04h
	je SIGUE_NORMAL_ABAJO
	cmp BL, 03h
	je SIGUE_NORMAL_ABAJO
	jmp PERDER_CHOQUE
SIGUE_NORMAL_ABAJO:
	jmp FIN_DETECTAR_TECLA
MOVER_DERECHA:
	cmp columna_jugador, 26h
	ja FIN_DETECTAR_TECLA
	inc columna_jugador
	mov AL, columna_jugador
	mov AH, fila_jugador
	call OBTENER_DE_MAPA
	cmp BL, 04h
	je SIGUE_NORMAL_DERECHA
	cmp BL, 03h
	je SIGUE_NORMAL_DERECHA
	jmp PERDER_CHOQUE
SIGUE_NORMAL_DERECHA:
	jmp FIN_DETECTAR_TECLA
MOVER_IZQUIERDA:
	cmp columna_jugador, 01h
	jb FIN_DETECTAR_TECLA
	dec columna_jugador
	mov AL, columna_jugador
	mov AH, fila_jugador
	call OBTENER_DE_MAPA
	cmp BL, 04h
	je SIGUE_NORMAL_IZQUIERDA
	cmp BL, 03h
	je SIGUE_NORMAL_IZQUIERDA
	jmp PERDER_CHOQUE
SIGUE_NORMAL_IZQUIERDA:
	jmp FIN_DETECTAR_TECLA
PAUSA_JUEGO:
	call limpiar_pantalla
ciclo_pausa:
	;;posicionar cursor
	mov AH, 02h
	mov BH, 00h
	mov DH, 01h
	mov DL, 00h
	int 10h
	;;imprimir cadena_menu_pause
	mov DX, offset cadena_menu_pause
	mov AH, 09h
	int 21h

	;;se lee la tecla presionada
	mov AH, 00h
	int 16h

	;;se compara la tecla presionada
	cmp AH, 3bh ;Continuar
	je JUEGO 
	cmp AH, 3ch ;Menu
	je MENU
	jmp ciclo_pausa
PERDER_CHOQUE:
	dec vidas
	mov fila_jugador, 17h
	mov columna_jugador, 13h
FIN_DETECTAR_TECLA:
	ret



;;----------------------------------------------- MOVER VEHICULOS -----------------------------------------------
;; cada fila tiene -> 27h columnas
;; max 16h columnas  
MOVER_VEHICULOS:
	mov fila_mapa, 02h
	mov columna_mapa, 00h
ciclo_fila_mov_vehiculos:
	;;se verifica el final de las filas
	cmp fila_mapa, 16h
	ja retorno_mov_vehiculos

ciclo_col_mov_vehiculos:
	cmp columna_mapa, 27h
	ja siguiente_fila_mov_vehiculos
	;; se utiliza obtener mapa y se verifica el objeto
	;; obtener_de_mapa -
	;; ENTRADA:
	;;  AL -> x del elemento columna
	;;  AH -> y del elemento fila
	;; SALIDA:
	;;  BL -> código del elemento
	mov AL, columna_mapa
	mov AH, fila_mapa
	push AX
	call OBTENER_DE_MAPA
	pop AX
	;;BL ESTA EL numero del OBJETO
	;;se verifica si es un vehiculo que se mueve a la derecha
	;; 05, 06
	cmp BL, 05
	je MOV_DERECHA_OBJ
	cmp BL, 06
	je MOV_DERECHA_OBJ
	;;se verifica si es un vehiculo que se mueve a la izquierda
	;; 07, 08
	cmp BL, 07
	je MOV_IZQUIERDA_OBJ
	cmp BL, 08
	je MOV_IZQUIERDA_OBJ
	;;se verifica si es un camion que se mueve a la derecha
	;; 09
	cmp BL, 09
	je MOV_DERECHA_CAMION
	jmp CONTINUE_COL_MOV_VEHICULOS

MOV_DERECHA_OBJ:
	push AX
	push CX
	push DX
	push DI
	;
	mov DL, tiempo_base_velocidad_media
	mov DH, 1Eh
	mov DI, offset tiempo_base_velocidad_media_aux
	call DELAY
	;
	pop DI
	pop DX
	pop CX
	pop AX
	cmp bandera_tiempo, 00h
	je siguiente_fila_mov_vehiculos
	call MOVER_DERECHA_OBJETO
	;call MOVER_DERECHA_OBJETO
	jmp siguiente_fila_mov_vehiculos
MOV_IZQUIERDA_OBJ:
	push AX
	push CX
	push DX
	push DI
	;
	mov DL, tiempo_base_velocidad_rapida
	mov DH, 0ah
	mov DI, offset tiempo_base_velocidad_rapida_aux
	call DELAY
	;
	pop DI
	pop DX
	pop CX
	pop AX
	cmp bandera_tiempo, 00h
	je siguiente_fila_mov_vehiculos
	call MOVER_IZQUIERDA_OBJETO
	jmp siguiente_fila_mov_vehiculos
MOV_DERECHA_CAMION:
	push AX
	push CX
	push DX
	push DI
	;
	mov DL, tiempo_base_velocidad_lenta
	mov DH, 5Ah
	mov DI, offset tiempo_base_velocidad_lenta_aux
	call DELAY
	;
	pop DI
	pop DX
	pop CX
	pop AX
	cmp bandera_tiempo, 00h
	je siguiente_fila_mov_vehiculos
	call MOVER_DERECHA_CAMION
	jmp siguiente_fila_mov_vehiculos
CONTINUE_COL_MOV_VEHICULOS:
	inc columna_mapa
	jmp ciclo_col_mov_vehiculos

siguiente_fila_mov_vehiculos:
	inc fila_mapa
	mov columna_mapa, 00h
	jmp ciclo_fila_mov_vehiculos

retorno_mov_vehiculos:
	push AX
	mov AL, tiempo_base_velocidad_lenta_aux
	mov tiempo_base_velocidad_lenta, AL
	mov AL, tiempo_base_velocidad_media_aux
	mov tiempo_base_velocidad_media, AL
	mov AL, tiempo_base_velocidad_rapida_aux
	mov tiempo_base_velocidad_rapida, AL
	pop AX
	ret

;;----------------------------------------------MOVER DERECHA OBJETO----------------------------------------------
;;entrada: AL -> columna
;;         AH -> fila
;;         BL -> objeto
MOVER_DERECHA_OBJETO:
	;;se dibuja carril en la posicion actual
	mov BH, 00
	push BX
	push AX
	mov BL, CARRIL
	call COLOCAR_EN_MAPA
	pop AX
	pop BX
	;;incremento una columna
	inc AL

	cmp AL, 27h
	jbe INSERTAR_OBJETO_DERECHA
	mov AL, 00h
INSERTAR_OBJETO_DERECHA:
	push BX
	push AX
	call OBTENER_DE_MAPA
	mov CL, BL
	;;verificar si es 
	pop AX
	pop BX
	cmp CL, 01h
	jne NOQUITAR_VIDA
	dec vidas
	mov fila_jugador, 17h
	mov columna_jugador, 13h
NOQUITAR_VIDA:
	;;COLOCAMOS en mapa
	push BX
	push AX
	call COLOCAR_EN_MAPA
	pop AX
	pop BX
	ret

;;----------------------------------------------MOVER DERECHA CAMION----------------------------------------------
;;entrada: AL -> columna
;;         AH -> fila
;;         BL -> objeto
;; == 09| 10
MOVER_DERECHA_CAMION:
	;; se dibuja carril en la posicion actual
	mov BH, 00
	push BX
	push AX ;;posicion camion inicio
	mov BL, CARRIL
	call COLOCAR_EN_MAPA
	pop AX ;;posicion camion inicio
	pop BX
	;;incremento una columna
	inc AL 	
	cmp AL, 27h
	jb INSERTAR_TODO_CAMION
	je INSERTAR_SOLO_INICIO_CAMION
	mov AL, 00h
	jmp INSERTAR_TODO_CAMION

INSERTAR_SOLO_INICIO_CAMION:
	mov BL, CAMIONINI
	call COLOCAR_EN_MAPA
	jmp RETORNO_MOV_CAMION
INSERTAR_TODO_CAMION:
	push BX
	push AX
	mov BL, CAMIONINI
	call COLOCAR_EN_MAPA
	pop AX
	pop BX
	inc AL
	push BX
	push AX
	call OBTENER_DE_MAPA
	mov CL, BL
	pop AX
	pop BX
	cmp CL, 01h
	jne NOQUITAR_VIDACAMION
	dec vidas
	mov fila_jugador, 17h
	mov columna_jugador, 13h
NOQUITAR_VIDACAMION:
	mov BL, CAMIONFIN
	call COLOCAR_EN_MAPA
RETORNO_MOV_CAMION:
	ret


;;----------------------------------------------FIN MOVER DERECHA OBJETO----------------------------------------------
;; ---------------------------------------------- MOVER IZQUIERDA OBJETO ----------------------------------------------
;;entrada: AL -> columna
;;         AH -> fila
;;         BL -> objeto
MOVER_IZQUIERDA_OBJETO:
	;;se dibuja carril en la posicion actual
	mov BH, 00
	push BX
	push AX
	mov BL, CARRIL
	call COLOCAR_EN_MAPA
	pop AX
	pop BX
	;;incremento una columna
	cmp AL, 00h
	je MOVER2
	dec AL
	jmp INSERTAR_OBJETO_IZQUIERDA
MOVER2:
	mov AL, 27h
INSERTAR_OBJETO_IZQUIERDA:
	push BX
	push AX
	call OBTENER_DE_MAPA
	mov CL, BL
	pop AX
	pop BX
	cmp CL, 01h
	jne NOQUITAR_VIDAIZQ
	dec vidas
	mov fila_jugador, 17h
	mov columna_jugador, 13h
NOQUITAR_VIDAIZQ:
	push BX
	push AX
	call COLOCAR_EN_MAPA
	pop AX
	pop BX
	ret
	

;; ---------------------------------------------- POSICIONAR VEHICULOS ----------------------------------------------
;;posiciona los vehiculos en el tablero
POSICIONAR_VEHICULOS:
	mov cont_fila, 02h
	;;random de vehiculos rango 5 a 9
ciclo_colocar_vehiculos:
	mov BL, 05h
	mov BH, 09h
	call NUMERO_RANDOM
	mov carro_random, AH ;;se guarda el random en carro_random

	;;random para posicionarlos en las columnas
	mov BL, 00h
	mov BH, 26h
	call NUMERO_RANDOM
	;;posicion fila en AH
	mov AL, AH			;random columna
	mov AH, cont_fila	;cada fila
	push AX
	mov BL, carro_random
	call COLOCAR_EN_MAPA

	cmp BL, 09h	
	jne NO_CAMION
	pop AX
	push AX
	inc AL
	mov BL, CAMIONFIN
	call COLOCAR_EN_MAPA
	
NO_CAMION:
	pop AX
	inc cont_fila
	cmp cont_fila, 16h
	jbe ciclo_colocar_vehiculos
	ret

;; ---------------------------------------------- GENERAR NUMEROS ALEATORIOS ----------------------------------------------
;; BL -> limite inferior
;; BH -> limite superior
;; SALIDA:
;;  AH -> número aleatorio

;; 48%16 = 
NUMERO_RANDOM:
	mov AH, 00h
	int 1ah
	;;en DX tenemos el número aleatorio
	mov AX, DX ;;numero random
	mul semilla_random
	
	ror AX, 1
	ror AX, 1
	ror AX, 1
	and AX, 03ffh

	mov semilla_random, AX
	inc semilla_random
	;;segun los limites
	sub BH, BL ;-> 16, 2 = 14 -> BH ->14
	inc BH ;-> 15
	;;	
	div BH

	;;ahora en AH -> se encuentra residuo
	add AH, BL

	;;AH -> NUMERO RANDOM
	ret

;; ---------------------------------------------- ACTUALIZAR CRONOMETRO ----------------------------------------------
INCREMENTAR_CRONOMETRO:
	inc contsegundo
	cmp contsegundo, 3ch
	jne FIN_CRONOMETRO
	mov contsegundo, 00h
	inc contminuto
	cmp contminuto, 3ch
	jne FIN_CRONOMETRO
	mov contminuto, 00h
	inc conthora
FIN_CRONOMETRO:
	ret
;; ---------------------------------------------- FIN ACTUALIZAR CRONOMETRO ----------------------------------------------

;; ---------------------------------------------- Tablero Base --------------------------------------------------
TABLERO_BASE:
	;; Y filas 1 -> 17
	;; X columnas 0 -> 27
	mov fila_tablero, 01h
	mov col_tablero, 00h
IMPRIMIR_INICIO_BANQUETA:
	mov AL, col_tablero  	;;columna
	mov AH, fila_tablero		;;fila
	mov BL, ACERA
	call COLOCAR_EN_MAPA
	inc col_tablero
	cmp col_tablero, 27
	jbe IMPRIMIR_INICIO_BANQUETA

	mov fila_tablero, 17h
	mov col_tablero, 00h
IMPRIMIR_FINAL_BANQUETA:
	mov AL, col_tablero  	;;columna
	mov AH, fila_tablero		;;fila
	mov BL, ACERA
	call COLOCAR_EN_MAPA
	inc col_tablero
	cmp col_tablero, 27
	jbe IMPRIMIR_FINAL_BANQUETA

	mov fila_tablero, 02h
	mov col_tablero, 00h
IMPRIMIR_CARRILES:
	mov AL , col_tablero
	mov AH, fila_tablero
	mov BL, CARRIL
	call COLOCAR_EN_MAPA
	inc col_tablero
	cmp col_tablero, 27
	jbe IMPRIMIR_CARRILES
	mov col_tablero, 00h
	inc fila_tablero
	cmp fila_tablero, 16
	jbe IMPRIMIR_CARRILES
	ret
;; ---------------------------------------------- FIN Tablero Base ----------------------------------------------

;; ---------------------------------------------- COL0CAR EN MAPA ----------------------------------------------
;;Colocar en mapa
;;Entrada: AL -> columna
;;         AH -> fila
;;         BL -> valor a colocar
COLOCAR_EN_MAPA:
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
	mov SI, offset mapa_tablero
	add SI, AX
	mov [SI], BL
	ret
;; ---------------------------------------------- FIN COL0CAR EN MAPA ----------------------------------------------

;; --------------------------------------------- OBTENER DE MAPA ---------------------------------------------
;; obtener_de_mapa -
;; ENTRADA:
;;  AL -> x COLUMNA del elemento
;;  AH -> y FILA del elemento
;; SALIDA:
;;  BL -> código del elemento
OBTENER_DE_MAPA:
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
	mov SI, offset mapa_tablero
	add SI, AX
	mov BL, [SI]
	ret
;; --------------------------------------------- FIN OBTENER DE MAPA ---------------------------------------------

;; ---------------------------------------------- PINTAR MAPA ----------------------------------------------
;;sprites a pintar
;;pintar jugador acer
pintar_jugador_acera:
		mov BX, offset sprite_jugador_acera
		jmp pintar_sprite_en_posicion
;;pintar jugador carril
pintar_jugador_carril:
		mov BX, offset sprite_jugador_carril
		jmp pintar_sprite_en_posicion
;;pintar acera
pintar_acera:
		mov BX, offset sprite_banqueta
		jmp pintar_sprite_en_posicion
;;pintar carril
pintar_carril:
		mov BX, offset sprite_carril
		jmp pintar_sprite_en_posicion
;;pintar carro morado derecha
pintar_carro_morado_derecha:
		mov BX, offset sprite_carro_morado_derecha
		jmp pintar_sprite_en_posicion
;;pintar carro azul derecha
pintar_carro_azul_derecha:
		mov BX, offset sprite_carro_azul_derecha
		jmp pintar_sprite_en_posicion
;;pintar carro verde izquierda
pintar_carro_verde_izq:
		mov BX, offset sprite_carro_verde_izq
		jmp pintar_sprite_en_posicion
;;pintar carro amarillo izquierda
pintar_carro_amarillo_izq:
		mov BX, offset sprite_carro_amarillo_izq
		jmp pintar_sprite_en_posicion
;;pintar camion blanco inicio
pintar_camion_blanco_inicio:
		mov BX, offset sprite_inicio_camion_blanco
		jmp pintar_sprite_en_posicion
;;pintar camion blanco fin
pintar_camion_blanco_fin:
		mov BX, offset sprite_fin_camion_blanco
		jmp pintar_sprite_en_posicion

;; pintar_mapa ---------------------------------------------
pintar_mapa:
		mov AX, 0000
		mov [coordenada_actual], AX
		mov CX, 19
ciclo_filas_mapa:
		xchg BP, CX
		mov CX, 28
ciclo_columnas_mapa:
		mov AX, [coordenada_actual]
		call OBTENER_DE_MAPA
		;; ============================
		;; selección de sprite a pintar
		;; ============================		
		;;jugador acera
		cmp BL, JUGADOR_ACERA
		je pintar_jugador_acera

		;;jugador carril
		cmp BL, JUGADOR_CARRIL
		je pintar_jugador_carril

		;;acera
		cmp BL, ACERA
		je pintar_acera

		;;carril
		cmp BL, CARRIL
		je pintar_carril

		;;carro morado a la derecha
		cmp BL, R_CARROMORADO
		je pintar_carro_morado_derecha

		;;carro azul a la derecha
		cmp BL, R_CARROAZUL
		je pintar_carro_azul_derecha

		;;carro verde a la izquierda
		cmp BL, L_CARROVERDE
		je pintar_carro_verde_izq

		;;carro amarillo a la izquierda
		cmp BL, L_CARROAMARILLO
		je pintar_carro_amarillo_izq

		;;camion blanco inicio
		cmp BL, CAMIONINI
		je pintar_camion_blanco_inicio

		;;camion blanco fin
		cmp BL, CAMIONFIN
		je pintar_camion_blanco_fin

		jmp ciclo_columnas_mapa_loop
		;; ==============================================
		;; definición de qué sprite pintar para cada caso
		;; ==============================================

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

;; ---------------------------------------------- IMPRIMIR SPRITE ----------------------------------------------

;;Imprimir Sprite 8x8
;;Entrada : direccion_sprite -> offset del sprite
;;          SI -> coordena fila de 00 a 18 HEX o 0 a 24 DEC
;;          DI -> coordenada columna de 00 a 27 HEX o 0 a 39 DEC
;;Tambien se utiliza AX,DX,CX,SI,DI, entrada_direccion se modifican
;Salida  : Ninguna
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
; pintar_pixel - pinta un pixel en una posición x, y
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

;; ---------------------------------------------- FIN IMPRIMIR SPRITE ----------------------------------------------

;; ---------------------------------------------- ROW MAYOR ----------------------------------------------
;Converti coordenada x,y a indice. Formula: indice = fila*N_columnas + columna
;Entrada :  SI -> coordenada fila
;           DI -> coordenada columna
;           AX -> N_columnas
;Salida  : AX -> indice de la coordenada x,y
ROW_MAYOR: 
    mul SI
    add AX, DI
    ret

;; ---------------------------------------------- FIN ROW MAYOR ----------------------------------------------

;; ---------------------------------------------- LIMPIAR PANTALLA ----------------------------------------------
;; limpiar_pantalla - limpia la pantalla
limpiar_pantalla:
		;;Colocal Cursos en 0,0
		mov DH, 00 ;; y fila
		mov DL, 00 ;; x col
		mov BH, 00
		mov AH, 02
		int 10h
		mov CX, 19
ciclo_limpiar_pantalla:
		mov DX, offset cadena_limpiar
		mov AH, 09
		int 21
		loop ciclo_limpiar_pantalla
		ret
;; ---------------------------------------------- FIN LIMPIAR PANTALLA ----------------------------------------------

;; ---------------------------------------------- IMPRIMIR CADENA RESULTADO ----------------------------------------------
;; numAstr - convierte un número entero en cadena
;;     Entrada: AX -> numero de entrada
;;				DI -> offset de la cadena
;;				CX -> tamaño de la cadena
;;     Salida:  offset de la cadena -> el número convertido a cadena
numAstr:         
    mov BX, DI ;;direccion cadena resultado
    mov DX, 0030h
limpiar:        
    mov [BX], DL
    inc BX
    loop limpiar
    dec BX                   ;;; Posicionarse en el caracter de las unidades
    cmp AX, 0000h            ;;; Si el número es 0 no hacer nada
    je retorno
	jg unidad
	neg AX
	mov DL, 2d
    mov BX, DI
	mov [BX], DL
unidad:         
    mov DL,[BX]              ;;; Incrementar las unidades
    inc DL
    mov [BX],DL
    dec AX                   ;;; Decrementar el número de entrada
    mov SI, BX               ;;; Guardar el dato de la posición de las unidades en otro registro
revisar_cifra:  
    mov DX, 3ah              ;;; Si en las unidades está el caracter 3Ah o :
    cmp [BX], DL
    je incrementa_ant        ;;; Saltar a la parte donde se incrementa la cifra anterior
    mov BX, SI               ;;; Restablecer la posición de las unidades en el registro original
    cmp AX, 0000h            ;;; Si el número de entrada no es 0
    jne unidad               ;;; Volver a incrementar unidades
    jmp retorno              ;;; Si no terminar rutina
incrementa_ant: 
    mov DX, 30h              ;;; Se coloca el caracter '0' en la cifra actual
    mov [BX], DL
    dec BX                   ;;; Se mueve el índice a la cifra anterior
    mov DL, [BX]             ;;; Se incrementa la cifra indexada por BX
    inc DL
    mov [BX], DL
    cmp BX, DI    			;;; Si el índice actual no es la direccion de la primera cifra
    jne revisar_cifra        ;;; revisar la cifra anterior para ver si nuevamente hay que incrementarla
    mov BX, SI               ;;; Reestablecer la posición de las unidades en el registro original
    cmp AX, 0000h            ;;; Si el número de entrada no es 0
    jne unidad               ;;; Volver a incrementar unidades
retorno:        
    ret                      ;;; Si no retornar
;; ---------------------------------------------- FIN IMPRIMIR CADENA RESULTADO ----------------------------------------------
;; ------------------------------------------------ IMPRIMIR cadena_punteo ----------------------------------------------
;;imprime el cadena_punteo en pantalla
imprimir_cadena_punteo:
	;;Se mueven los parametros de la funcion
	mov AX, punteo_actual		;;la cantidad
	mov DI, offset cadena_punteo ;;la cadena de salida
	mov CX, 05h					;; tamaño de cadena de salida
	call numAstr
	mov DH, 00 ;; y fila
	mov DL, 00 ;; x col
	mov BH, 00
	mov AH, 02
	int 10h

	mov DX, offset cadena_punteo
	mov AH, 09
	int 21
	ret

;; ---------------------------------------------- IMPRIMIR VIDA ----------------------------------------------
;;segun el numero de vidas se imprime el caracter de vida o no vida
imprimir_vidas:
	mov DH, 00 ;; y fila
	mov DL, 10 ;; x coL
	mov BH, 00
	mov AH, 02 ;; interrupcion
	int 10h
	;;
	mov CX, 00h
	mov CL, 03h
	;;
	mov SI, vidas; le pasa un 02
ciclo_imp_vidas: ;;0
	cmp SI, 00h
	ja imprimir_vida
	mov DX, offset novida_caracter
	mov AH, 09
	int 21
	jmp ciclo
imprimir_vida:
	mov DX, offset vida_caracter
	mov AH, 09
	int 21
	dec SI
ciclo:
	loop ciclo_imp_vidas
	ret

;; ---------------------------------------------- FIN IMPRIMIR VIDA ----------------------------------------------
;; ---------------------------------------------- IMPRIMIR TIEMPO ----------------------------------------------
;;imprime el tiempo en pantalla
imprimir_tiempo:
	;;Se mueven los parametros de la funcion
	mov AX, conthora		;;la cantidad
	mov DI, offset horas ;;la cadena de salida
	mov CX, 02h					;; tamaño de cadena de salida
	call numAstr

	mov AX, contminuto		;;la cantidad
	mov DI, offset minutos ;;la cadena de salida
	mov CX, 02h					;; tamaño de cadena de salida
	call numAstr

	mov AX, contsegundo		;;la cantidad
	mov DI, offset segundos ;;la cadena de salida
	mov CX, 02h					;; tamaño de cadena de salida
	call numAstr


	mov DH, 00 ;; y fila
	mov DL, 20;; x col
	mov BH, 00
	mov AH, 02
	int 10h

	mov DX, offset horas
	mov AH, 09
	int 21
	ret

;; ---------------------------------------------- FIN IMPRIMIR TIEMPO ----------------------------------------------
;; ---------------------------------------------- IMPRIMIR USUARIO ----------------------------------------------
;;imprime el usuario en pantalla
imprimir_usuario_footer:
	mov DH, 18 ;; y fila
	mov DL, 00;; x col
	mov BH, 00
	mov AH, 02
	int 10h

	;;buffer usuario
	mov BX, offset buffer_entrada_usuario
	mov CL, [BX + 1]
	mov CH, 00
	;;
	add BX, 02h
	;;
	add BX, CX
	;;
	mov AL, '$'
	mov [BX], AL


	mov DX, offset buffer_entrada_usuario + 2
	mov AH, 09
	int 21
	ret

;; ---------------------------------------------- FIN IMPRIMIR USUARIO ----------------------------------------------
;; ---------------------------------------------- IMPRIMIR FECHA ----------------------------------------------

;;imprime la fecha en pantalla
imprimir_fechahora_footer:
	;;Se mueven los parametros de la funcion
	mov AX, dia_numero		;;la cantidad
	mov DI, offset dia_cadena ;;la cadena de salida
	mov CX, 02h					;; tamaño de cadena de salida
	call numAstr

	mov AX, mes_numero		;;la cantidad
	mov DI, offset mes_cadena ;;la cadena de salida
	mov CX, 02h					;; tamaño de cadena de salida
	call numAstr

	mov AX, ahno_numero		;;la cantidad
	mov DI, offset anho_cadena ;;la cadena de salida
	mov CX, 04h					;; tamaño de cadena de salida
	call numAstr

	mov AX, hora_numero		;;la cantidad
	mov DI, offset hora_cadena ;;la cadena de salida
	mov CX, 02h					;; tamaño de cadena de salida
	call numAstr

	mov AX, minutos_numero		;;la cantidad
	mov DI, offset minutos_cadena ;;la cadena de salida
	mov CX, 02h					;; tamaño de cadena de salida
	call numAstr

	mov AX, segundos_numero		;;la cantidad
	mov DI, offset segundos_cadena ;;la cadena de salida
	mov CX, 02h					;; tamaño de cadena de salida
	call numAstr

	mov DH, 18;; y fila
	mov DL, 14;; x col
	mov BH, 00
	mov AH, 02
	int 10h

	mov DX, offset dia_cadena
	mov AH, 09
	int 21

	ret

;; ---------------------------------------------- FIN IMPRIMIR FECHA ----------------------------------------------
;; ----------------------------------------------IMPRIMIR GAME OVER ----------------------------------------------
;;imprime el game over en pantalla
imprimir_gameover:
	mov DH, 0b ;; y fila
	mov DL, 0f;; x col
	mov BH, 00
	mov AH, 02
	int 10h

	mov DX, offset gameover_cadena
	mov AH, 09
	int 21

	;;mostrar puntaje
	mov DH, 0c ;; y fila
	mov DL, 12; x col
	mov BH, 00
	mov AH, 02
	int 10h

	mov DX, offset cadena_punteo
	mov AH, 09
	int 21

	;;reiniciar variables juego
	mov vidas, 03h
	mov punteo_actual, 0000h
	mov conthora, 00h
	mov contminuto, 00h
	mov contsegundo, 00h
	mov semilla_random, 01h

	MOV SI, 2710h
e2:	
	DEC SI
	JZ e3
	MOV DI, 222Eh
e1:		
	DEC DI
	JNZ e1
	JMP e2
e3:
	ret

;-------------------------------------------LIMPIAR BUFFERS-------------------------------------------
;;BX -> Offset buffer

limpiar_buffer:
	mov CH, 00
	mov CL, [BX]
	add BX, 02h

ciclo_limpiar_buffer:
	mov AL, 00h
	mov [BX], AL
	inc BX
	loop ciclo_limpiar_buffer
	ret
FINAL_PROGRAMA:
	call limpiar_pantalla
;;---------------------------------------FIN_INSTRUCCIONES---------------------------------------
.EXIT
END  