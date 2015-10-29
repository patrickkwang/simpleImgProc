function J = nonlocalMeansFast(I,windowSize,sigma)
assert(all(mod(windowSize,2)==1),'window should have odd size')
[N,M] = size(I);
zIz = padarray(I,(windowSize-1)/2,'replicate');
dists2 = sumSqDiffBtwWin(zIz,windowSize);
dists2 = dists2+dists2';
weights = exp(-0.5*dists2/sigma);
weights = bsxfun(@rdivide,weights,sum(weights,1));
J = reshape(I(:)'*weights,[N,M]);