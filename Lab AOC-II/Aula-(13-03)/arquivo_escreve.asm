# Este programa escreve um arquivo com o conteudo de um buffer

.data
arquivo_origem: .asciiz "C:\\Users\\1519529\\Documents\\arquivo.txt"      # nome do arquivo e aonde ele 'aponta'
arquivo_destino: .asciiz "C:\\Users\\1519529\\Documents\\arquivo1.txt"
buffer: .space 1024

fim_arquivo_origem: .asciiz "\nChegou ao fim do arquivo origem"
fim_arquivo_destino: .asciiz "\nChegou ao fim do buffer"

.text
  # Abre arquivo
  li   $v0, 13       # chamada de sistema para abrir arquivo
  la   $a0, arquivo_origem  # arquivo de sa�da
  li   $a1, 1        # abertura para escrita (flags s�o 0: read, 1: write)
  li   $a2, 0        # modo ignorado
  syscall            # abre arquivo! (descritor do arquivo retornado em $v0)
  move $s6, $v0      # guarda o descritor do arquivo em $s6 

#le do buffer p/ o arq origem
la $a1, buffer #endereço do buffer para receber a leitura
add $t1, $zero, $zero

 # Escreve no arquivo aberto
 Loop_arq_dest:  li   $v0, 15       # chamada de sistema para escrever arquivo
  		move $a0, $s5     # descritor do arquivo
  		li $a2, 1   #comprimento do buffer
  		syscall            # executa a escrita do arquivo
		addi $a1, $a1, 1  # incrementa endereco  
		addi $t1, $t1, 1  # incrementa endereco  
		beq $v0, 0, eof_arquivo_dest
		j Loop_arq_dest

eof_arquivo_dest: 
	li $v0, 4 #imprime o arquivo destino
	la $a0, fim_arquivo_destino
	li $a2, 1
	syscall
	addi $a1, $a1, 1 

 # Fecha o arquivo 
  li   $v0, 16       # chamada de sistema para fechar o arquivo
  move $a0, $s6      # descritor do arquivo a ser fechado
  syscall            # fecha arquivo!

feito:  
  li $v0, 10
  syscall      	     # feito!
