.data   
coorX:          .byte   24                          ; coordenada X de un punto
coorY:          .byte   24                          ; coordenada Y de un punto
color:          .byte   0, 0, 0, 0                  ; color: máximo rojo + máximo azul => magenta
CONTROL:        .word32 0x10000
DATA:           .word32 0x10008
colorCadena:    .asciiz "color:\n"

.text   
    lwu     $s6,        CONTROL(r0)                 ; $s6 = dirección de CONTROL
    lwu     $s7,        DATA(r0)                    ; $s7 = dirección de DATA
    daddi   $a0,        $0,             coorX
    daddi   $a1,        $0,             coorY
    daddi   $a2,        $0,             color
    jal     ingreso
    daddi   $t0,        $0,             7           ; $t0 = 7 -> función 7: limpiar pantalla gráfica
    sd      $t0,        0($s6)                      ; CONTROL recibe 7 y limpia la pantalla gráfica
    lbu     $s0,        coorX(r0)                   ; $s0 = valor de coordenada X
    sb      $s0,        5($s7)                      ; DATA+5 recibe el valor de coordenada X
    lbu     $s1,        coorY(r0)                   ; $s1 = valor de coordenada Y
    sb      $s1,        4($s7)                      ; DATA+4 recibe el valor de coordenada Y
    lwu     $s2,        color(r0)                   ; $s2 = valor de color a pintar
    sw      $s2,        0($s7)                      ; DATA recibe el valor del color a pintar
    daddi   $t0,        $0,             5           ; $t0 = 5 -> función 5: salida gráfica
    sd      $t0,        0($s6)                      ; CONTROL recibe 5 y produce el dibujo del punto
    halt    

ingreso:        

    daddi   $t0,        $0,             8           ; función 8: leo entero/flotante desde terminal
    sd      $t0,        0($s6)
    ld      $t1,        0($s7)                      ; Guardo coordenada x en $t1
    sb      $t1,        0($a0)                      ; Almaceno valor de $t1 en dato coorX
    sd      $t0,        0($s6)
    ld      $t1,        0($s7)                      ; Guardo coordenada y en $t1
    sb      $t1,        0($a1)                      ; Almaceno valor de $t1 en dato coorY

    daddi   $t0,        $0,             4
    daddi   $t1,        $0,             colorCadena
    sd      $t1,        0($s7)
    sd      $t0,        0($s6)

    ; Guardo datos del color
    daddi   $t0,        $0,             8
    sd      $t0,        0($s6)
    ld      $t1,        0($s7)
    sb      $t1,        0($a2)

    sd      $t0,        0($s6)
    ld      $t1,        0($s7)
    sb      $t1,        1($a2)

    sd      $t0,        0($s6)
    ld      $t1,        0($s7)
    sb      $t1,        2($a2)
    jr      $ra