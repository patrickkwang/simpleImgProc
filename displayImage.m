function displayImage(im)
im = double(im); % convert from whatever to double
im = im/max(im(:))*255; % rescale to 0-255
im = uint8(im); % convert from double to uint8
imshow(im)