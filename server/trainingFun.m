function [ status ] = trainingFun(settings)
disp('Starting training\n')

startFlag = true;

try
    disp('Connecting\n')
    dest = strcat('http://',settings.ip,':',settings.port,'/?action=stream');
    cam = ipcam(dest);
catch
    disp('Connection failed,please check your connection')
    exit(1);
end


controlPad();
status = 0;  %正常退出状态为0
end