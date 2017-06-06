%% init
clear;
clc;
%% Load values
start_x=50;
start_y=50;
end_x=100;
end_y=110;
end_h=20;
precision=15;
%probe_size in radius
probe_size=15;
size_x=200;
size_y=200;
height=50;
%% Bottom part
bot_nlodret=floor((start_y-probe_size)/precision);
bot_nvandret=floor(size_x/precision);
%x start out in
x = 0:precision:size_x;
y = repmat(start_y-probe_size-bot_nlodret*precision,1,length(0:precision:size_x));

for i=1:1:bot_nlodret
    if mod(i,2) == 0
        x=[x,0:precision:size_x];
    else
        x=[x,fliplr(0:precision:size_x)];
    end
    y=[y,repmat(start_y-probe_size-(bot_nlodret-i)*precision,1,length(0:precision:size_x))];
end

%% Left or right part
if mod(bot_nlodret,2)==1
    %Left
    left_nlodret=ceil(((end_y+probe_size)-(start_y-probe_size+precision))/precision);
    for i=1:1:left_nlodret
        if mod(i,2) == 0
            x=[x,start_x-probe_size:-precision:0];
        else
            x=[x,fliplr(start_x-probe_size:-precision:0)];
            
        end
        y=[y,repmat(start_y-probe_size+precision*i,1,length(start_x-probe_size:-precision:0))];
    end
    
else
    %Right
    right_nlodret=ceil(((end_y+probe_size)-(start_y-probe_size+precision))/precision);
    for i=1:1:right_nlodret
        if mod(i,2) == 0
            x=[x,end_x+probe_size:precision:size_x];
        else
            x=[x,fliplr(end_x+probe_size:precision:size_x)];
        end
        y=[y,repmat(start_y-probe_size+precision*i,1,length(end_x+probe_size:precision:size_x))];
    end
end

%% Top part
top_nlodret=floor((size_y-end_y+probe_size)/precision);
top_nvandret=floor(size_x/precision);
% Starting from left
if mod(bot_nlodret,2)==1
    for i=0:1:top_nvandret
       if mod(i,2)==0
           y=[y,end_y+probe_size:precision:size_y];
       else
           y=[y,fliplr(end_y+probe_size:precision:size_y)];
       end
    x = [x,repmat(i*precision,1,length(end_y+probe_size:precision:size_y))];
    end
%Starting from right    
else
    for i=top_nvandret:-1:0
       if mod(i,2)==0
           y=[y,end_y+probe_size:precision:size_y];
       else
           y=[y,fliplr(end_y+probe_size:precision:size_y)];
       end
    x = [x,repmat(i*precision,1,length(end_y+probe_size:precision:size_y))];
    end
end

%% Remaining left or right part
if mod(bot_nlodret,2)==0
    %Left
    left_nlodret=ceil(((end_y+probe_size)-(start_y-probe_size+precision))/precision);
    for i=1:1:left_nlodret
        if mod(i,2) == 0
            x=[x,start_x-probe_size:-precision:0];
        else
            x=[x,fliplr(start_x-probe_size:-precision:0)];
            
        end
        y=[y,repmat(end_y+probe_size-precision*i,1,length(start_x-probe_size:-precision:0))];
    end
    
else
    %Right
    right_nlodret=ceil(((end_y+probe_size)-(start_y-probe_size+precision))/precision);
    for i=1:1:right_nlodret
        if mod(i,2) == 0
            x=[x,end_x+probe_size:precision:size_x];
        else
            x=[x,fliplr(end_x+probe_size:precision:size_x)];
        end
        y=[y,repmat(end_y+probe_size-precision*i,1,length(end_x+probe_size:precision:size_x))];
    end
    
end
n=length(x);
x_temp=x;
y_temp=y;
z=zeros(1,n);
%% Adding z layers
for i=1:1:height/precision
    x=[x,x_temp];
    y=[y,y_temp];
    z=[z,repmat(i*precision,1,n)];
end
%% Plot af punkter
figure(1);
hold on
marg_x=[-probe_size+start_x,probe_size+end_x,probe_size+end_x,-probe_size+start_x];
marg_y=[-probe_size+start_y,-probe_size+start_y,probe_size+end_y,probe_size+end_y];
marg=fill(marg_x,marg_y,'-g','edgecolor','none');
set(marg,'facealpha',0.5)
box_x=[start_x,end_x,end_x,start_x];
boc_y=[start_y,start_y,end_y,end_y];
fill(box_x,boc_y,'r');
plot(x,y,'LineWidth', 4);
daspect([1 1 1]);
hold off
%% 3d scatter plot
figure(2);
%scatter3(x,y,z);
plot3(x,y,z);
daspect([1 1 1])