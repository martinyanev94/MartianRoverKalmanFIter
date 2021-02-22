function [ pos, vel, alt ] = RadarEKF( z, dt)
%checked
%
persistent A Q R
persistent x P
persistent firstRun

if isempty(firstRun)
    A=eye(3) + dt*[0 1 0;0 0 0;0 1 0]; %note the 8th number in the matrix equals to 1, in order to set non constant Y movement
    Q=[0.5*0.005*10^(-3)*dt^2 0 0;
        0 0.005*10^(-3)*dt 0; 
        0 0 0.5*0.005*10^(-3)*dt^2];
    
    R=50; % measurement standard deviation
    
    x=[-2471.4 0.015 -2543.4]';
    
    P=[ 3.6563*10^3 0 0;
        0 1*10^-4 0% to be changed
        0 0 1.483*10^4;];
        
    firstRun=1;
end
H=Hjacob(x);

xp=A*x;
Pp=A*P*A'+Q;

K=Pp*H'/(H*Pp*H'+R);

x=xp+K*(z-hx(xp));
P=Pp-K*H*Pp;

pos=x(1);
vel=x(2);
alt=x(3);
    
    


end

