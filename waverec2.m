function im = idwt2(wt)
% im = idwt2(wt)
% computes the inverse Discrete Wavelet Transform using Haar wavelets
%
% INPUT:
% wt - wavelet transform image
%
% OUTPUT:
% im - grayscale image
%
% Patrick Wang, 2013-04-10

h00i = [1,1;1,1]/2;
h10i = [1,1;-1,-1]/2;
h01i = [1,-1;1,-1]/2;
h11i = [1,-1;-1,1]/2;

im = wt(1);
for i = 0:log2(size(wt,1))-1
	one = 1:2^i;
	two = 2^i+one;
	g11i = imfilter(us(wt(two,two)),rot90(h11i,2),'circular');
	g10i = imfilter(us(wt(two,one)),rot90(h10i,2),'circular');
	g01i = imfilter(us(wt(one,two)),rot90(h01i,2),'circular');
	g00i = imfilter(us(im),rot90(h00i,2),'circular');
	im = g11i+g10i+g01i+g00i;
end

	function y = us(x)
		y = zeros(size(x)*2);
		y(2:2:end,2:2:end) = x;
	end
end