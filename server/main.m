% ΢ѩAlphaBot�Զ���ʻ����
% �����ļ�˵��:�����ļ�settings.mat����������,��һ��������С����ip��ַ���ڶ���������mjpg-streamer�Ķ˿�
% ������������control http����Ķ˿�
% ����ģʽ�����֣���Ϊѵ��ģʽ��Ԥ��ģʽ
% ��һ��(Ĭ��)��ѵ��ģʽ[T]��ѵ��ģʽ�¿��Զ���Ƶ�������label����¼�˲����Ĺ��̣�ʹ�÷��򴫲��㷨ѵ��patternnet
% �ڶ�����Ԥ��ģʽ,��Ԥ��ģʽ��,�³��ܹ�����ѵ���õ������������ͷ��������ݽ���ʵʱԤ��
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