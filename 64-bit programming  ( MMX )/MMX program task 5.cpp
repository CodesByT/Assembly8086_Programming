#include<iostream>
using namespace std;
unsigned char arr1[80];
unsigned char arr2[8];
unsigned char result[8];
int main() {
	int ans=0;
	for (int i = 0; i < 80; i++)
		arr1[i] = '1';
	for (int i = 0; i < 8; i++)
		arr2[i] = '0';

	_asm {
						mov esi,0
						movq mm1,[arr2]
						mov ecx,10
			label:
						movq mm0,[arr1+esi]
						psubb mm0,mm1
						paddb mm3,mm0
						loop label
						
						movq [result],mm3
	}
	for (int i = 0; i < 8; i++)
		ans += result[i];
	cout << ans << endl << endl << endl;

}