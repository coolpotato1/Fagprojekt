function [ planeComp ] = getCompInPlane(field, dim1_str, dim2_str, a, comp)
% Determine which component and planes to be saved to planeComp matrice
dim1=getFieldColumn(dim1_str);
dim2=getFieldColumn(dim2_str);
dim3=abs(dim1+dim2-4*(dim1-1)-2*(dim2-2));
B=getFieldColumn(comp);

% Determine number of rows in planeComp
nf=length(field(:,1));
np=0;
for i=1:nf
    if field(i, dim3)==a
       np=np+1; 
    end
end

% Allocate space for planeComp
planeComp=zeros(np,3);
% Put in data to planeComp
k=1;
for i=1:nf
   if field(i, dim3)==a
       planeComp(k, 1)=field(i, dim1);
       planeComp(k, 2)=field(i, dim2);
       planeComp(k, 3)=field(i, B);
       k=k+1; 
   end
end

