function [b] = plotSurface(field, s)
% Plot field component or magnitude as surface in a plane
% input: field and struct containing plot information
% Output: none

% Generate data for plot
[data, b]=getCompInPlane(field, s);
% Desired spatial grid
n=length(data(:,1));
dp=1;
d_dim1=(floor(min(data(:,1))):dp:ceil(max(data(:,1))));
d_dim2=(floor(min(data(:,2))):dp:ceil(max(data(:,2))));
[g_dim1, g_dim2]=meshgrid(d_dim1, d_dim2);
% Make the surface using linear regression
B=griddata(data(:,1), data(:,2), data(:,3), g_dim1, g_dim2);
% plot the surface
figure(1)
surf(g_dim1, g_dim2, B)
% Scatter plot measurements
hold on
plot3(data(:,1), data(:,2), data(:,3), 'o')
hold off
xlabel(s.dim1_str)
ylabel(s.dim2_str)
zlabel(s.B_choice)
end

