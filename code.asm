.macro midi(%nota,%duration,%instrument,%volume)
	li $a0,%nota
	li $a1,%duration
	move $a2,%instrument
	move $a3,%volume
	mul $a3,$a3,$k1
	li $v0,31
	syscall 
	
	.end_macro 
.macro cb(%cor,%qtd,%prox)
    
	li $s1,0
loop:	sw %cor, inicio($t1)
    add $s1, $s1, 1
    add $t1, $t1, 4 
	bne $s1,%qtd loop
	nop 
    add $t1, $t1, %prox
	.end_macro
.macro wait(%tempo)
	li $a0,%tempo
	li $v0,32
	syscall
	.end_macro
.macro inserirint (%str)
	.data
te: .asciiz %str
	.text
	la $a0,te
	li $v0,51
	syscall
	.end_macro
	
.macro confirmdialog (%tex)
	.data
textoo: .asciiz %tex
	.text
	la $a0,textoo
	li $v0,50
	syscall
	.end_macro	
.macro msgdialog (%tex,%err0inf1war2quest3)
	.data
textoo: .asciiz %tex
	.text
	li $a1,%err0inf1war2quest3
	la $a0,textoo
	li $v0,55
	syscall
	.end_macro	
	#
	
	
	

.macro topo(%x)
	li $t3,0
add $t1,$t1,4
loop1:
	
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 28
    add $t3,$t3,1
    bne  $t3,7, loop1
    nop
.end_macro
.macro subtopo(%x)
	li $t3,0
	loop1:
	
    sw $t4, inicio($t1)
    move $t4,%x
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
     add $t1, $t1, 4
    sw $t4, inicio($t1)
     add $t1, $t1, 4
    sw $t4, inicio($t1)
    li $t4, 0x001A4471 
    sw $t4, inicio($t1)
    add $t1, $t1, 20
    add $t3,$t3,1
    bne  $t3,7, loop1
    nop
.end_macro
.macro lado(%x)
	li $t3,0
	loop1:
	
    sw $t4, inicio($t1)
    
    move $t4,%x
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    li $t4, 0x001A4471 
    
    sw $t4, inicio($t1)
    add $t1, $t1, 12
    add $t3,$t3,1
    bne  $t3,7, loop1
    nop
.end_macro
.macro change1(%x)
	move $t5,%x	
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 244
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 240
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 240
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 244
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    add $s1, $s1, 4
    sw $t5, inicio($s1)
    nop
.end_macro
.macro adicionar(%linha,%coluna,%cor)
	
	
	
	li $t2,2816
	li $t3,36
	li $s1,524
	mult %coluna,$t3   
	mflo $t3
	add $s1,$s1,$t3
	mult %linha,$t2   
	mflo $t3
	add $s1,$s1,$t3
	li $a2,78
	li $a3,20
	midi(62,200,$a2,$a3)
	wait(150)
	change1(%cor)
	.end_macro
.macro Termino
        li $v0, 10
        syscall
    .end_macro
.macro fundo(%cor,%distor)				
    li $t1, 0
    li $t2, 4
    li $t3, 16384
    li $t4, %cor
loop:
    sw $t4, inicio($t1)
    add $t1, $t1, $t2
    add $t4,$t4,%distor 
    bne $t1, $t3, loop 
    nop
   .end_macro 

.data
	inicio:	   .space 16384
	matriz:   .space 168 
	jogador1: .asciiz "jogador 1\n"
	jogador2: .asciiz "jogador 2\n"
	mensagemErro: .asciiz "Esta coluna ja esta ocupada!\nInserir outra\n"
.text


	li $k1,1
m: 
	
	jal menu
	nop
jog:	wait(500)
 	jal jogo
  	 nop
   
   li $s2,0
   li $s3,0
inicializa: 	beq $s3,168,fi
		nop
		sw $0,matriz($s3)
  	 	add $s3,$s3,4
   		j inicializa
  	 	nop
