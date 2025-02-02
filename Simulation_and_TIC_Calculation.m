% Simulation and TIC Calculation

% Time span
tspan = 0:1:40; % 0 to 40 hours

% Initial conditions (adjust based on your system)
X0 = 0.1;    % Initial bacteria concentration (g/L)
S0 = 20;     % Initial substrate (g/L)
N0 = 5;      % Initial nitrogen (g/L)
P0 = 0;      % Initial product (g/L)
DCW0 = X0;   % Initial DCW (assumed equal to X)
y0 = [X0, S0, N0, P0, DCW0];

% Solve ODEs using assumed parameters (replace with your model)
[t, Y] = ode45(@bioreactor_ode, tspan, y0);

% Extract simulated results
X_sim = Y(:,1);
S_sim = Y(:,2);
N_sim = Y(:,3);
P_sim = Y(:,4);
DCW_sim = Y(:,5);

% Load experimental data (replace with your data)
% Synthetic data for demonstration:
X_exp = X_sim + 0.1*randn(size(X_sim));
P_exp = P_sim + 0.05*randn(size(P_sim));

% Calculate TIC for X and P
TIC_X = sum(abs(X_sim - X_exp)) / (sum(abs(X_sim)) + sum(abs(X_exp)));
TIC_P = sum(abs(P_sim - P_exp)) / (sum(abs(P_sim)) + sum(abs(P_exp)));

fprintf('TIC for Bacteria (X): %.4f\n', TIC_X);
fprintf('TIC for Product (P): %.4f\n', TIC_P);

% Plot results
figure;
subplot(2,1,1);
plot(t, X_sim, 'b-', t, X_exp, 'ro');
xlabel('Time (h)'); ylabel('X (g/L)'); legend('Simulated', 'Experimental');

subplot(2,1,2);
plot(t, P_sim, 'b-', t, P_exp, 'ro');
xlabel('Time (h)'); ylabel('P (g/L)'); legend('Simulated', 'Experimental');

% Problem 2: Parameter Estimation and Validation

% Define parameters to estimate (mu_max_X and mu_max_P)
params0 = [0.5, 0.1]; % Initial guesses

% Experimental data (stacked as [X_exp, P_exp])
data_exp = [X_exp, P_exp];

% Perform optimization to find mu_max
params_opt = lsqcurvefit(@bioreactor_model, params0, tspan, data_exp);

% Simulate with optimized parameters
[~, Y_opt] = ode45(@(t,y) bioreactor_ode(t, y, params_opt), tspan, y0);
X_opt = Y_opt(:,1);
P_opt = Y_opt(:,4);

% Plot validation results
figure;
plot(t, X_opt, 'g--', t, X_exp, 'ro', t, P_opt, 'g--', t, P_exp, 'bo');
xlabel('Time (h)'); ylabel('Concentration (g/L)');
legend('X Simulated', 'X Experimental', 'P Simulated', 'P Experimental');

% ODE Function (replace with your model equations)
function dydt = bioreactor_ode(t, y, params)
    X = y(1); S = y(2); N = y(3); P = y(4); DCW = y(5);
    
    % Parameters (default or estimated)
    if nargin < 3
        mu_max_X = 0.5;   % Max growth rate (1/h)
        mu_max_P = 0.1;   % Max product rate (1/h)
    else
        mu_max_X = params(1);
        mu_max_P = params(2);
    end
    
    Ks = 0.1;   % Substrate saturation (g/L)
    Kn = 0.05;  % Nitrogen saturation (g/L)
    Yxs = 0.4;  % Yield coefficient
    
    % Growth rate (Monod kinetics)
    mu = mu_max_X * (S / (Ks + S)) * (N / (Kn + N));
    
    % ODEs
    dXdt = mu * X;
    dSdt = -mu / Yxs * X;
    dNdt = -mu / Yxs * X * 0.1;  % Assuming nitrogen consumption
    dPdt = mu_max_P * X;
    dDCWdt = dXdt;  % DCW = X + other biomass (simplified)
    
    dydt = [dXdt; dSdt; dNdt; dPdt; dDCWdt];
end

% Model function for parameter estimation
function F = bioreactor_model(params, t, y0)
    [~, Y] = ode45(@(t,y) bioreactor_ode(t, y, params), t, y0);
    F = [Y(:,1), Y(:,4)]; % Extract X and P for comparison
end