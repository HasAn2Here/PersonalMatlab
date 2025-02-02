function y = deficit(time, k)
    % Coefficients vector k = [x1, x2, x3]
    x1 = k(1);
    x2 = k(2);
    x3 = k(3);

    % Calculate the population for a given time
    pop = 250 * exp(time / 25);
    % Convert population units
    pop = pop * 1e6;
    % Calculate the deficit per year using the coefficients
    y = x1 * (pop).^2 + x2 * pop + x3;
end
