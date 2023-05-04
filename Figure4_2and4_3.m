%%%%%%%%%%%%%%%%%%%%%%%%% Figure4.2andFigure4.3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          运行前需要与record_2019-01-11.csv Figure4_3Data.ma在同一目录下       %
%          本文件绘制论文图4.2至4.3                                             %
%          作者：余道洪                                                        %
%          修改日期：2023.3.15                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% figure4_2
clc;clear;
table = readtable('./record_2019-01-11.csv');
time = table.time;
line = cell2mat(table.lineID);
tmp = time(line=='A',:);

resultSet = zeros(48,2);

for i = 1 : length(tmp)
    Hour = tmp(i).Hour;
    minute = tmp(i).Minute;
    if minute >= 30
        resultSet(Hour+1,1)=resultSet(Hour+1,1)+1;
    else
        resultSet(Hour+1,2)=resultSet(Hour+1,2)+1;
    end
end
x = [];
for i = 1:24
    x = [x,resultSet(i,:)];
end


tmp = time(line=='B',:);

resultSet = zeros(48,2);

for i = 1 : length(tmp)
    Hour = tmp(i).Hour;
    minute = tmp(i).Minute;
    if minute >= 30
        resultSet(Hour+1,1)=resultSet(Hour+1,1)+1;
    else
        resultSet(Hour+1,2)=resultSet(Hour+1,2)+1;
    end
end
y = [];
for i = 1:24
    y = [y,resultSet(i,:)];
end


tmp = time(line=='C',:);

resultSet = zeros(48,2);

for i = 1 : length(tmp)
    Hour = tmp(i).Hour;
    minute = tmp(i).Minute;
    if minute >= 30
        resultSet(Hour+1,1)=resultSet(Hour+1,1)+1;
    else
        resultSet(Hour+1,2)=resultSet(Hour+1,2)+1;
    end
end
z = [];
for i = 1:24
    z = [z,resultSet(i,:)];
end
res = [x;y;z]';

h1 = plot(res);
set(h1(1),'Color','#FFBE7A','LineWidth',2,'LineStyle',':','Marker','d');
set(h1(2),'Color','#8ECFC9','LineWidth',2,'LineStyle','-.','Marker','o');
set(h1(3),'Color','#FA7F6F','LineWidth',2,'LineStyle','--','Marker','^');
prettyAxes(gca).gbase()
set(gca, 'xTick', [1:48]);
set(gca,'XTickLabel',{'00:00','00:30','01:00','01:30','02:00','02:30','03:00','03:30' ...
    '04:00','04:30','05:00','05:30','06:00','06:30','07:00','07:30' ...
    '08:00','08:30','09:00','09:30','10:00','10:30','11:00','11:30' ...
    '12:00','12:30','13:00','13:30','14:00','14:30','15:00','15:30' ...
    '16:00','16:30','17:00','17:30','18:00','18:30','19:00','19:30' ...
    '20:00','20:30','21:00','21:30','22:00','22:30','23:00','23:30'})
set(gca,'FontSize',16)
legend('A线','B线','C线','FontSize',20)
title('某市地铁在2019年1月11日内客流量变化图','FontSize',20)
xlabel('时刻','FontSize',20)
ylabel('人次','FontSize',20)


%% figure4_3
% Flowrate1_11A= sum(line=='A');
% Flowrate1_11B= sum(line=='B');
% Flowrate1_11C= sum(line=='C');
% 
% %1-7
% table = readtable('./record_2019-01-07.csv');
% line = cell2mat(table.lineID);
% Flowrate1_07A= sum(line=='A');
% Flowrate1_07B= sum(line=='B');
% Flowrate1_07C= sum(line=='C');
% 
% table = readtable('./record_2019-01-08.csv');
% line = cell2mat(table.lineID);
% Flowrate1_08A= sum(line=='A');
% Flowrate1_08B= sum(line=='B');
% Flowrate1_08C= sum(line=='C');
% 
% table = readtable('./record_2019-01-09.csv');
% line = cell2mat(table.lineID);
% Flowrate1_09A= sum(line=='A');
% Flowrate1_09B= sum(line=='B');
% Flowrate1_09C= sum(line=='C');
% 
% table = readtable('./record_2019-01-10.csv');
% line = cell2mat(table.lineID);
% Flowrate1_10A= sum(line=='A');
% Flowrate1_10B= sum(line=='B');
% Flowrate1_10C= sum(line=='C');
% 
% table = readtable('./record_2019-01-12.csv');
% line = cell2mat(table.lineID);
% Flowrate1_12A= sum(line=='A');
% Flowrate1_12B= sum(line=='B');
% Flowrate1_12C= sum(line=='C');
% 
% table = readtable('./record_2019-01-13.csv');
% line = cell2mat(table.lineID);
% Flowrate1_13A= sum(line=='A');
% Flowrate1_13B= sum(line=='B');
% Flowrate1_13C= sum(line=='C');
% 
% Figure4_3Set = [Flowrate1_07A,Flowrate1_07B,Flowrate1_07C
%                 Flowrate1_08A,Flowrate1_08B,Flowrate1_08C
%                 Flowrate1_09A,Flowrate1_09B,Flowrate1_09C
%                 Flowrate1_10A,Flowrate1_10B,Flowrate1_10C
%                 Flowrate1_11A,Flowrate1_11B,Flowrate1_11C
%                 Flowrate1_12A,Flowrate1_12B,Flowrate1_12C
%                 Flowrate1_13A,Flowrate1_13B,Flowrate1_13C];
load Figure4_3Data.mat
h1 = plot(Figure4_3Set);
set(h1(1),'Color','#FFBE7A','LineWidth',2,'LineStyle',':','Marker','d');
set(h1(2),'Color','#8ECFC9','LineWidth',2,'LineStyle','-.','Marker','o');
set(h1(3),'Color','#FA7F6F','LineWidth',2,'LineStyle','--','Marker','^');
% prettyAxes(gca).dark()
set(gca, 'xTick', [1:7]);
legend('A线','B线','C线','FontSize',20)
title('某市地铁在2019年1月7日至1月13日内客流量变化图','FontSize',20)
set(gca,'XTickLabel',{'星期一','星期二','星期三','星期四','星期五','星期六','星期日'})
set(gca,'FontSize',16);
xlabel('时间','FontSize',20)
ylabel('人次','FontSize',20)
