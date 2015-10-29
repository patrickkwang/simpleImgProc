imLow = imread('office_2.jpg');
imshow(imLow)
energyLow = sum(imLow(:).^2)
imHigh = imread('office_5.jpg');
imshow(imHigh)
energyHigh = sum(imHigh(:).^2)
energyLow
imagesc(imHigh)
imHigh(400,1,2)
imLow(400,1,2)
imGained = imLow*136/25;
imshow(imGained)
imGained = double(imLow)*136/25;
images(imGained(:,:,2))
imagesc(imGained(:,:,2))
colormap gray
imGained(400,1,2)
imGained = uint8(double(imLow)*136/25);
imGained(400,1,2)
imagesc(imGained(:,:,2)), colormap gray
figure, imshow(imHigh)
clear
im = imread('cameraman.tif');
imshow(im)
corrupted = im + randn(size(im))*10;
corrupted = double(im) + randn(size(im))*10;
imagesc(corrupted)
sum(double(im).^2)/(numel(im)*100)
sum(double(im(:)).^2)/(numel(im)*100)
sqrt(mean((corrupted(:)-im(:)).^2))
sqrt(mean((corrupted(:)-double(im(:))).^2))
