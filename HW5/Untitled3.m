clc
clear all
close all
I=imread('berbatov.jpg');
w=50;
new_color=[30,210,30];
changed=color_change(I,w,new_color);