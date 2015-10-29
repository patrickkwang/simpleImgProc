function J = nlmFilterSlow(I,windowSize,sigma)
assert(all(mod(windowSize,2)==1),'window should have odd size')
[N,M] = size(I);
n = windowSize(1); m = windowSize(2);
zIz = padarray(I,(windowSize-1)/2);
J = zeros(N,M);
weights = zeros(N,M);
for u1 = 1:N
	for v1 = 1:M
		for u2 = 1:N
			for v2 = 1:M
				win1 = zIz(u1-1+(1:n),v1-1+(1:m));
				win2 = zIz(u2-1+(1:n),v2-1+(1:m));
				dists2 = sum((win1(:)-win2(:)).^2);
				weights(u2,v2) = exp(-0.5*dists2/sigma);
			end
		end
		J(u1,v1) = sum(sum(weights.*I))/sum(sum(weights));
	end
end