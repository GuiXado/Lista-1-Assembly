#2.Uma fábrica de camisetas produz os tamanhos pequeno, médio e grande, cada uma sendo vendida
#respectivamente por 10, 12 e 15 reais. Construa um algoritmo em que o usuário forneça a
#quantidade de camisetas pequenas, médias e grandes referentes a uma venda, e a máquina informe
#quanto será o valor arrecadado
.data
	p: .asciiz "Quantidade de camisetas pequenas: "
	m: .asciiz "Quantidade de camisetas médias: "
	g: .asciiz "Quantidade de camisetas grandes: "
	t: .asciiz "Total arrecadado: "
.text
main:
	li $s0, 10 #salvando a valor da camiseta pequenas
	li $s1, 12
	li $s2, 15
	
	li $v0, 4 #diz que é pra mostrar o texto
	la $a0, p #mostra o texto
	syscall 
	li $v0, 5 # 5 faz ler um inteiro
	syscall #depois de um $v0 com comando precisa de um syscall
	add $t0, $v0, 0 #salvando em $t0 a quandidade de camisa pequena
	
	li $v0, 4 
	la $a0, m
	syscall 
	li $v0, 5
	syscall
	add $t1, $v0, 0 #salvando em $t0 a quandidade de camisa médias
	
	li $v0, 4
	la $a0, g
	syscall 
	li $v0, 5
	syscall
	add $t2, $v0, 0 #salvando em $t0 a quandidade de camisa grandes
	
	mul $t4, $s0, $t0
	mul $t5, $s1, $t1
	mul $t6, $s2, $t2
	
	add $t4, $t4, $t5
	add $t4, $t4, $t6
	
	li $v0, 4
	la $a0, t
	syscall
	li $v0, 1
	add $a0, $t4, 0
	syscall