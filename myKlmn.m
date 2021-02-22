function [ Xk,Pk ] = myKlmn( X0,Y0,Vx0,Vy0,X,Y,Vx,Vy,ax,ay,Wk,N,Qk,Ykm,Zk,delta_T,delta_X, delta_Y, delta_Vx, delta_Vy)
%estimate a new state from predicted
%and measured one
%% Inital state
X0k_1=[X0;Y0;Vx0;Vy0];
%% Step state
Xk_1=[X;Y;Vx;Vy];
uk=[ax;ay];
%% Predicted state
A=[1 0 delta_T 0; %may not be input
    0 1 0 delta_T;
    0 0 1 0;
    0 0 0 1];
B=[0.5*delta_T^2 0;   %may not be input
    0 0.5*delta_T^2;
    delta_T 0
    0 delta_T];

Xkp=A*Xk_1+B*uk+Wk;
%% Find initial process covarience matrix
x_i=X0;
y_i=Y0;
x_dash=sum(X(i))/N;
y_dash=sum(Y(i))/N;
sigma_x_2=(sum(x_dash-x_i))/N;
sigma_y_2=(sum(y_dash-y_i))/N;
sigma_xy=sum((x_dash-x_i)*(y_dash-y_i));
Pk_1= [ sigma_x_2 sigma_xy;
       sigma_xy sigma_y^2];
%%  Find predicted process covarience matrix 
Pkp=A*Pk_1*A^(-1)+Qk;
%% Find Kalman gain
H=[1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];
R=[ delta_X^2 0 0 0;
    0 delta_Y^2 0 0;
    0 0 delta_Vx^2 0;
    0 0 0 delta_Vy^2];
K=(Pkp*H^(-1))/(H*Pkp*H^(-1)+R);

%% New observation (no Z no this step)
C=[1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];
Yk=C*Ykm+Zk;
%% Calcolating the current state (use Xkp Yk)
Xk=Xkp+K*(Yk-H*Xkp);
%% Update process covarience metrix
I=[1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];
Pk=(I-K*H)*Pkp;

end

