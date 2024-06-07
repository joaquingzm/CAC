;DUDA: Hay algo que anda mal y no se qué es, por lo menos
;en mi compu sucede que en uno de los llamados a recursividad el
;valor de $ra pasa de ser 0x0030 (N de línea en WinMips) a 0x0014
;RTA: El problema es que por convención se iniciap SP en 0x400 que es
;una dirección que no existe, por lo tanto primero tenía que
;restarle 8 al SP y después guardar

.data
valor: .word 5
result: .word 0

.text
daddi $sp, $0, 0x400 ; Inicializa el puntero al tope de la pila (1)
ld $a0, valor($0)
jal factorial
sd $v0, result($0)
halt



factorial:
daddi $sp,$sp,-8
sd $ra,0($sp)
beqz $a0,casoBase
daddi $sp,$sp,-8
sd $a0,0($sp)
daddi $a0,$a0,-1
jal factorial
lw $a0,0($sp)
daddi $sp,$sp,8
dmul $v0,$a0,$v0
j fin
casoBase:
daddi $v0,$0,1

fin:
lw $ra,0($sp)
daddi $sp,$sp,8
jr $ra
