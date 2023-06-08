/*
Write a program in C++ that declares and initializes an integer array of 5 elements. The program then rotates 
the least significant byte (i.e., byte #0) and most significant byte (i.e., byte #3) to the left and the byte #1 
and byte #2 to the right of each element of the array using inline assembly language programming
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
			// Rotating 0th and 3th byte right by 1 bit 
			mov ah, [esi]
			mov al, [esi + 3]
			SHL ah, 1
			SHL al, 1
			mov[esi + 3], al
			mov[esi], ah
			// Rotating 1rd and 2th byte right by 1 bit 
			mov ah,[esi + 1]
			mov al, [esi + 2]
			SHR ah, 1
			SHR al, 1
			mov[esi + 2], al
			mov[esi + 1], ah
			add esi, 4

			loop tag
	}
	cout << "\n\nAfter Array =  ";
	for (int i = 0; i < size; i++)
		cout << std::hex << arr[i] << "  ";
	cout << endl << endl << endl;
	return 0;
}