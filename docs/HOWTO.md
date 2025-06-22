# How to use the VDP PRINT MSX SDCC Library

| Attention! |
| :---       |
| The following document has been written using an English translator.<br/>You can participate in the improvement of this document, transmitting your corrections or suggestions in the issues of this project or the main fR3eL project.<br/>Thanks for understanding. |

---

## Index

- [1 Description](#1-Description)
- [2 Requirements](#2-Requirements)
- [3 Functions](#3-Functions)
   - [3.1 VLOCATE](#31-VLOCATE)
   - [3.2 VPRINT](#32-VPRINT)
   - [3.3 VPRINTN](#33-VPRINTN)
   - [3.4 VPrintNumber](#34-VPrintNumber)
   - [3.5 num2Dec16](#35-num2Dec16)
- [4 How to use](#4-How-to-use)


<br/>

---

## 1 Description

Functions for display text strings in the graphic modes (Graphic1 and Graphic2) of the TMS9918A.

It is designed to work in GRAPHIC 2 mode (Screen 2), although it works in GRAPHIC 1 mode (Screen 1).

For GRAPHIC 1 mode you get the advantage of faster display, useful if used for game development. If you want to develop a text application, you will get more functionality with the TEXTMODE library.

For it to work in GRAPHIC 2 mode (Screen 2) you will first need to dump a tileset with a text font, in tiles 32 to 90 for uppercase, or up to 122 if you need lowercase.

I have adapted a routine for converting a 16 Bits value to ASCII, extracted from the Baze collection [`WEB`](http://baze.sk/3sc/misc/z80bits.html#5.1), for printing numbers. 

You can use this library to develop applications for ROM, MSXBASIC or MSX-DOS environments, using the Small Device C Compiler [(SDCC)](http://sdcc.sourceforge.net/) cross compiler.

Requires the `VDP_TMS9918A` Library to write to the VRAM and so that you can start the graphics modes.
- for ROM and MSX BASIC [VDP_TMS9918A_MSXBIOS](https://github.com/mvac7/fR3eL_VDP_TMS9918A_MSXBIOS_Lib) Library.
- for all environments [VDP_TMS9918A](https://github.com/mvac7/SDCC_TMS9918A_Lib) Library.

These libraries are part of the [MSX fR3eL Project](https://github.com/mvac7/SDCC_MSX_fR3eL).

This project is open source under the [MIT license](LICENSE).
You can add part or all of this code in your application development or include it in other libraries/engines.


<br/>

---

## 2 Requirements for compile

- [Small Device C Compiler (SDCC) v4.4](http://sdcc.sourceforge.net/)
- [Hex2bin v2.5](http://hex2bin.sourceforge.net/)

<br/>

---

## 3 Functions

### 3.1 VLOCATE

<table>
<tr><th colspan=3 align="left">VLOCATE</th></tr>
<tr><td colspan=3>Moves the cursor to the specified location and optionally provides the<br/>VRAM address from the pattern name table,<br/>
for the indicated screen position.</td></tr>
<tr><th>Function</th><td colspan=2>VLOCATE(column, line)</td></tr>
<tr><th rowspan=2>Input</th><td>char</td><td>column (0 - 31)</td></tr>
<tr><td>char</td><td>line (0 - 23)</td></tr>
<tr><th>Output</th><td>unsigned int</td><td>VRAM address</td></tr>
</table>

#### Example:

```c
	VLOCATE(10,5);
	VPRINT("Hello World!");
```

<br/>

### 3.2 VPRINT

<table>
<tr><th colspan=3 align="left">VPRINT</th></tr>
<tr><td colspan=3>Prints a string of characters on the screen.<br/>Places it in the position indicated by VLOCATE or in the last printed position.</td></tr>
<tr><th>Function</th><td colspan=2>VPRINT(text)</td></tr>
<tr><th>Input</th><td>char*</td><td>string</td></tr>
<tr><th>Output</th><td colspan=2> --- </td></tr>
</table>

#### Example:

```c
	VLOCATE(3,4);
	VPRINT("Alea iacta est");
```

<br/>

### 3.3 VPRINTN

<table>
<tr><th colspan=3 align="left">VPRINTN</th></tr>
<tr><td colspan=3>Prints a character string with a limited length on the screen.</td></tr>
<tr><th>Function</th><td colspan=2>VPRINTN(text, length)</td></tr>
<tr><th rowspan=2>Input</th><td>char*</td><td>string</td></tr>
<tr><td>unsigned int</td><td>length of the string to print</td></tr>
<tr><th>Output</th><td colspan=2> --- </td></tr>
</table>

#### Example:

```c
	VPRINTN("Alea iacta est",10);
```

<br/>

### 3.4 VPrintNumber

<table>
<tr><th colspan=3 align="left">VPrintNumber</th></tr>
<tr><td colspan=3>Prints a number.</td></tr>
<tr><th>Function</th><td colspan=2>VPrintNumber(value)</td></tr>
<tr><th>Input</th><td>unsigned int or char</td><td>value</td></tr>
<tr><th>Output</th><td colspan=2> --- </td></tr>
</table>

#### Example:

```c
	VLOCATE(4,19);
	VPRINT("Value:");
	VPrintNumber(7023);
```

<br/>

### 3.5 VPrintFNumber

<table>
<tr><th colspan=3 align="left">VPrintFNumber</th></tr>
<tr><td colspan=3>Prints an unsigned integer on the screen with formatting parameters.</td></tr>
<tr><th>Function</th><td colspan=2>VPrintFNumber(unsigned int value, char emptyChar, char length)</td></tr>
<tr><th rowspan=2>Input</th><td>unsigned int or char</td><td>value</td></tr>
<tr><td>char</td><td>emptyChar · Character used for the first empty digits.<br/>E.g: 0='', 32=' ', 48='0'</td></tr>
<tr><td>char</td><td>length (1-5)</td></tr>
<tr><th>Output</th><td colspan=2> --- </td></tr>
</table>

#### Example:

```c
	char value=64;
	VLOCATE(4,19);
	VPRINT("Value:");
	VPrintFNumber(value,'0',3);
```

<br/>

### 3.6 num2Dec16

<table>
<tr><th colspan=3 align="left">num2Dec16</th></tr>
<tr><td colspan=3>16-bit Integer to ASCII (adaptation of Baze code)<br/>It is for internal use of the number printing functions.</td></tr>
<tr><th>Function</th><td colspan=2>num2Dec16(value, textParameters)</td></tr>
<tr><th rowspan=2>Input</th><td>unsigned int</td><td>value = 8 or 16bits</td></tr>  
<tr><td>unsigned int</td><td>textParameters = text parameters (emptyChar and length)<br/>(emptyChar<<8)+length</td></tr>
<tr><th>Output</th><td colspan=2> --- </td></tr>
</table>

#### Example:

```c
	char emptyChar=32;
	char length=3;
	unsigned int value=1234;
	unsigned int textParam=(emptyChar<<8)+length;
	num2Dec16(value, textParam);	//Writes the value to the VPRINT_ntext string 
	VPRINT(VPRINT_ntext);
```

| Note: |
| :---  |
| This function is intended for internal use. If you want to use it, be aware that the conversion to a string is written to the `VPRINT_ntext` variable. |


<br/>



## 4 How to use

The library works in a similar way to the MSX BASIC `LOCATE` and `PRINT` instructions.

Before printing a text (`VPRINT` or `VPRINTN`) or a number (`VPrintNumber`), it is necessary to indicate the position on the screen with `VLOCATE`.

Several texts can be printed in a row, since their final position is preserved.
   

### Example:

This example is illustrative only. 
In the `examples\` folder of the project sources you will find a complete application where you can check the behavior of the library.

```c
/* =============================================================================
Example01.c

Architecture: MSX
Format: MSX ROM 8k
Programming language: C and Z80 assembler
Compiler: SDCC 4.4 or newer

Description:
Simple example of the VDP_PRINT Library (fR3eL Project)
============================================================================= */
#include "VDP_TMS9918A_MSXBIOS.h"
#include "VDP_PRINT.h"

#define CGTABL	0x0004	// Base address of the MSX character set in ROM

const char text01[] = "Test VDP_PRINT Library";


void main(void)
{
	unsigned int ROMfont = *(unsigned int *) CGTABL;
	unsigned int value = 1024;
	
	COLOR(15,4,5);
 	SCREEN(GRAPHIC2);			// Set Screen 2

	FillVRAM(G2_MAP,0x300,0);			//Map
	FillVRAM(G2_COL,0x1800,0xF4);		//Tileset colors
	CopyToVRAM(ROMfont,G2_PAT_A,0x800);	//MSX font pattern
	CopyToVRAM(ROMfont,G2_PAT_B,0x800);	//MSX font pattern
	CopyToVRAM(ROMfont,G2_PAT_C,0x800);	//MSX font pattern
	
	VLOCATE(0,0);
	VPRINT(text01);

	VLOCATE(0,2);
	VPRINT("Number:");
	VPrintNumber(value);
	VPRINT("Bytes");
  
__asm call 0x009F __endasm;		// execute BIOS CHGET - One character input (waiting)
}
```

<br/>

#### For compile:

To obtain a binary with the ROM of the example program, execute the following steps in a Windows command line (CMD):

1. Compile with SDCC

```
sdcc -mz80 --code-loc 0x4020 --data-loc 0xC000 --use-stdout --no-std-crt0 crt0_MSX816kROM4000.rel VDP_TMS9918A_MSXBIOS.rel VDP_PRINT.rel Example01.c
```

<br/>

2. If the compiler has not displayed an error then convert the .ihx file to binary with hex2bin

```
hex2bin -e bin -l 2000 Example01.ihx
```

<br/>

3. Rename the binary to .ROM

```
rename Example01.bin EXAMPLE1.ROM
```

<br/>

---

![Creative Commons License](https://i.creativecommons.org/l/by-nc/4.0/88x31.png) 
<br/>This document is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License](http://creativecommons.org/licenses/by-nc/4.0/).