fi:     li $s3,0
t: 	beq $s3,42,end
		nop	
		div $t2, $s3, 2
		mfhi $t2
		beq $t2, 0, Jog1
		nop
Jog2:			
			
			
repete:			
			
			
			inserirint("          Jogador 2\nEm qual coluna deseja jogar?")
			blt $a1,0,sair
			nop
			blt $a0,8,menorq8
			nop
			msgdialog ("Coluna inexistente!\nInsira outra.",2)
			j repete
			nop
menorq8:
			bgt $a0,0,maiorq0
			nop
			msgdialog ("Coluna inexistente!\nInsira outra.",2)
			j repete
			nop
maiorq0:		j vP2
			nop
sair:			confirmdialog("Deseja parar de jogar?")
			beq $a0,0,m
			nop
			j repete
			nop								
vP2:			
			add $t0, $a0,-1
			jal verificaPosicao2
			nop
			beq $t7, 1, repete
			nop
			li $t8,2
			j test
			nop
							
Jog1:			
repete1:			
			inserirint("          Jogador 1\nEm qual coluna deseja jogar?")
			blt $a1,0,sair1
			nop
			blt $a0,8,menorq81
			nop
			msgdialog ("Coluna inexistente!\nInsira outra",2)
			j repete1
			nop
menorq81:
			bgt $a0,0,maiorq01
			nop
			msgdialog ("Coluna inexistente!\nInsira outra",2)
			j repete1
			nop
maiorq01:		j vP1
			nop
sair1:			confirmdialog("Deseja parar de jogar?")
			beq $a0,0,m
			nop
			j repete1
			nop		
vP1:
			add $t0, $a0,-1
			jal verificaPosicao1
			nop
			beq $t7, 1, repete1				
			nop
			li $t8,1
			
			
test:		add $s3, $s3, 1
		jal testwin
		nop
		jal quemGanhou
		nop
		j t
		nop	
end:	li $s2,3
	jal quemGanhou
	nop
	Termino


testwin:	
		
		
		
		 
diagonal1:	li $k0,0
		li $s4,1
		li $s5,1
diag1:		beq $s4, 4, win
		nop
		sll $t6,$s4,3
		sub $t6,$t6,$s4
		sll $t6,$t6,2
		add $t7,$t9,$t6
		sll $t6,$s5,2
		add $t7,$t7,$t6
		div $t6,$t7,28
		mfhi $t6
		div $s0,$t9,28
		mfhi $s0
		srl $s0,$s0,2
		srl $t6,$t6,2
		add $s0,$s0,$s4 
		
		bne $t6,$s0,oldiag1
		nop
		div $t6,$t7,28
		
		div $s0,$t9,28
		
		
		
		add $s0,$s0,$s4 
		
		bne $t6,$s0,oldiag1
		nop
			blt $s7,165,menorq165
			nop
			j oldiag1
			nop
menorq165:
			bgt $s7,-1,maiorqm1
			nop
			j oldiag1
			nop
maiorqm1:		lw $t6,matriz($t7)
			bne $t6,$t8,oldiag1
			nop
			add $s4,$s4,1
			add $s5,$s5,1
			j diag1
			nop

oldiag1:	li $k0,1
		move $s6,$s4
		li $s4,-1
		li $s5,-1
old1:		beq $s6, 4, win
		nop
		sll $t6,$s4,3
		sub $t6,$t6,$s4
		sll $t6,$t6,2
		add $t7,$t9,$t6
		sll $t6,$s5,2
		add $t7,$t7,$t6
		div $t6,$t7,28
		mfhi $t6
		div $s0,$t9,28
		mfhi $s0
		srl $s0,$s0,2
		srl $t6,$t6,2
		add $s0,$s0,$s4 
		
		bne $t6,$s0,horizontal
		nop
		div $t6,$t7,28
		
		div $s0,$t9,28
		
		
		
		add $s0,$s0,$s4 
		
		bne $t6,$s0,horizontal
		nop
			blt $s7,165,menorq16
			nop
			j horizontal
			nop
