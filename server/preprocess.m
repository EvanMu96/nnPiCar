function [ out_I ] = preprocess( I )
% ͼ������Ԥ������
% ��ͼ����С��0.2����
temp = imresize(I,0.2);
temp = rgb2gray(temp);
[h, w] = size(temp);
temp = reshape(temp,[h*w, 1]);
out_I = double(temp);
end

