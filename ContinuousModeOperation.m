% MATLAB Simulation for Continuous Mode Operation

% Initial Conditions
S0 = 12; % Substrate concentration (g/L)
N0 = 0.6; % Nitrogen concentration (g/L)
X0 = 0.4; % Bacteria concentration (g/L)
P0 = 0.1; % Product concentration (g/L)
tspan = [0 40]; % Time range (hours)

% Operating Parameters
params.Fs = 0.0005; % Substrate feeding rate (L/h)
params.Fn = 0.0001; % Nitrogen feeding rate (L/h)
params.V = 1; % Reactor volume (L)
params.SF = 650; % Substrate concentration in feed (g/L)
params.NF = 164; % Nitrogen concentration in feed (g/L)

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
function dCdt = continuousMode(t, C, params)
    % Extract state variables
    S = C(1); N = C(2); X = C(3); P = C(4);

    % Extract parameters
    Fs = params.Fs;
    Fn = params.Fn;
    V = params.V;
    SF = params.SF;
    NF = params.NF;
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

    % Dilution rate
    D = (Fs + Fn) / V;

    % Calculate kinetics
    mu_x = mu_x_max * (S / (Ks + S)) * (N / (Kn + N)) * (1 - (X / Xm)^alpha);
    mu_p = mu_p_max * (S / (Kps + S));
    mu_S = mu_x / Yxs + mu_p / Yps;
    mu_N = mu_x / YxN;

    % Define differential equations
    dSdt = (Fs * SF / V) - D * S - mu_S * X;
    dNdt = (Fn * NF / V) - D * N - mu_N * X;
    dXdt = mu_x * X - D * X;
    dPdt = mu_p * X - D * P;

    % Return derivatives as a column vector
    dCdt = [dSdt; dNdt; dXdt; dPdt];
end

% Solve ODEs using ode45
initial_conditions = [S0, N0, X0, P0];
[t, C] = ode45(@(t, C) continuousMode(t, C, params), tspan, initial_conditions);

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
title('Continuous Mode Simulation');
legend('Location', 'Best');
grid on;
hold off;
