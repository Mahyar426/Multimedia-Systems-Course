clc
clear all
close all
image=imread('Hi.tif');
logo=imread('iut.tif');
L=1;
[hidden,error]=hw2_hide(image,logo,L);