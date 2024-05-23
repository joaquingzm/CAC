;Original 63 Ciclos 59 Instrucciones
;.data
;cant: .word 8
;datos: .word 1, 2, 3, 4, 5, 6, 7, 8
;res: .word 0
;.code
;dadd r1, r0, r0
;ld r2, cant(r0)
;loop: ld r3, datos(r1)
;daddi r2, r2, -1
;dsll r3, r3, 1
;sd r3, res(r1)
;daddi r1, r1, 8
;bnez r2, loop
;nop
;fin: halt

;DUDA: QUE SUCEDE SI EN LUGAR DE NOP PONGO J FIN? ENTIENDO QUE DEBERIA ROMPERSE EL CODIGO PERO NO SUCEDE. AL MOMENTO
;DE EJECUTARSE J FIN YA SE EJECUTÓ LA INSTRUCCIÓN DE SALTO ANTERIOR Y LA SOBREESCRIBE?

;a)Tener activado el Delay Slot hace que el salto se ejecute después de la siguiente instrucción a la instrucción de salto 

;b)Se incluye la instrucción nop porque sino la instrucción que se ejectuaría antes del salto sería halt y terminaría
;el programa

;d) 55 Ciclos 51 Instrucciones
.data
cant: .word 8
datos: .word 1, 2, 3, 4, 5, 6, 7, 8
res: .word 0
.code
dadd r1, r0, r0
ld r2, cant(r0)
loop: ld r3, datos(r1)
daddi r2, r2, -1
dsll r3, r3, 1
sd r3, res(r1)
bnez r2, loop
daddi r1, r1, 8
halt

