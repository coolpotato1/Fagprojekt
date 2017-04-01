function [ D ] = calcMagnitude(A, B, C)
%This function takes the measured magnitudes in the 3 directions and
%returns an absolute magnitude.

D=sqrt(A.^2+B.^2+C.^2);
end

