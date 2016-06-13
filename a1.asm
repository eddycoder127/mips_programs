	.data
message:	.asciiz	"Enter the string\n"
newline:	.asciiz "\n"
list: .space 100000

	.text
main:
#la $a0, message
#	li $v0, 4
#	syscall
	la $a0, list
	move $s0,$a0
	li $v0,8
	syscall
	li $t0,0
	lb $s1,($s0)
	li $t2,97
	li $s2, 0	       #stores length
length:
	beq $s1,$zero,over
	addi $s2, $s2, 1
	addi $s0, $s0, 1
	lb $s1,($s0)       #copy the string likewise
	b length
over:
	move $s0,$a0
	lb $s1,($s0)
loop:	
	ble $s2,$zero,done
	bge $s1,$t2,lower 
	addi $s1,$s1,32    #to lowercase
	sb $s1,($s0)
	b update           #next byte
lower:
	addi $s1,$s1,-32   #to uppercase
	sb $s1,($s0)
	b update           #next byte
update:
	addi $s0,$s0,2     #load alternate byte
	lb $s1,($s0)
	addi $s2, $s2, -2
	ble $s2,1,done
	b loop
done:
	la $a0,list        #print the string after modification
	li $v0,4
	syscall
	la $a0,newline     #newline
	li $v0,4
	syscall
	li $v0,10          #exit
	syscall




