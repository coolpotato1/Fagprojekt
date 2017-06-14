%measVoltages2Field.m
function [field] = measVoltages2Field(labviewData)

% Constants
%We have only used values based upon ferrite calibration.
U_offset=[-0.00188 0.0021 0.0021 -0.0005 0.0019];
beta=[-0.5851 -0.5635 0.5935 0.5593 -0.5608];
B=zeros(length(labviewData(:,1)), 5);
for i=1:5
        B(:,i)=beta(i)*(labviewData(:,i+3)-U_offset(i)); 
end

%Dette er blot verdens mærkeligste if statements
Bx=(abs(B(:,1))>=abs(B(:,2))).*B(:,1)+(abs(B(:,1))<abs(B(:,2))).*B(:,2);

By=(abs(B(:,3))>=abs(B(:,4))).*B(:,3)+(abs(B(:,3))<abs(B(:,4))).*B(:,4);

Bz=B(:,5);

% Define field matrix
% 1: px
% 2: py
% 3: pz
% 4: Bx
% 5: By
% 6: Bz

field=[labviewData(:,1), labviewData(:,2), labviewData(:,3), Bx, By, Bz];
end 


