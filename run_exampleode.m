% Define global variables
global k1 k2
k1 = 1.0; % Example value for k1
k2 = 0.5; % Example value for k2

% Initial conditions
C0 = [1.0; 0.0; 0.0]; % Initial concentrations: [C1(0), C2(0), C3(0)]

% Time span for the simulation
tspan = [0, 10]; % Simulate from t=0 to t=10

% Solve the ODE
[t, C] = ode45(@exampleode, tspan, C0);

% Plot results
figure;
plot(t, C(:, 1), 'r', 'LineWidth', 1.5); hold on;
plot(t, C(:, 2), 'g', 'LineWidth', 1.5);
plot(t, C(:, 3), 'b', 'LineWidth', 1.5);
hold off;
legend('C1', 'C2', 'C3');
xlabel('Time');
ylabel('Concentration');
title('Concentration vs. Time');
grid on;
