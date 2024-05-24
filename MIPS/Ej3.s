;Programa Inicial

;.data
;A: .word 1
;B: .word 6
;.code
;ld r1, A(r0)
;ld r2, B(r0)
;loop: dsll r1, r1, 1
;daddi r2, r2, -1
;bnez r2, loop
;halt
;El programa calcula 2^6
;No entiendo por que sucede un atasco RAW en bnez r2,loop etapa ID y
;por qué espera a resultado de instrucción anterior post etapa Mem.
;RTA:
;Lo que sucede es que la instruccion bnez r2,loop decide en etapa de ID si
;el salto se realiza o no, es por eso que espera a que se ejecute EX.

;Atasco Branch Taken: Por segmentación de cauce antes de que el 
;procesador pueda llegar a la conclusion de un salto de línea
;se comienza a ejecutar la instrucción siguiente, si resulta haber
;un salto entonces se corta y se ejecuta la instrucción del la línea de salto

;Programa d)

.data
A: .word 1
B: .word 6
C: .word 0
.code

;mov.d $t0,$0 CUANDO AGREGO ESTO ME TIRA ERROR, POR QUÉ?

ld r2, B(r0)
ld r1, A(r0)
loop: daddi r2, r2, -1
dsll r1, r1, 1
sd r1,C($t0)
daddi $t0,$t0,8
bnez r2, loop
halt
