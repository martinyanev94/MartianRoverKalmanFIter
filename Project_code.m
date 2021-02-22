%estimate a new state from predicted
%and measured one
clear all
close all
%% Load files
load ('SDF2018a.mat')
%% Inital state
delta_X= 50; % measurement standard deviation
delta_Y=50; % measurement standard deviation
delta_Vx=0; delta_Vy=0; %maybe 0
X0=[X(2);Y(2);0.01;0.01]; %added manualy
uk=[5*10^(-6);5*10^(-6)]; %added manualy
A=[1 0 60 0; 
    0 1 0 60;
    0 0 1 0;
    0 0 0 1];
B=[0.5*60^2 0;  
    0 0.5*60^2;
    60 0
    0 60];
N=1001;
H=[1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];
R=[ delta_X^2 0 0 0;
    0 delta_Y^2 0 0;
    0 0 delta_Vx^2 0;
    0 0 0 delta_Vy^2]; % velocity maybe 0 maybe velocity magnitude
C=[1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];
I=[1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];
Wk=0; %error is 0 for now(to be changed)
Qk=0; %error is 0 for now(to be changed)
Zk=0; %for now observation error
%% Find initial process covarience matrix
x_dash=mean(X);
y_dash=mean(Y);
sigmax2=(sum(x_dash-X(2)))/N;
sigmay2=(sum(y_dash-Y(2)))/N;
sigma_xy=sum((x_dash-X(2))*(y_dash-Y(2)));
Pk_1= [ sigmax2 sigma_xy;
       sigma_xy sigmay2];

%% Step state
for i=1:numel(Step)
    Xk(0)=X0
Xk(i-1)=Xk(i);
%% Predicted state
Xkp(i)=A*Xk(i-1)+B*uk+Wk; %estimated prediction uk const
%%  Find predicted process covarience matrix 
Pkp(i)=A*Pk(i-1)*A'+Qk;
%% Find Kalman gain
K(i)=(Pkp*H^(-1))/(H*Pkp*H^(-1)+R);
%% New observation (no Z no this step)
Ykm(i)=[X(i); Y(i); Vx(i); Vy(i)]; % observations
Yk(i)=C*Ykm(i)+Zk; 
%% Calcolating the current state (use Xkp Yk)
Xk(i)=Xkp(i)+K(i)*(Yk(i)-H*Xkp(i));
%% Update process covarience metrix
Pk(i)=(I-K(i)*H)*Pkp(i);
i=i-1
end
