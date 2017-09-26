% 微雪AlphaBot自动驾驶程序
% 配置文件说明:配置文件settings.mat有三个参数,第一个参数是小车的ip地址，第二个参数是mjpg-streamer的端口
% 第三个参数是control http服务的端口
% 工作模式分两种，分为训练模式和预测模式
% 第一种(默认)是训练模式[T]，训练模式下可以对视频数据添加label并记录人操作的过程，使用反向传播算法训练patternnet
% 第二种是预测模式,在预测模式下,下车能够调用训练好的神经网络对摄像头传输的数据进行实时预测
close all
clear 
load('settings.mat');
prompt = 'Choose the work mode, training or prediction, [T]/[p] \n';
workType = input(prompt, 's');
switch workType
    case ''
        trainingFun(settings)
        afterTraining()
    case 't'
        trainingFun(settings)
        afterTraining()
    case 'T'
        trainingFun(settings)
        afterTraining()
    case 'P'
        predictFun(settings)
    case 'p'
        predictFun(settings)
    otherwise
        disp('Your input is wrong, please run this script again')
end