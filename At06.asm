#6.Faça um algoritmo que leia dois valores inteiros A e B se os valores forem iguais deverá se somaros dois, 
#caso contrário multiplique A por B. Ao final de qualquer um dos cálculos deve-se atribuir o
#resultado para uma variável C e mostrar seu conteúdo na tela.
.data
	a: .asciiz "Digite o valor de A: "
	b: .asciiz "Digite o valor de B: "
	s: .asciiz "Resultado da soma de A e B: "
	m: .asciiz "Resultado da multiplicação de A e B: "
.text
main:
	li $v0, 4
	la $a0, a
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0
	
	li $v0, 4
	la $a0, a
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, 0
	
se:
	bne $s1, $2, senao
	add $s0, $s1, $s2
	
	li $v0, 4
	la $a0, s
	syscall
	add $a0, $s0, 0
	li $v0, 1
	syscall
	
	j fim
senao:
	mul $s0, $s1, $s2
	
	li $v0, 4
	la $a0, m
	syscall
	add $a0, $s0, 0
	li $v0, 1
	syscall
fim:
