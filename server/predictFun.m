function [ status ] = predictFun(settings, net)
% settingsΪ���ö���

%��ʼ������
status = 0;   %�����˳�״̬Ϊ0
% labelType = struct('forward', [1;0;0;0],'backward',  [0;1;0;0], 'turnleft',  [0;0;1;0], 'turnright',[0;0;0;1]);

try
    disp('Connecting\n')
    dest = strcat('http://',settings.ip,':',settings.vport,'/?action=stream');
    cam = ipcam(dest);
catch
    disp('Connection failed,please check your connection')
    pause
end
    
curl = strcat('http://',settings.ip,':',settings.cport,'/cmd');
while 1
    I = snapshot(cam);
    imshow(I);
    I = preprocess(I);
    % probability = getcircle2(I);
    probability = net(I);
    disp(probability);
    nextStep = vec2ind(probability);
    switch nextStep
        case 0
            action = 'stop';
        case 1
            action = 'forward';
        case 2
            action = 'backward';
        case 3
            action = 'turnleft';
        case 4
            action = 'turnright';
        case 5
            action = 'stop';
        otherwise
            disp('FATAL ERROR');
    end
    cmd(action, curl);
    pause(0.1)
    cmd('stop', curl);
    %disp(action);
    clear I
end
end