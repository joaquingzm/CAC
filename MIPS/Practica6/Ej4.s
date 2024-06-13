;Se me loopea en la rutina respuesta, simplemente WinMips

.data   
clave:              .asciiz "hola"
CONTROL:            .word32 0x10000
DATA:               .word32 0x10008
bienvenido:         .asciiz "BIENVENIDO"
error:              .asciiz "ERROR"
cadenas:            .word32 bienvenido, error
cadenaIngresada:    .asciiz "0"

.text   
    daddi   $sp,            $0,             0x400
    daddi   $a0,            $0,             cadenaIngresada
    daddi   $a3,            $0,             clave
    lwu     $s1,            CONTROL($0)
    lwu     $s2,            DATA($0)
    jal     char
    halt    


char:               
    daddi   $s0,            $0,             1
    daddi   $sp,            $sp,            -8
    sw      $ra,            0($sp)

for2Char:           
    daddi   $sp,            $sp,            -8
    sd      $a0,            0($sp)
    jal     cargarCadena
    ld      $a0,            0($sp)
    daddi   $sp,            $sp,            8

    daddi   $t1,            $0,             4               ; Dimension clave
    dadd    $t2,            $0,             $a3             ; Direccion clave
    dadd    $t3,            $0,             $a0             ; Direccion cadena

forChar:            
    lbu     $t4,            0($t2)                          ; Cargo primer char de clave
    lbu     $t5,            0($t3)                          ; Cargo primer char de cadena
    beq     $t4,            $t5,            sigo            ; Comparo chars, si son iguales
    dadd    $s0,            $0,             $0              ; Seteo $s0 = 0 para cortar el loop si no son iguales
sigo:               
    daddi   $t1,            $t1,            -1              ; Descuento dimension clave
    beqz    $s0,            finChar
    daddi   $t2,            $t2,            1               ; Me muevo sobre el string clave
    daddi   $t3,            $t3,            1               ; Me muevo sobre el string cadena
    bnez    $t1,            forChar                         ; Si no llegué a final de dimension, vuelvo
finChar:            
    jal     respuesta
    beqz    $s0,            for2Char
    lwu     $ra,            0($sp)                          ; Recupero direccion de regreso
    daddi   $sp,            $sp,            8
    jr      $ra





cargarCadena:       
    daddi   $t3,            $0,             4               ; Dimension de la cadena a ingresar
    daddi   $t1,            $0,             9               ; Señal de control para leer de terminal
    dadd    $t4,            $a0,            $0
loopCadena:         
    sd      $t1,            0($s1)                          ; Cargo en dirección de control
    lbu     $t2,            0($s2)                          ; Cargo lo de dirección de data
    sb      $t2,            0($t4)                          ; Cargo en dirección de texto
    daddi   $t4,            $t4,            1               ; Avanzo en la cadena
    daddi   $t3,            $t3,            -1              ; Disminuyo contador de dimension
    bnez    $t3,            loopCadena                      ; Mientras contador de dimension !=0 sigo
    sb      $0,             0($t4)                          ; Guardo 0 al final de la cadena
    jr      $ra




respuesta:          
    daddi   $t1,            $0,             4
    beqz    $s0,            noAcceder
    daddi   $t0,            $0,             bienvenido
    j       finComparacion
noAcceder:          
    daddi   $t0,            $0,             error
finComparacion:     
    sd      $t0,            0($s2)
    sd      $t1,            0($s1)
    jr      $ra