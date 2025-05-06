.data
    paridade: .asciiz "Bit de paridade (p/ paridade PAR): "

.text
    main:
        # Carrega a palavra de 32 bits no registrador $s0
        li $s0, 0x0000000e    # 00001110

        li $t0, 0             # Contador de bits 1
        li $t1, 32            
        
    calcula:
        beqz $t1, feito         

        # XOR o bit menos significativo de $s0 com o contador de bits 1
        andi $t2, $s0, 1      # Pega o bit menos significativo de $s0
        xor  $t0, $t0, $t2   

        srl  $s0, $s0, 1      # Desloca a palavra p/ a direita (descarta o bit analisado)
        subi $t1, $t1, 1      # Diminui o contador de bits restantes
        j calcula

    feito:
        andi $t3, $t0, 1      # Se $t0 for ímpar (1), então t3 = 1, caso contrário t3 = 0

        # Imprime
        li $v0, 4
        la $a0, paridade
        syscall

        # Imprime o valor do bit de paridade
        li $v0, 1
        move $a0, $t3
        syscall

        # Finaliza o programa
        li $v0, 10
        syscall
