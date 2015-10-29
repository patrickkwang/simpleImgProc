%-- 9/9/2015 11:56 AM --%
edit makehdr
im = imread('brickWall.jpg');
imshow(im)
imagesc(im(:,:,2))
colormap gray
imagesc(im(:,:,1))
colormap gray
grayIm = rgb2gray(im);
imshow(grayIm)
edit rgb2gray
smallIm = grayIm(1:8:end,1:8:end);
imshow(smallIm)
antiAliasIm = imfilter(grayIm,ones(11)/121);
imshow(antiAliasIm)
smallIm = antiAliasIm(1:8:end,1:8:end);
imshow(smallIm)
[Xq,Yq] = meshgrid(1:0.5:643,1:0.5:510);
imagesx(Xq)
imagesc(Xq)
imagesc(Yq)
bigIm = interp2(im,Xq,Yq);
bigIm = interp2(grayIm,Xq,Yq);
bigIm = interp2(double(grayIm),Xq,Yq);
imshow(bigIm)
imshow(uint8(bigIm))

