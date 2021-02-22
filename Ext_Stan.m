figure
plot( XX1(1,:), XX1(2,:)), hold on;
plot( XX(1,:), XX(2,:)), hold on;
plot( YY(1,:), YY(2,:));
xlabel('X coordinate [m]');ylabel('Y coordinate [m]')
legend('Standard Kalman filter','Extended Kalman filter','measurement');
set(0, 'DefaultLineLineWidth', 2);

figure
plot(1:1:1000, XX1(1,:)), hold on;
plot(1:1:1000, ZZ1(1,:)), hold on;
plot(1:1:1000, XX(1,:)), hold on;
plot(1:1:1000, ZZ(1,:)), hold on;
plot(1:1:1000, YY(1,:)), 
xlabel('Time [min]');ylabel('X coordinate [m]')
legend('Kalman filter','measurement','estimate');
set(0, 'DefaultLineLineWidth', 1.5);

figure
plot(1:1:1000, XX1(2,:)), hold on;
plot(1:1:1000, ZZ1(2,:)), hold on;
plot(1:1:1000, XX(2,:)), hold on;
plot(1:1:1000, ZZ(2,:)), hold on;
plot(1:1:1000, YY(2,:))
xlabel('Time [min]');ylabel('Y coordinate [m]')
legend('Kalman filter','measurement','estimate');
set(0, 'DefaultLineLineWidth', 1.5);