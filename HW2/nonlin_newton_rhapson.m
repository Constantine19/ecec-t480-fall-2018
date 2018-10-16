function nonlin_newton_rhapson(func_x, func_y, dmat, xi, yi, max_iteration, max_error)
%   Solves a systems of nonlinear equations using the Newton-Rhapson approach.
%   Inputs are the function (anonymous), matrix of derivatives(anonynous functions),
%   initial guess, maximum iterations, and maximum absolute relative error.
%   The outputs should be the root and a table of iteration results.
%
    iter = 0;
    errx = 1;
    erry = 1;
    output_array = [];
    j_dim = size(dmat); j_row=j_dim(1); j_col=j_dim(2);
    ja = zeros(j_dim); 
    while iter < max_iteration && erry > max_error
        output_array = [output_array; iter, xi, yi, func_x(xi,yi), func_y(xi,yi), errx, erry];
        x_old = xi;
        y_old = yi;
        iter = iter + 1;
        for i=1:j_row
            for j=1:j_col
                f = cell2mat(dmat(i,j));
                ja(i,j) = f(xi,yi);
            end
        end    
        d = det(ja);
        xi = xi - (func_x(xi,yi)*ja(2,2)-func_y(xi,yi)*ja(1,2))/d;
        yi = yi - (func_y(x_old,yi)*ja(1,1)-func_x(x_old,yi)*ja(2,1))/d;
        errx = abs((xi-x_old)/xi)*100;
        erry = abs((yi-y_old)/yi)*100;
    end
    output_array = [output_array; iter, xi, yi, func_x(xi,yi), func_y(xi,yi), errx, erry];
    fprintf('%d %d %d %d %d %f %f\n', output_array.')
end