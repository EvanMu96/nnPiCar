function [ net  ] = tryLoad( )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
try
    net = load('net.mat');
catch
    disp('load failed');
    net = 0;
    pause
end

