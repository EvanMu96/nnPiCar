function [  ] = afterTraining(settings, net )
% ѵ��֮���Ƿ����Ԥ��ģʽ
%  execute after training process
string = input('Training is done, do you want to start predicting?  Y/n', 's');
if string == 'y' || string =='Y'
    predictFun(settings, net);
elseif string == ''
    predictFun(settings, net);
else
    pause
end
end

