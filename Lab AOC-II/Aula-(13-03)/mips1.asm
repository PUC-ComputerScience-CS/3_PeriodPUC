# Este programa le um arquivo ate os 1024 primeiros bytes (caracteres)
# O arquivo deve estar na pasta de instalacao do Mars caso nao seja
# indicado o caminho completo 
#
.data  
arquivo_origem: .asciiz "C:\\Users\\1519529\\Documents\\arquivo.txt"      # nome do arquivo
arquivo_destino: .asciiz "C:\\Users\\1519529\\Documents\\arquivo1.txt"
buffer: .space 1024

fim_arquivo_origem: .asciiz "\nChegou ao fim do arquivo origem"
fim_arquivo_destino: .asciiz "\nChegou ao fim do buffer"

.text
# $s0: descritor do arquivo aberto
# $s1: endereco do bloco de dados do arquivo lido
#abre arquivo para leitura
	li   $v0, 13       # chamada de sistema para abrir arquivo
	la   $a0, arquivo_origem      
	li   $a1, 0        # abrir para leitura || $a1 = flags || flag 0, apenas para leitura
	li   $a2, 0	   # $a2 = mode 
	syscall            # abre arquivo! (descritor do arquivo retornado em $v0)
	move $s0, $v0      # salva o descritor de arquivo || backup do $v0 no $s0

#le do arquivo
	move $a0, $s0      # descritor do arquivo 
	la   $a1, buffer   # endereco do buffer para receber a leitura
	move $s1, $a1      # salva ponteiro para buffer em $s1
	beq  $v0, 0, fim_arquivo
Loop:	
	li   $v0, 14       # chamada de sistema para ler arquivo
	li   $a2, 1        # numero maximo de caracters a serem lidos
	syscall            # executa leitura do arquivo!
	#sb $v0, 0($a1)
	beq $v0, 0, fim_arquivo
	addi $a1, $a1, 1
	j Loop
 	 
# Fecha o arquivo 
fim_arquivo: li   $v0, 16       # chamada de sistema para fechar arquivo
	     move $a0, $s0      # descritor do arquivo a ser fechado
	     syscall            # fecha arquivo!

# imprime conteudo do buffer    
        add  $t0, $zero, $zero   # i = 0
    	add  $t1, $s1, $t0       # inicia $t1 com ponteiro $s1 || $t1 aponta para o primeiro byte do buffer 
    L1: lb   $s3, 0($t1) 
   	beq  $t0, 100, out     # se i = 10 deixar o laco  
        jal  imprime_caracter_em_s3  
        addi $t0, $t0, 1         # i = i + 1 
        addi $t1, $t1, 1         # incrementa endereco  
        j    L1                  # volta pro comeco do loop
    out: 
        
feito:  li $v0, 10
	syscall 		# feito!

imprime_caracter_em_s3:
	li $v0, 11 	# imprime $s3
	move $a0, $s3
	syscall
	jr $ra
