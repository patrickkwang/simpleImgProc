function J = pkw3_fourierDenoise(I,fractionToKeep)
ft = fft2(I);
ft(abs(ft)<quantile(abs(ft(:)),1-fractionToKeep)) = 0;
J = ifft2(ft);