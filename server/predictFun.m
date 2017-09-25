function [ status ] = predictFun(settings )
status = 0;   %正常退出状态为0
try
    disp('Connecting\n')
    dest = strcat('http://',settings.ip,':',settings.port,'/?action=stream');
    cam = ipcam(dest);
catch
    disp('Connection failed,please check your connection')
    exit(1);
end
    
ur = strcat('http://',settings.ip,':',settings.cport,'/cmd');
while 1
    I = snapshot(cam);
    imshow(I);
    I = preprocess(I);
    % probability = getcircle2(I);
    probability = getcircle(I);
    result = 'no';
    if probability > 0.8 
        result = 'yes';
        action = 'forward';
        [~,~,~] = cmd(action,uri);
        pause(0.1);
        action = 'stop';
        [~,~,~] = cmd(action,uri);
    end
    disp(result);
    clear I
end
end