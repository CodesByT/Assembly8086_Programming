#include<iostream>
using  namespace std;
int arr[5] = { 0X11223344, 0X77889966, 0X99335522, 0X11773322, 0X99556633 };
int main() {
	cout << "Before array = ";
	for (int i = 0; i < 5; i++) {
		cout << std::hex << arr[i] << " ";
	}
	_asm {
		lea esi, arr
		mov ecx, 5
		tag:
			// Swaping 3rd and 1st byte
			MOV EAX, [ESI]
			MOV DL, AL
			ROR EAX, 16
			MOV DH, AL
			MOV AL, DL
			ROL EAX, 16
			MOV AL, DH
			MOV[ESI], EAX
			// Rotating 2nd byte  
			ROR AH, 1
			MOV[ESI], EAX
			// Shifting 4th byte 
			ROL EAX, 8
			MOV DL, AL
			SHL DL, 1
			MOV AL, DL
			ROR EAX,8
			MOV[ESI], EAX

			add esi, 4
			loop tag
	}
	cout << "\n\nAfter array =  ";
	for (int i = 0; i < 5; i++) {
		cout << std::hex << arr[i] << " ";
	}
	cout << "\n\n";
	return 0;
}