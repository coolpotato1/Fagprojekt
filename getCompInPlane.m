function [ planecomp, x] = getCompInPlane(field, s)
% Determine which component and plane to be saved to planeComp matrix
dim1=getFieldColumn(s.dim1_str);
dim2=getFieldColumn(s.dim2_str);
dim3=thirdDimension(getFieldColumn(s.dim1_str),getFieldColumn(s.dim2_str));
if(strcmp(s.B_choice,'abs'))
    B=calcMagnitude(field(:,4), field(:,5), field(:,6));
else
    B=field(:,getFieldColumn(s.B_choice));
end

% Determine number of rows in planeComp
nf=length(field(:,1));
np=0;
for i=1:nf
    if (field(i, dim3)>s.dim3_min && field(i, dim3)<s.dim3_max)
       np=np+1; 
    end
end

if(np<10)
    x=1;
else
    x=0;
end
% Allocate space for planecomp
planecomp=zeros(np,3);
% Put in data to planecomp
k=1;
for i=1:nf
   if (field(i, dim3)>s.dim3_min && field(i, dim3)<s.dim3_max)
       planecomp(k, 1)=field(i, dim1);
       planecomp(k, 2)=field(i, dim2);
       planecomp(k, 3)=B(i);
       k=k+1;
   end
end




