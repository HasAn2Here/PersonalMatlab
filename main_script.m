clear; clc;

% Define global parameters
global k1 k2
k1 = 2;
k2 = 1;

% Initial conditions and parameters
caO = 2;               % Initial concentration of Ca
tfin = 1/3;            % Final time
c0 = [caO; 0; 0];      % Initial concentrations: [Ca, Cd, Cu]

% Solve the system of ODEs
[t, c] = ode45(@exampleode, [0 tfin], c0);

% Extract concentrations
ca = c(:,1);
cd = c(:,2);
cu = c(:,3);

% Final concentrations
last = size(c, 1);
caf = c(last, 1); % Final Ca
cdf = c(last, 2); % Final Cd
cuf = c(last, 3); % Final Cu

% Display results
disp('Final concentrations:');
fprintf('CaF = %.4f\n', caf);
fprintf('CdF = %.4f\n', cdf);
fprintf('CuF = %.4f\n', cuf);

% ODE Function
function dc_dt = exampleode(t, C)
    global k1 k2
    dc_dt = zeros(3, 1); % Initialize as a column vector
    dc_dt(1) = -k1 * C(1) - k2 * C(1)^2; % dCa/dt
    dc_dt(2) = k1 * C(1);               % dCd/dt
    dc_dt(3) = k2 * C(1)^2;             % dCu/dt
end
