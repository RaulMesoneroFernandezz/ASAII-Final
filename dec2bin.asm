#-- dec2bin(a0)
#-- Parametros de entrada:
#--		a0: numero entero decimal
#-- Parametros de salida:
#--		a0: numero en binario

	.globl dec2bin
	
	.include "servicios.asm"
	
	.data

bin:	.string "00000000"  #-- Numero en binario inicial
	
	.text
	
dec2bin:

	mv t0, a0   #-- Guardamos en el registro t0 el valor de entrada
	la t1, bin  #-- Guardamos la direccion del numero en binario inicial
	
	b bucle1    #-- Para dar la vuelta al string

bucle1:         #-- Para colocar el puntero al final de la cadena, no al principio

	lb t2, 0(t1)
	
	beq t2, zero, convert

	addi t1, t1, 1  #-- Apuntar al siguiente caracter

	b bucle1

convert:

	#-- Hay que ver si es par o impar, si es par se coloca un 0 si es impar se coloca un 1
	li t2, 2
	div t3, t0, t2  #-- t3 = t0 / 2 → numero entero

	mul t4, t3, t2  #-- t4 = t3 * 2
	sub t5, t0, t4  #-- t5 = t0 - t4 → sale 0 o 1

	mv t0, t3

	addi t1, t1, -1  #-- Pasar al anterior

	#-- Comprobamos el valor que es y lo guardamos
	beq t5, zero, save0
	bne t5, zero, save1

	b convert

save0:

	li t5, 48  #-- Se guarda un 48 porque es 0 en ASCII
	sb t5, 0(t1)

	li t5, 0
	beq t0, t5, end  #-- Si es el ultimo valor, se acaba

	b convert

save1:

	li t5, 49  #-- Se guarda un 49 porque es 1 en ASCII
	sb t5, 0(t1)
	
	li t5, 1
	beq t0, t5, end  #-- Si es el ultimo valor, se acaba

	b convert

end:

	la a0, bin  #-- Guardamos el string en el argumento de salida

	#-- Punto de salida
	ret
