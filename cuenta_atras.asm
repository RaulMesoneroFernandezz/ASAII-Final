	.globl cuenta_atras
	
	.include "servicios.asm"
	
	.data

msg1:	.string "Introduce el numero en el que se empieza: "
msg2:	.string "Introduce el numero en que se termina (no incluido): "
msg3:	.string "El primer numero debe de ser menor que el segundo.\n"
msg4:	.string "Los valores pueden ser 9 como maximo.\n"

	.text
	
cuenta_atras:

	li t2, DISPLAY_R
	li t3, DISPLAY_L

	#-- Pedir al usuario en que numero quiere comenzar a contar
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Leer primer entero (t0)
	li a7, READ_INT
	ecall
	mv t0, a0
	
	#-- Pedir al usuario hasta que numero quiere contar
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Leer segundo entero (t1)
	li a7, READ_INT
	ecall
	mv t1, a0
	
	#-- Comprobar si el primer numero es menor que el segundo
	blt t0, t1, error1
	
	#-- Comprobamos si alguno de los numeros es mayor de 10
	li t6, 10
	bge t0, t6, error2
	bge t1, t6, error2

	#-- Crear la pila: 20 bytes
	addi sp, sp, -20
	
	#---- GUARDAR RA EN LA PILA
	sw ra, 16(sp)

	b contar

contar:

	mv a0, t0  #-- El primer parametro de la funcion
	mv a1, t2  #-- El segundo parametro de la funcion
	
	sw t0, 12(sp) #-- Guardamos el valor de t0
	sw t1, 8(sp) #-- Guardamos el valor de t1
	sw t2, 4(sp) #-- Guardamos el valor de t2
	sw t3, 0(sp) #-- Guardamos el valor de t3
	
	jal colocar_display
	
	lw t0, 12(sp) #-- Recuperamos de la pila el valor de t0
	lw t1, 8(sp) #-- Recuperamos de la pila el valor de t1
	lw t2, 4(sp) #-- Recuperamos de la pila el valor de t1
	lw t3, 0(sp) #-- Recuperamos de la pila el valor de t1

	addi t0, t0, -1 #-- Pasamos al siguiente numero
	
	beq t0, t1, end #-- Comprobamos si ya se ha llegado al maximo
	
	b contar #-- Repetimos

error1:

	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	ret

error2:

	la a0, msg4
	li a7, PRINT_STRING
	ecall
	
	ret

end:
	#-- Cargamos la direccion de retorno
	lw ra, 16(sp)
	#-- Liberar el espacio de la pila
	addi sp, sp, 20
	#-- Terminar
	ret
