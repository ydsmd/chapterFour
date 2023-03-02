clc;
clear;
close all;
%导入数据：训练集、测试集、训练标签、测试标签
load OVRData.mat
%%绘数据分布图

N = size(train_data,1);
group_train = group_train(:,1);
test_labels = test_labels(:,1);
%%
% 训练数据分为5类
% 类别i的 正样本 选择类别i的全部，负样本 从其余类别中随机选择（个数与正样本相同）
%%
% 健康
class1_p = train_data(group_train(:,1)==2,:);

index1 = randperm(N - length(class1_p),length(class1_p));
train_data_c = train_data;
train_data_c(group_train(:,1)==2,:) = [];%正样本
class1_n = train_data_c(index1,:);%负样本
train_features1 = [class1_p;class1_n];
% 正类表示为1，负类表示为-1
train_labels1 = [ones(length(class1_p),1);-1*ones(length(class1_p),1)];

%% 多边形
class2_p = train_data(group_train(:,1)==1,:);

index2 = randperm(N - length(class2_p),length(class2_p));
train_data_c = train_data;
train_data_c(group_train(:,1)==1,:) = [];%正样本
class2_n = train_data_c(index2,:);%负样本
train_features2 = [class2_p;class2_n];
% 正类表示为1，负类表示为-1
train_labels2 = [ones(length(class2_p),1);-1*ones(length(class2_p),1)];

%% 擦伤
class3_p = train_data(group_train(:,1)==0,:);

index3 = randperm(N - length(class3_p),length(class3_p));
train_data_c = train_data;
train_data_c(group_train(:,1)==0,:) = [];%正样本
class3_n = train_data_c(index3,:);%负样本
train_features3 = [class3_p;class3_n];
% 正类表示为1，负类表示为-1
train_labels3 = [ones(length(class3_p),1);-1*ones(length(class3_p),1)];

%%
% 分别训练5个类别的SVM模型
disp('开始训练')
tic
model1 = fitcsvm(train_features1,train_labels1,'ClassNames',{'-1','1'});
model2 = fitcsvm(train_features2,train_labels2,'ClassNames',{'-1','1'});
model3 = fitcsvm(train_features3,train_labels3,'ClassNames',{'-1','1'});
time = toc;
disp(['训练完成，用时:',num2str(time)])

%%
% label是n*1的矩阵，每一行是对应测试样本的预测标签；
% score是n*2的矩阵，第一列为预测为“负”的得分，第二列为预测为“正”的得分。
% 用训练好的5个SVM模型分别对测试样本进行预测分类，得到5个预测标签
[label1,score1] = predict(model1,test_data);
[label2,score2] = predict(model2,test_data);
[label3,score3] = predict(model3,test_data);

score = [score1(:,2),score2(:,2),score3(:,2)];
% 最终预测标签为k*1矩阵,k为预测样本的个数
final_labels = zeros(length(test_labels),1);
num = 0;
wrong = [];
for i = 1:size(final_labels,1)
    % 返回每一行的最大值和其位置
    [m,p] = max(score(i,:));
    % 位置即为标签
    final_labels(i,:) = (3-p);
    if final_labels(i,:)==test_labels(i)
        num = num+1;
    else
        wrong = [wrong,i];
    end
end
accuracy = num/size(final_labels,1);
% 分类评价指标

disp(['分类准确率为 ',num2str(100*accuracy),'%']);