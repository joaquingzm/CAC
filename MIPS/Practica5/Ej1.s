;FW activado
;Los atascos estructurales suceden cuando se tiene
;el dato que se necesitaba después de los RAW pero al
;momento de querer pasar a la etapa MEM, en ese mismo
;ciclo se está ejecutando de la instrucción de suma en f3
;de double la etapa MEM. Por lo tanto quedo en la etapa EX
;esperando a pasar a MEM. 

;DUDA: En este caso, en los atascos RAW y el STR, en
;cual de esos de atascos se produce el calculo de la direccion
;de memoria para almacenar f3. Se produce en RAW y con los datos
;ya calculados que esperando en STR a pasar a MEM? O el calculo
;se realiza en STR porque el forwarding ya le paso el valor de
;f3 y por alguna razón lo necesita por más que no lo use

.data
n1: .double 9.13
n2: .double 6.58
res1: .double 0.0
res2: .double 0.0
.text
l.d f1, n1(r0)
l.d f2, n2(r0)
add.d f3, f2, f1
mul.d f4, f2, f1
s.d f3, res1(r0)
s.d f4, res2(r0)
halt

;a)16 Ciclos,7 Instrucciones,2,286 CPI
;Atascos: 4 RAW,2 Estructurales(Str)

;b)Los atascos RAW suceden por que la suma de números