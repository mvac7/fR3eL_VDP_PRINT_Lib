# VDP PRINT MSX SDCC Library (fR3eL Project)

```
Author: mvac7
Architecture: MSX
Format: C Object (SDCC .rel)
Programming language: C and Z80 assembler
```



## Sorry!: This text is pending correction of the English translation.



## Description

Functions for display text strings in the graphic modes of the TMS9918A (G1 and G2).

Requires the VDP TMS9918A Library to write to the VRAM and so that you can start the graphics modes.
- for MSX-DOS and ROM https://github.com/mvac7/SDCC_TMS9918A_Lib
- only for MSX ROM https://github.com/mvac7/SDCC_TMS9918A_MSXROM_Lib

This library does not use any of the MSX BIOS functions, so it is suitable for creating applications for MSX-DOS and ROM format.

I have adapted a routine for converting a 16 Bits value to ASCII, extracted from the Baze collection [(WEB)](http://baze.sk/3sc/misc/z80bits.html#5.1), for printing numbers. 
  
It is adapted to work with the standard MSX screen configurations but it can be changed to the VRAM addresses of other computers or video game consoles.

This project is an Open Source library. You can add part or all of this code in your libraries/engines.

Use them for developing MSX applications using Small Device C Compiler (SDCC).

You can access the documentation here with [How to use the library](https://github.com/mvac7/SDCC_VDP_PRINT_Lib/blob/master//HOWTO.md).

In the source code (\examples), you can find applications for testing and learning purposes.

![TEST_0000](https://raw.githubusercontent.com/mvac7/SDCC_VDP_PRINT_Lib/master/GFX/TEST_0000.png)

This library is part of the [MSX fR3eL Project](https://github.com/mvac7/SDCC_MSX_fR3eL).

Enjoy it!



## History of versions

- v1.3 (27/September/2021) Add VLOCATE; Remove VPrintString and VPrintNum
- v1.2 (16/April/2021) VPRINTN string size control
- v1.1 (9/September/2020)
- v1   (4/February/2016) First version



## Requirements

- [Small Device C Compiler (SDCC) v4.1](http://sdcc.sourceforge.net/)
- [Hex2bin v2.5](http://hex2bin.sourceforge.net/)
- VDP TMS9918A SDCC Library (fR3eL) - [MSX-DOS/ROM](https://github.com/mvac7/SDCC_TMS9918A_Lib) - [MSX-ROM](https://github.com/mvac7/SDCC_TMS9918A_MSXROM_Lib)



## Acknowledgments
  
I want to give a special thanks to all those who freely share their knowledge with the MSX developer community.

- Baze > [(WEB)](http://baze.sk/3sc/misc/z80bits.html)
- Avelino Herrera > [(WEB)](http://msx.avelinoherrera.com/index_es.html)
- Nerlaska > [(Blog)](http://albertodehoyonebot.blogspot.com.es)
- Marq > [(Marq)](http://www.kameli.net/marq/)
- MSXKun/Paxanga soft > [(WEB)](http://paxangasoft.retroinvaders.com/)
- Fubukimaru [(gitHub)](https://github.com/Fubukimaru)
- Andrear > [(Blog)](http://andrear.altervista.org/home/msxsoftware.php)
- Sapphire/Z80ST > [(WEB)](http://z80st.auic.es/)
- Fernando García > [(Curso)](http://www.z80st.es/cursos/bitvision-assembler)
- Ramones > [(MSXblog)](https://www.msxblog.es/tutoriales-de-programacion-en-ensamblador-ramones/) - [(MSXbanzai)](http://msxbanzai.tni.nl/dev/faq.html)
- Eric Boez > [(gitHub)](https://github.com/ericb59)
- MSX Assembly Page > [(WEB)](http://map.grauw.nl/resources/msxbios.php)
- Portar MSX Tech Doc > [(WEB)](https://problemkaputt.de/portar.htm)
- MSX Resource Center > [(WEB)](http://www.msx.org/)
- Karoshi MSX Community > [(WEB)](http://karoshi.auic.es/)
- BlueMSX emulator >> [(WEB)](http://www.bluemsx.com/)
- OpenMSX emulator >> [(WEB)](http://openmsx.sourceforge.net/)
- [WebMSX](https://webmsx.org/) emulator by Paulo A. Peccin >> [(gitHub)](https://github.com/ppeccin/webmsx)
- fMSX emulator by Marat Fayzullin [WEB](https://fms.komkon.org/fMSX/)
- Meisei emulator by Hap >> ?