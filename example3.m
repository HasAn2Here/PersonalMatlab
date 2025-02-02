T = [-15, -4.3, 7.5, 20.7, 29.1, 40.7, 58.1, 78, 99.2]; 
Pv = [0.667, 1.333, 2.966, 5.333, 9.00, 12.33, 29.66, 50.33, 105.32]; 

% Convert Temperature to Kelvin
T_K = T + 273.15;

% Take natural logarithms of Pv
lnPv = log(Pv);

% Antoine Equation: ln(Pv) = A - B/(T + C)
% Define the Antoine function for nonlinear fitting
antoineFun = @(params, T) params(1) - params(2) ./ (T + params(3));

% Initial guess for parameters [A, B, C]
antoineInitial = [10, 2000, 200];

% Fit the Antoine equation
antoineParams = lsqcurvefit(antoineFun, antoineInitial, T_K, lnPv);

% Riedel Equation: ln(Pv) = A + B/T + Cln(T) + DT^6
riedelFun = @(params, T) params(1) + params(2)./T + params(3)*log(T) + params(4)*T.^6;

% Initial guess for parameters [A, B, C, D]
riedelInitial = [10, -2000, 0.1, 1e-10];

% Fit the Riedel equation
riedelParams = lsqcurvefit(riedelFun, riedelInitial, T_K, lnPv);

% Harlecher–Braun Equation: ln(Pv) = A + B/T + Cln(T) + D(Pv/T^2)
hbFun = @(params, T, Pv) params(1) + params(2)./T + params(3)*log(T) + params(4)*(Pv./(T.^2));

% Initial guess for parameters [A, B, C, D]
hbInitial = [10, -2000, 0.1, 0.01];

% Fit the Harlecher–Braun equation
hbParams = lsqcurvefit(@(params, T) hbFun(params, T, Pv), hbInitial, T_K, lnPv);

% Simulated Data for All Models
antoineSim = exp(antoineFun(antoineParams, T_K));
riedelSim = exp(riedelFun(riedelParams, T_K));
hbSim = exp(hbFun(hbParams, T_K, Pv));

% Calculate Theil's Inequality Coefficient (TIC) for each model
% Define function to compute TIC
ticCalc = @(sim, exp) sqrt(sum((sim - exp).^2)) / (sqrt(sum(sim.^2)) + sqrt(sum(exp.^2)));

% TIC Values
ticAntoine = ticCalc(antoineSim, Pv);
ticRiedel = ticCalc(riedelSim, Pv);
ticHB = ticCalc(hbSim, Pv);

% Display Results
fprintf('Antoine Parameters: A = %.4f, B = %.4f, C = %.4f\n', antoineParams);
fprintf('Riedel Parameters: A = %.4f, B = %.4f, C = %.4f, D = %.4e\n', riedelParams);
fprintf('Harlecher–Braun Parameters: A = %.4f, B = %.4f, C = %.4f, D = %.4f\n', hbParams);

fprintf('TIC Antoine: %.4f\n', ticAntoine);
fprintf('TIC Riedel: %.4f\n', ticRiedel);
fprintf('TIC Harlecher-Braun: %.4f\n', ticHB);

% Plot Experimental and Model Data
figure;
hold on;
plot(T, Pv, 'ko', 'DisplayName', 'Experimental Data'); % Experimental data
plot(T, antoineSim, 'b-', 'DisplayName', 'Antoine Model'); % Antoine model
plot(T, riedelSim, 'r--', 'DisplayName', 'Riedel Model'); % Riedel model
plot(T, hbSim, 'g-.', 'DisplayName', 'Harlecher–Braun Model'); % Harlecher-Braun model
xlabel('Temperature (°C)');
ylabel('Vapor Pressure (kPa)');
title('Comparison of Experimental and Model Data');
legend('Location', 'Northwest');
grid on;


