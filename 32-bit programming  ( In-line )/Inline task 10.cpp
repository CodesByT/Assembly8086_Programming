#include<iostream>
using  namespace std;
int arr[5] = { 0X11223344, 0X11223344, 0X11223344, 0X11223344, 0X11223344};
int main(){
	cout << "Before array = ";
	for (int i = 0; i < 5; i++){
		cout <<std::hex<< arr[i] << " ";
	}
		_asm{
			lea esi,arr
			mov ecx,5
		tag:
			// Swaping 3rd and 1st byte
			mov al, [esi+2]
			mov bl, [esi]
			mov [esi],al
			mov [esi+2],bl
			// Rotating 2nd byte  
			mov al, [esi+1]
			ror al,1
			mov [esi+1],al
			// Shifting 4th byte 
			mov al, [esi+3]
			shr al,1
			mov [esi+3],al
			
			add esi,4
			loop tag
		}
	cout << "\n\nAfter array = ";
	for (int i = 0; i < 5; i++){
		cout << std::hex << arr[i] << " ";
	}
	cout << "\n\n";
	return 0;
}