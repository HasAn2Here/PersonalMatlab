a = 7;
b = 12;
c = 21;
x = 1:10;
y = zeros(size(x)); 
for i = 1:length(x)
    if x(i) < 5
        y(i) = x(i) * b; 
    elseif x(i) == 5
        y(i) = a^2 * sqrt(x(i)); 
    else
        y(i) = (2 * c) / x(i); % Condition: x > 5
    end
end
figure;
plot(x, y, '-o', 'LineWidth', 1.5, 'MarkerSize', 6);
xlabel('x', 'FontSize', 12);
ylabel('y = f(x)', 'FontSize', 12);
title('Plot of f(x) vs x', 'FontSize', 14);
grid on;
set(gca, 'FontSize', 10);
legend('f(x)', 'Location', 'best');