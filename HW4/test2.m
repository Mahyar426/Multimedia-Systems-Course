clc
clear all
close all
I=imread('Low.bmp');
J=imread('High.bmp');
m=4;
n=2;
test=H4_hybrid(I,J,m,n);