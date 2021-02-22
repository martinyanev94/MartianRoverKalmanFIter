% Plot data
% Run Stnd_kalmn
% Ruin Untitled
% Run Untitled 3
% Run this code
close all

figure
plot(1:1:1000, YY2(1,:)), hold on;
plot(1:1:1000, XX2(1,:)), hold on;
plot(1:1:1000, XX1(1,:)), hold on;
plot(1:1:1000, XX(1,:)), hold on;
xlabel('Time [min]');ylabel('X coordinate [m]')
legend('Measurement','W = 10','W = 1','W = 0.1');
set(0, 'DefaultLineLineWidth', 2);

figure
plot(1:1:1000, YY2(2,:)), hold on;
plot(1:1:1000, XX2(2,:)), hold on;
plot(1:1:1000, XX1(2,:)), hold on;
plot(1:1:1000, XX(2,:)), hold on;
xlabel('Time [min]');ylabel('Y coordinate [m]')
legend('Measurement','W = 10','W = 1','W = 0.1');
set(0, 'DefaultLineLineWidth', 2);


figure
plot(1:1:1000, YY2(3,:)), hold on;
plot(1:1:1000, XX2(3,:)), hold on;
plot(1:1:1000, XX1(3,:)), hold on;
plot(1:1:1000, XX(3,:)), hold on;
xlabel('Time [min]');ylabel('X Velocity [m/s]')
legend('Measurement','W = 10','W = 1','W = 0.1');
set(0, 'DefaultLineLineWidth', 2);

figure
plot(1:1:1000, YY2(4,:)), hold on;
plot(1:1:1000, XX2(4,:)), hold on;
plot(1:1:1000, XX1(4,:)), hold on;
plot(1:1:1000, XX(4,:)), hold on;
xlabel('Time [min]');ylabel('Y Velocity [m/s]')
legend('Measurement','W = 10','W = 1','W = 0.1');
set(0, 'DefaultLineLineWidth', 2);

figure
plot( YY2(1,:), YY2(2,:)), hold on;
plot( XX2(1,:), XX2(2,:)), hold on;
plot( XX1(1,:), XX1(2,:)), hold on;
plot( XX(1,:), XX(2,:)), hold on;
xlabel('X coordinate [m]');ylabel('Y coordinate [m]')
legend('Measurement','W = 10','W = 1','W = 0.1');
set(0, 'DefaultLineLineWidth', 2);
