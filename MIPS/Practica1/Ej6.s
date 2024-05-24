.data 
cant: .word 3
A: .word 3
B: .word 2
C: .word 3
D: .word 0
.text

dadd $t0,$0,A($0) ;Dir de 1er dato
dadd $t1,$t0,8  ;Dir de 2do dato
ld $t2,cant($0) ;Cantidad de datos
dadd $v0,$0,$0  ;Cantidad de numeros iguales

loop:
ld $s0,$t0
ld $s1,$t1
dsub $s2,$s0,$s1
bneqz $s2,seguir
dadd $v0,$v0,1
seguir:
daddi $t2,$t2,-1
daddi $t0,$t0,8 

;No se me ocurre si hacerlo para solo 3 valores o generalizarlo. Si lo hago para 3 valores
;como deberia hacer las comparaciones y condiciones? Porque al principio necesito sumar 2 y 
;despues 1.

;RTA: Hacerlo con 3 comparaciones,A==B,A==C,B==C,y sumar cada vez que la igualdad es verdadera
;si al final de las comparaciones el cont==1, entonces cont=2 y listo