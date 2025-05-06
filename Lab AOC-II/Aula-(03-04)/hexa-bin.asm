.data
	variavel: .word 0x8000000f

.text
	la $s0, variavel
	lw $t0, 0($s0)
	
	li $t1, 0x80000000 #-> mascara 
	li $t4, 0 #numero de iterações // para controlar o loop

#testar os bits do binario para verificar se está certo (no loop e nos fins)
#comandos and	
Loop:
	beq $t4, 32, fim_loop #pula pro final do loop para n ficar um loop infinito quando o t4 chegar em 32
	and $t3, $t0, $t1
	bnez $t3, imprime_um

imprime_zero: #imprime os bits 0
	li  $a0, 0
	j fim_se
	
imprime_um: #imprime os bits 1
	li $a0, 1
	
fim_se: 
	srl $t1, $t1, 1
	li $v0, 1
	syscall
	addi $t4, $t4, 1 #incrementa o t4 até que (no Loop) ele chegue em 32
	j Loop

fim_loop:
	li $v0, 10
	syscall
	
	# li $t1, 1 		--> inicia a variavel $t1 com 1 
	# and $t3, $t0, $t1	--> adiciona $t1 a $t0 e guarda o resultado em $t3 (o resultado sera 1 ou 0)
	# bnez $t3, imprime_um	--> se nao der zero, imprime 1 
	#	fazer loops para: imprime_um e imprime_zero
	# srl $t1, $t1, 1	--> desloca o numero de bits (nesse caso, 1) para a direita guardando o novo numero na variavel escolhida (nesse caso $t1)
