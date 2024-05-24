;FW y BTB Habilitados
.data
cadena: .asciiz "adbdcdedfdgdhdid" ;cadena a analizar
car: .asciiz "d"                   ;caracter buscado
cant: .word 0 			   ;cantidad de veces que se repite 
				   ;el caracter car en cadena.

.text
lb $t0,car($0)          ;Cargo caracter a encontrar
dadd $t4,$0,$0          ;Regsitro contador
dadd $t1,$0,$0		;Registro con el que me voy a mover sobre la cadena
dadd $t3,$0,$0

loop:
lb $t2,cadena($t1)      ;Cargo 1 byte (elemento del arreglo)
dsub $t3,$t2,$t0        ;Resto valores de ambos caracteres para saber si son iguales
bnez $t3,seguir         ;Si no lo son sigo recorriendo hasta llegar a 0
daddi $t4,$t4,1         ;Si sí lo son, sumo 1 al reg contador
seguir:
daddi $t1,$t1,8          ;Avanzo al siguiente elemento
bnez $t2,loop           ;Si el valor del caracter leido es distinto de 0, sigo recorriendo
sd $t4,cant($0)         ;Guardo registro contador en cant
halt
