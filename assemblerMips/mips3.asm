.data
mes: .asciiz %str
.macro string(%str)
.text

li $v0,4
la $a0,mes 
syscall
.end_macro
.text
li $v0,5
syscall
move $t0, $v0

li $t1, 2024
sub $t0, $t1,$t0

bge $t0, 16, string(

li $v0,1
la $a0, ($t0)
syscall

