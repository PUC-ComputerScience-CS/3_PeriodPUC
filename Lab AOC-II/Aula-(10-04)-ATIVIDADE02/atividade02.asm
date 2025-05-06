#Participantes: Maria Clara de Carvalho Sousa bertozi // José carvalho Neto

.data
	mensagem: .asciiz "Digite o primeiro octeto codigo IP: "
	classeA: .asciiz "Classe A\n"
	classeB: .asciiz "Classe B\n"
	classeC: .asciiz "Classe C\n"
	invalida: .asciiz "Classe invalida\n"
	
.text
	#pede o primeiro octeto
	li $v0, 4
	la $a0, mensagem
	syscall
	
	#le o octeto
	li $v0, 5 #espera q o usuario digite um numero
        syscall
        
        move $t0, $v0
        
        bltz $t0, imprime_erro
        li $t1, 223
        bgt $t0, $t1, imprime_erro
	
	#compara com classeA (0-127)
	li $t1, 128
	blt  $t0, $t1, imprime_cA
	
	#compara com classeB (128-191)
	li $t1, 192
	blt  $t0, $t1, imprime_cB
	
	#compara com classeC(192-224) -> 225-239(classe D) sem host // 240-255 (classe E) reservado p/ pesquisa
	li $t1, 224
	blt  $t0, $t1, imprime_cC

#logica da comparacao	
imprime_cA:
	li $v0, 4
	la $a0, classeA
	syscall
	j fim

imprime_cB:
	li $v0, 4
	la $a0, classeB
	syscall
	j fim

imprime_cC:
	li $v0, 4
	la $a0, classeC
	syscall
	j fim
	
imprime_erro: 
	li $v0, 4
	la $a0, invalida
	syscall
	j fim

fim: #finaliza o programa
	li $v0, 10
	syscall