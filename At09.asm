#9.Fazer um algoritmo que leia 2 números inteiros e exiba a divisão destes. Sabe-se que o 2o número
#não pode ser zero, portanto, deve-se insistir na solicitação do 2o número até ele ser diferente de 0
.data
	pn: .asciiz "Digite o primeiro número inteiro: "
	sn: .asciiz "Digite o segundo número inteiro: "
	r: .asciiz "Resultado a divisão do primeiro pelo segundo: "
.text
main:
	li $v0, 4
	la $a0, pn
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0
	
enquanto:
	li $v0, 4
	la $a0, sn
	syscall
	li $v0, 5
	syscall
	beqz $v0, enquanto
	add $s2, $v0, 0
	div $s3, $s1, $s2
	
	li $v0, 4
	la $a0, r
	syscall
	li $v0, 1
	add $a0, $s3, 0
	syscall