%%%%%%%%%%%%%%%%%%%%%%%%% Figure4.6andFigure4.7%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          运行前需要加载数据集DailyDataSet                                     %
%          本文件绘制论文图4.6至4.7运行前需要加载数据集文件夹DailyDataSet         %
%          作者：余道洪                                                        %
%          修改日期：2023.3.15                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear ;
score = zeros(16,1);
k = 1; 
p = 4;
iteration =500 ;
distance = 'sqeuclidean';
threshold = 2.5;
for m =1:12
eval(['load Dataset',num2str(m),'.mat;']);
% set = [Data,Label];
% data=sortrows(set,10);
data = Data;
%% 数据标准化
data = zscore(data(:,1:9));
%% 调用kmeans算法
opts = statset('MaxIter',iteration);
[IDX,C,~,D] = kmeans(data,k,'distance',distance,'Options',opts);

%% 作图查看结果
min_d =D/median(D);
x=1:length(min_d);
threshold_=x;
threshold_(:)=threshold;

if m ==1
figure
plot(x,min_d,'o','Color',[190 184 220]/255,'LineWidth',3);
hold on
plot(x,threshold_,'-','Color',[130 176 210]/255,'LineWidth',3);
hold on
for i=1:length(min_d)
    if min_d(i)>threshold
        plot(i,min_d(i),'*','Color',[250 127 111]/255,'LineWidth',1.5);
%         text(i+0.2,min_d(i),num2str(min_d(i)));
    end
end
title('离群点检测','FontSize',16);
text(50,4,'T=2.5','FontSize',18);
xlim([1 64])
ylabel('相对距离','FontSize',16);
xlabel('样本号','FontSize',16);
prettyAxes().gbase()
end
res = SuspectSelect(D,p,Label);
for i = 1 : p
    score(res(1,i)) =  score(res(1,i)) + res(2,i);
end

end
figure
S = score/12;
b = bar(S)
set(b,'FaceColor',[142 207 201]/255)
hold on 
plot([0 17],[2.5 2.5],'--','LineWidth',3,'Color',[255 190 122]/255)
text(2.5,S(3)+0.4,num2str(S(3)),'FontSize',12);
text(3.5,S(4)+0.3,num2str(S(4)),'FontSize',12);
text(7.5,S(8)+0.4,num2str(S(8)),'FontSize',12);
text(10.5,S(11)+0.4,num2str(S(11)),'FontSize',12);
text(13.5,3.5,'T=2.5','FontSize',16);
xlim([1 16])
ylim([0 15])
xlabel('车轮编号','FontSize',16);
ylabel('相对距离值','FontSize',16);
title('一日内各车轮平均得分','FontSize',16);
prettyAxes().gbase()
ylabel('相对距离值','FontSize',16);