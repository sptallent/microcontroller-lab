;*****************************************************************
;* This stationery serves as the framework for a                 *
;* user application (single file, absolute assembly application) *
;* For a more comprehensive program that                         *
;* demonstrates the more advanced functionality of this          *
;* processor, please see the demonstration applications          *
;* located in the examples subdirectory of the                   *
;* Freescale CodeWarrior for the HC12 Program directory          *
;*****************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

ROMStart    EQU  $4000  ; absolute address to place my code/constant data

; variable/data section

            ORG RAMStart
 ; Insert here your data definition.
Counter     DS.W 1
FiboRes     DS.W 1


; code section
            ORG   ROMStart


Entry:
_Startup:
            LDS   #RAMEnd+1       ; initialize the stack pointer

            CLI                     ; enable interrupts
mainLoop:
             ;Practice 1
             ;LDAA #10
             ;ADDA #20
             ;ADDA #30
             ;STAA $1000
             
             ;Practice 2
             ;LDAA #25
             ;ADDA #35
             ;SUBA #20
             ;STAA $1001
             
             ;Practice 3
             ;LDD #$31AA
             ;ADDD #$1000
             ;STD $1002
             
             ;Practice 4
             LDD #$8183
             ADDD #$7290
             STD $1002
             LDD #$1A59
             ADDD #$7654
             STD $1000
             
             
             
             
;mainLoop:
;            LDX   #1              ; X contains counter
;couterLoop:
;            STX   Counter         ; update global.
;            BSR   CalcFibo
;            STD   FiboRes         ; store result
;            LDX   Counter
;            INX
;            CPX   #24             ; larger values cause overflow.
;            BNE   couterLoop
;            BRA   mainLoop        ; restart.
;
;CalcFibo:  ; Function to calculate fibonacci numbers. Argument is in X.
;            LDY   #$00            ; second last
;            LDD   #$01            ; last
;            DBEQ  X,FiboDone      ; loop once more (if X was 1, were done already)
;FiboLoop:
;            LEAY  D,Y             ; overwrite second last with new value
;            EXG   D,Y             ; exchange them -> order is correct again
;            DBNE  X,FiboLoop
;FiboDone:
;            RTS                   ; result in D

;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
