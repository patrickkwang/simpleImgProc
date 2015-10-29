function im = bayerDemosaic(mosaic)
[Xq,Yq] = meshgrid(1:size(mosaic,2),1:size(mosaic,1));
red = ~mod(Xq,2) & mod(Yq,2); % red pixels
green = ~mod(Xq+Yq,2); % green pixels
blue = mod(Xq,2) & ~mod(Yq,2); % blue pixels

channels = {red,green,blue};
Vq = cell(1,3);

for i = 1:3
	V = mosaic(channels{i}); % pull out R/G/B pixel values
	[Y,X] = find(channels{i}); % get indices of pixels
	F = scatteredInterpolant(X,Y,double(V)); % make interpolation objecty
	Vq{i} = F(Xq,Yq); % interpolate
end

im = uint8(cat(3,Vq{:}));