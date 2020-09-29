;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module VDP_VPRINT
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CopyToVRAM
	.globl _CSTATE
	.globl _GetVRAMaddressByPosition
	.globl _VPRINT
	.globl _VPRINTN
	.globl _VPrintString
	.globl _VPrintNumber
	.globl _VPrintNum
	.globl _num2Dec16
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_CSTATE::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src\VDP_VPRINT.c:32: unsigned int GetVRAMaddressByPosition(char column, char line)
;	---------------------------------
; Function GetVRAMaddressByPosition
; ---------------------------------
_GetVRAMaddressByPosition::
	push	ix
	ld	ix,#0
	add	ix,sp
;src\VDP_VPRINT.c:34: return BASE10 + (line*32)+column;
	ld	l, 5 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x1800
	add	hl, bc
	ld	c, 4 (ix)
	ld	b, #0x00
	add	hl, bc
;src\VDP_VPRINT.c:35: }
	pop	ix
	ret
;src\VDP_VPRINT.c:47: void VPRINT(char column, char line, char* text)
;	---------------------------------
; Function VPRINT
; ---------------------------------
_VPRINT::
;src\VDP_VPRINT.c:49: unsigned int vaddr = GetVRAMaddressByPosition(column, line);
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_GetVRAMaddressByPosition
	pop	af
;src\VDP_VPRINT.c:50: VPrintString(vaddr, text);
	ld	iy, #4
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	push	bc
	push	hl
	call	_VPrintString
	pop	af
	pop	af
;src\VDP_VPRINT.c:51: }
	ret
;src\VDP_VPRINT.c:64: void VPRINTN(char column, char line, char* text, unsigned int length)
;	---------------------------------
; Function VPRINTN
; ---------------------------------
_VPRINTN::
;src\VDP_VPRINT.c:66: unsigned int vaddr = GetVRAMaddressByPosition(column, line);
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_GetVRAMaddressByPosition
	pop	af
;src\VDP_VPRINT.c:67: CopyToVRAM((unsigned int) text, vaddr, length);
	ld	iy, #4
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	iy, #6
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	push	de
	push	hl
	push	bc
	call	_CopyToVRAM
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src\VDP_VPRINT.c:68: }
	ret
;src\VDP_VPRINT.c:79: void VPrintString(unsigned int vaddr, char* text)
;	---------------------------------
; Function VPrintString
; ---------------------------------
_VPrintString::
;src\VDP_VPRINT.c:82: while(text[length]) length++;
	ld	e, #0x00
00101$:
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z,00103$
	inc	e
	jr	00101$
00103$:
;src\VDP_VPRINT.c:84: CopyToVRAM((unsigned int) text, vaddr, length);
	ld	d, #0x00
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	de
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_CopyToVRAM
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src\VDP_VPRINT.c:85: }
	ret
;src\VDP_VPRINT.c:99: void VPrintNumber(char column, char line, unsigned int value, char length)
;	---------------------------------
; Function VPrintNumber
; ---------------------------------
_VPrintNumber::
;src\VDP_VPRINT.c:101: unsigned int vaddr = GetVRAMaddressByPosition(column, line);
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_GetVRAMaddressByPosition
	pop	af
	ld	c, l
	ld	b, h
;src\VDP_VPRINT.c:103: VPrintNum(vaddr, value, length);
	ld	hl, #6+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #5
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_VPrintNum
	pop	af
	pop	af
	inc	sp
;src\VDP_VPRINT.c:104: }
	ret
;src\VDP_VPRINT.c:116: void VPrintNum(unsigned int vaddr, unsigned int value, char length)
;	---------------------------------
; Function VPrintNum
; ---------------------------------
_VPrintNum::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
;src\VDP_VPRINT.c:119: char text[]="     ";
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	a, #0x20
	ld	(de), a
	ld	l, e
	ld	h, d
	inc	hl
	ld	(hl), #0x20
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl), #0x20
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x20
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x20
	ld	hl, #0x0005
	add	hl, de
	ld	(hl), #0x00
;src\VDP_VPRINT.c:121: num2Dec16(value, text); 
	ld	c, e
	ld	b, d
	push	de
	push	bc
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	call	_num2Dec16
	pop	af
	pop	af
	pop	de
;src\VDP_VPRINT.c:124: CopyToVRAM((unsigned int) text + (5-length), vaddr, length);
	ld	c, 8 (ix)
	ld	b, #0x00
	ld	l, 8 (ix)
	ld	h, #0x00
	ld	a, #0x05
	sub	a, l
	ld	l, a
	ld	a, #0x00
	sbc	a, h
	ld	h, a
	add	hl, de
	push	bc
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	push	bc
	push	hl
	call	_CopyToVRAM
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src\VDP_VPRINT.c:125: }
	ld	sp, ix
	pop	ix
	ret
;src\VDP_VPRINT.c:136: void num2Dec16(unsigned int aNumber, char *address) __naked
;	---------------------------------
; Function num2Dec16
; ---------------------------------
_num2Dec16::
;src\VDP_VPRINT.c:198: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(ix)
	ld	H,5(ix)
	ld	E,6(ix)
	ld	D,7(ix)
	ld	A,#32 ;ASCII value for space
	ld	(#_CSTATE),A
	ld	BC,#-10000
	call	$Num1
	ld	BC,#-1000
	call	$Num1
	ld	BC,#-100
	call	$Num1
	ld	C,#-10
	call	$Num1
	ld	C,B
	call	$Num1
;END
	pop	IX
	ret
	$Num1:
	ld	A,#47 ; 0 ASCII char - 1
	$Num2:
	inc	A
	add	HL,BC
	jr	C,$Num2
	sbc	HL,BC
	cp	#48
	jr	NZ,$Num3 ;if A!=0 then goto $Num3
	ld	A,(#_CSTATE)
	jr	$Num4
	$Num3:
	push	AF
	ld	A,#48 ;ASCII value for 0
	ld	(#_CSTATE),A
	pop	AF
	$Num4:
	ld	(DE),A
	inc	DE
	ret
;src\VDP_VPRINT.c:199: }
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
