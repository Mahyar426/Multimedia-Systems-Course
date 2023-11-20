%% Mahyar Onsori 9632093
function J=hist_median(image)
%% Parameters
image=uint8(image);
[m,n]=size(image);
h=zeros(256,1);
h1=zeros(256,1);
pixels=zeros(256,1);
half=zeros(256,1);
q1=zeros(256,1);
q2=zeros(256,1);
counter_half=1;
counter_q1=1;
counter_q2=1;
J=zeros(m,n);
%% Creating Histogram
for i=1:m
    for j=1:n
        for c=0:255
            if(image(i,j)==c)
                h(c+1,1)=h(c+1,1)+1;
            end
        end
    end
end
plot(h,'b');
title('Histogram of Original Picture');
%% Calculating T0,T01,T02
for k=0:255
    for l=0:k
    pixels(k+1,1)=pixels(k+1,1)+h(l+1,1);
    end
    if(pixels(k+1,1)>(floor(m*n)/2))
        half(counter_half,1)=k;
        counter_half=counter_half+1;
    end
    if(pixels(k+1,1)>(floor(m*n)/4))
        q1(counter_q1,1)=k;
        counter_q1=counter_q1+1;
    end
    if(pixels(k+1,1)>(floor(3*(m*n)/4)))
        q2(counter_q2,1)=k;
        counter_q2=counter_q2+1;
    end
end
T0=half(1,1);
T01=q1(1,1);
T02=q2(1,1);
%% Quantizing the Image
for x=1:m
    for y=1:n
    if (image(x,y)<T01)
        J(x,y)=0;
    end
    if ((image(x,y)>T01) && (image(x,y)<T0))
        J(x,y)=1;
    end
    if ((image(x,y)>T0) && (image(x,y)<T02))
        J(x,y)=2;
    end
    if (image(x,y)>T02)
        J(x,y)=3;
    end
    end
end
%% Histogram of New Picture
for i=1:m
    for j=1:n
        for c=0:255
            if(uint8(85*J(i,j)==c))
                h1(c+1,1)=h1(c+1,1)+1;
            end
        end
    end
end
figure;
plot(h1,'r');
title('Histogram of Created Picture');
%%
figure;
imshow(J,[]);
%imshow(uint8(J*85));
%we can alter line 82 and 83 with each other and they give same result and
%I have disabled one of them
end
