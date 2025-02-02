% Define the parameter t
t = 0:pi/500:40*pi;

% Define the parametric equations
x = (3 + cos(sqrt(32) * t)) .* cos(t);
y = sin(sqrt(32) * t);
z = (3 + cos(sqrt(32) * t)) .* sin(t);

% Create a 3D plot
figure;
plot3(x, y, z, 'LineWidth', 1.5);

% Add labels and title
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
title('3D Line Plot of Parametric Equations');

% Add grid and legend
grid on;
legend('3D Curve');
