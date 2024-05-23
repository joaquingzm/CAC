.data
TABLA: .word 5,6,7,4,2,1,3,4,5,16
dim: .word 10
x : .word 5
cant: .word 0
RES: .word

.text
dadd $t0,$0,TABLA($0) ;Direccion 1er elemento
dadd $t1,$0,RES($0)   ;Direccion 1er elemento de array RES
ld $t2,dim($0)        ;Dimension del array para poder moverme
ld $t3,x($0)          ;Valor para comparar
dadd $t4,$0,$0 	      ;Contador para cant

loop:
ld $s0,0($t0)
dadd $s0,$s0,1
ld $s1,0($t1)
slt $s2,$t3,$s0

daddi $t2,$0,-1
bneqz $t2,loop
