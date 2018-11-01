function [grad] = optim_gradient(dx, dy, x1, y1)
grad = zeros(1, 2);
grad(1, 1) = dx(x1, y1);
grad(1, 2) = dy(x1, y1);
end