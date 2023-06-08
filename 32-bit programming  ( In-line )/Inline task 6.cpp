#include<iostream>
using namespace std;
int num[80];
int main() {
	for (int i = 0; i < 80; i++) {
		num[i] = 0x80;
	}
	cout << "Before Array = ";
	for (int i = 0; i < 80; i++) {
		cout <<std::hex<<num[i] <<" ";
	}
	_asm {
						lea esi,num
						mov ecx,80
			label:
						mov eax,[esi]
						mov ebx,[esi]
						shr ebx,1
						jnc e
						jmp o
			e:
						ror eax,1
						mov [esi],eax
			o:
						add esi,4
						loop label
	}
	cout << "\n\nAfter Array =  ";
	for (int i = 0; i < 80; i++) {
		cout <<std::hex << num[i] << " ";
	}
	return 0;
}