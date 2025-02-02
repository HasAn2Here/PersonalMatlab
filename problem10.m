mu = 0.1;        
X0 = 0.2;        
t = [0 50]; 
dXdt = @(t, X) mu * X;
[t, X] = ode45(dXdt, t, X0);

plot(t, X,'b-', 'LineWidth', 2)

