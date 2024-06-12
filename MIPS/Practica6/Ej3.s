.data   
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008

.text   
    lwu     $a1,        DATA($0)
    lwu     $a2,        CONTROL($0)
    jal     ingreso
    dadd    $a0,        $v0,            $v1
    jal     resultado




ingreso:    
    daddi   $t0,        $0,             8   ; $t0 = 8 -> funcion 8: Se ingresa un valor númerico por terminal
    sd      $t0,        0($a2)               
    ld      $v0,        0($a1)              ; $v0 = número ingresado
    sd      $t0,        0($a2)              
    ld      $v1,        0($a1)              ; $v1 = número ingresado
    jr      $ra

resultado:  
    daddi   $t0,        $0,             6
    sd      $t0,        0($a2)
    daddi   $t0,        $0,             2
    sd      $a0,        0($a1)
    sd      $t0,        0($a2)