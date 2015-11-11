clear

% change whatToScale as follows:
%   only one scale: 'none'
%   multiple scales, rescaling the detection window: 'detector'
%   multiple scales, rescaling the image: 'image'
whatToScale = 'image'; %'none'; %'detector'; %

I = imresize(double(imread('cameraman.tif')),2);

% image size
[N,M] = size(I);

% window size
n = 8;
m = 8;

% stride
d = 2;

% compute scales
if ~strcmp(whatToScale,'none')
	nScales = floor(log2(min(N/n,M/m))+1);
else
	nScales = 1;
end
scales = 2.^(0:nScales-1);

% compute scaled images
for iScale = 1:nScales
	if strcmp(whatToScale,'image')
		Is{iScale} = imresize(I,1/scales(iScale)); % resize image
	else
		Is{iScale} = I; % resize image
	end
end

% compute scaled window sizes and strides
for iScale = 1:nScales
	if strcmp(whatToScale,'detector')
		ds(iScale) = d*scales(iScale);
		ns(iScale) = n*scales(iScale);
		ms(iScale) = m*scales(iScale);
	else
		ds(iScale) = d;
		ns(iScale) = n;
		ms(iScale) = m;
	end
end

tic % start timer
for iScale = 1:nScales
	td = ds(iScale); % stride at this scale
	tn = ns(iScale); % window height at this scale
	tm = ms(iScale); % window width at this scale
	[tN,tM] = size(Is{iScale}); % get size
	tI = padarray(padarray(Is{iScale},... % pad
		ceil([(tn-1)/2,(tm-1)/2]),'replicate','pre'),...
		floor([(tn-1)/2,(tm-1)/2]),'replicate','post');
	us = 1:td:tM; % detection window topleft x-coord
	vs = 1:td:tN; % detection window topleft y-coord
	out = zeros(length(vs),length(us)); % initialize output
	for u = 1:length(us) % for each image column
		for v = 1:length(vs) % for each image row
			for i = 1:tm % for each window column
				for j = 1:tn % for each image row
					out(u,v) = out(u,v)+tI(us(u)+i-1,vs(v)+j-1)/(tn*tm); % add weighted pixel to output
				end
			end
		end
	end
end
toc % stop timer

% if, for whatToScale=='none', we see about 0.171 seconds
% for whatToScale=='image', we expect to see about 0.228 seconds:
%   = 0.171*sum(1./(2.^(2*(0:nScales-1))))
% for whatToScale=='detector', we expect to see about 1.19 seconds:
%   = 0.171*nScales