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
	la	$a0, meme_in # a0 is what you have to load into in order to print to the screen
	li	$v0, 4 # the documentation for syscall says 1 - int to print, 4 - address of null terminated string to print
	syscall

	la	$a0, new_meme
	li	$v0, 4
	syscall

	lw 	$a0, meme_num # meme_num is 200
	move 	$t0, $a0

	jal bif

	move $t0, $v0

w00t:
	la 	$a0, meme_out
	li 	$v0, 4
	syscall

	move $a0, $t0 # final key value is stored in t0 (which is a0 at the end of the run)
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
	sw   $ra, 0($sp) # $ra is the final jump, either 4000bc, 4000b0, or 400054, b0 is line 80 (return from bif), bc is line 86 (return again from bif)
	sw   $s0, 4($sp)
	sw   $s1, 8($sp)

	add $s0, $a0, $zero # a0 is initially set to hex c8 (200 in decimal, which is meme num)

	addi $t1, $zero, 1 # t1 is always 1
	beq  $s0, $zero, return0 # 2 base cases of fibonacci, equal to 0 or 1
	beq  $s0, $t1,   return1 # 2 base cases of fibonacci, equal to 0 or 1

	addi $a0, $s0, -1 # loop case, $a0 is n-1

	jal bif

	add $s1, $zero, $v0 # v0 is return code from jal bif

	addi $a0, $s0, -2 # other loop, $a0 is now n-2

	jal bif  # v0 is return code from jal bif

	lw 	$a0, leet_meme # leet_meme is 13371337
	move 	$t2, $a0 # t2 is now 13371337
	div $v0, $t2
	mfhi $v0 # v0 is now v0 % t2 from previous line

	add $v0, $v0, $s1 # final value is return value from n-2 recursion of fibonacci % 13371337 + value from n-1 recursion of fibonacci

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
	li 	$v0, 10 # load end code into $v0
	syscall # exit

	.data
meme_in:		.asciiz "Run progr4m run! MAUAHAHAHA..."
meme_out:		.asciiz "Nice Meme: MCA{"
meme_end:		.asciiz "}"
meme_num:		.word 200
leet_meme:	.word 13371337
new_meme:		.asciiz "\n"
