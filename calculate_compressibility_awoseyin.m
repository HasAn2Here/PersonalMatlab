P = linspace(100, 5000, 100); % Pressure range (psia)
T = 600; % Temperature (Rankine)
S_g = 0.65; % Specific gravity
A = [0.001946, -0.027635, 0.136315, 0.23849, 0.105168, 3.44e8]; 
% Empirical constants

Z = calculate_compressibility_awoseyin(P, T, S_g, A);

% Plot Z vs Pressure
plot(P, Z, 'LineWidth', 1.5);
xlabel('Pressure (psia)');
ylabel('Compressibility Factor (Z)');
title('Compressibility Factor vs Pressure');
grid on;
