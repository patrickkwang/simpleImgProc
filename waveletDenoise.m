function J = pkw3_waveletDenoise(I,fractionToKeep)
wt = dwt2(I);
wt(abs(wt)<quantile(abs(wt(:)),1-fractionToKeep)) = 0;
J = idwt2(wt);