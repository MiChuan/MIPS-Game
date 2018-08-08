.macro cb(%cor,%qtd,%prox)
    #li $t5,cor
	li $t3,0
loop:	sw %cor, inicio($s1)
    add $t3, $t3, 1
    add $s1, $s1, 4
	bne $t3,%qtd loop
	nop 
    add $s1, $s1, %prox
	.end_macro
.macro wait(%tempo)
	li $a0,%tempo
	li $v0,32
	syscall
	.end_macro
.macro Termino
        li $v0, 10
        syscall
    .end_macro
.macro fundo(%cor)				
    li $t1, 0
    li $t3, 0
    li $t4,%cor
loop:
    sw $t4, inicio($t1)
    add $t1, $t1, 4
    add $t3, $t3, 1
    add $t4,$t4,-0x00000c00 #linha#1312 #3161#quadriculado24121
    bne $t3,4096, loop 
   nop
     .end_macro 

 
   .macro midi(%nota,%duration,%instrument,%volume)
	li $a0,%nota
	li $a1,%duration
	move $a2,%instrument
	move $a3,%volume
	li $v0,31
	syscall 
	
	.end_macro 

  .data
	inicio:	   .space 16384
	matriz:   .space 168 
	jogador1: .asciiz "jogador 1\n"
	jogador2: .asciiz "jogador 2\n"
	mensagemErro: .asciiz "Esta coluna ja esta ocupada!\nInserir outra\n"
.text
   
   #fundo(0x00FF6F6F) #cor do tabuleiro#CEAD70(mclaro) #FF6F6F(rosa) #73A9F1(azulclaro) #423C3E(mescuro) #FFFFFF(black) #F7E2C2(b)
   jal menu
   nop	 
     
       li $a3,100
       li $a2,56
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
	midi(67,200,$a2,$a3)
	wait(150)
	bne $t1, 2, l
	nop
	bne $a2, 56, loop
	nop
	 li $t1, 0
loop1:
	add $t1, $t1, 1
	midi(62,200,$a2,$a3)
	midi(59,4000,$a2,$a3)
	wait(150)
	midi(62,200,$a2,$a3)
	wait(150)
	midi(74,400,$a2,$a3)
	#midi(59,400,$a2,$a3)
	wait(300)
	#midi(59,200,$a2,$a3)
	midi(69,800,$a2,$a3)
	wait(200)
	#midi(59,400,$a2,$a3)
	wait(400)
	#midi(59,400,$a2,$a3)
	midi(68,400,$a2,$a3)
	wait(300)
	midi(67,400,$a2,$a3)
	#midi(59,400,$a2,$a3)
	wait(300)
	#midi(59,400,$a2,$a3)
	midi(65,400,$a2,$a3)
	wait(300)
	#midi(59,400,$a2,$a3)
	midi(62,200,$a2,$a3)
	wait(150)
	#midi(59,200,$a2,$a3)
	midi(65,200,$a2,$a3)
	wait(150)
	#midi(59,400,$a2,$a3)
	midi(67,200,$a2,$a3)
	wait(150)
	midi(67,200,$a2,$a3)
	wait(150)
	bne $t1, 1, loop1
	nop
   #jogar(0x00FFFFFF)
   #comojogar(0x00FFFFFF)
Termino
menu:	fundo(0x00bc4B7cc) ##C3E7AAgreen##F6B760or
		li $t5,0x00e5c53e#F3D63A #0(black)#F6F03Cyellow
		li $s1,2400
	#4-
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
	cb($t5,1,2040)
	add $t5,$t5,0x00050505
	li $t5,0x00F6F03C #0(black)#F6F03Cyellow	
	#2players
	cb($t5,5,236)
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
	cb($t5,7,-2820)
	li $t5,0x00E31A22#E31A22red
	cb($t5,5,236)
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
	cb($t5,7,1500)
	li $t5,0x00080DCB#080DCB blue
	cb($t5,5,232)#?
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
	cb($t5,2,500)
	li $a2,117
	wait(400)
	midi(124,500,$a2,$a3)
	jr $ra	                        
	nop	 









.macro print_str (%str)
	.data
myLabel: .asciiz %str
	.text
	li $v0, 4
	la $a0, myLabel
	syscall
	.end_macro
	#print_str ("test1")	#"test1" will be labeled with name "myLabel_M0"
	#print_str ("test2")
	.macro inserirint (%str)
	.data
te: .asciiz %str
	.text
	la $a0,te
	li $v0,4
	syscall
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

#	inserirint("coluna")
#	confirmdialog("col")
  .text
main:
   teqi $t0,0     # immediately trap because $t0 contains 0
   li   $v0, 10   # After return from exception handler, specify exit service
   syscall        # terminate normally

# Trap handler in the standard MIPS32 kernel text segment

   .ktext 0x80000180
   move $k0,$v0   # Save $v0 value
   move $k1,$a0   # Save $a0 value
   la   $a0, msg  # address of string to print
   li   $v0, 4    # Print String service
   syscall
   move $v0,$k0   # Restore $v0
   move $a0,$k1   # Restore $a0
   mfc0 $k0,$14   # Coprocessor 0 register $14 has address of trapping instruction
   addi $k0,$k0,4 # Add 4 to point to next instruction
   mtc0 $k0,$14   # Store new address back into $14
   eret           # Error return; set PC to value in $14
   .kdata	
msg:   
   .asciiz "Trap generated"
   Termino    
	
