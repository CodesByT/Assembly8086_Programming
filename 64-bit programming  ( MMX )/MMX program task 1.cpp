
/*
Write a program in C++ that declares two byte-type arrays of 80 elements each and initializes them 
with some data. The program then adds the corresponding elements of these two arrays and stores 
them in a third array using MMX instructions.
*/

#include<iostream>
using namespace std;
unsigned char arr1[80];
unsigned char arr2[80];
unsigned char result[80];
int main(){
	int size = 80;
	for (int i = 0; i < size; i++){
		arr1[i] = 'n';
		arr2[i] = 'n';
	}
	cout << "\nArray 1 =\n\n";
	for (int i = 0; i < size; i++){
		cout << (unsigned int)arr1[i] << "|";
	}
	cout << "\n\n";
	cout << "\nArray 2 =\n\n";
	for (int i = 0; i < size; i++){
		cout << (unsigned int)arr1[i] << "|";
	}
	cout << "\n\n";
		_asm{
			mov esi, 0
			mov ecx,10
PAKORA:
			movq  mm0, [arr1 + esi]
			movq  mm1, [arr2 + esi]
			paddb mm0, mm1
			movq[result + esi], mm0
			add esi,8
			loop PAKORA
			emms
		}
	cout << "\nResult =\n\n";
	for (int i = 0; i < size; i++){
		cout << (unsigned int)result[i] << "|";
	}
	cout << "\n\n\n\n";

	return 0;
}