# VDP VPRINT Functions Library

Author: mvac7

Architecture: MSX

Format: .rel (SDCC object file)

Programming language: C

mail: mvac7303b@gmail.com



## Sorry!: This text is pending correction of the English translation.



## History of versions
- v1.1 (9/Sep/2020) **<current version>**
- v1   (4/Feb/2016) First version



## Description

Functions Library (object), for display text strings in the graphic modes of the TMS9918A (G1 and G2).

Requires the VDP TMS9918A Library: 
- for MSX-DOS https://github.com/mvac7/SDCC_TMS9918A_Lib
- or for MSX ROM https://github.com/mvac7/SDCC_TMS9918A_MSXROM_Lib

This library does not use any of the MSX BIOS functions, so it is suitable for creating applications for MSXDOS and ROM format.
  
Use them for developing MSX applications using Small Device C Compiler (SDCC) compilator.

It is adapted to work with the standard MSX screen configurations but it can be changed to the VRAM addresses of other computers or video game consoles.

It includes an application created to test the library, but it can also be used to learn how to use it.

This open-source project is for the MSX developer community and retro scene.

You can use it in its entirety or part of its functions in your projects.

![TEST_0000](https://user-images.githubusercontent.com/5410950/94546159-cc676e80-024d-11eb-9359-ff5692c859bc.png)


## Acknowledgments
  
Thanks for Info & help, to:

* Baze > http://baze.sk/3sc/misc/z80bits.html
* Avelino Herrera > http://msx.atlantes.org/index_es.html
* Nerlaska > http://albertodehoyonebot.blogspot.com.es
* Andrear > http://andrear.altervista.org/home/msxsoftware.php
* MSX Assembly Page > http://map.grauw.nl/resources/msxbios.php
* Portar MSX Tech Doc > http://nocash.emubase.de/portar.htm
* MSX Resource Center > http://www.msx.org/
* Karoshi MSX Community > http://karoshi.auic.es/
* BlueMSX >> http://www.bluemsx.com/
* OpenMSX >> http://openmsx.sourceforge.net/
* Meisei  >> ?



## Requirements

* Small Device C Compiler (SDCC) v3.9 http://sdcc.sourceforge.net/
* Hex2bin v2.2 (for test program) http://hex2bin.sourceforge.net/ 

 
### TMS9918A Library
* VDP TMS9918A Library https://github.com/mvac7/SDCC_TMS9918A_Lib
* VDP TMS9918A MSXROM Library https://github.com/mvac7/SDCC_TMS9918A_MSXROM_Lib


## Functions

* unsigned int **GetVRAMaddressByPosition** (char column, char line) --> It provides the address of the video memory map tiles, from the screen position indicated.
* void **VPRINT** (char column, char line, char* text) --> Prints a string at the indicated screen position.
* void **VPRINTN** (char column, char line, char* text, unsigned int length) --> Prints a string at the indicated screen position.
* void **VPrintString** (unsigned int vaddress, char* text) --> Dump the contents of an array of char in a position shown in the video memory.
* void **VPrintNumber** (char column, char line, unsigned int value, char length) --> Prints a number at the specified position on the screen.
* void **VPrintNum** (unsigned int vaddr, unsigned int value, char length) --> Prints a number at the specified position on the screen.
* void **num2Dec16** (unsigned int aNumber, char *address) --> 16-bit Integer to ASCII (adaptation of Baze code)
