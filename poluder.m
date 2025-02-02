% Given data
m = [9, 55, 141, 267, 345, 531];
t = [1, 3, 5, 7, 8, 10];

% Polynomial fitting of degree 2
coeff = polyfit(t, m, 2);

% Generate new time points
newtime = 1:30;

% Evaluate the polynomial at new time points
pred = polyval(coeff, newtime);

% Derivative of the polynomial
derv = polyder(coeff);

% Evaluate the derivative at specific points
derved = polyval(derv, [0, 10]);

% Plotting the polynomial
figure;
plot(newtime, pred, 'b-', 'LineWidth', 1.5); % Fitted polynomial
hold on;
scatter(t, m, 'r', 'filled'); % Original data points
xlabel('Time');
ylabel('Values');
title('Polynomial Fit and Data Points');
legend('Fitted Polynomial', 'Original Data Points', 'Location', 'best');
grid on;
hold off;

% Display derivative results
disp('Derivative evaluated at t = 0 and t = 10:');
disp(derved);
