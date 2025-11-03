#10. No Assembly MIPS, existe a operação REM que apresenta o resto da divisão de 2 valores inteiros.
#SEM UTILIZAR A OPERAÇÃO REM, faça um algoritmo usando DIV, MUL e SUB que receba 2 valores inteiros e 
#exiba o resto da divisão do maior pelo menor (Condição que deve ser verificada no início do algoritmo.
.data
	n: .asciiz "Digite um número inteiro: "
	r: .asciiz "Divisão com resto: "
.text
main:
	li $v0, 4
	la $a0, n
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0
	
	li $v0, 4
	la $a0, n
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, 0
	
	li $t1, 1
	
se:
	bgt $s1, $s2, senao # se s1 for maior que o s2.. segue	
	
	add $s3, $s2, 0 #a gambiarra de mudar a variavel de lugar
	add $s2, $s1, 0
	add $s1, $s3, 0
	
	blt $t2, $s1, senao
	
senao:
	#essa parte ta ok
	mul $t2, $s2, $t1 #s2 é o menor
	add $t1, $t1, 1 # i = i + 1 
	blt $t2, $s1, senao #se t2 for menor que s1
	sub $t2, $t2, $s2
	sub $s0, $s1, $t2
	
	li $v0, 4
	la $a0, r
	syscall
	add $a0, $s0, 0
	li $v0, 1
	syscall
	
fimse:
