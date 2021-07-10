	.include "servicios.asm"

	.data

menu:	.string "\n1. Contador.\n2. Cuenta atras.\n3. Contador de 0 a 99.\n4. Colocar numero en display.\n5. Sumador.\n6. Convertir decimal a hexadecimal.\n7. Convertir decimal a octal.\n8. Convertir decimal a binario.\n9. Salir.\n\n¿Opcion?: "
msg:	.string "¿Que numero quieres colocar en el display?: "
msg1:	.string "Introduce el numero en el que se empieza: "
msg2:	.string "Introduce el numero en que se termina (no incluido): "
msg3:	.string "Introduce un numero para convertir a hexadecimal(maximo 255): "
msg4:	.string "\nSolo se pueden introducir numeros decimales menores o iguales a 255.\n"
msg5:	.string "Introduce un numero para convertir a binario(maximo 255): "
msg6:	.string "El numero en binario es: "
msg7:	.string "Introduce un numero para convertir a octal(maximo 63): "
msg8:	.string "\nSolo se pueden introducir numeros decimales menores o iguales a 63.\n"
msg9:	.string "\nEl numero debe de ser mayor que 0.\n"

	.text 

main_loop:

	#-- Guardamos las posibles opciones del menu en registros estaticos
	li s0, 1
	li s1, 2
	li s2, 3
	li s3, 4
	li s4, 5
	li s5, 6
	li s6, 7
	li s7, 8
	li s8, 9

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
	beq t0, s4, opt5  #-- Subrutina de sumador                 
	beq t0, s5, opt6  #-- Subrutina decimal a hexadecimal        
	beq t0, s6, opt7  #-- Subrutina decimal a octal	
	beq t0, s7, opt8  #-- Subrutina decimal a binario             
	beq t0, s8, fin   #-- Terminar ejecucion

	b main_loop

opt1:	#-- Para llamar a la subrutina del contador

	jal contador

	b main_loop #-- Volvemos al bucle principal

opt2:  #-- Para llamar a la subrutina de la cuenta atras

	jal cuenta_atras

	b main_loop #-- Volvemos al bucle principal

opt3:  #-- Para llamar a la subrutina del contador de 0 a 99

	jal contador099

	b main_loop #-- Volvemos al bucle principal

opt4:  #-- Para llamar a la subrutina de colocar un numero cualquiera en el display

	#-- Pedir al usuario que numero quiere imprimir
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Leer entero → se guarda en a0, que se le pasa a la funcion numdisplay(a0)
	li a7, READ_INT
	ecall

	jal numdisplay

	b main_loop #-- Volvemos al bucle principal

opt5:  #-- Para llamar a la subrutina del sumador

	jal sumador
	
	b main_loop  #-- Volvemos al bucle principal

opt6:  #-- Conversor decimal a hexadecimal

	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	#-- Comprobacion de errores --#
	li t0, 255
	bgt a0, t0, error_hex
	
	li t0, 0
	blt a0, t0, error_zero

	jal dec2hex
	
	b main_loop  #-- Volvemos al bucle principal

opt7:  #-- Conversion de decimal a octal

	la a0, msg7
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	#-- Comprobacion de errores --#
	li t0, 63
	bgt a0, t0, error_oct
	
	li t0, 0
	blt a0, t0, error_zero

	jal dec2oct
	
	b main_loop  #-- Volvemos al bucle principal

opt8:  #-- Conversion de decimal a binario

	la a0, msg5
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	#-- Comprobacion de errores --#
	li t0, 255
	bgt a0, t0, error_hex
	
	li t0, 0
	blt a0, t0, error_zero

	jal dec2bin  
	
	mv t0, a0
	
	la a0, msg6
	li a7, PRINT_STRING
	ecall
	
	mv a0, t0
	li a7, PRINT_STRING
	ecall
	
	b main_loop  #-- Volvemos al bucle principal

error_hex:  #-- 

	la a0, msg4
	li a7, PRINT_STRING
	ecall

	b main_loop  #-- Volvemos al bucle principal

error_oct:  #-- Error de numero en octal

	la a0, msg8
	li a7, PRINT_STRING
	ecall

	b main_loop  #-- Volvemos al bucle principal

error_zero:  #-- Error numero negativo

	la a0, msg9
	li a7, PRINT_STRING
	ecall

	b main_loop  #-- Volvemos al bucle principal

fin:	#--- PUNTO DE SALIDA

	li a7, EXIT
	ecall
