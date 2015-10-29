% 1d color aliasing example
%
% GRGRGR...

t = (1:10)';
% signal = 100+cat(2,t>5,t>5,t*0)*100;
sigmoid = 1./(1+exp(-2*(t-5.5)));
signal = 100+cat(2,sigmoid,sigmoid,t*0)*100;

samplesR = 2:2:10;
samplesG = 1:2:10;

samplesR_plotX = cat(1,samplesR,samplesR,nan(size(samplesR)));
samplesR_plotY = cat(1,zeros(size(samplesR)),signal(samplesR),nan(size(samplesR)));
samplesG_plotX = cat(1,samplesG,samplesG,nan(size(samplesG)));
samplesG_plotY = cat(1,zeros(size(samplesG)),signal(samplesG),nan(size(samplesG)));

figure(1)
subplot(3,1,1)
imshow(uint8(signal(:,1)'))
colormap gray

barWidth = 0.3;

subplot(3,1,2)
b = bar(t-barWidth/2,signal(:,1),barWidth,'g','LineStyle','none');
hold on
bar(t+barWidth/2,signal(:,2),barWidth,'r','LineStyle','none')
% plot(samplesR_plotX(:),samplesR_plotY(:),'r')
% plot(samplesG_plotX(:),samplesG_plotY(:),'g')
hold off
xlim([0.5,10.5])

subplot(3,1,3)
bar(t-barWidth/2,signal(:,1),barWidth,'g','LineStyle','none')
hold on
bar(t+barWidth/2,signal(:,2),barWidth,'r','LineStyle','none')
bar(t(samplesG)-barWidth/2,signal(samplesG,1),barWidth/2,'g','LineWidth',2)
bar(t(samplesR)+barWidth/2,signal(samplesR,2),barWidth/2,'r','LineWidth',2)
hold off
xlim([0.5,10.5])

sampInterpR = interp1(t(samplesR)+barWidth/2,signal(samplesR,2),t+barWidth/2,...
	'linear','extrap');
sampInterpG = interp1(t(samplesG)-barWidth/2,signal(samplesG,2),t-barWidth/2,...
	'linear','extrap');

figure(2)
subplot(2,1,1)
bar(t(samplesR)+barWidth/2,signal(samplesR,2),barWidth/2,'r','LineStyle','none')
xlim([0.5,10.5])

subplot(2,1,2)
bar(t+barWidth/2,sampInterpR,barWidth,'r','LineStyle','none')
xlim([0.5,10.5])

figure(3)
subplot(2,1,1)
bar(t(samplesG)-barWidth/2,signal(samplesG,2),barWidth/2,'g','LineStyle','none')
xlim([0.5,10.5])

subplot(2,1,2)
bar(t-barWidth/2,sampInterpG,barWidth,'g','LineStyle','none')
xlim([0.5,10.5])

figure(4)
subplot(2,1,1)
bar(t+barWidth/2,sampInterpR,barWidth,'r','LineStyle','none')
hold on
bar(t-barWidth/2,sampInterpG,barWidth,'g','LineStyle','none')
hold off
xlim([0.5,10.5])

subplot(2,1,2)
imshow(uint8(cat(3,sampInterpR',sampInterpG',signal(:,1)')))