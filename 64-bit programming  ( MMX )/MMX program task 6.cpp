#include<iostream>
using namespace std;
unsigned char arr[81] = "22222222221111111111222222222211111111112222222222111111111122222222221111111111";
unsigned int even_check[8] = { 1,1,1,1,1,1,1,1 };
int main() {
	int size = 80,loop=size/8, even_sum = 0, odd_sum = 0;
	cout << "Before Array = " << endl;
	for (int i = 0; i < size; i++)
		cout << arr[i] << " ";
	_asm {
				mov ecx,8
				mov esi,offset arr
				movq mm1, [even_check]
		l00p:
				movq mm0,[esi]
				pand mm0,mm1
				add esi,8
				loop l00p
			
	}
	cout << "\nTotal even sum " << even_sum << endl << endl;
	return 0;
}