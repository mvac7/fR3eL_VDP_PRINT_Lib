;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module Test
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _VPrintNum
	.globl _VPrintNumber
	.globl _VPrintString
	.globl _VPRINTN
	.globl _VPRINT
	.globl _GetVRAMaddressByPosition
	.globl _CopyToVRAM
	.globl _FillVRAM
	.globl _COLOR
	.globl _SCREEN
	.globl _TILESET_FONT
	.globl _text02
	.globl _text01
	.globl _inkey
	.globl _WAIT
	.globl _test_SC1
	.globl _test_SC2
	.globl _test
	.globl _TwoSeconds
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;src\Test.c:129: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src\Test.c:132: test_SC1();
	call	_test_SC1
;src\Test.c:134: test_SC2();
;src\Test.c:147: return;
;src\Test.c:148: }
	jp  _test_SC2
_text01:
	.ascii "Test VPRINT SDCC library"
	.db 0x00
_text02:
	.ascii "VDP_VPRINT Lib v1.1"
	.db 0x00
_TILESET_FONT:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x4c	; 76	'L'
	.db #0x4e	; 78	'N'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x41	; 65	'A'
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x63	; 99	'c'
	.db #0x77	; 119	'w'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x5c	; 92
	.db #0x62	; 98	'b'
	.db #0x70	; 112	'p'
	.db #0x5e	; 94
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xba	; 186
	.db #0xba	; 186
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xdd	; 221
	.db #0xeb	; 235
	.db #0xf7	; 247
	.db #0xeb	; 235
	.db #0xdd	; 221
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x7c	; 124
	.db #0x28	; 40
	.db #0x7c	; 124
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0xd0	; 208
	.db #0x7c	; 124
	.db #0x16	; 22
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x6c	; 108	'l'
	.db #0x18	; 24
	.db #0x36	; 54	'6'
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0xd8	; 216
	.db #0x7a	; 122	'z'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x7a	; 122	'z'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xce	; 206
	.db #0xd6	; 214
	.db #0xe6	; 230
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x7c	; 124
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x7c	; 124
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7e	; 126
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x82	; 130
	.db #0xba	; 186
	.db #0xaa	; 170
	.db #0xbe	; 190
	.db #0x80	; 128
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfc	; 252
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xce	; 206
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xd8	; 216
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xcc	; 204
	.db #0xf8	; 248
	.db #0xcc	; 204
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xee	; 238
	.db #0xfe	; 254
	.db #0xd6	; 214
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xe6	; 230
	.db #0xf6	; 246
	.db #0xde	; 222
	.db #0xce	; 206
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xd6	; 214
	.db #0xcc	; 204
	.db #0x7a	; 122	'z'
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfc	; 252
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x7c	; 124
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x6c	; 108	'l'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xd6	; 214
	.db #0xfe	; 254
	.db #0xee	; 238
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x6c	; 108	'l'
	.db #0x38	; 56	'8'
	.db #0x6c	; 108	'l'
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x06	; 6
	.db #0x7e	; 126
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x7e	; 126
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0xf8	; 248
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7e	; 126
	.db #0x06	; 6
	.db #0x7c	; 124
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x70	; 112	'p'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc6	; 198
	.db #0xcc	; 204
	.db #0xf8	; 248
	.db #0xcc	; 204
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xd6	; 214
	.db #0xd6	; 214
	.db #0xd6	; 214
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0xe6	; 230
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7e	; 126
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0xe6	; 230
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0xc0	; 192
	.db #0x7c	; 124
	.db #0x06	; 6
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x7c	; 124
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x6c	; 108	'l'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xd6	; 214
	.db #0xfe	; 254
	.db #0xee	; 238
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x6c	; 108	'l'
	.db #0x38	; 56	'8'
	.db #0x6c	; 108	'l'
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7e	; 126
	.db #0x06	; 6
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0xfc	; 252
	.db #0x00	; 0
;src\Test.c:155: char inkey() __naked
;	---------------------------------
; Function inkey
; ---------------------------------
_inkey::
;src\Test.c:161: __endasm;
	call	0x009F
	ld	L,A
	ret
;src\Test.c:162: }
;src\Test.c:168: void WAIT(uint cicles)
;	---------------------------------
; Function WAIT
; ---------------------------------
_WAIT::
;src\Test.c:171: for(i=0;i<cicles;i++) HALT;
	ld	bc, #0x0000
00103$:
	ld	hl, #2
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	ret	NC
	halt	
	inc	bc
