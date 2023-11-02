# Manual Técnico

## Introducción
Este manual técnico describe las funciones y características juego con diferentes modalidades y navegacion entre opcionesutilizando el lenguaje de programación MASM611. El juego consiste de un mensaje de bienvenida que muestra los datos de la universidad
y los datos del estudiante, así como de un menu con tres distintas opciones, dos de las cuales son login, una para registrar usuarios y una para salir.

Para los usuarios registrados hay 2 categorias, usuarios normales y usuarios administrodes los cuales pooseeran diferente acceso a ciertas opcioens, sin embargo ambos podran jugar partidas y ver sus punteos

## Requisitos Previos
Asegúrate de tener los siguientes requisitos previos configurados antes de ejecutar el sistema:

- *MASM611:* El juego está implementado en MASM611.

- *DOS:* Se utiliza el sistema operativo DOS para correr el juego y poder utilizar el lenguaje de programación MASM611 para desarrollar
el juego y poder jugarlo.

- *DOSBOX:* Es el emulador que nos permite correr el sistema operativo DOS.

## variables utilizadas para guardar distintos mensajes o datos

JUGADOR_CARRIL	         equ 01  
JUGADOR_ACERA	         equ 02   
ACERA			         equ 03   
CARRIL			         equ 04   
R_CARROMORADO	         equ 05      
R_CARROAZUL		         equ 06   
L_CARROVERDE	         equ 07    
L_CARROAMARILLO	         equ 08    
CAMIONINI		         equ 09    
CAMIONFIN		         equ 10    
USUARIO_NORMAL			 equ 02    
USUARIO_ADMIN 			 equ 01    
USUARIO_ADMIN_ORIGINAL	 equ 00   
SIZE_NAME	 			 equ 20  
SIZE_PASSWORD 			 equ 25  
NO_BLOQUEADO			 equ 00  
BLOQUEADO				 equ 01  
vidas                   dw 0003h  
vida_caracter           db "O  $"  
novida_caracter         db "#  $"  
horas 					db "00:"  
minutos 				db "00:"  
segundos 				db "00$"    
conthora 				dw 0000h  
contminuto 				dw 0000h  
contsegundo 			dw 0000h  
cadena_punteo 			db 05 dup('0'), '$' ;;00000 -> 00002  
punteo_actual 			dw 0000h  
dia_cadena 				db 02 dup (30),'/'  
mes_cadena 				db 02 dup (30),'/'  
anho_cadena 			db 04 dup (30),' '  
hora_cadena 			db 02 dup (30),':'  
minutos_cadena 			db 02 dup (30),':'  
segundos_cadena 		db 02 dup (30), '$'  
dia_numero 				dw 0000  
mes_numero 				dw 0000  
ahno_numero 			dw 0000  
hora_numero 			dw 0000  
minutos_numero 			dw 0000  
segundos_numero 		dw 0000  
offset_DS_data 			DW 0000h  
count_col_sprite 		DW 0008h  
count_fila_sprite 		DW 0008h  
col_pantalla 			DW 0000h  
fila_pantalla 			DW 0000h  
direccion_sprite 		DW 0000h  
indice_video 			DW 0000h  
fila_tablero 			db 0000  
col_tablero 			db 0000  
mapa_tablero 			db 3e8 dup(00)  
x_elemento 				dw 0000  
y_elemento 				dw 0000  
coordenadas_jugador 	dw 0000  
coordenada_actual   	dw 0000  
sprite_jugador_carril 	db 13, 13, 13, 05, 05, 13, 13, 13  
                      	db 13, 13, 13, 05, 05, 13, 13, 05   
                      	db 13, 05, 05, 05, 05, 05, 05, 13   
                      	db 05, 13, 13, 05, 05, 13, 13, 13   
                      	db 13, 13, 13, 05, 05, 13, 13, 13   
                      	db 13, 13, 05, 05, 05, 05, 13, 13   
                      	db 13, 13, 05, 13, 13, 05, 13, 13    
                      	db 1f, 05, 05, 13, 1f, 05, 05, 13   

