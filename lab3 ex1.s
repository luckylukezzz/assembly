.data 
    A: .word 1,2,3,4,5,6,7,8,9
    B: .word 0,0,0
    
    
.text
    main:
        addi sp sp -16    #move stack pointer
        sw ra 0(sp)            #save return adderss in stack ponters mem loc
        
        li s1 3      #no of loops
        li s2 0      #loop count
        
       
        
        la s3 A      #addes of A n B
        la s4 B
        li a0 0       #J value
        loop:
            beq s2 s1 end    #call end at end of loop
           
            mv a1 s3     #get address of A as args
             
            sw s1 4(sp)    # save loops and count in stack
            sw s2 8(sp)
            sw s3 12(sp)
            jal triplet
            lw s1 4(sp)  #restore regs
            lw s2 8(sp)
            lw s3 12(sp)
            
            addi s4 s4 4   #Bs next address
            addi a0 a0 3   # J val inc
            addi s2 s2 1    #loop counter inc
            j loop
             
                 
        end:
            lw ra 0(sp)
            addi sp sp 16
            li a7 93
            ecall
        
    
    triplet:
         addi sp sp -16   #stack frame
         li s5 3    #no of loops
         li s6 0    #SUM
         li s3 4
         mul s2 s3 a0  # multiply j val by 4
         add a1 a1 s2   #A s starting address
         loop2:
             beqz s5 end2
             lw s1 0(a1)   #load word of A
             add s6 s6 s1   #add to sum
             addi a1 a1 4   #A s next address
             addi s5 s5 -1   #dec no of loops
             j loop2
         
         end2:
          sw s6 0(s4)  #save in Bs address
          addi sp sp 16  #pop frame
             	ret