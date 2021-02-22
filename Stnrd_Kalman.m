%estimate a new state from predicted
%and measured one
% clear all
close all
%% Load files
load ('SDF2018b.mat')
%% Constants
P=1:1:1000; 
N=1001;
dt=60;% time step
a=0.005*10^(-3); % acceleration magnitude
u=0.01; % velocity magnitude

delta_X= 50; % measurement standard deviation
delta_Y=50; % measurement standard deviation
% delta_Vx=a*dt; delta_Vy=a*dt;
%% initial conditions 
Xk=[X(1);Y(1);Vx(1);Vy(1)]; %added manualy
uk=[Vx(1)/dt;Vy(1)/dt]; %added manualy

dx=0.5*a*dt^2;
dy=dx;
dvx=a*dt;
dvy=dvx;

A=[1 0 dt 0; 
    0 1 0 dt;
    0 0 1 0;
    0 0 0 1]; % velocity design

B=[0.5*dt^2 0;  
    0 0.5*dt^2;
    1 0
    0 1]; % acceleration design

H=[1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];

R=[ delta_X^2 0 0 0;
    0 delta_Y^2 0 0;
    0 0 delta_X^2 0;
    0 0 0 delta_Y^2]; 
C=[1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];

I=[1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];
%% Errors
Wk=0;
Zk=0;
Qk=[dx^2 0 0 0;
    0 dy^2 0 0;
    0 0 dvx^2 0;
    0 0 0 dvy^2];
w=1;

%% Find initial process covarience matrix
Pk= [ 3.6563*10^3 0 0 0;
       0 1.483*10^4 0 0;
       0 0 1*10^-4 0;
       0 0 0 1*10^-4];
g=1
%% Trajectory
XX1 = zeros(4, size(1:1:1000,2)); %KF data
YY1 = zeros(4, size(1:1:1000,2)); %sensor data
ZZ1 = zeros(4, size(1:1:1000,2)); %predicted data  
%% Step state
for i=1:numel(Step)
 % to be changed
%% Predicted state
Xkp=A*Xk+Wk; %estimated prediction 
% Xkp=A*Xk+Wk+B*uk ;
% uk=[Xkp(3)/dt; Xkp(4)/dt];
%%  Find predicted process covarience matrix 
Pkp=(A*Pk*A'+w*Qk);
%% Find Kalman gain
K=(Pkp*H')/(H*Pkp*H'+g*R);
%% New observation (no Z no this step)
Yk=[X(i); Y(i); Vx(i); Vy(i)]; % observations correct
%% Calcolating the current state (use Xkp Yk)
Xk=Xkp+K*(Yk-H*Xkp);
%% Update process covarience metrix
Pk=(I-K*H)*Pkp;
%% Colect data
 XX1(:,i) = Xk;
 ZZ1(:,i) = Xkp;
 YY1(:,i) = Yk;
end


 % Plot data
 figure
 plot(1:1:1000, XX(1,:)), hold on;
 plot(1:1:1000, YY(1,:)), hold on;
 plot(1:1:1000, ZZ(1,:));
 xlabel('Time [min]');ylabel('X coordinate [m]')
 legend('Kalman filter','measurement','estimate');
 set(0, 'DefaultLineLineWidth', 1.5);
 
 figure
 plot(1:1:1000, XX(2,:)), hold on;
 plot(1:1:1000, YY(2,:)), hold on;
 plot(1:1:1000, ZZ(2,:));
 xlabel('Time [min]');ylabel('Y coordinate [m]')
 legend('Kalman filter','measurement','estimate');
 set(0, 'DefaultLineLineWidth', 1.5);
 
 figure
 plot(1:1:1000, XX(3,:)), hold on;
 plot(1:1:1000, YY(3,:)), hold on;
 plot(1:1:1000, ZZ(3,:));
 xlabel('Time [min]');ylabel('X Velocity [m/s]')
 legend('Kalman filter','measurement','estimate');
 set(0, 'DefaultLineLineWidth', 1.5);
 
 figure
 plot(1:1:1000, XX(4,:)), hold on;
 plot(1:1:1000, YY(4,:)), hold on;
 plot(1:1:1000, ZZ(4,:));
 xlabel('Time [min]');ylabel('Y Velocity [m/s]')
 legend('Kalman filter','measurement','estimate');
 set(0, 'DefaultLineLineWidth', 1.5);
 
 figure
 plot( XX1(1,:), XX1(2,:)), hold on;
 plot( ZZ1(1,:), ZZ1(2,:));
 xlabel('X coordinate [m]');ylabel('Y coordinate [m]')
 legend('Kalman filter','measurement','estimate');
 set(0, 'DefaultLineLineWidth', 2);



