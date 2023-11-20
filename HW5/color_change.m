function new_pic=color_change(I,w,new_color)
%% Mahyar Onsori 9632093
%%
%I=imread('Hi.jpg');
[m,n,p]=size(I);
new_pic=I;
%% Getting a Point from User
imshow(I);
% let the user pick one point
[column,row]=ginput(1);
column=round(column);
row=round(row);
% plot point on the original image
hold on
plot(column,row,'xg','MarkerSize',20,'LineWidth',2);
% w=50;
% new_color=[30,210,30];
%% Substituing Colors
for i=1:m
    for j=1:n
        if( ((I(i,j,1)>=(I(row,column,1))-w) && (I(i,j,1)<(I(row,column,1))+w)) && ((I(i,j,2)>=(I(row,column,2))-w) && (I(i,j,2)<(I(row,column,2))+w)) && ((I(i,j,3)>=(I(row,column,3)-w)) && (I(i,j,3)<(I(row,column,3)+w))) )
            new_pic(i,j,1)=new_color(1,1);
            new_pic(i,j,2)=new_color(1,2);
            new_pic(i,j,3)=new_color(1,3);
        end
    end
end
%%
figure;
imshow(new_pic);
end