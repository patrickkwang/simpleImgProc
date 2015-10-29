
im = imread('cameraman.tif')
hist(im)
hist(im(:))
hist(double(im(:)))
counts = histcounts(double(im(:)));
bar(counts)
plot(cumsum(counts))
figure, bar(counts)
im2 = histeq(im);
figure, subplot(1,2,1), imshow(im), subplot(1,2,2), imshow(im2)
imhist(im2)
figure, subplot(1,2,1), imshow(im), subplot(1,2,2), imshow(im2)
