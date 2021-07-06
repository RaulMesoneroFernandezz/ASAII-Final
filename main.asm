	.include "servicios.asm"

	.data

menu:	.string "\n1. Contador.\n2. Cuenta atras.\n3. Contador de 0 a 99.\n4. Colocar numero en display.\n5. Salir.\n\n¿Opcion?: "
msg:	.string "¿Que numero quieres colocar en el display?: "
msg1:	.string "Introduce el numero en el que se empieza: "
msg2:	.string "Introduce el numero en que se termina (no incluido): "

	.text 

main_loop:

	#-- Guardamos las posibles opciones del menu en registros estaticos
	li s0, 1
	li s1, 2
	li s2, 3
	li s3, 4
	li s4, 5

	#-- Imprimimos los mensajes del menu
	la a0, menu
	li a7, PRINT_STRING
	ecall

	#-- Leer entero (t0)
	li a7, READ_INT
	ecall
	mv t0, a0

	#-- Realizar la comparacion
	beq t0, s0, opt1  #-- Subrutina de contador
	beq t0, s1, opt2  #-- Subrutina de cuenta atras
	beq t0, s2, opt3  #-- Subrutine de contar de 0 a 99
	beq t0, s3, opt4  #-- Subrutina de poner el numero en display
	beq t0, s4, fin   #-- Terminar ejecucion

	b main_loop

opt1:	#-- Para llamar a la subrutina del contador

	jal contador

	b main_loop #-- Volvemos al bucle principal

opt2:	#-- Para llamar a la subrutina de la cuenta atras

	jal cuenta_atras

	b main_loop #-- Volvemos al bucle principal

opt3:	#-- Para llamar a la subrutina del contador de 0 a 99

	jal contador099

	b main_loop #-- Volvemos al bucle principal

opt4:	#-- Para llamar a la subrutina de colocar un numero cualquiera en el display

	#-- Pedir al usuario que numero quiere imprimir
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Leer entero → se guarda en a0, que se le pasa a la funcion numdisplay(a0)
	li a7, READ_INT
	ecall

	jal numdisplay

	b main_loop #-- Volvemos al bucle principal

fin:	#--- PUNTO DE SALIDA

	li a7, EXIT
	ecall
