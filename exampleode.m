% Define global parameters
global k1 k2
k1 = 1.0; % Example value for k1
k2 = 0.5; % Example value for k2

% Initial conditions
C0 = [1.0; 0.0; 0.0]; % Initial concentrations: [C1(0), C2(0), C3(0)]

% Time span for the simulation
tspan = [0, 10];

% Solve the ODE
[t, C] = ode45(@exampleode, tspan, C0);

% Plot results
plot(t, C(:, 1), 'r', t, C(:, 2), 'g', t, C(:, 3), 'b');
legend('C1', 'C2', 'C3');
xlabel('Time');
ylabel('Concentration');
title('Concentration vs. Time');
