parameterSetting;
N_perDay = 12;
mu = 300;% 均值
sigma = 1; % 标准差
x = rand(N_perDay,1); %逆变换的概率
Data = 55*norminv(x,mu,sigma); % 通过逆变换得到的正态分布的数据
Sensor_Position = [-0.9,-0.3,0.3,0.9];
Axle_Position = [72 87.6 88.8 104.4 105.6 121.2 122.4 138];
AxleNum = length(Axle_Position);

for i = 3 : N_perDay
    Mb = Data(i) + Mb;
    base = Mb*9.8/4+mw*9.8+0.5*9.8*Mv;
    Savepath = ['D:\研究生\毕设\大论文\第五章\CODE\MeasureTime',num2str(i),'\'];
    if ~exist(Savepath)
        mkdir(Savepath);
    end
    for j = 1: AxleNum
        position1 = Axle_Position(j)+Sensor_Position(1);
        position2 = Axle_Position(j)+Sensor_Position(2);
        position3 = Axle_Position(j)+Sensor_Position(3);
        position4 = Axle_Position(j)+Sensor_Position(4);
        if j == 2
            Ln1 = 20e-3;
            Ln2 = 0;
            Flag = 1;
        elseif j ==4
            N1 = 9;
            N2 = 0;
            Flag = 2;
        else
            Flag = 3;
        end
        simOut = sim('FaultSimulator.slx');
        Sensor1 = simOut.Sensor1.Data;
        Sensor2 = simOut.Sensor2.Data;
        Sensor3 = simOut.Sensor3.Data;
        Sensor4 = simOut.Sensor4.Data;
        Time = simOut.Sensor1.Time;
        tmpData = [Time,Sensor1,Sensor2,Sensor3,Sensor4];
        eval(['save ',Savepath, 'MeasureTime',num2str(i),'Axle',num2str(j),'.mat  tmpData;']);
    end
    Mb = 23000/2;
end