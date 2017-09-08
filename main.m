clear
cam = ipcam('http://192.168.43.223:8080/?action=stream');
uri = 'http://192.168.43.223:8002/cmd';
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