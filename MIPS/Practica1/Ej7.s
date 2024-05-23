;Con Forwarding y Branch Target Buffer activados: 
;116 Ciclos,100 Instrucciones, 6 Atascos BTB, 6 Atascos Branch Misprediction

;DUDA: COMO DEBERIA HACER ESTOS PUNTOS, ORIENTADOS A TENER
;FORWARDING ACTIVADO Y/O DELAY SLOT O BTB? 

.data
dim: .word 10
num: .word 5
cant: .word 0
TABLA: .word 5,6,7,4,2,1,3,4,5,16
RES: .word 0

.text
dadd $t0,$0,$0        ;Direccion 1er elemento
dadd $t1,$0,$0        ;Direccion 1er elemento de array RES
ld $t2,dim($0)        ;Dimension del array para poder moverme
ld $t3,num($0)        ;Valor para comparar
dadd $t4,$0,$0 	      ;Contador para cant

loop:
ld $s0,TABLA($t0)     ;Cargo elemento del arreglo
dadd $s2,$0,$0        ;Pongo valor para RES en 0
slt $s2,$t3,$s0       ;Comparo X con elemento, si x<=e, $s2=0
daddi $t2,$t2,-1      ;Dim = Dim - 1
sd $s2,RES($t1)       ;Guardo resultado en RES
daddi $t0,$t0,8	      ;Avanzo de posición en el arreglo
daddi $t1,$t1,8       ;Avanzo junto con el arreglo original
beqz $s2,seguir       ;Si elemento no era mayor a x entonces no cant++
daddi $t4,$t4,1       ;Si sí lo era, cant++
seguir:
bnez $t2,loop         ;Si dim==0 corto
sd $t4,cant($0)       ;Guardo cantidad de elementos>X en cant
halt
