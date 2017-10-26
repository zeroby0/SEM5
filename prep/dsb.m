sf = 1000;

T = 0:1/sf:2;

fm = 100;
fc = 10000;

m1 = sin(2*pi*100*T);
m2 = cos(2*pi*100*T);

u = m1.*cos(2*pi*fc*T);

plot(T, m1);
print -dpng m1.png

plot(T, m2);
print -dpng m2.png

plot(T, u);
print -dpng u.png


N = length(m1)

F = -(N-1)/2:1:(N-1)/2;
F = F.*(sf/N);

size(F)
size(m1)

plot(F, abs(fft(m1)))

print -dpng uuw.png





