%-- 10/14/2015 11:38 AM --%
load ece488_deblurringThings
clc
G = F.*H;
g = ifft2(G);
imshow(uint8(g))
clc
g2 = imfilter(f,h,'circular');
imshow(g2)
imshow(uint8(g2))
imagesc(h)
imshow(uint8(g2))
imagesc(G)
imagesc(abs(G))
imagesc(log(abs(G)))
imagesc(log(abs(H)))
Fhat = G./H;
imagesc(log(abs(F)))
imagesc(log(abs(Fhat)))
imagesc(fftshift(log(abs(Fhat))))
n = randn(size(f))*0.1;
imshow(uint8(f+n))
N = fft2(n);
G = F.*H+N;
g = ifft2(G);
imshow(uint8(g))
Fhat = G./H;
fhat = ifft2(Fhat);
imshow(uint8(fhat))
imagesc(log(abs(H)))
imagesc(abs(H))
imagesc(ifftshift(abs(H)))
colorbar
imagesc(ifftshift(log(abs(H)))), colorbar
imagesc(ifftshift(log(abs(N./H)))), colorbar
nh = ifft2(N./H);
imagesc(nh), colorbar
clear nh g2 Fhat fhat
n = randn(size(f))*10000;
imagesc(n+f)
colormap gray
n = randn(size(f))*0.1;
W = conj(H)./(conj(H).*H+N.^2/S.^2);
W = conj(H)./(conj(H).*H+N.^2./F.^2);
Fhat = G.*W;
imagesc(ifftshift(log(abs(G)))), colorbar
imagesc(ifftshift(log(abs(G)))), colorbar, ,colormap gray
imagesc(ifftshift(log(abs(G./H)))), colorbar, ,colormap gray
imagesc(ifftshift(log(abs(G.*W)))), colorbar, ,colormap gray
fhat = ifft2(G.*W);
imshow(uint8(fhat))
figure, imshow(uint8(g))
W = conj(H)./(conj(H).*H+sum(sum(N.^2./F.^2)));
fhat = ifft2(G.*W);
imshow(uint8(fhat))
W = conj(H)./(conj(H).*H+sum(N(:).^2)./sum(F(:).^2))));
W = conj(H)./(conj(H).*H+sum(N(:).^2)./sum(F(:).^2)));
W = conj(H)./(conj(H).*H+sum(N(:).^2)./sum(F(:).^2));
fhat = ifft2(G.*W);
imshow(uint8(fhat))
