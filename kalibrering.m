X_temp=csvread('x.csv');
Y_temp=csvread('y.csv');
X=X_temp(:,x);
Y=Y_temp(:,y);
B=(max(Y)-min(Y))/(max(X)-min(X));
U_offset=-B/a;