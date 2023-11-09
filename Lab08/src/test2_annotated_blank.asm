# test2.asm
# 23 March 2006 S. Harris sharris@hmc.edu
# Test MIPS instructions.
# Prelab - annotate test2.asm to explain what happens

#        Assembly                  Description                   Address  Machine
main:   ori  $t0, $0,  0x8000   # initialize $t0=0x00008000     0x00      34088000
       addi $t1, $0,  -32768    #
       ori  $t2, $t0, 0x8001    #
       beq  $t0, $t1, there     #
       slt  $t3, $t1, $t0       #
       bne  $t3, $0,  here      #
       j    there               #
here:   sub  $t2, $t2, $t0      #
       ori  $t0, $t0, 0xFF      #
there: add  $t3, $t3, $t2       #
       sub  $t0, $t2, $t0       #
       sw   $t0, 82($t3)        #
