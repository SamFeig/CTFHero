	.text

	.globl main
main:
	la	$a0, meme_in
	li	$v0, 4
	syscall

	li 	$v0, 8
	syscall
	move 	$t0, $a0

	li 	$t1, 1
	li	$t2, 1
	li 	$t3, 0

wow:
	add	$t2, $t2, $t1
	addi	$t1, $t1, 1
	lb	$t4, 0($t0)
	xor	$t4, $t4, $t2
	sb	$t4, 0($t0)
	addi	$t4, $t1, -13
	addi	$t0, $t0, 1
	bne	$t3, $t4, wow
	j 	w00t

w00t:
	la 	$a0, meme_out
	li 	$v0, 4
	syscall

	addi 	$t0, $t0, -12
	move	$a0, $t0
	li 	$v0, 4
	syscall

	la	$a0, new_meme
	li	$v0, 4
	syscall

rekt:
	li 	$v0, 10
	syscall

	.data
meme_in:		.asciiz "Enter rustled flag: "
meme_out: 		.asciiz "Nice Meme: "
new_meme:		.asciiz "\n"