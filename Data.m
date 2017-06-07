field=zeros(1000000, 8);
for i=0:999999
    field(i+1,1)=mod(i,100)+1;
    field(i+1,2)=mod(floor(i/100),100)+1;
    field(i+1,3)=floor(i/10000)+1;
    field(i+1,4)=2*2+0.0018;
    field(i+1,5)=-2*2+0.0018;
    field(i+1,6)=2*2+0.0018;
    field(i+1,7)=-2*2+0.0018;
    field(i+1,8)=2*2+0.0018;
end
csvwrite('data1.csv',field);