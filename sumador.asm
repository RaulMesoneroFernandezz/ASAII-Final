#-- sumador()
#-- No recibe parametros de entrada

	.globl sumador
	
	.include "servicios.asm"
	
	.data
	
msg:	.string "Introduce el primer numero a sumar: "
msg1:	.string "Introduce el segundo numero a sumar: "
msg2:	.string "La suma es: "
	
	.text
	
sumador:

	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	mv t0, a0
	
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	mv t1, a0
	
	add t2, t1, t0
	
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	mv a0, t2
	li a7, PRINT_INT
	ecall
	
	#-- Crear la pila: 20 bytes
	addi sp, sp, -20
	
	#---- GUARDAR RA EN LA PILA
	sw ra, 16(sp)
	
	mv a0, t2
	
	jal numdisplay
	
	b end

end:

	#-- Cargamos la direccion de retorno
	lw ra, 16(sp)
	#-- Liberar el espacio de la pila
	addi sp, sp, 20

	ret
