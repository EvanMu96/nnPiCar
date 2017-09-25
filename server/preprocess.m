function [ out_I ] = preprocess( I )
% 图像数据预处理函数
% 将图像缩小至0.2倍并
temp = imresize(I,0.2);
temp = rgb2gray(temp);
[h, w] = size(temp);
temp = reshape(temp,[h*w, 1]);
out_I = double(temp);
end

