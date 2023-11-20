function W_image = embed_proj(I, B, a, W2D, K ,alpha)
%% Parameters
[dim1_I,dim2_I]=size(I);
IB1=mod(dim1_I,B);
IB2=mod(dim2_I,B);
new_dim1_I=dim1_I-IB1;
new_dim2_I=dim2_I-IB2;
number_of_rowblocks=new_dim1_I/B;
number_of_columnblocks=new_dim2_I/B;
%% Resizing and Randomization of Logo
W2D=imresize(W2D,[number_of_rowblocks,number_of_columnblocks]);
W1D=zeros(1,number_of_rowblocks*number_of_columnblocks);
for c=1:number_of_rowblocks
    for d=1:number_of_columnblocks
        W1D(1,(c-1)*number_of_columnblocks + d)=W2D(c,d);
    end
end
rng(K);
p=randperm(size(W1D,2));
Randomly_sitting=W1D(p);
W_image=I;
%% Watermarking
counter=1;
for i=1:B:new_dim1_I-B+1
    for j=1:B:new_dim2_I-B+1
        
        selected=I(i:i+B-1,j:j+B-1);
        dct_selected=dct2(selected);
        new_dct=dct_selected;
        
        if ( Randomly_sitting(1,counter)==1 )
            if ( dct_selected(a,a+1) >= dct_selected(a+1,a) )
                new_dct(a,a+1)=dct_selected(a+1,a)-alpha/2;
                new_dct(a+1,a)=dct_selected(a,a+1)+alpha/2;
            else
                new_dct(a,a+1)=new_dct(a,a+1)-alpha/2;
                new_dct(a+1,a)=new_dct(a+1,a)+alpha/2;
            end
        end
        
        if ( Randomly_sitting(1,counter)==0 )
            if ( dct_selected(a+1,a) > dct_selected(a,a+1) )
                new_dct(a,a+1)=dct_selected(a+1,a)+alpha/2;
                new_dct(a+1,a)=dct_selected(a,a+1)-alpha/2;
            else
                new_dct(a,a+1)=new_dct(a,a+1)+alpha/2;
                new_dct(a+1,a)=new_dct(a+1,a)-alpha/2;
            end
        end
        
        Watermarked_select=idct2(new_dct);
        W_image(i:i+B-1,j:j+B-1)=uint8(Watermarked_select);
           counter=counter+1;
 
    end
end
%% Calculating PSNR and Displaying the Results
Psnr=psnr(W_image,I);
MSE=mse(W_image,I);
disp('PSNR Between Original Image and Watermarked Image is : ');
disp(Psnr);

end