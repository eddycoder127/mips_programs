.data
array:	.space	100000
	.text
main:
	li $v0,5       # input size of array
	syscall
	move $t0,$v0
	la $s0,array   # array space
	li $t1,0
	lw $t2,($s0)   # stores max
loop:
	beq $t1,$t0,printmax
	li $v0,5       # input element
	syscall
	move $t3,$v0
	sw $t3,($s0)
	addi $s0,$s0,4
	addi $t1,$t1,1
	ble $t3,$t2,loop #check element for max
	move $t2,$t3
	b loop
	
printmax:
	move $a0,$t2   #print max
	li $v0,1
	syscall
	li $v0,10      #exit
	syscall