	.data
array:	.space	100000
addr:	.word	2147400000
blank:	.asciiz	" "
	.text
main:
	li $v0,5
	syscall
	move $t0,$v0
	la $s0,array
	lw $s1,addr
	li $t1,0
	li $t2,0	#stores sum
scanloop:
	beq $t1,$t0,printsum
	li $v0,5
	syscall
	move $t3,$v0
	sw $t3,($s0)
	add $t2, $t2, $t3
	sw $t2,($s1)
	addi $s0,$s0,4
	addi $s1,$s1,4
	addi $t1,$t1,1
	b scanloop
printsum:
	li $t1,0
	lw $s0, addr
ploop:
	beq $t1, $t0, end
	lw $t3,($s0)
	addi $s0,$s0,4
	addi $t1,$t1,1
	move $a0,$t3
	li $v0,1
	syscall
	la $a0, blank
	li $v0,4
	syscall
	b ploop
end:
	li $v0,10
	syscall

	





