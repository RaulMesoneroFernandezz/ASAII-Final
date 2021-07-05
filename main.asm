	.include "servicios.asm"

	.data

msg:	.string "\n1. Contador.\n2. Cuenta atras.\n3. Salir.\n\n¿Opcion?: "

	.text

	li s0, 1
	li s1, 2
	li s2, 3

main_loop:

	la a0, msg
	li a7, PRINT_STRING
	ecall

	#-- Leer entero (t0)
	li a7, READ_INT
	ecall
	mv t0, a0

	#-- Realizar la comparacion
	beq t0, s0, opt1  # -- Subrutina de contador
	beq t0, s1, opt2  #-- Subrutina de cuenta atras
	beq t0, s2, fin   #-- Terminar ejecucion

	b main_loop


opt1:

	jal contador

	b main_loop

opt2:

	jal cuenta_atras

	b main_loop
	
	#--- PUNTO DE SALIDA
fin:

	li a7, EXIT
	ecall
