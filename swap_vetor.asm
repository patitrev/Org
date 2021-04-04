	.data
vetor:	.word -5,4,26,5,2,9

	.text
main:	
	li a0,2
	li a1,5
	la a2,vetor
	la a3,vetor
	li a4,0
	li a5,4
loop:
	beq a4,a5,swap
	add a2,a2,a0
	add a3,a3,a1
	addi a4,a4,1
	j loop
swap:
	lw t0,0(a2)
	lw t1,0(a3)
	sw t0,0(a3)
	sw t1,0(a2)
end:
	nop