#-- Codigo de los servicios del sistema operativo
#-- Incluir estos archivos en tus programas para acceder a ellos facilmente, y hacerlos mas legibles
#-- Tambien incluye las direcciones de los segmentos 

	#-- Servicios para imprimir o leer datos
	.eqv PRINT_INT    1
	.eqv READ_INT     5
	.eqv PRINT_STRING 4
	.eqv READ_STRING  8
	.eqv PRINT_CHAR   11
	.eqv READ_CHAR    12
	.eqv EXIT         10
	
	#-- TABLA DE DATOS PARA LOS DISPLAYS --#
	
	#-- Desplazamientos (offset) de la tabla
	.eqv E0 0
	.eqv E1 4
	.eqv E2 8
	.eqv E3 0xC
	.eqv E4 0x10
	.eqv E5 0x14
	.eqv E6 0x18
	.eqv E7 0x1C
	.eqv E8 0x20
	.eqv E9 0x24

	#-- Valores de los digitos
	.eqv DIG0 0x3F  #-- Digito 0
	.eqv DIG1 0x06  #-- Digito 1
	.eqv DIG2 0x5B  #-- Digito 2
	.eqv DIG3 0x4F  #-- Digito 3
	.eqv DIG4 0x66  #-- Digito 4
	.eqv DIG5 0x6D  #-- Digito 5
	.eqv DIG6 0x7D  #-- Digito 6
	.eqv DIG7 0x07  #-- Digito 7
	.eqv DIG8 0x7F  #-- Digito 8
	.eqv DIG9 0x6F  #-- Digito 9
	
	#-- Direcciones de los displays
	.eqv DISPLAY_R 0xFFFF0010  #-- Display de la derecha
	.eqv DISPLAY_L 0xFFFF0011 #-- Display de la izquierda
	
	.data

tabla:	#-- Tabla de valores de digitos para display
	.word DIG0  #-- E1  → 0
	.word DIG1  #-- E2  → 4
	.word DIG2  #-- E3  → 8
	.word DIG3  #-- E4  → c
	.word DIG4  #-- E5  → 10
	.word DIG5  #-- E6  → 14
	.word DIG6  #-- E7  → 18
	.word DIG7  #-- E8  → 1c
	.word DIG8  #-- E9  → 20
	.word DIG9  #-- E10 → 24
