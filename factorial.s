.text
.global main
main:
	push {r11, lr}
	add r11, sp, #0
	@ Create a array with 1 elements
	sub sp, sp, #3008

	@ Declare last index in array 
	mov r2, #0
	sub r2, r2, #2992
	sub r2, r2, #8

	@ Assign 1 to the last element value
	mov r3, #1
	strb r3, [r11, r2]

	@ Remainder
	mov r5, #0

	@ Count
	mov r1, #2

	@ Total
	mov r4, #1

loop_1:
	cmp r1, #1000
	bgt print

loop_2:
	cmp r2, #0
	beq loop_1_continue
	ldrb r3, [r11, r2]
	mul r4, r3, r1
	add r4, r4, r5
	mov r5, #0
	cmp r4, #9
	ble less_equal
	ldr r3, =0x1999999A
	umull r9,r3,r4,r3
	mov r5, r3
	mov r6, #10
	mul r3, r3, r6
	sub r3, r4, r3
	strb r3, [r11, r2]
	b loop_2_continue

less_equal:
	strb r4, [r11, r2]

loop_2_continue:
	add r2, r2, #1
	b loop_2

loop_1_continue:
	mov r5, #0
	mov r4, #0
	mov r2, #0
	sub r2, r2, #2992
	sub r2, r2, #8
	add r1, r1, #1
	b loop_1

print:
	mov r8, #0
	mov r9, #0
	sub r9, r9, #2992
	sub r9, r9, #8
loop:
	cmp r8, r9
	blt end
	ldrb r0, [r11, r8]
	add r0, r0, #48
	bl putchar
	sub r8, r8, #1
	b loop

end:
	add sp, r11, #0
	pop {r11, pc}