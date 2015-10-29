function J = bilateralFilterFast(I,sigma,lambda)
% bilateral filtering
%
% input image I, spacial standard deviation sigma, intensity standard
% deviation lambda
% output filtered image J
%
% Patrick Wang, 2015-10-06

I = padarray(I,[5,5]); %,'replicate');
J = bilateralFilter(I,[11,11],sigma,lambda);