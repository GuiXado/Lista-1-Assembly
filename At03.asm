#3.A empresa Hipotheticus paga R$10,00 por hora normal trabalhada, e R$15,00 por hora extra. Faça
#um algoritmo para calcular e imprimir o salário bruto e o salário líquido de um determinado
#funcionário. Considere, também, uma entrada de desconto para calcular o salário líquido.
.data
	h: .asciiz "Carga horaria de trabalho diaria: "
	dd: .asciiz "Dias não trabalhos: "
	he: .asciiz "Total de horas extras(no mês): "
	sb: .asciiz "Salário bruto: "
	sl: .asciiz "\nSalário liquido: "
	desc: .asciiz "Descontos extras (em reais): "	
.text
main: #acho que to fazendo mais difícil do que precisava 
	li $s0, 10 #salário hora
	li $s1, 15 #salário hora extra
	li $s2, 22 #dias trabalhados no mes
	#agora é receber as informações
	li $v0, 4
	la $a0, h
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, 0 # $t0 recebe a carga horaria
	
	li $v0, 4
	la $a0, he
	syscall
	li, $v0, 5
	syscall
	add $t1, $v0, 0 # $t1 recebe a total de horas extras
	
	li $v0, 4
	la $a0, dd
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0 # $t2 recebe a dias não trabalhos "meio errado isso mas ok
	
	li $v0, 4
	la $a0, desc
	syscall
	li $v0, 5
	syscall
	add $t3, $v0, 0 # $t3 recebe outros descontos
	
	mul $t4, $s0, $t0 # $t4 salario de 1 dia
	mul $t4, $t4, $s2 # t4 agora é o valor do mes
	mul $t5, $s1, $t1 # $t5 valor das horas extras
	add $t5, $t5, $t4 # $t5 agora recebe a soma do salario + horas extras
	#agora é o &$ds% dos dias não trabalhados, pra que inventei
	mul $t6, $t0, $s0 #valor do dia * carga horaria = desconto (um deles)
	mul $t6, $t6, $t2 # R$ de um dia * dias que nao veio
	sub $t7, $t5, $t6 # tira o dia não trabalhado do bruto
	sub $t7, $t7, $t3 # já tira o resto dos descontos
	#em tese o t5 tem o bruto e o t7 o liquido
	
	li $v0, 4 #vai mostrar o bruto
	la $a0, sb
	syscall
	li $v0, 1
	add $a0, $t5, 0
	syscall
	
	li $v0, 4 #vai mostrar o liquido
	la $a0, sl
	syscall
	li $v0, 1
	add $a0, $t7, 0
	syscall
