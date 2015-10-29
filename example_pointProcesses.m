% plot point process functions

%% setup
in = 0:255;

%% identity
out = in;

plot(in,out,'LineWidth',2)
axis equal
xlim([0,255])
ylim([0,255])
xlabel('intensity in')
ylabel('intensity out')

%% thresholding
out = in.*(in<150);

plot(in,out,'LineWidth',2)
axis equal
xlim([0,255])
ylim([0,255])
xlabel('intensity in')
ylabel('intensity out')

%% exponential
scale = 4;
out = 255/(exp(scale)-1)*(exp(in/255*scale)-1);

plot(in,out,'LineWidth',2)
axis equal
xlim([0,255])
ylim([0,255])
xlabel('intensity in')
ylabel('intensity out')