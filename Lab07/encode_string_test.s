###########################################################################
#
#    ECE 212 Lab 7 - Fall 2023
#    encode_string test file
#
########################################################################### 

  .set noreorder
    .global main         # define main as a global label
    .text
main: 
    la   $a0, msg        # put string address in argument register $a0
    addi $a1, $zero, 4   # put character shift amount in arg reg $a1
    jal  encode_string   # call the function
    add  $0, $0, $0      # branch delay slot nop
now_decode:
    la   $a0, msg        # put string address in argument register $a0
    addi $a1, $zero, -4  # put character shift amount in arg reg $a1
    jal  encode_string   # call the function
    add  $0, $0, $0      # branch delay slot nop
done:  
    j done               # infinite loop
    add $0, $0, $0       # branch delay slot

###########################################################################
#
#    Add assembly code for encode_char function here
#
###########################################################################
        
encode_char:
    add $v0, $a0, $0  #initialize v0

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
    
###########################################################################
#
#    Add assembly code for encode_string function here
#
###########################################################################  

encode_string:

EncodeLoops:

    lbu $t8, 0($a0) #loads first char
    beq $t8, $0, Done #branch to done if done
    add $0, $0, $0
    addi $sp, $sp, -8
    sw  $ra, 0($sp)
    sw  $a0, 4($sp)
    add $a0, $t8, $0
    jal encode_char #call char encode funtion
    add $0, $0, $0
    lw  $ra, 0($sp)
    lw  $a0, 4($sp)
    addi $sp, $sp, 8
    sb $v0, 0($a0) #stores new value
    addi $a0, $a0, 1 #next xhar
    j EncodeLoops #back to top
    add $0, $0, $0
Done:

    jr $ra
    add $0, $0, $0


###########################################################################
#
#    data segment assembler directives to allocate storage for string msg
#
########################################################################### 
    
      .data
msg:
      .asciz "WELCOME BACK MY FRIENDS 2 THE show THAT NEVER ENDS"


