.global _start
_start:
	MOV r0,#371 @ numero desejado
	MOV r1,#3 @ numero de digitos
	MOV r2,#0 @ somador
	
	MOV r6,#3 @ centenas
	MOV r7,#7 @ dezenas
	MOV r8,#1 @ unidade
	
	@ adicionamos na pilha
	PUSH {r6}
	PUSH {r7}
	PUSH {r8}
	
	B loop
	
loop:
	
	POP {r3} @ pega o digito da pilha
	MUL r4,r3,r3 @ n*n = n^2
	MUL r3,r4,r3 @ (n^2)*n = n^3
	
	ADD r2,r2,r3 @ soma ao contador o digito ao cubo
	SUB r1,r1,#1 @ decrementa o contador
	
	CMP r1,#0 @loop ocorre 3 vezes
	BNE loop
	
	CMP r2,r0
	BEQ n_armstrong @ se o somador for igual ao numero inicial,é um numero de armstrong
	BNE not_armstrong @ se for diferente,nao é!
	 
n_armstrong:
	B n_armstrong

not_armstrong:
	B not_armstrong