menorq16:
			bgt $s7,-1,maiorqm
			nop
			j horizontal
			nop
maiorqm:		lw $t6,matriz($t7)
			bne $t6,$t8,horizontal
			nop
			
			
			add $s4,$s4,-1
			add $s5,$s5,-1
			add $s6,$s6,1
			j old1
			nop
vertical:	li $k0,2
		li $s4,1
		
vert:		beq $s4, 4, win
		nop
		
		sll $t6,$s4,3
		sub $t6,$t6,$s4
		sll $t6,$t6,2
		add $t7,$t9,$t6
		
		
		div $t6,$t7,7
		mfhi $t6
		div $s0,$t9,7
		mfhi $s0
		bne $t6,$s0,olver
		nop
			blt $s7,165,norq165
			nop
			j olhor
			nop
norq165:
			bgt $s7,-1,iorqm1
			nop
			j olver
			nop
iorqm1:			lw $t6,matriz($t7)
			bne $t6,$t8,olver
			nop
			add $s4,$s4,1
			
			j vert
			nop

olver:		move $s6,$s4
		li $k0,3
		li $s4,-1
		
olv:		beq $s6, 4, win
		nop
		sll $t6,$s4,3
		sub $t6,$t6,$s4
		sll $t6,$t6,2
		add $t7,$t9,$t6
		
		
		div $t6,$t7,28
		mfhi $t6
		div $s0,$t9,28
		mfhi $s0
		bne $t6,$s0,diagonal2
		nop
			blt $s7,165,menorq
			nop
			j diagonal2
			nop
menorq:
			bgt $s7,-1,maior
			nop
			j diagonal2
			nop
maior:		lw $t6,matriz($t7)
			bne $t6,$t8,diagonal2
			nop
			
			
			add $s4,$s4,-1
			
			add $s6,$s6,1
			j olv
			nop
horizontal:	li $k0,4
		
		li $s5,1
hor:		beq $s5, 4, win
		nop
		
		
		
		
		sll $t6,$s5,2
		
		add $t7,$t9,$t6
		div $t6,$t7,28
		
		div $s0,$t9,28
		
		bne $t6,$s0,olhor
		nop
			blt $s7,165,enorq165
			nop
			j olhor
			nop
enorq165:
			bgt $s7,-1,aiorqm1
			nop
			j olhor
			nop
aiorqm1:		lw $t6,matriz($t7)
			bne $t6,$t8,olhor
			nop
			
			add $s5,$s5,1
			j hor
			nop

olhor:	move $s6,$s5
		li $k0,5
		
		li $s5,-1
olh:		beq $s6, 4, win
		nop
		
		
		
		
		sll $t6,$s5,2
		
		add $t7,$t9,$t6
		div $t6,$t7,28
		
		div $s0,$t9,28
		
		bne $t6,$s0,vertical
		nop
			blt $s7,165,menorq1
			nop
			j vertical
			nop
menorq1:
			bgt $s7,-1,maiorq
			nop
			j vertical
			nop
maiorq:		lw $t6,matriz($t7)
			bne $t6,$t8,vertical
			nop
			
			
			
			add $s5,$s5,-1
			add $s6,$s6,1
			j olh
			nop
diagonal2:	li $s4,1
		li $k0,6
		li $s5,-1
diag2:		beq $s4, 4, win
		nop
		sll $t6,$s4,3
		sub $t6,$t6,$s4
		sll $t6,$t6,2
		add $t7,$t9,$t6
		sll $t6,$s5,2
		add $t7,$t7,$t6
		div $t6,$t7,28
		mfhi $t6
		div $s0,$t9,28
		mfhi $s0
		srl $s0,$s0,2
		srl $t6,$t6,2
		sub $s0,$s0,$s4 
		
		bne $t6,$s0,oldiag2
		nop
		div $t6,$t7,28
		
		div $s0,$t9,28
		
		
		
		add $s0,$s0,$s4 
		
		bne $t6,$s0,oldiag2
		nop
			blt $s7,165,orq165
			nop
			j oldiag2
			nop
