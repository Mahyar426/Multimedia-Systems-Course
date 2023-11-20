function K=H4_hybrid(I,J,sd_low,sd_high)
%% Mahyar Onsori 9632093
% for best performance use sd_low=4 , sd_high=2
%% Images
I=rgb2gray(I);
J=rgb2gray(J);
J=imresize(J,size(I));
%% Creating Filters
hi=fspecial('gaussian',[25,25],sd_low);
hj=fspecial('gaussian',[25,25],sd_high);
%% Filtering Images
I_g=imfilter(I,hi);
j_g=imfilter(J,hj);
%% Creating Final Picture
J_g=J-0.4*j_g;
K=0.5*I_g+0.5*J_g;
imshow(K,[]);
end