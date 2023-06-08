#include<iostream>
using namespace std;
int main()
{
	unsigned char arr1[16] = { 25, 50, 80, 42, 64, 50, 32, 61, 46, 98, 72, 36, 45, 35, 20, 110 };
	 char even[16] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	char odd[16] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	unsigned char arr2[16] = { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 };
	int e=0,o=0;
	cout << "\nArray = "; for (int i = 0; i < 16; i++) {
		cout<<arr1[i] << "  ";
	}
	__asm
	{
		mov esi, 0
		mov cx, 2
		tag:
		    movq mm0, [arr1 + esi]
			movq mm1, [arr2 + esi]
			pand mm0, mm1
			pcmpgtb mm0, odd
			pand mm0, [arr1 + esi]
			movq[odd + esi], mm0

			movq mm0, [arr1 + esi]
			pand mm0, mm1
			pcmpeqb mm0, [even + esi]
			pand mm0, [arr1 + esi]
			movq[even + esi], mm0

			add esi, 8
			loop tag
			emms
	}
	cout << "\n\nEven numbers are = "; for (int i = 0; i < 16; i++) {
		if (even[i] != 0) {
		cout << even[i] << "  ";
		}
		e += (unsigned int)even[i];
	}
	cout << "\nTotal even count = " << e<<endl;
	cout << "\n\nOdd numbers are  = "; 
	for (int i = 0; i < 16; i++) {
		if (odd[i] != 0) {
			cout << odd[i] << "  ";
		}
		o += (unsigned int)odd[i];
	} 
	cout << "\nTotal odd count = " << e << endl;
	return 0;
}