orq165:
			bgt $s7,-1,orqm1
			nop
			j oldiag2
			nop
orqm1:			lw $t6,matriz($t7)
			bne $t6,$t8,oldiag2
			nop
			add $s4,$s4,1
			add $s5,$s5,-1
			j diag2
			nop

oldiag2:	move $s6,$s4
		li $s4,-1
		li $k0,7
		li $s5,1
old2:		beq $s6, 4, win
		nop
		sll $t6,$s4,3
		sub $t6,$t6,$s4
		sll $t6,$t6,2
		add $t7,$t9,$t6
		sll $t6,$s5,2
		add $t7,$t7,$t6
		div $t6,$t7,28
		mfhi $t6
		div $s0,$t9,28
		mfhi $s0
		srl $s0,$s0,2
		srl $t6,$t6,2
		sub $s0,$s0,$s4 
		
		bne $t6,$s0,fimtest
		nop
		div $t6,$t7,28
		
		div $s0,$t9,28
		
		
		
		add $s0,$s0,$s4 
		
		bne $t6,$s0,fimtest
		nop

			blt $s7,165,menor
			nop
			j fimtest
			nop
menor:
			bgt $s7,-1,maio
			nop
			j fimtest
			nop
maio:		lw $t6,matriz($t7)
			bne $t6,$t8,fimtest
			nop
			
			
			add $s4,$s4,-1
			add $s5,$s5,1
			add $s6,$s6,1
			j old2
			nop

win:		beq $t8,1,cor1w
		nop
		li $t5,0x00A6231B
		j beqsk
		nop
cor1w:		li $t5,0x00BB9B4C
beqsk:		beq $k0,0,finaldd1
		nop
		beq $k0,1,finalds1
		nop
		beq $k0,6,finaldd2
		nop
		beq $k0,7,finalds2
		nop
		beq $k0,4,finalhd
		nop
		beq $k0,5,finalhs
		nop
		beq $k0,2,finalvd
		nop
		beq $k0,3,finalvs
		nop
		
finalds1:	li $t6,7
		srl $t7,$t7,2
		div $t7,$t6
		mfhi $t6
		mflo $t7
		adicionar($t7,$t6,$t5)
		add $t6,$t6,1
		add $t7,$t7,1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,1
		add $t7,$t7,1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,1
		add $t7,$t7,1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,1
		add $t7,$t7,1
		j finalfinal
		nop
finaldd1:	li $t6,7
		srl $t7,$t7,2
		div $t7,$t6
		mfhi $t6
		mflo $t7
		adicionar($t7,$t6,$t5)
		add $t6,$t6,-1
		add $t7,$t7,-1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,-1
		add $t7,$t7,-1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,-1
		add $t7,$t7,-1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,-1
		add $t7,$t7,-1	
		j finalfinal
		nop	
finalds2:	li $t6,7
		srl $t7,$t7,2
		div $t7,$t6
		mfhi $t6
		mflo $t7
		adicionar($t7,$t6,$t5)
		add $t6,$t6,-1
		add $t7,$t7,1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,-1
		add $t7,$t7,1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,-1
		add $t7,$t7,1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,-1
		add $t7,$t7,1
		j finalfinal
		nop
finaldd2:	li $t6,7
		srl $t7,$t7,2
		div $t7,$t6
		mfhi $t6
		mflo $t7
		adicionar($t7,$t6,$t5)
		add $t6,$t6,1
		add $t7,$t7,-1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,1
		add $t7,$t7,-1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,1
		add $t7,$t7,-1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,1
		add $t7,$t7,-1
		j finalfinal
		nop		
