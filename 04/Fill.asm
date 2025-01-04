// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

@8192
D=A
@pixel_num
M=D

(LOOP)
    @KBD
    D=M     // Read RAM[24576] into D
    @KBD_PUSHED
    D;JNE   // If D != 0, jump to KBD_PUSHED
    @KBD_UNPUSHED
    0;JMP   // If D == 0, jump to KBD_UNPUSHED

(KBD_PUSHED)
    @SCREEN // Address of the screen start (RAM[16384])
    D=A     // Set D to SCREEN address
    @DRAW_BLACK
    0;JMP   // Jump to DRAW_BLACK

(KBD_UNPUSHED)
    @SCREEN // Address of the screen start (RAM[16384])
    D=A     // Set D to SCREEN address
    @DRAW_WHITE
    0;JMP   // Jump to DRAW_WHITE

(DRAW_BLACK)
    @SCREEN  // SCREEN start address
    D=A     // Set D to SCREEN address
