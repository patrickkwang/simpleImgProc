function h = antiAliasFilter2d(inImSize,outImSize)

h1 = antiAliasFilter1d(inImSize(1),outImSize(1));
h2 = antiAliasFilter1d(inImSize(2),outImSize(2));
h = bsxfun(@times,h1,h2');