finalhs:	li $t6,7
		srl $t7,$t7,2 
		div $t7,$t6
		mfhi $t6
		mflo $t7
		adicionar($t7,$t6,$t5)
		add $t6,$t6,1
		add $t7,$t7,0
		adicionar($t7,$t6,$t5)
		add $t6,$t6,1
		add $t7,$t7,0
		adicionar($t7,$t6,$t5)
		add $t6,$t6,1
		add $t7,$t7,0
		adicionar($t7,$t6,$t5)
		add $t6,$t6,1
		add $t7,$t7,0
		j finalfinal
		nop
finalhd:	li $t6,7
		srl $t7,$t7,2
		div $t7,$t6
		mfhi $t6
		mflo $t7
		adicionar($t7,$t6,$t5)
		add $t6,$t6,-1
		add $t7,$t7,0
		adicionar($t7,$t6,$t5)
		add $t6,$t6,-1
		add $t7,$t7,0
		adicionar($t7,$t6,$t5)
		add $t6,$t6,-1
		add $t7,$t7,0
		adicionar($t7,$t6,$t5)
		add $t6,$t6,-1
		add $t7,$t7,0
		j finalfinal
		nop
finalvs:	li $t6,7
		srl $t7,$t7,2
		div $t7,$t6
		mfhi $t6
		mflo $t7
		adicionar($t7,$t6,$t5)
		add $t6,$t6,0
		add $t7,$t7,1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,0
		add $t7,$t7,1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,0
		add $t7,$t7,1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,0
		add $t7,$t7,1
		j finalfinal
		nop
finalvd:	li $t6,7
		srl $t7,$t7,2
		div $t7,$t6
		mfhi $t6
		mflo $t7
		adicionar($t7,$t6,$t5)
		add $t6,$t6,0
		add $t7,$t7,-1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,0
		add $t7,$t7,-1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,0
		add $t7,$t7,-1
		adicionar($t7,$t6,$t5)
		add $t6,$t6,0
		add $t7,$t7,-1			
		
finalfinal:		
		      li $a3,80
       li $a2,45
       li $t1, 0
loop:
	add $a2, $a2, 1
	li $t1,0
l:	add $t1, $t1, 1
	midi(62,200,$a2,$a3)
	wait(150)
	midi(62,200,$a2,$a3)
	wait(150)
	midi(74,400,$a2,$a3)
	wait(300)
	midi(69,800,$a2,$a3)
	wait(600)
	midi(68,400,$a2,$a3)
	wait(300)
	midi(67,400,$a2,$a3)
	wait(300)
	midi(65,400,$a2,$a3)
	wait(300)
	midi(62,200,$a2,$a3)
	wait(150)
	midi(65,200,$a2,$a3)
	wait(150)
	midi(67,200,$a2,$a3)
	wait(150)
	midi(67,2000,$a2,$a3)
	wait(150)
	bne $t1,1, l
	nop
		
		move $s2,$t8
fimtest:	jr $ra
		nop



verificaPosicao1:li $t9,140
		li $t7, 0
		li $t6,0
		sll $t0,$t0,2
		add $t9,$t0,$t9
ew:		lw $t8,matriz($t9)
		beq $t6, 6, erro
		nop
			beq $zero,$t8,insere
			nop
			addi $t9,$t9, -28
			addi $t6, $t6, 1
			j ew
			nop
insere:		li $t8, 1
		sw $t8,matriz($t9)
		srl $t0,$t0,2
		
		add $t6,$t6,-6
		not $t6,$t6
		li $t5,0x00BEA722
		adicionar($t6,$t0,$t5)
		wait(100)
		li $t5,0x00FFF001	
		adicionar($t6,$t0,$t5)
		jr $ra
		nop
		
		
erro: 		li $t7,1 
		
		
		
		msgdialog ("       Coluna cheia!\nInsira em outra.",2)
		jr $ra	
		nop	


										
verificaPosicao2:    	li $t9,140      
		li $t6,0
		li $t7, 0                       
		sll $t0,$t0,2                   
		add $t9,$t0,$t9                 
