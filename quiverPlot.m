function [  ] = quiverPlot( field)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
quiver3(field(:,1), field(:,2), field(:,3), field(:,4), field(:,5), field(:,6), 3)
title('Quiverplot of the magnetic field in 3 dimensions')
xlabel('x')
ylabel('y')
zlabel('z')

end

