% edge conditions (extrapolation) example
I = double(imread('cameraman.tif'));

[Y,X] = ndgrid(1:size(I,1),1:size(I,2));

[Yq,Xq] = ndgrid(-20:size(I,1)+21,-20:size(I,2)+21);

interpolator = griddedInterpolant(Y,X,I,'linear','nearest');

imagesc(interpolator(Yq,Xq),[0,255])
axis equal tight
colormap gray