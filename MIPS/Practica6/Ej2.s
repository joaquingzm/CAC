;DUDA: En la 2da pasada el valor del registro $ra pasa a valer "muestra" y queda en loop, no sé por qué sucede


.data   
cero:           .asciiz "CERO"
uno:            .asciiz "UNO"
dos:            .asciiz "DOS"
tres:           .asciiz "TRES"
cuatro:         .asciiz "CUATRO"
cinco:          .asciiz "CINCO"
seis:           .asciiz "SEIS"
siete:          .asciiz "SIETE"
ocho:           .asciiz "OCHO"
nueve:          .asciiz "NUEVE"
direcciones:    .word32 cero, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve
DATA:           .word32 0x10008
CONTROL:        .word32 0x10000

.text   

    daddi   $sp,        $0,             0x400
    lwu     $a0,        DATA($0)                                                        ; Cargo en $a0 valor de DATA que es la direccion mapeada en memoria del registro DATA del módulo E/S
    lwu     $a1,        CONTROL($0)                                                     ; Cargo en $a1 valor de CONTROL que es la direccion mapeada en memoria del registro CONTROL del módulo E/S
    daddi   $a3,        $0,             direcciones                                     ; Cargo en $a3 direccion del primer elemento del arreglo de strings
    jal     ingreso
    halt    


ingreso:        
    daddi   $sp,        $sp,            -8
    sw      $ra,        0($sp)                                                          ; Almaceno posición de retorno
    daddi   $t0,        $0,             8                                               ;Función 8 -> Se ingresa un valor númerico por terminal

loop:           
    sd      $t0,        0($a1)                                                          ; $t0 = 8 -> funcion 8:
    ld      $t1,        0($a0)                                                          ; $t1 = número ingresado
    dadd    $t2,        $0,             $0                                              ; $t2 = 0 para la comparacion (asumo que si no pone $t2 = 1 entonces lo deja igual)
    slti    $t2,        $t1,            10                                              ; $t1 < 10? Si no lo es significa que tiene más de 2 digitos, $t2 no cambia
    beqz    $t2,        finIngreso                                                      ; Si $t2 == 0 entonces corto loop
    jal     muestra
    j       loop

finIngreso:   
    lw      $ra,        0($sp)
    daddi   $sp,        $sp,            8
    jr      $ra



muestra:        
    daddi   $t5,        $0,             6                                               ; $t0 = 6 -> función 6: limpiar pantalla alfanumérica
    daddi   $t3,        $0,             4                                               ; $t3 = 4 -> función 4: Imprimir en pantalla una cadena de caracteres terminada en 0
    sd      $t5,        0($a1)                                                          ; Limpio pantalla
    dmul    $t1,        $t1,            $t3                                             ; Aprovecho $t3 = 4 (4bytes=word32) para multiplicar por posición en el arreglo de direcciones a cadenas
    dadd    $t4,        $a3,            $t1                                             ; Cargo en $t4 direccion de elemento del arreglo
    lw      $t4,        0($t4)                                                          ; Cargo en $t4 el elemento del arreglo que es otra direccion (a la cadena a imprimir)
    sw      $t4,        0($a0)                                                          ; Cargo $t4 = direccion cadena en DATA
    sd      $t3,        0($a1)                                                          ; Imprimo en pantalla cadena de caracteres terminada en 0
    jr      $ra
