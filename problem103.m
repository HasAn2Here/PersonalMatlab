Y0 = 1.5*10^-14;
t = [0 1];
dYdt=@(t,Y)Y^2+Y*t;
[t,Y]=ode45(dYdt,t,Y0);
plot(t, Y, '-r' ,'LineWidth', 2)