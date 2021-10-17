# How to use the VDP PRINT MSX SDCC Library

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

Functions for display text strings in the graphic modes of the TMS9918A (G1 and G2).

Requires the VDP TMS9918A Library to write to the VRAM and so that you can start the graphics modes. 
- for MSX-DOS and ROM https://github.com/mvac7/SDCC_TMS9918A_Lib
- only for MSX ROM https://github.com/mvac7/SDCC_TMS9918A_MSXROM_Lib

This library does not use any of the MSX BIOS functions, so it is suitable for creating applications for MSX-DOS and ROM format.

I have adapted a routine for converting a 16 Bits value to ASCII, extracted from the Baze collection [(WEB)](http://baze.sk/3sc/misc/z80bits.html#5.1), for printing numbers. 
  
It is adapted to work with the standard MSX screen configurations but it can be changed to the VRAM addresses of other computers or video game consoles.

Use them for developing MSX applications using Small Device C Compiler (SDCC).

This project is an Open Source library. 
You can add part or all of this code in your application development or include it in other libraries/engines.

This library is part of the [MSX fR3eL Project](https://github.com/mvac7/SDCC_MSX_fR3eL).

Enjoy it!


<br/>

---

## 2 Requirements

- [Small Device C Compiler (SDCC) v4.1](http://sdcc.sourceforge.net/)
- [Hex2bin v2.5](http://hex2bin.sourceforge.net/)
- VDP TMS9918A SDCC Library (fR3eL) - [`MSX-DOS/ROM`](https://github.com/mvac7/SDCC_TMS9918A_Lib) - [`MSX-ROM`](https://github.com/mvac7/SDCC_TMS9918A_MSXROM_Lib)


<br/>

---

## 3 Functions

### 3.1 VLOCATE

<table>
<tr><th colspan=3 align="left">VLOCATE</th></tr>
<tr><td colspan=3>Moves the cursor to the specified location and optionally provides the VRAM address from the pattern name table,<br/>
for the indicated screen position.</td></tr>
<tr><th>Function</th><td colspan=2>VLOCATE(column, line)</td></tr>
<tr><th rowspan=2>Input</th><td>[char]</td><td>column (0 - 31)</td></tr>
<tr><td>[char]</td><td>line (0 - 23)</td></tr>
<tr><th>Output</th><td>[unsigned int]</td><td>VRAM address</td></tr>
<tr><th>Example:</th><td colspan=2><pre>VLOCATE(10,5);<br/>VPRINT("Hello World!");</pre></td></tr>
</table>



### 3.2 VPRINT

<table>
<tr><th colspan=3 align="left">VPRINT</th></tr>
<tr><td colspan=3>Prints a string of characters on the screen.<br/>Places it in the position indicated by VLOCATE or in the last printed position.</td></tr>
<tr><th>Function</th><td colspan=2>VPRINT(text)</td></tr>
<tr><th>Input</th><td>[char*]</td><td>string</td></tr>
<tr><th>Output</th><td colspan=2> --- </td></tr>
<tr><th>Example:</th>
<td colspan=2><code>
VLOCATE(3,4);
VPRINT("Alea iacta est");
</code></td></tr>
</table>



### 3.3 VPRINTN

<table>
<tr><th colspan=3 align="left">VPRINTN</th></tr>
<tr><td colspan=3>Prints a character string with a limited length on the screen.</td></tr>
<tr><th>Function</th><td colspan=2>VPRINTN(text, length)</td></tr>
<tr><th rowspan=2>Input</th><td>text (char*)</td><td>string</td></tr>
<tr><td>length (unsigned int)</td><td>length of the string to print</td></tr>
<tr><th>Output</th><td colspan=2> --- </td></tr>
<tr><th>Example:</th><td colspan=2><code>VPRINTN("Alea iacta est",10);</code></td></tr>
</table>


### 3.4 VPrintNumber

<table>
<tr><th colspan=3 align="left">VPrintNumber</th></tr>
<tr><td colspan=3>Prints a number.</td></tr>
<tr><th>Function</th><td colspan=2>VPrintNumber(value, length)</td></tr>
<tr><th rowspan=2>Input</th><td>[unsigned int] or [char]</td><td>value</td></tr>
<tr><td>[char]</td><td>length</td></tr>
<tr><th>Output</th><td colspan=2> --- </td></tr>
<tr><th>Example:</th><td colspan=2><code>Save_ISR();</code></td></tr>
</table>


### 3.5 num2Dec16

<table>
<tr><th colspan=3 align="left">num2Dec16</th></tr>
<tr><td colspan=3>16-bit Integer to ASCII (adaptation of Baze code)<br/>It is for internal use of the number printing functions.</td></tr>
<tr><th>Function</th><td colspan=2>num2Dec16(value, text)</td></tr>
<tr><th rowspan=2>Input</th><td>value (unsigned int)</td><td>value</td></tr>  
<tr><td>text (unsigned int)</td><td>pointer to the string where the number is to be translated</td></tr>
<tr><th>Output</th><td colspan=2> --- </td></tr>
<tr><th>Example:</th>
<td colspan=2><code>
unsigned int value=1234;
char text[]="     ";
num2Dec16(value, text);
</code></td></tr>
</table>




## 4 How to use

The library works in a similar way to the MSX BASIC `LOCATE` and `PRINT` instructions.

Before printing a text (`VPRINT` or `VPRINTN`) or a number (`VPrintNumber`), it is necessary to indicate the position on the screen with `VLOCATE`.

Several texts can be printed in a row, since their final position is preserved.
   

### Example:

This example is illustrative only. 
In the `examples\` folder of the project sources you will find a complete application where you can check the behavior of the library.

```c
void main()
{
  char text01[] = "Number:";
  usigned int value = 1234;

  VLOCATE(0,19);
  VPRINT(text01);
  VPrintNumber(value,5);
  VPRINT(" Bytes");
}
```