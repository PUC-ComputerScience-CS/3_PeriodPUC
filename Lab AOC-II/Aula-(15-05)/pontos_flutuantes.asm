.data
	var_float1: .float 0
	var_float2 : .float 0
	
	digite01: .asciiz "Digite o primeiro numero float: "
	digite02: .asciiz "Digite o segundo numero float: "
.text
main:
	la $a0, digite01
	li $v0, 4
	syscall
	
	li $v0, 6 #le float do teclado p/ $f0
	syscall
	
	la $t0, var_float1 #armazena na mem
	s.s $f0, 0($t0) 
	mov.s $f1, $f0 #f1 contem o primeiro float
	jal println_float #imprime o numero
	
	#segundo float
	la $a0, digite02
	li $v0, 4
	syscall
	
	li $v0, 6
	syscall
	
	la $t2, var_float2
	s.s $f0, 0($t0)
	mov.s $f2, $f0
	jal println_float
	
feito:
	li $v0, 10
	syscall
	
#imprime valor float contido em f0 e pula uma linha
println_float: 
	mov.s $f12, $f0 
	li $v0, 2 #imprime o f12
	syscall
	
	li $a0, '\n'
	li $v0, 11 #pula linha
	syscall
	
	jr $ra #termina o procedimento
	
#imprime valor int contido em t0 e pula uma linha
println_int:
	move $a0, $t0
	li $v0, 1 #imrprime t0
	syscall
	
	li $a0, '\n'
	li $v0, 11
	syscall
	
	jr $ra
	
.end main