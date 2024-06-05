;DUDA: No logro que las instrucciones c.lt.d y bc1t funcionen
;el for no corta



.data
peso: .double 75.7
altura: .double 1.73
IMC: .double 0.00
estado: .double 0.0
tabla: .double 18.5,75.0,300.0,20.0

.text

l.d f1,peso($0)
l.d f2,altura($0)
dadd $t0,$0,$0
daddi $t1,$0,4
dadd $t2,$0,$0
div.d f3,f1,f2

for:
l.d f4,tabla($t0)
daddi $t0,$t0,1
daddi $t1,$t1,-1
daddi $t2,$t2,8
c.lt.d f3,f4
bc1t fin
bnez $t1,for
fin:
sd $t0,estado($0)
s.d f3,IMC($0)
halt

