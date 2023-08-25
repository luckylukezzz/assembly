.data
array:  .word 1,2,3,4,5,1,2,3,4,5,6,7
array_2: .word 3,7,8,2,7,5,6,7,5,2,4,8
array_c: .word 0,0,0,0,0,0,0,0,0,0,0,0

.text
.globl main
main:
    li t0,12  #size of array
    la t1,array_c  #get 1st location of C
    la t2,array    #location of A
    la t3,array_2  #1st location of B
    addi t3,t3,16  #last location
    
    	loop:
        lw t4,0(t2)    #val of A
        lw t5,0(t3)    #val of b
         add t6,t4,t5  #add to c
        sw t6,0(t1)    #save in c mem
        j next_loop   #jump to next loop
   next_loop:
       addi t0,t0,-1   #decrement elements in array
       addi t2,t2,4    #incerement address
       addi t3,t3,-4
       addi t1,t1,4
       bnez t0,loop     #if not zero loop back
        		
    



