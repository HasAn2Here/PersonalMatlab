
t = 0:pi/50:10*pi;

s = sin(t);
c = cos(t);

figure;
plot3(t, s, c, 'LineWidth', 1.5);

xlabel('Time (t)');
ylabel('sin(t)');
zlabel('cos(t)');


title('3D Line Plot of sin(t) and cos(t) vs. Time');
grid on;

legend('3D Curve');