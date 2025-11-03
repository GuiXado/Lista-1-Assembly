#7.Faça um algoritmo que leia uma variável e some 5, caso seja par ou some 8, caso seja ímpar,
#imprimir o resultado desta operação.
.data
	d: .asciiz "Digite um número: "
	rp: .asciiz "Resultado é par (mais 5): "
	ri: .asciiz "Resultado é impar (mais 8): "
.text
main:
	li $v0, 4
	la $a0, d
	syscall
	li $v0, 5
	syscall
	add $s0, $v0, 0
se:
	rem $s1, $s0, 2
	beq $s1, 1, senao # se igual a 1, ou seja, impar. vai pro senao
	add $s0, $s0, 5
	li $v0, 4
	la $a0, rp
	syscall
	add $a0, $s0, 0
	li $v0 1
	syscall
	j fimse
senao:
	add $s0, $s0, 8
	li $v0, 4
	la $a0, ri
	syscall
	add $a0, $s0, 0
	li $v0 1
	syscall
fimse: