clc;clear;clf;

txt_path = 'C:\Users\brandon\src\research\hofmann_research\hofplot\test\data';
files = dir(txt_path);
for i=3:length(files)
  
  modelVar{i-2} = load(strcat(txt_path,'\',files(i).name));
  name = files(i).name;
  
end
f1 = figure(1);
hold on
data = [modelVar{1}(1:431,1),...
  modelVar{1}(1:431,2).*100,...
  modelVar{2}(1:431,2).*100,...
  modelVar{3}(1:431,2).*100,...
  modelVar{4}(1:431,2).*100,...
  modelVar{5}(1:431,2).*100,...
  modelVar{6}(1:431,2).*100,...
  ];
    plotInfo = {'type: default','title: ','xlabel: Frequency (GHz)','ylabel: Transmission (%)','yhigh: 55'};
    legendInfo = {''};
    [plotHandles, legendHandle] = hofplot(data, plotInfo, legendInfo);
    legend([plotHandles{5} plotHandles{6} plotHandles{1} plotHandles{2} plotHandles{3} plotHandles{4}],{'0 Experimental','0 Model','17 Experimental','17 Model','22 Experimental','22 Model'})
        plotHandles{1}.Color = 'r';
        plotHandles{1}.LineStyle = '--';
        plotHandles{1}.LineWidth = 2;
        plotHandles{2}.Color = 'r';

        plotHandles{3}.Color = 'b';
        plotHandles{3}.LineStyle = '--';
        plotHandles{3}.LineWidth = 2;
        plotHandles{4}.Color = 'b';

        plotHandles{5}.Color = 'black';
        plotHandles{5}.LineStyle = '--';
        plotHandles{5}.LineWidth = 2;
        plotHandles{6}.Color = 'black';

        legendHandle.FontSize = 10;
        title(legendHandle, 'Air Gap (%)')