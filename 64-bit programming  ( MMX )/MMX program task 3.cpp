#include<iostream>
using namespace std;

unsigned char arr[8] = { 0x92,0x39  ,0x47,0x34,0x62,0x53,0x84,0x75 };
unsigned char ones[8] = { 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1 };
unsigned char zeros[8] = { 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0 };
unsigned char even[8] = { 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0 };
unsigned char odd[8] = { 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0};
int main() {
	_asm {
					lea esi,arr
					movq mm0,[esi]
					movq mm1,[ones]
					pand mm1,mm0
					pcmpeqb mm1,[ones]
					pand mm1,mm0
					movq [odd],mm1
					
					movq mm0,[esi]
					movq mm1,[ones]
					pand mm1,mm0
					pcmpeqb mm1,[zeros]
					pand mm1,mm0
					movq [even],mm1

	}
	for (int i = 0; i < 8; i++)
		cout <<hex<< (int)odd[i] << " ";
	cout << endl<< endl;
	for (int i = 0; i < 8; i++)
		cout<< hex << (int) even[i] << " ";
	cout <<endl<< endl;

	return 0;
}