% Define the time vector
t = 0:pi/500:40*pi;

% Define the functions
x = (3 + cos(sqrt(32)t)) . cos(t);
y = sin(sqrt(32)*t);
z = (3 + cos(sqrt(32)t)) . sin(t);

% Create a 3D line plot
figure;
plot3(x, y, z, 'LineWidth', 1.5);

% Label the axes
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');

% Add a title and grid
title('3D Line Plot of Parametric Equations');
grid on;

% Add a legend
legend('3D Curve');