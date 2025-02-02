% MATLAB Code for Calculating Compressibility Factor Z

% Constants
T_F = 60; % Temperature in Fahrenheit
T = T_F + 460; % Convert to Rankine

P = linspace(100, 5000, 100); % Pressure range (psia)
Sg_vals = [0.5, 0.6, 0.7, 0.8]; % Specific gravities

% Given coefficients
A1 = 0.001946;
A2 = -0.027635;
A3 = 0.136315;
A4 = 0.23849;
A5 = 0.105168;
A6 = 3.44e8;

% Initialize storage for results
Z_results = zeros(length(Sg_vals), length(P));

% Loop through each specific gravity
for j = 1:length(Sg_vals)
    Sg = Sg_vals(j);
    
    % Calculate terms
    F1 = @(P) P .* (0.251 * Sg - 0.15) - 0.202 * Sg + 1.106;
    F2 = @(P) 1.4 * exp(-0.0054 * (T - 460));
    F3 = @(P) A1 * P.^5 + A2 * P.^4 + A3 * P.^3 + A4 * P.^2 + A5 * P;
    F4 = @(P) (0.154 - 0.152 * Sg) .* P.^(3.185 * Sg - 1) .* exp(-0.5 * P) - 0.02;
    F5 = @(P) 0.35 * (0.6 - Sg) .* exp(-1.039 * (P - 1.8).^2);
    F6 = @(P) 1 ./ (1 + ((A6 * P .* 10.^(1.7855 * Sg)) ./ (T^3.825)));
    
    % Compressibility factor Z calculation
    Z = @(P) F1(P) .* (F6(P) + F2(P) + F3(P)) + F4(P) + F5(P);
    
    % Compute Z for the current specific gravity
    Z_results(j, :) = Z(P);
end

% Plotting the results
figure;
hold on;
colors = lines(length(Sg_vals));
for j = 1:length(Sg_vals)
    plot(P, Z_results(j, :), 'LineWidth', 1.5, 'DisplayName', sprintf('Sg = %.1f', Sg_vals(j)), 'Color', colors(j, :));
end
xlabel('Pressure (psia)');
ylabel('Compressibility Factor (Z)');
title('Compressibility Factor Z vs Pressure for Various Specific Gravities');
legend('Location', 'Best');
grid on;
hold off;

