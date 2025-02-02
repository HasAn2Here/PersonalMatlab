% Integrate the 'deficit' function over the range [tinit, tfin] using 'integral'
debt = integral(@deficit, tinit, tfin);

% Display the result
fprintf('The total integrated deficit over 0-50 years is: $%.2f\n', debt);
