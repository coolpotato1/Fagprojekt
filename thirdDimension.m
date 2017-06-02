function [ dim3 ] = thirdDimension(dim1, dim2)
% Returns the third dimensionk
%  The function takes two dimensions as input and returns the third.
% x=1, y=2, z=3
% Input: dim1, dim2 (example 1 and 2 for x and y)
% Output: dim3 (example 3 if input is 1 and 2)
    if (dim1==1 && dim2==2) ||(dim2==1 && dim1==2)
        dim3=3;
    elseif (dim1==2 && dim2==3) || (dim2==2 && dim1==3)
        dim3=1;
    else
        dim3=2;
    end 
end

