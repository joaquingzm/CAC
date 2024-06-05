.data
m: .word 3
tabla: .word 3,2,3,4,5
dim: .word 5

.text
ld $a0,m($0)
ld $a1,dim($0)
jal subrutina
halt

subrutina:
dadd $t3,$0,$0

for:
ld $t0,tabla($t3)
daddi $a1,$a1,-1
slt $t2,$a0,$t0
daddi $t3,$t3,8
beqz $t2,seguir
daddi $v0,$v0,1
seguir:
bnez $a1,for
jr $ra
