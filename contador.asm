	.eqv E0 0
	.eqv E1 4
	.eqv E2 8
	.eqv E3 0xC
	.eqv E4 0x10
	.eqv E5 0x14
	.eqv E6 0x18
	.eqv E7 0x1C
	.eqv E8 0x20
	.eqv E9 0x24
	
	.eqv DIG0 0x3F  #-- Digito 0
	.eqv DIG1 0x06  #-- Digito 1
	.eqv DIG2 0x5B  #-- Digito 2
	.eqv DIG3 0x4F  #-- Digito 3
	.eqv DIG4 0x66  #-- Digito 4
	.eqv DIG5 0x6D  #-- Digito 5
	.eqv DIG6 0x7D  #-- Digito 6
	.eqv DIG7 0x07  #-- Digito 7
	.eqv DIG8 0x7F  #-- Digito 8
	.eqv DIG9 0x6F  #-- Digito 9
	
	.eqv DISPLAY 0xFFFF0011
	
	.data

tabla:  .word DIG0  #-- E1
	.word DIG1  #-- E2
	.word DIG2  #-- E3
	.word DIG3  #-- E4
	.word DIG4  #-- E5
	.word DIG5  #-- E6
	.word DIG6  #-- E7
	.word DIG7  #-- E8 
	.word DIG8  #-- E9
	.word DIG9  #-- E10
	
	.text
	
	la x5, tabla
	li x6, DISPLAY
	
repetir:
	lw x10, E0(x5)
	sw x10, 0(x6)

	lw x10, E1(x5)
	sw x10, 0(x6)
	
	lw x10, E2(x5)
	sw x10, 0(x6)
	
	lw x10, E3(x5)
	sw x10, 0(x6)
	
	lw x10, E4(x5)
	sw x10, 0(x6)
	
	lw x10, E5(x5)
	sw x10, 0(x6)
	
	lw x10, E6(x5)
	sw x10, 0(x6)
	
	lw x10, E7(x5)
	sw x10, 0(x6)
	
	lw x10, E8(x5)
	sw x10, 0(x6)
	
	lw x10, E9(x5)
	sw x10, 0(x6)
	
	b repetir
	
	#-- Terminar
	li a7, 10
	ecall
