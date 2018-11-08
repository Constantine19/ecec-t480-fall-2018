function [a0, a1, r2] = cf_nonlinfit(ord, func, Z)
n = size(ord);
n = n(1);
Z0 = zeros(n, 2);
d = zeros(n, 1);
a0 = 30;
a1 = 5;
%initialize to start the while loop
st = 1000;
while st > 1
    % to use the values of the z matrix to get output
    Z0 = zeros(n, 2);
    for i = 1:n
        part_func1 = cell2mat(Z(1));
        part_func2 = cell2mat(Z(2));
        x = ord(i, 1);
        Z0(i, 1) = part_func1(a0, a1, x);
        Z0(i, 2) = part_func2(a0, a1, x);
    end
    lhs = inv(Z0' * Z0);
    d = zeros(n, 1);
    for i = 1:n
        d(i, 1) = ord(i, 2) - func(a0, a1, ord(i, 1));
    end
    ZTD = Z0' * d;
    delta_a = ZTD' * lhs;
    new_a0 = a0 + delta_a(1);
    new_a1 = a1 + delta_a(2);
    a0 = new_a0;
    a1 = new_a1;
    sumY1 = 0;
    for i = 1:n
        y0 = Z0(i, 2);
        sumY1 = sumY1 + y0;
    end
    % to find the r2
    y_bar = sumY1/n;
    st = 0;
    sr = 0;
    for i = 1:n
        x0 = Z0(i, 1);
        y0 = Z0(i, 2);
        st = st + (y0 - y_bar)^2;
        sr = sr + (y0 - a0 - a1*x0)^2;
    end
    r2 = (st - sr) / sr;
end
end