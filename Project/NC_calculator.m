function NC = NC_calculator ( bitstream1,bitstream2 )
[m1,n1]=size(bitstream1);
[m2,n2]=size(bitstream2);

if( (m1==m2) && (n1==n2) )
    Sum=0;
    for i=1:m1
        for j=1:n1
            if ( bitstream1(i,j) == bitstream2(i,j) )
                Sum=Sum+1;
            end
        end
    end
    NC=Sum/(m1*n1);        
    
else
    disp(' Error! Entered Bitstreams have different lengths!! ');
    NC=0/0;

end