%HallVoltages2Field.m
function [field] = HallVoltages2Field(labviewData)

% Constants
U_offset=0.0001;
beta=100;

Ux1=labviewData(:,4);
Ux2=labviewData(:,5);
Uy1=labviewData(:,6);
Uy2=labviewData(:,7);
Uz1=labviewData(:,8);
Uz2=labviewData(:,9);

% Determine field components
Bx=beta*(Ux1+Ux2-2*U_offset)/2;
By=beta*(Uy1+Uy2-2*U_offset)/2;
Bz=beta*(Uz1+Uz2-2*U_offset)/2;

% Define field matrix
% 1: px
% 2: py
% 3: pz
% 4: Bx
% 5: By
% 6: Bz

field=[labviewData(:,1), labviewData(:,2), labviewData(:,3), Bx, By, Bz];
end 


