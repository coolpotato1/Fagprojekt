%testHall2Field
csv_in=csvread('dummyData.csv');
field=HallVoltages2Field(csv_in);

figure(1)
subplot(1,3,1)
plot(field(:,1),field(:,4),'b-')
ylim=[-0.0001,0.0001]
subplot(1,3,2)
plot(field(:,2),field(:,5),'b-')
ylim=[-0.01,0.01]
subplot(1,3,3)
plot(field(:,3),field(:,6),'b-')
ylim=[-0.01,0.01]
