x = -2:0.25:2;
y = x;

[X, Y] = meshgrid(x, y);

F = X .* exp(-X.^2 - Y.^2);

figure;
surf(X, Y, F);

xlabel('X-axis');
ylabel('Y-axis');
zlabel('F(x, y)');


title('3D Surface Plot of F(x, y) = x * exp(-x^2 - y^2)');


colorbar;
shading interp;
grid on;

legend('F(x, y)');