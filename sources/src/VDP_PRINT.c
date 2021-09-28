/* =============================================================================
   SDCC VDP PRINT MSX SDCC Library (fR3eL Project) 
   Version: 1.3 (27/September/2021)
   Author: mvac7
   Architecture: MSX
   Format: C Object (SDCC .rel)
   Programming language: C and Z80 assembler
   
   Description:
     Functions Library for display text strings in the graphic modes of the 
     TMS9918A (G1 and G2).
     
History of versions:
- v1.3 (27/September/2021) Add VLOCATE, Remove VPrintString and VPrintNum
- v1.2 (16/April/2021) VPRINTN string size control
- v1.1 (9/September/2020) 
- v1   (4/February/2016) First version     
============================================================================= */
#include "../include/VDP_PRINT.h"
#include "../include/VDP_TMS9918A.h"


char CSTATE;  //value needed to control the start of a number (num2Dec16)

unsigned int VVRAMaddr;




/* =============================================================================
  VLOCATE
  
  Description:
    Moves the cursor to the specified location and optionally 
    provides the VRAM address from the pattern name table, 
    for the indicated screen position.
  
  Inputs:
    column (byte) 0 - 31
    line (byte) 0 - 23
    
  Outputs:
    [unsigned int] VRAM address
============================================================================= */
unsigned int VLOCATE(char column, char line)
{
    VVRAMaddr = BASE10 + (line*32)+column;
    return VVRAMaddr;
}



/* =============================================================================
  VPRINT
  
  Description:
    Prints a string of characters on the screen.
    Places it in the position indicated by VLOCATE or in the last printed position.
    
 Inputs:
    [char*] string 
============================================================================= */
void VPRINT(char* text)
{
  char length=0;
  while(text[length]) length++;
  //while(*(text)) VPOKE(VVRAMaddr++,*(text++));
  CopyToVRAM((unsigned int) text, VVRAMaddr, length);
  VVRAMaddr += length;
}



/* =============================================================================
  VPRINTN

  Description:
    Prints a character string with a limited length on the screen.

 Inputs:
    text (char*) string
    length (unsigned int) length of the string to print
============================================================================= */
void VPRINTN(char* text, unsigned int length)
{
  char size=0;
  while(text[size]) size++;
  if (length>size) length=size;
  CopyToVRAM((unsigned int) text, VVRAMaddr, length);
  //while(*(text) && length-->0)  VPOKE(VVRAMaddr++,*(text++));
  VVRAMaddr += length;
}



/* =============================================================================
  VPrintNumber
  
  Description:
    Prints a number.
   
  Inputs:
    [unsigned int] number
    [char] length
============================================================================= */
void VPrintNumber(unsigned int value, char length)
{
  char pos=5-length;
  char text[]="     ";

  num2Dec16(value, text); 
  
  //while (length-->0){ VPOKE(VVRAMaddr++,text[pos++]);}
  CopyToVRAM((unsigned int) text + (5-length), VVRAMaddr, length);
  VVRAMaddr += length;
}



/* =============================================================================
  num2Dec16

  16-bit Integer to ASCII (decimal)
  original code by baze http://baze.sk/3sc/misc/z80bits.html#5.1
  (update) Add functionality to replace leading zeros by spaces.  
  
  Inputs:
    - value (unsigned int)  
    - *address (unsigned int) pointer to the string where the number is to be translated 
============================================================================= */
void num2Dec16(unsigned int value, char *text) __naked
{
value;
text;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  ld   L,4(ix)
  ld   H,5(ix)
  
  ld   E,6(ix)
  ld   D,7(ix)
  
  ld   A,#32         ;ASCII value for space
  ld   (#_CSTATE),A
  	
  ld   BC,#-10000
  call $Num1
  ld   BC,#-1000
  call $Num1
  ld   BC,#-100
  call $Num1
  ld   C,#-10
  call $Num1
  
  ld   C,B
  ld   A,#48          ;"0"
  ld   (#_CSTATE),A
  call $Num1

;END
  pop  IX
  ret
    
$Num1:	
  ld   A,#47 ; 0 ASCII char - 1
   
$Num2:	
  inc  A
  add  HL,BC
  jr   C,$Num2
  
  sbc  HL,BC
  
  cp   #48       
  jr   NZ,$Num3  ;if A!=0 then goto $Num3
  
  ld   A,(#_CSTATE)
  jr   $Num4


$Num3:
  push AF
  ld   A,#48  ;ASCII value for 0
  ld   (#_CSTATE),A
  pop  AF	
	
$Num4:	
  ld   (DE),A
  inc  DE
  	
  ret
  
__endasm;
}


/*void VPRINTO(byte column, byte line, char* text, char offset)
{
  uint VVRAMaddr = GetVRAMaddressByPosition(column, line);
  vpokeBlockOffset(VVRAMaddr, text,offset);
}*/


/*void vpokeBlockOffset(uint VVRAMaddr, char* text, char offset)
{
  while(*(text)) vpoke(VVRAMaddr++,*(text++)+offset);
}*/



/* =============================================================================
 muestra un texto en la pantalla de varias lineas separadas con \n
 ejem: vPrintLines(10,10,"ARE YOU SURE\nYOU WANT TO\nDELETE SONG?");
============================================================================= */
/*void vprintLines(byte column, byte line, char* text)
{
  char character;
  uint VVRAMaddr = GetVRAMaddressByPosition(column, line);

  while(*(text))
  {
    character=*(text++);
    if (character=='\n') //return
    {
      //next line
      line++;
      VVRAMaddr = GetVRAMaddressByPosition(0, line);
    }
    else{
      vpoke(VVRAMaddr++,character);
    }    
  }
  return;
}*/



