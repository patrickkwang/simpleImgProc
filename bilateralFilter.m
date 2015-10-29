function J = bilateralFilter(I,sigma,lambda)
% bilateral filtering
%
% input image I, spacial standard deviation sigma, intensity standard
% deviation lambda
% output filtered image J
%
% Patrick Wang, 2015-09-30

hSpace = fspecial('gaussian',[11,11],sigma);
J = nlfilter(I,[11,11],@(I)windowBilatFilt(I,hSpace,lambda));

function j = windowBilatFilt(I,hSpace,lambda)
% operation applied to each window I, outputs the resulting center pixel value j
% assumes window size is odd

hLambda = exp(-(I-I((size(I,1)+1)/2,(size(I,2)+1)/2)).^2/(2*lambda.^2));
hBilateral = hSpace.*hLambda; hBilateral = hBilateral/sum(hBilateral(:));
j = I(:)'*hBilateral(:);