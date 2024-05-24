;.data
;tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11
;num: .word 7
;long: .word 10
;.code
;ld r1, long(r0)
;ld r2, num(r0)
;dadd r3, r0, r0
;dadd r10, r0, r0
;loop: ld r4, tabla(r3)
;beq r4, r2, listo
;daddi r1, r1, -1
;daddi r3, r3, 8
;bnez r1, loop
;j fin
;listo: daddi r10, r0, 32
;fin: halt
;a)El código se encarga de ver si el la variable num se encuentra dentro del arreglo, si lo está pone 32 en r10

;b)Es un modo en el que comienza prediciendo que la proxima instruccion a realizar despues de un 
;condicional para salto de linea es la siguiente, si esto resulta no cumplirse y por lo tanto tiene que
;detener la ejecución de esta instrucción, entonces la proxima vez va a predecir que la siguiente instrucción
;a procesar es la de la dirección de la etiqueta. Lo mismo sucede si esta última preddición resulta ser falsa
;al final de un bucle. 
;DUDA: ES SEGURO EJECUTAR LA SIGUIENTE INSTRUCCIÓN ANTES DE SABER SI VOY A SALTAR O NO? CUANDO ESE SALTO
;SE REALIZA Y POR LO TANTO LA INSTRUCCIÓN SIGUIENTE SE CANCELA PARA PROCESAR LA DE LA DIRECCION DE LA ETIQUETA
;EL CICLO DE INSTRUCCIÓN APARECE "CORTADO" EN LA ETAPA IF. EN CAMBIO CUANDO LA "PREDICCIÓN" FUE CORRECTA
;EL CICLO DE INSTRUCCIÓN FLUYE CON NORMALIDAD, NO PARECIERA ESPERAR A NINGUNA CONFIRMACIÓN DE SI SEGUIR O NO. MI DUDA
;ES ENTONCES, NO PODRÍA LLEGAR A VIOLARSE LA INTEGRIDAD DE DATOS SI REALMENTE LA INSTRUCCIÓN SIGUE EJECUTANDOSE
;HASTA SER INTERRUMPIDA? CAPAZ ESA INTERRUPCIÓN LLEGA "TARDE"¿?

;RTA: LA INTERRUPCION SE REALIZA POR HARDWARE, NO DA TIEMPO A QUE
;SE EJECUTE NINGUNA ETAPA IMPORTANTE DE LA INSTRUCCION

;Codigo mejorado
.data
tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11
num: .word 7
long: .word 10
.code
ld r1, long(r0)
ld r2, num(r0)
dadd r3, r0, r0
dadd r10, r0, r0
loop: ld r4, tabla(r3)
daddi r1, r1, -1
daddi r3, r3, 8
beq r4, r2, listo
bnez r1, loop
j fin
listo: daddi r10, r0, 32
fin: halt
