.data
    S1: .asciiz "Teste para busca de caracteres"
    encontrou: .asciiz "\nEncontrou o caracter "
    nao_encontrou: .asciiz "\nNao encontrou"
    vezes: .asciiz " vez(es)"
    digite: .asciiz "Digite um caracter: "

# lembrar que caracteres ocupam apenas 1 byte na mem�ria

.text
main:
    
    la $a0, digite #chamada de sistema para que carregue a mensagem para a memoria
    li $v0, 4 	 
    syscall #executa um print
    
    li $v0, 12 #espera q o usuario digite um caracter
    syscall
    
    move $a0, $v0
    la $a1, S1  
    
    jal encontra_caracter #chamada de procedimento, "jump and link"
    
    # se $v0=0 indica que nao encontrou o caracter
    # se $v0=1 indica que encontrou o caracter
    beq $v0, $zero, nao  # testa se nao encontrou
    
    la $a0, encontrou 
    li $v0, 4 	 
    syscall
    
    # $v1 contem o numero de incidencias
    move $a0, $v1 #imprime quantas vezes ele contou um caracter
    li $v0, 1 	 
    syscall
    
    la $a0, vezes 
    li $v0, 4 	 
    syscall
   
    j feito
nao: 
    la $a0, nao_encontrou 
    li $v0, 4 	 
    syscall
feito:    
    li $v0, 10
    syscall # feito!

# procedimento "encontra_caracter"

# >>Argumentos
# 1) $a0 conter o caracter a ser procurado na string
# 2) $a1: endereco base de S1 

#>>Retornos
# 1) $v0 sera 0 se nao encontrar o caracter, e 1 se encontrar
# 2) $v1 contabiliza o numero de incidencias do caracter procurado

encontra_caracter: 
     li $v0, 0
     li $v1, 0
     
loop:  lb $t0, 0($a1)
       addi $a1, $a1, 1
       beq $t0, $zero, sai_loop
       beq $t0, $a0, contabiliza
       
       j loop

contabiliza:
      addi $v1, $v1, 1 #incrementa o contador de coincidencias
      li $v0, 1 #quando o $v1 valer 1, o $v0 eh setado para 1
      j loop
      
 sai_loop:
      jr $ra #termina o procedimento