function MeanSquaredError = HW1_MSE(pic1,pic2)
%% Mahyar Onsori 9632093
%% Size Enquiry
[m,n]=size(pic1); %Since both Pictures have same size dimensions,we can also choose pic2 instead of pic1
%% Calculating The Sum of Squared Errors
Subtract=pic1-pic2;%% Creating Subtract Matrix
Squared=(double(Subtract)).^2; %%We convert to double since it was originally uint8 and had the limit of 255 
Squares_sum=sum(sum(Squared)); %%We use sum of sum because sum of an Matrix returns a vector
nump=m*n;
MeanSquaredError=Squares_sum/nump;
end

