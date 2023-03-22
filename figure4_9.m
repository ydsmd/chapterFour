%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure4.9%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         本文件绘制论文图4.8                                  %
%                         作者：余道洪                                         %
%                         修改日期：2023.3.15                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
load fisheriris.mat

X = meas(:,1); 
Y = meas(:,2); 
Z = meas(:,3); 
ZF = [ones(50,1);2*ones(50,1);3*ones(50,1)];

C = repmat([1,2,3],numel(X),1);

c = C(:);


figure(1)

scatter(X(51:100),Y(51:100),30,[142 207 201]/255,'filled');
hold on
scatter(X(101:150),Y(101:150),30,[255 127 111]/255,'filled');
ax=gca
ax.XAxis.Visible='off';
ax.YAxis.Visible='off';
ax.ZAxis.Visible='off';
legend('1','-1')

%% 图4.9(b)
figure(2)

A = [4.5;4.5;8;8;4.5];
B = [2;4;4;2;2];
C = [3;3;7;7;3];
h = fill3(A,B,C,[130,176,210]/255)
set(h,'edgealpha',0,'facealpha',0.3)
hold on
scatter3(X(51:100),Y(51:100),Z(51:100)-1,20,[142 207 201]/255,'filled');
hold on
scatter3(X(101:150),Y(101:150),2+Z(101:150),20,[255 127 111]/255,'filled');
hold on
scatter3(X(51:100),Y(51:100),zeros(50,1),20,[142 207 201]/255,'filled');
hold on
scatter3(X(101:150),Y(101:150),zeros(50,1),20,[255 127 111]/255,'filled');
hold on
legend('','1','-1')
hold on
view(-15,10)
ax=gca
ax.XAxis.Visible='off';
ax.YAxis.Visible='off';
ax.ZAxis.Visible='off';
prettyAxes().gbase()