;src\Test.c:172: return;
;src\Test.c:173: }
	jr	00103$
;src\Test.c:181: void test_SC1()
;	---------------------------------
; Function test_SC1
; ---------------------------------
_test_SC1::
;src\Test.c:183: COLOR(LIGHT_GREEN,DARK_GREEN,DARK_GREEN);    
	ld	de, #0x0c0c
	push	de
	ld	a, #0x03
	push	af
	inc	sp
	call	_COLOR
	pop	af
	inc	sp
;src\Test.c:184: SCREEN(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_SCREEN
	inc	sp
;src\Test.c:186: CopyToVRAM((uint) TILESET_FONT,BASE7,123*8);  
	ld	hl, #0x03d8
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #_TILESET_FONT
	push	hl
	call	_CopyToVRAM
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src\Test.c:188: VPRINT(24,23,"SCREEN 1");
	ld	hl, #___str_2
	push	hl
	ld	de, #0x1718
	push	de
	call	_VPRINT
	pop	af
	pop	af
;src\Test.c:190: test();
	call	_test
;src\Test.c:192: VPRINT(0,22,"Press any key");
	ld	hl, #___str_3
	push	hl
	ld	a, #0x16
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\Test.c:193: inkey();  
;src\Test.c:195: return;
;src\Test.c:196: }
	jp  _inkey
___str_2:
	.ascii "SCREEN 1"
	.db 0x00
___str_3:
	.ascii "Press any key"
	.db 0x00
;src\Test.c:200: void test_SC2()
;	---------------------------------
; Function test_SC2
; ---------------------------------
_test_SC2::
;src\Test.c:202: COLOR(15,4,14);    
	ld	de, #0x0e04
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_COLOR
	pop	af
	inc	sp
;src\Test.c:203: SCREEN(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_SCREEN
	inc	sp
;src\Test.c:204: FillVRAM(BASE10,0x800,32);
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, #0x0800
	push	hl
	ld	h, #0x18
	push	hl
	call	_FillVRAM
	pop	af
;src\Test.c:207: CopyToVRAM((uint) TILESET_FONT,BASE12,123*8);
	inc	sp
	ld	hl,#0x03d8
	ex	(sp),hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #_TILESET_FONT
	push	hl
	call	_CopyToVRAM
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src\Test.c:208: CopyToVRAM((uint) TILESET_FONT,BASE12+BANK1,123*8);
	ld	hl, #0x03d8
	push	hl
	ld	hl, #0x0800
	push	hl
	ld	hl, #_TILESET_FONT
	push	hl
	call	_CopyToVRAM
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src\Test.c:209: CopyToVRAM((uint) TILESET_FONT,BASE12+BANK2,123*8); 
	ld	hl, #0x03d8
	push	hl
	ld	hl, #0x1000
	push	hl
	ld	hl, #_TILESET_FONT
	push	hl
	call	_CopyToVRAM
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src\Test.c:211: FillVRAM(BASE11,0x1800,0xF4); 
	ld	a, #0xf4
	push	af
	inc	sp
	ld	hl, #0x1800
	push	hl
	ld	h, #0x20
	push	hl
	call	_FillVRAM
	pop	af
;src\Test.c:213: VPRINT(24,23,"SCREEN 2");
	inc	sp
	ld	hl,#___str_4
	ex	(sp),hl
	ld	de, #0x1718
	push	de
	call	_VPRINT
	pop	af
	pop	af
;src\Test.c:215: test();  
	call	_test
;src\Test.c:217: VPRINT(0,22,"Press a key to exit");
	ld	hl, #___str_5
	push	hl
	ld	a, #0x16
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\Test.c:218: inkey();  
;src\Test.c:220: return;
;src\Test.c:221: }
	jp  _inkey
___str_4:
	.ascii "SCREEN 2"
	.db 0x00
___str_5:
	.ascii "Press a key to exit"
	.db 0x00
;src\Test.c:225: void test()
;	---------------------------------
; Function test
; ---------------------------------
_test::
;src\Test.c:230: VPRINT(0,0,text01);
	ld	hl, #_text01
	push	hl
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
;src\Test.c:231: VPRINT(0,1,text02);
	ld	hl, #_text02
	ex	(sp),hl
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\Test.c:233: TwoSeconds();
	call	_TwoSeconds
;src\Test.c:235: VPRINT(0,3,">Test VPRINT");
	ld	hl, #___str_6
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\Test.c:236: TwoSeconds();
	call	_TwoSeconds