ew1:		lw $t8,matriz($t9)          
		beq $t6, 6, erro1               
		nop                             
			beq $zero,$t8,insere1       
			nop                         
			addi $t9,$t9, -28           
			addi $t6, $t6, 1            
			j ew1                       
			nop                         
insere1:	li $t8, 2                   
		sw $t8,matriz($t9)              
		srl $t0,$t0,2					
		add $t6,$t6,-6
		not $t6,$t6
		li $t5,0x00A4372E
		adicionar($t6,$t0,$t5)          
		wait(100)
		li $t5,0x00F00500		
		adicionar($t6,$t0,$t5)          
		jr $ra
		nop   							
erro1: 		li $t7,1                    
		
		
		
		msgdialog ("       Coluna cheia!\nInsira em outra.",2)               
		jr $ra	                        
		nop	                            
		                                
quemGanhou:    	beq $s2,0,t
		nop
		
		fundo(0x0012f3Df,-0x00010000)
		wait(5)
		fundo(0x0012f3Df,-0x00020000)
		wait(5)
		fundo(0x0012f3Df,-0x00050000)
		wait(5)
		fundo(0x0012f3Df,-0x00060000)
		wait(5)
		fundo(0x0012f3Df,-0x00030000)
		wait(5)
		fundo(0x0012f3Df,-0x00070000)
		wait(5)			
		fundo(0x0012f3Df,-0x00000101)
		li $t1,1900
		li $t5,0x00E1C800
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,184)
		cb($t5,18,184)
		cb($t5,18,184)
		cb($t5,18,184)
		
		
		beq $s2,2,jog2ganhou
		nop
		beq $s2,3,empate
		nop
jog1ganhou:	
		li $t5,0x00FFF001		
		li $t6,0
		li $t0,3
		adicionar($t6,$t0,$t5)
		li $t5,0x00F00500		
		li $t6,1
		li $t0,2
		adicionar($t6,$t0,$t5)
		msgdialog ("Jogador 1 Venceu!\n",1)
		j final
		nop
jog2ganhou:	
		li $t5,0x00F00500		
		li $t6,0
		li $t0,3
		adicionar($t6,$t0,$t5)
		li $t5,0x00Fff001		
		li $t6,1
		li $t0,2
		adicionar($t6,$t0,$t5)
		msgdialog ("Jogador 2 Venceu!\n",1)
		j final
		nop
empate:		
		li $t1,1864
		li $t5,0x00E1C800
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		cb($t5,9,220)
		li $t5,0x00F00500		
		li $t6,0
		li $t0,3
		adicionar($t6,$t0,$t5)
		li $t5,0x00Fff001		
		li $t6,0
		li $t0,2
		adicionar($t6,$t0,$t5)
		msgdialog ("Empate!\n",1)
final:		
		li $t1,10180
		li $t5,0x003DFF4F
		cb($t5,8,220)
		cb($t5,2,24)
		cb($t5,2,212)
		cb($t5,2,32)
		
		
		cb($t5,1,208)
		cb($t5,2,28)
		cb($t5,5,200)
		cb($t5,2,32)
		cb($t5,3,200)
		cb($t5,2,40)
		cb($t5,2,200)
		cb($t5,2,248)
		cb($t5,2,248)
		cb($t5,2,36)
		cb($t5,2,208)
		cb($t5,2,28)
		cb($t5,2,216)
		cb($t5,2,20)
		cb($t5,2,224)
		cb($t5,8,212)
		
		
		confirmdialog("Deseja jogar denovo?")
			beq $a0,0,jog
			nop
			
			j menu
			nop
		
		jr $ra                  
		nop   
		
		                          
		                                                                              
