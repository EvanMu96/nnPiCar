function [ status ] = predictFun(settings, net)
% settings为配置对象
status = 0;   %正常退出状态为0
try
    disp('Connecting\n')
    dest = strcat('http://',settings.ip,':',settings.vport,'/?action=stream');
    cam = ipcam(dest);
catch
    disp('Connection failed,please check your connection')
    pause
end
    
url = strcat('http://',settings.ip,':',settings.cport,'/cmd');
while 1
    I = snapshot(cam);
    imshow(I);
    I = preprocess(I);
    % probability = getcircle2(I);
    probability = net(I);
    result = 'no';
    if probability > 0.8 
        result = 'yes';
        action = 'forward';
        [~,~,~] = cmd(action,url);
        pause(0.1);
        action = 'stop';
        [~,~,~] = cmd(action,url);
    end
    disp(result);
    clear I
end
end