;src\Test.c:237: VPRINT(3,4,"Alea iacta est");
	ld	hl, #___str_7
	push	hl
	ld	de, #0x0403
	push	de
	call	_VPRINT
	pop	af
	pop	af
;src\Test.c:238: TwoSeconds();
	call	_TwoSeconds
;src\Test.c:240: VPRINT(0,6,">Test VPRINTN [16chars]");
	ld	hl, #___str_8
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\Test.c:241: TwoSeconds();
	call	_TwoSeconds
;src\Test.c:242: VPRINTN(2,7,"Gaudeamus igitur iuvenes dum sumus",16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #___str_9
	push	hl
	ld	de, #0x0702
	push	de
	call	_VPRINTN
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src\Test.c:243: TwoSeconds();
	call	_TwoSeconds
;src\Test.c:245: VPRINT(0,9,">test GetVRAMaddressByPosition()");
	ld	hl, #___str_10
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\Test.c:246: TwoSeconds();
	call	_TwoSeconds
;src\Test.c:247: vaddr = GetVRAMaddressByPosition(5,10);
	ld	de, #0x0a05
	push	de
	call	_GetVRAMaddressByPosition
	pop	af
;src\Test.c:248: VPrintString(vaddr,"col=5,line=10");
	ld	bc, #___str_11+0
	push	bc
	push	hl
	call	_VPrintString
	pop	af
	pop	af
;src\Test.c:249: TwoSeconds();
	call	_TwoSeconds
;src\Test.c:254: VPRINT(0,12,">test VPrintString()");
	ld	hl, #___str_12
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\Test.c:255: TwoSeconds(); 
	call	_TwoSeconds
;src\Test.c:257: VPrintString(vaddr,"Ad infinitum");
	ld	hl, #___str_13
	push	hl
	ld	hl, #0x19a3
	push	hl
	call	_VPrintString
	pop	af
	pop	af
;src\Test.c:258: TwoSeconds();  
	call	_TwoSeconds
;src\Test.c:260: VPRINT(0,15,">Test VPrintNumber(3,16,300,3)");
	ld	hl, #___str_14
	push	hl
	ld	a, #0x0f
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\Test.c:261: TwoSeconds();
	call	_TwoSeconds
;src\Test.c:262: VPrintNumber(3,16,300,3);
	ld	a, #0x03
	push	af
	inc	sp
	ld	hl, #0x012c
	push	hl
	ld	de, #0x1003
	push	de
	call	_VPrintNumber
	pop	af
	pop	af
	inc	sp
;src\Test.c:263: TwoSeconds();
	call	_TwoSeconds
;src\Test.c:266: VPRINT(0,18,">Test VPrintNum(vaddr,12345,5)");
	ld	hl, #___str_15
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_VPRINT
	pop	af
	pop	af
;src\Test.c:267: TwoSeconds();
	call	_TwoSeconds
;src\Test.c:269: VPrintNum(vaddr,12345,5);
	ld	a, #0x05
	push	af
	inc	sp
	ld	hl, #0x3039
	push	hl
	ld	hl, #0x1a63
	push	hl
	call	_VPrintNum
	pop	af
	pop	af
	inc	sp
;src\Test.c:270: TwoSeconds();
;src\Test.c:277: }
	jp  _TwoSeconds
___str_6:
	.ascii ">Test VPRINT"
	.db 0x00
___str_7:
	.ascii "Alea iacta est"
	.db 0x00
___str_8:
	.ascii ">Test VPRINTN [16chars]"
	.db 0x00
___str_9:
	.ascii "Gaudeamus igitur iuvenes dum sumus"
	.db 0x00
___str_10:
	.ascii ">test GetVRAMaddressByPosition()"
	.db 0x00
___str_11:
	.ascii "col=5,line=10"
	.db 0x00
___str_12:
	.ascii ">test VPrintString()"
	.db 0x00
___str_13:
	.ascii "Ad infinitum"
	.db 0x00
___str_14:
	.ascii ">Test VPrintNumber(3,16,300,3)"
	.db 0x00
___str_15:
	.ascii ">Test VPrintNum(vaddr,12345,5)"
	.db 0x00
;src\Test.c:280: void TwoSeconds()
;	---------------------------------
; Function TwoSeconds
; ---------------------------------
_TwoSeconds::
;src\Test.c:282: WAIT(50*2);
	ld	hl, #0x0064
	push	hl
	call	_WAIT
	pop	af
;src\Test.c:283: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
