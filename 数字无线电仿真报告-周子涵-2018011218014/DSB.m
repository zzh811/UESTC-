function X = DSB
fs1 = 150*1e3;%% �����źŲ���Ƶ��
fs2 = 15*1e6;%% �ز��źŲ���Ƶ��
fc = 4*218014;
t1 = 0:1/fs1:0.001;
t2 = 0:1/fs2:0.00001;
n1 = length(t1);
n2 = length(t2);
N1 = 0:fs1/(n1-1):fs1;
N2 = 0:fs2/(n2-1):fs2;
f1 = sin(2*pi*2*1000.*t1) ;
f2 = sin(2*pi*3*1000.*t1);
c = cos(2*pi*fc*t2); %% �ز��ź�
f = f1+f2; %% ԭʼ�ź�
fn = abs(fft(f1)) + abs(fft(f2));
f12 = f1 .* cos(2*pi*fc*t2);
f22 = f2 .* cos(2*pi*fc*t2);
X = f12 + f22; 

figure(1);
stem(t1,f);
title('ԭʼ�źŲ���');

figure(2);
stem(t2,c);
title('�ز��źŲ���');



figure(3);
stem(t2,X);
title('�ز��������ź�ʱ��');

figure(4);
Xn = abs(fft(X));
plot(N2,Xn);
title('�ز��������ź�Ƶ��');

figure(5);
plot(N1,fn);
axis([1000 4000,0 100]);
title('ԭʼ�ź�Ƶ��');


end
