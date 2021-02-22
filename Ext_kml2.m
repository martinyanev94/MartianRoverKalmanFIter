clear all
% close all
%% Load files
load ('SDF2018b.mat')
%% Constants
P=1:1:1000; 
N=1001;
dt=60;% time step
a=0.005*10^(-3); % acceleration magnitude
u=0.01; % velocity magnitude

delta_X= 50; % measurement standard deviation
delta_Y=50;
delta_R=50;% measurement standard deviation
% delta_Vx=a*dt; delta_Vy=a*dt;
%% initial conditions 
Xk=[X(1) Y(1) Vx(1) Vy(1)]'; %added manualy
uk=[Vx(1)/dt;Vy(1)/dt]; %added manualy

dx=0.5*a*dt^2;
dy=dx;
dvx=a*dt;
dvy=dvx;
dRan=dt;

A=[1 0 dt 0; 
     0 1 0 dt;
     0 0 1 0;
     0 0 0 1]; % velocity design


% H=[1 0 0 0 0;
%    0 1 0 0 0;
%    0 0 1 0 0;
%    0 0 0 1 0
%    0 0 0 0 1];
R=delta_R^2; % velocity maybe 0 maybe velocity magnitude correct

%% Errors
Wk=0; %error is 0 for now(to be changed)
Zk=0; %for now observation error
Qk=[dx^2 0 0 0;
    0 dy^2 0 0;
    0 0 dvx^2 0;
    0 0 0 dvy^2 ];
w=1;

%% Find initial process covarience matrix
Pk= [ 3.6563*10^3 0 0 0;
       0 1.483*10^4 0 0;
       0 0 1*10^-4 0;
       0 0 0 1*10^-4]

%% Trajectory
XX = zeros(4, size(1:1:1000,2)); %KF data
YY = zeros(4, size(1:1:1000,2)); %sensor data
ZZ = zeros(4, size(1:1:1000,2)); %predicted data  
%% Step state
for i=1:numel(Step)
 %H matrix
H=Hjacob(Xk);
%% Predicted state
Xkp=A*Xk; %estimated prediction 
% Xkp=A*Xk+Wk+B*uk ;
% uk=[Xk(3)/dt; Xk(4)/dt];
%%  Find predicted process covarience matrix 
Pkp=(A*Pk*A'+w*Qk);
%% Find Kalman gain
K=(Pkp*H')/(H*Pkp*H'+R);
%% New observation (no Z no this step)
% Yk=[X(i); Y(i); Vx(i); Vy(i); R_mes(i)]; % observations correct
%% Calcolating the current state (use Xkp Yk)
Xk=Xkp+K*(R_mes(i)-Range(Xkp));
%% Update process covarience metrix
Pk=(1-K*H)*Pkp;
%% Colect data
 XX(:,i) = Xk;
 ZZ(:,i) = Xkp;
 YY(:,i) = R_mes(i);
end

%% Plot data
figure
plot(1:1:1000, XX(1,:)), hold on;
plot(1:1:1000, YY(1,:)), hold on;
plot(1:1:1000, ZZ(1,:));
legend('Kalman filter','measurement','estimate');

figure
plot(1:1:1000, XX(2,:)), hold on;
plot(1:1:1000, YY(2,:)), hold on;
plot(1:1:1000, ZZ(2,:));
legend('Kalman filter','measurement','estimate');

figure
plot(1:1:1000, XX(3,:)), hold on;
plot(1:1:1000, YY(3,:)), hold on;
plot(1:1:1000, ZZ(3,:));
legend('Kalman filter','measurement','estimate');

figure
plot(1:1:1000, XX(4,:)), hold on;
plot(1:1:1000, YY(4,:)), hold on;
plot(1:1:1000, ZZ(4,:));
legend('Kalman filter','measurement','estimate');

figure
plot( XX(1,:), XX(2,:)), hold on;
plot( YY(1,:), YY(2,:)), hold on;
plot( ZZ(1,:), ZZ(2,:));
legend('Kalman filter','measurement','estimate');



