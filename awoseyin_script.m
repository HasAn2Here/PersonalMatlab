% Constants
A = [0.001946, -0.027635, 0.136315, 0.23849, 0.105168, 3.44e8];  % A1 to A6
T = 519.67;  % Temperature in Rankine
P = 100:100:5000;  % Pressure range in psia
S_g_values = [0.5, 0.6, 0.7, 0.8];  % Specific gravities

% Plot results for each specific gravity
figure;
hold on;
for S_g = S_g_values
    % Call the function to calculate Z
    Z = calculate_compressibility_awoseyin(P, T, S_g, A);
   
    % Plot Z vs P
    plot(P, Z, 'DisplayName',sprintf('S_g = %.1f', S_g), 'LineWidth', 2);
end

% Customize plot
grid on;
xlabel('Pressure (psia)');
ylabel('Compressibility Factor (Z)');
title('Compressibility Factor vs Pressure for Different Specific Gravities');
legend show;
