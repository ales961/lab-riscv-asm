.data
N:
.word 5
M:
.word 4
matrix:
.word 8, 9, 6, 2, 1
.word 5, 4, 7, 4, 6
.word 3, 4, 3, 8, 9
.word 4, 91, 4, 0, 9
result:
.word 0x7FFFFFFF

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process
la a2, M
la a3, result
call print
call exit

print:
addi a0, x0, 1 # print result
lw a1, 0(a5)
ecall
addi a0, x0, 11 # print new line
addi a1, x0, 10
ecall
ret

exit:
addi a0, x0, 10
ecall

process:
lw t1, 0(a2) # N
lw t2, 0(a3) # M

addi t4, x0, 0 # row pointer

init:
addi t3, x0, 0 # row element number

cycle:
lw t6, 0(a4) # load value from array
addi a4, a4, 4 # increment array pointer
lw t2, 0(a5)
bge t6, t2, skip # find min
sw t6, 0(a5)
skip:
addi t3, t3, 1
blt t3, t1, cycle
addi t4, t4, 1
blt t4, t2, init
ret