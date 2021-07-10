#-- dec2hex(a0)
#-- Parametros de entrada:
#--		a0: numero entero decimal
#-- Convierte un entero decimal a hexadecimal y lo muestra en el display

	.globl dec2hex
	
	.include "servicios.asm"
	
	.data
	
	.text
	
dec2hex:

	#-- Crear la pila: 16 bytes
	addi sp, sp, -16
	
	#---- GUARDAR RA EN LA PILA
	sw ra, 12(sp)
	
	mv t0, a0     #-- Guardamos en el registro t0 el valor de entrada, lo usaremos para las unidades
	li t1, 0      #-- Valor que tendrán las decenas
	li t3, 16     #-- El numero maximo en decimal que puede tener para que sea de una sola cifra en hexadecimal

	b convert

convert:  #-- Pasar el argumento de entrada de decimal a hexadecimal

	bgt t3, t0, show_display  #-- Si es menor de 16, se puede mostrar
	
	sub t0, t0, t3  #-- Restamos 16 porque cada 16 unidades, crece una decena
	addi t1, t1, 1  #-- Se suma una decena
	
	b convert  #-- Continua el bucle

show_display:

	#-- Guardar en la pila los valores de unidades y decenas
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

	b end  #-- Terminar

end:

	#-- Cargamos la direccion de retorno
	lw ra, 12(sp)
	#-- Liberar el espacio de la pila
	addi sp, sp, 16

	#-- Punto de salida
	ret
