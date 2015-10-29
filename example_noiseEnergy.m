%-- 9/16/2015 11:43 AM --%
im = imread('cameraman.tif');
imshow(im)
S=  im;
N = randn(size(S));
clera im
clear im
imagesc (N)
colormap gray
imshow(S+N)
S = double(S)
imagesc(S+N)
energy = @(X) sum(X(:).^2)
energy(S)
energy(N)
I = S+N;
energy(I)
format long
energy(I)
energy(S)+energy(N)
energy(N)
energy(S)
N = randn(size(S))*10;
I = S+N;
imagesc(I)
energy(N)
energy(S)
energy(I)
energy(S)+energy(N)
sum(2*S(:)*N(:))
sum(2*S(:).*N(:))
imagesc(N), colorbar
sum(2*S(:).*randn(numel(S),1))
for i = 1:1000, a(i) = sum(2*S(:).*randn(numel(S),1)*10); end
mean(a)
sum(2*S(:).*randn(numel(S),1))
sum(2*S(:).*randn(numel(S),1)*10)
