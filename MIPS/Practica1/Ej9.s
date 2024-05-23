;Delay Slot habilitado
;Sin Nop: 26 Ciclos,18 Instrucciones,1.44 CPI,4 Atascos RAW
;Con Nop: 26 Ciclos,22 Instrucciones,1,182 CPI,0 Atascos RAW
;DUDA: POR QUÉ PONIENDO LA INSTRUCCIÓN NOP EL CPI MEJORA?
.data
x: .word 3
y: .word 2
a: .word 4

.text
ld $t0,a($0)       ;Guardo a en t0
ld $t1,x($0)	   ;Guardo x en t1
ld $t2,y($0)       ;Guardo y en t2
while:
daddi $t0,$t0,-1   ;a = a-1
dadd $t4,$0,$0
bnez $t0,while     ;while a>0
dadd $t1,$t1,$t2   ;x = x+y
sd $t0,a($0)
sd $t1,x($0)
halt

