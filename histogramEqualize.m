function [im2,tFcn] = pkw3_histogramEqualize(im)
pdf = histcounts(im(:),-0.5:1:255.5);
t = uint8(cumsum(pdf)/sum(pdf)*255);
tFcn = @(x)t(x+1);
im2 = tFcn(im);