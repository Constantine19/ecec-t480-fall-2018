function [location, max] = optim_steepest_ascent(f, gf, init_step_size, max_iter, tolerance)

x_0 = gf(1);
y_0 = gf(2);

%Initiliazation
iter = 0;
while (iter < max_iter && norm([x_0, y_0]) > tolerance) 
    gf = f(x_0, y_0);
    x_new = x_0 - init_step_size * gf; 
    y_new = y_0 - init_step_size * gf; 
    x_0 = x_new; %Update old solution
    y_0 = y_new;
    iter = iter + 1;
end
max = double(gf);
location = [double(x_0), double(y_0)];
end

