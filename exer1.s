.data
array:  .word 0, 1, 2, 7, -8, 4, 5, 12, 11, -2, 6, 3   # Declare an array of elements
newarr: .word 0    #new array to store even + positive vals

.text
.globl main
main:
    li   t0, 12         # array size
    li   t1, 1          # just 1
    la   t3, newarr     # beginning of newarr
    la   t4, array      # Load the address of array into t4
    beqz t0, end
loop:
    lw   t5, 0(t4)      # Load value from array
    addi t4, t4, 4      # Increment array address
    and  t6, t5, t1     # Check if even (t6 become 0 if even 1 if odd)
    bnez t6, next_iter  # If odd,new loop
    bltz t5, next_iter  # If negative, new loop
    sw   t5, 0(t3)      # Save value to newarr
    addi t3, t3, 4      # Increment newarr address
    j    next_iter
    
next_iter:
    addi t0, t0, -1     # Decrement array size
    bnez t0, loop       # If array size is not zero, repeat loop
    
end:
    nop