.data
    v: .word 0,0,0,0,0,0,0,0,0,0,0,0


.text
.globl main
main:
    la t1,v  #get 1st location of v
     sw zero,0(t1)    #val of v[0]
    addi t1,t1,4
    li a1,1
    sw a1,0(t1)  #val of v[1]  
     li t0,10  #size of remaining array
    	loop:
        addi t1,t1,4      #next location of V
        addi a2,t1,-4     #prevv location of v
        addi a3,t1,-8        #before prev location of v
        
        lw t2,0(a2)
        lw t3,0(a3) 
        add a4,t2,t3  #calc val for location of v
        
        sw a4,0(t1)  #save in v
        j next_loop   #jump to next loop
   next_loop:
       addi t0,t0,-1   #decrement elements in array
       bnez t0,loop     #if not zero loop back