%% Mahyar Onsori 9632093
%%
clc
clear all
close all
%% Reading picture
mainpic=imread('Hi.tif');
%% Calling function
[MSE_nearest,MSE_bilinear,MSE_bicubic] = HW1_q4func(mainpic);
