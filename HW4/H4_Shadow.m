function Shadow=H4_Shadow(I,s,d)
%% Mahyar Onsori 9632093
%% Parameters
[m,n]=size(I);
Shadow=zeros(m,n);
%% Creating Filter and Making Down-Right Coeffs Zero
h=fspecial('gaussian',[2*s,2*s],d);
 for i=1:size(h,1)
     for j=1:size(h,2)
         if(j>=s/2)
             h(:,j)=0;
         end
         if(i>=s/2)
             h(i,:)=0;
         end
     end
 end 
%% Creating Shadow
Image_gaussian=imfilter(I,h,'symmetric');
Shadow=0.4*I+1.6*Image_gaussian;
%% Plotting
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(Shadow,[]);
end