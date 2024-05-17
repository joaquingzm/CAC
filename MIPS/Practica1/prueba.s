.data
A: .word 1
B: .word 2
C: .word 4
.code
ld r1, A(r0)
ld r2, B(r0)
sd r2, A(r0)
sd r1, B(r0)
sd r1, C(r0)
halt