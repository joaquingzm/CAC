DUDA: Hay algo que anda mal y no se qué es, por lo menos
;en mi compu sucede que en uno de los llamados a recursividad el
;valor de $ra pasa de ser 0x0030 (N de línea en WinMips) a 0x0014

.data
valor: .word 2
result: .word 0

.text
daddi $sp, $0, 0x400 ; Inicializa el puntero al tope de la pila (1)
ld $a0, valor($0)
jal factorial
sd $v0, result($0)
halt



factorial:
sd $ra,0($sp)
daddi $sp,$sp,-8
beqz $a0,casoBase
sd $a0,0($sp)
daddi $a0,$a0,-1
daddi $sp,$sp,-8
jal factorial
daddi $sp,$sp,8
lw $a0,0($sp)
dmul $v0,$a0,$v0
j fin
casoBase:
daddi $v0,$0,1

fin:
daddi $sp,$sp,8
lw $ra,0($sp)
jr $ra
