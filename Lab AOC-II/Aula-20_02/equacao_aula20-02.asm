.data
str1: .ascii "Exemplo " 
str2: .ascii "de soma "
str3: .asciiz "e subtracao. Resultado: " # string terminada em 0
str4: .asciiz "Erro de divisao por zero!"

varg: .word 10
varh: .word 15
vari: .word 18
varj: .word 21
varf: .word 0
vark: .word 10

.text
.globl main
main:

#f = (g*h)/(i-j)+k;
#g , h , i e j: regs. $s1, $s2 , $s3  e $s4 respect.; f: registrador $s0

# leitura das vari�veis e carga nos registradores
        
        li $v0, 5
        syscall
        
	sw $v0, varg
	li $v0, 5
	syscall
	
	sw $v0, varh
	li $v0, 5
	syscall
	
	sw $v0, vari
	li $v0, 5
	syscall
	
	sw $v0, varj
	li $v0, 5
	syscall
	
	sw $v0, vark
	li $v0, 5
	syscall
		
	lw $s1, varg     
	lw $s2, varh     
	lw $s3, vari     
	lw $s4, varj   
	lw $s5, vark 

#somas e subtra��o
	mul $t0, $s1, $s2   #$t0 contem g * h  
	sub $t1, $s3, $s4   #$t1 contem i - j 

	beq $t1, $zero, erro
	div $t5, $t0, $t1   #$s0: resultado
	add $s0, $t5, $s5 #soma o k mais o resultado da divisao
	sw $s0, varf  	    # armazena resultado em f
	la $a0, str1 	# endereco da string n�o terminada com NULL
	li $v0, 4 	# imprime string
	syscall
	li $v0, 1 	# imprime inteiro
	lw $a0, varf	# value for int to print
	syscall
	j feito

erro:  
    	la $a0, str4 	# endereco da string n�o terminada com NULL
	li $v0, 4 	# imprime string
	syscall

feito:
	li $v0, 10
	syscall # feito!