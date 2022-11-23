/*
	main.c
	�򵥵Ķ�ʱ
*/


#include <reg51.h>	//����8051��SFR�Ĵ�������ͷ�ļ�
#include <ABSACC.H>
sbit LED=P0^0;
sbit LED1=P0^2;
sbit LED2=P0^4;
sbit LED3=P0^6;


/*
������Delay()
���ܣ���ʱ0.001 S��65.536 S
������t>0ʱ����ʱ(t*0.001) S��    t=0ʱ����ʱ65.536S
˵��������Ƶ��18MHz����ʱ1ms�Ķ�ʱ����ֵ��65536-0.001*(f/12))��fΪ����Ƶ��
*/

void Delay(unsigned int t)
{
	do
	{
		TH0 = 0xFA;
		TL0 = 0x24;		//���ö�ʱ����ֵ����Ӧ0.001s��
		TR0 = 1;		//������ʱ��
		while ( !TF0 );	//�ȴ���ʱ�����
		TR0 = 0;		//ֹͣ��ʱ��
		TF0 = 0;		//��������־
	} while ( --t != 0 );	//ѭ��t��
}


void main()
{
	TMOD &= 0x0F;
	TMOD |= 0x01;	//����ʱ��T0����Ϊ��ʽ1����16λ��ʱ��
	for (;;)
	{
		LED=0;	//����LED
		LED1=0;	//����LED
		LED2=0;	//����LED
		LED3=0;	//����LED
		Delay(100);	//��ʱ100ms
		LED=1;	//Ϩ��LED
		LED1=1;	//����LED
		LED2=1;	//����LED
		LED3=1;	//����LED
 		Delay(900);	//��ʱ900ms
	}
}

