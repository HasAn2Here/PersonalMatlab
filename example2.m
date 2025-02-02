% MATLAB Code to Determine Slope, Intercept, and Validate Model

% Data
raw_material_concentration = [1, 3, 7, 10, 15, 20, 25, 30, 35]; % g/L
product_concentration = [0.64, 0.78, 0.84, 1.07, 1.2, 1.34, 1.68, 1.78, 2.2]; % g/L

% Perform linear regression to determine slope and intercept
coeffs = polyfit(raw_material_concentration, product_concentration, 3); % Linear fit
disp(coeffs);
slope = coeffs(1);
intercept = coeffs(2);

% Generate model predictions
simulated_concentration = polyval(coeffs, raw_material_concentration);

% Calculate Theil's Inequality Coefficient (TIC)
N = length(product_concentration);
numerator = sum(sqrt((simulated_concentration - product_concentration).^2));
denominator = sum(sqrt(simulated_concentration.^2) + sqrt(product_concentration.^2));
TIC = numerator / denominator;

% Display results
fprintf('Slope: %.4f\n', slope);
fprintf('Intercept: %.4f\n', intercept);
fprintf("Theil's Inequality Coefficient (TIC): %.4f\n", TIC);

% Plot experimental data vs simulated model
figure;
plot(raw_material_concentration, product_concentration, 'ro', 'MarkerSize', 8, 'DisplayName', 'Experimental Data');
hold on;
plot(raw_material_concentration, simulated_concentration, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Model Prediction');
hold off;
grid on;
xlabel('Raw Material Concentration (g/L)');
ylabel('Product Concentration (g/L)');
title('Model vs Experimental Data');
legend('Location', 'Best');

