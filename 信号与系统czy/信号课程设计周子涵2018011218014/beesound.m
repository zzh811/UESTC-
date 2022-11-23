clear;
clc;
close all;
[x,Fs] = audioread('D:\MATLAB\buzz.wav');
% sound(x)
% disp(fs)
figure(1);
subplot(2,1,1);
title('ԭʼʱ����');
plot(x,'b');
N = length(x);n = 0:N-1;
y = fft(x,Fs);
figure(1);
subplot(2,1,2);
title('ԭʼƵ����');
plot(abs(y),'b');
%�����ź���Ҫ�ֲ���0-1000hz����
figure(2);
plot(abs(y),'b');
set(gca,'XLim',[0,1000]);
set(gca,'XTick',[0,20,1000]);
title('Ƶ��Ŵ�ͼ');
%����˲����ѵ���1000hz���˲�
fp = 1000;
fs = 950;
wp = (2*fp*pi)/Fs;
ws = (2*fs*pi)/Fs;
wc = (wp+ws)/(2*pi);
wdp = wp-ws;
N = ceil((8*pi)/wdp);
N = N+mod(N,2);
HPfir = fir1(N,wc,'high',hanning(N+1));
figure(3);
subplot(2,1,1);
plot(HPfir);
title('�˲���ʱ��');
subplot(2,1,2);
plot(abs(fft(HPfir)));
title('�˲���Ƶ��');
x1 = filter(HPfir,1,x);
figure(4);
subplot(2,1,1);
title('�˲���ʱ��');
plot(x1);
y1 = fft(x1,Fs);
figure(4);
subplot(2,1,2);
plot(abs(y1));
title('�˲���Ƶ��');
x1 = x1*100;
sound(x1)



