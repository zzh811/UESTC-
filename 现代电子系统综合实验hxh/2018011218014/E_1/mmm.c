/*
	main.c
	����LED
*/


#include <reg51.h>	          //����8051��SFR�Ĵ�������ͷ�ļ�
#include <ABSACC.H>
sbit LED = P2^4;
void main()
{	P0=0x77;               //����LED���涨LED�ǵ͵�ƽ�����ģ�
for (;;);	              //ͣ������C51��main�����һ�㲻����ִ�з��ز�����
}                                