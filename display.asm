#-- display(a0, a1)
#-- Entrada:
#-- 	a0: numero a colocar en el display
#--	a1: direccion del display en el que se coloca

	.globl colocar_display
	
	.include "servicios.asm"

	.text
	
colocar_display:

	#-- Guardar las variables de entrada en registros temporales
	mv t0, a0
	mv t1, a1
	la t2, tabla
	li t3, 0
	
	beq t0, t3, print_0
	addi t3, t3, 1
	
	beq t0, t3, print_1
	addi t3, t3, 1
	
	beq t0, t3, print_2
	addi t3, t3, 1
	
	beq t0, t3, print_3
	addi t3, t3, 1
	
	beq t0, t3, print_4
	addi t3, t3, 1
	
	beq t0, t3, print_5
	addi t3, t3, 1
	
	beq t0, t3, print_6
	addi t3, t3, 1
	
	beq t0, t3, print_7
	addi t3, t3, 1
	
	beq t0, t3, print_8
	addi t3, t3, 1
	
	beq t0, t3, print_9

	b end

print_0:

	lw a0, E0(t2)
	sw a0, 0(t1)

	b end

print_1:

	lw a0, E1(t2)
	sw a0, 0(t1)

	b end

print_2:

	lw a0, E2(t2)
	sw a0, 0(t1)

	b end

print_3:

	lw a0, E3(t2)
	sw a0, 0(t1)

	b end

print_4:

	lw a0, E4(t2)
	sw a0, 0(t1)

	b end

print_5:

	lw a0, E5(t2)
	sw a0, 0(t1)

	b end

print_6:

	lw a0, E6(t2)
	sw a0, 0(t1)

	b end

print_7:

	lw a0, E7(t2)
	sw a0, 0(t1)

	b end

print_8:

	lw a0, E8(t2)
	sw a0, 0(t1)

	b end

print_9:

	lw a0, E9(t2)
	sw a0, 0(t1)

	b end

end:

	#-- Punto de salida
	ret
