# Can U reverse spim-er 3017?
# R U a memel0rd lik le l00per kn0wn as kierk

# l4st ye4r we le4rned th4t sEcUrItY tHr0uGh 0bScUrItY is a bad meme
#	th1s ye4r you will never get my fl4g.. well not never but not before the competition ends..
# U also m1ght run 0ut 0f memory by th3n
#
# run my new new asm script for the mipster skeletal processer 2.0
# it will print muh flag
# much improve on l4st ye4r, n0w U R bones lik me b4 it runs MUAHWHAHWHUEHUEHUEHUE

#░░░░░░░░░░░░▄▐░░░░░░
#░░░░░░▄▄▄░░▄██▄░░░░░
#░░░░░▐▀█▀▌░░░░▀█▄░░░
#░░░░░▐█▄█▌░░░░░░▀█▄░
#░░░░░░▀▄▀░░░▄▄▄▄▄▀▀░
#░░░░▄▄▄██▀▀▀▀░░░░░░░
#░░░█▀▄▄▄█░▀▀░░░░░░░░
#░░░▌░▄▄▄▐▌▀▀▀░░░░░░░
#▄░▐░░░▄▄░█░▀▀░░░░░░░ U HAVE BEEN RE-SPOOKED BY THE
#▀█▌░░░▄░▀█▀░▀░░░░░░░ SPOOKY SKILENTON
#░░░░░░░▄▄▐▌▄▄░░░░░░░ CAN U REVERSE THE CURSE?
#░░░░░░░▀███▀█░▄░░░░░
#░░░░░░▐▌▀▄▀▄▀▐▄░░░░░
#░░░░░▐▀░░░░░░▐▌░░░░░
#░░░░░░█░░░░░░░░█░░░░
#░░░░░▐▌░░░░░░░░░█░░░
#░░░░░█░░░░░░░░░░▐▌░░

	.text

.globl main
main:
	la	$a0, meme_in
	li	$v0, 4
	syscall

	la	$a0, new_meme
	li	$v0, 4
	syscall

	lw 	$a0, meme_num
	move 	$t0, $a0

	jal bif

	move $t0, $v0

w00t:
	la 	$a0, meme_out
	li 	$v0, 4
	syscall

	move $a0, $t0
	li $v0, 1
	syscall

	la	$a0, meme_end
	li	$v0, 4
	syscall

	la	$a0, new_meme
	li	$v0, 4
	syscall

	j	rekt

bif:
	addi $sp, $sp, -12
	sw   $ra, 0($sp)
	sw   $s0, 4($sp)
	sw   $s1, 8($sp)

	add $s0, $a0, $zero

	addi $t1, $zero, 1
	beq  $s0, $zero, return0
	beq  $s0, $t1,   return1

	addi $a0, $s0, -1

	jal bif

	add $s1, $zero, $v0

	addi $a0, $s0, -2

	jal bif

	lw 	$a0, leet_meme
	move 	$t2, $a0
	div $v0, $t2
	mfhi $v0

	add $v0, $v0, $s1

	exitbif:
			lw   $ra, 0($sp)
			lw   $s0, 4($sp)
			lw   $s1, 8($sp)
			addi $sp, $sp, 12
			jr $ra

	return1:
			li $v0,1
			j exitbif

	return0:
			li $v0,0
			j exitbif

rekt:
	li 	$v0, 10
	syscall

	.data
meme_in:		.asciiz "Run progr4m run! MAUAHAHAHA..."
meme_out:		.asciiz "Nice Meme: MCA{"
meme_end:		.asciiz "}"
meme_num:		.word 200
leet_meme:	.word 13371337
new_meme:		.asciiz "\n"
