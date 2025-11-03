#11.Escrever um algoritmo que leia uma quantidade desconhecida de números e conte quantos deles
#estão nos seguintes intervalos: [0-25], [26-50], [51-75] e [76-100]. 
#A entrada de dados deve terminar quando for lido um número negativo.
#*Sabe-se que a entrada deve ser um número entre 0 e 100, validar a entrada para que não permita
#números fora deste intervalo
.data
	n: .asciiz "Digite um número (negativo sai): "
	np: .asciiz "Número inválido, digite um numero de 0 a 100!\n"
	n1: .asciiz "\nQuantidade de número(s) entre 0 e 25 é: "
	n2: .asciiz "\nQuantidade de número(s) entre 26 e 50 é: "
	n3: .asciiz "\nQuantidade de número(s) entre 51 e 75 é: "
	n4: .asciiz "\nQuantidade de número(s) entre 76 e 100 é: "
.text
main:
	li $t1, 0 #0-25
	li $t2, 0 #26-50
	li $t3, 0 #51-75
	li $t4, 0 #76-100
se:
	li $v0, 4
	la $a0, n
	syscall
	li $v0, 5
	syscall
	add $s0, $v0, 0 #valor inserido vai pro s0
	
	blt $s0, 0, fim #para se o n° for menor que zero
	bgt $s0, 101, naopode # +100 da uma msg de erro e volta pro main
	
	bge $s0, 76, se76
	bge $s0, 51, se51
	bge $s0, 26, se26
	bge $s0, 0, se0
	
se0:
	add $t1, $t1, 1
	j se
se26:
	add $t2, $t2, 1
	j se
se51:
	add $t3, $t3, 1
	j se
se76:
	add $t4, $t4, 1
	j se

naopode:
	li $v0, 4
	la $a0, np
	syscall
	j se
fim: #só pra mostrar o resultado
	li $v0, 4
	la $a0, n1
	syscall
	add $a0, $t1, 0
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, n2
	syscall
	add $a0, $t2, 0
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, n3
	syscall
	add $a0, $t3, 0
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, n4
	syscall
	add $a0, $t4, 0
	li $v0, 1
	syscall