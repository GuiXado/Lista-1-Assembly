# 12.Desenvolver um algoritmo que leia a altura, em centímetros de 15 pessoas. Este programa deverá
# calcular e mostrar:
# a. A menor altura do grupo;
# b. A maior altura do grupo;
.data
	d: .asciiz "Digite a altura em centímetos das 15 pessoas: "
	maiora: .asciiz "\nA altura do maior (em cm) é: "
	menora: .asciiz "\nA altura do menor (em cm) é: "
.text
main:
	li $t0, 0 # t0 pro contador das 15
	
comeco:
	beq $t0, 5, fim #muda pra 15 dpois 
	
	li $v0, 4
	la $a0, d
	syscall
	li $v0, 5
	syscall
	add $s0, $v0, 0

	add $t0, $t0, 1
	
	beq $t0, 1, inicializa

compara:
	
	bgt $s0, $t2, maior
	blt $s0, $t1, menor

	j comeco

inicializa:
	add $t1, $s0, 0
	add $t2, $s0, 0
	j comeco	

menor:
	add $t1, $s0, 0
	j comeco
maior:
	add $t2, $s0, 0
	j comeco
fim:	
	li $v0, 4
	la $a0, menora
	syscall
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	li $v0, 4
	la $a0, maiora
	syscall
	li $v0, 1
	add $a0, $t2, 0
	syscall