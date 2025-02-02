
t = 0:pi/500:40*pi;
x = (3 + cos(sqrt(32)t)) . cos(t);
y = sin(sqrt(32)*t);
z = (3 + cos(sqrt(32)t)) . sin(t);
figure;
plot3(x, y, z, 'LineWidth', 1.5);
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
title('3D Line Plot of Parametric Equations');
grid on;
legend('3D Curve');