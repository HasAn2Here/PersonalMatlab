function Z = calculate_compressibility_awoseyin(P, T, S_g, A)
    % Calculate compressibility factor Z using the Awoseyin method

     % Extract constants
    A1 = A(1); A2 = A(2); A3 = A(3); A4 = A(4); A5 = A(5); A6 = A(6);

    % Calculate terms
    F1 = P .* (0.251 * S_g - 0.15) - 0.202 * S_g + 1.106;
    F2 = 1.4 * exp(-0.0054 * (T - 460));
    F3 = A1 * P.^5 + A2 * P.^4 + A3 * P.^3 + A4 * P.^2 + A5 * P;
    F4 = (0.154 - 0.152 * S_g) .* P.^((3.18 * S_g - 1)) .* exp(-0.5 * P) - 0.02;
    F5 = 0.35 * (0.6 - S_g) .* exp(-1.039 * P .* (P - 1.8).^2);

    % Compressibility factor Z
    Z = F1 .* (1 ./ (1 + ((A6 .* P .* 10.^(1.785 * S_g)) ./ T.^3.825)) + F2 + F3) + F4 + F5;
end
