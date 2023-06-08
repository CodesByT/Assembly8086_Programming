/*
Write a program in C++ that declares a byte array of 80 elements and initializes it with some data. 
The program then calculates the sum of even and odd elements using MMX instructions and prints 
them.
*/
#include<iostream>
using namespace std;
int main()
{
	unsigned char arr1[16] = { 25, 50, 80, 42, 64, 50, 32, 61, 46, 98, 72, 36, 45, 35, 20, 110 };
	unsigned char even[16] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	unsigned char odd[16] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	unsigned char arr2[16] = { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 };
	int e = 0, o = 0;
	cout << "\nArray = "; for (int i = 0; i < 16; i++) {
		cout << (unsigned int)arr1[i] << "  ";
	}
	__asm
	{
					mov esi, 0
					mov ecx, 2
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
			cout << (unsigned int)even[i] << "  ";
		}
		e += (unsigned int)even[i];
	}
	cout << "\nTotal even count = " << e << endl;
	cout << "\nOdd numbers are  = ";
	for (int i = 0; i < 16; i++) {
		if (odd[i] != 0) {
			cout << (unsigned int)odd[i] << "  ";
		}
		o += (unsigned int)odd[i];
	}
	cout << "\nTotal odd count = " << o << endl<< endl<< endl;
	return 0;
}