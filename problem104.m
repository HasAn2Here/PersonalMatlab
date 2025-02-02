mu = 0.5;        
X0 = 1;        
t = [0 20]; 
dXdt = @(X ,t) mu * X;
[t, X] = ode45(dXdt, t, X0);
plot(t, X,'g-', 'LineWidth', 2)

