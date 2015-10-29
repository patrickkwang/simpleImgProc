%-- 9/14/2015 11:47 AM --%
im = imread('brickWall.jpg');
imshow(im)
grayIm = rgb2gray(im);
imshow(grayIm)
hist(grayIm(:),0:255)
pdf = hist(grayIm(:),0:255)/numel(grayIm);
plot(pdf)
cdf = cumsum(pdf);
plot(cdf)
cdf(0+1)
tFcn = @(x) uint8(cdf(x+1)*255);
ezplot(tFcn)
ezplot(tFcn,[0,255])
plot(0:255,cdf(0:255))
plot(0:255,tFcn(0:255))
eqIm = tFcn(grayIm);
imshow(eqIm)
hist(eqIm,0:255)
hist(eqIm(:),0:255)
hist(eqIm(:),0:10:255)
ezplot(@(x)normpdf(x,128,30),[0,255])
ezplot(@(x)normcdf(x,128,30),[0,255])
ezplot(@(x)norminv(x,128,30),[0,255])
ezplot(@(x)norminv(x,128,30)*255,[0,255])
ezplot(@(x)norminv(x,128,30),[0,1])
tFcn2 = @(y) uint8(norminv(double(y)/255),128,30)
tFcn2 = @(y) uint8(norminv(double(y)/255,128,30))
gaussIm = tFcn2(eqIm);
imshow(gaussIm)
figure, hist(gaussIm(:),0:10:255)
tFcn3 = @(x)tFcn2(tFcn(x));
plot(0:255,tFcn3(0:255))
gaussIm = tFcn3(grayIm);
imshow(gaussIm)

