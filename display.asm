#-- display(a0, a1)
#-- Argumentos de entrada:
#-- 	a0: numero a colocar en el display
#--	a1: direccion del display en el que se coloca (derecho o izquierdo)

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
	
	li t3, 10
	beq t0, t3, print_a
	
	li t3, 11
	beq t0, t3, print_b
	
	li t3, 12
	beq t0, t3, print_c
	
	li t3, 13
	beq t0, t3, print_d
	
	li t3, 14
	beq t0, t3, print_e
	
	li t3, 15
	beq t0, t3, print_f
	
	li t3, 65
	beq t0, t3, print_a
	
	li t3, 66
	beq t0, t3, print_b
	
	li t3, 67
	beq t0, t3, print_c
	
	li t3, 68
	beq t0, t3, print_d
	
	li t3, 69
	beq t0, t3, print_e
	
	li t3, 70
	beq t0, t3, print_f
	
	li t3, 97
	beq t0, t3, print_a
	
	li t3, 98
	beq t0, t3, print_b
	
	li t3, 99
	beq t0, t3, print_c
	
	li t3, 100
	beq t0, t3, print_d
	
	li t3, 101
	beq t0, t3, print_e
	
	li t3, 102
	beq t0, t3, print_f

	b end

print_a:

	lw a0, EA(t2)
	sb a0, 0(t1)

	b end

print_b:

	lw a0, EB(t2)
	sb a0, 0(t1)

	b end

print_c:

	lw a0, EC(t2)
	sb a0, 0(t1)

	b end

print_d:

	lw a0, ED(t2)
	sb a0, 0(t1)

	b end

print_e:

	lw a0, EE(t2)
	sb a0, 0(t1)

	b end

print_f:

	lw a0, EF(t2)
	sb a0, 0(t1)

	b end

print_0:

	lw a0, E0(t2)
	sb a0, 0(t1)

	b end

print_1:

	lw a0, E1(t2)
	sb a0, 0(t1)

	b end

print_2:

	lw a0, E2(t2)
	sb a0, 0(t1)

	b end

print_3:

	lw a0, E3(t2)
	sb a0, 0(t1)

	b end

print_4:

	lw a0, E4(t2)
	sb a0, 0(t1)

	b end

print_5:

	lw a0, E5(t2)
	sb a0, 0(t1)

	b end

print_6:

	lw a0, E6(t2)
	sb a0, 0(t1)

	b end

print_7:

	lw a0, E7(t2)
	sb a0, 0(t1)

	b end

print_8:

	lw a0, E8(t2)
	sb a0, 0(t1)

	b end

print_9:

	lw a0, E9(t2)
	sb a0, 0(t1)

	b end

end:

	#-- Punto de salida
	ret
