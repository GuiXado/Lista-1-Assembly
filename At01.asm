#1. A imobiliária Imóbilis vende apenas terrenos retangulares. Faça um algoritmo para ler as 
# dimensões de um terreno e depois exibir a área do terreno.
.data
	largura: .asciiz"Qual a largura do terreno? "
	compri: .asciiz"Qual o comprimento do terreno? "
	area: .asciiz"A área do do terreno é: "
.text
main: #li é o operador de atribuição
	li $v0, 4 # 4 diz pro $v0 que ele vai ler algo
	la $a0, largura # $a0 é o escreva
	#li pra numero e la pra "texto" (algo do .data)
	syscall #interrupção para ler ou escrever
	
	li $v0, 5 # cod. 5 le um numero inteiro e salva no $v0
	syscall
	add $t1, $v0, 0 #vai passar o valor do $v0 pro $t1
	
	li $v0, 4
	la $a0, compri
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	mul $t0, $t1, $t2
	div $t0, $t0, 2
	
	li $v0, 4
	la $a0, area
	syscall
	
	#li $v0, 1
	add $a0, $t0, 0
	li $v0, 1
	syscall #acho que a ordem não importa pq ele só vai executar quando chegar aqui
	#admito que nao entendi esse final
