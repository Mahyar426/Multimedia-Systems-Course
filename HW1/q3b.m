%% Mahyar Onsori 9632093
%%
clc
clear all
close all
%% Getting picture
mainpic=imread('Hi.tif');
%% Defining Matrices
[m,n]=size(mainpic);
pic_right_shift=zeros(m,n);
pic_left_shift=zeros(m,n);
%% Creating Right Shift Image
for i=1:m
    for j=1:n
        if(j<n-1)
        pic_right_shift(i,j+2)=mainpic(i,j);
        end
        if(j>=n-1)
            pic_right_shift(i,j-n+2)=mainpic(i,j);
        end
    end
end
pic_right_shift=uint8(pic_right_shift);
%% Creating Left Shift Image
for i=1:m
    for j=1:n
        if(j>2)
        pic_left_shift(i,j-2)=mainpic(i,j);
        end
        if(j<=2)
            pic_left_shift(i,n-2+j)=mainpic(i,j);
        end
    end
end
pic_left_shift=uint8(pic_left_shift);
%% Creating Average Picture
avgpic=zeros(m,n);
sum_matrix=double(mainpic)+double(pic_right_shift)+double(pic_left_shift);
%As we said in previous questions,we convert it to double to reach a number further than 255 which is limit of uint8
avgpic=uint8(sum_matrix/3);
%% Checking MSE
q3b_mse=HW1_MSE(mainpic,avgpic);
%% Showing Pictures
subplot(1,2,1)
imshow(mainpic);
title('Main Picture');
subplot(1,2,2);
imshow(avgpic);
title('Average Picture');


