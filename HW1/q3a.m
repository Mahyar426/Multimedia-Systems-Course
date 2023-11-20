%% Mahyar Onsori 9632093
%%
clc
clear all
close all
%% Getting the picture
pic1=imread('Hi.tif');
[m,n]=size(pic1);
%% Creating secondary picture
pic2=pic1-20;
%% Checking on possible minus elements
for i=1:m
    for j=1:n
        if (pic2(i,j)<0)
            pic2(i,j)=0;
        end
    end
end
%% Calling P2 Function
q3mse=HW1_MSE(pic1,pic2);