#include<iostream>
using namespace std;
unsigned char arr[7] = "tayyab";
int main() {
	unsigned int size = 7;
	cout << "Before Array = " << arr << endl;
	_asm {
		mov ecx,7
		mov esi,offset arr
		label:
			mov al,[esi]
			mov bl,[esi+1]
			mov [esi+1],al
			mov [esi],bl
			inc esi
			cmp cx,6
			je oout
			loop label
				oout:
	}
	cout << "\n\nAfter Array = " << arr << endl;

	return 0;
}