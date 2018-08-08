.macro wait(%tempo)
	li $a0,%tempo
	li $v0,32
	syscall
	.end_macro	
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
    #altern
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
    #add $t1, $t1, 24#mudar cor
    sw $t4, inicio($t1)
    add $t1, $t1, 12
    add $t3,$t3,1
    bne  $t3,7, loop1
    nop
.end_macro
.macro change1(%x)
	move $t4,%x	
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 244
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 240
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 240
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 244
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    sw $t4, inicio($t1)
    nop
.end_macro
.macro adicionar(%linha,%coluna,%cor)
	#2060+lin*2816 +col*36
	#li $t8,%linha
	#li $t9,%coluna
	li $t8,%linha
	li $t9,%coluna
	li $t2,2816
	li $t3,36
	li $t1,524
	mult $t9,$t3   #t8(linha)#t9coluna
	mflo $t3
	add $t1,$t1,$t3
	mult $t8,$t2   #t8(linha)#t9coluna
	mflo $t3
	add $t1,$t1,$t3
	change1(%cor)
	.end_macro
.macro Termino
        li $v0, 10
        syscall
    .end_macro 
.macro 	fundo		
    li $t3,0
   # li $t4, 0x00F7E2C2 #CEAD70 #73A9F1 #423C3E	#FFFFFF #F7E2C2
loop:
    add $t3,$t3,1
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    li $t4, 0x00431521 
    sw $t4, inicio($t1)
    li $t4, 0x00CEADf9
    add $t1, $t1, -4
    add $t1, $t1, 256
    #add $t4,$t4,4090 #linha#1312 #3161#quadriculado24121
    bne $t3, 64, loop 
    nop
    .end_macro
.data
	a: .asciiz "coluna para jogar"
	inicio:.space 16384
.text
main:	
	li $t3, 16384
	li $t6,0
	li $t4, 0x00CEADf9 #CEAD70 #73A9F1 #423C3E	#FFFFFF #F7E2C2		
loope:	li $t1,0
	add $t1,$t8,$t1
	add $t8,$t8,4
	
	li $t4, 0x00431521 
	fundo
	li $t4, 0x00CEADf9
	fundo
	#add $t4,$t4,$t6 #linha#1312 #3161#quadriculado24121
	add $t6,$t6,1
	bne $t6,64,loope 
	nop
	li $t4, 0x00CEADf9 #CEAD70 #73A9F1 #423C3E	#FFFFFF #F7E2C2		
	fundo
	circulo:
	li $t4, 0x001A4471
	li $t1,-764
	li $t2,0
	li $t5, 0x00B99A73 #000000(black)#ffffffwhite#A7ACC1(gray)#0001FE(otherblue)3080D7(blue)   F00500red FFF001(grito)
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
	#add $t4,$t4,15
	bne $t2,6,loop1
	nop
	
	
	li $t5,0x003080d7#cor do jogador 3080D7(blue)   F00500 (red) FFF001(grito)000000(black) ffffff (white)
	adicionar(2,2,$t5)
Termino
