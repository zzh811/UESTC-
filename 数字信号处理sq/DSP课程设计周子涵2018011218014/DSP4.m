clear;clc;clf;

f0 = 134000000;
B = 10000000;

n0 = 25000;
sprate = 500000000;
t0 = n0/sprate;
fc = 139000000;

t = linspace(0,t0,n0);
ipsig = sin((2*pi*(f0-B/2)*t)+(pi*(B/t0)*t.*t));
w = linspace(-1,1,n0);
SI = ipsig.*cos(2*pi*f0*t);
SQ = ipsig.*sin(2*pi*f0*t);

window = kaiser(16,5.653);
b = fir1(15,0.62,window);
[H,W] = freqz(b,1);
y1 = fftfilt(b,SI);
y2 = fftfilt(b,SQ);

SII = resample(y1,12000000,500000000);
SQQ = resample(y2,12000000,500000000);

t1 = linspace(0,t0,600);
w1 = linspace(-1,1,600);

figure(1);
plot(t1(1:50),SII(1:50));
title('�ı�����ʺ�SIʱ��');
figure(2);
plot(w1(1:600),20*log10(fftshift(abs(fft(SII)))));
title('�ı�����ʺ�SI��Ƶ');
figure(3);
plot(w1(1:600),20*log10(fftshift(angle(fft(SII)))));
title('�ı�����ʺ�SI��Ƶ');

figure(4);
plot(t1(1:50),SQQ(1:50));
title('�ı�����ʺ�SQʱ��');
figure(5);
plot(w1(1:600),20*log10(fftshift(abs(fft(SQQ)))));
title('�ı�����ʺ�SQ��Ƶ');
figure(6);
plot(w1(1:600),20*log10(fftshift(angle(fft(SQQ)))));
title('�ı�����ʺ�SQ��Ƶ');


