#include<iostream>
using namespace std;
unsigned int arr[5] = {0x41371847,0x32845623,0x34834636,0x94823645,0x75235653};
int main() {
	int size = 5;
	cout << "Before Array = ";
	for (int i = 0; i < size; i++)
		cout <<std::hex<< arr[i] << "  ";
	
	
	_asm {
						lea esi, arr
						mov ecx,5
			tag:
						mov ah,[esi]
						mov al,[esi+3]
						mov [esi+3],ah
						mov [esi],al

						mov al,[esi+1]
						ror al,4
						mov [esi+1],al
						add esi,4

						loop tag
	}
	cout << "\n\n\nAfter Array = ";
	for (int i = 0; i < size; i++)
		cout <<std::hex<< arr[i] << "  ";
	cout << endl << endl << endl;
	return 0;
}