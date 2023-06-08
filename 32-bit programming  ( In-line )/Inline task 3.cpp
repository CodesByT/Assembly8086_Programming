#include<iostream>
using namespace std;
unsigned int arr[5]={ 0,2,5,9,10 };
int main() {
	int size = 5,count=0;
	cout << "Before Array = " << endl;
	for (int i = 0; i < size; i++)
		cout << arr[i] << " ";
	_asm {

		mov ecx,5
		mov esi,offset arr
		mov edi,0
		label:
				mov eax, [esi]
				mov ebx, [esi+4]
			diff:
				cmp eax,ebx
				jne notequal
				jmp oout
		notequal:
				inc edi
				inc eax
				jmp diff
		oout:
				add esi,4
					cmp ecx,4
					je outt
				loop label
		outt:
		mov [count],edi
	}
	cout << "\nTotal " << count << endl << endl;
	return 0;
}