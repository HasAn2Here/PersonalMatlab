% MATLAB Simulation for Batch Mode Operation

% Initial Conditions
S0 = 40; % Substrate concentration (g/L)
N0 = 0.6; % Nitrogen concentration (g/L)
X0 = 0.4; % Bacteria concentration (g/L)
P0 = 0.1; % Product concentration (g/L)
tspan = [0 40]; % Time range (hours)

% Stoichiometric and Kinetic Parameters
params.Yxs = 0.48; % Biomass yield over substrate (g Biomass/g glucose)
params.YxN = 8.9; % Biomass yield over nitrogen (g Biomass/g N)
params.Yps = 0.30; % Product yield over substrate (g P/g glucose)
params.mu_x_max = 0.41; % Maximum specific bacteria growth rate (1/h)
params.mu_p_max = 0.18; % Maximum specific production rate (1/h)
params.Ks = 1.2; % Saturation constant for substrate (g/L)
params.Kn = 0.254; % Saturation constant for nitrogen (g/L)
params.Kps = 4.1; % Saturation constant for production rate (g/L)
params.Xm = 68; % Maximum residual cell concentration (g/L)
params.alpha = 5.8; % Cell density inhibition coefficient

% System of ODEs
function dCdt = batchMode(t, C, params)
    % Extract state variables
    S = C(1); N = C(2); X = C(3); P = C(4);

    % Extract parameters
    mu_x_max = params.mu_x_max;
    mu_p_max = params.mu_p_max;
    Ks = params.Ks;
    Kn = params.Kn;
    Kps = params.Kps;
    Xm = params.Xm;
    alpha = params.alpha;
    Yxs = params.Yxs;
    YxN = params.YxN;
    Yps = params.Yps;

    % Calculate kinetics
    mu_x = mu_x_max * (S / (Ks + S)) * (N / (Kn + N)) * (1 - (X / Xm)^alpha);
    mu_p = mu_p_max * (S / (Kps + S));
    mu_S = mu_x / Yxs + mu_p / Yps;
    mu_N = mu_x / YxN;

    % Define differential equations
    dSdt = -mu_S * X;
    dNdt = -mu_N * X;
    dXdt = mu_x * X;
    dPdt = mu_p * X;

    % Return derivatives as a column vector
    dCdt = [dSdt; dNdt; dXdt; dPdt];
end

% Solve ODEs using ode45
initial_conditions = [S0, N0, X0, P0];
[t, C] = ode45(@(t, C) batchMode(t, C, params), tspan, initial_conditions);

% Extract Results
S = C(:, 1); % Substrate concentration
N = C(:, 2); % Nitrogen concentration
X = C(:, 3); % Bacteria concentration
P = C(:, 4); % Product concentration
DCW = X + P; % Total biomass (DCW)

% Plot Results
figure;
plot(t, S, 'b', 'DisplayName', 'Substrate (S)');
hold on;
plot(t, N, 'g', 'DisplayName', 'Nitrogen (N)');
plot(t, X, 'r', 'DisplayName', 'Bacteria (X)');
plot(t, P, 'm', 'DisplayName', 'Product (P)');
plot(t, DCW, 'k--', 'DisplayName', 'Total Biomass (DCW)');
xlabel('Time (h)');
ylabel('Concentration (g/L)');
title('Batch Mode Simulation');
legend('Location', 'Best');
grid on;
hold off;
