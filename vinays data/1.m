d = real(dlmread ("walk1.csv",";"));
#d = d(1000:2000,:);
accx = d(:,1);
accy = d(:,2);
accz = d(:,3);

grx = d(:,4);
gry = d(:,5);
grz = d(:,6);

linx = d(:,7);
liny = d(:,8);
linz = d(:,9);

gyrx = d(:,10);
gyry = d(:,11);
gyrz = d(:,12);

magx = d(:,14);
magy = d(:,15);
magz = d(:,16);

orx = d(:,17);
ory = d(:,18);
orz = d(:,19);

t = d(:,30);
p = d(:,20);

figure(1);
ax1 = subplot(7,1,1);
plot(t, accx);
hold on;
plot(t, accy);
plot(t, accz);

ax2 = subplot(7,1,2);
plot(t, grx);
hold on;
plot(t, gry);
plot(t, grz);

ax3 = subplot(7,1,3);
plot(t, linx);
hold on;
plot(t, liny);
plot(t, linz);

ax4 = subplot(7,1,4);
plot(t, gyrx);
hold on;
plot(t, gyry);
plot(t, gyrz);

ax5 = subplot(7,1,5);
plot(t, magx);
hold on;
plot(t, magy);
plot(t, magz);

ax6 = subplot(7,1,6);
plot(t, orx);
hold on;
plot(t, ory);
plot(t, orz);

ax7 = subplot(7,1,7);
plot(t, p);

linkaxes([ax1,ax2,ax3,ax4,ax5,ax6,ax7],'x');

print -dpng 1.png

figure(2);
aax1 = subplot(7,1,1);
plot(t,(accx.^2 + accy.^2 + accz.^2).^0.5)

aax2 = subplot(7,1,2);
plot(t, (grx.^2+gry.^2+grz.^2).^0.5);

aax3 = subplot(7,1,3);
plot(t, (linx.^2+liny.^2+linz.^2).^0.5);

aax4 = subplot(7,1,4);
plot(t, (gyrx.^2+gyry.^2+gyrz.^2).^0.5);

aax5 = subplot(7,1,5);
plot(t, (magx.^2+magy.^2+magz.^2).^0.5);

aax6 = subplot(7,1,6);
plot(t, (orx.^2+ory.^2+orz.^2).^0.5);

aax7 = subplot(7,1,7);
plot(t, p);

linkaxes([aax1,aax2,aax3,aax4,aax5,aax6,aax7],'x');

print -dpng 2.png

figure(3);
t = ((0:1:length(t)-1) * (100)/length(t))';
t = t(2:length(t));
aaax1 = subplot(6,1,1);
plot(t,abs(fft((accx.^2 + accy.^2 + accz.^2).^0.5)(2:length(t)+1)));

aaax2 = subplot(6,1,2);
plot(t, abs(fft((grx.^2+gry.^2+grz.^2).^0.5)(2:length(t)+1)));

aaax3 = subplot(6,1,3);
plot(t, abs(fft((linx.^2+liny.^2+linz.^2).^0.5)(2:length(t)+1)));

aaax4 = subplot(6,1,4);
plot(t, abs(fft((gyrx.^2+gyry.^2+gyrz.^2).^0.5)(2:length(t)+1)));

aaax5 = subplot(6,1,5);
plot(t, abs(fft((magx.^2+magy.^2+magz.^2).^0.5)(2:length(t)+1)));

aaax6 = subplot(6,1,6);
plot(t, abs(fft((orx.^2+ory.^2+orz.^2).^0.5)(2:length(t)+1)));


linkaxes([aaax1,aaax2,aaax3,aaax4,aaax5,aaax6],'x');

print -dpng 3.png

figure(4);
t = [0 ;t];
ax1 = subplot(7,1,1);
[ggg1,ggg2,ggg3] = threedangle(accx,accy,accz);
plot(t, ggg1);
hold on;
plot(t, ggg2);
plot(t, ggg3);

ax2 = subplot(7,1,2);
[ggg1,ggg2,ggg3] = threedangle(grx,gry,grz);
plot(t, ggg1);
hold on;
plot(t, ggg2);
plot(t, ggg3);

ax3 = subplot(7,1,3);
[ggg1,ggg2,ggg3] = threedangle(linx,liny,linz);
plot(t, ggg1);
hold on;
plot(t, ggg2);
plot(t, ggg3);

ax4 = subplot(7,1,4);
[ggg1,ggg2,ggg3] = threedangle(gyrx,gyry,gyrz);
plot(t, ggg1);
hold on;
plot(t, ggg2);
plot(t, ggg3);

ax5 = subplot(7,1,5);
[ggg1,ggg2,ggg3] = threedangle(magx,magy,magz);
plot(t, ggg1);
hold on;
plot(t, ggg2);
plot(t, ggg3);

ax6 = subplot(7,1,6);
[ggg1,ggg2,ggg3] = threedangle(orx,ory,orz);
plot(t, ggg1);
hold on;
plot(t, ggg2);
plot(t, ggg3);

ax7 = subplot(7,1,7);
plot(t, p);

linkaxes([ax1,ax2,ax3,ax4,ax5,ax6,ax7],'x');

print -dpng 4.png


#{
energy
max-min
rms
max
min
#}