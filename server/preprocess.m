function [ out_I ] = preprocess( I )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
temp = imresize(I,0.2);
temp = rgb2gray(temp);
[h, w] = size(temp);
temp = reshape(temp,[h*w, 1]);
out_I = double(temp);
end

