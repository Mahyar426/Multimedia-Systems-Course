function [hiide,MeanSquaredError]=hw2_hide(image,logo,L)
%image=uint8(image);
[m,n]=size(image);
squared=0;
sum=0;
difference=zeros(m,n);
Squares_sum=zeros(1,1);
%% Creating Watermarked Picture
logo=imresize(logo,size(image));
I=dither(logo);
for i=1:m
    for j=1:n
        hiide(i,j)=bitset(image(i,j),L,I(i,j));
    end
end
b=bitget(image,L);
%% Calculating MSE
Subtract=abs(image-hiide);%% Creating Subtract Matrix
Squared=(double(Subtract)).^2; %%We convert to double since it was originally uint8 and had the limit of 255
for k=1:m
    for l=1:n
        Squares_sum=Squares_sum+Squared(k,l);
    end
end
nump=m*n;
MeanSquaredError=Squares_sum/nump;
%% Showing Images
figure,imshow(image),title('Original Image');
figure,imshow(hiide),title('Watermarked Image');
disp("MSE is : ");
disp(MeanSquaredError);
end