menu:	fundo(0x00bc4B7cc,-0x00000c00) 
		li $t5,0x00F6F03C
		li $t1,1632
	
	li $a3,100
       li $a2,127
	cb($t5,4,236)
	add $t5,$t5,-0x00050505
	cb($t5,4,236)
	add $t5,$t5,-0x00050505
	cb($t5,2,4)
	add $t5,$t5,-0x00050505
	cb($t5,1,236)
	add $t5,$t5,-0x00050505
	cb($t5,2,8)
	midi(62,200,$a2,$a3)
	wait(150)
	add $t5,$t5,-0x00050505
	cb($t5,1,232)
	midi(62,200,$a2,$a3)
	wait(150)
	add $t5,$t5,-0x00050505
	cb($t5,2,12)
	midi(62,400,$a2,$a3)
	wait(300)
	add $t5,$t5,-0x00050505
	cb($t5,1,36)
	midi(74,4000,$a2,$a3)
	add $t5,$t5,-0x00050505
	cb($t5,10,152)
	add $t5,$t5,-0x00050505
	cb($t5,2,12)
	add $t5,$t5,-0x00050505
	cb($t5,2,4)
	add $t5,$t5,-0x00050505
	cb($t5,15,160)
	add $t5,$t5,0x00050505
	cb($t5,20,200)
	add $t5,$t5,0x00050505
	cb($t5,1,252)
	add $t5,$t5,0x00050505
	cb($t5,1,2044)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	li $t5,0x00F6F03C 
	
	cb($t5,3,240)
	cb($t5,5,236)
	cb($t5,5,236)
	cb($t5,5,236)
	cb($t5,5,240)
	cb($t5,3,240)
	cb($t5,5,236)
	cb($t5,5,232)
	cb($t5,7,228)
	cb($t5,7,228)
	cb($t5,7,228)
	cb($t5,7,-2580)
	li $t5,0x00F5D13F
	
	cb($t5,3,240)
	cb($t5,5,236)
	cb($t5,5,240)
	cb($t5,3,248)
	cb($t5,1,248)
	cb($t5,3,244)
	cb($t5,3,240)
	cb($t5,5,236)
	cb($t5,5,236)
	cb($t5,5,236)
	cb($t5,5,-2812)
	li $t5,0x00F3362A
	cb($t5,3,240)
	cb($t5,5,236)
	cb($t5,5,236)
	cb($t5,5,236)
	cb($t5,5,240)
	cb($t5,3,240)
	cb($t5,5,236)
	cb($t5,5,232)
	cb($t5,7,228)
	cb($t5,7,228)
	cb($t5,7,228)
	cb($t5,7,-2580)
	li $t5,0x00E31A22
	
	cb($t5,3,240)
	cb($t5,5,236)
	cb($t5,5,240)
	cb($t5,3,248)
	cb($t5,1,248)
	cb($t5,3,244)
	cb($t5,3,240)
	cb($t5,5,236)
	cb($t5,5,236)
	cb($t5,5,236)
	cb($t5,5,1500)
	li $t5,0x00ffffff
	cb($t5,5,232)
	cb($t5,7,228)
	cb($t5,2,12)
	cb($t5,2,228)
	cb($t5,2,12)
	cb($t5,2,244)
	cb($t5,3,240)
	cb($t5,3,240)
	cb($t5,3,244)
	cb($t5,2,248)
	cb($t5,2,504)
	cb($t5,2,248)
	cb($t5,2,-3084)
	li $t5,0x00080DCB
	cb($t5,5,232)
	cb($t5,7,228)
	cb($t5,2,12)
	cb($t5,2,228)
	cb($t5,2,12)
	cb($t5,2,244)
	cb($t5,3,240)
	cb($t5,3,240)
	cb($t5,3,244)
	cb($t5,2,248)
	cb($t5,2,504)
	cb($t5,2,248)
	cb($t5,2,340)
	
	li $t5,0x00ffffff
	
	cb($t5,1,244)
	cb($t5,1,4)
	cb($t5,1,4)
	cb($t5,1,232)
	cb($t5,1,8)
	cb($t5,1,8)
	cb($t5,1,228)
	cb($t5,1,20)
	cb($t5,1,228)
	cb($t5,1,20)
	cb($t5,1,232)
	cb($t5,1,12)
	cb($t5,1,240)
	cb($t5,3,-1808)
	li $t5,0x00E31A22
	
	cb($t5,5,232)
	cb($t5,3,4)
	cb($t5,3,224)
	cb($t5,2,4)
	cb($t5,1,4)
	cb($t5,1,4)
	cb($t5,2,220)
	cb($t5,1,4)
	cb($t5,2,4)
	cb($t5,2,4)
	cb($t5,1,220)
	cb($t5,1,4)
	cb($t5,5,4)
	cb($t5,1,220)
	cb($t5,1,4)
	cb($t5,5,4)
	cb($t5,1,220)
	cb($t5,2,4)
	cb($t5,3,4)
	cb($t5,2,224)
	cb($t5,2,12)
	cb($t5,2,232)
	cb($t5,5,-2228)
	
	
	
	li $t5,0x00
	cb($t5,1,252)
	cb($t5,2,248)
	cb($t5,1,4)
	cb($t5,1,244)
	cb($t5,1,4)
	cb($t5,1,244)
	cb($t5,1,4)
	cb($t5,1,244)
	cb($t5,1,244)
	cb($t5,3,240)
	cb($t5,4,240)
	cb($t5,3,-2052)	
