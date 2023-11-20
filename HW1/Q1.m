function [m,n]=Q1(pic)
%% Mahyar Onsori 9632093
%% Size Enquiry
[m,n]=size(pic);
q=ceil(m/4);
r=ceil(n/4);
%% Defining Pictures' Matrices
pic_horizontal_flip=zeros(m,n);
pic_transpose=zeros(m,n);
pic_cropped=zeros(2*q,2*r);
pic_down_shift=zeros(m,n);
pic_left_shift=zeros(m,n);
pic_up_shift=zeros(m,n);
pic_right_shift=zeros(m,n);
pic_diagonal_upright=zeros(m,n);
pic_diagonal_upleft=zeros(m,n);
pic_diagonal_downright=zeros(m,n);
pic_diagonal_downleft=zeros(m,n);
%% Original Picture
imshow(pic),title('\fontsize{16}{\color{blue}Original Picture}')
%% Horizontal Flip
for j=1:m
  for i=1:n
    pic_horizontal_flip(j,n+1-i)=pic(j,i);
  end
end
figure,imshow(uint8(pic_horizontal_flip)),title('\fontsize{16}{\color{red}Horizontal Flip}')
%% Transpose
for i=1:m
    for j=1:n
        pic_transpose(j,i)=pic(i,j);
    end
end
figure,imshow(uint8(pic_transpose)),title('\fontsize{16}{\color{black}Tanspose}')
%% Cropped
for i=q:m-q
    for j=r:n-r
        pic_cropped(i-q+1,j-r+1)=pic(i,j);
    end
end
figure,imshow(uint8(pic_cropped)),title('\fontsize{16}{\color{green}Cropped}')
%% Right Shift
for i=1:m
    for j=1:n
        if(j<n-1)
        pic_right_shift(i,j+2)=pic(i,j);
        end
        if(j>=n-1)
            pic_right_shift(i,j-n+2)=pic(i,j);
        end
    end
end
figure,imshow(uint8(pic_right_shift)),title('\fontsize{16}{\color{blue}Right Shift}')
%% Left Shift
for i=1:m
    for j=1:n
        if(j>2)
        pic_left_shift(i,j-2)=pic(i,j);
        end
        if(j<=2)
            pic_left_shift(i,n-2+j)=pic(i,j);
        end
    end
end
figure,imshow(uint8(pic_left_shift)),title('\fontsize{16}{\color{red}Left Shift}')
%% Up Shift
for j=1:n
    for i=1:m
        if(i>2)
            pic_up_shift(i-2,j)=pic(i,j);
        end
        if(i<=2)
            pic_up_shift(m-2+i,j)=pic(i,j);
        end
    end
end
figure,imshow(uint8(pic_up_shift)),title('\fontsize{16}{\color{black}Up Shift}')
%% Down Shift
for j=1:n
    for i=1:m
        if(i<m-1)
            pic_down_shift(i+2,j)=pic(i,j);
        end
        if(i>=m-1)
            pic_down_shift(i-m+2,j)=pic(i,j);
        end
    end
end
figure,imshow(uint8(pic_down_shift)),title('\fontsize{16}{\color{green}Down Shift}')
%% Diagonal Up Right
for i=1:m
    for j=1:n
        if(j<n-1)
        pic_diagonal_upright(i,j+2)=pic_up_shift(i,j);
        end
        if(j>=n-1)
            pic_diagonal_upright(i,j-n+2)=pic_up_shift(i,j);
        end
    end
end
figure,imshow(uint8(pic_diagonal_upright)),title('\fontsize{16}{\color{blue}Diagonal Up Right}')
%% Diagonal Up Left
for i=1:m
    for j=1:n
        if(j>2)
        pic_diagonal_upleft(i,j-2)=pic_left_shift(i,j);
        end
        if(j<=2)
            pic_diagonal_upleft(i,n-2+j)=pic_left_shift(i,j);
        end
    end
end
figure,imshow(uint8(pic_diagonal_upleft)),title('\fontsize{16}{\color{black}Diagonal Up Left}')
%% Diagonal Down Right
for i=1:m
    for j=1:n
        if(j<n-1)
        pic_diagonal_downright(i,j+2)=pic_right_shift(i,j);
        end
        if(j>=n-1)
            pic_diagonal_downright(i,j-n+2)=pic_right_shift(i,j);
        end
    end
end
figure,imshow(uint8(pic_diagonal_downright)),title('\fontsize{16}{\color{red}Diagonal Down Right}')
%% Diagonal Down Left
for i=1:m
    for j=1:n
        if(j>2)
        pic_diagonal_downleft(i,j-2)=pic_left_shift(i,j);
        end
        if(j<=2)
            pic_diagonal_downleft(i,n-2+j)=pic_left_shift(i,j);
        end
    end
end
figure,imshow(uint8(pic_diagonal_downleft)),title('\fontsize{16}{\color{green}Diagonal Down Left}')
%%
