% Define temperatures in Celsius, Fahrenheit, and Rankine
tc = 0:15:100;
tf = 1.8*tc + 32;
tr = tf + 459.69;

% Combine temperatures into one matrix
t = [tc; tf; tr];

% Plot Celsius vs Fahrenheit
figure;
plot(tc, tf, 'b-', 'LineWidth', 2);  % Blue line with thicker width
xlabel('Temperature in Celsius (°C)');
ylabel('Temperature in Fahrenheit (°F)');
title('Celsius to Fahrenheit Conversion');
grid on;  % Enable grid for better readability
