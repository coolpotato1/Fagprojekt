function [ ] = plot3dScatter(field, s)
%UNTITLED4 This function creates a 3-dimensional scatter plot of a
%2-dimensional sub-section of the field. dim1 and dim2 are the chosen
%dimensions one wants to view, and dim3_const is the height where one wants
%the 3rd dimension to be cut. The field parameter is just the data input,
%and B_choice lets the user decide if they want to view a scatterplot for
%the absolute magnitude, or for a magnitude in a chosen direction.

dim3=thirdDimension(getFieldColumn(s.dim1_str),getFieldColumn(s.dim2_str));
measurements_2d = getCompInPlane(field, s);
scatter3(measurements_2d(:,1), measurements_2d(:,2), measurements_2d(:,3), 'blue');
xlabel(s.dim1_str)
ylabel(s.dim2_str)

end

