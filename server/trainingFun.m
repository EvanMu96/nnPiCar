function [ net ] = trainingFun(settings)
% 训练模式函数
% 标签分为4中，前后左右，用一个四行一列的向量表示
% 函数最终返回一个net神经网络对象
disp('Starting training')

%初始化变量
global net;
global currentType;
global startFlag;
global curl;
global quitLoop;
curl = strcat('http://',settings.ip,':',settings.cport,'/cmd');
startFlag = false;
trainingSet = zeros(12288,1);
trainingLabel = zeros(4,1);
labelType = struct('forward', [1;0;0;0],'backward',  [0;1;0;0], 'turnleft',  [0;0;1;0], 'turnright',[0;0;0;1]);
currentType = 'stop';

try
    disp('Connecting')
    dest = strcat('http://',settings.ip,':',settings.vport,'/?action=stream');
    cam = ipcam(dest);
catch
    disp('Connection failed,please check your connection')
    pause
end

% 执行UI函数
controlPad();
quitLoop = false;
status = 0;  %正常退出状态为0,

while (status < 1000) & (~quitLoop)
    tempLabel = zeros(4,1);
    I = snapshot(cam);
    imshow(I);
    I = preprocess(I);
    if startFlag == true
        switch currentType
            case 'forward'
                tempLabel = labelType.forward;
                trainingLabel = [trainingLabel tempLabel];
                trainingSet = [trainingSet I];
            case 'backward'
                tempLabel = labelType.backward;
                trainingLabel = [trainingLabel tempLabel];
                trainingSet = [trainingSet I];
            case 'turnleft'
                tempLabel = labelType.turnleft;
                trainingLabel = [trainingLabel tempLabel];
                trainingSet = [trainingSet I];
            case 'turnright'
                tempLabel = labelType.turnright;
                trainingLabel = [trainingLabel tempLabel];
                trainingSet = [trainingSet I];
            case 'stop'
                disp('stop')
            otherwise
                    disp('FATAL ERROR, LABEL ERROR!!')
        end
    end
    clear I
    status = status + 1;   %status作为一个计数器，防止内存溢出
end
close
startFlag = false;
trainingSet = trainingSet(:, 2:end);
trainingLabel = trainingLabel(:, 2:end);
net = patternnet(50);
net = train(net, trainingSet, trainingLabel);
view(net);



end