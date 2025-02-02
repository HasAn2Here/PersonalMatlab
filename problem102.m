Y0 = 0.15;
t = [0:1:10];  

dYdt = @(t, Y) Y^2;
[t, Y] = ode45(dYdt, t, Y0);
plot(t, Y, 'LineWidth', 2)
