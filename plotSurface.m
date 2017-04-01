function [] = plotSurface(data, s)
% Plot field component or magnitude in a plane
% input: 
%   An array where row 1 is coordinates in one dimension, and row 2 is
%   coordinates in another dimension. Row 3 is the value of a field component
%   in the spatial coordinates.
%   A struct specifying the spatial dimensions as strings (that is dim1_str
%   and dim2_str), and a string specifying the component of the B field(
%   that is B_str)
% Output: none

% Desired spatial grid
n=length(data(:,1));
dp=1;
g_dim1=(floor(min(data(:,1))):dp:ceil(max(data(:,1))));
g_dim2=(floor(min(data(:,2))):dp:ceil(max(data(:,2))));
B=griddata(data(:,1), data(:,2), data(:,3), g_dim1, g_dim2);

    
end

