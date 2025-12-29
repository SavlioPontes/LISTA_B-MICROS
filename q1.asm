.global _start
_start:
	
	MOV r0,#0x337 @ word que eu desejo analisar
	MOV r1,#32 @ número de bits
	MOV r2,#0 @ contador de 1's
	
loop: 
	AND r3,r0,#1 @ verifica se o bit atual do r0 eh 1,caso seja, r3 = 1
	ADD r2,r2,r3 @ soma +1 no contador caso tenha encontrado 1
	LSR r0,r0,#1 @ move os bits uma casa à direita
	SUBS r1, r1, #1 @ subtrai 1 do contador de bits a cada laço e atualiza Z_flag caso o r1 = 0
	BNE loop @ a partir do subs caso r1!=0 ele volta pro loop,caso seja igual, ele encerra

end:
	B end
