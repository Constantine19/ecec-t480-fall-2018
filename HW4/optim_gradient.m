function [grad] = optim_gradient(df, x)
n = size(df);
grad = zeros(n(1), 1);

for i = 1:n(1)
    f = df(i);
    grad(i) = f(x(i));
end

end