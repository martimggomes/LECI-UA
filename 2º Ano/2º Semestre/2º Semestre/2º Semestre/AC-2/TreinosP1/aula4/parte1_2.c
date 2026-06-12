#include <detpic32.h>

int main(void)
{
	TRISE = TRISE & 0XFF87; // 1111 1111 1000 0111  (Bits de 3 a 6 a 0)
	
	int counter = 0;
	
	while(1)
	{	
		LATE = (LATE & 0XFF87) | counter << 3;  // o counter é para meter a começar na posição 3
		
		resetCoreTimer();
		while(readCoreTimer() <  4347826); // 20000000 / 4.6
		
		counter = (counter + 1) % 10;
	}
	return 0;	
}
