.data   
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008

.text   
    daddi   $sp,            $0,             0x400
    lwu     $s0,            CONTROL($0)
    lwu     $s1,            DATA($0)
    jal     a_la_potencia
    daddi   $t0,            $0,             3
    sd      $v0,            0($s1)
    sd      $t0,            0($s0)
    halt    




a_la_potencia:
    daddi   $sp,            $sp,            -8
    sd      $ra,            0($sp)
    jal     ingreso
    daddi   $t0,            $0,             1
    mtc1    $t0,            f2
    cvt.d.l f2,             f2
loop:       
    beqz    $v0,            caso0
    mul.d   f2,             f2,             f0
    daddi   $v0,            $v0,            -1
    j       loop
caso0:      
    lwu     $ra,            0($sp)
    daddi   $sp,            $sp,            8
    mfc1    $v0,            f2
    jr      $ra

ingreso:    
    daddi   $t0,            $0,             8
    sd      $t0,            0($s0)
    l.d     f0,             0($s1)
    sd      $t0,            0($s0)
    ld      $v0,            0($s1)
    jr      $ra