mute:	beq $k1,1,menuop
	nop
	li $t5,0x00E31A22
	cb($t5,3,240)
	cb($t5,1,12)
	cb($t5,1,232)
	cb($t5,1,16)
	cb($t5,2,224)
	cb($t5,1,16)
	cb($t5,1,8)
	cb($t5,1,220)
	cb($t5,1,12)
	cb($t5,1,12)
	cb($t5,1,220)
	cb($t5,1,8)
	cb($t5,1,16)
	cb($t5,1,224)
	cb($t5,2,16)
	cb($t5,1,232)
	cb($t5,1,12)
	cb($t5,1,240)
	cb($t5,3,221)
	li $a2,117
	wait(400)
	midi(124,500,$a2,$a3)
	wait(400)
	
menuop:	inserirint("                4 EM LINHA\n\n1) JOGAR\n2) AJUDA\n3) ON/OFF SOM\n4) SAIR\n")
	blt $a1,0,eqnone
			nop
			beq $a0,1,eq1
			nop
			beq $a0,2,eq2
			nop
			beq $a0,3,eq3
			nop
			beq $a0,4,eq4
			nop
			msgdialog ("              Opção inválida!\nInsira outra opção.",2)
			j menuop
			nop
eq1:			
			j jog 
			nop
eq2:			li $a2,45
			li $a3,100
			midi(70,2000,$a2,$a3)
			msgdialog ("                      AJUDA\n\n    Forme 4 peças da sua cor em sequência \nem qualquer direção antes de seu adversário\n\n",1)
			j menuop
			nop
eq3:			
			beq $k1,1,silencio
			nop
			li $k1,1
			j nsile
			nop
silencio:		li $k1,0
			j mute
			nop
nsile:			j menu
			nop

eq4:			confirmdialog("Deseja sair do jogar?")
			bne $a0,0,menuop
			nop	
			Termino
eqnone:			beq $a1,-2,eq4
			nop
			msgdialog ("              Opção inválida!\nInsira outra opção",2)
			j menuop
			nop		


jogo:	
	fundo(0x0073A9F1,0) 
	circulo:
	li $t4, 0x001A4471
	li $t1,-764
	li $t2,0
	li $t5, 0x003080D7 
	loop1:
	add $t1,$t1,1024
	add $t1,$t1,4
	topo($t5)
	subtopo($t5)
	lado($t5)
	add $t1,$t1,4
	lado($t5)
	add $t1,$t1,4
	lado($t5)
	add $t1,$t1,8
	subtopo($t5)
	add $t1,$t1,4
	topo($t5)
	add $t1,$t1,-4
	add $t2,$t2,1
	add $t5,$t5,-10
	
	bne $t2,6,loop1
	nop
	jr $ra
	nop
