# VDP PRINT MSX SDCC Library (fR3eL Project)

<table>
<tr><td>Name</td><td>VDP_PRINT</td></tr>
<tr><td>Architecture</td><td>MSX</td></tr>
<tr><td>Environment</td><td>ROM, MSX BASIC or MSX-DOS</td></tr>
<tr><td>Format</td><td>C Object (SDCC .rel)</td></tr>
<tr><td>Programming language</td><td>C and Z80 assembler</td></tr>
<tr><td>Compiler</td><td>SDCC v4.4 or newer</td></tr>
</table>

---

## Description

Functions for display text strings in the graphic modes (Graphic1 and Graphic2) of the TMS9918A.

It is designed to work in GRAPHIC 2 mode (Screen 2), although it works in GRAPHIC 1 mode (Screen 1).

For GRAPHIC 1 mode you get the advantage of faster display, useful if used for game development. If you want to develop a text application, you will get more functionality with the TEXTMODE library.

For it to work in GRAPHIC 2 mode (Screen 2) you will first need to dump a tileset with a text font, in tiles 32 to 90 for uppercase, or up to 122 if you need lowercase.

I have adapted a routine for converting a 16 Bits value to ASCII, extracted from the Baze collection [`WEB`](http://baze.sk/3sc/misc/z80bits.html#5.1), for printing numbers. 

You can use this library to develop applications for ROM, MSXBASIC or MSX-DOS environments, using the Small Device C Compiler [(SDCC)](http://sdcc.sourceforge.net/) cross compiler.

You can access the documentation here with [`How to use the library`](docs/HOWTO.md).

Requires the `VDP_TMS9918A` Library to write to the VRAM and so that you can start the graphics modes.
- for ROM and MSX BASIC [VDP_TMS9918A_MSXBIOS](https://github.com/mvac7/fR3eL_VDP_TMS9918A_MSXBIOS_Lib) Library.
- for all environments [VDP_TMS9918A](https://github.com/mvac7/SDCC_TMS9918A_Lib) Library.

These libraries are part of the [MSX fR3eL Project](https://github.com/mvac7/SDCC_MSX_fR3eL).

This project is open source under the [MIT license](LICENSE).
You can add part or all of this code in your application development or include it in other libraries/engines.

Enjoy it!

<br/>

---

## History of versions
(dd/mm/yyyy)

- v1.4 (20/06/2025) update to SDCC (4.1.12) Z80 calling conventions; 
					Remove GetStringLength
- v1.3 (27/09/2021) Add VLOCATE; Remove VPrintString and VPrintNum
- v1.2 (16/04/2021) VPRINTN string size control
- v1.1 (09/09/2020)
- v1.0 (04/02/2016) First version

<br/>

---

## Requirements for compile

- [Small Device C Compiler (SDCC) v4.4](http://sdcc.sourceforge.net/)
- [Hex2bin v2.5](http://hex2bin.sourceforge.net/)

<br/>

---

## Functions

| Name | Declaration | Description |
| ---  | ---   | ---         |
| VLOCATE  | `VLOCATE(char column, char line)` | Moves the cursor to the specified location |
| VPRINT   | `VPRINT(char* text)` | Prints a string of characters on the screen |
| VPRINTN  | `VPRINTN(char* text, unsigned int length)` | Prints a character string with a limited length on the screen |
| VPrintNumber  | `VPrintNumber(unsigned int value)` | Prints a number |
| VPrintFNumber | `VPrintFNumber(unsigned int value, char emptyChar, char length)` | Prints a number on the screen with formatting parameters |
| num2Dec16     | `num2Dec16(unsigned int value, unsigned int textParameters)` | Converts a number to a String |

