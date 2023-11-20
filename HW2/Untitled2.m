clc
clear all
close all
%% Definition of Parameters
image=imread('Hi.tif');
[m,n]=size(image);
h=zeros(256,1);
prob_h=zeros(256,1);
cdf_h=zeros(256,1);
%% Creating Vector h
for i=1:m
    for j=1:n
        for c=0:255
            if(image(i,j)==c)
                h(c+1,1)=h(c+1,1)+1;
            end
        end
    end
end
%% Calculating CDF
prob_h=h/(m*n);
for k=1:256
    for l=1:k
        cdf_h(k,1)=cdf_h(k,1)+prob_h(l,1);
        l=l+1;
    end
end
%%
eq=255*cdf_h;
for r=1:m
    for s=1:m
        temp=image(r,s)+1;
        J(r,s)=uint8(eq(temp,1));
    end
end
%%