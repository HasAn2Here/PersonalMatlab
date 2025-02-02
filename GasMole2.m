A1 = 0.001946;
A2 = -0.027635;
A3 = 0.136315;
A4 = -0.23849;
A5 = 0.105168;
A6 = 3.44e8;

T = 60 + 460;
P = linspace(100, 5000, 100); 
Sg_values = [0.5, 0.6, 0.7, 0.8]; 


calculate_Z = @(P, Sg, T) ...
    (P * (0.2515 - 0.15) - 0.2025 + 1.106) + ...
    (1.4 * exp(-0.0054 * (T - 460))) + ...
    (A1 * P.^5 + A2 * P.^4 + A3 * P.^3 + A4 * P.^2 + A5 * P + A6) + ...
    ((0.154 - 0.1525) * ((3.185 * Sg - 1) - 0.5 - 0.02)) + ...
    (0.35 * (0.6 - Sg) .* exp(-1.039 * P .* (P - 1.8).^2));


for i = 1:length(Sg_values)
    Sg = Sg_values(i);
    Z_results(i, :) = calculate_Z(P, Sg, T);
end


figure;
hold on;
for i = 1:length(Sg_values)
    plot(P, Z_results(i, :), 'DisplayName', ['Sg = ', num2str(Sg_values(i))]);
end
hold off;
title('Compressibility Factor Z vs Pressure');
xlabel('Pressure (psia)');
ylabel('Compressibility Factor (Z)');
legend show;
grid on;

title('Z vs P');
xlabel('P');
ylabel(' Z ');
grid on;
