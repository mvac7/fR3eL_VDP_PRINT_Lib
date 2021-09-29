# How to use the VDP PRINT MSX SDCC Library


### Sorry!: This text is pending correction of the English translation.


<br/>

---
## Index

- 1 Description
- 2 Requirements
- 3 Functions
- 4 How to use it


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

This project is an Open Source library. You can add part or all of this code in your libraries/engines.

Use them for developing MSX applications using Small Device C Compiler (SDCC).

In the source code (\examples), you can find applications for testing and learning purposes.

![TEST_0000](https://raw.githubusercontent.com/mvac7/SDCC_VDP_PRINT_Lib/master/GFX/TEST_0000.png)

This library is part of the [MSX fR3eL Project](https://github.com/mvac7/SDCC_MSX_fR3eL).

Enjoy it!


<br/>

---

## 2 Requirements

- [Small Device C Compiler (SDCC) v4.1](http://sdcc.sourceforge.net/)
- [Hex2bin v2.5](http://hex2bin.sourceforge.net/)
- VDP TMS9918A SDCC Library (fR3eL) - [MSX-DOS/ROM](https://github.com/mvac7/SDCC_TMS9918A_Lib) - [MSX-ROM](https://github.com/mvac7/SDCC_TMS9918A_MSXROM_Lib)


<br/>

---

## 3 Functions

<table>
<tr><th colspan=2 align="left">VLOCATE</th></tr>
<tr><td colspan="2">
Moves the cursor to the specified location and optionally provides the VRAM address from the pattern name table,<br/>
for the indicated screen position.
</td></tr>
<tr><th>Function</th><td>VLOCATE(column, line)</td></tr>
<tr><th>Input</th><td>
- column (char) 0 - 31<br/>
- line (char) 0 - 23
</td></tr>
<tr><th>Output</th><td>[unsigned int] VRAM address</td></tr>
<tr><th>Examples:</th>
<td><code>VLOCATE(10,5);</code></td></tr>
</table>


<table>
<tr><th colspan=2 align="left">VPRINT</th></tr>
<tr><td colspan="2">
Prints a string of characters on the screen.<br/>
Places it in the position indicated by VLOCATE or in the last printed position.
</td></tr>
<tr><th>Function</th><td>VPRINT(text)</td></tr>
<tr><th>Input</th><td>[char*] string</td></tr>
<tr><th>Output</th><td> --- </td></tr>
<tr><th>Examples:</th>
<td><pre>
VLOCATE(3,4);
VPRINT("Alea iacta est");
</pre></td></tr>
</table>


<table>
<tr><th colspan=2 align="left">VPRINTN</th></tr>
<tr><td colspan="2">Prints a character string with a limited length on the screen.</td></tr>
<tr><th>Function</th><td>VPRINTN(text, length)</td></tr>
<tr><th>Input</th><td>
- text (char*) string<br/>
- length (unsigned int) length of the string to print
</td></tr>
<tr><th>Output</th><td> --- </td></tr>
<tr><th>Examples:</th>
<td><code> VPRINTN("Alea iacta est",10);</code></td></tr>
</table>


<table>
<tr><th colspan=2 align="left">VPrintNumber</th></tr>
<tr><td colspan="2">Prints a number.</td></tr>
<tr><th>Function</th><td>VPrintNumber(value, length)</td></tr>
<tr><th>Input</th><td>
- [unsigned int] or [char] value<br/>
- [char] length
</td></tr>
<tr><th>Output</th><td> --- </td></tr>
<tr><th>Examples:</th>
<td><code>Save_ISR();</code></td></tr>
</table>


<table>
<tr><th colspan=2 align="left">num2Dec16</th></tr>
<tr><td colspan="2">16-bit Integer to ASCII (adaptation of Baze code)</td></tr>
<tr><th>Function</th><td>num2Dec16(value, text)</td></tr>
<tr><th>Input</th><td>
- value (unsigned int)<br/>  
- *text (unsigned int) pointer to the string where the number is to be translated
</td></tr>
<tr><th>Output</th><td> --- </td></tr>
<tr><th>Examples:</th>
<td><pre>
unsigned int value=1234;
char text[]="     ";
num2Dec16(value, text);
</pre></td></tr>
</table>


| num2Dec16: |
| :-- | :-- | 
| 16-bit Integer to ASCII (adaptation of Baze code) |
| Function | **num2Dec16(value, text)**  |
| Input | - value (unsigned int)  |
|       | - *text (unsigned int) pointer to the string where the number is to be translated  |
| Example: | ` unsigned int value=1234;<br/>char text[]="     ";<br/>num2Dec16(value, text); ` |



## 4 How to use it

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