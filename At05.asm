#5.Faça um algoritmo que receba o valor dos catetos de um triângulo, calcule e mostre o valor da hipotenusa
.data
	a: .asciiz "Digite o cateto A: "
	b: .asciiz "Digite o cateto B: "
	c: .asciiz "Valor aproximado da hipotenusa é: "
.text
main:
	li $v0, 4
	la $a0, a
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0 #cateto salvo no s1
	
	li $v0, 4
	la $a0, b
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, 0	#cateto salvo no s2
	
	mul $s1, $s1, $s1 #calc o quadrado 1° cateto
	mul $s2, $s2, $s2 #calc o quadrado 2° cateto
	add $s3, $s1, $s2 # soma os 2 e joga pra s3
	
	#tentar aproximar o valor da raiz

	li $t1, 1 #inicia o t1 com n°1
	li $t3, 0 
		
enquanto:
	
	mul $t2, $t1, $t1 #vai multiplicar o t1 por ele mesmo
	blt $s3, $t2, entao #se menor (se cateto for menor que o t2 pula pro entao
	#add $t4, $t1, 0 #vai adicionando em t4 o valor de t1
	add $t1, $t1, 1 # esse é o famoso i = i + 1 / i +=1
	add $t3, $t3, 1
	j enquanto #se ele nao pulo(seguiu) ele volta e refaz tudo
	
entao: 
	#mul $t4,$t4 $t4 #aqui é só pra pegar o valor menor (do quadrado)
	
 	add $t5, $t1, $t3 #soma as duas raizes mais próximas
	div $t5, $t5, 2  #divide eles por dois (pra media)
	
	#aqui é pra mostrar essa media
	li $v0, 4
	la $a0, c
	syscall
	add $a0, $t5, 0 
	li $v0, 1
	syscall
