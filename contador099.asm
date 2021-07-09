	.globl contador099
	
	.include "servicios.asm"
	
	.data
	
	.text

contador099:

	#-- Crear la pila: 20 bytes
	addi sp, sp, -16
	
	#---- GUARDAR RA EN LA PILA
	sw ra, 12(sp)
	
	li t0, 0    #-- Valor en el que se comienza a contar
	li t1, 100  #-- Valor en el que se termina de contar
	
	b print

print:	#-- Imprimir valores
	
	sw t0, 8(sp)  #-- Guardamos el valor de t0
	sw t1, 4(sp)  #-- Guardamos el valor de t1
	
	#-- Colocar el valor del display de la derecha --#
	#-- Colocamos el valor de las unidades en el registro t3
	li t4, 10   #-- Valor para calcular las decenas
	div t6, t0, t4 #-- t1 = t0 / 10 → valor entero !! valor de las decenas
	mul t5, t6, t4  #-- Valor en unidades de las decenas (si t1 es 2, t5 sera 20) → t5 = t1 * 10
	sub t3, t0, t5  #-- Valor de las unidades (si t0 es 27, t3 sera 7) → t3 = t0 - t5
	
	li t2, DISPLAY_R  #-- Direccion del display derecho
	mv a0, t3
	mv a1, t2
	jal colocar_display
	
	lw t0, 8(sp)  #-- Recuperamos de la pila el valor de t0
	lw t1, 4(sp)  #-- Recuperamos de la pila el valor de t1
	
	#-- Colocar el valor del display de la izquierda --#
	li t4, 10   #-- Valor para calcular las decenas
	div t6, t0, t4 #-- t1 = t0 / 10 → valor entero !! valor de las decenas

	li t2, DISPLAY_L  #-- Direccion del display izquierdo
	mv a0, t6
	mv a1, t2
	jal colocar_display
	
	lw t0, 8(sp)  #-- Recuperamos de la pila el valor de t0
	lw t1, 4(sp)  #-- Recuperamos de la pila el valor de t1

	addi t0, t0, 1 #-- Pasamos al siguiente numero
	
	beq t0, t1, end #-- Comprobamos si ya se ha llegado al maximo
	
	b print #-- Repetimos

end:	#-- Punto de salida

	#-- Cargamos la direccion de retorno
	lw ra, 12(sp)
	#-- Liberar el espacio de la pila
	addi sp, sp, 16
	
	ret