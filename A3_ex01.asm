	.data
msg_comum:	.asciz "Entre com o valor do lado "
msg_A:		.asciz "A: "
msg_B:		.asciz "B: "
msg_C:		.asciz "C: "
msg_nao:	.asciz "Não é triângulo."
msg_eh:		.asciz "É triângulo."
	.text
main:	
#imprime Entre com o valor do lado A :
	la 	a0, msg_comum 
	li 	a7,4
	ecall

	la 	a0, msg_A 
	li 	a7,4
	ecall	
 #lê e armazena o valor de A em s0
	addi 	a7, zero, 5  
	ecall	
	add 	s0, zero, a0 
	
#imprime Entre com o valor do lado B :
	la 	a0, msg_comum  
	li 	a7, 4
	ecall

	la 	a0, msg_B  
	li 	a7, 4
	ecall	
 #lê e armazena o valor de B em s1
	addi 	a7, zero, 5 
	ecall	
	add 	s1, zero, a0
	
#imprime Entre com o valor do lado C :
	la 	a0, msg_comum 
	li 	a7,4
	ecall

	la 	a0, msg_C 
	li 	a7,4
	ecall	
 #lê e armazena o valor de C em s2
	addi 	a7, zero, 5  
	ecall	
	add 	s2, zero, a0  

triangulo:
	blt s0,s1,if0		#se s0<s1 pula pra linha if0
else0:	#s1<s0
	blt s0,s2,if1		#se s2 for o maior pula para if1
	add s3,s1,s2		#s0 é o maior, soma os dois menores em s3
	blt s0,s3, ehtriangulo	#compara se s3>s0 para saber é ou não triangulo
	j mensagem
	
if0:
	blt s1,s2,if1		# se s1<s2 pula pra linha if1
else1:	#s2<s1
	add s3,s0,s2		#soma os dois lados menores
	blt s1,s3,ehtriangulo	#se a soma dos dois lados menores for maior que o lado maior pula para ehtriangulo
	j mensagem		#vai para a mensagem de não é triângulo
if1:	
	add s3,s0,s1
	blt s2,s3,ehtriangulo	#se a soma dos dois lados menores for maior que o lado maior pula para ehtriangulo
mensagem:
	la 	a0, msg_nao
	li 	a7,4		#imprime que não é triangulo
	ecall
	addi a0,zero,0		#coloca o valor 0 em a0
	j fim
ehtriangulo:
	la 	a0, msg_eh
	li 	a7,4		#imprime que é triângulo
	ecall
	addi a0, zero, 1	# adiciona 1 em a0
	
fim: 	nop
