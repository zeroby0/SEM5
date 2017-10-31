% lab test mid term
clear;
dt = 0.01;
df2 = 0.01;
%% Q1
t = -2:dt:2;
x = zeros(1,length(t));
x = (1-abs(t));

[X,f,df] = contFT(x,-2,dt,1);

figure(1);
subplot(4,1,1);
plot(t,x);
title('x(t)')
xlabel('time t');
ylabel('amplitude');

subplot(4,1,2)
%plot(t1,x);
plot(f, abs(X));
xlim([-6, 6]);
title('x(3t-3/2)')
xlabel('time t');
ylabel('amplitude');

subplot(4,1,3);
plot(f,real(X));
title('real of X(f)');
xlabel('frequency f');
ylabel('amplitude');

subplot(4,1,4);
plot(f,imag(X));
title('imaginary of X(f)');
xlabel('frequency f');
ylabel('amplitude');

print -dpng 1.png

tv = -1:dt:4;
v =  zeros(1,length(tv));
v(1:dt:1/dt) = 3;%-1 to 0
v(1/dt+1:dt:2/dt) = 1;%0 to 1
v(2/dt+1:dt:3/dt) = 0;%1 to 2
v(3/dt+1:dt:4/dt) = -2;%2 to 3
v(4/dt+1:dt:5/dt) = 1;%3 to 4

[y,ty] = contconv(x,v,min(t),min(tv),dt);

figure(2);
subplot(3,1,1);
plot(t,x);
title('x(t)')
xlabel('time t');
ylabel('amplitude');
subplot(3,1,2);
plot(tv,v);
title('v(t)');
xlabel('time t');
ylabel('amplitude');
subplot(3,1,3);
plot(ty,y);
title('x(t)*v(t)');
xlabel('time t');
ylabel('amplitude');

%% Q2
t2 = 0:dt:5;
c = cos(2*pi*25*t2);
[C,cf,dcf] = contFT(c,min(t2),dt,1);

f2 = -1:dcf:1;
M = zeros(1,length(f2));
M = (1-abs(f2));
[DSB,fdsb] = contconv(C,M,min(cf),min(f2),dcf); 


figure(3);
subplot(4,1,1);
plot(f2,M);
title('M(f)')
xlabel('frequency f');
ylabel('amplitude');
subplot(4,1,2);
plot(t2,c);
title('c(t)');
xlabel('time t');
ylabel('amplitude');
subplot(4,1,3);
plot(cf,C);
title('C(f)')
xlabel('frequency f');
ylabel('amplitude');
subplot(4,1,4);
plot(fdsb,real(DSB))
title('DSB(f)')
xlabel('frequency f');
ylabel('amplitude');

%% Q3
t3 = -1:dt:1;
fc3=15;
st = sinc(2*t3).*cos(2*pi*fc3*t3);
[sf,f3,df3] = contFT(st,-1,dt,1);

figure(4);
subplot(2,1,1);
plot(t3,st);
title('pasband signal')
xlabel('time t');
ylabel('amplitude');
subplot(2,1,2);
plot(f3,abs(sf).^2);
title('PSD')
xlabel('frequency f');
ylabel('amplitude');

t31 = -5:dt:5;
fc3 = 40;
fm = 1;
mt = sin(2*pi*fm*t31);
mtht = cos(2*pi*fm*t31);

dsb3 = mt.*cos(2*pi*fc3*t31);
usb = mt.*cos(2*pi*fc3*t31) - mtht.*sin(2*pi*fc3*t31);
lsb = mt.*cos(2*pi*fc3*t31) + mtht.*sin(2*pi*fc3*t31);

[usbf,fusb,dfusb] = contFT(usb,0,dt,100);
[lsbf,flsb,dflsb] = contFT(lsb,0,dt,100);

figure(5);
subplot(2,1,1);
plot(t31,mt);
title('m(t)')
xlabel('time t');
ylabel('amplitude');
subplot(2,1,2);
plot(t31,mtht);
title('mh(t)')
xlabel('time t');
ylabel('amplitude');


figure(6);
subplot(2,1,1);
plot(fusb,usbf);
title('USB frequency')
xlabel('frequency f');
ylabel('amplitude');
subplot(2,1,2);
plot(flsb,lsbf);
title('LSB frequency')
xlabel('frequency f');
ylabel('amplitude');


%% Q4
b = [1,0,0,1,0,1];

t4 = 0:dt:1;
ref = sinc(4*(t4-0.5));

b_up = zeros(1,1+(length(b)-1)*(1/dt));
b_up(1:1/dt:length(b_up)) = b;

[up,tp] = contconv(b_up,ref,0,0,dt);
modindx =0.5;
fcam = 25;
am = (1+0.5*(up/dt)).*cos(2*pi*fcam*tp);

figure(7);
subplot(3,1,1);
plot(t4,ref);
title('reference signal');
xlabel('time t');
ylabel('amlitude');
subplot(3,1,2);
plot(tp,up);
title('BM wave');
xlabel('time t');
ylabel('amlitude');
subplot(3,1,3);
plot(tp,am);
title('AM wave');
xlabel('time t');
ylabel('amplitude');

amd = am;
amd(amd<0)=0;
rc = 0.05;
th = 0:dt:1;
h = exp(-th/rc);
[amf,tamf] = contconv(amd,h,0,0,dt);

amf1 = amf(1:length(tp));
amfa = amf1 - mean(amf1);

figure(8);
subplot(5,1,1);
plot(tp,am);
title('AM wave');
xlabel('time t');
ylabel('amplitude');
subplot(5,1,2);
plot(tp,amd);
title('didode o/p');
xlabel('time t');
ylabel('amplitude');
subplot(5,1,3);
plot(th,h);
title('filter');
xlabel('time t');
ylabel('amplitude');
subplot(5,1,4);
plot(tp,amf1);
title('filtered output');
xlabel('time t');
ylabel('amplitude');
subplot(5,1,5);
hold on;
plot(tp,100*amfa,'g');
plot(tp,up/dt,'r');
hold off;
title('averaged output');
xlabel('time t');
ylabel('amplitude');





