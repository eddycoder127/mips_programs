	.text
main:
	li $v0, 5
	syscall
	move $t0, $v0	#t0 has x-base
	li $v0, 5
	syscall
	move $t1, $v0	#t1 has n-power
	li $t2, 1
	li $t3, 1	#stores product
loop:
	bgt $t2, $t1, end  #iterative multiplication
	mul $t3, $t3, $t0
	addi $t2, $t2 ,1
	b loop
end:
	move $a0, $t3      #print result
	li $v0, 1
	syscall
	li $v0, 10
	syscall	
