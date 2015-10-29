%% build original signal
t = 1:10; % column index

originalSignal = cos(t*(2*pi)/2);

figure(1)
plot(t, originalSignal)
title('original signal')
ylim([-2,2])

%% downsample (no LPF)
downsampledT = t(1:2:end);
downsampledSignal = originalSignal(1:2:end);

figure(2)
plot(downsampledT,downsampledSignal)
title('downsampled signal')
ylim([-2,2])

%% low-pass filter (before downsampling)
lpf = fspecial('gaussian',[1,5],1);
lpfSignal = imfilter(originalSignal,lpf,'circular');

figure(3)
plot(t,lpfSignal)
ylim([-2,2])
title('low-pass filtered signal')

%% downsample (after low-pass filtering)
lpfDownsampledSignal = lpfSignal(1:2:end);

figure(4)
plot(downsampledT,lpfDownsampledSignal)
title('downsampled signal with anti-aliasing')
ylim([-2,2])