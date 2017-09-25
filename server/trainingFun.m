function [ status ] = trainingFun(settings)
% ѵ��ģʽ����
% ��ǩ��Ϊ4�У�ǰ�����ң���һ������һ�е�������ʾ

disp('Starting training')

%��ʼ������
global net;
global currentType;
global startFlag;
startFlag = false;
trainingSet = zeros(12288,1);
trainingLabel = zeros(4,0);
labelType = struct('forward', [1;0;0;0],'backward',  [0;1;0;0], 'turnleft',  [0;0;1;0], 'turnright',[0,0,0,1]);
currentType = '';

try
    disp('Connecting')
    dest = strcat('http://',settings.ip,':',settings.vport,'/?action=stream');
    cam = ipcam(dest);
catch
    disp('Connection failed,please check your connection')
    pause
end

% ִ��UI����
controlPad();

status = 0;  %�����˳�״̬Ϊ0,

while status < 1000
    tempLabel = zeros(4,1);
    I = snapshot(cam);
    imshow(I);
    I = preprocess(I);
    if startFlag == true
        switch currentType
            case 'forward'
                tempLabel = labelType.forward;
            case 'backward'
                tempLabel = labelType.backward;
            case 'turnleft'
                tempLabel = labelType.turnleft;
            case 'turnright'
                tempLabel = labelType.turnright;
            otherwise
                    disp('FATAL ERROR, LABEL ERROR!!')
        end
        trainingLabel = [trainingLabel tempLabel];
    end
    trainingSet = [trainingSet I];
    clear I
    status = status + 1;   %status��Ϊһ������������ֹ�ڴ����
end

startFlag = false;
trainingSet = trainingSet(:, 2:end);
trainingLabel = trainingLabel(:, 2:end);
net = patternnet(50);
net = train(net, trainingSet, trainingLabel);
view(net);



end