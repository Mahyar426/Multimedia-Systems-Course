function attack_proj( W_image, B, a, K,W2D)
%% Parameters
[dim1_W,dim2_W]=size(W_image);
WB1=mod(dim1_W,B);
WB2=mod(dim2_W,B);
new_dim1_W=dim1_W-WB1;
new_dim2_W=dim2_W-WB2;
Number_of_Rowblocks=new_dim1_W/B;
Number_of_Columnblocks=new_dim2_W/B;
%% Writing Images
imwrite(W_image,'Image60.jpg','jpg','Quality',60); 
imwrite(W_image,'Image80.jpg','jpg','Quality',80);
imwrite(W_image,'Image100.jpg','jpg','Quality',100);
%% Reading Images
image60=imread('Image60.jpg');
image80=imread('Image80.jpg');
image100=imread('Image100.jpg');
%% Extracting Data From Attacked Images
counter=1;
reW1D_60=zeros(1,Number_of_Rowblocks*Number_of_Columnblocks);
reW1D_80=zeros(1,Number_of_Rowblocks*Number_of_Columnblocks);
reW1D_100=zeros(1,Number_of_Rowblocks*Number_of_Columnblocks);
for i=1:B:new_dim1_W-B+1
    for j=1:B:new_dim2_W-B+1
        
        selected60=image60(i:i+B-1,j:j+B-1);
        selected80=image80(i:i+B-1,j:j+B-1);
        selected100=image100(i:i+B-1,j:j+B-1);

        dct_selected60=dct2(selected60);
        dct_selected80=dct2(selected80);
        dct_selected100=dct2(selected100);

        if( dct_selected60(a+1,a) > dct_selected60(a,a+1) )
            reW1D_60(1,counter)=1;
        end
        if ( dct_selected60(a,a+1) >= dct_selected60(a+1,a) )
            reW1D_60(1,counter)=0;
        end
        
        if( dct_selected80(a+1,a) > dct_selected80(a,a+1) )
            reW1D_80(1,counter)=1;
        end
        if ( dct_selected80(a,a+1) >= dct_selected80(a+1,a) )
            reW1D_80(1,counter)=0;
        end
        
        if( dct_selected100(a+1,a) > dct_selected100(a,a+1) )
            reW1D_100(1,counter)=1;
        end
        if ( dct_selected100(a,a+1) >= dct_selected100(a+1,a) )
            reW1D_100(1,counter)=0;
        end
         counter=counter+1;
   
    end
end
%% Decryption and Producing Bitstreams
W1D_60=zeros(1,Number_of_Rowblocks*Number_of_Columnblocks);
W1D_80=zeros(1,Number_of_Rowblocks*Number_of_Columnblocks);
W1D_100=zeros(1,Number_of_Rowblocks*Number_of_Columnblocks);

rng(K);
Order60=randperm(Number_of_Rowblocks*Number_of_Columnblocks);
[~,Order60]=sort(Order60);
W1D_60=reW1D_60(Order60);

rng(K);
Order80=randperm(Number_of_Rowblocks*Number_of_Columnblocks);
[~,Order80]=sort(Order80);
W1D_80=reW1D_80(Order80);

rng(K);
Order100=randperm(Number_of_Rowblocks*Number_of_Columnblocks);
[~,Order100]=sort(Order100);
W1D_100=reW1D_100(Order100);
%% Creating 2D Watermarks using produced bitstreams
W2D_60=zeros(Number_of_Rowblocks,Number_of_Columnblocks);
W2D_80=zeros(Number_of_Rowblocks,Number_of_Columnblocks);
W2D_100=zeros(Number_of_Rowblocks,Number_of_Columnblocks);

for cd=1:Number_of_Rowblocks
    W2D_60(cd,:)=W1D_60(1,(cd-1)*Number_of_Columnblocks+1:cd*Number_of_Columnblocks);
end

for cd=1:Number_of_Rowblocks
    W2D_80(cd,:)=W1D_80(1,(cd-1)*Number_of_Columnblocks+1:cd*Number_of_Columnblocks);
end

for cd=1:Number_of_Rowblocks
    W2D_100(cd,:)=W1D_100(1,(cd-1)*Number_of_Columnblocks+1:cd*Number_of_Columnblocks);
end
%% Making W2D to a 1D vector
W2D=imresize(W2D,[Number_of_Rowblocks,Number_of_Columnblocks]);
W1D=zeros(1,Number_of_Rowblocks*Number_of_Columnblocks);
for c=1:Number_of_Rowblocks
    for d=1:Number_of_Columnblocks
        W1D(1,(c-1)*Number_of_Columnblocks + d)=W2D(c,d);
    end
end
%% Calculating NC Using NC_calculator Function which I sent with files
NC60=NC_calculator(W1D,W1D_60);
NC80=NC_calculator(W1D,W1D_80);
NC100=NC_calculator(W1D,W1D_100);
%% Showing Watermarks
figure;
subplot(2,3,[1 2 3]);
imshow(W2D);
title('Original');
subplot(2,3,4);
imshow(W2D_60);
title(['NC60 = ',num2str(NC60)])
subplot(2,3,5);
imshow(W2D_80);
title(['NC80 = ',num2str(NC80)])
subplot(2,3,6);
imshow(W2D_100);
title(['NC100 = ',num2str(NC100)])
%% Displaying Results
disp ('NC for JPG Image with Quality= 60 is ');
disp(NC60);
disp ('NC for JPG Image with Quality= 80 is ');
disp(NC80);
disp ('NC for JPG Image with Quality= 100 is ');
disp(NC100);
end