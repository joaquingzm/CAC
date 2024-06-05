.data
cadena1: .word 1,2,3,4,5,6
cadena2: .word 1,2,3,4,5,6
dim: .word 6

.text

daddi $a0,$0,cadena1
daddi $a1,$0,cadena2
ld $a3,dim($0)
jal subrutina
halt

subrutina:
daddi $v0,$0,-1
daddi $t3,$0,-1
daddi $a3,$a3,-2
for:
ld $t0,0($a0)
daddi $t3,$t3,1
daddi $a0,$a0,8
ld $t1,0($a1)
daddi $a1,$a1,8
nop
bne $t0,$t1,finDifieren
bne $t3,$a3, for
j fin
finDifieren:
dadd $v0,$0,$t3
fin: jr $ra



