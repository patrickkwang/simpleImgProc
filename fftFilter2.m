function out = pkw3_fftFilt2(I,H)
[N,M] = size(I);
[n,m] = size(H);
I = padarray(I,floor([n,m]/2),'both');
H = padarray(H,size(I)-[n,m],'post');
H = circshift(H,-floor([n,m]/2));
out = ifft2(fft2(I).*fft2(H));
out = out(floor(n/2)+(1:N),floor(m/2)+(1:M));