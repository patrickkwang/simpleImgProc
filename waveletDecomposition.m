function wt = waveletDecomposition(im)
% wt = waveletDecomposition(im)
% computes the Discrete Wavelet Transform using Haar wavelets
%
% INPUT:
% im - grayscale image
%
% OUTPUT:
% wt - wavelet transform image
%
% Patrick Wang, 2013-04-10

% parse inputs
if size(im,1)~=size(im,2) || ~any(size(im,1)==2.^(0:100))
	error('Input image must be square, with side length a power of two.')
end

ds = @(x) x(1:2:end,1:2:end);

h00 = [1,1;1,1]/2;
h10 = [-1,-1;1,1]/2;
h01 = [-1,1;-1,1]/2;
h11 = [1,-1;-1,1]/2;

g00 = im;
wt = zeros(size(im));
for i = 1:log2(size(im,1))
	g11 = ds(imfilter(g00,rot90(h11,2),'circular'));
	g10 = ds(imfilter(g00,rot90(h10,2),'circular'));
	g01 = ds(imfilter(g00,rot90(h01,2),'circular'));
	g00 = ds(imfilter(g00,rot90(h00,2),'circular'));
	wt(1:size(im,1)/(2^(i-1)),1:size(im,1)/(2^(i-1))) = [g00,g01;g10,g11];
end
end