
testSlidingFilter
imshow(uint8(I))
imshow(uint8(J))
clear
g = @(t) sin(freq*2*pi*t)
freq = 3;
g = @(t) sin(freq*2*pi*t)
t = linspace(0,2,1000);
plot(t,g(t))
plot(fftshift(abs(G)))
close all
plot(abs(fft(g)))
clear
edit fft2
clear
x = 1:100;
y = 1:100;
[X,Y] = meshgrid(x,y);
X(2,2)
Y(2,2)
g = cos(X*2*pi/100/2);
imagesc(x,y,g)
g = cos(X*2*pi/100*2);
imagesc(x,y,g)
G = fftshift(fft2(g));
imagesc(abs(G))
G2 = imrotate(G,45,'nearest','crop');
imagesc(abs(G2))
g2 = ifft2(ifftshift(G2));
imagesc(g2)
imagesc(abs(g2))
imagesc(real(g2))
imagesc(abs(g2))
1/.15
G = fftshift(fft(g,N));
imagesc(abs(g))
figure, imagesc(abs(G))
figure, plot(abs(f)<0.075)
f = ((0:N-1)-(N-1)/2)*Fs/N;
figure, plot(abs(f)<0.075)
figure, plot(f,abs(f)<0.075)
G2 = (abs(f)<0.075).*G;
figure, plot(f,abs(G2))
figure, plot(abs(ifft2(ifftshift(abs(G2)))))
figure, plot(real(ifft2(ifftshift(abs(G2)))))
figure, plot(real(ifft(ifftshift(abs(G2)))))
figure, plot(h)

