.data   
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008
texto:      .space  256                             ; El mensaje a mostrar

.text   
    lwu     $s0,            DATA(r0)                ; $s0 = dirección de DATA
    daddi   $t0,            $0,             texto

    dadd    $a0,            $t0,            $0      ;$a0 = dirección del mensaje a mostrar
    lwu     $a1,            CONTROL($0)             ;$a1 = dirección de control
    lwu     $a2,            DATA($0)                ;$a2 = dirección de data
    jal     cargarCadena

    sw      $t0,            0($s0)                  ; DATA recibe el puntero al comienzo del mensaje
    lwu     $s1,            CONTROL(r0)             ; $s1 = dirección de CONTROL
    daddi   $t0,            $0,             6       ; $t0 = 6 -> función 6: limpiar pantalla alfanumérica
    sd      $t0,            0($s1)                  ; CONTROL recibe 6 y limpia la pantalla
    daddi   $t0,            $0,             4       ; $t0 = 4 -> función 4: salida de una cadena ASCII
    sd      $t0,            0($s1)                  ; CONTROL recibe 4 y produce la salida del mensaje
    halt    

cargarCadena:
    daddi   $t4,            $0,             0x30    ;Condicion de corte char '0'
    daddi   $t1,            $0,             9       ;Señal de control para leer de terminal
loop:       
    sd      $t1,            0($a1)                  ;Cargo en dirección de control
    lbu     $t2,            0($a2)                  ;Cargo lo de dirección de data
    beq     $t2,            $t4,            fin
    sb      $t2,            0($a0)                  ;Cargo en dirección de texto
    daddi   $a0,            $a0,            1       ;Avanzo en la cadena
    j       loop
fin:        
    sb      $0,             0($a0)                  ;Guardo 0 al final de la cadena
    jr      $ra