#-- dec2oct(a0)
#-- Parametros de entrada:
#--		a0: numero entero decimal
#-- Convierte un entero decimal a octal y lo muestra en el display

	.globl dec2oct
	
	.include "servicios.asm"
	
	.data
	
	.text
	
dec2oct:

	#-- Crear la pila: 16 bytes
	addi sp, sp, -16
	
	#---- GUARDAR RA EN LA PILA
	sw ra, 12(sp)
	
	mv t0, a0     #-- Guardamos en el registro t0 el valor de entrada, lo usaremos para las unidades
	li t1, 0      #-- Valor que tendrán las decenas
	li t3, 8     #-- El numero maximo en decimal que puede tener para que sea de una sola cifra en hexadecimal

	b convert

convert:  #-- Pasar el argumento de entrada de decimal a hexadecimal

	bgt t3, t0, show_display
	
	sub t0, t0, t3  #-- Restar 8, para unidades
	addi t1, t1, 1  #-- Sumar 1, para decenas
	
	b convert

show_display:

	sw t0, 8(sp)
	sw t1, 4(sp)
	#-- Colocamos las unidades en el display de la derecha
	mv a0, t0
	li a1, DISPLAY_R
	
	jal colocar_display
	
	lw t0, 8(sp)
	lw t1, 4(sp)
	#-- Colocamos las decenas en el display de la izquierda
	mv a0, t1
	li a1, DISPLAY_L
	
	jal colocar_display

	b end

end:

	#-- Cargamos la direccion de retorno
	lw ra, 12(sp)
	#-- Liberar el espacio de la pila
	addi sp, sp, 16

	#-- Punto de salida
	ret
