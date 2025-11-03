#8.Encontrar o dobro de um número caso ele seja positivo e o seu triplo caso seja negativo, imprimindo o resultado
.data
	n: .asciiz "Digite um número: "
	rp: .asciiz "Número possitivo, o dobro dele é: "
	rn: .asciiz "Número negativo, o triplo dele é: "
.text
main:
	li $v0, 4
	la $a0, n
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0
	
se:
	bgtz $s1, senao
	mul $s2, $s1, 3
	li $v0, 4
	la $a0, rn
	syscall
	li $v0, 1
	add $a0, $s2, 0
	syscall

	j fimse
senao:
	mul $s2, $s1, 2
	li $v0, 4
	la $a0, rp
	syscall
	li $v0, 1
	add $a0, $s2, 0
	syscall

fimse: