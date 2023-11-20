clc
clear all
close all
image=imread('Hi.tif');
J=hw2_histeq(image);
imhist(image);
figure;
imhist(J);