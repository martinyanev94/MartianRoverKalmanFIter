clear all
close all
%checked
% Note the plot X vs Y is straight line. This is because radar measurements
% are applied equaly to both displacements
load('SDF2018b')
dt=60;
t=0:dt:59940;

Nsamples=length(t);

Xsaved=zeros(Nsamples,3);
Zsaved=zeros(Nsamples,1);

for k=1:Nsamples
    r=R_mes(k);
    
    [pos, vel, alt]=RadarEKF(r,dt);
    
    Xsaved(k,:)= [pos, vel, alt];
    Zsaved(k)=r;
end

PosSaved=Xsaved(:,1);
VelSaved=Xsaved(:,2);
AltSaved=Xsaved(:,3);

t=0:dt:Nsamples*dt-dt;

figure
plot(t,PosSaved), hold on
plot(t,X)
legend('Radar','Sensor measurement')
ylabel('X coordinate [m]');xlabel('Time [s]')

figure
plot(t,VelSaved)
legend('Radar Velocity')
xlabel('X coordinate [m]');ylabel('Y coordinate [m]')

figure
plot(t,AltSaved),hold on
plot(t,Y)
legend('Radar','Sensor measurement')
ylabel('Y coordinate [m]');xlabel('Time [s]')


figure
plot(PosSaved,AltSaved), hold on
plot(X,Y)
legend('Radar', 'Sensor measurement')

