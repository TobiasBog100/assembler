#include "stdint.h"

/*
#define data 0x1F0
#define error 0x1F1
#define count_sectors 0x1F2
#define number_sector 0x1F3
#define cylinder_H 0x1F4
#define cylinder_L 0x1F5
#define head 0x1F6
#define status 0x1F7
*/


uint8_t	read_hdd(int count_sectors_var, int sector,int cylinder_h,int cylinder_l){
	uint8_t retvar;

volatile __asm__ (
	"#define data 0x1F0\n\t"
	"#define error 0x1F1\n\t"
	"#define count_sectors 0x1F2\n\t"
	"#define number_sector 0x1F3\n\t"
	"#define cylinder_H 0x1F4\n\t"
	"#define cylinder_L 0x1F5\n\t"
	"#define head 0x1F6\n\t"
	"#define status 0x1F7\n\t"

    "mov     head,%dx\n\t"         
	"mov     0xA0,%a\n\tl"      
	"out     %al,%dx\n\t"

	"mov     count_sectors,%dx\n\t"        
	"mov     %1,%al\n\t"      
	"out     %al,%dx\n\t"

	"mov     number_sector,%dx\n\t"         
	"mov     %2,%al\n\t"      
	"out     %al,%dx\n\t"

	"mov     cylinder_H,%dx\n\t"        
	"mov     %3,%al\n\t"      
	"out     %al,%dx\n\t"

	"mov     cylinder_L,%dx\n\t"         
	"mov     %4,%al\n\t"      
	"out     %al,%dx\n\t"

	"mov     status,%dx\n\t"      
	"mov     0x20,%al\n\t"
	"out     %al,%dx\n\t"
/*
missing

*/
	"mov     data,%dx\n\t"
	"in     %dx,%al\n\t"

      : "+r" (retvar) 
                    
      : "g" (count_sectors_var)  ,"g" (sector)  ,"g" (cylinder_h)  ,"g" (cylinder_l)  
      : "%dx", "%al"  
  );
}
