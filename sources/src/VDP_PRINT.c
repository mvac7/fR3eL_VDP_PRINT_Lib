/* =============================================================================
# VDP PRINT MSX Library (fR3eL Project) 

- Version: 1.4 (20/06/2025)
- Author: mvac7/303bcn
- Architecture: MSX
- Format: C Object (SDCC .rel)
- Programming language: C and Z80 assembler
- Compiler: SDCC 4.4 or newer 

## Description:
Functions Library for display text strings in the graphic modes of the 
TMS9918A (G1 and G2).

Includes a 16-bit integer to ASCII conversion routine, 
based on num2Dec16 by baze
http://baze.sk/3sc/misc/z80bits.html#5.1
 
## History of versions (dd/mm/yyyy):
- v1.4 (20/06/2025) update to SDCC (4.1.12) Z80 calling conventions
					Remove GetStringLength
- v1.3 (27/09/2021) Add VLOCATE, Remove VPrintString and VPrintNum
- v1.2 (16/04/2021) VPRINTN string size control
- v1.1 (09/09/2020) 
- v1.0 (04/02/2016) First version     
============================================================================= */
#include "../include/msxSystemVariables.h"

#include "../include/VDP_PRINT.h"
#include "../include/VDP_TMS9918A_MSXBIOS.h"


char VPRINT_ntext[6];
unsigned int VPRINT_vaddr;

char NUM2DEV_LENGTH;




/* =============================================================================
VLOCATE
Description:
		Moves the cursor to the specified location and optionally 
		provides the VRAM address from the pattern name table, 
		for the indicated screen position.
Inputs:	column (char) 0 - 31
		line   (char) 0 - 23
Output:	-
============================================================================= */
void VLOCATE(char column, char line)
{
	/*char *A;
	A=(unsigned int *) RG1SAV; //<<--- I use a pointer to read a system variable.
					//      This generates a warning even though it generates 
					//      the correct code.  
	if (*A&0b00010000) VPRINT_vaddr = BASE0+(line*40)+column; //Text 40col Mode
	else */
	VPRINT_vaddr = BASE10+(line*32)+column; //G1 or G2 modes
}



/* =============================================================================
VPRINT
Description:
		Prints a string of characters on the screen.
		Places it in the position indicated by VLOCATE or in the last printed 
		position.
Inputs:	[char*] string
Output:	-
============================================================================= */
void VPRINT(char* text)
{
	unsigned int length=0;
	while(text[length]) length++;
	VPRINTN(text,length);
}



/*void VPRINT(char* text)
{
	SetVRAMtoWRITE(vprint_addr);
	while(*(text))
	{
		FastVPOKE(*(text++));
		vprint_addr++;
	}
}*/



/* =============================================================================
VPRINTN
Description:
		Prints a character string with a limited length on the screen.
Inputs:	text (char*) string
		length (unsigned int) length of the string to print
Output:	-
============================================================================= */
void VPRINTN(char* text, unsigned int length)
{
	CopyToVRAM((unsigned int) text, VPRINT_vaddr, length);
	VPRINT_vaddr += length;
}



/* =============================================================================
VPrintNumber
Description:
		Prints a number.
Inputs:	[unsigned int] number
		[char] length
Output:	-
============================================================================= */
void VPrintNumber(unsigned int value)
{
	VPrintFNumber(value,0,5);
}



/* =============================================================================
PrintFNumber
Description: 
		Prints an unsigned integer on the screen with formatting parameters.
	   
Input:	(unsigned int or char) numeric value
		(char) emptyChar · Character used for the first empty digits
						   E.g: 0='', 32=' ', 48='0'
		(char) length: 1 to 5          
Output:	-
============================================================================= */
void VPrintFNumber(unsigned int value, char emptyChar, char length)
{
value;		//HL
emptyChar;	//Stack
length;		//Stack
__asm
	push IX	
	ld   IX,#0
	add  IX,SP
	
;num2Dec16(value, (emptyChar<<8)+length); 
	ld   D,4(IX)
	ld   E,5(IX)
	call _num2Dec16
	
;VPRINT(VPRINT_ntext);
	ld   HL,#_VPRINT_ntext
	call _VPRINT

	pop  IX
__endasm;	
}



/* =============================================================================
PrintNumber
Description: 
		Prints an unsigned integer on the screen.

		16-bit Integer to ASCII (decimal) based on num2Dec16 by baze
		https://baze.sk/3sc/misc/z80bits.html#5.1
		
Input:	(unsigned int) numeric value
		(unsigned int) text parameters (emptyChar<<8)+length
Output:	-
============================================================================= */
void num2Dec16(unsigned int value, unsigned int textParameters) __naked
{
value;			//HL
textParameters;	//DE 
__asm
	push IX
	

// ------------------------------------------------  
//  HL = value
//  D  = empty Char (0,32,48) if the first digits are zeros
//  E  = length (1-5)
VPRNUM:

	ld   IX,#_NUM2DEV_LENGTH
	ld   IY,#_VPRINT_ntext

	ld   (IX),E
	ld   E,#5		//number Digit
  	
	ld   BC,#-10000
	call $Num1
	ld   BC,#-1000
	call $Num1
	ld   BC,#-100
	call $Num1
	ld   C,#-10
	call $Num1

//Last figure
	ld   C,B
	ld   D,#48		//set "0"

	call $Num1
	xor  A
	ld   (IY),A		//<-- write end of string mark
	
	pop  IX
	ret   			//<-- END
    
$Num1:	
	ld   A,#47		//"0" ASCII code - 1
   
$Num2:
	inc  A
	add  HL,BC
	jr   C,$Num2

	sbc  HL,BC

	cp   #48		//"0" ASCII code
	jr   NZ,$Num3	//if A!=48 then goto $Num3

	ld   A,D		//get ZeroDigit
	jr   $Num4


$Num3:
	//change space/empty for 0 zero ASCII code
	ld   D,#48
	
$Num4:

	ex   AF,AF
	dec  E  ;number Digit
	ld   A,E
	cp   (IX)  ;length
//	jr   NC,$next5
	ret  NC		//IF num.Digit>length THEN dont print

	ex   AF,AF
	or   A
	ret  Z		//only print A>0

	ld   (IY),A	//Print digit
	inc  IY

	ret
	  
__endasm;
}

