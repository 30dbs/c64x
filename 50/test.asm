
slope=$90

*=$0801

        BYTE    $0B, $08, $0A, $00, $9E, $32, $30, $36, $31, $00, $00, $00

        sta $d020
        sta $d021


@sfm

        lda #$a0
        ldy $d5
@e      sta $07c0
        sta $07c0,y

        beq @noscroll

        adc slope
        sta slope
        bcc @noscroll

        jsr $e8ea 
@noscroll
        inc @e+1
        dec $d5
        bpl @sfm
inf
        bmi inf