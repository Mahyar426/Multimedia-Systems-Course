function J=hw2_histeq(image)
%% Mahyar Onsori 9632093
%% Definition of Parameters
image8=uint8(image);
[m,n]=size(image);
h=zeros(256,1);
prob_h=zeros(256,1);
cdf_h=zeros(256,1);
%% Creating Vector h
for i=1:m
    for j=1:n
        for c=0:255
            if(image8(i,j)==c)
                h(c+1,1)=h(c+1,1)+1;
            end
        end
    end
end
%% Calculating CDF
prob_h=h/(m*n);
for k=1:256
    for l=1:k
        cdf_h(k,1)=cdf_h(k,1)+prob_h(l,1);
        l=l+1;
    end
end
%% Substituting CDF and Original Picture
eq=255*cdf_h;
for r=1:m
    for s=1:m
        temp=image8(r,s)+1;
        J(r,s)=uint8(eq(temp,1));
    end
end
end