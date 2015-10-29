function h = antiAliasFilter1d(inVecLen,outVecLen)
assert(outVecLen<=inVecLen,'Downsampling only!')
assert(isscalar(inVecLen)&&isscalar(outVecLen),'Inputs should be scalar!')

% Nyquist frequency
Nf = outVecLen./inVecLen/2;

% frequency-domain standard deviation
lambda = Nf./sqrt(3/5*log(10));

% time-domain standard deviation
sigma = 1./(2*pi*lambda);

% time-domain filter
h = fspecial('gaussian',[inVecLen,1],sigma(1));