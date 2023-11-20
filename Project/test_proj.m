%% Mahyar Onsori 9632093
%%
clc
clear all
close all
%% Reading Images
Logo=imread('iut5.bmp');
Logo=imbinarize(Logo);
Lena=imread('lena.bmp');
%% Calculating Results in Table
B=8;
Alpha=44;
K=19;
WATERmark=embed_proj(Lena,B,B/2,Logo,K,Alpha);
attack_proj(WATERmark,B,B/2,K,Logo);
% [WATERmark,PSNR,MSE]=embed_proj(Lena,B,B/2,Logo,19,Alpha);
% [NC60,NC80,NC100]=attack_proj(WATERmark,B,B/2,19,Logo);
%% Calculating Best Alpha-For Altered Functions!!
% Alpha_Iteration=100;
% Psnr=zeros(1,Alpha_Iteration);
% MSE=zeros(1,Alpha_Iteration);
% NC60=zeros(1,Alpha_Iteration);
% NC80=zeros(1,Alpha_Iteration);
% NC100=zeros(1,Alpha_Iteration);
% Mean_NC=zeros(1,Alpha_Iteration);
% QMSENC=zeros(1,Alpha_Iteration);
% QPSNRNC=zeros(1,Alpha_Iteration);
% B=10;
% for i=1:Alpha_Iteration
%       [WATERmark,Psnr(1,i),MSE(1,i)]=   embed_proj(Lena,B,B/2,Logo,19,i);
%       [NC60(1,i),NC80(1,i),NC100(1,i)]= attack_proj(WATERmark,B,B/2,19,Logo);
%       Mean_NC(1,i)=( ( NC60(1,i)+NC80(1,i)+NC100(1,i) ) /3 );
%       QMSENC(1,i)=Mean_NC(1,i)/MSE(1,i);
%       QPSNRNC(1,i)=Mean_NC(1,i)/Psnr(1,i);
%       close all
% end
