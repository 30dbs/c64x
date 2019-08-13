
zpscreen_lo=14 
zpscreen_hi=15 
slope=$90 

*=$0801

        BYTE    $0b, $08, $0A, $00, $9E, $32, $30, $36, $31, $00,  $00 , $00

        lda #$20
        sta $d020
        sta $d021
@clr
        sta (zpscreen_lo),y
        sta ($70),y
        iny
        bne @clr
@sfm

        ldx #$27
@loop
        lda #$a0
@sh1    sta $0400,x
        sta (zpscreen_lo),y
        adc slope
        sta slope
        bcc @pp
        lda zpscreen_lo
        adc #$27
        sta zpscreen_lo
        sta @sh1+1

        bcc @pp
        inc zpscreen_hi
        inc @sh1+2
@pp
        iny
        dex
        bpl @loop
inf
        bmi inf