function xi = nonlin_fixed_point(func_x, func_y, xi, yi, max_iteration, max_error)
%   Solves a systems of nonlinear equations using the fixed point approach.
%   In- puts are the function (anonymous), initial guess, maximum iterations,
%   and maximum absolute relative error. The outputs should be the root and a table
%   of iteration results.
%
    i = 0;
    error_x = 1;
    error_y = 1;
    output_array = [];
    
    while i < max_iteration && error_y > max_error
        output_array = [output_array; i, xi, yi, error_x, error_y];
        x_old = xi;
        y_old = yi;
        i = i + 1;
        xi = func_x(xi, yi);
        yi = func_y(xi, yi);
        
        error_x = abs((xi - x_old)/xi)*100;
        error_y = abs((yi - y_old)/yi)*100;
    end
    
    output_array = [output_array; i, xi, yi, error_x, error_y];
    fprintf('\n%d %d %d %f %f\n', output_array.')
end

