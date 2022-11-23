clear;clc;clf;
%1�����fs
%����������Ƶ��f0 = 134 MHz
%      ���ƴ���B = 10 MHz
%      ��ֹƵ��fc = 139 MHz
%      ��Ʋ�����fs = 500 MHz
%      ʱ��T = 50 ΢��
f0 = 134000000;
B = 10000000;

n0 = 25000;
sprate = 500000000;
t0 = n0/sprate;
fc = 139000000;

t = linspace(0,t0,n0);
ipsig = sin((2*pi*(f0-B/2)*t)+(pi*(B/t0)*t.*t));

figure(1);
plot(t(1:100),ipsig(1:100));
title('ʱ��');
xlabel('t');ylabel('voltage');
grid on;
legend('modulated signal');

figure(2);
w = linspace(-1,1,n0);
plot(w,20*log10(fftshift(abs(fft(ipsig)))));
title('��Ƶ');
xlabel('w');ylabel('|X(eiw)|');
grid on;
legend('modulated signal');

figure(3);
plot(w,20*log10(fftshift(angle(fft(ipsig)))));
title('��Ƶ');
xlabel('w');ylabel('��X(ejw)');
grid on;
legend('modulated signal');
