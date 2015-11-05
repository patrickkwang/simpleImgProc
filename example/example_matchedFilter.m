% example image matched filter
im = double(imread('cameraman.tif'));

template = im(40:80,90:140);
template = template-mean(template(:));

xcorr = imfilter(im,template);

imagesc(xcorr)