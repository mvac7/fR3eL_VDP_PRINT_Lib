# VDP PRINT MSX SDCC Library (fR3eL Project)

```
Author: mvac7 [mvac7303b@gmail.com]
Architecture: MSX
Format: C Object (SDCC .rel)
Programming language: C and Z80 assembler
```



## Sorry!: This text is pending correction of the English translation.



## Description

Functions for display text strings in the graphic modes of the TMS9918A (G1 and G2).

Requires the VDP TMS9918A Library: 
- for MSX-DOS and ROM https://github.com/mvac7/SDCC_TMS9918A_Lib
- only for MSX ROM https://github.com/mvac7/SDCC_TMS9918A_MSXROM_Lib

This library does not use any of the MSX BIOS functions, so it is suitable for creating applications for MSXDOS and ROM format.
  
Use them for developing MSX applications using Small Device C Compiler (SDCC) compilator.

It is adapted to work with the standard MSX screen configurations but it can be changed to the VRAM addresses of other computers or video game consoles.

This open-source project is for the MSX developer community and retro scene.
You can use it in its entirety or part of its functions in your projects.

I have adapted a routine for converting a 16 Bits value to ASCII, extracted from the Baze collection [(WEB)](http://baze.sk/3sc/misc/z80bits.html#5.1), for printing numbers. 

In the source code (\examples), you can find applications for testing and learning purposes.

![TEST_0000](https://user-images.githubusercontent.com/5410950/94546159-cc676e80-024d-11eb-9359-ff5692c859bc.png)

This library is part of the [MSX fR3eL Project](https://github.com/mvac7/SDCC_MSX_fR3eL).

Enjoy it!



## History of versions
* v1.1 (9/Sep/2020) **<current version>**
* v1   (4/Feb/2016) First version



## Requirements

* Small Device C Compiler (SDCC) v3.9 http://sdcc.sourceforge.net/
* Hex2bin v2.5 http://hex2bin.sourceforge.net/
* VDP TMS9918A SDCC Library (fR3eL) - [MSX-DOS/ROM](https://github.com/mvac7/SDCC_TMS9918A_Lib) - [MSX-ROM](https://github.com/mvac7/SDCC_TMS9918A_MSXROM_Lib)



## Functions

* int **GetVRAMaddressByPosition** (char column, char line) --> It provides the address of the video memory map tiles, from the screen position indicated.
* void **VPRINT** (char column, char line, char* text) --> Prints a string at the indicated screen position.
* void **VPRINTN** (char column, char line, char* text, unsigned int length) --> Prints a string at the indicated screen position.
* void **VPrintString** (unsigned int vaddress, char* text) --> Dump the contents of an array of char in a position shown in the video memory.
* void **VPrintNumber** (char column, char line, unsigned int value, char length) --> Prints a number at the specified position on the screen.
* void **VPrintNum** (unsigned int vaddr, unsigned int value, char length) --> Prints a number at the specified position on the screen.
* void **num2Dec16** (unsigned int aNumber, char *address) --> 16-bit Integer to ASCII (adaptation of Baze code)



## Acknowledgments
  
I want to give a special thanks to all those who freely share their knowledge with the MSX developer community.

* Baze > [WEB](http://baze.sk/3sc/misc/z80bits.html)
* Avelino Herrera > [WEB](http://msx.atlantes.org/index_es.html)
* Nerlaska > [Blog](http://albertodehoyonebot.blogspot.com.es)
* Marq/Lieves!Tuore > [Marq](http://www.kameli.net/marq/) [Lieves!Tuore](http://www.kameli.net/lt/)
* [Fubukimaru](https://github.com/Fubukimaru) > [Blog](http://www.gamerachan.org/fubu/)
* Andrear > [Blog](http://andrear.altervista.org/home/msxsoftware.php)
* Ramones > [MSXblog](https://www.msxblog.es/tutoriales-de-programacion-en-ensamblador-ramones/) - [MSXbanzai](http://msxbanzai.tni.nl/dev/faq.html)
* Sapphire/Z80ST > [WEB](http://z80st.auic.es/)
* Fernando García > [youTube](https://www.youtube.com/user/bitvision)
* Eric Boez > [gitHub](https://github.com/ericb59)
* MSX Assembly Page > [WEB](http://map.grauw.nl/resources/msxbios.php)
* Portar MSX Tech Doc > [WEB](http://nocash.emubase.de/portar.htm)
* MSX Resource Center > [WEB](http://www.msx.org/)
* Karoshi MSX Community (RIP 2007-2020)
* BlueMSX emulator >> [WEB](http://www.bluemsx.com/)
* OpenMSX emulator >> [WEB](http://openmsx.sourceforge.net/)
* Meisei emulator >> ?