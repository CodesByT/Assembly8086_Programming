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
		mov eax, [esi]
			mov edx, [esi]
			mov ebx, [esi]
			// Swaping 3rd and 1st byte
			AND EDX, 0X000000FF
			SHL EDX, 16
			AND EBX, 0X00FF0000
			SHR EBX, 16
			AND EAX, 0XFF00FF00
			OR EAX, EBX
			OR EAX, EDX
			MOV[ESI], EAX

			// Rotating 2nd byte  
			MOV EDX, [ESI]
			AND EDX, 0X0000FF00
			ROR DH, 1
			AND EAX, 0XFFFF00FF
			OR EAX, EDX
			MOV[ESI], EAX

			// Shifting 4th byte
			MOV EDX, [ESI]
			AND EDX, 0XFF000000
			ROL EDX, 8
			XOR BX, BX
			MOV BL, DL
			SHL BL, 1
			MOV DL, BL
			ROR EDX, 8
			AND EAX, 0X00FFFFFF
			OR EAX, EDX
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