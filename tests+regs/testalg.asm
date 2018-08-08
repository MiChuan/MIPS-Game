.data
	matriz:   .space 168 
	jogador1: .asciiz "jogador 1\n"
	jogador2: .asciiz "jogador 2\n"
	mensagemErro: .asciiz "Esta coluna já está ocupada!\nInserir outra\n"
.text
#ori $t0, $0, 42 #tamanho da matriz ($t3)(Linha-1)*7 + ($t0)Coluna
#inicilalizar matriz tu cria 


t: 	beq $t1,42,end
		nop	
		div $t2, $t1, 2
		mfhi $t2
		beq $t2, $0, Jog1
			nop
Jog2:			la $a0, jogador2
			li $v0, 4
			syscall
repete:			li $v0, 5#limit 0<x<8
			syscall	
			addi $t0, $v0,-1
			jal verificaPosicao2
			nop
			beq $t7, 1, repete
			nop
			j test
			nop			
Jog1:			la $a0, jogador1
			li $v0, 4
			syscall
repete1:		li $v0, 5#limit 0<x<8
			syscall	
			addi $t0, $v0,-1
			jal verificaPosicao1
			nop
			beq $t7, 1, repete1				
			nop
test:		jal quemGanhou
		nop
		addi $t1, $t1, 1
		j t
		nop	
end: li $v0, 10
syscall	

#testa se o jogador 1 venceu---------------------------------------------------------------------------------------
testwin1:	la $s0, matriz+42	#s0   m[41]
		la $s1, matriz		#s1   m[0]
		move $s2,$s0 
		#percorrer ao contrario 
pmac1:		beq $s2,$s1,fimtest1
		nop
			beq $s2,1,verifica
			j pmac1
			nop
verifica:	#todos os lados
		
		j pmac1
		nop
fimtest1:	jr $ra
		nop
#-------------------------------------------------\\--------------------------------------------------------------

#verifica se a posição desejada já está ocupada-------------------------------------------------------------------
verificaPosicao1:    	li $t9,140
		li $t7, 0
		sll $t0,$t0,2
		add $t9,$t0,$t9
ew:		lw $t8,matriz($t9)
		beq $t7, 6, erro
		nop
			beq $zero,$t8,insere
			nop
			addi $t9,$t9, -28
			addi $t7, $t7, 1
			j ew
			nop
insere:		li $t8, 1
		sw $t8,matriz($t9)
		jr $ra
		nop
		
		
erro: 		li $t7,1 #retorno da função
		la $a0, mensagemErro
		li $v0, 4
		syscall
		jr $ra	
		nop	

#-------------------------//-----------------------------------------------------------
				
verificaPosicao2:    	li $t9,140
		li $t7, 0
		sll $t0,$t0,2
		add $t9,$t0,$t9
ew1:		lw $t8,matriz($t9)
		beq $t7, 6, erro1
		nop
			beq $zero,$t8,insere1
			nop
			addi $t9,$t9, -28
			addi $t7, $t7, 1
			j ew1
			nop
insere1:	li $t8, 2
		sw $t8,matriz($t9)
		jr $ra
		nop
		
		
erro1: 		li $t7,1
		la $a0, mensagemErro
		li $v0, 4
		syscall
		jr $ra	
		nop	
		
quemGanhou:    	jr $ra
		nop
