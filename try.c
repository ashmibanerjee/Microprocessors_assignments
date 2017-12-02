#include <stdio.h>
#include <string.h>

int main()
{

	/*********SYNTAX*************/
	/*****

	asm ( "assembly code"
           : output operands                  // optional 
           : input operands                   // optional 
           : list of clobbered registers      // optional 
		);

	***************/

/***********SAMPLE  **********************/
/*	int x = 1;
	int y=11;
    	asm ("movl %1, %%eax;"
         "movl %%eax, %0;"
         :"=r"(x) // x is output operand and it's related to %0 
         :"r"(y)  // 11 is input operand and it's related to %1 
         :"%eax"); / %eax is clobbered register 

  	 printf("Hello x = %d\n", x);
	
******************************************/

	int i,j,l,k;
	char text[]="srishti";

	char a='a';
	char b='b';
	char new_char;
	
	l=strlen(text);
	char new_text[l];

	i=a;
	j=b;


	for(k=0;k<strlen(text);k++)
	{
		i=text[k];
		j=text[k];

		printf("\n before operation:::  i=%d, j=%d", i,j);
	
		asm ("movl %1, %%ebx;"
		"cmpl $97, %%ebx;"
		"jge l2;"

		"l2:cmpl $122, %%ebx;"
		
		"jle l1;"
		"jmp l3;"
		"l1: subl $32,%%ebx;"
		"jmp l3;"
        	"l3: movl %%ebx, %0;"
	
         	:"=r"(i)
         	:"r"(j) ,"r"(32) 
         	:"%ebx"); 
		
		new_text[k]=(char)i;
		
	}
	

	printf("\n\n after operation:::   i=%c, j=%c",i,j);
       
	/* for( i=0;i<strlen(text);i++)
        {
                if(text[i]>=97 && text[i]<=122)
                        text[i]=text[i]-0x20;

	}*/
	printf("\n\n to upper =%s", new_text);
}
