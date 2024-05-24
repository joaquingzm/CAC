.data
A: .word 1
B: .word 2
.code
ld $a0, A($0)
ld $a1, B(r0)
sd $a1, A($zero)
sd $a0, B($zero)
halt
;a)La instrucción que genera atascos es la de la línea 7 porque
;espera a que el resultado de la instruccion anterior sea escrito en el
;registro $a1. Esa escritura sucede en la etapa WB. El tipo de stall
;es RAW Read After Write. Promedio 2.2

;b)Al activar el forwarding no se presentan atascos ya que la estrategia
;toma el resultado de la operación anterior de la etapa EX, dandole el
;resultado a la instrucción 7 en el siguiente ciclo etapa EX que es cuando
;lo necesita. El color verde de los registros indica que el forwarding esta
;funcionando correctamente