sprite_jugador_acera 	db 17, 17, 17, 05, 05, 17, 17, 17  
                     	db 17, 17, 17, 05, 05, 17, 17, 05  
                     	db 17, 05, 05, 05, 05, 05, 05, 17  
                     	db 05, 17, 17, 05, 05, 17, 17, 17  
                     	db 17, 17, 17, 05, 05, 17, 17, 17  
                     	db 17, 17, 05, 05, 05, 05, 17, 17  
                     	db 17, 17, 05, 1a, 17, 05, 17, 17  
                     	db 17, 05, 05, 17, 17, 05, 05, 17  

sprite_carril  			db 13, 13, 13, 13, 13, 13, 13, 13  
               			db 13, 13, 13, 13, 13, 13, 13, 13  
               			db 13, 13, 13, 13, 13, 13, 13, 13 
               			db 13, 13, 13, 13, 13, 13, 13, 13  
               			db 13, 13, 13, 13, 13, 13, 13, 13  
               			db 13, 13, 13, 13, 13, 13, 13, 13  
               			db 13, 13, 13, 13, 13, 13, 13, 13  
               			db 1f, 1f, 13, 13, 1f, 1f, 13, 13  

sprite_banqueta 		db 17, 17, 17, 17, 17, 17, 17, 17  
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

cadena_limpiar 						db "                                        $"  
segundo_ant 						dw 0000h  
carro_random 						db 00h  
cont_fila 							db 00h  
semilla_random 						dw 01h  
fila_mapa 							db 00h  
columna_mapa 						db 00h  
fila_jugador 						db 00h  
columna_jugador 					db 00h  
gameover_cadena 					db "GAME  OVER$"  
tiempo_base_velocidad_lenta 		db 00h  
tiempo_base_velocidad_media 		db 00h  
tiempo_base_velocidad_rapida 		db 00h  
tiempo_base_velocidad_lenta_aux 	db 00h  
tiempo_base_velocidad_media_aux 	db 00h  
tiempo_base_velocidad_rapida_aux 	db 00h  
tiempo_actual 						db 00h  
bandera_tiempo						db 00h  
presentacion 						db 0ah,0ah,0ah,0ah," Universidad de San Carlos de Guatemala",0ah,0ah  
			 						db " Facultad de Ingenieria",0ah,0ah  
			 						db " Arquitectura de Computadoras y",0ah,0ah  
			 						db " Ensambladores 1",0ah,0ah  
			 						db " Seccion A",0ah,0ah  
			 						db " Segundo Semestre 2023",0ah,0ah,0ah,0ah  
			 						db " Douglas Dario Rivera Ojeda",0ah,0ah  
			 						db " 201122881","$"  
usuarios_archivo 					db "USRS.ACE", 00  
cadena_login_titulo 				db "            LOGIN$"  
cadena_registro_titulo 				db "REGISTRO$"  
cadena_usuariologin 				db "USUARIO: $"  
cadena_passwordlogin 				db "PASSWORD: $"  
cadena_error_apertura 				db "ERROR AL ABRIR EL ARCHIVO$"  
cadena_error_lectura 				db "ERROR AL LEER EL ARCHIVO$"  
cadena_error_login 					db "USUARIO O PASSWORD INCORRECTOS$"  
buffer_entrada_usuario 				db 32, 00  
									db 32 dup(00)  
buffer_entrada_password 			db 32, 00  
									db 32 dup(00)  
usuario_actual 						db 14 dup(00), '$'  
usuario_leido 						db 14 dup(00)  
password_usuario 					db 19 dup(00)  
rol_usuario 						db 00  
estado_usuario 						db 00  
handle_usuarios 					dw 0000h  
cont_login 							db 00h  
cadenaarchivo						db "dojeda"  
									db 0E dup(00)  
									db "201122881A*"  
									db 0E dup(00)  
									db 00, 00  
