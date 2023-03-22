%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure4.1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         本文件绘制论文图4.1                                  %
%                         作者：余道洪                                         %
%                         修改日期：2023.3.15                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
load fisheriris.mat
lable = zeros(150,1);
lable(51:100)=1;
lable(101:150)=2;
fea = meas(1:150,:);
fea(101:150,3) = fea(101:150,3) - 4;
fea(25,3)=fea(25,3)+1;
fea(71,4)=fea(71,4)+0.5;
fea(123,3)=fea(123,3)+0.8;
cmap = [142 207 201
        255 127 111
        130,176,210]/255;
figure
h  = gscatter(fea(:,4),fea(:,3),lable,cmap,'o^+',8);
set(h,'LineWidth',2)
ax=gca


ax.XAxis.Visible='off';
ax.YAxis.Visible='off';
ax.ZAxis.Visible='off';
prettyAxes().ggray2();