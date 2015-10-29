%-- 10/7/2015 11:50 AM --%
256*256
clear
I = zeros(256,256);
I(100,134)  =1;
I(100,234)  =2;
I(10,234)  =1;
imagesc(I)
hist(I(:))
whos
J = sparse(I);
whos
J
I = rand(256,256);
J = sparse(I);
whos
I = ones(256,256)*128;
imagesc(I), colorbar
J = sparse(I);
whos
I = double(imread('cameraman.tif'));
hist(I(:))
N = randn(size(I));
hist(N(:))
S = double(imread('cameraman.tif'));
S_hat = fft2(S);
N_hat = fft2(N);
hist(N_hat(:))
hist(abs(N_hat(:)))
imagesc(abs(N_hat))
hist(abs(N_hat(:)))
hist(abs(S_hat(:)))
imagesc(abs(S_hat))
imagesc(fftshift(log(abs(S_hat)))0
imagesc(fftshift(log(abs(S_hat))))
imagesc(fftshift(log(abs(N_hat))))
hist(abs(N_hat(:)))
S = 50+50*cos(2*pi/8*repmat(1:32,32,1));
imagesc(S)
N = randn(size(S));
S_hat = fft2(S);
imagesc(fftshift(log(abs(S_hat))))
I = S+N;
I_hat = fft2(I);
imagesc(fftshift(log(abs(I_hat))))
ft = I_hat;
ft(abs(ft)<quantile(ft(:),0.9)) = 0;
imagesc(fftshift(log(abs(ft))))
ft(abs(ft)<quantile(abs(ft(:)),0.9)) = 0
ft(abs(ft)<quantile(abs(ft(:)),0.9)) = 0;
imagesc(fftshift(log(abs(ft))))
imagesc(abs(ifft2(ifftshift(I_hat))))
N = randn(size(S))*20;
I = S+N;
I_hat = fft2(I);
imagesc(abs(ifft2(ifftshift(I_hat))))
ft = I_hat;
ft(abs(ft)<quantile(abs(ft(:)),0.9)) = 0;
imagesc(fftshift(log(abs(ft))))
imagesc(abs(ifft2(ifftshift(ft))))
figure,imagesc(abs(ifft2(ifftshift(I_hat))))
J = abs(ifft2(ifftshift(ft)));
sqrt(sum((J-I).^2))
sqrt(sum((J(:)-I(:)).^2))
sqrt(sum((J(:)-S(:)).^2))
sqrt(sum((I(:)-S(:)).^2))
ft = I_hat;
q = sort(ft(:),-1);
help sort
q = sort(ft(:));
q(3)
[q,order] = sort(abs(ft(:)));
q(3)
q(end-2)
q(end-3)
plot(q)
q(end-1)
q(end)
q(end-5)
ft(abs(ft)<1e4) = 0;
imagesc(abs(ifft2(ifftshift(ft))))
imagesc(fftshift(log(abs(ft))))
imagesc(fftshift(log(abs(I_hat)))), colorbar
ft = I_hat;
imagesc(fftshift(abs(ft))), colorbar
ft(abs(ft)<1e4) = 0;
imagesc(fftshift(abs(ft))), colorbar
[q,order] = sort(abs(ft(:)));
plot(q)
imagesc(abs(ifft2(ifftshift(ft))))
clear
S = double(imread('cameraman.tif'));
N = randn(size(S))*20;
I = S+N;
imshow(uint8(I))
wt = dwt2(I);
imagesc(log(abs(wt)))
wt = dwt2(S);
imagesc(log(abs(wt)))
colorbar
wt = dwt2(I);
imagesc(log(abs(wt)))
wt(abs(wt)<quantile(abs(wt(:)),0.9)) = 0;
imagesc(log(abs(wt)))
J = idwt2(wt);
imagesc(J)
colormap gray
figure,imagesc(I)
colormap gray
wt(abs(wt)<quantile(abs(wt(:)),0.95)) = 0;
J = idwt2(wt);
imagesc(J)
clear
load ece488_deblurringThings
l
clc
imshow
imshow(uint8(f))

