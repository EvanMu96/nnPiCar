function [ net ] = trainingFun(settings)
% ѵ��ģʽ����
% ��ǩ��Ϊ4�У�ǰ�����ң���һ������һ�е�������ʾ
% �������շ���һ��net���������
disp('Starting training')

%��ʼ������
global currentType;
global startFlag;
global curl;
global quitLoop;
curl = strcat('http://',settings.ip,':',settings.cport,'/cmd');
startFlag = false;
trainingSet = zeros(12288,1);
trainingLabel = zeros(5,1);
labelType = struct('forward', [1;0;0;0;0],'backward',  [0;1;0;0;0], 'turnleft',  [0;0;1;0;0], 'turnright',[0;0;0;1;0],'stop',[0;0;0;0;1]);
currentType = 'stop';

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
quitLoop = false;
status = 0;  %�����˳�״̬Ϊ0,

while (status < 900) & (~quitLoop)
    tempLabel = zeros(5,1);
    I = snapshot(cam);
    imshow(I);
    I = preprocess(I);
    if startFlag == true
        switch currentType
            case 'forward'
                tempLabel = labelType.forward;
                trainingLabel = [trainingLabel tempLabel];
                trainingSet = [trainingSet I];
                status = status + 1;   %status��Ϊһ������������ֹ�ڴ����
                disp('record forward')
            case 'backward'
                tempLabel = labelType.backward;
                trainingLabel = [trainingLabel tempLabel];
                trainingSet = [trainingSet I];
                status = status + 1;   %status��Ϊһ������������ֹ�ڴ����
                disp('record backward')
            case 'turnleft'
                tempLabel = labelType.turnleft;
                trainingLabel = [trainingLabel tempLabel];
                trainingSet = [trainingSet I];
                status = status + 1;   %status��Ϊһ������������ֹ�ڴ����
                disp('record turnleft')
            case 'turnright'
                tempLabel = labelType.turnright;
                trainingLabel = [trainingLabel tempLabel];
                trainingSet = [trainingSet I];
                status = status + 1;   %status��Ϊһ������������ֹ�ڴ����
                disp('record turnright')
            case 'stop'
                tempLabel = labelType.stop;
                trainingLabel = [trainingLabel tempLabel];
                trainingSet = [trainingSet I];
                status = status + 1;
                disp('record stop')
            otherwise
                    disp('FATAL ERROR, LABEL ERROR!!')
        end
    end
    clear I
end
close
startFlag = false;
trainingSet = trainingSet(:, 2:end);
trainingLabel = trainingLabel(:, 2:end);
net = patternnet(50);
net = train(net, trainingSet, trainingLabel);
view(net);
% ����net�ļ�
save('net.mat', 'net');
t = datetime('now','Format','yyyy-MM-dd''T''HHmmss');
S = char(t);
filenameTrain = ['X_', S,'.mat'];
filenameLabel = ['Y_', S,'.mat'];
save(filenameTrain, 'trainingSet');
save(filenameLabel, 'trainingLabel');
end