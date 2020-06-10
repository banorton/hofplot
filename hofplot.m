function [plotHandles, legendHandle] = hofplot(data, plotInfo, legendInfo)
%HOW TO USE: hofplot(data, plotInfo, legendInfo)
%
%
%INPUTS
%The 'data' matrix contains the x data in
%the first column and y data in the other columns.
%Example:
% data = [x,y1,y2,y3];
%
%
%The 'plotInfo' matrix contains info about the
%plot. If you enter nothing the default settings
%will be used.
%Example:
% plotInfo = {'type: default','title: titlename'};
%
%
%The 'legendInfo' matrix contains the names for the
%datasets. If you enter nothing the default settings
%will be used.
%Example:
% legendInfo = {'Data1', 'Data2', 'Data3'};
%
%
%OUTPUTS
%This function outputs the handles for the plots and
%the legend.
% clf;
% close all;

%%
%TO DO: add ability for subplots
%TO DO: add min and max options
%TO DO: color matrix and color option
%TO DO: line or circle data point option
%TO DO: possibly add plotInfo array as input
%TO DO: add getters and setters for different plot options
%TO DO: line size option
%TO DO: use cell aray for data
%TO DO: fix hold on/hold off feature
%TO DO: make legend stuff accesible in plotInfo

%DEFAULT VALUES
plotType = 'default';
plotTitle = '';
plotXLabel = '';
plotYLabel = '';
plotXLow = 82;
plotXHigh = 125;
plotYLow = 0;
plotYHigh = 100;
xTickLow = 80;
xTickHigh = 130;
xTickInc = 10;
yTickLow = 0;
yTickHigh = 100;
yTickInc = 10;
xMinorTickLow = 85;
xMinorTickHigh = 130;
xMinorTickInc = 10;
yMinorTickLow = 5;
yMinorTickHigh = 100;
yMinorTickInc = 10;

for i = 1:length(plotInfo)
  tempString = plotInfo(i);
  
  %TYPE
  if contains(tempString, 'type ')
    plotType = extractAfter(tempString,5);
  end
  
  %TITLE
  if contains(tempString, 'title ')
    plotTitle = extractAfter(tempString,6);
  end
  
  %XLABEL
  if contains(tempString, 'xlabel ')
    plotXLabel = extractAfter(tempString,7);
  end
  
  %YLABEL
  if contains(tempString, 'ylabel ')
    plotYLabel = extractAfter(tempString,7);
  end
  
  %XLOW
  if contains(tempString, 'xlow ')
    plotXLow = str2double(extractAfter(tempString,5));
  end
  
  %XHIGH
  if contains(tempString, 'xhigh ')
    plotXHigh = str2double(extractAfter(tempString,6));
  end
  
  %YLOW
  if contains(tempString, 'ylow ')
    plotYLow = str2double(extractAfter(tempString,5));
  end
  
  %YHIGH
  if contains(tempString, 'yhigh ')
    plotYHigh = str2double(extractAfter(tempString,6));
  end
  
  %XTICKLOW
  if contains(tempString, 'xticklow ')
    xTickLow = str2double(extractAfter(tempString,9));
  end
  
  %XTICKHIGH
  if contains(tempString, 'xtickhigh ')
    xTickHigh = str2double(extractAfter(tempString,10));
  end
  
  %XTICKINC
  if contains(tempString, 'xtickinc ')
    xTickInc = str2double(extractAfter(tempString,9));
  end
  
  %YTICKLOW
  if contains(tempString, 'yticklow ')
    yTickLow = str2double(extractAfter(tempString,9));
  end
  
  %YTICKHIGH
  if contains(tempString, 'ytickhigh ')
    yTickHigh = str2double(extractAfter(tempString,10));
  end
  
  %YTICKINC
  if contains(tempString, 'ytickinc ')
    yTickInc = str2double(extractAfter(tempString,9));
  end
  
  %XMINORTICKLOW
  if contains(tempString, 'xminorticklow ')
    xMinorTickLow = str2double(extractAfter(tempString,14));
  end
  
  %XMINORTICKHIGH
  if contains(tempString, 'xminortickhigh ')
    xMinorTickHigh = str2double(extractAfter(tempString,15));
  end
  
  %XMINORTICKINC
  if contains(tempString, 'xminortickinc ')
    xMinorTickInc = str2double(extractAfter(tempString,14));
  end
  
  %YMINORTICKLOW
  if contains(tempString, 'yminorticklow ')
    yMinorTickLow = str2double(extractAfter(tempString,14));
  end
  
  %YMINORTICKHIGH
  if contains(tempString, 'yminortickhigh ')
    yMinorTickHigh = str2double(extractAfter(tempString,15));
  end
  
  %YMINORTICKINC
  if contains(tempString, 'yminortickinc ')
    yMinorTickInc = str2double(extractAfter(tempString,14));
  end
  
