InFileName: .asciz "in"
OutFileName: .asciz "out"
Space: .asciz " "
mov r1, #0
ldr r0, =InFileName
swi 0x66
mov r10, r0
mov r0, r10
mov r1, #36
mov r0, #4
mul r9, r1, r0
sub sp, sp, r9
mov r2, sp
sub sp, sp, r9
mov r3, sp
mov r7, #6
mov r4, #0
l1:
	mov r5, #0
	l2:
		mul r0, r4, r7
		add r9, r0, r5
		mov r0, #4
		mul r1, r0, r9
		mov r0, r10
		swi 0x6c
		str r0, [r2, r1]
		add r5, r5, #1
	cmp r5, r7
	bne l2
	add r4, r4, #1
cmp r4, r7
bne l1
mov r4, #0
l3:
	mov r5, #0
	l4:
		mul r0, r4, r7
		add r9, r0, r5
		mov r0, #4
		mul r1, r0, r9
		mov r0, r10
		swi 0x6c
		str r0, [r3, r1]
		add r5, r5, #1
	cmp r5, r7
	bne l4
	add r4, r4, #1
cmp r4, r7
bne l3
mov r0, r10
swi 0x68
mov r4,#0
l5:
	mov r5, #0
	l6:
		mov r6, #0
		mov r8, #0
		l7:
			mov r11, #4
			mul r10, r4, r7
			add r10, r10, r6
			mul r9, r10, r11  
			ldr r0, [r2, r9]
			mul r10, r6, r7
			add r10, r10, r5
			mul r9, r10, r11
			ldr r1, [r3, r9]
			mul r9, r0, r1
			add r8, r8, r9
			add r6, r6, #1
		cmp r6, r7
		bne l7
		mov r1, #2
		ldr r0, =OutFileName
		swi 0x66
		@mov r0, #1
		mov r1, r8
		swi 0x6b
		ldr r1, =Space
		swi 0x69
		swi 0x68
		add r5, r5, #1
	cmp r5, r7
	bne l6
	mov r1, #2
	ldr r0, =OutFileName
	swi 0x66
	@mov r0, #1
	ldr r1, =Space
	swi 0x69
	swi 0x68
	add r4, r4, #1
cmp r4, r7
bne l5
swi 0x11