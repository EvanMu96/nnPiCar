% ΢ѩAlphaBot�Զ���ʻ����
% �����ļ�˵��:�����ļ�settings.mat����������,��һ��������С����ip��ַ���ڶ���������mjpg-streamer�Ķ˿�
% ������������control http����Ķ˿�
% ����ģʽ�����֣���Ϊѵ��ģʽ��Ԥ��ģʽ
% ��һ��(Ĭ��)��ѵ��ģʽ[T]��ѵ��ģʽ�¿��Զ���Ƶ�������label����¼�˲����Ĺ��̣�ʹ�÷��򴫲��㷨ѵ��patternnet
% �ڶ�����Ԥ��ģʽ,��Ԥ��ģʽ��,�³��ܹ�����ѵ���õ������������ͷ��������ݽ���ʵʱԤ��
close all
clear 
net = 0;
load('settings.mat');
prompt = 'Choose the work mode, training or prediction, [T]/[p] \n';
workType = input(prompt, 's');
switch workType
    case ''
        net = trainingFun(settings);
        afterTraining(settings, net);
    case 't'
        net = trainingFun(settings);
        afterTraining(settings, net);
    case 'T'
        net = trainingFun(settings);
        afterTraining(settings, net);
    case 'P'
        net = load('net.mat');
        net = net.net;
        predictFun(settings, net);
    case 'p'
        net = load('net.mat');
        net = net.net;
        predictFun(settings, net);
    otherwise
        disp('Your input is wrong, please run this script again')
end