end
[numRow,numCol] = size(data);

%% DEFAULT
if strcmp(plotType, 'default')
  lw = 2;
  figHandle = figure(1);
  hold on
  for i = 2:numCol
    plotHandles{i-1} = plot(data(:,1),data(:,i), 'linewidth', lw);
  end
  set(gca,'linewidth',1.5)
  set(gca,'fontsize',18)
  set(gcf,'color','w');
  set(gcf,'Position',[200 300 750 500])
  h = gca;
  h.XAxis.MinorTick = 'on';
  h.XAxis.MinorTickValues = xMinorTickLow:xMinorTickInc:xMinorTickHigh;
  h.YAxis.MinorTick = 'on';
  h.YAxis.MinorTickValues = yMinorTickLow:yMinorTickInc:yMinorTickHigh;
  box on
  title(plotTitle)
  xlabel(plotXLabel)
  ylabel(plotYLabel)
  xlim([plotXLow plotXHigh])
  ylim([plotYLow plotYHigh])
  xticks(xTickLow:xTickInc:xTickHigh)
  yticks(yTickLow:yTickInc:yTickHigh)
  if (length(legendInfo)>0)
    legendHandle = legend(legendInfo);
    legend boxoff
  end
  if (length(legendInfo)==0)
    legendHandle = {};
  end
  return;
end

%% DEFAULTCIRC
if strcmp(plotType, 'defaultCirc')
  lw = 2;
  figHandle = figure(1);
  hold on
  for i = 2:numCol
    plot(data(:,1),data(:,i), 'linewidth', lw, 'o')
  end
  set(gca,'linewidth',1.5)
  set(gca,'fontsize',14)
  set(gcf,'color','w');
  set(gcf,'Position',[200 300 750 500])
  h = gca;
  h.XAxis.MinorTick = 'on';
  h.XAxis.MinorTickValues = 85:10:130;
  h.YAxis.MinorTick = 'on';
  h.YAxis.MinorTickValues = 5:10:100;
  box on
  title(plotTitle)
  xlabel(plotXLabel)
  ylabel(plotYLabel)
  xlim([plotXLow plotXHigh])
  ylim([plotYLow plotYHigh])
  xticks(80:10:130)
  yticks(0:10:100)
  if (length(legendInfo)>0)
    legendHandle = legend(legendInfo);
    legend boxoff
  end
  if (length(legendInfo)==0)
    legendHandle = {};
  end
  return;
end

%% DEFAULTDOT
if strcmp(plotType, 'defaultDot')
  lw = 2;
  figHandle = figure(1);
  hold on
  for i = 2:numCol
    plot(data(:,1),data(:,i), 'linewidth', lw, '.')
  end
  set(gca,'linewidth',1.5)
  set(gca,'fontsize',14)
  set(gcf,'color','w');
  set(gcf,'Position',[200 300 750 500])
  h = gca;
  h.XAxis.MinorTick = 'on';
  h.XAxis.MinorTickValues = 85:10:130;
  h.YAxis.MinorTick = 'on';
  h.YAxis.MinorTickValues = 5:10:100;
  box on
  title(plotTitle)
  xlabel(plotXLabel)
  ylabel(plotYLabel)
  xlim([plotXLow plotXHigh])
  ylim([plotYLow plotYHigh])
  xticks(80:10:130)
  yticks(0:10:100)
  if (length(legendInfo)>0)
    legendHandle = legend(legendInfo);
    legend boxoff
  end
  if (length(legendInfo)==0)
    legendHandle = {};
  end
  return;
end
end