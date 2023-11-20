%% Mahyar Onsori 9632093
function J=HW3_dct(I,K,t)
%% Parameters
[x,y]=size(I);
xrem=mod(x,K);
yrem=mod(y,K);
newx=x+(K-xrem);
newy=y+(K-yrem);
selected=zeros(K,K);
fit_image=imresize(I,[newx,newy]);
counter_d=0;
final_pic=zeros(newx,newy);
d=zeros(K,K);
%% DCT and Inverse DCT
for i=1:K:newx-K+1
    for j=1:K:newy-K+1
        selected(:,:)=fit_image(i:i+K-1,j:j+K-1); %% Selecting a K*K frame of image
        selected=uint8(selected); %% converting selected frame from double to uint8
        d=dct2(selected); %% calculating DCT for frame
        for a1=1:K
            for b1=1:K
                if(abs(d(a1,b1))<t)
                    d(a1,b1)=0; %% applying a thereshold to DCT result
                    counter_d=counter_d+1;
                end
            end
        end
        rc=uint8(idct2(d)); %% rc is the result of inverse DCT
        final_pic(i:i+K-1,j:j+K-1)=rc; %%placing rc into a K*K frame of final result
    end        
end
J=uint8(final_pic);
%% Displaying Images and Showing results
imshow(fit_image);
title('Original Image');
figure;
imshow(J);
title('Reformed Image');
figure;
Diference=abs(fit_image-uint8(final_pic));
imshow(Diference);
title('Diference');

d_percentage=100*(counter_d/(newx*newy));
pSNR=psnr(uint8(final_pic),fit_image);

disp('Percentage of coefficients which their value is zero is :');
disp(d_percentage);
disp('PSNR=');
disp(pSNR);
end