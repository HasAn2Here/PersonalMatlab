% Coefficients vector
k = [0.01, 2000, 50];

% Define integration limits
tinit = 0;  % Initial time
tfin = 50;  % Final time

% Create an anonymous function handle for the deficit function with coefficients
deficit_func = @(time) deficit(time, k);

% Integrate the function over the specified time range
debt = integral(deficit_func, tinit, tfin);

% Display the result
fprintf('The total integrated deficit over 0-50 years is: $%.2f\n', debt);
