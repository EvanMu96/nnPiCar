function [  ] = afterTraining(settings, net )
% 训练之后是否进入预测模式
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

