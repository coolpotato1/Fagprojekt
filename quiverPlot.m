function [  ] = quiverPlot( field, s)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
M=calcMagnitude(field(:,4), field(:,5), field(:,6));
field(abs(M)<(s.sort*max(M)),:)=[];
l=11*exp(-length(M)/1000);
w=4*exp(-length(M)/1000);
quiver3(field(:,1), field(:,2), field(:,3), field(:,4), field(:,5), field(:,6), l, 'LineWidth', w, 'Color', 'b');
title('Quiverplot of the magnetic flux density');
xlabel('x [mm]');
ylabel('y [mm]');
zlabel('z [mm]');

end

