% This script saves a CSV file with simulated field data.
% The data is generated using the equations for a theoretical field
% around a long straight current carrying wire. 
% The current flows in the postive x direction, and the points close to the
% wire are ignored/not generated.

%% Define a (np X 3) matrix containing the x, y, z positions in cm
dp=1;
pmin=0;
pmax=40;
position=(pmin:dp:pmax);
np=length(position);
%% Define the field array and define x, y, z data
field=ones(np^3,6);
nf=np^3;
i=1;
while i <= nf
    for ix=1:np
        for iy=1:np
            for iz=1:np
               field(i, 1)=position(ix);
               field(i, 2)=position(iy);
               field(i, 3)=position(iz);
               i=i+1;
            end 
        end 
    end 
end 
%% Add small errors to x, y, z values
% set seed
rng(511);
% Define (nf X 3) matrice with disturbances in range [-0.05 cm, 0.05 cm],
% and add this to position
d_pos=(rand(nf,3)-0.5).*0.05;
field(:,[1:3])=field(:,[1:3])+d_pos;
%% Calculate field components for each position
% B= a_phi mu_0 I / (2*pi*r)
% mu_0*I/(2*pi)=k_B
mu_0=4*pi*10^(-7);
I=15;
k_B=mu_0*I/(2*pi);
% Bx=0
field(:,4)=0;
% By=-k_B (z-z0)/r^2 = k_B zc/r^2
% Bz=k_B (y-y0)/r^2 = k_B yc/r^2
% r^2=(y-y0)^2+(z-z0)^2
y0=pmax/2;
z0=pmax/2;
r_squared=(field(:,2)-y0).^2+(field(:,3)-z0).^2;
yc=field(:,2)-y0;
zc=field(:,3)-z0;
field(:,5)=-k_B*(zc./r_squared.^2);
field(:,6)=k_B*(yc./r_squared.^2);
%% remove measurements where wire exists
o_ymin=18;
o_ymax=22;
o_zmin=18;
o_zmax=22;
k=1;
while k<=length(field(:,1))
    y_objecthit=field(k,2)>=o_ymin && field(k,2) <= o_ymax;
    z_objecthit=field(k,3)>=o_zmin && field(k,3) <= o_zmax;
    if y_objecthit && z_objecthit
        field(k,:)=[];
    else 
        k=k+1;
    end
end
nf1=length(field(:,1));
%% Add small errors to field components
% set seed
rng(988)
% Define (nf X 3) matrix with disturbances of [-1 nT, 1 nT]
d_f=(rand(nf1, 3)-0.5).*10^(-9);
field(:,[4:6])=field(:,[4:6])+d_f;
%% Plot
figure(1)
subplot(1,2,1)
x=field(:,1);
y=field(:,2);
z=field(:,3);
scatter3(x,y,z, 'k.')
subplot(1,2,2)
plot(y,z, 'r.')
%% save to csv file
csvwrite('testDataMatrix.csv', field);
