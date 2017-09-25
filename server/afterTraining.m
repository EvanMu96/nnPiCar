function [  ] = afterTraining(  )
% 训练之后是否进入预测模式
%  execute after training process
string = input('Training is done, do you want to start predicting?  Y/n', 's');
if string == 'y'
    predictFun()
else
    exit(0);
end
end

