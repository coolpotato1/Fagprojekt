function [ c ] = getFieldColumn(str)

if strcmp(str, 'x')
    c=1;
elseif strcmp(str, 'y')
    c=2;
elseif strcmp(str, 'z')
    c=3;
elseif strcmp(str, 'Bx')
    c=4;
elseif strcmp(str, 'By')
    c=5;
elseif strcmp(str, 'Bz')
    c=6;
else 
    fprintf('ERROR!');
    c=1;
end

