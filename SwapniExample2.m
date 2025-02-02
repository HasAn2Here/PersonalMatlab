% Problem 2: Using a Cubic Polynomial for Fitting

% Data
raw_material_conc = [1, 3, 7, 10, 15, 20, 25, 30, 35]; % Raw material concentration (g/L)
product_conc = [0.64, 0.78, 0.84, 1.07, 1.2, 1.34, 1.68, 1.78, 2.2]; % Product concentration (g/L)

% Fit a cubic polynomial (degree 3)
p_cubic = polyfit(raw_material_conc, product_conc, 3);

% Coefficients of the cubic polynomial
disp('Coefficients of the cubic polynomial (highest to lowest degree):');
disp(['a3 = ', num2str(p_cubic(1))]);
disp(['a2 = ', num2str(p_cubic(2))]);
disp(['a1 = ', num2str(p_cubic(3))]);
disp(['a0 = ', num2str(p_cubic(4))]);

% Predict product concentration for raw material concentration = 100 g/L
raw_material_100 = 100; % g/L
predicted_conc_100 = polyval(p_cubic, raw_material_100);

% Display result
disp(['Predicted product concentration for raw material concentration = 100 g/L: ', num2str(predicted_conc_100), ' g/L']);

% Plot results
figure;
plot(raw_material_conc, product_conc, 'ro-', 'DisplayName', 'Experimental Data');
hold on;
fitted_conc = polyval(p_cubic, raw_material_conc);
plot(raw_material_conc, fitted_conc, 'b--', 'DisplayName', 'Cubic Fit');
scatter(100, predicted_conc_100, 'k', 'filled', 'DisplayName', 'Predicted at 100 g/L');
xlabel('Raw Material Concentration (g/L)');
ylabel('Product Concentration (g/L)');
title('Cubic Fit of Product vs Raw Material Concentration');
legend;
grid on;
hold off;
