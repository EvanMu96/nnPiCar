function [ out_I ] = preprocess( I )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
temp = imresize(I,0.2);
temp = rgb2gray(temp);
[h, w] = size(temp);
temp = reshape(temp,[h*w, 1]);
out_I = double(temp);
end

