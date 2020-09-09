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
	.globl _VPOKE
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
;src\VDP_VPRINT.c:25: unsigned int GetVRAMaddressByPosition(char column, char line)
;	---------------------------------
; Function GetVRAMaddressByPosition
; ---------------------------------
_GetVRAMaddressByPosition::
	push	ix
	ld	ix,#0
	add	ix,sp
;src\VDP_VPRINT.c:27: return BASE10 + (line*32)+column;
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
;src\VDP_VPRINT.c:28: }
	pop	ix
	ret
;src\VDP_VPRINT.c:39: void VPRINT(char column, char line, char* text)
;	---------------------------------
; Function VPRINT
; ---------------------------------
_VPRINT::
;src\VDP_VPRINT.c:41: unsigned int vaddr = GetVRAMaddressByPosition(column, line);
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
;src\VDP_VPRINT.c:42: VPrintString(vaddr, text);
	ld	iy, #4
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	push	bc
	push	hl
	call	_VPrintString
	pop	af
	pop	af
;src\VDP_VPRINT.c:43: }
	ret
;src\VDP_VPRINT.c:55: void VPRINTN(char column, char line, char* text, unsigned int length)
;	---------------------------------
; Function VPRINTN
; ---------------------------------
_VPRINTN::
;src\VDP_VPRINT.c:57: unsigned int vaddr = GetVRAMaddressByPosition(column, line);
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
;src\VDP_VPRINT.c:58: CopyToVRAM((unsigned int) text,vaddr,length);
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
;src\VDP_VPRINT.c:59: }
	ret
;src\VDP_VPRINT.c:71: void VPrintString(unsigned int vaddr, char* text)
;	---------------------------------
; Function VPrintString
; ---------------------------------
_VPrintString::
	push	ix
	ld	ix,#0
	add	ix,sp
;src\VDP_VPRINT.c:73: while(*(text)) VPOKE(vaddr++,*(text++));
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	e, 4 (ix)
	ld	d, 5 (ix)
00101$:
	ld	a, (bc)
	or	a, a
	jr	Z,00104$
	ld	h, a
	inc	bc
	push	de
	pop	iy
	inc	de
	push	bc
	push	de
	push	hl
	inc	sp
	push	iy
	call	_VPOKE
	pop	af
	inc	sp
	pop	de
	pop	bc
	jr	00101$
00104$:
;src\VDP_VPRINT.c:74: }
	pop	ix
	ret
;src\VDP_VPRINT.c:87: void VPrintNumber(char column, char line, unsigned int value, char length)
;	---------------------------------
; Function VPrintNumber
; ---------------------------------
_VPrintNumber::
;src\VDP_VPRINT.c:89: unsigned int vaddr = GetVRAMaddressByPosition(column, line);
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
;src\VDP_VPRINT.c:91: VPrintNum(vaddr, value, length);
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
;src\VDP_VPRINT.c:92: }
	ret
;src\VDP_VPRINT.c:103: void VPrintNum(unsigned int vaddr, unsigned int value, char length)
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
;src\VDP_VPRINT.c:106: char text[]="     ";
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
;src\VDP_VPRINT.c:108: num2Dec16(value, text); 
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
;src\VDP_VPRINT.c:111: CopyToVRAM((unsigned int) text + (5-length), vaddr, length);
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
;src\VDP_VPRINT.c:112: }
	ld	sp, ix
	pop	ix
	ret
;src\VDP_VPRINT.c:123: void num2Dec16(unsigned int aNumber, char *address)
;	---------------------------------
; Function num2Dec16
; ---------------------------------
_num2Dec16::
;src\VDP_VPRINT.c:185: __endasm;
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
;jr	$Num3
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
;ret	(endsam add a ret)
;src\VDP_VPRINT.c:186: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
