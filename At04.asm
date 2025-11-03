#4.Faça um algoritmo que calcule e mostre a área de um trapézio usando apenas números inteiros.
#Sabe-se que: A = (base maior + base menor) * altura)/2
.data
	bmaior: .asciiz "Base maior: "
	bmenor: .asciiz "Base menor: "
	alt: .asciiz "Altura: "
	area: .asciiz "Area do trapezio é: "
	
.text
main:
	li $v0, 4
	la $a0, bmaior
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	li $v0, 4
	la $a0, bmenor
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	li $v0, 4
	la $a0, alt
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	add $s0, $t0, $t1
	mul $s0, $s0, $t2
	div $s0, $s0, 2
	
	li $v0, 4
	la $a0, area
	syscall
	add $a0, $s0, 0
	li $v0, 1
	syscall
