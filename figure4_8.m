%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure4.8%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         本文件绘制论文图4.8                                  %
%                         作者：余道洪                                         %
%                         修改日期：2023.3.15                                  %                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
load fisheriris.mat
lable = species(1:100);
lable = ones(100,1);
lable(51:100)=-1;
fea = meas(1:100,:);
fea(42,2) = 3;


plot([4.5 6.5],[2.45 4.05],'-m','LineWidth',2,'Color',[250 127 111]/255)
hold on


ax=gca
ax.XAxis.Visible='off';
ax.YAxis.Visible='off';
ax.ZAxis.Visible='off';


plot([4.5 6.5],[2.6 4.2],'-m','LineWidth',2,'Color',[250 127 111]/255)
hold on
plot([4.5 6.5],[2.28 3.88],'-m','LineWidth',2,'Color',[250 127 111]/255)
hold on

gscatter(fea(:,1),fea(:,2),lable,[255 190 122;130 176 210]/255);
ax.Legend.FontSize = 16;