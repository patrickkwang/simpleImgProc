x = 1:100;
f = x;
plot(x,f)
help diff
plot(x(2:end),diff(f))
plot(x(2:end),diff(f,2))
plot(x(2:end-1),diff(f,2))
im = double(imread('cameraman.tif'));
h = [-1,0,1];
gx = imfilter(im,h,'replicate');
imagesc(gx)
colormap gray
colorbar
h = [-1,0,1]'
gy = imfilter(im,h,'replicate');
imagesc(gy)
imagesc(gy+gx)
imagesc(abs(gy))
colorbar
imagesc(abs(gy)+abs(gx))
help quiver
quiver(gx,gy)
axis image tight
axis xy
mag = sqrt(gx.^2+gy.^2);
imagesc(mag), colorbar
colormap gray
ang = atan2(gy,gx);
imagesc(ang), colorbar
imagesc(ang), colormap hsv
imagesc(mag*ang), colormap hsv
imagesc(mag.*ang), colormap hsv
colorbar
clear x f
imagesc(mag)
L = [0,1,0;1,-4,1;0,1,0]
d2 = imfilter(im,L);
imagesc(d2)
colormap gray
imagesc(d2+im)
imagesc(0.5*d2+im)
imagesc(-0.5*d2+im)
imagesc(-1*d2+im)
imagesc(d2), colorbar
imagesc(im), figure, imagesc(-1*d2+im)
colormap gray
imagesc(-1*d2+im,[0,255])
smoothed = imfilter(im,fspecial('gaussian',2,[15,15]));
smoothed = imfilter(im,fspecial('gaussian',[15,15],3));
imagesc(smoothed)
sharp = im-smoothed;
imagesc(sharp)
imagesc(sharp+im)
imagesc(sharp+im,[0,255])
imagesc(mag), colormap gray
edgeIm = edge(im,'Canny');
imagesc(edgeIm)
imagesc(mag), colormap gray
imagesc(mag>median(mag(:))), colormap gray
clear d2 edgeIm L sharp smoothed
imagesc(ang)
edit edge
imagesc(mag), colormap gray
edgeIm = edge(im,'Canny');
imagesc(edgeIm)
mag2 = mag;
mag(~edgeIm) = 0;
imagesc(mag,[0,255])
colormap hsv
colorbar
min(ang), max(ang)
min(ang), max(ang(:))
min(ang(:))
h = (ang+pi)/(2*pi)*255;
max(h(:))
min(h(:))
min(mag(:))
max(mag(:))
s = mag;
v = ones(size(mag))*255);
v = ones(size(mag))*255;
rgb = hsv2rgb(cat(3,h,s,v));
imagesc(rgb)
max(rgb(:))
imagesc(uint8(rgb))
rgb = hsv2rgb(uint8(cat(3,h,s,v)));
rgb = hsv2rgb(cat(3,h/255,s/255,v/255));
imagesc(rgb)
v = mag;
s = ones(size(mag))*255;
rgb = hsv2rgb(cat(3,h/255,s/255,v/255));
imagesc(rgb)
mag = sqrt(gx.^2+gy.^2);
v = mag;
rgb = hsv2rgb(cat(3,h/255,s/255,v/255));
imagesc(rgb)
