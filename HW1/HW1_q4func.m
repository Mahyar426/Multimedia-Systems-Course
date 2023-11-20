function [mse_nearest,mse_bilinear,mse_bicubic] = HW1_q4func(pic)
%% Mahyar Onsori 9632093
%% nearest
nearest_pic_small=imresize(pic,0.8,'nearest');
nearest_pic=imresize(nearest_pic_small,1.25,'nearest');
%% bicubic
bicubic_pic_small=imresize(pic,0.8,'bicubic');
bicubic_pic=imresize(bicubic_pic_small,1.25,'bicubic');
%% bilinear
bilinear_pic_small=imresize(pic,0.8,'bilinear');
bilinear_pic=imresize(bilinear_pic_small,1.25,'bilinear');
%% Calculating MSE using problem.2 function
mse_nearest=HW1_MSE(pic,nearest_pic);
mse_bilinear=HW1_MSE(pic,bilinear_pic);
mse_bicubic=HW1_MSE(pic,bicubic_pic);
%% Showing all pictures
figure,imshow(pic),title('\fontsize{16}{\color{blue}Original Picture}')
figure,imshow(nearest_pic),title('\fontsize{16}{\color{red}Nearest Neighbour Interpolation}')
figure,imshow(nearest_pic),title('\fontsize{16}{\color{green}Bilinear Interpolation}')
figure,imshow(nearest_pic),title('\fontsize{16}{\color{black}Bicubic Interpolation}')