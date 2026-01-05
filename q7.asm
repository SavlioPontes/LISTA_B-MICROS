.data
array:.word 5,1,4,2,8 @ vetor de inteiros

.text
.global _start

_start:
    LDR r0,=array @ r0 aponta pro início do array
    MOV r1,#5 @ r1 = tamanho do vetor

    SUB r2,r1,#1 @ r2 =n-1(limite do laço interno)

loop_externo:
    MOV r3,#0 @ r3 = j(índice do laço interno)

loop_interno:
    CMP r3,r2 @ compara o indice(j) com limite
    BGE fim_interno @ se passar do limite,sai do loop

    LDR r4,[r0,r3,LSL#2] @ r4 = array[j]
    ADD r5,r3,#1 @ r5 = j+1
    LDR r6,[r0,r5,LSL#2] @ r6 = array[j+1]

    CMP r4,r6
    BLE nao_troca

    STR r6,[r0,r3,LSL#2] @ array[j] = array[j+1]
    STR r4,[r0,r5,LSL#2] @ array[j+1] = array[j]

nao_troca:
    ADD r3,r3,#1 @ incrementa j
    B loop_interno @ volta pro loop

fim_interno:
    SUB r2,r2,#1 @ reduz limite (o fim ja ta organizado)
    CMP r2,#0
    BGT loop_externo

fim:
    B fim
