function [ C, m_i, m_a ] = plot4dScatter(field, s)
%This function shows the position of all the measurements, and then
%represents the magnitude of the B-field at a given point, by color-coding
%the dots.
F=getField(field, s);
F(:,4)=abs(F(:,4));
maks=max(F(:,4));
F(F(:,4)<maks*s.sort,:)=[];
m_i=min(log(F(:,4)));
m_a=max(log(F(:,4)));
a=1/(m_a-m_i);
b=a*m_i;
z=zeros(length(F),1);
C=[(a*log(F(:,4))-b) 1-a*log(F(:,4))+b z];
%scatter3(1, 1, 1, 2, [0, 255, 0])
scatter3(F(:,1),F(:,2),F(:,3),20000/length(F),C);
xlabel('x [mm]');
ylabel('y [mm]');
zlabel('z [mm]');
if(strcmp(s.B_choice,'abs'))
  titl=sprintf('3D Scatterplot of the magnetic flux density (Magnitude) [T]');
else
    titl=sprintf('3D Scatterplot of the magnetic flux density (%s) [T]', s.B_choice);
end
title(titl);
end