cadena_logincorrecto 								db "Acceso valido!$"  
cadena_error_longitud_usuario 						db "ERROR ->>> Acceso invalido!$"  
cadena_error_caracteres_no_validos  				db "ERROR ->>> Nombre de usuario no valido!$"  
cadena_error_longitud_password 						db "ERROR ->>> Longitud de password no es valido!$"  
cadena_error_caracteres_no_validos_password 		db "ERROR ->>> Password no valido!$"  
cadena_error_caracteres_requisitos_de_caracteres 	db "ERROR ->>> Nombre de usuario no valido!$"  
cadena_error_usuario_existe 						db "ERROR ->>> Nombre ya esta en uso!$"  
count_minusculas_password 							db 00h  
count_mayusculas_password 							db 00h  
count_caracter_especial_password 					db 00h  
nombre_archivo_puntajes 							db "PUNTOS.ACE", 00  
usuario_puntaje 									db 14 dup(00)  
													db 00  
puntaje_usuario 									dw 0000h  
hora_partida_puntaje 								dw 0000h  
minuto_partida_puntaje 								dw 0000h  
segundo_partida_puntaje 							dw 0000h  
puntos_y_tiempo 									db " "  
cadena_puntaje 										db "00000   "  
cadena_hora_puntaje 								db "00:"  
cadena_minuto_puntaje 								db "00:"  
cadena_segundo_puntaje 								db "00$"  
handle_puntajes 									dw 0000h  
cadena_titulo_ultimos_puntajes 						db "          ULTIMOS PUNTAJES", 0ah, 0ah,"$"  
cadena_titulo_ordenamiento 							db "               ORDENAMIENTO", 0ah, 0ah,"$"  
cantidad_puntajes_leidos 							db 00h  
aux_nombre_usuario 									db 14 dup(00)  
				   									db 00h  
lista_puntajes 										db 366 dup(00)  
offset_lista_puntajes 								dw 0000h  
offset_impresion_puntajes 							dw 0000h  
offset_posicion_puntajes 							dw 0000h  
count_ordenados 									db 00h  
count_filas_puntajes 								db 00h  
count_marcador 										db 00h  
parametro_puntaje 									db 00h    
orientacion_puntaje 								db 00h  
tiempo1_puntaje 									dw 0000h  
tiempo2_puntaje 									dw 0000h  
velocidad_ordenamiento 								db 00h  
cadena_fin_ordenamiento 							db "Proceso terminado                $"  
rr_delay 											dw 0000h  
hh_delay 											dw 0000h  
cadena_elegir_parametro 							db "ELEGIR PARAMETRO DE ORDENAMIENTO", 0ah, 0ah, "     1. PUNTAJE", 0ah, "     2. TIEMPO", 0ah, 0ah, "$"  
cadena_elegir_orientacion 							db "ELEGIR ORIENTACION DE ORDENAMIENTO", 0ah, 0ah, "     1. ASCENDENTE", 0ah, "     2. DESCENDENTE", 0ah, 0ah, "$"  
cadena_elegir_velocidad 							db "ELEGIR VELOCIDAD DE ORDENAMIENTO  ", 0ah, 0ah, "     1. LENTA      ", 0ah, "     2. MEDIA       ", 0ah, "     3. RAPIDA", 0ah, 0ah, "$"  
cadena_tecla_continuar 								db "Presione ESC para iniciar$"  
nombre_archivo_ordenamiento 						db "BUBBLE.ACE",00  
handle_ordenamiento 								dw 0000h  
offset_escribir_file 								dw 0000h  
coma 												db ","  
salto_linea 										db 0dh, 0ah  
cadena_ordenamiento_parametro_puntaje 				db "ORDENADO POR PUNTAJE", 0ah  
cadena_ordenamiento_parametro_tiempo 				db "ORDENADO POR TIEMPO ", 0ah  
cadena_ordenamiento_orientacion_ascendente 			db "ORDENADO DE FORMA ASCENDENTE ", 0ah  
cadena_ordenamiento_orientacion_descendente 		db "ORDENADO DE FORMA DESCENDENTE", 0ah  
cadena_fecha_ordenamiento 							db "FECHA: "  
cadena_dia_ordenamiento 							db 02 dup (30),'/'  
cadena_mes_ordenamiento 							db 02 dup (30),'/'  
cadena_anho_ordenamiento 							db 04 dup (30),0ah  
cadena_hor_ordenamiento 							db "HORA: "  
cadena_hora_ordenamiento 							db 02 dup (30),':'  
cadena_minutos_ordenamiento 						db 02 dup (30),':'  
cadena_segundos_ordenamiento 						db 02 dup (30),0ah  
dia_ordenamiento 									db 00h  
mes_ordenamiento 									db 00h  
anho_ordenamiento 									dw 0000h  
hora_ordenamiento 									db 00h  
minutos_ordenamiento 								db 00h  
segundos_ordenamiento 								db 00h  
segundos_actuales_ordenamiento 						db 00h  
tiempo_actual_ordenamiento 							db 00h  
tiempo_de_ordenamiento 								db "Tiempo de ordenamiento: "  
cadena_tiempo_ordenamiento 							db "00"  
						   							db " Segundos",0ah,0ah  
