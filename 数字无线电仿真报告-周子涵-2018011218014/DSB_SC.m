%%%%%%%%%%
fs1=15e4;%
dt1=1/fs1;
fs2=15e6;%�ز�������
fc=4*218028%�ز�Ƶ��
N1=30000;
fs3=30e6;

n=0:N1-1;
t1=n/fs1;
t2=n/fs2;
t3=n/fs3;
% f=(0:len-1)*fs1/len;
% f_1=(0:len-1)*fs2/len;


 ft=1.*sin(2*pi*2*1000*t1)+1.*sin(2*pi*3*1000*t1);
figure(1)
subplot(211)
stem(n,ft)
title('�����ź�f(n)  fs1=150KHz')
subplot(212)
plot(ft)
title('�����ź�f(t)')
% signalFT(fs1,N,ft)
% title('�����ź�Ƶ��');
% Hd=LPF_1;
% [b,a]=tf(Hd);
% Im=filter(b,a,ft)
% Fw_1=fft(Im);
% subplot(3,1,3)
% plot(f,abs((Fw_1)));


%%%%�ز�
figure(2)
cn=cos(2*pi*fc*t2);
% plot(cn)
stem(n,cn)

%%%%%%%%%  ����
cn_1=cos(2*pi*fc*t1);
yn=cn_1.*ft;
figure(3)
subplot(2,1,1)
stem (yn)
hold on 
plot(yn)
title('�ѵ��ź�ʱ��ͼ')
subplot(2,1,2)
signalFT(fs1,N1,yn)
title('�ѵ��ź�Ƶ��ͼ')

%%%%%%%�������
%%%%%%%%%%�����ź�
fs1=30e5;
t1=n/fs1;
yn=(1.*sin(2*pi*2*1000*t1)+1.*sin(2*pi*3*1000*t1)).*cos(2*pi*fc*t1);
cn_2_i=cos(2*pi*fc*t1);
cn_2_q=-sin(2*pi*fc*t1);
si=yn.*cn_2_i;
sq=yn.*cn_2_q;
figure(4)
subplot(211)
stem(si,'.')
title('SI')
subplot(212)
stem(sq,'.')
title('SQ')
figure(10)
subplot(211)
signalFT(fs1,N1,si);
title('SI_W')
subplot(212)
signalFT(fs1,N1,sq)
title('SQ_W')
%%%%%%%%%%��ͨ�˲�
LP=LPF_1;
[b,a]=tf(LP);

%%%%%
figure(5)
z_i=filter(b,a,si);
subplot(211)
signalFT(fs1,N1,z_i);
title('z_iƵ��');
subplot(212)
z_q=filter(b,a,sq);
signalFT(fs1,N1,z_q);
title('z_qƵ��');

figure(11)
subplot(211)
stem(z_i,'.')
title('z_i')
subplot(212)
stem(z_q,'.')
title('z_q')
%%%%%%%%


%%%%%%%%%%ƽ������
An=sqrt(z_i.^2+z_q.^2);
figure(7)
subplot(211)
plot(An)
subplot(212)
stem(An)
% signalFT(fs1,N1,An)



%%%%%%%%%У��Ƶ������
pn=atan(z_q./z_i)%%%%%����Ƶ������

Z_I=z_i.*cos(pn)+z_q.*(-sin(pn));
 figure(6)
 subplot(211)
plot(Z_I)
title('��λ�����ٲ�������źţ�ģ�⣩');
subplot(212)
plot(Z_I,'.')
title('��λ�����ٲ���_����ź�')
% subplot(313)
% Z_w=signalFT(fs1,N,Z_I);
% title('����ź�Ƶ��ͼ')



