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
