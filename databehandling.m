%% init
clc;
clear;
%% load files
n_sensor='8';
n_meas='2';
s_voltages=['measurements/sensor_' n_sensor '/sensor_' n_sensor '_voltages_' n_meas '.csv'];
s_fields=['measurements/sensor_' n_sensor '/sensor_' n_sensor '_field_' n_meas '.csv'];
f1=csvread(s_fields);
v1=csvread(s_voltages);
%% Plot of measurements
figure(1);
subplot(1,2,1);
plot(f1,'r','Linewidth',1);
grid on
legend('Field');
subplot(1,2,2);
plot(v1,'b','Linewidth',1);
grid on
legend('Voltage');
%% Acquire data points
[f1_min,f1_min_i]=min(f1);
f1_p1=f1_min;
[f1_max,f1_max_i]=max(f1(1:f1_min_i));
f1_p2=f1_max;
[f1_max2,f1_max2_i]=max(f1(f1_min_i:end));
f1_d=diff(f1);
[f1_d_min,f1_d_i]=min(abs(f1_d(f1_max_i:f1_min_i)));
f1_p3=f1(f1_d_i+f1_max_i);
[f1_d2_min,f1_d2_i]=min(abs(f1_d(f1_min_i:f1_max2_i+f1_min_i-2)));
f1_p4=f1(f1_d2_i+f1_min_i);
[v1_min,v1_min_i]=min(v1);
v1_p1=v1_min;
[v1_max,v1_max_i]=max(v1(1:v1_min_i));
v1_p2=v1_max;
[v1_max2,v1_max2_i]=max(v1(v1_min_i:end));
v1_d=diff(v1);
[v1_d_min,v1_d_i]=min(abs(v1_d(v1_max_i:v1_min_i)));
v1_p3=v1(v1_d_i+v1_max_i);
[v1_d2_min,v1_d2_i]=min(abs(v1_d(v1_min_i:v1_max2_i+v1_min_i-2)));
v1_p4=v1(v1_d2_i+v1_min_i);
%% Linear model
x=[v1_p1,v1_p2,v1_p3,v1_p4];
y=[f1_p1,f1_p2,f1_p3,f1_p4];
linear_model=fitlm(x,y)
figure(2);
plot(linear_model)
grid on
%%
my_fit=fitlm(x,y)
b=my_fit.Coefficients.Estimate(1)
beta=my_fit.Coefficients.Estimate(2)
U_offset=-my_fit.Coefficients.Estimate(1)/beta
%%
max(abs([v1_p1*beta+b-f1_p1,v1_max*beta+b-f1_p2,v1_p3*beta+b-f1_p3,v1_p4*beta+b-f1_p4]))