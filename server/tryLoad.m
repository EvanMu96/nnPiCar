function [ net  ] = tryLoad( )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
try
    net = load('net.mat');
catch
    disp('load failed');
    net = 0;
    pause
end

