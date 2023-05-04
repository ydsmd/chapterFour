

%% 基本设置
clc;clear;
Wavelet_Families = 'dmey';
Sensor_Position = [-0.9,-0.3,0.3,0.9];
Axle_Position = [72 87.6 88.8 104.4 105.6 121.2 122.4 138];
AxleNum = length(Axle_Position);
v = 80/3.6;
period = pi*0.42/(v);
%% 文件检索
fileName = pwd;
files = dir(fullfile(fileName));
fileName_folder=[];
size_row = size(files);
folder_num = size_row(1);
for i=3:folder_num
    if(files(i).isdir)     
         fileName_folder = [fileName_folder;string(files(i).name)];
    end
end
n = length(fileName_folder(:,1));
j = 1;
for i = 1: n
    if contains(fileName_folder(i,:),'MeasureTime')
        Dataset(j) = fileName_folder(i,:);
        j = j + 1;
    end
end
Dataset = Dataset';


%% 生成数据集
for k = 1:length(Dataset)
    savepath = strcat(pwd,'\',Dataset(k,:));  
    name =  Dataset(k,:);
    z = name{1};
    num = str2num(z(end));
    Data = [];
    Label = [];
    timeDomin = zeros(8,4);
    DWTAPP = zeros(8,5);
    for i = 1 : 8
        string = strcat(savepath,'\',Dataset(k,:),'Axle',num2str(i));
        Sensor1_1= (Axle_Position(i)+Sensor_Position(1))/v;
        Sensor1_2= (Axle_Position(i)+Sensor_Position(1)+2.6)/v;
        Sensor2_1= (Axle_Position(i)+Sensor_Position(2))/v;
        Sensor2_2= (Axle_Position(i)+Sensor_Position(2)+2.6)/v;
        Sensor3_1= (Axle_Position(i)+Sensor_Position(3))/v;
        Sensor3_2= (Axle_Position(i)+Sensor_Position(3)+2.6)/v;
        Sensor4_1= (Axle_Position(i)+Sensor_Position(4))/v;
        Sensor4_2= (Axle_Position(i)+Sensor_Position(4)+2.6)/v;

        S1_1 = round((Sensor1_1-period)/(1e-3)):round((Sensor1_1+period)/(1e-3));
        S1_2 = round((Sensor1_2-period)/(1e-3)):round((Sensor1_2+period)/(1e-3));
        S2_1 = round((Sensor2_1-period)/(1e-3)):round((Sensor2_1+period)/(1e-3));
        S2_2 = round((Sensor2_2-period)/(1e-3)):round((Sensor2_2+period)/(1e-3));
        S3_1 = round((Sensor3_1-period)/(1e-3)):round((Sensor3_1+period)/(1e-3));
        S3_2 = round((Sensor3_2-period)/(1e-3)):round((Sensor3_2+period)/(1e-3));
        S4_1 = round((Sensor4_1-period)/(1e-3)):round((Sensor4_1+period)/(1e-3));
        S4_2 = round((Sensor4_2-period)/(1e-3)):round((Sensor4_2+period)/(1e-3));
        eval(['load ',string{1}])

        Time = tmpData(:,1);

        for j = 2 : 5
            ACC = tmpData(:,j);
            eval(['xp1=ACC(S',num2str(j-1),'_1);']);
            eval(['xp2=ACC(S',num2str(j-1),'_2);']);

            eval(['tp1=Time(S',num2str(j-1),'_1);']);
            eval(['tp2=Time(S',num2str(j-1),'_2);']);

            timeDomin(2*j-3,:) = FourTimeDominFeatures(xp1);
            tmp = DWTandApp(xp1,Wavelet_Families,2,0.25);
            DWTAPP(2*j-3,:) = tmp([1,2,3,7,8]);
            timeDomin(2*j-2,:) = FourTimeDominFeatures(xp2);
            tmp = DWTandApp(xp2,Wavelet_Families,2,0.25);
            DWTAPP(2*j-2,:) = tmp([1,2,3,7,8]);

        end
        tempDATA = [timeDomin,DWTAPP];
        Data = [Data;tempDATA];
        tmpLabel = [2*i-1;2*i;2*i-1;2*i;2*i-1;2*i;2*i-1;2*i];

        Label = [Label;tmpLabel];    
        eval(['save D:\研究生\毕设\大论文\第四章\CODE\dailyData2\Dataset',num2str(k),'.mat Data Label;']);
    end
end

