% Define the time vector
t = 0:pi/50:10*pi;

% Define the functions
s = sin(t);
c = cos(t);

% Create a 3D line plot
figure;
plot3(t, s, c, 'LineWidth', 1.5);

% Label the axes
xlabel('Time (t)');
ylabel('sin(t)');
zlabel('cos(t)');

% Add a title and grid
title('3D Line Plot of sin(t) and cos(t) vs. Time');
grid on;

% Add a legend
legend('3D Curve');