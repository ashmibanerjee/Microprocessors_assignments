#include <stdio.h>
#include <string.h>

  void convert(char *text)
  {
       char *res = text;
   char temp;
 __asm__ __volatile__ (
         "dec %[text]\n"
      "REPEAT:\n\t"    
         "inc %[text]\n\t"
         "movb (%[text]), %[temp]\n\t"  /* Read the next char */
         "testb %[temp], %[temp]\n\t"	//checks null char
         "jz END\n\t"                  /* Is the char null */

         "cmpb $97, %[temp]\n\t"       /* >= 'a'? */
         "jb REPEAT\n\t"
         "cmpb $122, %[temp]\n\t"      /* <= 'z'? */
         "ja REPEAT\n\t"
         "subb $32, %[temp]\n\t"       /* Perform lowercase */
         "mov %[temp], (%[text])\n\t"   /* Write back to memory */
         "jmp REPEAT\n" 
      "END:\n"
        : [text] "+r" (text), [temp] "=r" (temp)
         : /* no inputs */
         : "memory"
   );

   /* Note that at this point, str points to the null. 
      str - res is the length. */



	printf("converted string =%s\n", res);	 
   //return res;
  
 }

  

int main()
{

	
	int i,j,l,k;
	char text[]="srishti";
	convert(text);
	
}
