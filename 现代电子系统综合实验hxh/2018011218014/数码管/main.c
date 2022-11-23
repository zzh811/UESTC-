/*
	main.c
	����ܵĶ�̬ɨ����ʾ
*/


#include <reg51.h>
#include <absacc.h>
#include <ctype.h>


//������ʾ���������ɶ�ʱ�жϳ����Զ�ɨ�裩
unsigned char DispBuf[8];


/*
������T1INTSVC()
���ܣ���ʱ��T1���жϷ�����
*/
void T1INTSVC() interrupt 3
{
	code unsigned char com[] = {0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80};
	static unsigned char n = 0;
	TR1 = 0;
	TH1 = 0xFC;
	TL1 = 0x66;
	TR1 = 1;
	XBYTE[0x7800] = 0xFF;		//��ͣ��ʾ
	XBYTE[0x7801] = ~DispBuf[n];	//����ɨ������
	XBYTE[0x7800] = ~com[n];	//������ʾ
	n++;
	n &= 0x07;
}


/*
������DispClear()
���ܣ��������ܵ�������ʾ
*/
void DispClear()
{
	unsigned char i;
	for ( i=0; i<8; i++ )
	{
		DispBuf[i] = 0x00;
	}
}


/*
������DispChar()
���ܣ������������ʾ�ַ�
������
	x������ܵ�����λ�ã�0��7��
	c��Ҫ��ʾ���ַ�������16�������ֺͼ��ţ�
	dp���Ƿ���ʾС���㣬0������ʾ��1����ʾ
*/
void DispChar(unsigned char x, unsigned char c, bit dp)
{
	code unsigned char Tab[] =
	{//����0123456789AbCdEF���������������
		0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,
		0x7F,0x6F,0x77,0x7C,0x39,0x5E,0x79,0x71
	};
	unsigned char t;	//��ʱ����
//��ֹ��ʾλ�ó�����Χ
	x &= 0x07;
	x = 7 - x;
//�����ַ�c��ȡ�ö�Ӧ���������������
	if ( c == '-' )
	{
		t = 0x40;
	}
	else
	{
		t = toint(c);	//toint()Ϊ�⺯�������C:\Keil\C51\HLP\C51.pdf
		if ( t < 16 )	//�����16�����ַ�
		{
			t = Tab[t];	//���ȡ���������������
		}
		else
		{
			t = 0x00;	//����������ַ�����ʾΪ�հ�
		}
	}
//����Ƿ���ʾС����
	if ( dp )
	{
		t |= 0x80;
	}
	else
	{
		t &= 0x7F;
	}
//�͵���ʾ��������ʾ
	DispBuf[x] = t;
}


/*
������DispInit()
���ܣ������ɨ����ʾ��ʼ��
*/
void DispInit()
{
	DispClear();	//��ʼΪȫ��
	EA = 0;
	TMOD &= 0x0F;
	TMOD |= 0x10;
	TH1 = 0xFC;
	TL1 = 0x66;
	TR1 = 1;
	ET1 = 1;
	EA = 1;
}


/*
������Delay()
���ܣ���ʱ0.001��65.536s
������
	t>0ʱ����ʱ(t*0.001)s
	t=0ʱ����ʱ65.536s
*/
void Delay(unsigned int t)
{
	do
	{
		TH0 = 0xFA;
		TL0 = 0x24;
		TR0 = 1;
		while ( !TF0 );
		TR0 = 0;
		TF0 = 0;
	} while ( --t != 0 );
}


/*
������SysInit()
���ܣ�ϵͳ��ʼ��
*/
void SysInit()
{
	TMOD &= 0xF0;
	TMOD |= 0x01;	//���ö�ʱ��T0Ϊ16λ��ʱ��
	DispInit();		//�����ɨ����ʾ��ʼ��
}


void main()
{
	code unsigned char s[] = "0123456789abcdef";
	unsigned char i;
	unsigned char x;
	bit dp;
	SysInit();
	dp = 0;
	for (;;)
	{

		 
    	for ( i=0; i<16; i++ )
		{
			for ( x=0; x<8; x++ )
			{
			DispChar(x,s[i],dp);
			}
			Delay(1000);
		}  
		dp = !dp; 
	}
}

