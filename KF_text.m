%% Load data

%% Initial state
 % X0=Initial position X
 %Y0=Initial position Y
 %Vx0=Initial velocity X
 %Vy0=Initial vlocity Y
 %ax= initial acceleration X(const for now)
 %ay=Initial acceleration Y(const for now)
 
 %X0k-1= [X0;Y0;Vx0;Vy0] State matrix(previous state, initial state) 
 % acc matrix uk= [ax;ay]
%% Predict Future state
% Xkp=predicted state
% A= convert previous state with respect to time
% B= convert acc matrix in respect to time
% wk= error in future state prediction

% Xkp= A*Xk-1 +B*uk+wk

%% Find initial(previous) process covarience matrix (only once)
% x_i= individual measurement
% x_dash=average of measurement
% N=number of measurements
% sigma_x^2= (sum(x_dash-X_i)^2)/N
% sigma_y^2= (sum(y_dash-y_i)^2)/N
% sigma_x*sigma_y=sum(x_dash-x_i)*(y_dash-y_i)
% we may add velocity covarience(two more terms)
% Pk-1=[ sigma_x^2 sigma_x*sigma_y;
%        sigma_y*sigma_x sigma_y^2]
%% Find predicted process covarience matrix
% Qk= error in calculating process covarience
% Pkp=A*Pk-1*A^-1+ Qk predicted PCM
%% Find Kalman gain
% K=kalman gain
% H= matrix changing the format of Pkp to K
% R= matrix of observation error(should be in the same format as PCM)
% ,delta_X, delta_Y, delta_Vx, delta_Vy
%
% K=(Pkp*H^-1)/(H*Pkp*H^-1+R)
%% New observation (no Z no this step)
% Yk= new observation with calculated error
% C=matrix converting Ykm to Yk
% Ykm= observation without calculated error
% Zk=error due to electronics delay
% Yk=C*Ykm+Zk
%% Calcolating the current state (use Xkp Yk)
% Xk=Xkp+K[Yk-H*Xkp]
%% Update process covarience metrix
% Pk=updated covarience matrix
% I= Identity matrix
% Pk=[I-K*H]*Pkp
%% Determine new state and process covarience matrix
%Xk--->Xk-1
%Pk--->Pk-1


 
