###########################################################################
#
#    ECE 212 Lab 7 - Fall 2023
#    encode_char test file
#
########################################################################### 
 
    .set noreorder
    .global main             # define main as a global label
    .text
main: 
    addi $a0, $0, 'A'        # put character to encode in $a0
    addi $a1, $zero, 4       # put character shift amount in arg reg $a1
    jal  encode_char         # call the function
    add  $0, $0, $0          # branch delay slot nop
encode_another:
    addi $a0, $0, 'Z'        # put character to encode in $a0
    addi $a1, $zero, 4       # put character shift amount in arg reg $a1
    jal  encode_char         # call the function
    add  $0, $0, $0          # branch delay slot nop
done:  
    j done                   # infinite loop
    add $0, $0, $0           # branch delay slot

###########################################################################
#
#    Add your encode_char assembly code below this comment
#
###########################################################################
    
encode_char:
    add $v0, $0, $0

    addi $t0, $0, 'A' #stores the ASCII value A
    addi $t1, $0, 'Z' #stores the ASCII value Z

    slt $t2, $a0, $t0 #check if c<'A'
    slt $t3, $t1, $a0 #check if c>'Z'
    or $t4, $t2, $t3 #or both of the above
    bne $t4, $0, ret #if (c < 'A' || c > 'Z')
    add $0, $0, $0

    addi $t5, $a0, -65 #offset = $t5 = c - 'A'.
    sub $t6, $t5, $a1 #offset - k
    addi $t6, $t6, 26 #add 26
    div $t6, 26 #get mod valuer
    mfhi $t5 #offset updated value

    addi $v0, $t5, 65 #return offset+'A'
    jr $ra
    add $0, $0, $0


ret:
    jr $ra
    add $0, $0, $0

