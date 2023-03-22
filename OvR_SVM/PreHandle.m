clc;clear;
load TrainData.mat;

poly = Data(Label(:,1)==1,:);
cursie = Data(Label(:,1)==0,:);
N = size(Data,1);
n_train = round(N*0.9);
n_test = N - n_train;
index = randperm(N,n_train);
train_data = Data(index,:);
group_train = Label(index,:);
test_data = Data;test_data(index,:)=[];
test_labels = Label;test_labels(index,:)=[];

save OVRData.mat test_labels test_data group_train train_data;