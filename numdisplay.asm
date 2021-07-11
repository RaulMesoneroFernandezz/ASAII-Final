#-- numdisplay(a0)
#-- Parametros de entrada:
#--		a0: numero a imprimir en displays

	.globl numdisplay

	.include "servicios.asm"

	.data

msg:	.string "\nEl numero debe ser menor de 100 para mostrarse en el display.\n"

	.text
	
numdisplay:
	
	mv t0, a0  #-- Colocamos el valor de entrada en el registro temporal t0
	
	li t4, 100
	bge t0, t4, error
	
	#-- Crear la pila: 20 bytes
	addi sp, sp, -20
	
	#---- GUARDAR RA EN LA PILA
	sw ra, 16(sp)
	
	b print


print:	#-- Imprime el numero que haya puesto el usuario

	li t4, 10 #-- Valor para calcular las decenas

	#-- Primero comprobamos si tiene dos cifras
	div t1, t0, t4 #-- t1 = t0 / 10 → valor entero !!
	
	#-- Colocamos el valor de las unidades en el registro t3
	mul t5, t1, t4  #-- Valor en unidades de las decenas (si t1 es 2, t5 sera 20) → t5 = t1 * 10
	sub t3, t0, t5  #-- Valor de las unidades (si t0 es 27, t3 sera 7) → t3 = t0 - t5
	
	#-- Crear la pila: 16 bytes
	addi sp, sp, -16
	
	#---- GUARDAR RA EN LA PILA
	sw ra, 12(sp)
	
	sw t0, 8(sp)  #-- Guardamos el valor de t0 →  el valor introducido por el usuario
	sw t1, 4(sp)  #-- Guardamos el valor de t1 →  el valor de las decenas
	sw t3, 0(sp)  #-- Guardamos el valor de t3 →  el valor de las unidades
	
	#-- Introducimos la cifra de las decenas en el display de la izquierda
	li t2, DISPLAY_L  #-- Direccion del display izquierdo
	mv a0, t1  	  #-- Valor que queremos imprimir → primer argumento de la funcion
	mv a1, t2	  #-- Direccion del display en que vamos a imprimir → segundo argumento de la funcion
	jal colocar_display
	
	lw t0, 8(sp)  #-- Recuperamos de la pila el valor de t0
	lw t1, 4(sp)  #-- Recuperamos de la pila el valor de t1
	lw t3, 0(sp)  #-- Recuperamos de la pila el valor de t2
	
	#-- Introducimos las cifra de las unidades en el display de la derecha
	li t2, DISPLAY_R  #-- Direccion del display derecho
	mv a0, t3  	  #-- Valor que queremos imprimir → primer argumento de la funcion
	mv a1, t2	  #-- Direccion del display en que vamos a imprimir → segundo argumento de la funcion
	jal colocar_display
	
	b end

error:

	la a0, msg
	li a7, PRINT_STRING
	ecall

	ret

end:	#-- Punto de salida

	#-- Cargamos la direccion de retorno
	lw ra, 12(sp)
	#-- Liberar el espacio de la pila
	addi sp, sp, 16
	ret
