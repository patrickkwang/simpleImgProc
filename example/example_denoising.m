%-- 9/28/2015 11:45 AM --%
S = double(imread('cameraman.tif'));
N = randn(size(S))*10;
imagesc(N), colorbar
I = S+N;
imshow(uint8(I))
imagesc(fftshift(fft2(I)))
imagesc(abs(fftshift(fft2(I))))
imagesc(log(abs(fftshift(fft2(I)))))
imagesc(log(abs(fftshift(fft2(S)))))
imagesc(log(abs(fftshift(fft2(N)))))
sqrt(mean((I(:)-S(:)).^2))
J = imfilter(I,fspecial('gaussian',[11,11],0.5));
sqrt(mean((J(:)-S(:)).^2))
subplot(2,2,1), imshow(I)
subplot(2,2,1), imshow(uint8(I))
subplot(2,2,2), imshow(uint8(J))
subplot(2,2,4), imshow(uint8(S))
J = imfilter(I,fspecial('gaussian',[11,11],2.5));
subplot(2,2,1), imshow(uint8(I))
subplot(2,2,2), imshow(uint8(J))
subplot(2,2,4), imshow(uint8(S))
imagesc(log(abs(fftshift(fft2(S)))))
imagesc(log(abs(fftshift(fft2(I)))))
sqrt(mean((J(:)-S(:)).^2))
N = round(0.51*(rand(size(S))*2-1))*255;
imagesc(N), colormap gray, colorbar
J = double(uint8(S+N));
imshow(J)
imshow(uint8(J)0
imshow(uint8(J))
N = round(0.75*(rand(size(S))*2-1))*255;
J = double(uint8(S+N));
imshow(uint8(J))
I = double(uint8(S+N));
J = imfilter(I,fspecial('gaussian',[11,11],2.5));
sqrt(mean((J(:)-S(:)).^2))
sqrt(mean((I(:)-S(:)).^2))
J = imfilter(I,fspecial('gaussian',[11,11],1.5));
sqrt(mean((J(:)-S(:)).^2))
J = imfilter(I,fspecial('gaussian',[11,11],3.5));
sqrt(mean((J(:)-S(:)).^2))
J = imfilter(I,fspecial('gaussian',[11,11],0.5));
sqrt(mean((J(:)-S(:)).^2))
J = imfilter(I,fspecial('gaussian',[11,11],5.5));
sqrt(mean((J(:)-S(:)).^2))
J = imfilter(I,fspecial('gaussian',[11,11],2.5));
sqrt(mean((J(:)-S(:)).^2))
q = I(204:206,204:206)
median(q(:))
imagesc(fspecial('gaussian
imagesc(fspecial('gaussian',[11,11],2.5)), colorbar
imagesc(fspecial('gaussian',[15,15],2.5)), colorbar
imshow(medfilt2(I,[3,3]))
imshow(uint8(medfilt2(I,[3,3])))
imshow(uint8(medfilt2(I,[5,5])))
imshow(uint8(medfilt2(I,[7,7])))
imshow(uint8(medfilt2(I,[17,17])))
J=medfilt2(I,[5,5]);
imshow(uint8(J))
sqrt(mean((J(:)-S(:)).^2))
clear
S = double(imread('cameraman.tif'));
N = randn(size(S))*10;
I = S+N;
sum(S(:).^2)/sum(N(:).^2)
numel(S)
h = fspecial('gaussian',[11,11],0.5);
S2 = imfilter(S,h);
N2 = imfilter(N,h);
imshow(uint8(S2))
imshow(uint8(N2))
imagesc((N2))
colorbar
imagesc(log(abs(fftshift(fft2(N2)))))
colormap gray
imagesc(log(abs(fftshift(fft2(S2)))))
imagesc(abs(fftshift(fft2(N2))))
sum(S2(:).^2)/sum(N2(:).^2)
sum(S(:).^2)/sum(N(:).^2)

