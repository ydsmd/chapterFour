%%%%%%%%%%%%%%%%%%%%%%%%%%%pythondataset%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         本文件生成能够用于python多分类程序的数据集             %
%                         使用时需与TrainData.mat在同一目录下                   %
%                         作者：余道洪                                         %
%                         修改日期：2023.3.15                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
load '.'/TrainData.mat
x = Label(:,1);
d1 = Data;

tmp = [];
part = [1:8,13:24,33:40,45:64];
for i = 1 : 4
    eval(['load Dataset',num2str(i),'.mat'])
    a = [Data(part,:),80*ones(length(part),1)];
    tmp = [tmp;a];
end

tmpLable = 2*ones(length(tmp(:,1)),1);

x  = [x;tmpLable];
d1 = [d1;tmp];


d1 = zscore(d1(:,1:10));
x = [x,d1];
randIndex = randperm(size(x,1));
X_new= x(randIndex,:);

csvwrite('SVM_PY.csv',X_new);