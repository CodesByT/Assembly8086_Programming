/*
Write a program in C++ that declares and initializes an integer array of 5 elements.
The program then swaps the least and most significant bytes and the nibbles of 
the second byte of each element of the array using 
inline assembly language programming.
*/
#include<iostream>
using namespace std;
unsigned int arr[5] = { 0x41371847,0x32845623,0x34834636,0x94823645,0x75235653 };
int main() {
	int size = 5;
	cout << "'\n\nBefore Array = ";
	for (int i = 0; i < size; i++)
		cout << std::hex << arr[i] << "  ";

	_asm {
		lea esi, arr
		mov ecx, 5
		tag:
		mov ah, [esi]
			mov al, [esi + 3]
			mov[esi + 3], ah
			mov[esi], al

			mov al, [esi + 1]
			ror al, 4
			mov[esi + 1], al
			add esi, 4

			loop tag
	}
	cout << "\n\nAfter Array =  ";
	for (int i = 0; i < size; i++)
		cout << std::hex << arr[i] << "  ";
	cout << endl << endl << endl;
	return 0;
}