cadena_reporte_realizado 							db "Reporte generado!!$"  
nombre_reporte_html 								db "SYS.HTM",00  
handle_reporte_html 								dw 0000h  
dia_generacion 										db 00h  
mes_generacion 										db 00h  
anho_generacion 									dw 0000h  
hora_generacion 									db 00h  
minutos_generacion 									db 00h  
segundos_generacion 								db 00h  
usuario_leido_aux 									db 14 dup(00)  
password_usuario_aux 								db 19 dup(00)  
rol_usuario_aux 									db 00  
estado_usuario_aux 									db 00  
offset_archivo 										dw 0000h  
max_tabla_puntajes 									db 0fh  
bandera_solo_ordenamiento 							db 00h  
bandera_coincide_usuario 							db 00h  
count_intentos 										db 00h  
usuario_anterior 									db 14 dup(00)  
password_anterior 									db 19 dup(00)  
offset_usuario_coincide 							dw 0000h  
codigo_no_bloqueado 								db 00h  
codigo_bloqueado 									db 01h  
cadena_usuario_bloqueado 							db "Error ->>> Usuario bloqueado!$"  
buffer_desbloqueo_usuario							db 32,00  
													db 32 dup(00)  
cadena_titulo_desbloqueo_usuario 					db "          DESBLOQUEAR USUARIO            $"  
cadena_ingrese_usuario								db "INGRESE USUARIO: $"  
offset_desbloque_usuario 							dw 0000h  
cadena_usuario_desbloqueado 						db "Usuario desbloqueado!!!$"  
cadena_error_no_existe_usuario 						db "ERROR ->>> Usuaio no existe!$"  
cadena_titulo_promover_usuario 						db "          PROMOVER O DEGRADAR          $"  
menu_promover_degradar_usuario 						db "	1. PROMOVER USUARIO",0ah,0ah,"	2. DEGRADAR USUARIO",0ah,0ah,"	","$"  
buffer_promover_degradar_usuario					db 32,00  
													db 32 dup(00)  
cadena_ingrese_usuario_promover 					db "	Ingrese el usuario:",0a, "$"  
offset_promover_degradar_usuario 					dw 0000h  
rol_promover_degradar 								db 00h  
opcion_promover_degradar 							db 00h  
cadena_usuario_promovido_degradado 					db "Operacion terminada!!!$"  
cadena_titulo_estadisticas 							db "           ESTADISTICAS          $"  
cadena_usuario_base									db "	 F1	 NUEVA PARTIDA",0ah,0ah  
													db "	 F2	 ULTIMAS PARTIDAS",0ah,0ah  
													db "	 F3	 CERRAR SESION",0ah,0ah,"$"  
cadena_usuario_admin								db "	 F4      ESTADISTICAS",0ah,0ah  
													db "	 F5      ORDENAMIENTO",0ah,0ah  
													db "	 F6	 DESBLOQUEAR USUARIO",0ah,0ah  
													db "	 F7	 REPORTE DEL SISTEMA",0ah,0ah,"$"  
cadena_usuario_admin_original						db "	 F8	 PROMOVER O DEGRADAR$",0ah,0ah,"$"  
cadena_pantalla_inicial								db "	 F1	 LOGIN",0ah,0ah  
													db "	 F2	 REGISTRO",0ah,0ah  
													db "	 ESC     SALIR$"  
cadena_menu_pause									db "	F1	CONTINUAR",0ah,0ah  
													db "	F2	SALIR",0ah,0ah,"$"  

