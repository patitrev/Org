	.data 
A: 		.word 2
B:		.word 5
C:		.word 48
	.text
		lw t0,A
		lw t1,B
		lw t2,C
firstcomp:	blt t0,t1,firstif
firstelse:	lw a0,A
seccomp:	blt t2,a0,fim
secelse:	lw a0,C
		j fim
firstif:	lw a0,B
		j seccomp
fim:		nop
