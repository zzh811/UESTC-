N=28;
X=[-0.5200 2.5849 0.9919 2.9443 -0.4240 1.7762 2.0581 1.5754 1.7971 0.4869 7.8736 8.1850 9.3666 8.4139 10.5374 9.1401 7.1372 8.5458 8.3479 9.1033 3.7794 3.7210 3.2663 3.9355 2.5560 4.6123 2.6765 3.3384];
Y=[1.8539 2.2481 1.9234 3.7382 3.6220 2.6264 2.0918 1.1924 1.5387 0.5940 7.6255 7.5291 9.7513 8.7532 8.0650 7.7072 8.0828 8.7662 10.2368 8.3269 4.8633 4.6794 4.5548 5.0016 5.2594 4.0442 3.6859 4.2667];
plot(X,Y,'r.')
xlabel('X');
ylabel('Y');
title('before')
n=2;
m=1;
eps=1e-7;
u1=[X(1) Y(1)];
u2=[X(2) Y(2)];
U1=zeros(2,100);
U2=zeros(2,100);
U1(:,2)=u1;
U2(:,2)=u2;
D=zeros(2,N);
while(abs(U1(1,m)-U1(1,m+1))>eps||abs(U1(2,m)-U2(2,m+1))>eps||abs(U2(1,m)-U2(1,m+1))>eps||abs(U2(2,m)-U2(2,m+1))>eps)
m=m+1;
for i=1:N
    D(1,i)=sqrt((X(i)-U1(1,m))^2+(Y(i)-U1(2,m))^2);
end
for i=1:N
    D(2,i)=sqrt((X(i)-U2(1,m))^2+(Y(i)-U2(2,m))^2);
end
A=zeros(2,N);
B=zeros(2,N);
for k=1:N
    [MIN,index]=min(D(:,k));
    if index==1
        A(1,k)=X(k);
        A(2,k)=Y(k);
    else
        B(1,k)=X(k);
        B(2,k)=Y(k);
    end
end
indexA=find(A(1,:)~=0);
indexB=find(B(1,:)~=0);
U1(1,m+1)=mean(A(1,indexA));
U1(2,m+1)=mean(A(2,indexA));
U1(1,m+1)=mean(B(1,indexA));
U1(2,m+1)=mean(B(2,indexA));
end
figure;
plot(A(1,indexA),A(2,indexA),'*b');
hold on
plot(B(1,indexA),B(2,indexA),'oy');
hold on
centerx=[U1(1,m) U2(1,m)];
centery=[U1(2,m) U2(2,m)];
plot(centerx,centery,'+g');
xlabel('X');
ylabel('Y');
title('after');
disp(['diedaicishu:',num2str(m)]);


    
% z1=[y1(1) y2(1)];
% z2=[y1(2) y2(2)];
% for i=1:28
%     p=[y1(i) y2(i)];
%     t1=norm(p-z1);
%     t2=norm(p-z2);
%     if t1<t2
%         
%         
%     end
%         
% end

% m1=[-0.5200 1.8539];
% m2=[2.5849 2.2481];
% m3=[0.9919 1.9234];
% m4=[2.9443 3.7382];
% m5=[-0.4240 3.6220];
% m6=[1.7762 2.6264];
% m7=[2.0581 2.0918];
% m8=[1.5754 1.1924];
% m9=[1.7971 1.5387];
% m10=[0.4869 0.5940];
% m11=[7.8736 7.6255];
% m12=[8.1850 7.5291];
% m13=[9.3666 9.7513];
% m14=[8.4139 8.7532];
% m15=[10.5374 8.0650];
% m16=[9.1401 7.7072];
% m17=[7.1372 8.0828];
% m18=[8.5458 8.7662];
% m19=[8.3479 10.2368];
% m20=[9.1033 8.3269];
% m21=[3.7794 4.8633];
% m22=[3.7210 4.6794];
% m23=[3.2663 4.5548];
% m24=[3.9355 5.0016];
% m25=[2.5560 5.2594];
% m26=[4.6123 4.0442];
% m27=[2.6765 3.6859];
% m28=[3.3384 4.2667];
% A={m1 m2};
% disp(A(2))
% clear;clc
% A=[-0.5200 2.5849 0.9919 2.9443 -0.4240 1.7762 2.0581 1.5754 1.7971 0.4869 7.8736 8.1850 9.3666 8.4139 10.5374 9.1401 7.1372 8.5458 8.3479 9.1033 3.7794 3.7210 3.2663 3.9355 2.5560 4.6123 2.6765 3.3384;1.8539 2.2481 1.9234 3.7382 3.6220 2.6264 2.0918 1.1924 1.5387 0.5940 7.6255 7.5291 9.7513 8.7532 8.0650 7.7072 8.0828 8.7662 10.2368 8.3269 4.8633 4.6794 4.5548 5.0016 5.2594 4.0442 3.6859 4.2667];
% z1=A(:,1);
% z2=A(:,2);
% for i=3:28
%     t1=norm(z1-A(:,i));
%     t2=norm(z2-A(:,i));
%     m=1;
%     n=1;
%     if t1<t2
%         z1=z1+A(:,i);
%         m=m+1;
%     else
%         z2=z2+A(:,i);
%         n=n+1;
%     end
%     Z1=z1/m;
%     Z2=z2/n;
%     
%         
% end

  

    





