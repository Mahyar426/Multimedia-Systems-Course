function local_image=hw2_local_histeq(image,n)
%% Defining Parameters
image8=uint8(image);
[x,y]=size(image8);
xrem=mod(x,n);
yrem=mod(y,n);
newx=x+(n-xrem);
newy=y+(n-yrem);
image_zp=uint8(zeros(newx,newy));
selected=zeros(n,n);
%% Creating Zero-pad Image
for i=1:x
    for j=1:y
        image_zp(i,j)=image8(i,j);
    end
end
%% Selecting Windows from Image and Calling Previous Function
for k=1:n:newx
    for l=1:n:newy
        for a=k:k+n-1
            for b=l:l+n-1
                selected(a-k+1,b-l+1)=image_zp(k,l);
            end
        end
        mask=hw2_histeq(selected);
        for c=k:k+n-1
            for d=l:l+n-1
               image_zp(k,l)=mask(c-k+1,d-l+1);
            end
        end
    end
end
%% Creating Final Image
for e=1:x
    for f=1:y
        local_image(e,f)=image_zp(e,f);
    end
end
%%
imhist(image);
figure;
imhist(local_image);
end