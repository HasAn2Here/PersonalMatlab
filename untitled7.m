a = 7;
b = 12;
c = 21;
function f = @(x) (x*b).(x<5) + (a^2*sqrt(x)).(x==5) + (2*c./x).*(x>5)
x = 1:10;
y = arrayfun(f, x);
plot(x, y, '-o', 'LineWidth', 1.5);
xlabel('x');
ylabel('y = f(x)');
title('Plot of f(x) vs x');
grid on;