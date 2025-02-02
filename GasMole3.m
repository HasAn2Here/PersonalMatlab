% Temperature in Rankine
T = 60 + 460; % Convert Fahrenheit to Rankine

% Pressure range (psia)
P = linspace(100, 5000, 1000); % Generate 1000 points between 100 and 5000

% Specific gravities
Sg_values = [0.5, 0.6, 0.7, 0.8];

% Initialize figure
figure; hold on;
colors = lines(length(Sg_values)); % Generate distinct colors

% Loop through specific gravities
for i = 1:length(Sg_values)
    Sg = Sg_values(i);
    
    % Compute Z using the function
    Z = computeZ(P, T, Sg);
    
    % Plot results
    plot(P, Z, 'LineWidth', 1.5, 'Color', colors(i, :), 'DisplayName', sprintf('Sg = %.1f', Sg));
end

% Customize plot
xlabel('Pressure (psia)');
ylabel('Compressibility Factor (Z)');
title('Compressibility Factor vs Pressure');
legend('Location', 'best');
grid on;
hold off;