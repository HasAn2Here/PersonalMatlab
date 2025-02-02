% Initial condition
Y0 = 0.15;

% Adjusted Time span
tspan = [0 1];  % Reduced time range for stability

% Define the ODE
dYdt = @(t, Y) Y^2;

% Solve the ODE with a stiff solver
[t, Y] = ode15s(dYdt, tspan, Y0);

% Check for blow-up
if any(isnan(Y)) || any(isinf(Y))
    warning('The solution contains NaN or Inf values, indicating a blow-up.');
end

% Plot the results
figure;
plot(t, Y, 'r-', 'LineWidth', 2);
xlabel('Time (t) [s]');
ylabel('Y(t)');
title('Solution of dY/dt = Y^2 (Stiff Solver)');
grid on;
legend('Y(t)');